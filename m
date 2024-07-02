Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CC8C30658
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 11:51:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B0110E0CB;
	Tue,  2 Jul 2024 11:51:22 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC4610E034;
 Tue,  2 Jul 2024 11:51:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_series_starting_with_?=
 =?utf-8?q?=5Bi-g-t=2C1/2=5D_tests/intel/xe=5Fpm=3A_Install_fw_close_exit_ha?=
 =?utf-8?q?ndler_before_rpm_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 02 Jul 2024 11:51:22 -0000
Message-ID: <171992108203.21227.7168407991418417752@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240701145439.91038-1-badal.nilawar@intel.com>
In-Reply-To: <20240701145439.91038-1-badal.nilawar@intel.com>
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

Series: series starting with [i-g-t,1/2] tests/intel/xe_pm: Install fw close exit handler before rpm tests
URL   : https://patchwork.freedesktop.org/series/135601/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1215289 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60595848):
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --intelci-testlist docs/testplan/intel-ci-tests
  Traceback (most recent call last):
    File "/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py", line 386, in <module>
      main()
    File "/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py", line 380, in main
      (testlist, gpu_set) = tests.gen_intelci_testlist()
    File "/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py", line 91, in gen_intelci_testlist
      subtest_dict = self.expand_dictionary(True)
    File "/builds/gfx-ci/igt-ci-tags/scripts/test_list.py", line 749, in expand_dictionary
      subtest_array = self.expand_subtest(fname, name, test, subtest_only)
    File "/builds/gfx-ci/igt-ci-tags/scripts/test_list.py", line 655, in expand_subtest
      if arg_array[j] is None:
  KeyError: 0
  ninja: build stopped: subcommand failed.
  section_end:1719920852:step_script
  section_start:1719920852:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719920853:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60595851):
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst
  Traceback (most recent call last):
    File "/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py", line 386, in <module>
      main()
    File "/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py", line 370, in main
      tests.print_nested_rest(parse_args.rest)
    File "/builds/gfx-ci/igt-ci-tags/scripts/test_list.py", line 933, in print_nested_rest
      subtest_dict = self.expand_dictionary(True)
    File "/builds/gfx-ci/igt-ci-tags/scripts/test_list.py", line 749, in expand_dictionary
      subtest_array = self.expand_subtest(fname, name, test, subtest_only)
    File "/builds/gfx-ci/igt-ci-tags/scripts/test_list.py", line 655, in expand_subtest
      if arg_array[j] is None:
  KeyError: 0
  ninja: build stopped: subcommand failed.
  section_end:1719920852:step_script
  section_start:1719920852:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719920853:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60595850):
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst
  Traceback (most recent call last):
    File "/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py", line 386, in <module>
      main()
    File "/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py", line 370, in main
      tests.print_nested_rest(parse_args.rest)
    File "/builds/gfx-ci/igt-ci-tags/scripts/test_list.py", line 933, in print_nested_rest
      subtest_dict = self.expand_dictionary(True)
    File "/builds/gfx-ci/igt-ci-tags/scripts/test_list.py", line 749, in expand_dictionary
      subtest_array = self.expand_subtest(fname, name, test, subtest_only)
    File "/builds/gfx-ci/igt-ci-tags/scripts/test_list.py", line 655, in expand_subtest
      if arg_array[j] is None:
  KeyError: 0
  ninja: build stopped: subcommand failed.
  section_end:1719920819:step_script
  section_start:1719920819:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719920820:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60595852):
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst
  Traceback (most recent call last):
    File "/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py", line 386, in <module>
      main()
    File "/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py", line 370, in main
      tests.print_nested_rest(parse_args.rest)
    File "/builds/gfx-ci/igt-ci-tags/scripts/test_list.py", line 933, in print_nested_rest
      subtest_dict = self.expand_dictionary(True)
    File "/builds/gfx-ci/igt-ci-tags/scripts/test_list.py", line 749, in expand_dictionary
      subtest_array = self.expand_subtest(fname, name, test, subtest_only)
    File "/builds/gfx-ci/igt-ci-tags/scripts/test_list.py", line 655, in expand_subtest
      if arg_array[j] is None:
  KeyError: 0
  ninja: build stopped: subcommand failed.
  section_end:1719920830:step_script
  section_start:1719920830:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719920831:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60595849):
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst
  Traceback (most recent call last):
    File "/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py", line 386, in <module>
      main()
    File "/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py", line 370, in main
      tests.print_nested_rest(parse_args.rest)
    File "/builds/gfx-ci/igt-ci-tags/scripts/test_list.py", line 933, in print_nested_rest
      subtest_dict = self.expand_dictionary(True)
    File "/builds/gfx-ci/igt-ci-tags/scripts/test_list.py", line 749, in expand_dictionary
      subtest_array = self.expand_subtest(fname, name, test, subtest_only)
    File "/builds/gfx-ci/igt-ci-tags/scripts/test_list.py", line 655, in expand_subtest
      if arg_array[j] is None:
  KeyError: 0
  ninja: build stopped: subcommand failed.
  section_end:1719920766:step_script
  section_start:1719920766:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719920766:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60595843):
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --intelci-testlist docs/testplan/intel-ci-tests
  Traceback (most recent call last):
    File "/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py", line 386, in <module>
      main()
    File "/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py", line 380, in main
      (testlist, gpu_set) = tests.gen_intelci_testlist()
    File "/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py", line 91, in gen_intelci_testlist
      subtest_dict = self.expand_dictionary(True)
    File "/builds/gfx-ci/igt-ci-tags/scripts/test_list.py", line 749, in expand_dictionary
      subtest_array = self.expand_subtest(fname, name, test, subtest_only)
    File "/builds/gfx-ci/igt-ci-tags/scripts/test_list.py", line 655, in expand_subtest
      if arg_array[j] is None:
  KeyError: 0
  ninja: build stopped: subcommand failed.
  section_end:1719920842:step_script
  section_start:1719920842:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719920843:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60595847):
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --intelci-testlist docs/testplan/intel-ci-tests
  Traceback (most recent call last):
    File "/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py", line 386, in <module>
      main()
    File "/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py", line 380, in main
      (testlist, gpu_set) = tests.gen_intelci_testlist()
    File "/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py", line 91, in gen_intelci_testlist
      subtest_dict = self.expand_dictionary(True)
    File "/builds/gfx-ci/igt-ci-tags/scripts/test_list.py", line 749, in expand_dictionary
      subtest_array = self.expand_subtest(fname, name, test, subtest_only)
    File "/builds/gfx-ci/igt-ci-tags/scripts/test_list.py", line 655, in expand_subtest
      if arg_array[j] is None:
  KeyError: 0
  ninja: build stopped: subcommand failed.
  section_end:1719920877:step_script
  section_start:1719920877:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719920877:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60595846):
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --intelci-testlist docs/testplan/intel-ci-tests
  Traceback (most recent call last):
    File "/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py", line 386, in <module>
      main()
    File "/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py", line 380, in main
      (testlist, gpu_set) = tests.gen_intelci_testlist()
    File "/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py", line 91, in gen_intelci_testlist
      subtest_dict = self.expand_dictionary(True)
    File "/builds/gfx-ci/igt-ci-tags/scripts/test_list.py", line 749, in expand_dictionary
      subtest_array = self.expand_subtest(fname, name, test, subtest_only)
    File "/builds/gfx-ci/igt-ci-tags/scripts/test_list.py", line 655, in expand_subtest
      if arg_array[j] is None:
  KeyError: 0
  ninja: build stopped: subcommand failed.
  section_end:1719920844:step_script
  section_start:1719920844:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719920845:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60595844):
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --intelci-testlist docs/testplan/intel-ci-tests
  Traceback (most recent call last):
    File "/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py", line 386, in <module>
      main()
    File "/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py", line 380, in main
      (testlist, gpu_set) = tests.gen_intelci_testlist()
    File "/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py", line 91, in gen_intelci_testlist
      subtest_dict = self.expand_dictionary(True)
    File "/builds/gfx-ci/igt-ci-tags/scripts/test_list.py", line 749, in expand_dictionary
      subtest_array = self.expand_subtest(fname, name, test, subtest_only)
    File "/builds/gfx-ci/igt-ci-tags/scripts/test_list.py", line 655, in expand_subtest
      if arg_array[j] is None:
  KeyError: 0
  ninja: build stopped: subcommand failed.
  section_end:1719920841:step_script
  section_start:1719920841:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719920842:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60595845):
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --intelci-testlist docs/testplan/intel-ci-tests
  Traceback (most recent call last):
    File "/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py", line 386, in <module>
      main()
    File "/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py", line 380, in main
      (testlist, gpu_set) = tests.gen_intelci_testlist()
    File "/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py", line 91, in gen_intelci_testlist
      subtest_dict = self.expand_dictionary(True)
    File "/builds/gfx-ci/igt-ci-tags/scripts/test_list.py", line 749, in expand_dictionary
      subtest_array = self.expand_subtest(fname, name, test, subtest_only)
    File "/builds/gfx-ci/igt-ci-tags/scripts/test_list.py", line 655, in expand_subtest
      if arg_array[j] is None:
  KeyError: 0
  ninja: build stopped: subcommand failed.
  section_end:1719920851:step_script
  section_start:1719920851:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719920852:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1215289
