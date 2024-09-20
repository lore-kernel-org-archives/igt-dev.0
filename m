Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF15C78850
	for <igt-dev@archiver.kernel.org>; Fri, 20 Sep 2024 14:01:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E7010E14D;
	Fri, 20 Sep 2024 14:01:19 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6942F10E14D;
 Fri, 20 Sep 2024 14:01:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_tests/intel/xe=5Ffault?=
 =?utf-8?q?=5Finjection=3A_Add_new_test_for_fault_injection?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 20 Sep 2024 14:01:17 -0000
Message-ID: <172684087742.1051051.16581467922442780378@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240920131913.3368381-1-francois.dugast@intel.com>
In-Reply-To: <20240920131913.3368381-1-francois.dugast@intel.com>
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

Series: tests/intel/xe_fault_injection: Add new test for fault injection
URL   : https://patchwork.freedesktop.org/series/138923/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1275164 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/63936915):
  [4/8] Generating kms_tests.html with a custom command.
  [5/8] Generating intel-ci-tests with a custom command.
  [6/8] Generating i915_tests.html with a custom command.
  [7/8] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: igt@xe_fault_injection@function-fault-injection-during-probe Functionality documentation is missing
  INFO: Found documentation for 'xe_exec_sip_eudebug' but no binary
  INFO: Found documentation for 'xe_eudebug' but no binary
  INFO: Found documentation for 'xe_eudebug_online' but no binary
  ERROR: Missing documentation for igt@xe_fault_injection@function-fault-injection
  ERROR: Unneeded documentation for igt@xe_fault_injection@function-fault-injection-during-probe
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1726840689:step_script
  section_start:1726840689:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1726840690:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/63936910):
  [3/7] Generating i915_tests.html with a custom command.
  [4/7] Generating intel-ci-tests with a custom command.
  [5/7] Generating kms_tests.html with a custom command.
  [6/7] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: igt@xe_fault_injection@function-fault-injection-during-probe Functionality documentation is missing
  INFO: Found documentation for 'xe_exec_sip_eudebug' but no binary
  INFO: Found documentation for 'xe_eudebug_online' but no binary
  INFO: Found documentation for 'xe_eudebug' but no binary
  ERROR: Missing documentation for igt@xe_fault_injection@function-fault-injection
  ERROR: Unneeded documentation for igt@xe_fault_injection@function-fault-injection-during-probe
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1726840692:step_script
  section_start:1726840692:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1726840693:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/63936914):
  [2/6] Generating intel-ci-tests with a custom command.
  [3/6] Generating i915_tests.html with a custom command.
  [4/6] Generating kms_tests.html with a custom command.
  [5/6] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: igt@xe_fault_injection@function-fault-injection-during-probe Functionality documentation is missing
  INFO: Found documentation for 'xe_eudebug' but no binary
  INFO: Found documentation for 'xe_exec_sip_eudebug' but no binary
  INFO: Found documentation for 'xe_eudebug_online' but no binary
  ERROR: Missing documentation for igt@xe_fault_injection@function-fault-injection
  ERROR: Unneeded documentation for igt@xe_fault_injection@function-fault-injection-during-probe
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1726840715:step_script
  section_start:1726840715:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1726840716:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/63936913):
  [3/7] Generating i915_tests.html with a custom command.
  [4/7] Generating intel-ci-tests with a custom command.
  [5/7] Generating kms_tests.html with a custom command.
  [6/7] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: igt@xe_fault_injection@function-fault-injection-during-probe Functionality documentation is missing
  INFO: Found documentation for 'xe_exec_sip_eudebug' but no binary
  INFO: Found documentation for 'xe_eudebug' but no binary
  INFO: Found documentation for 'xe_eudebug_online' but no binary
  ERROR: Missing documentation for igt@xe_fault_injection@function-fault-injection
  ERROR: Unneeded documentation for igt@xe_fault_injection@function-fault-injection-during-probe
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1726840701:step_script
  section_start:1726840701:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1726840702:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/63936911):
  [3/7] Generating i915_tests.html with a custom command.
  [4/7] Generating kms_tests.html with a custom command.
  [5/7] Generating intel-ci-tests with a custom command.
  [6/7] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: igt@xe_fault_injection@function-fault-injection-during-probe Functionality documentation is missing
  INFO: Found documentation for 'xe_exec_sip_eudebug' but no binary
  INFO: Found documentation for 'xe_eudebug' but no binary
  INFO: Found documentation for 'xe_eudebug_online' but no binary
  ERROR: Missing documentation for igt@xe_fault_injection@function-fault-injection
  ERROR: Unneeded documentation for igt@xe_fault_injection@function-fault-injection-during-probe
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1726840695:step_script
  section_start:1726840695:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1726840696:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/63936912):
  [3/7] Generating kms_tests.html with a custom command.
  [4/7] Generating i915_tests.html with a custom command.
  [5/7] Generating intel-ci-tests with a custom command.
  [6/7] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: igt@xe_fault_injection@function-fault-injection-during-probe Functionality documentation is missing
  INFO: Found documentation for 'xe_eudebug_online' but no binary
  INFO: Found documentation for 'xe_exec_sip_eudebug' but no binary
  INFO: Found documentation for 'xe_eudebug' but no binary
  ERROR: Missing documentation for igt@xe_fault_injection@function-fault-injection
  ERROR: Unneeded documentation for igt@xe_fault_injection@function-fault-injection-during-probe
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1726840691:step_script
  section_start:1726840691:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1726840704:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1275164
