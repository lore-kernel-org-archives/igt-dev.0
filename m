Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6F7C5478C
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 19:23:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C5E10E4F7;
	Mon, 26 Feb 2024 19:23:26 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A743110E42F;
 Mon, 26 Feb 2024 19:23:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_lib/igt=5Fkmod=3A_Allow?=
 =?utf-8?q?_to_load_kunit_from_alias_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 26 Feb 2024 19:23:23 -0000
Message-ID: <170897540368.299097.3713025108012901734@8e613ede5ea5>
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

Series: lib/igt_kmod: Allow to load kunit from alias (rev2)
URL   : https://patchwork.freedesktop.org/series/130282/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1113393 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/55522154):
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
  section_end:1708975250:step_script
  section_start:1708975250:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1708975251:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/55522149):
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
  section_end:1708975257:step_script
  section_start:1708975257:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1708975258:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/55522153):
  Warning: igt@sysfs_timeslice_duration@off Category documentation is missing
  Warning: igt@sysfs_timeslice_duration@timeout Sub-category documentation is missing
  Warning: igt@sysfs_timeslice_duration@timeout Functionality documentation is missing
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
  section_end:1708975269:step_script
  section_start:1708975269:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1708975271:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/55522152):
  Warning: igt@sysfs_timeslice_duration@off Category documentation is missing
  Warning: igt@sysfs_timeslice_duration@timeout Sub-category documentation is missing
  Warning: igt@sysfs_timeslice_duration@timeout Functionality documentation is missing
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
  section_end:1708975252:step_script
  section_start:1708975252:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1708975252:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/55522150):
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
  section_end:1708975252:step_script
  section_start:1708975252:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1708975252:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/55522151):
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
  section_end:1708975250:step_script
  section_start:1708975250:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1708975251:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1113393
