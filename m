Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7897AC47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 20:09:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D1910F318;
	Wed, 27 Mar 2024 20:09:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IUfkk7aS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF4210F318
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 20:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711570147; x=1743106147;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8fOVPNEhiM0piVD7uAqTnqOW0p/OZ0BnieENod+TiYM=;
 b=IUfkk7aS/S5Rl2QyRcqYX6tvaV2hExwYvJ7M8XD2Ys+eXSBcksfbpsiR
 LDlFgT6T3qAIHN4APD1kDCAez9nww/+zhGdVGOMcKYz4/h5JY9pRuWTno
 w8rcuAse0hlHzDILDm/sFcPcJpguJMF+MLE+XunmtLKUSlP1EAB4yiq2i
 Hzy70V2DJgbOQRvaxxAl8uqVvW1mn00EAYDkQuaswatlQFmI6Lv1scYy7
 j2o1shqjQvoeJJ1fkiWpub9zwIBpVMQHPMnf1GGCGegG6v0icOnsm3cny
 089WVb1KUwZWWEbi0benfa3n5OWKOLDb0KYrA5eeDzk5sRZtCV5jvC0Pu Q==;
X-CSE-ConnectionGUID: YXnyMYS1QFGN4dIf1cDqiw==
X-CSE-MsgGUID: iqgnV1cHTUi5SVDgiqA+1w==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="24190157"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="24190157"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 13:09:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="21074931"
Received: from rvodapal-desk.iind.intel.com ([10.145.162.163])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 13:09:03 -0700
From: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: balasubramani.vivekanandan@intel.com, matthew.d.roper@intel.com,
 lucas.demarchi@intel.com, gustavo.sousa@intel.com,
 radhakrishna.sripada@intel.com, clinton.a.taylor@intel.com,
 matthew.s.atwood@intel.com, dnyaneshwar.bhadane@intel.com,
 haridhar.kalvala@intel.com, shekhar.chauhan@intel.com
Subject: [PATCH] lib: sync i915_pciids.h with kernel
Date: Thu, 28 Mar 2024 01:42:32 +0530
Message-Id: <20240327201232.3910334-1-ravi.kumar.vodapalli@intel.com>
X-Mailer: git-send-email 2.25.1
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

This synchronizes with kernel commit
	2bcf0f9bb33d ("drm/i915: Add new PCI IDs to DG2 platform in driver")

Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
---
 lib/i915_pciids.h | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
index fcf1849aa..85ce33ad6 100644
--- a/lib/i915_pciids.h
+++ b/lib/i915_pciids.h
@@ -672,7 +672,9 @@
 #define INTEL_ADLN_IDS(info) \
 	INTEL_VGA_DEVICE(0x46D0, info), \
 	INTEL_VGA_DEVICE(0x46D1, info), \
-	INTEL_VGA_DEVICE(0x46D2, info)
+	INTEL_VGA_DEVICE(0x46D2, info), \
+	INTEL_VGA_DEVICE(0x46D3, info), \
+	INTEL_VGA_DEVICE(0x46D4, info)
 
 /* RPL-S */
 #define INTEL_RPLS_IDS(info) \
@@ -709,7 +711,9 @@
 	INTEL_VGA_DEVICE(0x5692, info), \
 	INTEL_VGA_DEVICE(0x56A0, info), \
 	INTEL_VGA_DEVICE(0x56A1, info), \
-	INTEL_VGA_DEVICE(0x56A2, info)
+	INTEL_VGA_DEVICE(0x56A2, info), \
+	INTEL_VGA_DEVICE(0x56BE, info), \
+	INTEL_VGA_DEVICE(0x56BF, info)
 
 #define INTEL_DG2_G11_IDS(info) \
 	INTEL_VGA_DEVICE(0x5693, info), \
@@ -751,10 +755,13 @@
 /* MTL */
 #define INTEL_MTL_IDS(info) \
 	INTEL_VGA_DEVICE(0x7D40, info), \
+	INTEL_VGA_DEVICE(0x7D41, info), \
 	INTEL_VGA_DEVICE(0x7D45, info), \
+	INTEL_VGA_DEVICE(0x7D51, info), \
 	INTEL_VGA_DEVICE(0x7D55, info), \
 	INTEL_VGA_DEVICE(0x7D60, info), \
 	INTEL_VGA_DEVICE(0x7D67, info), \
+	INTEL_VGA_DEVICE(0x7DD1, info), \
 	INTEL_VGA_DEVICE(0x7DD5, info)
 
 #endif /* _I915_PCIIDS_H */
-- 
2.25.1

