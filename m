Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Date: Thu, 19 May 2022 11:44:47 -0000
Message-ID: <165296068777.515.306712448954039439@emeril.freedesktop.org>
References: <20220519112449.25819-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20220519112449.25819-1-kamil.konieczny@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/i915/gem=5Fclose=5Frace=3A_Adopt_to_use_softpin_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_close_race: Adopt to use softpin (rev2)
URL   : https://patchwork.freedesktop.org/series/104147/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/590616 for the overview.

test:ninja-test-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/22898720):
  Ok:                   22
  Expected Fail:         3
  Fail:                289
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1652960605:step_script
  section_start:1652960605:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1728 matching files and directories   
  Uploading artifacts as "archive" to coordinator... 201 Created  id=22898720 responseStatus=201 Created token=yit6yyLm
  section_end:1652960614:upload_artifacts_on_failure
  section_start:1652960614:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1652960615:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/590616
