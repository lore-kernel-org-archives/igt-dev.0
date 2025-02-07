Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D158C02194
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 00:14:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1BC910E9BE;
	Fri,  7 Feb 2025 00:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R0NmaibF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFAB510E9BE
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 00:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738887278; x=1770423278;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DJrFAKASPrcTn7ZMrMWnWCREDoe36awvC0Vd1LTCJTU=;
 b=R0NmaibFXJm9/aIZ7GrSvicSCpcGW0q5hN/NfJCGxeXGB+CR1TXqWFg2
 ZhKloe7CiW5hlHRO19h/xPKHtUAbiv20w1VfNKtKvNBPgJwC23pfn9evQ
 x8WeJ7Cmaw0KeaBrXqE9/siJTJyAbWTqP9/ICKbctCQ8U409D0ClXwRN+
 h2/a6D9GE0UCOYHr0w0hBJW/rAMLonVb/rgUKWpRc/97YUBiOL+DNGAvs
 nhs/Xnv4UP99VC9/CRgHxO23qVFP3Gr42ZDRBQhQcSBmipl/pstoGxmfx
 qFgB8JtKnrJp8MlN6RoIn8NMzDKMEEnePB9/Yj6OWwQAvXPbV1tL+BFEH g==;
X-CSE-ConnectionGUID: O/kgJTkUTeqGgWV2VTCtUQ==
X-CSE-MsgGUID: xk4GkVRHR2OLPpwlRpPlag==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="27124677"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; d="scan'208";a="27124677"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 16:14:37 -0800
X-CSE-ConnectionGUID: mnyTAAjuTKOGaas9ChiUYg==
X-CSE-MsgGUID: ATNmmHmAT02XDcFTpS9oLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="142244320"
Received: from msatwood-mobl.amr.corp.intel.com (HELO
 msatwood-mobl.hsd1.or.comcast.net) ([10.125.111.2])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 16:14:37 -0800
From: Matt Atwood <matthew.s.atwood@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, matthew.d.roper@intel.com,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH v2] lib/pciids: Sync pci id changes for DG2/MTL/BMG/PTL
Date: Thu,  6 Feb 2025 16:14:32 -0800
Message-ID: <20250207001432.48524-1-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.45.0
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

There have been several changes to pciids upstream that need to be
sync'd into igt. This synchronization is different from the normal
process because kernel history differences in drm-xe-next, and
drm-i915-next cause conflicts that create conflicts.

