Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4CCD637D1
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 23:03:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A357F10E764;
	Wed, 13 Nov 2024 23:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YOTRwuAh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1342410E29C
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Nov 2024 23:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731538985; x=1763074985;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=bcwY6Dpu3q42Zcyq9hoAvQMeUOjDGc49YY/Of/5oGyg=;
 b=YOTRwuAhM2B/w0KwaPZcUHiYa2Lao6hfDVNd6wWgSuyPs2xAg9CP/2kt
 //rDi32fqQV3VQzuBJjYZ9V6LQ9m+E5VVmRwATYYqxrrw0a4qRPd3MTvq
 O15RK2vyATKIlDi+2yAvap/LauITRxoabCAnQMXtSrjZ68b2rCLtwN21T
 i5KeW4EPQtZY/glADKE6i6dauPO125zcmPweWtt0IfPHAw4gckv3YExIW
 8oJzvNC8iHLjXccseljx+ENQdQgLn9pZMH8zMp1Sey4NBLc1+deoM5rdC
 QZ2JDY47yztk7OcelxZOCn648Hqf9tFtqgtvPSF7lBbbWcItMCD/Cgvmw w==;
X-CSE-ConnectionGUID: tneUmDW1SWyVA4h7kGq4JQ==
X-CSE-MsgGUID: KN9qXAhmT8is5pXjpws2gQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53999371"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="53999371"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 15:03:05 -0800
X-CSE-ConnectionGUID: 6goBCbYWRSutFpZKTg9MmA==
X-CSE-MsgGUID: RZIx5Dt1SlWM57OlPXSBUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; d="scan'208";a="93074711"
Received: from cataylo2-desk.jf.intel.com ([10.165.21.140])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 15:03:05 -0800
From: Clint Taylor <clinton.a.taylor@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH] lib: Sync pci ids with kernel
Date: Wed, 13 Nov 2024 15:02:52 -0800
Message-Id: <20241113230301.655499-2-clinton.a.taylor@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241113230301.655499-1-clinton.a.taylor@intel.com>
References: <20241113230301.655499-1-clinton.a.taylor@intel.com>
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

Syncronize pciids from kernel

Signed-off-by: Clint Taylor <clinton.a.taylor@intel.com>
---
 lib/i915_pciids.h | 73 +++++++++++++++++++++++++++++++----------------
 lib/xe_pciids.h   | 30 ++++++++++++++-----
 2 files changed, 71 insertions(+), 32 deletions(-)

diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
index 3e39d644e..6b92f8c37 100644
--- a/lib/i915_pciids.h
+++ b/lib/i915_pciids.h
@@ -25,27 +25,20 @@
 #ifndef _I915_PCIIDS_H
 #define _I915_PCIIDS_H
 
