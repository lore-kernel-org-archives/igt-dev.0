Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AAAD3B9AC
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 16:01:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0012E10E916;
	Tue, 26 Nov 2024 16:01:46 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1824E10E912;
 Tue, 26 Nov 2024 16:01:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_RFC_tests/intel/kms=5Ff?=
 =?utf-8?q?rontbuffer=5Ftracking=3A_Introduce_plane-fbc-dr_test_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 26 Nov 2024 16:01:45 -0000
Message-ID: <173263690509.3394481.661465252363014911@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241126141958.1138489-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20241126141958.1138489-1-santhosh.reddy.guddati@intel.com>
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

Series: RFC tests/intel/kms_frontbuffer_tracking: Introduce plane-fbc-dr test (rev3)
URL   : https://patchwork.freedesktop.org/series/138218/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1317542 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/67233441):
  [1912/1916] Generating xe_tests.html with a custom command.
  [1913/1916] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/851] Generating version.h with a custom command.
  [2/6] Linking target runner/runner_test.
  [3/6] Generating intel-ci-tests with a custom command.
  [4/6] Generating i915_tests.html with a custom command.
  [5/6] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  ERROR: Missing documentation for igt@kms_frontbuffer_tracking@plane-fbc-dr-negative
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1732636755:step_script
  section_start:1732636755:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1732636756:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/67233445):
  section_start:1732636822:get_sources
  Getting source from Git repository
  $ /host/bin/curl -s -L --cacert /host/ca-certificates.crt --retry 4 -f --retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-infra/-/raw/main/runner-gating/runner-gating.sh | sh -s -- pre_get_sources_script
  Checking if the user of the pipeline is allowed...
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out 118fd6e5 as detached HEAD (ref is intel/IGTPW_12199)...
  
  Skipping Git submodules setup
  section_end:1732636848:get_sources
  section_start:1732636848:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:cc55efdc667be826910d414a562c76ce1130a9c15255a0dd115431bc42f83448 for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-118fd6e568f1ead16a33452fd92481be4ef063dc with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips@sha256:c829c44880da4782b7a72626c259ac6904b4bd5f08601e66b3be889ca1c0cf79 ...
  section_end:1732636854:step_script
  section_start:1732636854:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1732636855:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: no such image: docker.io/library/sha256:cc55efdc667be826910d414a562c76ce1130a9c15255a0dd115431bc42f83448: image not known (docker.go:650:0s)

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/67233436):
  [1918/1922] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  [1919/1922] Generating xe_tests.html with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/853] Generating version.h with a custom command.
  [2/6] Linking target runner/runner_test.
  [3/6] Generating intel-ci-tests with a custom command.
  [4/6] Generating i915_tests.html with a custom command.
  [5/6] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  ERROR: Missing documentation for igt@kms_frontbuffer_tracking@plane-fbc-dr-negative
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1732636776:step_script
  section_start:1732636776:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1732636821:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/67233440):
  [1918/1922] Generating i915_tests.rst with a custom command.
  [1919/1922] Generating intel-ci-tests with a custom command.
  [1920/1922] Generating xe_tests.html with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/853] Generating version.h with a custom command.
  [2/5] Generating i915_tests.html with a custom command.
  [3/5] Generating intel-ci-tests with a custom command.
  [4/5] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  ERROR: Missing documentation for igt@kms_frontbuffer_tracking@plane-fbc-dr-negative
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1732636797:step_script
  section_start:1732636797:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1732636798:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/67233439):
  [1748/1752] Generating xe_tests.html with a custom command.
  [1749/1752] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/801] Generating version.h with a custom command.
  [2/6] Linking target runner/runner_test.
  [3/6] Generating intel-ci-tests with a custom command.
  [4/6] Generating i915_tests.html with a custom command.
  [5/6] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  ERROR: Missing documentation for igt@kms_frontbuffer_tracking@plane-fbc-dr-negative
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1732636762:step_script
  section_start:1732636762:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1732636763:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/67233437):
  [1918/1922] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  [1919/1922] Generating xe_tests.html with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/853] Generating version.h with a custom command.
  [2/6] Linking target runner/runner_test.
  [3/6] Generating intel-ci-tests with a custom command.
  [4/6] Generating i915_tests.html with a custom command.
  [5/6] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  ERROR: Missing documentation for igt@kms_frontbuffer_tracking@plane-fbc-dr-negative
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1732636762:step_script
  section_start:1732636762:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1732636763:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/67233438):
  [1918/1922] Compiling C object 'runner/runner@@runner_test@exe/runner_tests.c.o'.
  [1919/1922] Generating xe_tests.html with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/853] Generating version.h with a custom command.
  [2/6] Linking target runner/runner_test.
  [3/6] Generating intel-ci-tests with a custom command.
  [4/6] Generating i915_tests.html with a custom command.
  [5/6] Generating kms_tests.rst with a custom command.
  FAILED: docs/testplan/kms_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json --rest docs/testplan/kms_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  ERROR: Missing documentation for igt@kms_frontbuffer_tracking@plane-fbc-dr-negative
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1732636752:step_script
  section_start:1732636752:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1732636753:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1317542
