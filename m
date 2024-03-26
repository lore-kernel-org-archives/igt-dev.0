Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C529AC6FD1F
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 13:45:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E30E10EFA1;
	Tue, 26 Mar 2024 13:45:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l/Ug/d8p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CADF10EFA1
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 13:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711460729; x=1742996729;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=omC4UiRBR1wa8ubL+hmEDirhgYIJ9HtxwcfzCGPKF90=;
 b=l/Ug/d8pOqW8T/xxiuPtQ+E3cHciUGHvyn4Fub/nhOAM1t7nnY1aE3Ix
 d25iSZYAlGVgGB4ui6+Yjmc6dMcuozX3AhQ4U8AS4uWrTthbYzLKFeX00
 BdG5LWeHrdufWJb3J2EP6L7P9nuHjcHlstrrrAQ5gX4qNnL63EB1iZtKg
 pnzmtMn3coRA/jgCKdK538lmV/CWTy/Cmi4/E0RO8nxMLK1wJp5iEXolm
 QAOyNA+xthSmE+F8gHqrsRqtSiUV7a7oVI1jZBxRnAqOh/yLwCpkOLJeV
 pj55GG5KQKWAYh6+1DmmlUv5w5FllwklrU377f+/fZpbSnm3uyfi/FlCD A==;
X-CSE-ConnectionGUID: wK1qyuslTHSOSiGumPzOCQ==
X-CSE-MsgGUID: Znh1nuv3QVW5khoggsSP6A==
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="31946453"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="31946453"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 06:45:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="16611974"
Received: from rvodapal-desk.iind.intel.com ([10.145.162.163])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 06:45:15 -0700
From: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, balasubramani.vivekanandan@intel.com,
 lucas.demarchi@intel.com, clinton.a.taylor@intel.com,
 haridhar.kalvala@intel.com, radhakrishna.sripada@intel.com,
 matthew.s.atwood@intel.com, dnyaneshwar.bhadane@intel.com,
 shekhar.chauhan@intel.com
Subject: [PATCH] lib/pci: Add new and missing PCI IDs to DG2 platform
Date: Tue, 26 Mar 2024 19:18:43 +0530
Message-Id: <20240326134843.3841519-1-ravi.kumar.vodapalli@intel.com>
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

New PCI ID is added in Bspec and some are missing in IGT, add them
to driver

Bspec: 44477
Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
---
 lib/i915_pciids.h |  4 +++-
 lib/xe_pciids.h   | 10 ++++++++--
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
index fcf1849aa..16221ce77 100644
--- a/lib/i915_pciids.h
+++ b/lib/i915_pciids.h
@@ -709,7 +709,9 @@
 	INTEL_VGA_DEVICE(0x5692, info), \
 	INTEL_VGA_DEVICE(0x56A0, info), \
 	INTEL_VGA_DEVICE(0x56A1, info), \
-	INTEL_VGA_DEVICE(0x56A2, info)
+	INTEL_VGA_DEVICE(0x56A2, info), \
+	INTEL_VGA_DEVICE(0x56BE, info), \
+	INTEL_VGA_DEVICE(0x56BF, info)
 
 #define INTEL_DG2_G11_IDS(info) \
 	INTEL_VGA_DEVICE(0x5693, info), \
diff --git a/lib/xe_pciids.h b/lib/xe_pciids.h
index 29f07a00a..77aa412d2 100644
--- a/lib/xe_pciids.h
+++ b/lib/xe_pciids.h
@@ -128,7 +128,9 @@
 	MACRO__(0x5692, ## __VA_ARGS__),	\
 	MACRO__(0x56A0, ## __VA_ARGS__),	\
 	MACRO__(0x56A1, ## __VA_ARGS__),	\
-	MACRO__(0x56A2, ## __VA_ARGS__)
+	MACRO__(0x56A2, ## __VA_ARGS__),	\
+	MACRO__(0x56BE, ## __VA_ARGS__),	\
+	MACRO__(0x56BF, ## __VA_ARGS__)
 
 #define XE_DG2_G11_IDS(MACRO__, ...)		\
 	MACRO__(0x5693, ## __VA_ARGS__),	\
@@ -138,7 +140,11 @@
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
-- 
2.25.1

