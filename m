Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CF1CCF9E0
	for <igt-dev@archiver.kernel.org>; Tue, 28 Oct 2025 10:42:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BECD010E1D9;
	Tue, 28 Oct 2025 10:42:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lF//i3r9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAFB710E1D9
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Oct 2025 10:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761648167; x=1793184167;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t17XKpcvMFaO5oHkDi+mHfkpKrUSFRz3VXjnk1idMN8=;
 b=lF//i3r9y+hsMp6GH5EjwwZni8A5J5tmAL06CBagk8njEpk4t/5jvCYl
 brie1qgs3C4ue6koStzmyslR5reRSJ/NxgTV+aEuWfsVAvijnwG5xx5E4
 Kag0M6+NRY35MgK2c4JT3/vfaIBTjEV0yfGeZYQhDKWqL5LwlQVfvXDML
 S3LtZPj/Z/AzlokH5kf/sgDdiB6ILQ4T9gwrB8KE8BD8a5YiYv5rkE7/+
 LjpZwDGVNvg+xo+DYDyq/Q9nZzslIR6KxWfxi5iDAfcOCmz4DwDxJjHtw
 kRve2vjx4TFBfLtTWjbDfYj0ODZVTDTo3NLQq78y6WyKhNtW65FiZlzDU A==;
X-CSE-ConnectionGUID: gBpC7iy+RxS3FFPByUWlMw==
X-CSE-MsgGUID: lAzQrUQpRhaBjrxgXR2djg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63633236"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="63633236"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 03:42:47 -0700
X-CSE-ConnectionGUID: tfjeGrLrTgqz7NVPqCfFmg==
X-CSE-MsgGUID: 3g/+l+rnSw+O/crekFLK0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="184941242"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.157])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 03:42:43 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 1/1] lib/pciids: Add NVL-S and split out BMG-G21
Date: Tue, 28 Oct 2025 11:42:34 +0100
Message-ID: <20251028104234.14745-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251028104234.14745-1-kamil.konieczny@linux.intel.com>
References: <20251028104234.14745-1-kamil.konieczny@linux.intel.com>
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

Sync with drm-next kernel commit c002b1764e7b ("drm/xe/nvl: Define NVL-S platform")
Link: https://lore.kernel.org/r/20251016-xe3p-v3-11-3dd173a3097a@intel.com

This adds NovaLake-S PCI ids, and with it there are two more PCI
ids commits, one for splitting BMG-G21 out of BMG for workarounds
and the other adds a kernel macro.

78de8f876683 ("drm/xe: Handle Wa_22010954014 and Wa_14022085890 as device workarounds")
Link: https://lore.kernel.org/r/20251013200944.2499947-40-matthew.d.roper@intel.com

edb660ad79ff ("drm/intel/pciids: Add match on vendor/id only")
Link: https://lore.kernel.org/r/20250808-intel-pci-device-v1-1-ce3545d86502@intel.com

v2: squashed into one commit (Lucas)

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/pciids.h | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/lib/pciids.h b/lib/pciids.h
index 76f8d26f9..9f095a99d 100644
--- a/lib/pciids.h
+++ b/lib/pciids.h
@@ -26,6 +26,11 @@
 #define __PCIIDS_H__
 
 #ifdef __KERNEL__
+#define INTEL_PCI_DEVICE(_id, _info) { \
+	PCI_DEVICE(PCI_VENDOR_ID_INTEL, (_id)), \
+	.driver_data = (kernel_ulong_t)(_info), \
+}
+
 #define INTEL_VGA_DEVICE(_id, _info) { \
 	PCI_DEVICE(PCI_VENDOR_ID_INTEL, (_id)), \
 	.class = PCI_BASE_CLASS_DISPLAY << 16, .class_mask = 0xff << 16, \
@@ -844,7 +849,7 @@
 	MACRO__(0x64B0, ## __VA_ARGS__)
 
 /* BMG */
-#define INTEL_BMG_IDS(MACRO__, ...) \
+#define INTEL_BMG_G21_IDS(MACRO__, ...) \
 	MACRO__(0xE202, ## __VA_ARGS__), \
 	MACRO__(0xE209, ## __VA_ARGS__), \
 	MACRO__(0xE20B, ## __VA_ARGS__), \
@@ -853,7 +858,10 @@
 	MACRO__(0xE210, ## __VA_ARGS__), \
 	MACRO__(0xE211, ## __VA_ARGS__), \
 	MACRO__(0xE212, ## __VA_ARGS__), \
-	MACRO__(0xE216, ## __VA_ARGS__), \
+	MACRO__(0xE216, ## __VA_ARGS__)
+
+#define INTEL_BMG_IDS(MACRO__, ...) \
+	INTEL_BMG_G21_IDS(MACRO__, __VA_ARGS__), \
 	MACRO__(0xE220, ## __VA_ARGS__), \
 	MACRO__(0xE221, ## __VA_ARGS__), \
 	MACRO__(0xE222, ## __VA_ARGS__), \
@@ -876,4 +884,13 @@
 	MACRO__(0xFD80, ## __VA_ARGS__), \
 	MACRO__(0xFD81, ## __VA_ARGS__)
 
+/* NVL-S */
+#define INTEL_NVLS_IDS(MACRO__, ...) \
+	MACRO__(0xD740, ## __VA_ARGS__), \
+	MACRO__(0xD741, ## __VA_ARGS__), \
+	MACRO__(0xD742, ## __VA_ARGS__), \
+	MACRO__(0xD743, ## __VA_ARGS__), \
+	MACRO__(0xD744, ## __VA_ARGS__), \
+	MACRO__(0xD745, ## __VA_ARGS__)
+
 #endif /* __PCIIDS_H__ */
-- 
2.51.1

