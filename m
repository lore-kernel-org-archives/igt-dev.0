Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DC9C0218A
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jan 2025 00:32:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A2710E03A;
	Wed, 29 Jan 2025 00:32:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TqGstGlK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 128D510E03A
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2025 00:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738110720; x=1769646720;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P5C1Yg6upeSxj89v2KW42ue7x566h/fK73sXgkr8OT8=;
 b=TqGstGlKcd4R6y+HZCrHXusDHNKknB7zpnT8ZxeQy/3dLJ+Rd5BPhsAC
 wOYV4Kwx+D+nLj92i3G07OhmVGkS3WqAcCjIe3Uink+dXGzQgr0uZ9y7D
 vgFgDBqBpVVEWDGzfoeXZWjSM7v0v7yD+BYe3pSIo9zaF5FJl3KD3mQzg
 p3HZ8x+76F9NQ89M1aiq8IpMi+bZweKuli2yWd3WQq5gpD73lYfucnek4
 LOfHi7TOWIWepoCfuNwEzDMhRwGKgSnIUrL2OHg5UedEfEM9r4pbNbh4K
 yqUaTRVIVWjf0n0vTK0fmKmvTPBEEQJXzmhaDgzDFaEpCh0CpTfU4JqbG Q==;
X-CSE-ConnectionGUID: vgS3qkkSTpeCAQdTKMwNUg==
X-CSE-MsgGUID: QzzafcWlTASinSxh9JmswQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="49597558"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="49597558"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 16:32:00 -0800
X-CSE-ConnectionGUID: AwTA9PboQMe4v0nAYXvKqQ==
X-CSE-MsgGUID: O+NAzaKlTPm1P0QZDtbovA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="113887855"
Received: from msatwood-mobl.amr.corp.intel.com (HELO msatwood-mobl.intel.com)
 ([10.125.108.49])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 16:32:01 -0800
From: Matt Atwood <matthew.s.atwood@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH] lib: sync intel PCI ID macros with kernel
Date: Tue, 28 Jan 2025 16:31:55 -0800
Message-ID: <20250129003155.91475-1-matthew.s.atwood@intel.com>
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

lib: sync PCI ID macros with kernel

Sync with kernel commit:
16016ade13f6 ("drm/xe/ptl: Update the PTL pci id table")

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 lib/pciids.h | 73 ++++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 53 insertions(+), 20 deletions(-)

diff --git a/lib/pciids.h b/lib/pciids.h
index 7883384ac..4736ea525 100644
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
@@ -817,19 +849,20 @@
 	MACRO__(0xE20B, ## __VA_ARGS__), \
 	MACRO__(0xE20C, ## __VA_ARGS__), \
 	MACRO__(0xE20D, ## __VA_ARGS__), \
-	MACRO__(0xE212, ## __VA_ARGS__)
+	MACRO__(0xE210, ## __VA_ARGS__), \
+	MACRO__(0xE212, ## __VA_ARGS__), \
+	MACRO__(0xE215, ## __VA_ARGS__), \
+	MACRO__(0xE216, ## __VA_ARGS__)
 
 /* PTL */
 #define INTEL_PTL_IDS(MACRO__, ...) \
 	MACRO__(0xB080, ## __VA_ARGS__), \
 	MACRO__(0xB081, ## __VA_ARGS__), \
 	MACRO__(0xB082, ## __VA_ARGS__), \
+	MACRO__(0xB083, ## __VA_ARGS__), \
+	MACRO__(0xB08F, ## __VA_ARGS__), \
 	MACRO__(0xB090, ## __VA_ARGS__), \
-	MACRO__(0xB091, ## __VA_ARGS__), \
-	MACRO__(0xB092, ## __VA_ARGS__), \
 	MACRO__(0xB0A0, ## __VA_ARGS__), \
-	MACRO__(0xB0A1, ## __VA_ARGS__), \
-	MACRO__(0xB0A2, ## __VA_ARGS__), \
 	MACRO__(0xB0B0, ## __VA_ARGS__)
 
 #endif /* __PCIIDS_H__ */
-- 
2.45.0

