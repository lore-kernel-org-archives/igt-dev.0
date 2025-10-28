Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C1ACCD1BF
	for <igt-dev@archiver.kernel.org>; Tue, 28 Oct 2025 16:52:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0274F10E60F;
	Tue, 28 Oct 2025 16:52:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KDDfMZ4z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D06F510E60F
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Oct 2025 16:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761670368; x=1793206368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6gxg4JSCuK04Uv4rbwNIbhWUoDnbbUt7oBz5qJldCpY=;
 b=KDDfMZ4zkn81gVB2HigMaChW1WE1D/FqSYE4RM6gmW7KSaE1ql+YQBTY
 JSgS7C23zn32+G+2oT08O5qqrLbZlOLDdfO3i5GT3ch39NdeCE3RE9vQu
 uljtXiZf3EfcbwRpKuy0oI8zsaDWW7PgSQF3cgy8aTQc8zFouQtRndx3M
 iMsu3YiMM+ogIUQYI0Zzb06Ic7R5a6KCT4IXPxlQ94OfKVAvDgvk0g1Nm
 Tlsme9Nq1cRjXEvoFbGPBEI+lPCZSssN9x4Elhu7xE3qPudUGMgrhYdBi
 /L6QXvLw4OetI9puXUHetWiwPFMDBwB8ohPVablGyPHXD7VDiifdoiS8F Q==;
X-CSE-ConnectionGUID: U7PI2yjGRFOePUn0eeaqsA==
X-CSE-MsgGUID: 8d6FX5AXQkaEUreU1gnBBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63664566"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="63664566"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 09:52:47 -0700
X-CSE-ConnectionGUID: BtfVxbcyRLOb2IgQPGv57Q==
X-CSE-MsgGUID: IUF+ttesTBiaeMj6mN4o0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="222622997"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.157])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 09:52:45 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 1/1] lib/pciids: sync with kernel commit c002b1764e7b
Date: Tue, 28 Oct 2025 17:52:35 +0100
Message-ID: <20251028165235.39234-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251028165235.39234-1-kamil.konieczny@linux.intel.com>
References: <20251028165235.39234-1-kamil.konieczny@linux.intel.com>
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

Synchronize PCI IDs with drm-next kernel up to c002b1764e7b,
which includes the following changes:

c002b1764e7b ("drm/xe/nvl: Define NVL-S platform")
78de8f876683 ("drm/xe: Handle Wa_22010954014 and Wa_14022085890 as device workarounds")
edb660ad79ff ("drm/intel/pciids: Add match on vendor/id only")

v2: squashed into one commit (Lucas)
v3: changed message and description (Lucas)

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
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

