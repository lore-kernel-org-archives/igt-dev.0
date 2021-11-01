Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 01 Nov 2021 17:03:07 -0000
Message-ID: <163578618775.18413.14049598564617016799@emeril.freedesktop.org>
References: <20211101163730.2769897-1-markyacoub@chromium.org>
In-Reply-To: <20211101163730.2769897-1-markyacoub@chromium.org>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/kms=5Fcursor=5Flegacy=3A_igt=5Frequire=5Fpipe=5Fcrc_for_fl?=
 =?utf-8?q?ip=5Fvs=5Fcursor=5Fcrc?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mark Yacoub <markyacoub@chromium.org>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_cursor_legacy: igt_require_pipe_crc for flip_vs_cursor_crc
URL   : https://patchwork.freedesktop.org/series/96463/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/437069 for the overview.

test:ninja-test-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/15325474):
  hint: 	git branch -m <name>
  Initialized empty Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Created fresh repository.
  error: RPC failed; curl 92 HTTP/2 stream 5 was not closed cleanly before end of the underlying stream
  error: 1127 bytes of body are still expected
  fetch-pack: unexpected disconnect while reading sideband packet
  fatal: early EOF
  fatal: index-pack failed
  section_end:1635785839:get_sources
  section_start:1635785839:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  WARNING: build: no matching files                  
  ERROR: No files to upload                          
  section_end:1635785840:upload_artifacts_on_failure
  section_start:1635785840:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1635785840:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/437069
