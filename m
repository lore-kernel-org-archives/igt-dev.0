Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBFBC54E60
	for <igt-dev@archiver.kernel.org>; Sat, 16 Mar 2024 06:03:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8758112F0B;
	Sat, 16 Mar 2024 06:03:53 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A87112F0B;
 Sat, 16 Mar 2024 06:03:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_tests/intel/xe=5Fexec?=
 =?utf-8?q?=5Fcompute=5Fmode=3A_Add_userptr_free_/_munmap_sections?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 16 Mar 2024 06:03:52 -0000
Message-ID: <171056903201.812644.10220220678198519554@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240316054512.1281393-1-matthew.brost@intel.com>
In-Reply-To: <20240316054512.1281393-1-matthew.brost@intel.com>
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

Series: tests/intel/xe_exec_compute_mode: Add userptr free / munmap sections
URL   : https://patchwork.freedesktop.org/series/131211/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1129314 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/56378285):
  [1/821] Generating version.h with a custom command.
  [2/8] Linking target runner/runner_test.
  [3/8] Linking target assembler/intel-gen4asm.
  [4/8] Generating kms_tests.html with a custom command.
  [5/8] Generating i915_tests.html with a custom command.
  [6/8] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: igt@sriov_basic@bind-unbind-vf Functionality documentation is missing
  Warning: igt@sriov_basic@enable-vfs-autoprobe-off Functionality documentation is missing
  Warning: igt@sriov_basic@enable-vfs-autoprobe-on Functionality documentation is missing
  Warning: igt@sriov_basic@enable-vfs-bind-unbind-each Functionality documentation is missing
  Warning: Documented igt@xe_exec_compute_mode@many-execqueues-malloc-ufence doesn't exist on source files
  ninja: build stopped: subcommand failed.
  section_end:1710568787:step_script
  section_start:1710568787:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710568788:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/56378280):
  [1/823] Generating version.h with a custom command.
  [2/7] Linking target runner/runner_test.
  [3/7] Generating kms_tests.html with a custom command.
  [4/7] Generating i915_tests.html with a custom command.
  [5/7] Generating intel-ci-tests with a custom command.
  [6/7] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: igt@sriov_basic@bind-unbind-vf Functionality documentation is missing
  Warning: igt@sriov_basic@enable-vfs-autoprobe-off Functionality documentation is missing
  Warning: igt@sriov_basic@enable-vfs-autoprobe-on Functionality documentation is missing
  Warning: igt@sriov_basic@enable-vfs-bind-unbind-each Functionality documentation is missing
  Warning: Documented igt@xe_exec_compute_mode@many-execqueues-malloc-ufence doesn't exist on source files
  ninja: build stopped: subcommand failed.
  section_end:1710568790:step_script
  section_start:1710568790:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710568791:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/56378284):
  ninja: Entering directory `build'
  [1/823] Generating version.h with a custom command.
  [2/6] Generating intel-ci-tests with a custom command.
  [3/6] Generating i915_tests.html with a custom command.
  [4/6] Generating kms_tests.html with a custom command.
  [5/6] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: igt@sriov_basic@bind-unbind-vf Functionality documentation is missing
  Warning: igt@sriov_basic@enable-vfs-autoprobe-off Functionality documentation is missing
  Warning: igt@sriov_basic@enable-vfs-autoprobe-on Functionality documentation is missing
  Warning: igt@sriov_basic@enable-vfs-bind-unbind-each Functionality documentation is missing
  Warning: Documented igt@xe_exec_compute_mode@many-execqueues-malloc-ufence doesn't exist on source files
  ninja: build stopped: subcommand failed.
  section_end:1710568813:step_script
  section_start:1710568813:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710568814:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/56378283):
  [1/773] Generating version.h with a custom command.
  [2/7] Linking target runner/runner_test.
  [3/7] Generating kms_tests.html with a custom command.
  [4/7] Generating i915_tests.html with a custom command.
  [5/7] Generating intel-ci-tests with a custom command.
  [6/7] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: igt@sriov_basic@bind-unbind-vf Functionality documentation is missing
  Warning: igt@sriov_basic@enable-vfs-autoprobe-off Functionality documentation is missing
  Warning: igt@sriov_basic@enable-vfs-autoprobe-on Functionality documentation is missing
  Warning: igt@sriov_basic@enable-vfs-bind-unbind-each Functionality documentation is missing
  Warning: Documented igt@xe_exec_compute_mode@many-execqueues-malloc-ufence doesn't exist on source files
  ninja: build stopped: subcommand failed.
  section_end:1710568793:step_script
  section_start:1710568793:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710568794:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/56378281):
  [2/8] Linking target runner/runner_test.
  [3/8] Linking target assembler/intel-gen4asm.
  [4/8] Generating kms_tests.html with a custom command.
  [5/8] Generating i915_tests.html with a custom command.
  [6/8] Generating intel-ci-tests with a custom command.
  [7/8] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: igt@sriov_basic@bind-unbind-vf Functionality documentation is missing
  Warning: igt@sriov_basic@enable-vfs-autoprobe-off Functionality documentation is missing
  Warning: igt@sriov_basic@enable-vfs-autoprobe-on Functionality documentation is missing
  Warning: igt@sriov_basic@enable-vfs-bind-unbind-each Functionality documentation is missing
  Warning: Documented igt@xe_exec_compute_mode@many-execqueues-malloc-ufence doesn't exist on source files
  ninja: build stopped: subcommand failed.
  section_end:1710568794:step_script
  section_start:1710568794:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710568795:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/56378282):
  [1/823] Generating version.h with a custom command.
  [2/7] Linking target runner/runner_test.
  [3/7] Generating i915_tests.html with a custom command.
  [4/7] Generating intel-ci-tests with a custom command.
  [5/7] Generating kms_tests.html with a custom command.
  [6/7] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: igt@sriov_basic@bind-unbind-vf Functionality documentation is missing
  Warning: igt@sriov_basic@enable-vfs-autoprobe-off Functionality documentation is missing
  Warning: igt@sriov_basic@enable-vfs-autoprobe-on Functionality documentation is missing
  Warning: igt@sriov_basic@enable-vfs-bind-unbind-each Functionality documentation is missing
  Warning: Documented igt@xe_exec_compute_mode@many-execqueues-malloc-ufence doesn't exist on source files
  ninja: build stopped: subcommand failed.
  section_end:1710568793:step_script
  section_start:1710568793:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710568794:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1129314
