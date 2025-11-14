Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD58CE8D79
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 19:08:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6608F10EAE6;
	Fri, 14 Nov 2025 19:08:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e2YwXksT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E80610EAE6
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Nov 2025 19:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763147318; x=1794683318;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+FoIqylJv8DJF3iF2z+6Xv/HoJWC4+EUmGKBsLw+VpE=;
 b=e2YwXksT8SfAW0y5y/JLvjUWmL+fcjCZ/3iP2luV52IJV4QiXH0XeUhI
 PXUA9O4qKVUry277oEAqQc6yMxyQ6r6XG4Qf7q1j8HYCvbsSbJuFq2olY
 6zRbK/cGRU3mOWRTwkYCwe+5WWi53PTWUWd1IwkKp8cRG/cc2bfN9OfCO
 W8c6h2cSOUggH4MWy3o/hK0LZDxu4qR8JIUclNlKriJhs9FmBHhuUd8wG
 JrDQeXPoFdbTKfX9IT8sEkwG0FAfynhsHUVnCssJRp7EkWclGrTtFT4Df
 LokSJ9O7G3qc61zE0Gk+lB9sqvxMOKe4JNbUo7LPB12qXhaMm4wA3AfGf g==;
X-CSE-ConnectionGUID: 2FFmHMuTREaTSHwRy3d51Q==
X-CSE-MsgGUID: ynS1UrD2Rju5HdFD2XydFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="76593012"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="76593012"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 11:08:37 -0800
X-CSE-ConnectionGUID: rcld2s2MQjqi2mxv/jJwUA==
X-CSE-MsgGUID: z2fKh5k5S6aBwZylqQedFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="190104309"
Received: from mkrakus-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.23.186])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 11:08:36 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com, michal.wajdeczko@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 5/5] tests/intel/xe_sriov_scheduling: Prefer SR-IOV
 admin sysfs accessors
Date: Fri, 14 Nov 2025 20:07:55 +0100
Message-ID: <20251114190757.2295174-6-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114190757.2295174-1-marcin.bernatowicz@linux.intel.com>
References: <20251114190757.2295174-1-marcin.bernatowicz@linux.intel.com>
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

Use SR-IOV admin bulk setters for scheduling parameters when present,
falling back to debugfs attributes.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 tests/intel/xe_sriov_scheduling.c | 55 ++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 19 deletions(-)

diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
index 3a0c0d438..1e5e19334 100644
--- a/tests/intel/xe_sriov_scheduling.c
+++ b/tests/intel/xe_sriov_scheduling.c
@@ -9,6 +9,7 @@
 #include "xe_drm.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_spin.h"
+#include "xe/xe_sriov_admin.h"
 #include "xe/xe_sriov_provisioning.h"
 
 /**
@@ -374,27 +375,43 @@ struct vf_sched_params {
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
+	int ret = 0;
+
+	if (xe_sriov_admin_is_present(pf_fd)) {
+		ret = __xe_sriov_bulk_set_exec_quantum_ms(pf_fd, p->exec_quantum_ms);
+		if (igt_warn_on_f(ret,
+				  "Failed to bulk set exec quantum=%u: %d\n",
+				  p->exec_quantum_ms, ret))
+			return ret;
+
+		ret = __xe_sriov_bulk_set_preempt_timeout_us(pf_fd, p->preempt_timeout_us);
+		if (igt_warn_on_f(ret,
+				  "Failed to bulk set preempt timeout=%u: %d\n",
+				  p->preempt_timeout_us, ret))
+			return ret;
+	} else {
+		unsigned int gt;
+
+		xe_for_each_gt(pf_fd, gt) {
+			for (int vf = 0; vf <= num_vfs; ++vf) {
+				ret = __xe_sriov_set_exec_quantum_ms(pf_fd, vf, gt,
+								     p->exec_quantum_ms);
+				if (igt_warn_on_f(ret,
+						  "Failed to set exec quantum=%u (VF%d GT%u): %d\n",
+						  p->exec_quantum_ms, vf, gt, ret))
+					return ret;
+
+				ret = __xe_sriov_set_preempt_timeout_us(pf_fd, vf, gt,
+									p->preempt_timeout_us);
+				if (igt_warn_on_f(ret,
+						  "Failed to set preempt timeout=%u (VF%d GT%u): %d\n",
+						  p->preempt_timeout_us, vf, gt, ret))
+					return ret;
+			}
 		}
 	}
-	return 0;
+
+	return ret;
 }
 
 static void set_vfs_scheduling_params(int pf_fd, int num_vfs,
-- 
2.43.0

