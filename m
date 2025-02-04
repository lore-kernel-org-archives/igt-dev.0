Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D830C02194
	for <igt-dev@archiver.kernel.org>; Tue,  4 Feb 2025 17:53:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B45F10E044;
	Tue,  4 Feb 2025 17:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PzRQqAWb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0927410E044
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Feb 2025 17:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738691587; x=1770227587;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KVlb2eU59sd7ojG9UndEO3WqwrtOk4sXUmi4IWZ+wpQ=;
 b=PzRQqAWbtS59ONb0xw4FPab8CRSPwJYRblxwyIZALGYKlZ1zCJX3xi7q
 3kUUh9LQO7J1rKInJ8jQRPELZGsKYgkjdsfQdy0eTd+kHQxDHTKJ4g46G
 2aeezarJ4lDQS58enbnZTp8SK4muKG1jzDMvVLxljSpSfOwKxewQhEH/a
 L3x5ihhOuu+6dovIc6YVSCAZcMRefF9dO11btBMR9yVeHnkwmNcPtcv9u
 IZNiVi5d/L1htvPffqWXMmXd+BaAIh7fXmBpy100GJIkQBGzI2l1Ha8zq
 BR7JMBWG/+4AimpSaufFZFx065rOhYzOjm7zMrXUVRA+hYGeV7zMQSpqn Q==;
X-CSE-ConnectionGUID: aUatccydRAKCQ9vaNiSuNg==
X-CSE-MsgGUID: TU5cCd8bRv+4nsnYTPvjsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="42071666"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="42071666"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 09:53:06 -0800
X-CSE-ConnectionGUID: C8y1hyeEQYC7cd3t2IfgaQ==
X-CSE-MsgGUID: dsMhaxf5Sjab3yyEszUU0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111096109"
Received: from msatwood-mobl.amr.corp.intel.com (HELO
 msatwood-mobl.hsd1.or.comcast.net) ([10.125.110.73])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 09:53:06 -0800
From: Matt Atwood <matthew.s.atwood@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com,
	Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH] lib/pciids: Sync pci id changes for DG2/MTL/BMG/PTL
Date: Tue,  4 Feb 2025 09:53:02 -0800
Message-ID: <20250204175302.18147-1-matthew.s.atwood@intel.com>
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
sync'd into igt.

Sync with the following kernel commits:
f9a15b968dce ("drm/intel/pciids: Refactor DG2 PCI IDs into segment
ranges")
e35ecd95ecf2 ("drm/i915/display: Add MTL subplatforms definition")
fa8ffaae1b15 ("drm/xe/bmg: Add new PCI IDs")
16016ade13f6 ("drm/xe/ptl: Update the PTL pci id table")

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
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

