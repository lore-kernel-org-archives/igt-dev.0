Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EA7D46BEB
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 18:09:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB1C10E2D9;
	Wed, 28 Jan 2026 18:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z919Qy6W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 784AD10E752
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 18:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769623754; x=1801159754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9EO1CzelTIm1wniRuc3NUmKtPSs/55sXBnUexQpI+RU=;
 b=Z919Qy6WU16Ea0ZSjIc/70TQJl1nAQmu4WQXetvsVFE91jP/q7OiXFpJ
 6p2efwvDU58Nm7z7i/R3T5po9mD64ln4jOunh1i30mcslmmiEbVSi1xER
 HHMlt7zYVEICnCQA+weBKyzbMuJfX+XO/fy7V0dr1yt6gNYsoPz53m5hx
 UdSis7gxGRontdsvFFuiYvttbfcWn7a2DeiHcE0zlqOMjn7L4qusON5K2
 jpMO5xa0dNTNq1PJFE6H5yh/Amg9AjDNN/80oQQc+oWQU3Eo2CxuIpC+I
 XAJzQDG6GwOaN2PhYRElHNsnwSj88ZkGHV5F/4v/KA7FBHwSxQmnkyq4r A==;
X-CSE-ConnectionGUID: lGZx2KEHTTSxmPY7z9Or3A==
X-CSE-MsgGUID: OTUGSCS9Qz+zZXt6ks7hsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70819951"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="70819951"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 10:09:14 -0800
X-CSE-ConnectionGUID: udNEcHNWSY+VMDsHEKNqFA==
X-CSE-MsgGUID: xHEIYfewQ3WLYdQbJJ4fow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="208575171"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.71])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 10:09:12 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com, michal.wajdeczko@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v3 i-g-t 08/10] tests/intel/xe_sriov_scheduling: Prefer SR-IOV
 admin sysfs accessors
Date: Wed, 28 Jan 2026 19:08:14 +0100
Message-ID: <20260128180819.1373376-9-marcin.bernatowicz@linux.intel.com>
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

Use SR-IOV admin sysfs setters for scheduling parameters,
skip if sriov_admin sysfs not available.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

---
v2:
- Adjust to renamed __xe_sriov_admin_* helpers

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/intel/xe_sriov_scheduling.c | 38 ++++++++++++++-----------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
index 117737d5f..4228eea2d 100644
--- a/tests/intel/xe_sriov_scheduling.c
+++ b/tests/intel/xe_sriov_scheduling.c
@@ -9,6 +9,7 @@
 #include "xe_drm.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_spin.h"
+#include "xe/xe_sriov_admin.h"
 #include "xe/xe_sriov_provisioning.h"
 
 /**
@@ -374,27 +375,21 @@ struct vf_sched_params {
 static int __set_vfs_scheduling_params(int pf_fd, int num_vfs,
 				       const struct vf_sched_params *p)
 {
-	unsigned int gt;
-	int vf, ret;
-
-	xe_for_each_gt(pf_fd, gt) {
-		for (vf = 0; vf <= num_vfs; ++vf) {
-			ret = __xe_sriov_set_exec_quantum_ms(pf_fd, vf, gt,
-							     p->exec_quantum_ms);
-			if (igt_warn_on_f(ret,
-					  "Failed to set exec_quantum_ms=%u (VF%d GT%u): %d\n",
-					  p->exec_quantum_ms, vf, gt, ret))
-				return ret;
-
-			ret = __xe_sriov_set_preempt_timeout_us(pf_fd, vf, gt,
-								p->preempt_timeout_us);
-			if (igt_warn_on_f(ret,
-					  "Failed to set preempt_timeout_us=%u (VF%d GT%u): %d\n",
-					  p->preempt_timeout_us, vf, gt, ret))
-				return ret;
-		}
-	}
-	return 0;
+	int ret = 0;
+
+	ret = __xe_sriov_admin_bulk_set_exec_quantum_ms(pf_fd, p->exec_quantum_ms);
+	if (igt_warn_on_f(ret,
+			  "Failed to bulk set exec quantum=%u: %d\n",
+			  p->exec_quantum_ms, ret))
+		return ret;
+
+	ret = __xe_sriov_admin_bulk_set_preempt_timeout_us(pf_fd, p->preempt_timeout_us);
+	if (igt_warn_on_f(ret,
+			  "Failed to bulk set preempt timeout=%u: %d\n",
+			  p->preempt_timeout_us, ret))
+		return ret;
+
+	return ret;
 }
 
 static void set_vfs_scheduling_params(int pf_fd, int num_vfs,
@@ -912,6 +907,7 @@ int igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
 		pf_fd = drm_open_driver(DRIVER_XE);
 		igt_require(igt_sriov_is_pf(pf_fd));
 		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
+		igt_require(xe_sriov_admin_is_present(pf_fd));
 		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
 		xe_sriov_require_default_scheduling_attributes(pf_fd);
 	}
-- 
2.43.0

