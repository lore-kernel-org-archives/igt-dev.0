Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C738C47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 20:17:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42F710FFA2;
	Wed, 27 Mar 2024 20:17:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B/fSeHDy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F5310FFCC
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 20:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711570655; x=1743106655;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P4VrXhSR65ggQIv6oIYufD8BNbQnSY9hzvSQOKOt1Q8=;
 b=B/fSeHDyAjaGnVLfPbt7NEhOE1Txpp8qvoD6TJysHwG1QgOzxmLuQhXY
 FmuZituhpwPIWr9ZWVEYy2Hhylz7zbKGLfbSBXoyUKwMvZjsvn379dt3e
 AyPfmKVyokZ2k6vBlkvktYy9wepm4K3IEXqoQPy3evJYNAREYd5+FFq4m
 NyzgmeXcHJrSUbMna89oLggS188ZZQ/CncTRSaxAGGplYlxmE5m3eTrYi
 qgAbaMZgoNaiydiUA/UoI4T+lrluzcYrW5FkIW+Q/3XvY83n0vPv0A4Ls
 KDTvG4q7vKPrv4/QrSnVZ1fBPfVymW2t1qOgriFQgzjD274lrh93ZqPG4 g==;
X-CSE-ConnectionGUID: 6B8tt7q+SbShgIEun0xIsQ==
X-CSE-MsgGUID: aJ7poR9ZTV+wchfoPi8fEw==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="10490619"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="10490619"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 13:17:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="16249681"
Received: from rvodapal-desk.iind.intel.com ([10.145.162.163])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 13:17:29 -0700
From: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: balasubramani.vivekanandan@intel.com, matthew.d.roper@intel.com,
 lucas.demarchi@intel.com, gustavo.sousa@intel.com,
 radhakrishna.sripada@intel.com, clinton.a.taylor@intel.com,
 matthew.s.atwood@intel.com, dnyaneshwar.bhadane@intel.com,
 haridhar.kalvala@intel.com, shekhar.chauhan@intel.com
Subject: [PATCH] lib: sync xe_pciids.h with kernel
Date: Thu, 28 Mar 2024 01:51:00 +0530
Message-Id: <20240327202100.3910719-1-ravi.kumar.vodapalli@intel.com>
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
0bd25f78c4fc ("drm/xe: Add new PCI IDs to DG2 platform")

Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
---
 lib/xe_pciids.h | 72 +++++++++++++++++++++++--------------------------
 1 file changed, 34 insertions(+), 38 deletions(-)

