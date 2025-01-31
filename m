Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C11C0218F
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jan 2025 17:11:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B79B10E091;
	Fri, 31 Jan 2025 17:11:06 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC7010E091;
 Fri, 31 Jan 2025 17:11:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_tests/intel/xe=5Fmulti?=
 =?utf-8?q?=5Ftile=3A_Multi-Tile_support_in_IGT?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 31 Jan 2025 17:11:05 -0000
Message-ID: <173834346518.3259839.16200893289325508486@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250131142712.86716-1-nishit.sharma@intel.com>
In-Reply-To: <20250131142712.86716-1-nishit.sharma@intel.com>
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

Series: tests/intel/xe_multi_tile: Multi-Tile support in IGT
URL   : https://patchwork.freedesktop.org/series/144187/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1355975 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/70348891):
  [1/859] Generating version.h with a custom command.
  [2/8] Linking target runner/runner_test.
  [3/8] Linking target assembler/intel-gen4asm.
  [4/8] Generating i915_tests.html with a custom command.
  [5/8] Generating kms_tests.html with a custom command.
  [6/8] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: igt@xe_multi_tile@show-tile-info Description documentation is missing
  ERROR: Missing documentation for igt@xe_multi_tile@multi-tile-info
  ERROR: Unneeded documentation for igt@xe_multi_tile@gt-configuration
  ERROR: Unneeded documentation for igt@xe_multi_tile@show-tile-info
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1738343362:step_script
  section_start:1738343362:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1738343363:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/70348894):
  section_start:1738343296:get_sources
  Getting source from Git repository
  $ /host/bin/curl -s -L --cacert /host/ca-certificates.crt --retry 4 -f --retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-infra/-/raw/main/runner-gating/runner-gating.sh | sh -s -- pre_get_sources_script
  Checking if the user of the pipeline is allowed...
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out 106274bd as detached HEAD (ref is intel/IGTPW_12528)...
  
  Skipping Git submodules setup
  section_end:1738343313:get_sources
  section_start:1738343313:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:7360075a71dacfc66f0b49b3271b9a459904dbe51c5760efac48fe52da27946c for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-106274bd62425413b5147a712379f0d8fbd646d9 with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64@sha256:df8438cd0e218646c3bdc2eb6abccb43c4e884bfd40a1a4dd0365f1f8031d21f ...
  section_end:1738343316:step_script
  section_start:1738343316:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1738343317:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: no such image: docker.io/library/sha256:7360075a71dacfc66f0b49b3271b9a459904dbe51c5760efac48fe52da27946c: image not known (docker.go:650:0s)

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/70348886):
  [1/861] Generating version.h with a custom command.
  [2/7] Linking target runner/runner_test.
  [3/7] Generating intel-ci-tests with a custom command.
  [4/7] Generating i915_tests.html with a custom command.
  [5/7] Generating kms_tests.html with a custom command.
  [6/7] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: igt@xe_multi_tile@show-tile-info Description documentation is missing
  ERROR: Missing documentation for igt@xe_multi_tile@multi-tile-info
  ERROR: Unneeded documentation for igt@xe_multi_tile@gt-configuration
  ERROR: Unneeded documentation for igt@xe_multi_tile@show-tile-info
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1738343401:step_script
  section_start:1738343401:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1738343402:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/70348890):
  ninja: Entering directory `build'
  [1/861] Generating version.h with a custom command.
  [2/6] Generating i915_tests.html with a custom command.
  [3/6] Generating intel-ci-tests with a custom command.
  [4/6] Generating kms_tests.html with a custom command.
  [5/6] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: igt@xe_multi_tile@show-tile-info Description documentation is missing
  ERROR: Missing documentation for igt@xe_multi_tile@multi-tile-info
  ERROR: Unneeded documentation for igt@xe_multi_tile@gt-configuration
  ERROR: Unneeded documentation for igt@xe_multi_tile@show-tile-info
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1738343425:step_script
  section_start:1738343425:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1738343425:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/70348889):
  [1/809] Generating version.h with a custom command.
  [2/7] Linking target runner/runner_test.
  [3/7] Generating intel-ci-tests with a custom command.
  [4/7] Generating i915_tests.html with a custom command.
  [5/7] Generating kms_tests.html with a custom command.
  [6/7] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: igt@xe_multi_tile@show-tile-info Description documentation is missing
  ERROR: Missing documentation for igt@xe_multi_tile@multi-tile-info
  ERROR: Unneeded documentation for igt@xe_multi_tile@gt-configuration
  ERROR: Unneeded documentation for igt@xe_multi_tile@show-tile-info
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1738343366:step_script
  section_start:1738343366:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1738343368:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/70348887):
  [1/861] Generating version.h with a custom command.
  [2/7] Linking target runner/runner_test.
  [3/7] Generating intel-ci-tests with a custom command.
  [4/7] Generating kms_tests.html with a custom command.
  [5/7] Generating i915_tests.html with a custom command.
  [6/7] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: igt@xe_multi_tile@show-tile-info Description documentation is missing
  ERROR: Missing documentation for igt@xe_multi_tile@multi-tile-info
  ERROR: Unneeded documentation for igt@xe_multi_tile@gt-configuration
  ERROR: Unneeded documentation for igt@xe_multi_tile@show-tile-info
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1738343410:step_script
  section_start:1738343410:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1738343411:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/70348888):
  [1/861] Generating version.h with a custom command.
  [2/7] Linking target runner/runner_test.
  [3/7] Generating intel-ci-tests with a custom command.
  [4/7] Generating i915_tests.html with a custom command.
  [5/7] Generating kms_tests.html with a custom command.
  [6/7] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: igt@xe_multi_tile@show-tile-info Description documentation is missing
  ERROR: Missing documentation for igt@xe_multi_tile@multi-tile-info
  ERROR: Unneeded documentation for igt@xe_multi_tile@gt-configuration
  ERROR: Unneeded documentation for igt@xe_multi_tile@show-tile-info
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1738343407:step_script
  section_start:1738343407:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1738343408:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1355975
