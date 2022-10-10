Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ananya Sharma" <ananya.sharma@intel.com>
Date: Mon, 10 Oct 2022 08:06:21 -0000
Message-ID: <166538918123.29673.16540489008287372418@emeril.freedesktop.org>
References: <20221010074747.259273-1-ananya.sharma@intel.com>
In-Reply-To: <20221010074747.259273-1-ananya.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBNUE8g?=
 =?utf-8?q?+_pipe_color_test_=28rev2=29?=
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

Series: MPO + pipe color test (rev2)
URL   : https://patchwork.freedesktop.org/series/108655/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
41bf1f94200fef79486d2a7d24c31de1042094e3 tests/i915/kms_psr2_su: Convert tests to dynamic

  270 |        igt_success())
      |        ^~~~~~~~~~~
../../../usr/src/igt-gpu-tools/tests/chamelium/kms_color_chamelium.c:838:2: note: in expansion of macro ‘igt_subtest_with_dynamic’
  838 |  igt_subtest_with_dynamic("ctm-limited-range") {
      |  ^~~~~~~~~~~~~~~~~~~~~~~~
../../../usr/src/igt-gpu-tools/lib/igt_core.h:217:28: error: declaration for parameter ‘__igt_unique____real_main847’ but no such parameter
  217 |  igt_tokencat(igt_tokencat(__igt_unique__, prefix), __LINE__)
      |                            ^~~~~~~~~~~~~~
../../../usr/src/igt-gpu-tools/lib/igt_core.h:197:31: note: in definition of macro ‘__igt_tokencat2’
  197 | #define __igt_tokencat2(x, y) x ## y
      |                               ^
../../../usr/src/igt-gpu-tools/lib/igt_core.h:217:2: note: in expansion of macro ‘igt_tokencat’
  217 |  igt_tokencat(igt_tokencat(__igt_unique__, prefix), __LINE__)
      |  ^~~~~~~~~~~~
../../../usr/src/igt-gpu-tools/lib/igt_core.h:207:28: note: in expansion of macro ‘__igt_tokencat2’
  207 | #define igt_tokencat(x, y) __igt_tokencat2(x, y)
      |                            ^~~~~~~~~~~~~~~
../../../usr/src/igt-gpu-tools/lib/igt_core.h:217:15: note: in expansion of macro ‘igt_tokencat’
  217 |  igt_tokencat(igt_tokencat(__igt_unique__, prefix), __LINE__)
      |               ^~~~~~~~~~~~
../../../usr/src/igt-gpu-tools/lib/igt_core.h:420:14: note: in expansion of macro ‘igt_unique’
  420 |  static void igt_unique(__real_main)(void); \
      |              ^~~~~~~~~~
../../../usr/src/igt-gpu-tools/lib/igt_core.h:437:18: note: in expansion of macro ‘igt_main_args’
  437 | #define igt_main igt_main_args(NULL, NULL, NULL, NULL, NULL)
      |                  ^~~~~~~~~~~~~
../../../usr/src/igt-gpu-tools/tests/chamelium/kms_color_chamelium.c:847:1: note: in expansion of macro ‘igt_main’
  847 | igt_main
      | ^~~~~~~~
../../../usr/src/igt-gpu-tools/tests/chamelium/kms_color_chamelium.c:880: error: expected ‘{’ at end of input
  880 | }
      | 
At top level:
../../../usr/src/igt-gpu-tools/tests/chamelium/kms_color_chamelium.c:695:1: warning: ‘run_tests_for_pipe’ defined but not used [-Wunused-function]
  695 | run_tests_for_pipe(data_t *data)
      | ^~~~~~~~~~~~~~~~~~
../../../usr/src/igt-gpu-tools/tests/chamelium/kms_color_chamelium.c:678:1: warning: ‘run_limited_range_ctm_test_for_pipe’ defined but not used [-Wunused-function]
  678 | run_limited_range_ctm_test_for_pipe(data_t *data, enum pipe p,
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../../../usr/src/igt-gpu-tools/tests/chamelium/kms_color_chamelium.c:594:1: warning: ‘run_ctm_tests_for_pipe’ defined but not used [-Wunused-function]
  594 | run_ctm_tests_for_pipe(data_t *data, enum pipe p, bool multiplane,
      | ^~~~~~~~~~~~~~~~~~~~~~
../../../usr/src/igt-gpu-tools/tests/chamelium/kms_color_chamelium.c:558:1: warning: ‘run_gamma_degamma_tests_for_pipe’ defined but not used [-Wunused-function]
  558 | run_gamma_degamma_tests_for_pipe(data_t *data, enum pipe p, bool multiplane,
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../../../usr/src/igt-gpu-tools/tests/chamelium/kms_color_chamelium.c:410:13: warning: ‘test_pipe_limited_range_ctm’ defined but not used [-Wunused-function]
  410 | static bool test_pipe_limited_range_ctm(data_t *data,
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
ninja: build stopped: subcommand failed.