diff --git a/lib/xe_pciids.h b/lib/xe_pciids.h
index 29f07a00a..c7fc288da 100644
--- a/lib/xe_pciids.h
+++ b/lib/xe_pciids.h
@@ -67,6 +67,7 @@
 	MACRO__(0x4682, ## __VA_ARGS__),	\
 	MACRO__(0x4688, ## __VA_ARGS__),	\
 	MACRO__(0x468A, ## __VA_ARGS__),	\
+	MACRO__(0x468B, ## __VA_ARGS__),	\
 	MACRO__(0x4690, ## __VA_ARGS__),	\
 	MACRO__(0x4692, ## __VA_ARGS__),	\
 	MACRO__(0x4693, ## __VA_ARGS__)
@@ -113,13 +114,18 @@
 #define XE_RPLU_IDS(MACRO__, ...)		\
 	MACRO__(0xA721, ## __VA_ARGS__),	\
 	MACRO__(0xA7A1, ## __VA_ARGS__),	\
-	MACRO__(0xA7A9, ## __VA_ARGS__)
+	MACRO__(0xA7A9, ## __VA_ARGS__),	\
+	MACRO__(0xA7AC, ## __VA_ARGS__),	\
+	MACRO__(0xA7AD, ## __VA_ARGS__)
 
 /* RPL-P */
 #define XE_RPLP_IDS(MACRO__, ...)		\
+	XE_RPLU_IDS(MACRO__, ## __VA_ARGS__),	\
 	MACRO__(0xA720, ## __VA_ARGS__),	\
 	MACRO__(0xA7A0, ## __VA_ARGS__),	\
-	MACRO__(0xA7A8, ## __VA_ARGS__)
+	MACRO__(0xA7A8, ## __VA_ARGS__),	\
+	MACRO__(0xA7AA, ## __VA_ARGS__),	\
+	MACRO__(0xA7AB, ## __VA_ARGS__)
 
 /* DG2 */
 #define XE_DG2_G10_IDS(MACRO__, ...)		\
@@ -128,17 +134,22 @@
 	MACRO__(0x5692, ## __VA_ARGS__),	\
 	MACRO__(0x56A0, ## __VA_ARGS__),	\
 	MACRO__(0x56A1, ## __VA_ARGS__),	\
-	MACRO__(0x56A2, ## __VA_ARGS__)
+	MACRO__(0x56A2, ## __VA_ARGS__),	\
+	MACRO__(0x56BE, ## __VA_ARGS__),	\
+	MACRO__(0x56BF, ## __VA_ARGS__)
 
 #define XE_DG2_G11_IDS(MACRO__, ...)		\
 	MACRO__(0x5693, ## __VA_ARGS__),	\
 	MACRO__(0x5694, ## __VA_ARGS__),	\
 	MACRO__(0x5695, ## __VA_ARGS__),	\
-	MACRO__(0x5698, ## __VA_ARGS__),	\
 	MACRO__(0x56A5, ## __VA_ARGS__),	\
 	MACRO__(0x56A6, ## __VA_ARGS__),	\
 	MACRO__(0x56B0, ## __VA_ARGS__),	\
-	MACRO__(0x56B1, ## __VA_ARGS__)
+	MACRO__(0x56B1, ## __VA_ARGS__),	\
+	MACRO__(0x56BA, ## __VA_ARGS__),	\
+	MACRO__(0x56BB, ## __VA_ARGS__),	\
+	MACRO__(0x56BC, ## __VA_ARGS__),	\
+	MACRO__(0x56BD, ## __VA_ARGS__)
 
 #define XE_DG2_G12_IDS(MACRO__, ...)		\
 	MACRO__(0x5696, ## __VA_ARGS__),	\
@@ -154,7 +165,8 @@
 	XE_DG2_G12_IDS(MACRO__, ## __VA_ARGS__)
 
 #define XE_ATS_M150_IDS(MACRO__, ...)		\
-	MACRO__(0x56C0, ## __VA_ARGS__)
+	MACRO__(0x56C0, ## __VA_ARGS__),	\
+	MACRO__(0x56C2, ## __VA_ARGS__)
 
 #define XE_ATS_M75_IDS(MACRO__, ...)		\
 	MACRO__(0x56C1, ## __VA_ARGS__)
@@ -163,8 +175,23 @@
 	XE_ATS_M150_IDS(MACRO__, ## __VA_ARGS__),\
 	XE_ATS_M75_IDS(MACRO__, ## __VA_ARGS__)
 
+/* MTL / ARL */
+#define XE_MTL_IDS(MACRO__, ...)		\
+	MACRO__(0x7D40, ## __VA_ARGS__),	\
+	MACRO__(0x7D41, ## __VA_ARGS__),	\
+	MACRO__(0x7D45, ## __VA_ARGS__),	\
+	MACRO__(0x7D51, ## __VA_ARGS__),        \
+	MACRO__(0x7D55, ## __VA_ARGS__),	\
+	MACRO__(0x7D60, ## __VA_ARGS__),	\
+	MACRO__(0x7D67, ## __VA_ARGS__),	\
+	MACRO__(0x7DD1, ## __VA_ARGS__),        \
+	MACRO__(0x7DD5, ## __VA_ARGS__)
+
 /* PVC */
-#define XE_PVC_XT_IDS(MACRO__, ...)		\
+#define XE_PVC_IDS(MACRO__, ...)		\
+	MACRO__(0x0B69, ## __VA_ARGS__),	\
+	MACRO__(0x0B6E, ## __VA_ARGS__),	\
+	MACRO__(0x0BD4, ## __VA_ARGS__),	\
 	MACRO__(0x0BD5, ## __VA_ARGS__),	\
 	MACRO__(0x0BD6, ## __VA_ARGS__),	\
 	MACRO__(0x0BD7, ## __VA_ARGS__),	\
@@ -176,37 +203,6 @@
 	MACRO__(0x0BE1, ## __VA_ARGS__),	\
 	MACRO__(0x0BE5, ## __VA_ARGS__)
 
-#define XE_PVC_IDS(MACRO__, ...)		\
-	XE_PVC_XT_IDS(MACRO__, ## __VA_ARGS__)
-
-/* MTL */
-#define XE_MTL_M_IDS(MACRO__, ...)		\
-	MACRO__(0x7D40, ## __VA_ARGS__),	\
-	MACRO__(0x7D43, ## __VA_ARGS__),	\
-	MACRO__(0x7DC0, ## __VA_ARGS__)
-
-#define XE_MTL_P_IDS(MACRO__, ...)		\
-	MACRO__(0x7D45, ## __VA_ARGS__),	\
-	MACRO__(0x7D47, ## __VA_ARGS__),	\
-	MACRO__(0x7D50, ## __VA_ARGS__),	\
-	MACRO__(0x7D55, ## __VA_ARGS__),	\
-	MACRO__(0x7DC5, ## __VA_ARGS__),	\
-	MACRO__(0x7DD0, ## __VA_ARGS__),	\
-	MACRO__(0x7DD5, ## __VA_ARGS__)
-
-#define XE_MTL_S_IDS(MACRO__, ...)		\
-	MACRO__(0x7D60, ## __VA_ARGS__),	\
-	MACRO__(0x7DE0, ## __VA_ARGS__)
-
-#define XE_ARL_IDS(MACRO__, ...)		\
-	MACRO__(0x7D67, ## __VA_ARGS__)
-
-#define XE_MTL_IDS(MACRO__, ...)		\
-	XE_MTL_M_IDS(MACRO__, ## __VA_ARGS__),	\
-	XE_MTL_P_IDS(MACRO__, ## __VA_ARGS__),	\
-	XE_MTL_S_IDS(MACRO__, ## __VA_ARGS__),	\
-	XE_ARL_IDS(MACRO__, ## __VA_ARGS__)
-
 #define XE_LNL_IDS(MACRO__, ...) \
 	MACRO__(0x6420, ## __VA_ARGS__), \
 	MACRO__(0x64A0, ## __VA_ARGS__), \
-- 
2.25.1

