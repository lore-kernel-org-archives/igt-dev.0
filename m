Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89204CCD195
	for <igt-dev@archiver.kernel.org>; Sat, 18 Oct 2025 16:16:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4123D10E11F;
	Sat, 18 Oct 2025 16:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JeiNfkSB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C0210E127
 for <igt-dev@lists.freedesktop.org>; Sat, 18 Oct 2025 16:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760804180; x=1792340180;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pbf1ZT+7J/b2jreJvUVHg1gH/AOslafCHa3ANYf5uj0=;
 b=JeiNfkSBV92Cz4m2mTGBQSFDIdJfaKjpdZOWQWFsKcEsuxzvcUbWMBmL
 F8Ifsm00jUSWbH5ufuZlX0U40Gpxow6fWJqn3PQ6slmVWVOl/gA4SoN7v
 vZ94q2FO1ZbzbDHHhLMiv3OkIeX2TI7k1ElVvjoU1t4GqHWLECZgMPmzO
 goqYW7MLfpRxgK/HMis10GPPcREkUi9RPds3vb8w/LBlzTrqeYd8XWLgd
 mkujdV0YSOKkAa66QHs7XhtwV/UaIW5EzhlPC0wUlKDdpBR+vpKOwArUT
 GmjXAECIMcMypaxcrKCAOfa2hsrDqVC/dRcMlrIZ8bGKWo8Rujwy33N7Q Q==;
X-CSE-ConnectionGUID: vBQuLEyeQHidb2gc8gJ1Iw==
X-CSE-MsgGUID: acpZhAqERfeDQa3FZYSSaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="85614312"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; d="scan'208";a="85614312"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2025 09:16:20 -0700
X-CSE-ConnectionGUID: y1Y/4iJiRWG1UEl5R5UCWg==
X-CSE-MsgGUID: 7HGOY6Q1Q26DviJllpQQpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; d="scan'208";a="186985954"
Received: from mfidelix-mobl3.gar.corp.intel.com (HELO localhost)
 ([10.94.248.204])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2025 09:16:18 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>
Subject: [PATCH i-g-t 3/3] tests/intel: Use
 xe_sriov_disable_vfs_restore_auto_provisioning()
Date: Sat, 18 Oct 2025 18:15:49 +0200
Message-ID: <20251018161549.999459-4-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251018161549.999459-1-marcin.bernatowicz@linux.intel.com>
References: <20251018161549.999459-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Replace igt_sriov_disable_vfs() with the wrapper that also requests PF
restore_auto_provisioning, ensuring a clean provisioning baseline after
teardown in xe_pmu and xe_sriov_scheduling.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
---
 tests/intel/xe_pmu.c              | 2 +-
 tests/intel/xe_sriov_scheduling.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index d1050ee11..9525655ba 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -1015,7 +1015,7 @@ static void unprovision_and_disable_vfs(int fd)
 			xe_sriov_set_exec_quantum_ms(fd, fn, gt, 0);
 	}
 
-	igt_sriov_disable_vfs(fd);
+	xe_sriov_disable_vfs_restore_auto_provisioning(fd);
 	/* abort to avoid execution of next tests with enabled VFs */
 	igt_abort_on_f(igt_sriov_get_enabled_vfs(fd) > 0,
 		       "Failed to disable VF(s)");
diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
index f0f2f29e4..5e8c87755 100644
--- a/tests/intel/xe_sriov_scheduling.c
+++ b/tests/intel/xe_sriov_scheduling.c
@@ -730,7 +730,7 @@ static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opt
 	/* cleanup */
 	subm_set_fini(set);
 	set_vfs_scheduling_params(pf_fd, num_vfs, &(struct vf_sched_params){});
-	igt_sriov_disable_vfs(pf_fd);
+	xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
 }
 
 /**
@@ -816,7 +816,7 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
 	/* cleanup */
 	subm_set_fini(set);
 	set_vfs_scheduling_params(pf_fd, num_vfs, &(struct vf_sched_params){});
-	igt_sriov_disable_vfs(pf_fd);
+	xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
 }
 
 static struct subm_opts subm_opts = {
@@ -925,7 +925,7 @@ igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
 	igt_fixture {
 		set_vfs_scheduling_params(pf_fd, igt_sriov_get_total_vfs(pf_fd),
 					  &(struct vf_sched_params){});
-		igt_sriov_disable_vfs(pf_fd);
+		xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
 		/* abort to avoid execution of next tests with enabled VFs */
 		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0,
 			       "Failed to disable VF(s)");
-- 
2.43.0

