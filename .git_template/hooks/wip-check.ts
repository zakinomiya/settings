#!/usr/bin/env deno run

import { exec, OutputMode } from "https://deno.land/x/exec/mod.ts";
import { readLines } from "https://deno.land/std@0.120.0/io/mod.ts";
import * as path from "https://deno.land/std@0.120.0/path/mod.ts";

import outdent from "http://deno.land/x/outdent/mod.ts";

const WIP_MARK = "@@@WIP";

const isWip = (str: string) => str.includes(WIP_MARK);
const pad = (len: number, str: string) => str + " ".repeat(len - str.length);

const wipCheck = async (files: string[]) => {
  const wipFiles = [];
  for (let i = 0; i < files.length; i++) {
    if (files[i] === "") {
      continue
    }
    const filename = files[i];
    const filepath = path.join(Deno.cwd(), filename);
    const reader = await Deno.open(filepath, { read: true });
    let line = 0;

    for await (const l of readLines(reader)) {
      line++;
      if (isWip(l)) {
        wipFiles.push({ filename, line });
      }
    }
  }

  return wipFiles;
};

const targetFiles = await exec(
  "git diff --staged --name-only --diff-filter=d",
  { output: OutputMode.Capture },
).then((o) => o.output.split("\n"));

await wipCheck(targetFiles).then((res) => {
  if (res.length == 0) {
    console.debug("all clear. you are ready.");
    Deno.exit(0);
  }

  const padLen = res.reduce((a, b) => a.filename.length < b.filename.length ? b : a).filename.length;
  // deno-fmt-ignore
  console.log(outdent`
              ======================================================
                You have WIP files. Please resolve them before commit.
                  - File Info
              ${res.map(r => `      filename: ${pad(padLen, r.filename)} line: ${r.line}\n`).toString().replaceAll(",", "")}
              ======================================================`)
  Deno.exit(1);
});
