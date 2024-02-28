Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9686DC5478C
	for <igt-dev@archiver.kernel.org>; Wed, 28 Feb 2024 21:54:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F364710E0EE;
	Wed, 28 Feb 2024 21:54:02 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75EA210E0EE;
 Wed, 28 Feb 2024 21:54:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_lib/igt=5Fkmod=3A_Allow?=
 =?utf-8?q?_to_load_kunit_from_alias_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 28 Feb 2024 21:54:01 -0000
Message-ID: <170915724148.375736.17339858093236320617@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240222193044.3004471-1-lucas.demarchi@intel.com>
In-Reply-To: <20240222193044.3004471-1-lucas.demarchi@intel.com>
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

Series: lib/igt_kmod: Allow to load kunit from alias (rev3)
URL   : https://patchwork.freedesktop.org/series/130282/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1115471 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/55650358):
  Warning: igt@sysfs_timeslice_duration@off Category documentation is missing
  Warning: igt@sysfs_timeslice_duration@timeout Functionality documentation is missing
  Warning: igt@sysfs_timeslice_duration@timeout Sub-category documentation is missing
  Warning: igt@sysfs_timeslice_duration@timeout Category documentation is missing
  Warning: igt@vgem_basic@bad-fence Sub-category documentation is missing
  Warning: igt@vgem_basic@bad-flag Sub-category documentation is missing
  Warning: igt@vgem_basic@bad-handle Sub-category documentation is missing
  Warning: igt@vgem_basic@bad-pad Sub-category documentation is missing
  Warning: igt@vgem_basic@busy-fence Sub-category documentation is missing
  Warning: Documented igt@dmabuf@all-tests doesn't exist on source files
  Warning: Documented igt@i915_selftest@live doesn't exist on source files
  Warning: Documented igt@i915_selftest@mock doesn't exist on source files
  Warning: Documented igt@i915_selftest@perf doesn't exist on source files
  ninja: build stopped: subcommand failed.
  section_end:1709156890:step_script
  section_start:1709156890:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1709156891:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/55650353):
  Warning: igt@sysfs_timeslice_duration@off Functionality documentation is missing
  Warning: igt@sysfs_timeslice_duration@timeout Category documentation is missing
  Warning: igt@sysfs_timeslice_duration@timeout Sub-category documentation is missing
  Warning: igt@sysfs_timeslice_duration@timeout Functionality documentation is missing
  Warning: igt@vgem_basic@bad-fence Sub-category documentation is missing
  Warning: igt@vgem_basic@bad-flag Sub-category documentation is missing
  Warning: igt@vgem_basic@bad-handle Sub-category documentation is missing
  Warning: igt@vgem_basic@bad-pad Sub-category documentation is missing
  Warning: igt@vgem_basic@busy-fence Sub-category documentation is missing
  Warning: Documented igt@dmabuf@all-tests doesn't exist on source files
  Warning: Documented igt@i915_selftest@live doesn't exist on source files
  Warning: Documented igt@i915_selftest@mock doesn't exist on source files
  Warning: Documented igt@i915_selftest@perf doesn't exist on source files
  ninja: build stopped: subcommand failed.
  section_end:1709156818:step_script
  section_start:1709156818:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1709156818:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/55650357):
  Warning: igt@sysfs_timeslice_duration@off Category documentation is missing
  Warning: igt@sysfs_timeslice_duration@timeout Functionality documentation is missing
  Warning: igt@sysfs_timeslice_duration@timeout Sub-category documentation is missing
  Warning: igt@sysfs_timeslice_duration@timeout Category documentation is missing
  Warning: igt@vgem_basic@bad-fence Sub-category documentation is missing
  Warning: igt@vgem_basic@bad-flag Sub-category documentation is missing
  Warning: igt@vgem_basic@bad-handle Sub-category documentation is missing
  Warning: igt@vgem_basic@bad-pad Sub-category documentation is missing
  Warning: igt@vgem_basic@busy-fence Sub-category documentation is missing
  Warning: Documented igt@dmabuf@all-tests doesn't exist on source files
  Warning: Documented igt@i915_selftest@live doesn't exist on source files
  Warning: Documented igt@i915_selftest@mock doesn't exist on source files
  Warning: Documented igt@i915_selftest@perf doesn't exist on source files
  ninja: build stopped: subcommand failed.
  section_end:1709156855:step_script
  section_start:1709156855:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1709156856:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/55650356):
  Warning: igt@sysfs_timeslice_duration@off Functionality documentation is missing
  Warning: igt@sysfs_timeslice_duration@timeout Category documentation is missing
  Warning: igt@sysfs_timeslice_duration@timeout Sub-category documentation is missing
  Warning: igt@sysfs_timeslice_duration@timeout Functionality documentation is missing
  Warning: igt@vgem_basic@bad-fence Sub-category documentation is missing
  Warning: igt@vgem_basic@bad-flag Sub-category documentation is missing
  Warning: igt@vgem_basic@bad-handle Sub-category documentation is missing
  Warning: igt@vgem_basic@bad-pad Sub-category documentation is missing
  Warning: igt@vgem_basic@busy-fence Sub-category documentation is missing
  Warning: Documented igt@dmabuf@all-tests doesn't exist on source files
  Warning: Documented igt@i915_selftest@live doesn't exist on source files
  Warning: Documented igt@i915_selftest@mock doesn't exist on source files
  Warning: Documented igt@i915_selftest@perf doesn't exist on source files
  ninja: build stopped: subcommand failed.
  section_end:1709156814:step_script
  section_start:1709156814:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1709156816:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/55650354):
  Warning: igt@sysfs_timeslice_duration@off Functionality documentation is missing
  Warning: igt@sysfs_timeslice_duration@timeout Sub-category documentation is missing
  Warning: igt@sysfs_timeslice_duration@timeout Category documentation is missing
  Warning: igt@sysfs_timeslice_duration@timeout Functionality documentation is missing
  Warning: igt@vgem_basic@bad-fence Sub-category documentation is missing
  Warning: igt@vgem_basic@bad-flag Sub-category documentation is missing
  Warning: igt@vgem_basic@bad-handle Sub-category documentation is missing
  Warning: igt@vgem_basic@bad-pad Sub-category documentation is missing
  Warning: igt@vgem_basic@busy-fence Sub-category documentation is missing
  Warning: Documented igt@dmabuf@all-tests doesn't exist on source files
  Warning: Documented igt@i915_selftest@live doesn't exist on source files
  Warning: Documented igt@i915_selftest@mock doesn't exist on source files
  Warning: Documented igt@i915_selftest@perf doesn't exist on source files
  ninja: build stopped: subcommand failed.
  section_end:1709156808:step_script
  section_start:1709156808:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1709156810:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/55650355):
  Warning: igt@sysfs_timeslice_duration@off Functionality documentation is missing
  Warning: igt@sysfs_timeslice_duration@timeout Sub-category documentation is missing
  Warning: igt@sysfs_timeslice_duration@timeout Category documentation is missing
  Warning: igt@sysfs_timeslice_duration@timeout Functionality documentation is missing
  Warning: igt@vgem_basic@bad-fence Sub-category documentation is missing
  Warning: igt@vgem_basic@bad-flag Sub-category documentation is missing
  Warning: igt@vgem_basic@bad-handle Sub-category documentation is missing
  Warning: igt@vgem_basic@bad-pad Sub-category documentation is missing
  Warning: igt@vgem_basic@busy-fence Sub-category documentation is missing
  Warning: Documented igt@dmabuf@all-tests doesn't exist on source files
  Warning: Documented igt@i915_selftest@live doesn't exist on source files
  Warning: Documented igt@i915_selftest@mock doesn't exist on source files
  Warning: Documented igt@i915_selftest@perf doesn't exist on source files
  ninja: build stopped: subcommand failed.
  section_end:1709156812:step_script
  section_start:1709156812:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1709156813:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1115471
