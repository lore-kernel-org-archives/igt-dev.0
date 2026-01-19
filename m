Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665B0CCF2EB
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 11:35:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F03710E3FE;
	Mon, 19 Jan 2026 11:35:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eHyVxSU4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21BF410E3FD
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 11:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768822513; x=1800358513;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/6jUaXdHAaJaGkew6ymaQFt2MKb+rx415fmptCvEAJs=;
 b=eHyVxSU4EtaaCrdL9BH0AraApF7m2qscxbD+JRJSrPiSPT0VqftfWXb0
 1Q9kYay6fauRMH4JkzE9TR69/0Ksy9p9/owZihG6cjhSs1e9hHcc+lwDW
 BG1PMHIYaQyffq9AOl5FxjpZ6yu7udRBzGFCGY9nizXkRBoaVsOLk63t6
 GSBogkkIm8GeXpZidHEAd3SQlqjkyCsdQk7JUPm90EnYK4xeDFefLsgFC
 6gEmMaHCjvYgb5Q9ZHdOFPPP7PlwnefDhz06CDibEltQRde+6XIJJA9J+
 yM3d8E2hwFULS4R5YRgU+KGPueSJ16ZVoGSDSJ3t9oiTojl8OJnDYdTHe A==;
X-CSE-ConnectionGUID: EOmVwLl8Ty+h4XSRHd1KbA==
X-CSE-MsgGUID: UDJfrdeBTqeIrhM+oHPPgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="69942205"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="69942205"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 03:35:13 -0800
X-CSE-ConnectionGUID: /bXQJoc/T3y62NZEvRERUg==
X-CSE-MsgGUID: h8B8vE11QqevKqKVhBfQeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="205102208"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 03:35:13 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 1/2] tools/intel_vbt_decode: sync intel_vbt_defs.h with
 commit 835a0d544def
Date: Mon, 19 Jan 2026 16:49:17 +0530
Message-ID: <20260119111918.2686910-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260119111918.2686910-1-ankit.k.nautiyal@intel.com>
References: <20260119111918.2686910-1-ankit.k.nautiyal@intel.com>
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

Synchronize intel_vbt_defs.h with kernel commit:
835a0d544def ("drm/i915/bios: Add function to check if edp data override is needed")

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tools/intel_vbt_decode.c | 36 ++++++++++++++++++++++++++++++++++++
 tools/intel_vbt_defs.h   | 18 ++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index d4aada743e42..6f6f70dcee63 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -1125,6 +1125,39 @@ static const char * const hdmi_frl_rate_str[] = {
 	[5] = "12 GT/s",
 };
 
+static void dump_edp_data_rate_override(uint32_t edp_data_rate_override)
+{
+	int i;
+	static const uint32_t link_rates[BDB_263_VBT_EDP_NUM_RATES][2] = {
+		{ BDB_263_VBT_EDP_LINK_RATE_1_62, 162000 },
+		{ BDB_263_VBT_EDP_LINK_RATE_2_16, 216000 },
+		{ BDB_263_VBT_EDP_LINK_RATE_2_43, 243000 },
+		{ BDB_263_VBT_EDP_LINK_RATE_2_7, 270000 },
+		{ BDB_263_VBT_EDP_LINK_RATE_3_24, 324000 },
+		{ BDB_263_VBT_EDP_LINK_RATE_4_32, 432000 },
+		{ BDB_263_VBT_EDP_LINK_RATE_5_4, 540000 },
+		{ BDB_263_VBT_EDP_LINK_RATE_6_75, 675000 },
+		{ BDB_263_VBT_EDP_LINK_RATE_8_1, 810000 },
+		{ BDB_263_VBT_EDP_LINK_RATE_10, 1000000 },
+		{ BDB_263_VBT_EDP_LINK_RATE_13_5, 1350000 },
+		{ BDB_263_VBT_EDP_LINK_RATE_20, 2000000},
+	};
+
+	edp_data_rate_override &= BDB_263_VBT_EDP_RATES_MASK;
+
+	printf("\t\teDP data rate override:");
+
+	if (!edp_data_rate_override) {
+		printf("(none)\n");
+		return;
+	}
+	printf("\n");
+
+	for (i = 0; i < BDB_263_VBT_EDP_NUM_RATES; i++)
+		if (link_rates[i][0] & edp_data_rate_override)
+			printf("\t\t\t%d kbps\n", link_rates[i][1]);
+}
+
 static void dump_child_device(struct context *context,
 			      const struct child_device_config *child)
 {
@@ -1285,6 +1318,9 @@ static void dump_child_device(struct context *context,
 
 	if (context->bdb->version >= 256)
 		printf("\t\tEFP panel index: %d\n", child->efp_index);
+
+	if (context->bdb->version >= 263)
+		dump_edp_data_rate_override(child->edp_data_rate_override);
 }
 
 static void dump_child_devices(struct context *context, const uint8_t *devices,
diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
index 6612d3a4ec49..932305df2320 100644
--- a/tools/intel_vbt_defs.h
+++ b/tools/intel_vbt_defs.h
@@ -437,6 +437,22 @@ enum vbt_gmbus_ddi {
 #define BDB_230_VBT_DP_MAX_LINK_RATE_UHBR13P5	6
 #define BDB_230_VBT_DP_MAX_LINK_RATE_UHBR20	7
 
+/* EDP link rate 263+ */
+#define BDB_263_VBT_EDP_LINK_RATE_1_62		(1 << 0)
+#define BDB_263_VBT_EDP_LINK_RATE_2_16		(1 << 1)
+#define BDB_263_VBT_EDP_LINK_RATE_2_43		(1 << 2)
+#define BDB_263_VBT_EDP_LINK_RATE_2_7		(1 << 3)
+#define BDB_263_VBT_EDP_LINK_RATE_3_24		(1 << 4)
+#define BDB_263_VBT_EDP_LINK_RATE_4_32		(1 << 5)
+#define BDB_263_VBT_EDP_LINK_RATE_5_4		(1 << 6)
+#define BDB_263_VBT_EDP_LINK_RATE_6_75		(1 << 7)
+#define BDB_263_VBT_EDP_LINK_RATE_8_1		(1 << 8)
+#define BDB_263_VBT_EDP_LINK_RATE_10		(1 << 9)
+#define BDB_263_VBT_EDP_LINK_RATE_13_5		(1 << 10)
+#define BDB_263_VBT_EDP_LINK_RATE_20		(1 << 11)
+#define BDB_263_VBT_EDP_NUM_RATES		12
+#define BDB_263_VBT_EDP_RATES_MASK		0xfff
+
 /*
  * The child device config, aka the display device data structure, provides a
  * description of a port and its configuration on the platform.
@@ -547,6 +563,8 @@ struct child_device_config {
 	u8 dp_max_link_rate:3;					/* 216+ */
 	u8 dp_max_link_rate_reserved:5;				/* 216+ */
 	u8 efp_index;						/* 256+ */
+	u32 edp_data_rate_override:12;                          /* 263+ */
+	u32 edp_data_rate_override_reserved:20;                 /* 263+ */
 } __packed;
 
 struct bdb_general_definitions {
-- 
2.45.2

