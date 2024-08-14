Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001A6C52D7F
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 20:26:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD9D210E077;
	Wed, 14 Aug 2024 20:26:05 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ADEB10E040;
 Wed, 14 Aug 2024 20:26:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_series_starting_with_?=
 =?utf-8?q?=5B1/2=5D_dumb=5Fbuffer=3A_Remove_invalid-bpp_subtest?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rob Clark" <robdclark@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 14 Aug 2024 20:26:05 -0000
Message-ID: <172366716516.633672.8979846223188255733@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240814185426.70418-1-robdclark@gmail.com>
In-Reply-To: <20240814185426.70418-1-robdclark@gmail.com>
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

Series: series starting with [1/2] dumb_buffer: Remove invalid-bpp subtest
URL   : https://patchwork.freedesktop.org/series/137323/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1249227 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/62265901):
  [1873/1880] Generating kms_tests.rst with a custom command.
  [1874/1880] Generating intel-ci-tests with a custom command.
  [1875/1880] Generating xe_tests.html with a custom command.
  [1876/1880] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/835] Generating version.h with a custom command.
  [2/7] Linking target runner/runner_test.
  [3/7] Linking target assembler/intel-gen4asm.
  [4/7] Generating i915_tests.rst with a custom command.
  FAILED: docs/testplan/i915_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json --rest docs/testplan/i915_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Documented igt@dumb_buffer@invalid-bpp doesn't exist on source files
  ninja: build stopped: subcommand failed.
  section_end:1723666955:step_script
  section_start:1723666955:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1723666958:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/62265896):
  [1880/1886] Generating kms_tests.rst with a custom command.
  [1881/1886] Generating intel-ci-tests with a custom command.
  [1882/1886] Generating xe_tests.html with a custom command.
  [1883/1886] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/837] Generating version.h with a custom command.
  [2/6] Linking target runner/runner_test.
  [3/6] Generating kms_tests.html with a custom command.
  [4/6] Generating i915_tests.rst with a custom command.
  FAILED: docs/testplan/i915_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json --rest docs/testplan/i915_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Documented igt@dumb_buffer@invalid-bpp doesn't exist on source files
  ninja: build stopped: subcommand failed.
  section_end:1723666942:step_script
  section_start:1723666942:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1723666942:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/62265900):
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json --rest docs/testplan/i915_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Documented igt@dumb_buffer@invalid-bpp doesn't exist on source files
  [1882/1886] Generating kms_tests.rst with a custom command.
  [1883/1886] Generating intel-ci-tests with a custom command.
  [1884/1886] Generating xe_tests.html with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/837] Generating version.h with a custom command.
  [2/5] Generating kms_tests.html with a custom command.
  [3/5] Generating i915_tests.rst with a custom command.
  FAILED: docs/testplan/i915_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json --rest docs/testplan/i915_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Documented igt@dumb_buffer@invalid-bpp doesn't exist on source files
  ninja: build stopped: subcommand failed.
  section_end:1723666985:step_script
  section_start:1723666985:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1723666986:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/62265899):
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out eb54a8b3 as detached HEAD (ref is intel/IGTPW_11581)...
  Removing build/
  Removing lib/i915/perf-configs/__pycache__/
  Removing lib/xe/oa-configs/__pycache__/
  Removing scripts/__pycache__/
  
  Skipping Git submodules setup
  section_end:1723666833:get_sources
  section_start:1723666833:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-eb54a8b3b2169a2ed37fc095461963b8382f5d9b with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora@sha256:17d64607d998df2bf29a56b88922d3a598e6f1daa3b51ece2a892c2f293daf83 ...
  section_end:1723666836:step_script
  section_start:1723666836:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1723666837:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: no such image: docker.io/library/sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f: image not known (docker.go:652:0s)

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/62265897):
  section_start:1723666831:get_sources
  Getting source from Git repository
  $ /host/bin/curl -s -L --cacert /host/ca-certificates.crt --retry 4 -f --retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-infra/-/raw/main/runner-gating/runner-gating.sh | sh -s -- pre_get_sources_script
  Checking if the user of the pipeline is allowed...
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out eb54a8b3 as detached HEAD (ref is intel/IGTPW_11581)...
  
  Skipping Git submodules setup
  section_end:1723666833:get_sources
  section_start:1723666833:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-eb54a8b3b2169a2ed37fc095461963b8382f5d9b with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora@sha256:17d64607d998df2bf29a56b88922d3a598e6f1daa3b51ece2a892c2f293daf83 ...
  section_end:1723666836:step_script
  section_start:1723666836:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1723666838:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: no such image: docker.io/library/sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f: image not known (docker.go:652:0s)

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/62265898):
  Checking if the user of the pipeline is allowed...
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out eb54a8b3 as detached HEAD (ref is intel/IGTPW_11581)...
  Removing build/
  Removing installdir/
  Removing undocumented_tests.txt
  
  Skipping Git submodules setup
  section_end:1723666834:get_sources
  section_start:1723666834:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-eb54a8b3b2169a2ed37fc095461963b8382f5d9b with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora@sha256:17d64607d998df2bf29a56b88922d3a598e6f1daa3b51ece2a892c2f293daf83 ...
  section_end:1723666836:step_script
  section_start:1723666836:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1723666837:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: no such image: docker.io/library/sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f: image not known (docker.go:652:0s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1249227