-/*
- * A pci_device_id struct {
- *	__u32 vendor, device;
- *      __u32 subvendor, subdevice;
- *	__u32 class, class_mask;
- *	kernel_ulong_t driver_data;
- * };
- * Don't use C99 here because "class" is reserved and we want to
- * give userspace flexibility.
- */
-#define INTEL_VGA_DEVICE(id, info) { \
-	0x8086,	id, \
-	~0, ~0, \
-	0x030000, 0xff0000, \
-	(unsigned long) info }
-
-#define INTEL_QUANTA_VGA_DEVICE(info) { \
-	0x8086,	0x16a, \
-	0x152d,	0x8990, \
-	0x030000, 0xff0000, \
-	(unsigned long) info }
+#ifdef __KERNEL__
+#define INTEL_VGA_DEVICE(_id, _info) { \
+	PCI_DEVICE(PCI_VENDOR_ID_INTEL, (_id)), \
+	.class = PCI_BASE_CLASS_DISPLAY << 16, .class_mask = 0xff << 16, \
+	.driver_data = (kernel_ulong_t)(_info), \
+}
+
+#define INTEL_QUANTA_VGA_DEVICE(_info) { \
+	.vendor = PCI_VENDOR_ID_INTEL, .device = 0x16a, \
+	.subvendor = 0x152d, .subdevice = 0x8990, \
+	.class = PCI_BASE_CLASS_DISPLAY << 16, .class_mask = 0xff << 16, \
+	.driver_data = (kernel_ulong_t)(_info), \
+}
+#endif
 
 #define INTEL_I810_IDS(MACRO__, ...) \
 	MACRO__(0x7121, ## __VA_ARGS__), /* I810 */ \
@@ -771,16 +764,46 @@
 	INTEL_ATS_M150_IDS(MACRO__, ## __VA_ARGS__), \
 	INTEL_ATS_M75_IDS(MACRO__, ## __VA_ARGS__)
 
+/* ARL */
+#define INTEL_ARL_IDS(MACRO__, ...) \
+	MACRO__(0x7D41, ## __VA_ARGS__), \
+	MACRO__(0x7D51, ## __VA_ARGS__), \
+	MACRO__(0x7D67, ## __VA_ARGS__), \
+	MACRO__(0x7DD1, ## __VA_ARGS__), \
+	MACRO__(0xB640, ## __VA_ARGS__)
+
 /* MTL */
 #define INTEL_MTL_IDS(MACRO__, ...) \
 	MACRO__(0x7D40, ## __VA_ARGS__), \
-	MACRO__(0x7D41, ## __VA_ARGS__), \
 	MACRO__(0x7D45, ## __VA_ARGS__), \
-	MACRO__(0x7D51, ## __VA_ARGS__), \
 	MACRO__(0x7D55, ## __VA_ARGS__), \
 	MACRO__(0x7D60, ## __VA_ARGS__), \
-	MACRO__(0x7D67, ## __VA_ARGS__), \
-	MACRO__(0x7DD1, ## __VA_ARGS__), \
 	MACRO__(0x7DD5, ## __VA_ARGS__)
 
+/* LNL */
+#define INTEL_LNL_IDS(MACRO__, ...) \
+	MACRO__(0x6420, ## __VA_ARGS__), \
+	MACRO__(0x64A0, ## __VA_ARGS__), \
+	MACRO__(0x64B0, ## __VA_ARGS__)
+
+/* BMG */
+#define INTEL_BMG_IDS(MACRO__, ...) \
+	MACRO__(0xE202, ## __VA_ARGS__), \
+	MACRO__(0xE20B, ## __VA_ARGS__), \
+	MACRO__(0xE20C, ## __VA_ARGS__), \
+	MACRO__(0xE20D, ## __VA_ARGS__), \
+	MACRO__(0xE212, ## __VA_ARGS__)
+
+/* PTL */
+#define INTEL_PTL_IDS(MACRO__, ...) \
+	MACRO__(0xB080, ## __VA_ARGS__), \
+	MACRO__(0xB081, ## __VA_ARGS__), \
+	MACRO__(0xB082, ## __VA_ARGS__), \
+	MACRO__(0xB090, ## __VA_ARGS__), \
+	MACRO__(0xB091, ## __VA_ARGS__), \
+	MACRO__(0xB092, ## __VA_ARGS__), \
+	MACRO__(0xB0A0, ## __VA_ARGS__), \
+	MACRO__(0xB0A1, ## __VA_ARGS__), \
+	MACRO__(0xB0A2, ## __VA_ARGS__)
+
 #endif /* _I915_PCIIDS_H */
diff --git a/lib/xe_pciids.h b/lib/xe_pciids.h
index 73d972a8a..6d8d013f7 100644
--- a/lib/xe_pciids.h
+++ b/lib/xe_pciids.h
@@ -97,7 +97,9 @@
 #define XE_ADLN_IDS(MACRO__, ...)		\
 	MACRO__(0x46D0, ## __VA_ARGS__),	\
 	MACRO__(0x46D1, ## __VA_ARGS__),	\
-	MACRO__(0x46D2, ## __VA_ARGS__)
+	MACRO__(0x46D2, ## __VA_ARGS__),	\
+	MACRO__(0x46D3, ## __VA_ARGS__),	\
+	MACRO__(0x46D4, ## __VA_ARGS__)
 
 /* RPL-S */
 #define XE_RPLS_IDS(MACRO__, ...)		\
@@ -120,7 +122,6 @@
 
 /* RPL-P */
 #define XE_RPLP_IDS(MACRO__, ...)		\
-	XE_RPLU_IDS(MACRO__, ## __VA_ARGS__),	\
 	MACRO__(0xA720, ## __VA_ARGS__),	\
 	MACRO__(0xA7A0, ## __VA_ARGS__),	\
 	MACRO__(0xA7A8, ## __VA_ARGS__),	\
@@ -175,16 +176,20 @@
 	XE_ATS_M150_IDS(MACRO__, ## __VA_ARGS__),\
 	XE_ATS_M75_IDS(MACRO__, ## __VA_ARGS__)
 
-/* MTL / ARL */
+/* ARL */
+#define XE_ARL_IDS(MACRO__, ...)		\
+	MACRO__(0x7D41, ## __VA_ARGS__),	\
+	MACRO__(0x7D51, ## __VA_ARGS__),        \
+	MACRO__(0x7D67, ## __VA_ARGS__),	\
+	MACRO__(0x7DD1, ## __VA_ARGS__),	\
+	MACRO__(0xB640, ## __VA_ARGS__)
+
+/* MTL */
 #define XE_MTL_IDS(MACRO__, ...)		\
 	MACRO__(0x7D40, ## __VA_ARGS__),	\
-	MACRO__(0x7D41, ## __VA_ARGS__),	\
 	MACRO__(0x7D45, ## __VA_ARGS__),	\
-	MACRO__(0x7D51, ## __VA_ARGS__),        \
 	MACRO__(0x7D55, ## __VA_ARGS__),	\
 	MACRO__(0x7D60, ## __VA_ARGS__),	\
-	MACRO__(0x7D67, ## __VA_ARGS__),	\
-	MACRO__(0x7DD1, ## __VA_ARGS__),        \
 	MACRO__(0x7DD5, ## __VA_ARGS__)
 
 /* PVC */
@@ -215,4 +220,15 @@
 	MACRO__(0xE20D, ## __VA_ARGS__), \
 	MACRO__(0xE212, ## __VA_ARGS__)
 
+#define XE_PTL_IDS(MACRO__, ...) \
+	MACRO__(0xB080, ## __VA_ARGS__), \
+	MACRO__(0xB081, ## __VA_ARGS__), \
+	MACRO__(0xB082, ## __VA_ARGS__), \
+	MACRO__(0xB090, ## __VA_ARGS__), \
+	MACRO__(0xB091, ## __VA_ARGS__), \
+	MACRO__(0xB092, ## __VA_ARGS__), \
+	MACRO__(0xB0A0, ## __VA_ARGS__), \
+	MACRO__(0xB0A1, ## __VA_ARGS__), \
+	MACRO__(0xB0A2, ## __VA_ARGS__)
+
 #endif
-- 
2.25.1

