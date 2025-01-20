Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8CDC02181
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jan 2025 11:47:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E9510E15A;
	Mon, 20 Jan 2025 11:47:54 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B76F10E15A;
 Mon, 20 Jan 2025 11:47:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_tests/intel/xe=5Ffault?=
 =?utf-8?q?=5Finjection=3A_Inject_errors_during_xe=5Fguc=5Fct=5Fsend=5Frecv_?=
 =?utf-8?q?=26_xe=5Fguc=5Fmmio=5Fsend=5Frecv_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 20 Jan 2025 11:47:53 -0000
Message-ID: <173737367304.2106959.1785210466355863492@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250120083410.26904-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250120083410.26904-1-satyanarayana.k.v.p@intel.com>
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

Series: tests/intel/xe_fault_injection: Inject errors during xe_guc_ct_send_recv & xe_guc_mmio_send_recv (rev2)
URL   : https://patchwork.freedesktop.org/series/142999/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1348708 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/69618899):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/857] Generating version.h with a custom command.
  [2/8] Linking target runner/runner_test.
  [3/8] Linking target assembler/intel-gen4asm.
  [4/8] Generating i915_tests.html with a custom command.
  [5/8] Generating kms_tests.html with a custom command.
  [6/8] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  ERROR: Missing documentation for igt@xe_fault_injection@enable-vfs-fail-xe_guc_ct_send_recv
  ERROR: Unneeded documentation for igt@xe_fault_injection@guc-fail-xe_guc_ct_send_recv
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1737373453:step_script
  section_start:1737373453:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1737373454:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/69618894):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/859] Generating version.h with a custom command.
  [2/7] Linking target runner/runner_test.
  [3/7] Generating intel-ci-tests with a custom command.
  [4/7] Generating i915_tests.html with a custom command.
  [5/7] Generating kms_tests.html with a custom command.
  [6/7] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  ERROR: Missing documentation for igt@xe_fault_injection@enable-vfs-fail-xe_guc_ct_send_recv
  ERROR: Unneeded documentation for igt@xe_fault_injection@guc-fail-xe_guc_ct_send_recv
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1737373454:step_script
  section_start:1737373454:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1737373454:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/69618898):
  [1933/1936] Generating intel-ci-tests with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/859] Generating version.h with a custom command.
  [2/6] Generating kms_tests.html with a custom command.
  [3/6] Generating intel-ci-tests with a custom command.
  [4/6] Generating i915_tests.html with a custom command.
  [5/6] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  ERROR: Missing documentation for igt@xe_fault_injection@enable-vfs-fail-xe_guc_ct_send_recv
  ERROR: Unneeded documentation for igt@xe_fault_injection@guc-fail-xe_guc_ct_send_recv
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1737373481:step_script
  section_start:1737373481:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1737373482:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/69618897):
  [1760/1764] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/807] Generating version.h with a custom command.
  [2/7] Linking target runner/runner_test.
  [3/7] Generating i915_tests.html with a custom command.
  [4/7] Generating kms_tests.html with a custom command.
  [5/7] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  ERROR: Missing documentation for igt@xe_fault_injection@enable-vfs-fail-xe_guc_ct_send_recv
  ERROR: Unneeded documentation for igt@xe_fault_injection@guc-fail-xe_guc_ct_send_recv
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1737373424:step_script
  section_start:1737373424:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1737373426:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/69618895):
  [1932/1936] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/859] Generating version.h with a custom command.
  [2/7] Linking target runner/runner_test.
  [3/7] Generating i915_tests.html with a custom command.
  [4/7] Generating intel-ci-tests with a custom command.
  [5/7] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  ERROR: Missing documentation for igt@xe_fault_injection@enable-vfs-fail-xe_guc_ct_send_recv
  ERROR: Unneeded documentation for igt@xe_fault_injection@guc-fail-xe_guc_ct_send_recv
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1737373423:step_script
  section_start:1737373423:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1737373424:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/69618896):
  [1933/1936] Generating intel-ci-tests with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/859] Generating version.h with a custom command.
  [2/6] Generating intel-ci-tests with a custom command.
  [3/6] Generating i915_tests.html with a custom command.
  [4/6] Generating kms_tests.html with a custom command.
  [5/6] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  ERROR: Missing documentation for igt@xe_fault_injection@enable-vfs-fail-xe_guc_ct_send_recv
  ERROR: Unneeded documentation for igt@xe_fault_injection@guc-fail-xe_guc_ct_send_recv
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1737373427:step_script
  section_start:1737373427:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1737373428:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1348708
