Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8028EC5478C
	for <igt-dev@archiver.kernel.org>; Tue, 27 Feb 2024 02:54:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21AD310E6B6;
	Tue, 27 Feb 2024 02:54:07 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD9D10E6B6;
 Tue, 27 Feb 2024 02:54:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_xe=5Fexec=5Fcompute=5Fmod?=
 =?utf-8?q?e=3A_Add_malloc-ufence_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 27 Feb 2024 02:54:06 -0000
Message-ID: <170900244624.318338.7056385510189357002@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240227023956.141475-1-matthew.brost@intel.com>
In-Reply-To: <20240227023956.141475-1-matthew.brost@intel.com>
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

Series: xe_exec_compute_mode: Add malloc-ufence test
URL   : https://patchwork.freedesktop.org/series/130417/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
17f897a81868fb35c6a7033a8b07256659742248 tests/amdgpu: refactor the ABM test to use the new sysfs interface

Tail of build.log:
Warning: igt@sysfs_heartbeat_interval@long Category documentation is missing
Warning: igt@sysfs_heartbeat_interval@long Sub-category documentation is missing
Warning: igt@sysfs_heartbeat_interval@long Functionality documentation is missing
Warning: igt@sysfs_heartbeat_interval@mixed Category documentation is missing
Warning: igt@sysfs_heartbeat_interval@mixed Sub-category documentation is missing
Warning: igt@sysfs_heartbeat_interval@mixed Functionality documentation is missing
Warning: igt@sysfs_heartbeat_interval@nopreempt Category documentation is missing
Warning: igt@sysfs_heartbeat_interval@nopreempt Sub-category documentation is missing
Warning: igt@sysfs_heartbeat_interval@nopreempt Functionality documentation is missing
Warning: igt@sysfs_heartbeat_interval@off Category documentation is missing
Warning: igt@sysfs_heartbeat_interval@off Sub-category documentation is missing
Warning: igt@sysfs_heartbeat_interval@off Functionality documentation is missing
Warning: igt@sysfs_heartbeat_interval@precise Category documentation is missing
Warning: igt@sysfs_heartbeat_interval@precise Sub-category documentation is missing
Warning: igt@sysfs_heartbeat_interval@precise Functionality documentation is missing
Warning: igt@sysfs_preempt_timeout@idempotent Category documentation is missing
Warning: igt@sysfs_preempt_timeout@idempotent Sub-category documentation is missing
Warning: igt@sysfs_preempt_timeout@idempotent Functionality documentation is missing
Warning: igt@sysfs_preempt_timeout@invalid Category documentation is missing
Warning: igt@sysfs_preempt_timeout@invalid Sub-category documentation is missing
Warning: igt@sysfs_preempt_timeout@invalid Functionality documentation is missing
Warning: igt@sysfs_preempt_timeout@off Category documentation is missing
Warning: igt@sysfs_preempt_timeout@off Sub-category documentation is missing
Warning: igt@sysfs_preempt_timeout@off Functionality documentation is missing
Warning: igt@sysfs_preempt_timeout@timeout Category documentation is missing
Warning: igt@sysfs_preempt_timeout@timeout Sub-category documentation is missing
Warning: igt@sysfs_preempt_timeout@timeout Functionality documentation is missing
Warning: igt@sysfs_timeslice_duration@duration Category documentation is missing
Warning: igt@sysfs_timeslice_duration@duration Sub-category documentation is missing
Warning: igt@sysfs_timeslice_duration@duration Functionality documentation is missing
Warning: igt@sysfs_timeslice_duration@idempotent Category documentation is missing
Warning: igt@sysfs_timeslice_duration@idempotent Sub-category documentation is missing
Warning: igt@sysfs_timeslice_duration@idempotent Functionality documentation is missing
Warning: igt@sysfs_timeslice_duration@invalid Category documentation is missing
Warning: igt@sysfs_timeslice_duration@invalid Sub-category documentation is missing
Warning: igt@sysfs_timeslice_duration@invalid Functionality documentation is missing
Warning: igt@sysfs_timeslice_duration@off Category documentation is missing
Warning: igt@sysfs_timeslice_duration@off Sub-category documentation is missing
Warning: igt@sysfs_timeslice_duration@off Functionality documentation is missing
Warning: igt@sysfs_timeslice_duration@timeout Category documentation is missing
Warning: igt@sysfs_timeslice_duration@timeout Sub-category documentation is missing
Warning: igt@sysfs_timeslice_duration@timeout Functionality documentation is missing
Warning: igt@vgem_basic@bad-fence Sub-category documentation is missing
Warning: igt@vgem_basic@bad-flag Sub-category documentation is missing
Warning: igt@vgem_basic@bad-handle Sub-category documentation is missing
Warning: igt@vgem_basic@bad-pad Sub-category documentation is missing
Warning: igt@vgem_basic@busy-fence Sub-category documentation is missing
[1662/1667] Generating kms_tests.rst with a custom command.
[1663/1667] Generating intel-ci-tests with a custom command.
ninja: build stopped: subcommand failed.


