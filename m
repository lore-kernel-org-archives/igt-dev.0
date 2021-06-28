Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 28 Jun 2021 09:06:36 -0000
Message-ID: <162487119643.2573.16922005381840691139@emeril.freedesktop.org>
References: <20210623101635.379278-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20210623101635.379278-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ools/i915-perf-recorder=3A_add_ability_to_select_device?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tools/i915-perf-recorder: add ability to select device
URL   : https://patchwork.freedesktop.org/series/91808/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/348961 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/11330790):
   #5 [__assert_fail+0x46]
   #6 [internal_assert+0xe0]
   #7 [igt_fail+0xde]
   #8 [__igt_fail_assert+0x114]
   #9 [invalid_top_level_assert+0x40]
   #10 [main+0x97]
   #11 [__libc_start_main+0xf3]
   #12 [_start+0x2e]
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1624871119:step_script
  section_start:1624871119:cleanup_file_variables
  Cleaning up file based variables
  section_end:1624871121:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/11330791):
   #3 [__assert_fail_base.cold+0xf]
   #4 [__assert_fail+0x46]
   #5 [internal_assert+0xdb]
   #6 [igt_skip+0xfe]
   #7 [invalid_top_level_skip+0x2e]
   #8 [main+0x38]
   #9 [__libc_start_main+0xf3]
   #10 [_start+0x2e]
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1624871119:step_script
  section_start:1624871119:cleanup_file_variables
  Cleaning up file based variables
  section_end:1624871121:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/348961
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
