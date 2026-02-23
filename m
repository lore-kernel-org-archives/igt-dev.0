Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68119C624D6
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 04:24:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EAB610E20F;
	Mon, 23 Feb 2026 04:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UfdqHjR2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63DC710E20F
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 04:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771820669; x=1803356669;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p/uwmJOBfpVVdHBSzi9DsuvQAZ1pbU+/YwNrsQp91js=;
 b=UfdqHjR2fci+HWAMEBpTGzbp0y8xAefdJm6ZC9OKrpFSHmkIsIYqfYfT
 5/wFKv+si3F5IYXMdk4FeF0pNrOSaRZTeP80aOiWO3Gv3KnpdNUa4Vpei
 pkhkYw9W4614W6Hqa89hR0pvUyiSyCDpoAoDWangz0zh2EBosZP4f5Eal
 V8Xvh1gtx8QespqfTe+kHujseAhEi6TBUathqGSbuFD4DeId/DSUx/6Em
 a15tyPTZKozLpvSWLiHKr5UCtKttYRN5nIE+/F5Wzscy+EA0N1HaIHp/c
 us9FWQRrznpvDL8LPX0fGk/zQY1spFeKDIa6OFTg0p3bSqdjQwBEkSVw7 Q==;
X-CSE-ConnectionGUID: slX+RjnLTFG1qGNkdJldiQ==
X-CSE-MsgGUID: 5ovuvMxLS1ClF9Zvwq4CJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="76673714"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="76673714"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 20:24:29 -0800
X-CSE-ConnectionGUID: f8EX2QwtTNy9xBA0s6wEBw==
X-CSE-MsgGUID: DT3vo5L+Rpaibo/tYJHhpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="212876786"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 20:24:28 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 1/2] tools/intel_vbt_decode: sync intel_vbt_defs.h with
 commit 4d33c77cf2c3
Date: Mon, 23 Feb 2026 09:38:58 +0530
Message-ID: <20260223040859.1362813-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260223040859.1362813-1-ankit.k.nautiyal@intel.com>
References: <20260223040859.1362813-1-ankit.k.nautiyal@intel.com>
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
4d33c77cf2c3 ("drm/i915/vbt: Add eDP Data rate overrride field in VBT")

v2: Correct the commit id that matches with changes in intel_vbt_defs.h
(Kamil)

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

