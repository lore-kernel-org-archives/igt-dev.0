Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BA2C54E41
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 21:49:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E9610E2EE;
	Mon,  4 Mar 2024 21:49:14 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E29810E2EE;
 Mon,  4 Mar 2024 21:49:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_lib/igt=5Fkmod=3A_Allow_t?=
 =?utf-8?q?o_load_kunit_from_alias_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 04 Mar 2024 21:49:12 -0000
Message-ID: <170958895265.503981.16481260826670732434@8e613ede5ea5>
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
State : failure

== Summary ==

IGT patchset build failed on latest successful build
838ad56bf511c1caf56851c661fb5828c0440e3b tests/intel/gem_exec_schedule: Add w/a tag to prior update for MTL RCS/CCS w/a

Tail of build.log:
Warning: igt@sysfs_preempt_timeout@idempotent Functionality documentation is missing
Warning: igt@sysfs_preempt_timeout@idempotent Category documentation is missing
Warning: igt@sysfs_preempt_timeout@invalid Sub-category documentation is missing
Warning: igt@sysfs_preempt_timeout@invalid Functionality documentation is missing
Warning: igt@sysfs_preempt_timeout@invalid Category documentation is missing
Warning: igt@sysfs_preempt_timeout@off Sub-category documentation is missing
Warning: igt@sysfs_preempt_timeout@off Functionality documentation is missing
Warning: igt@sysfs_preempt_timeout@off Category documentation is missing
Warning: igt@sysfs_preempt_timeout@timeout Sub-category documentation is missing
Warning: igt@sysfs_preempt_timeout@timeout Functionality documentation is missing
Warning: igt@sysfs_preempt_timeout@timeout Category documentation is missing
Warning: igt@sysfs_timeslice_duration@duration Sub-category documentation is missing
Warning: igt@sysfs_timeslice_duration@duration Functionality documentation is missing
Warning: igt@sysfs_timeslice_duration@duration Category documentation is missing
Warning: igt@sysfs_timeslice_duration@idempotent Sub-category documentation is missing
Warning: igt@sysfs_timeslice_duration@idempotent Functionality documentation is missing
Warning: igt@sysfs_timeslice_duration@idempotent Category documentation is missing
Warning: igt@sysfs_timeslice_duration@invalid Sub-category documentation is missing
Warning: igt@sysfs_timeslice_duration@invalid Functionality documentation is missing
Warning: igt@sysfs_timeslice_duration@invalid Category documentation is missing
Warning: igt@sysfs_timeslice_duration@off Sub-category documentation is missing
Warning: igt@sysfs_timeslice_duration@off Functionality documentation is missing
Warning: igt@sysfs_timeslice_duration@off Category documentation is missing
Warning: igt@sysfs_timeslice_duration@timeout Sub-category documentation is missing
Warning: igt@sysfs_timeslice_duration@timeout Functionality documentation is missing
Warning: igt@sysfs_timeslice_duration@timeout Category documentation is missing
Warning: igt@vgem_basic@bad-fence Sub-category documentation is missing
Warning: igt@vgem_basic@bad-flag Sub-category documentation is missing
Warning: igt@vgem_basic@bad-handle Sub-category documentation is missing
Warning: igt@vgem_basic@bad-pad Sub-category documentation is missing
Warning: igt@vgem_basic@busy-fence Sub-category documentation is missing
Warning: igt@vgem_basic@create Sub-category documentation is missing
Warning: igt@vgem_basic@debugfs Sub-category documentation is missing
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
[1662/1667] Generating kms_tests.rst with a custom command.
[1663/1667] Generating intel-ci-tests with a custom command.
[1664/1667] Generating xe_tests.html with a custom command.
ninja: build stopped: subcommand failed.