Sync with the following kernel commits:
f9a15b968dce ("drm/intel/pciids: Refactor DG2 PCI IDs into segment
ranges")
e35ecd95ecf2 ("drm/i915/display: Add MTL subplatforms definition")
fa8ffaae1b15 ("drm/xe/bmg: Add new PCI IDs")
16016ade13f6 ("drm/xe/ptl: Update the PTL pci id table")

v2: More verbose commit message

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/pciids.h | 62 +++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 47 insertions(+), 15 deletions(-)

diff --git a/lib/pciids.h b/lib/pciids.h
index 23f349f65..4736ea525 100644
--- a/lib/pciids.h
+++ b/lib/pciids.h
@@ -717,37 +717,66 @@
 	MACRO__(0xA7AB, ## __VA_ARGS__)
 
 /* DG2 */
-#define INTEL_DG2_G10_IDS(MACRO__, ...) \
-	MACRO__(0x5690, ## __VA_ARGS__), \
-	MACRO__(0x5691, ## __VA_ARGS__), \
-	MACRO__(0x5692, ## __VA_ARGS__), \
+#define INTEL_DG2_G10_D_IDS(MACRO__, ...) \
 	MACRO__(0x56A0, ## __VA_ARGS__), \
 	MACRO__(0x56A1, ## __VA_ARGS__), \
-	MACRO__(0x56A2, ## __VA_ARGS__), \
+	MACRO__(0x56A2, ## __VA_ARGS__)
+
+#define INTEL_DG2_G10_E_IDS(MACRO__, ...) \
 	MACRO__(0x56BE, ## __VA_ARGS__), \
 	MACRO__(0x56BF, ## __VA_ARGS__)
 
-#define INTEL_DG2_G11_IDS(MACRO__, ...) \
-	MACRO__(0x5693, ## __VA_ARGS__), \
-	MACRO__(0x5694, ## __VA_ARGS__), \
-	MACRO__(0x5695, ## __VA_ARGS__), \
+#define INTEL_DG2_G10_M_IDS(MACRO__, ...) \
+	MACRO__(0x5690, ## __VA_ARGS__), \
+	MACRO__(0x5691, ## __VA_ARGS__), \
+	MACRO__(0x5692, ## __VA_ARGS__)
+
+#define INTEL_DG2_G10_IDS(MACRO__, ...) \
+	INTEL_DG2_G10_D_IDS(MACRO__, ## __VA_ARGS__), \
+	INTEL_DG2_G10_E_IDS(MACRO__, ## __VA_ARGS__), \
+	INTEL_DG2_G10_M_IDS(MACRO__, ## __VA_ARGS__)
+
+#define INTEL_DG2_G11_D_IDS(MACRO__, ...) \
 	MACRO__(0x56A5, ## __VA_ARGS__), \
 	MACRO__(0x56A6, ## __VA_ARGS__), \
 	MACRO__(0x56B0, ## __VA_ARGS__), \
-	MACRO__(0x56B1, ## __VA_ARGS__), \
+	MACRO__(0x56B1, ## __VA_ARGS__)
+
+#define INTEL_DG2_G11_E_IDS(MACRO__, ...) \
 	MACRO__(0x56BA, ## __VA_ARGS__), \
 	MACRO__(0x56BB, ## __VA_ARGS__), \
 	MACRO__(0x56BC, ## __VA_ARGS__), \
 	MACRO__(0x56BD, ## __VA_ARGS__)
 
-#define INTEL_DG2_G12_IDS(MACRO__, ...) \
-	MACRO__(0x5696, ## __VA_ARGS__), \
-	MACRO__(0x5697, ## __VA_ARGS__), \
+#define INTEL_DG2_G11_M_IDS(MACRO__, ...) \
+	MACRO__(0x5693, ## __VA_ARGS__), \
+	MACRO__(0x5694, ## __VA_ARGS__), \
+	MACRO__(0x5695, ## __VA_ARGS__)
+
+#define INTEL_DG2_G11_IDS(MACRO__, ...) \
+	INTEL_DG2_G11_D_IDS(MACRO__, ## __VA_ARGS__), \
+	INTEL_DG2_G11_E_IDS(MACRO__, ## __VA_ARGS__), \
+	INTEL_DG2_G11_M_IDS(MACRO__, ## __VA_ARGS__)
+
+#define INTEL_DG2_G12_D_IDS(MACRO__, ...) \
 	MACRO__(0x56A3, ## __VA_ARGS__), \
 	MACRO__(0x56A4, ## __VA_ARGS__), \
 	MACRO__(0x56B2, ## __VA_ARGS__), \
 	MACRO__(0x56B3, ## __VA_ARGS__)
 
+#define INTEL_DG2_G12_M_IDS(MACRO__, ...) \
+	MACRO__(0x5696, ## __VA_ARGS__), \
+	MACRO__(0x5697, ## __VA_ARGS__)
+
+#define INTEL_DG2_G12_IDS(MACRO__, ...) \
+	INTEL_DG2_G12_D_IDS(MACRO__, ## __VA_ARGS__), \
+	INTEL_DG2_G12_M_IDS(MACRO__, ## __VA_ARGS__)
+
+#define INTEL_DG2_D_IDS(MACRO__, ...) \
+	INTEL_DG2_G10_D_IDS(MACRO__, ## __VA_ARGS__), \
+	INTEL_DG2_G11_D_IDS(MACRO__, ## __VA_ARGS__), \
+	INTEL_DG2_G12_D_IDS(MACRO__, ## __VA_ARGS__)
+
 #define INTEL_DG2_IDS(MACRO__, ...) \
 	INTEL_DG2_G10_IDS(MACRO__, ## __VA_ARGS__), \
 	INTEL_DG2_G11_IDS(MACRO__, ## __VA_ARGS__), \
@@ -782,9 +811,12 @@
 	INTEL_ARL_S_IDS(MACRO__, ## __VA_ARGS__)
 
 /* MTL */
-#define INTEL_MTL_IDS(MACRO__, ...) \
+#define INTEL_MTL_U_IDS(MACRO__, ...) \
 	MACRO__(0x7D40, ## __VA_ARGS__), \
-	MACRO__(0x7D45, ## __VA_ARGS__), \
+	MACRO__(0x7D45, ## __VA_ARGS__)
+
+#define INTEL_MTL_IDS(MACRO__, ...) \
+	INTEL_MTL_U_IDS(MACRO__, ## __VA_ARGS__), \
 	MACRO__(0x7D55, ## __VA_ARGS__), \
 	MACRO__(0x7D60, ## __VA_ARGS__), \
 	MACRO__(0x7DD5, ## __VA_ARGS__)
-- 
2.45.0

