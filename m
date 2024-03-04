Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D27AC54E41
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 21:54:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD09710E272;
	Mon,  4 Mar 2024 21:54:43 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF4FB10E272;
 Mon,  4 Mar 2024 21:54:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_lib/igt=5Fkmod=3A_Allow?=
 =?utf-8?q?_to_load_kunit_from_alias_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 04 Mar 2024 21:54:42 -0000
Message-ID: <170958928278.503981.9305287706928439334@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240304204838.1577556-1-lucas.demarchi@intel.com>
In-Reply-To: <20240304204838.1577556-1-lucas.demarchi@intel.com>
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

Series: lib/igt_kmod: Allow to load kunit from alias (rev4)
URL   : https://patchwork.freedesktop.org/series/130282/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1119462 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/55851077):
  Warning: igt@vgem_basic@dmabuf-export Sub-category documentation is missing
  Warning: igt@vgem_basic@dmabuf-fence Sub-category documentation is missing
  Warning: igt@vgem_basic@dmabuf-fence-before Sub-category documentation is missing
  Warning: igt@vgem_basic@dmabuf-mmap Sub-category documentation is missing
  Warning: igt@vgem_basic@mmap Sub-category documentation is missing
  Warning: igt@vgem_basic@second-client Sub-category documentation is missing
  Warning: igt@vgem_basic@setversion Sub-category documentation is missing
  Warning: igt@vgem_basic@sysfs Sub-category documentation is missing
  Warning: igt@vgem_basic@unload Sub-category documentation is missing
  Warning: Documented igt@dmabuf@all-tests doesn't exist on source files
  Warning: Documented igt@i915_selftest@live doesn't exist on source files
  Warning: Documented igt@i915_selftest@mock doesn't exist on source files
  Warning: Documented igt@i915_selftest@perf doesn't exist on source files
  ninja: build stopped: subcommand failed.
  section_end:1709589031:step_script
  section_start:1709589031:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1709589032:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/55851072):
  Warning: igt@vgem_basic@dmabuf-export Sub-category documentation is missing
  Warning: igt@vgem_basic@dmabuf-fence Sub-category documentation is missing
  Warning: igt@vgem_basic@dmabuf-fence-before Sub-category documentation is missing
  Warning: igt@vgem_basic@dmabuf-mmap Sub-category documentation is missing
  Warning: igt@vgem_basic@mmap Sub-category documentation is missing
  Warning: igt@vgem_basic@second-client Sub-category documentation is missing
  Warning: igt@vgem_basic@setversion Sub-category documentation is missing
  Warning: igt@vgem_basic@sysfs Sub-category documentation is missing
  Warning: igt@vgem_basic@unload Sub-category documentation is missing
  Warning: Documented igt@dmabuf@all-tests doesn't exist on source files
  Warning: Documented igt@i915_selftest@live doesn't exist on source files
  Warning: Documented igt@i915_selftest@mock doesn't exist on source files
  Warning: Documented igt@i915_selftest@perf doesn't exist on source files
  ninja: build stopped: subcommand failed.
  section_end:1709589038:step_script
  section_start:1709589038:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1709589039:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/55851076):
  Warning: igt@vgem_basic@dmabuf-export Sub-category documentation is missing
  Warning: igt@vgem_basic@dmabuf-fence Sub-category documentation is missing
  Warning: igt@vgem_basic@dmabuf-fence-before Sub-category documentation is missing
  Warning: igt@vgem_basic@dmabuf-mmap Sub-category documentation is missing
  Warning: igt@vgem_basic@mmap Sub-category documentation is missing
  Warning: igt@vgem_basic@second-client Sub-category documentation is missing
  Warning: igt@vgem_basic@setversion Sub-category documentation is missing
  Warning: igt@vgem_basic@sysfs Sub-category documentation is missing
  Warning: igt@vgem_basic@unload Sub-category documentation is missing
  Warning: Documented igt@dmabuf@all-tests doesn't exist on source files
  Warning: Documented igt@i915_selftest@live doesn't exist on source files
  Warning: Documented igt@i915_selftest@mock doesn't exist on source files
  Warning: Documented igt@i915_selftest@perf doesn't exist on source files
  ninja: build stopped: subcommand failed.
  section_end:1709589052:step_script
  section_start:1709589052:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1709589053:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/55851075):
  Warning: igt@vgem_basic@dmabuf-export Sub-category documentation is missing
  Warning: igt@vgem_basic@dmabuf-fence Sub-category documentation is missing
  Warning: igt@vgem_basic@dmabuf-fence-before Sub-category documentation is missing
  Warning: igt@vgem_basic@dmabuf-mmap Sub-category documentation is missing
  Warning: igt@vgem_basic@mmap Sub-category documentation is missing
  Warning: igt@vgem_basic@second-client Sub-category documentation is missing
  Warning: igt@vgem_basic@setversion Sub-category documentation is missing
  Warning: igt@vgem_basic@sysfs Sub-category documentation is missing
  Warning: igt@vgem_basic@unload Sub-category documentation is missing
  Warning: Documented igt@dmabuf@all-tests doesn't exist on source files
  Warning: Documented igt@i915_selftest@live doesn't exist on source files
  Warning: Documented igt@i915_selftest@mock doesn't exist on source files
  Warning: Documented igt@i915_selftest@perf doesn't exist on source files
  ninja: build stopped: subcommand failed.
  section_end:1709589030:step_script
  section_start:1709589030:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1709589031:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/55851073):
  Warning: igt@vgem_basic@dmabuf-export Sub-category documentation is missing
  Warning: igt@vgem_basic@dmabuf-fence Sub-category documentation is missing
  Warning: igt@vgem_basic@dmabuf-fence-before Sub-category documentation is missing
  Warning: igt@vgem_basic@dmabuf-mmap Sub-category documentation is missing
  Warning: igt@vgem_basic@mmap Sub-category documentation is missing
  Warning: igt@vgem_basic@second-client Sub-category documentation is missing
  Warning: igt@vgem_basic@setversion Sub-category documentation is missing
  Warning: igt@vgem_basic@sysfs Sub-category documentation is missing
  Warning: igt@vgem_basic@unload Sub-category documentation is missing
  Warning: Documented igt@dmabuf@all-tests doesn't exist on source files
  Warning: Documented igt@i915_selftest@live doesn't exist on source files
  Warning: Documented igt@i915_selftest@mock doesn't exist on source files
  Warning: Documented igt@i915_selftest@perf doesn't exist on source files
  ninja: build stopped: subcommand failed.
  section_end:1709589032:step_script
  section_start:1709589032:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1709589033:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/55851074):
  Warning: igt@vgem_basic@dmabuf-export Sub-category documentation is missing
  Warning: igt@vgem_basic@dmabuf-fence Sub-category documentation is missing
  Warning: igt@vgem_basic@dmabuf-fence-before Sub-category documentation is missing
  Warning: igt@vgem_basic@dmabuf-mmap Sub-category documentation is missing
  Warning: igt@vgem_basic@mmap Sub-category documentation is missing
  Warning: igt@vgem_basic@second-client Sub-category documentation is missing
  Warning: igt@vgem_basic@setversion Sub-category documentation is missing
  Warning: igt@vgem_basic@sysfs Sub-category documentation is missing
  Warning: igt@vgem_basic@unload Sub-category documentation is missing
  Warning: Documented igt@dmabuf@all-tests doesn't exist on source files
  Warning: Documented igt@i915_selftest@live doesn't exist on source files
  Warning: Documented igt@i915_selftest@mock doesn't exist on source files
  Warning: Documented igt@i915_selftest@perf doesn't exist on source files
  ninja: build stopped: subcommand failed.
  section_end:1709589031:step_script
  section_start:1709589031:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1709589032:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1119462
