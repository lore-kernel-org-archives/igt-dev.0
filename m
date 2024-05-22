Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81A9C25B77
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 10:35:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC9A10ECC7;
	Wed, 22 May 2024 10:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f2J+xytr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A01D310EE59
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 10:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716374148; x=1747910148;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rrKRHfD4z1liZ3DPTV+xjaTCsBImkTiT62Lo1/fROzw=;
 b=f2J+xytrHQfW4Y3xsQ0O1YtNQhK8QttLW/uAeFr4SF76oNlT8pi4bvC4
 qvpifyYprCUcBosZZxW60jy8ZMhCilB7cc4MZmHwsiLRa69hR/2Yj1q58
 c3+ue254aNR5IWhMaLH88V0PtJc3DPvFrl6oZ0MdsuyDRQi3ArJhXoKqe
 vGMkYteSP+JBX0Z0TRq9zyFjJI92e9p1Sme1lJPOT0oR4Kd11Q/YH/O+W
 o8rHaXoaH13Ywca0ZmR9PUSUR8nLI943VG7Gi7Mr4R87QWxWQVR81a4E3
 9GXBfmUA2ELKDImbjlLUSBupcmf0x/nfDmqBB+KhNEqpBFw8jorvT0R9b Q==;
X-CSE-ConnectionGUID: 7mKVd7xtQ0S2C6dVBBDHLQ==
X-CSE-MsgGUID: 8ijFPmA1Q/KS8GiURKbE4A==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="24029231"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="24029231"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:35:48 -0700
X-CSE-ConnectionGUID: gv2+FOFoSHSN2hZsyoTHmg==
X-CSE-MsgGUID: uZwVrESNQWKG0A87c//dZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="37827670"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.230])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:35:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 05/10] lib: sync i915_pciids.h with kernel commit
 aa3d586e1624
Date: Wed, 22 May 2024 13:35:18 +0300
Message-Id: <797d91530e671719fc5aa311ff9f5920ee0df67d.1716373923.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1716373923.git.jani.nikula@intel.com>
References: <cover.1716373923.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Synchronize i915_pciids.h with kernel commit:

aa3d586e1624 ("drm/i915/pciids: don't include WHL/CML PCI IDs in CFL")

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/i915_pciids.h | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
index 16778d92346b..0c5a20d59801 100644
--- a/lib/i915_pciids.h
+++ b/lib/i915_pciids.h
@@ -488,6 +488,12 @@
 	INTEL_VGA_DEVICE(0x9BCA, info), \
 	INTEL_VGA_DEVICE(0x9BCC, info)
 
+#define INTEL_CML_IDS(info) \
+	INTEL_CML_GT1_IDS(info), \
+	INTEL_CML_GT2_IDS(info), \
+	INTEL_CML_U_GT1_IDS(info), \
+	INTEL_CML_U_GT2_IDS(info)
+
 #define INTEL_KBL_IDS(info) \
 	INTEL_KBL_GT1_IDS(info), \
 	INTEL_KBL_GT2_IDS(info), \
@@ -527,6 +533,15 @@
 	INTEL_VGA_DEVICE(0x3EA7, info), /* ULT GT3 */ \
 	INTEL_VGA_DEVICE(0x3EA8, info)  /* ULT GT3 */
 
+#define INTEL_CFL_IDS(info)	   \
+	INTEL_CFL_S_GT1_IDS(info), \
+	INTEL_CFL_S_GT2_IDS(info), \
+	INTEL_CFL_H_GT1_IDS(info), \
+	INTEL_CFL_H_GT2_IDS(info), \
+	INTEL_CFL_U_GT2_IDS(info), \
+	INTEL_CFL_U_GT3_IDS(info), \
+	INTEL_AML_CFL_GT2_IDS(info)
+
 /* WHL/CFL U GT1 */
 #define INTEL_WHL_U_GT1_IDS(info) \
 	INTEL_VGA_DEVICE(0x3EA1, info), \
@@ -541,21 +556,10 @@
 #define INTEL_WHL_U_GT3_IDS(info) \
 	INTEL_VGA_DEVICE(0x3EA2, info)
 
-#define INTEL_CFL_IDS(info)	   \
-	INTEL_CFL_S_GT1_IDS(info), \
-	INTEL_CFL_S_GT2_IDS(info), \
-	INTEL_CFL_H_GT1_IDS(info), \
-	INTEL_CFL_H_GT2_IDS(info), \
-	INTEL_CFL_U_GT2_IDS(info), \
-	INTEL_CFL_U_GT3_IDS(info), \
+#define INTEL_WHL_IDS(info) \
 	INTEL_WHL_U_GT1_IDS(info), \
 	INTEL_WHL_U_GT2_IDS(info), \
-	INTEL_WHL_U_GT3_IDS(info), \
-	INTEL_AML_CFL_GT2_IDS(info), \
-	INTEL_CML_GT1_IDS(info), \
-	INTEL_CML_GT2_IDS(info), \
-	INTEL_CML_U_GT1_IDS(info), \
-	INTEL_CML_U_GT2_IDS(info)
+	INTEL_WHL_U_GT3_IDS(info)
 
 /* CNL */
 #define INTEL_CNL_PORT_F_IDS(info) \
-- 
2.39.2

