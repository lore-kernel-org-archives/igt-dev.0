Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3058C5DF7D
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 12:41:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 700F610E4C3;
	Tue, 18 Aug 2026 12:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ulev3Ybd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0319B10E3EB
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 12:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787056790; x=1818592790;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JhXLH28Xupuzkw8HEvQkNm8XjZ/U3Y3HUqIUz3aCSYE=;
 b=Ulev3Ybdc/cxXj3Mv3tea4pzrgngJ8b7H3dU53SbhHJvm8B+edTd4GUr
 /GftVYKDx47Y4rHYePp6jpwMujyoTb4AqPj+f4llRtYyFmW3bX8CtmxRT
 7L7fB6TJCD585P4XaOx88xLbsD0Upex5EMf6qvdAo/6bhnq1Z3jRjjQZh
 uxIwWIvgQTVMlCMrAmIp1VTBcUIZmRateMT2C6wsN+qPAXjdDgd4snc8O
 ekPFYeoCI39koQRniWVDdtyco78Gdse1U4BCQC1PNW5x4TNHK8hM0lPZr
 IKZX2DKGbtI/B59EaVrOXjcsyXIt2D3FN0Wsr9EwFibn61VAjNVYnZPHm w==;
X-CSE-ConnectionGUID: nC+vOT41TbG7OyGcWpJnNA==
X-CSE-MsgGUID: vBFOqWrARFatbjkhrQrRyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98910945"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="98910945"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 05:39:50 -0700
X-CSE-ConnectionGUID: Ceb6dLKwRnSncS1UVom+Eg==
X-CSE-MsgGUID: J0KOku54RjK0aYe1Hupv6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="263886567"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.106])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 05:39:47 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH i-g-t 3/6] lib/xe/xe_sriov_admin: Lower priority before
 clearing timeslicing
Date: Tue, 18 Aug 2026 14:39:27 +0200
Message-ID: <19f3ef4174e856a83b6915dc19e09da4bab90a5a.1787056235.git.marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787056235.git.marcin.bernatowicz@linux.intel.com>
References: <cover.1787056235.git.marcin.bernatowicz@linux.intel.com>
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

Zero execution quantum and zero preemption timeout both mean infinity.
A function left at a scheduling priority above LOW with infinite
timeslicing may never be switched away from by GuC, which is a risky
state that can be left via PAUSE/FLR.

The restore helpers cleared execution quantum and preemption timeout
first and only then dropped priority to LOW, transiting through exactly
that state whenever a test had raised priority. This is reachable from
xe_pmu, which restores defaults while VFs are still enabled, and from
xe_sriov_admin_exit_cleanup_restore_sched_defaults() on abort or signal.

Lower priority first, then clear execution quantum and preemption timeout.

Assisted-by: Copilot:Claude-Opus-5
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 lib/xe/xe_sriov_admin.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/lib/xe/xe_sriov_admin.c b/lib/xe/xe_sriov_admin.c
index b03e77b08..0433ddcfc 100644
--- a/lib/xe/xe_sriov_admin.c
+++ b/lib/xe/xe_sriov_admin.c
@@ -547,6 +547,11 @@ void xe_sriov_admin_vf_stop(int pf_fd, unsigned int vf_num)
  *
  * Resets execution quantum, preemption timeout, and priority to driver defaults.
  *
+ * Zero execution quantum and zero preemption timeout both mean infinity, so
+ * priority is lowered first. A function left at a priority above LOW with
+ * infinite timeslicing may never be switched away from by GuC, and can only be
+ * recovered by PAUSE/FLR.
+ *
  * Returns: 0 on success or negative errno on error.
  */
 int __xe_sriov_admin_restore_sched_defaults(int pf_fd, unsigned int vf_num)
@@ -554,6 +559,12 @@ int __xe_sriov_admin_restore_sched_defaults(int pf_fd, unsigned int vf_num)
 	int ret_eq, ret_pt, ret_prio;
 	int ret = 0;
 
+	ret_prio = __xe_sriov_admin_set_sched_priority(pf_fd, vf_num,
+						       XE_SRIOV_SCHED_PRIORITY_LOW);
+	igt_warn_on(ret_prio);
+	if (!ret)
+		ret = ret_prio;
+
 	ret_eq = __xe_sriov_admin_set_exec_quantum_ms(pf_fd, vf_num, 0);
 	igt_warn_on(ret_eq);
 	if (!ret)
@@ -564,12 +575,6 @@ int __xe_sriov_admin_restore_sched_defaults(int pf_fd, unsigned int vf_num)
 	if (!ret)
 		ret = ret_pt;
 
-	ret_prio = __xe_sriov_admin_set_sched_priority(pf_fd, vf_num,
-						       XE_SRIOV_SCHED_PRIORITY_LOW);
-	igt_warn_on(ret_prio);
-	if (!ret)
-		ret = ret_prio;
-
 	return ret;
 }
 
@@ -589,6 +594,9 @@ void xe_sriov_admin_restore_sched_defaults(int pf_fd, unsigned int vf_num)
  *
  * Resets PF and all VFs to driver default scheduling parameters.
  *
+ * Priority is lowered before clearing timeslicing, see
+ * __xe_sriov_admin_restore_sched_defaults().
+ *
  * Returns: 0 on success or negative errno on error.
  */
 int __xe_sriov_admin_bulk_restore_sched_defaults(int pf_fd)
@@ -596,6 +604,12 @@ int __xe_sriov_admin_bulk_restore_sched_defaults(int pf_fd)
 	int ret_eq, ret_pt, ret_prio;
 	int ret = 0;
 
+	ret_prio = __xe_sriov_admin_bulk_set_sched_priority(pf_fd,
+							    XE_SRIOV_SCHED_PRIORITY_LOW);
+	igt_warn_on(ret_prio);
+	if (!ret)
+		ret = ret_prio;
+
 	ret_eq = __xe_sriov_admin_bulk_set_exec_quantum_ms(pf_fd, 0);
 	igt_warn_on(ret_eq);
 	if (!ret)
@@ -606,12 +620,6 @@ int __xe_sriov_admin_bulk_restore_sched_defaults(int pf_fd)
 	if (!ret)
 		ret = ret_pt;
 
-	ret_prio = __xe_sriov_admin_bulk_set_sched_priority(pf_fd,
-							    XE_SRIOV_SCHED_PRIORITY_LOW);
-	igt_warn_on(ret_prio);
-	if (!ret)
-		ret = ret_prio;
-
 	return ret;
 }
 
-- 
2.43.0

