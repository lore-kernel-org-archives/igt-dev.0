Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B9ACFD37F
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 10:23:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A05010E39F;
	Tue, 25 Nov 2025 10:23:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lz8p7vZJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5E810E39F
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Nov 2025 10:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764066238; x=1795602238;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MADUXc//nMTgLogn4sr9j1OguC1ShH7IjG4oy9AOZGk=;
 b=Lz8p7vZJaWbbP6u8jibVNxSZByueNRHIkz85fRRNzbKos1IiPQhy7oQo
 c/MiDVOMPYOjVao64aS6Y/6Ye8HHPvReBLK32KkFqh6DE3sfKIC99jmwe
 mPkw3Ab6gGFwO5HT21OWy7S0m/yyqkZkS2B7GJBUOG9LIQUq0yquuhHFn
 PofdET6jYhGrkFt5/MpA/RAtiJL9XZpDjMnElw+LWZnkTu1EGMMvkXSKF
 xUUM96SIvhx9H+mfg52FKVDVqAUcbRz2lrT7Cs8RGTGLAGanJ3BNhj8Z8
 FNUoDCXdG5uP+wVGPQDjEAhbG8qPDgN3fInnt3Pi/izd51fvilZy4sKLE A==;
X-CSE-ConnectionGUID: p3DHy/wySly4+zM11IFMTg==
X-CSE-MsgGUID: xwRSn7dWToykMqjcQhqJuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65968445"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="65968445"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 02:23:58 -0800
X-CSE-ConnectionGUID: mSh2fPk2Rc+0DiUZ+jSb9A==
X-CSE-MsgGUID: 79AXplhAS4eET4aFbMm5Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="192235401"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.102])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 02:23:56 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com, michal.wajdeczko@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t v2 08/10] tests/intel/xe_sriov_scheduling: Prefer SR-IOV
 admin sysfs accessors
Date: Tue, 25 Nov 2025 11:23:07 +0100
Message-ID: <20251125102312.43142-9-marcin.bernatowicz@linux.intel.com>
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

Use SR-IOV admin sysfs setters for scheduling parameters,
skip if sriov_admin sysfs not available.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: Switch to SR-IOV sysfs setters (Michal)
---
---
 tests/intel/xe_sriov_scheduling.c | 38 ++++++++++++++-----------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
index 3a0c0d438..491d2eb0a 100644
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
+	ret = __xe_sriov_bulk_set_exec_quantum_ms(pf_fd, p->exec_quantum_ms);
+	if (igt_warn_on_f(ret,
+			  "Failed to bulk set exec quantum=%u: %d\n",
+			  p->exec_quantum_ms, ret))
+		return ret;
+
+	ret = __xe_sriov_bulk_set_preempt_timeout_us(pf_fd, p->preempt_timeout_us);
+	if (igt_warn_on_f(ret,
+			  "Failed to bulk set preempt timeout=%u: %d\n",
+			  p->preempt_timeout_us, ret))
+		return ret;
+
+	return ret;
 }
 
 static void set_vfs_scheduling_params(int pf_fd, int num_vfs,
@@ -912,6 +907,7 @@ igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
 		pf_fd = drm_open_driver(DRIVER_XE);
 		igt_require(igt_sriov_is_pf(pf_fd));
 		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
+		igt_require(xe_sriov_admin_is_present(pf_fd));
 		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
 		xe_sriov_require_default_scheduling_attributes(pf_fd);
 	}
-- 
2.43.0

