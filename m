Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3273DD46BEB
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 18:09:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F8110E2D9;
	Wed, 28 Jan 2026 18:09:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OOqB92pQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 100B610E2D9
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 18:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769623750; x=1801159750;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fRPUzvJlNqFMJfH45+sQ3FwSjmIvITuWQ8LtM7UPfkE=;
 b=OOqB92pQp5fDdSgtilpRpCmof1QIoeGyg+zzXSdxBdpSjO2Gb2Gs5Sgr
 O1fRlhq+kYISf/vM1RY21Khda26xmwbUd/p+Oi+2S3StyYFBGRaD1neeB
 G5uZcR4BElx+DKEA8fgbHLRDGiPZC98s6iXJoK3/xMY+lk+bH5OLpRkhM
 OmZAEVPyq+YPUsTp7H3U+6uP/gh1I70TezxZErZEvx0KdJb++qhtmYgYQ
 FGrLUW2sDjyGb7XA7BE3INWvOC+5elriBbFVEaWvgumUXSBTByjuKTzXh
 HKFagKmS4JXqVj5FFlH0ceyZHmGk59hZ39T50LNUHQffZWNQZIl0fW5yQ A==;
X-CSE-ConnectionGUID: tQS7RyjUTLy/urBas3KpHQ==
X-CSE-MsgGUID: L4UAusyLSvG05uGSNhBCYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70749021"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="70749021"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 10:09:10 -0800
X-CSE-ConnectionGUID: 4uFGTpq6SpW5J6PDqtydgQ==
X-CSE-MsgGUID: lHUpCWSeTe63m4E4JCu3oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="213202586"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.71])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 10:09:08 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com, michal.wajdeczko@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v3 i-g-t 07/10] tests/intel/xe_sriov_scheduling: Avoid assert
 on scheduling params restore in cleanup
Date: Wed, 28 Jan 2026 19:08:13 +0100
Message-ID: <20260128180819.1373376-8-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128180819.1373376-1-marcin.bernatowicz@linux.intel.com>
References: <20260128180819.1373376-1-marcin.bernatowicz@linux.intel.com>
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

Add __set_vfs_scheduling_params() that returns error instead of asserting.
Use the non-asserting helper in cleanup paths to ensure VFs are properly
disabled before aborting.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_sriov_scheduling.c | 41 ++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 9 deletions(-)

diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
index fad3cbb04..117737d5f 100644
--- a/tests/intel/xe_sriov_scheduling.c
+++ b/tests/intel/xe_sriov_scheduling.c
@@ -371,17 +371,36 @@ struct vf_sched_params {
 	uint32_t preempt_timeout_us;
 };
 
-static void set_vfs_scheduling_params(int pf_fd, int num_vfs,
-				      const struct vf_sched_params *p)
+static int __set_vfs_scheduling_params(int pf_fd, int num_vfs,
+				       const struct vf_sched_params *p)
 {
 	unsigned int gt;
+	int vf, ret;
 
 	xe_for_each_gt(pf_fd, gt) {
-		for (int vf = 0; vf <= num_vfs; ++vf) {
-			xe_sriov_set_exec_quantum_ms(pf_fd, vf, gt, p->exec_quantum_ms);
-			xe_sriov_set_preempt_timeout_us(pf_fd, vf, gt, p->preempt_timeout_us);
+		for (vf = 0; vf <= num_vfs; ++vf) {
+			ret = __xe_sriov_set_exec_quantum_ms(pf_fd, vf, gt,
+							     p->exec_quantum_ms);
+			if (igt_warn_on_f(ret,
+					  "Failed to set exec_quantum_ms=%u (VF%d GT%u): %d\n",
+					  p->exec_quantum_ms, vf, gt, ret))
+				return ret;
+
+			ret = __xe_sriov_set_preempt_timeout_us(pf_fd, vf, gt,
+								p->preempt_timeout_us);
+			if (igt_warn_on_f(ret,
+					  "Failed to set preempt_timeout_us=%u (VF%d GT%u): %d\n",
+					  p->preempt_timeout_us, vf, gt, ret))
+				return ret;
 		}
 	}
+	return 0;
+}
+
+static void set_vfs_scheduling_params(int pf_fd, int num_vfs,
+				      const struct vf_sched_params *p)
+{
+	igt_assert_eq(0, __set_vfs_scheduling_params(pf_fd, num_vfs, p));
 }
 
 static bool check_within_epsilon(const double x, const double ref, const double tol)
@@ -729,7 +748,7 @@ static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opt
 
 	/* cleanup */
 	subm_set_fini(set);
-	set_vfs_scheduling_params(pf_fd, num_vfs, &(struct vf_sched_params){});
+	__set_vfs_scheduling_params(pf_fd, num_vfs, &(struct vf_sched_params){});
 	xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
 }
 
@@ -815,7 +834,7 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
 
 	/* cleanup */
 	subm_set_fini(set);
-	set_vfs_scheduling_params(pf_fd, num_vfs, &(struct vf_sched_params){});
+	__set_vfs_scheduling_params(pf_fd, num_vfs, &(struct vf_sched_params){});
 	xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
 }
 
@@ -923,8 +942,10 @@ int igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
 	}
 
 	igt_fixture() {
-		set_vfs_scheduling_params(pf_fd, igt_sriov_get_total_vfs(pf_fd),
-					  &(struct vf_sched_params){});
+		int ret;
+
+		ret = __set_vfs_scheduling_params(pf_fd, igt_sriov_get_total_vfs(pf_fd),
+						  &(struct vf_sched_params){});
 		xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
 		/* abort to avoid execution of next tests with enabled VFs */
 		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0,
@@ -933,6 +954,8 @@ int igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
 			    igt_sriov_disable_driver_autoprobe(pf_fd);
 		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
 			       "Failed to restore sriov_drivers_autoprobe value\n");
+		igt_abort_on_f(ret,
+			       "Failed to restore scheduling params\n");
 		drm_close_driver(pf_fd);
 	}
 }
-- 
2.43.0

