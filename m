Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5E2C54E5D
	for <igt-dev@archiver.kernel.org>; Mon, 18 Mar 2024 23:38:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3917A10E2CE;
	Mon, 18 Mar 2024 23:38:00 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 795B210E2CE;
 Mon, 18 Mar 2024 23:37:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_tests/kms=5Fvrr=3A_Add_?=
 =?utf-8?q?a_subtest_for_seamless_modeset_to_a_virtual_LRR_mode?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Manasi Navare" <navaremanasi@chromium.org>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 18 Mar 2024 23:37:58 -0000
Message-ID: <171080507849.900325.9484502906684254214@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240318230241.3758794-1-navaremanasi@chromium.org>
In-Reply-To: <20240318230241.3758794-1-navaremanasi@chromium.org>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
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

== Series Details ==

Series: tests/kms_vrr: Add a subtest for seamless modeset to a virtual LRR mode
URL   : https://patchwork.freedesktop.org/series/131295/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1131039 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/56455809):
      ~~~~~~~~~~^~~~~~~~
  ../tests/kms_vrr.c:88:26: warning: overflow in conversion from ‘long long unsigned int’ to ‘int’ changes value from ‘5000000000’ to ‘705032704’ [-Woverflow]
   #define TEST_DURATION_NS (5000000000ull)
                            ^~~~~~~~~~~~~~~
  ../tests/kms_vrr.c:699:55: note: in expansion of macro ‘TEST_DURATION_NS’
     result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
                                                         ^~~~~~~~~~~~~~~~
  ../tests/kms_vrr.c:699:12: error: too few arguments to function ‘flip_and_measure’
     result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
              ^~~~~~~~~~~~~~~~
  ../tests/kms_vrr.c:411:1: note: declared here
   flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
   ^~~~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1710804753:step_script
  section_start:1710804753:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710804754:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/56455812):
      ~~~~~~~~~~^~~~~~~~
  ../tests/kms_vrr.c:88:26: warning: overflow in conversion from ‘long long unsigned int’ to ‘int’ changes value from ‘5000000000’ to ‘705032704’ [-Woverflow]
   #define TEST_DURATION_NS (5000000000ull)
                            ^~~~~~~~~~~~~~~
  ../tests/kms_vrr.c:699:55: note: in expansion of macro ‘TEST_DURATION_NS’
     result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
                                                         ^~~~~~~~~~~~~~~~
  ../tests/kms_vrr.c:699:12: error: too few arguments to function ‘flip_and_measure’
     result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
              ^~~~~~~~~~~~~~~~
  ../tests/kms_vrr.c:411:1: note: declared here
   flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
   ^~~~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1710804782:step_script
  section_start:1710804782:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710804782:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/56455811):
      ~~~~~~~~~~^~~~~~~~
  ../tests/kms_vrr.c:88:26: warning: overflow in conversion from ‘long long unsigned int’ to ‘int’ changes value from ‘5000000000’ to ‘705032704’ [-Woverflow]
   #define TEST_DURATION_NS (5000000000ull)
                            ^~~~~~~~~~~~~~~
  ../tests/kms_vrr.c:699:55: note: in expansion of macro ‘TEST_DURATION_NS’
     result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
                                                         ^~~~~~~~~~~~~~~~
  ../tests/kms_vrr.c:699:12: error: too few arguments to function ‘flip_and_measure’
     result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
              ^~~~~~~~~~~~~~~~
  ../tests/kms_vrr.c:411:1: note: declared here
   flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
   ^~~~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1710804779:step_script
  section_start:1710804779:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710804781:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/56455813):
      ~~~~~~~~~~^~~~~~~~
  ../tests/kms_vrr.c:88:26: warning: overflow in conversion from ‘long long unsigned int’ to ‘int’ changes value from ‘5000000000’ to ‘705032704’ [-Woverflow]
   #define TEST_DURATION_NS (5000000000ull)
                            ^~~~~~~~~~~~~~~
  ../tests/kms_vrr.c:699:55: note: in expansion of macro ‘TEST_DURATION_NS’
     result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
                                                         ^~~~~~~~~~~~~~~~
  ../tests/kms_vrr.c:699:12: error: too few arguments to function ‘flip_and_measure’
     result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
              ^~~~~~~~~~~~~~~~
  ../tests/kms_vrr.c:411:1: note: declared here
   flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
   ^~~~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1710804789:step_script
  section_start:1710804789:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710804790:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/56455810):
  ninja: Entering directory `build'
  [1/105] Generating version.h with a custom command.
  [2/9] Linking target lib/libi915_perf.so.1.5.
  [3/9] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.so.1.5.symbols'.
  [4/9] Linking target tools/intel_gpu_top.
  [5/9] Linking target tools/i915-perf/i915-perf-configs.
  [6/9] Linking target tools/i915-perf/i915-perf-recorder.
  [7/9] Linking target tools/i915-perf/i915-perf-reader.
  [8/9] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst
  /builds/gfx-ci/igt-ci-tags/tests/intel/../kms_vrr.c:75: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json?
  	==> without a full modeset.
  ninja: build stopped: subcommand failed.
  section_end:1710804739:step_script
  section_start:1710804739:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710804740:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/56455804):
        |    ~~~~~~~~~~^~~~~~~~
  ../tests/kms_vrr.c:88:26: warning: overflow in conversion from ‘long long unsigned int’ to ‘int’ changes value from ‘5000000000’ to ‘705032704’ [-Woverflow]
     88 | #define TEST_DURATION_NS (5000000000ull)
        |                          ^~~~~~~~~~~~~~~
  ../tests/kms_vrr.c:699:55: note: in expansion of macro ‘TEST_DURATION_NS’
    699 |   result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
        |                                                       ^~~~~~~~~~~~~~~~
  ../tests/kms_vrr.c:699:12: error: too few arguments to function ‘flip_and_measure’
    699 |   result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
        |            ^~~~~~~~~~~~~~~~
  ../tests/kms_vrr.c:411:1: note: declared here
    411 | flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
        | ^~~~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1710804802:step_script
  section_start:1710804802:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710804803:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/56455808):
  ../tests/kms_vrr.c:684:70: error: too few arguments to function call, expected 6, have 5
          result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
                   ~~~~~~~~~~~~~~~~                                           ^
  ../tests/kms_vrr.c:410:1: note: 'flip_and_measure' declared here
  static uint32_t
  ^
  ../tests/kms_vrr.c:699:71: error: too few arguments to function call, expected 6, have 5
                  result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
                           ~~~~~~~~~~~~~~~~                                           ^
  ../tests/kms_vrr.c:410:1: note: 'flip_and_measure' declared here
  static uint32_t
  ^
  2 warnings and 2 errors generated.
  ninja: build stopped: subcommand failed.
  section_end:1710804778:step_script
  section_start:1710804778:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710804778:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/56455807):
        |    ~~~~~~~~~~^~~~~~~~
  ../tests/kms_vrr.c:88:26: warning: overflow in conversion from ‘long long unsigned int’ to ‘int’ changes value from ‘5000000000’ to ‘705032704’ [-Woverflow]
     88 | #define TEST_DURATION_NS (5000000000ull)
        |                          ^~~~~~~~~~~~~~~
  ../tests/kms_vrr.c:699:55: note: in expansion of macro ‘TEST_DURATION_NS’
    699 |   result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
        |                                                       ^~~~~~~~~~~~~~~~
  ../tests/kms_vrr.c:699:12: error: too few arguments to function ‘flip_and_measure’
    699 |   result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
        |            ^~~~~~~~~~~~~~~~
  ../tests/kms_vrr.c:411:1: note: declared here
    411 | flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
        | ^~~~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1710804754:step_script
  section_start:1710804754:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710804755:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/56455805):
        |    ~~~~~~~~~~^~~~~~~~
  ../tests/kms_vrr.c:88:26: warning: overflow in conversion from ‘long long unsigned int’ to ‘int’ changes value from ‘5000000000’ to ‘705032704’ [-Woverflow]
     88 | #define TEST_DURATION_NS (5000000000ull)
        |                          ^~~~~~~~~~~~~~~
  ../tests/kms_vrr.c:699:55: note: in expansion of macro ‘TEST_DURATION_NS’
    699 |   result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
        |                                                       ^~~~~~~~~~~~~~~~
  ../tests/kms_vrr.c:699:12: error: too few arguments to function ‘flip_and_measure’
    699 |   result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
        |            ^~~~~~~~~~~~~~~~
  ../tests/kms_vrr.c:411:1: note: declared here
    411 | flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
        | ^~~~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1710804760:step_script
  section_start:1710804760:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710804761:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/56455806):
        |    ~~~~~~~~~~^~~~~~~~
  ../tests/kms_vrr.c:88:26: warning: overflow in conversion from ‘long long unsigned int’ to ‘int’ changes value from ‘5000000000’ to ‘705032704’ [-Woverflow]
     88 | #define TEST_DURATION_NS (5000000000ull)
        |                          ^~~~~~~~~~~~~~~
  ../tests/kms_vrr.c:699:55: note: in expansion of macro ‘TEST_DURATION_NS’
    699 |   result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
        |                                                       ^~~~~~~~~~~~~~~~
  ../tests/kms_vrr.c:699:12: error: too few arguments to function ‘flip_and_measure’
    699 |   result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
        |            ^~~~~~~~~~~~~~~~
  ../tests/kms_vrr.c:411:1: note: declared here
    411 | flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
        | ^~~~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1710804759:step_script
  section_start:1710804759:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710804760:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1131039
