Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C71CFD37F
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 10:23:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E00E10E3A7;
	Tue, 25 Nov 2025 10:23:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JGWaAIUC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D9A10E3A7
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Nov 2025 10:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764066234; x=1795602234;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=34M5XyEfbl92A/NVc+mX8tfu4UDyawbpD+jf+zcKPrU=;
 b=JGWaAIUCQpr7t+Z9y599TLs4Xo1e9k0gftOlPQ6Q+NaymNC2sEpY2Kps
 GmOfn89VN68kX8GkCU/ucsNH3FXbOLjOJsryaZZ3+fzqFMxpJg7hqVcxu
 o3hm6O9PZ+eqfYiawQ1HEaprllOkic6qz5/fkRnuZToRfVfgNyW4ZtRiz
 5dC0sgL3q6F7bsC/oBX/NF4BI5gpPnMPFYrhOI839VaFTCtMJbFFEYbyO
 bEt9oUfNOzrY0oLl0qZ8DkxpwL6eDd2Eb6iegtOsjNCOb0d1uz/2GE4zW
 6n3y/KOGeAHB/rNJWfjILmqE8p6IPMPCPzPQyJYcwszl9Wh6jbC7KBv4H A==;
X-CSE-ConnectionGUID: WOjNOMTgRFSP/CeDyEge1A==
X-CSE-MsgGUID: Gjo5xlpYQAyCSdJT7VXOtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65968439"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="65968439"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 02:23:54 -0800
X-CSE-ConnectionGUID: iPX/oIgtS6i5N5PV42ac1w==
X-CSE-MsgGUID: 8fhd5pjTRAegmjN04oe20Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="192235391"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.102])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 02:23:52 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com, michal.wajdeczko@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t v2 07/10] tests/intel/xe_sriov_scheduling: Avoid assert
 on scheduling params restore in cleanup
Date: Tue, 25 Nov 2025 11:23:06 +0100
Message-ID: <20251125102312.43142-8-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251125102312.43142-1-marcin.bernatowicz@linux.intel.com>
References: <20251125102312.43142-1-marcin.bernatowicz@linux.intel.com>
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
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_sriov_scheduling.c | 41 ++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 9 deletions(-)

diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
index 5e8c87755..3a0c0d438 100644
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
 
@@ -923,8 +942,10 @@ igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
 	}
 
 	igt_fixture {
-		set_vfs_scheduling_params(pf_fd, igt_sriov_get_total_vfs(pf_fd),
-					  &(struct vf_sched_params){});
+		int ret;
+
+		ret = __set_vfs_scheduling_params(pf_fd, igt_sriov_get_total_vfs(pf_fd),
+						  &(struct vf_sched_params){});
 		xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
 		/* abort to avoid execution of next tests with enabled VFs */
 		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0,
@@ -933,6 +954,8 @@ igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
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

