Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB546FF8860
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 13:02:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A0A510E744;
	Mon, 27 Apr 2026 13:02:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GHttG8h3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836BC10E743
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 13:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777294856; x=1808830856;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Aw8IPLQQqkVxB8ozeSHdQpTz70xR3wzdKrW0r0dX2QI=;
 b=GHttG8h3QiNGscAS8sSg6lSNtQsz3x4gdiSJXZaVXE9kyu0V6KV/3ayT
 XyNUWtUlc3kjtBqKVBUyM7HHw0dnjqJpW0avf+vfAlVqazkDEhJHKMRx5
 XJoH35Tw9njIIqhJNYnQ05d0IHtDER0V8s0jOWY4Wd1+83KSSHov86d5i
 D7T/juT3w9DF33wzq4mp0Ay6ndETO3ZZOF0G2i6tMYKg9ol2M26TALf40
 ynVBlLXWLnYIdimbG200vc8ZRO8EWPa/0ZYDfd4G9AKJrW0XAHyqHyxO8
 09UuGICewaD3oSwftBPNumOw5bdISjaxI7N2wQOc1U1MoXKE4WKdFJk3w A==;
X-CSE-ConnectionGUID: HEY4AO1KRmGKsJSt4WboDQ==
X-CSE-MsgGUID: fynns0eKTOeY3TTzNhlbew==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="77339212"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="77339212"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 06:00:55 -0700
X-CSE-ConnectionGUID: pgUOzcCJSwm/NlmuFNBwoA==
X-CSE-MsgGUID: TJyjUk1aRGCdLzmbWFwf1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="237597731"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 06:00:53 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 ville.syrjala@linux.intel.com, jani.nikula@linux.intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 3/8] tools/intel_vbt_defs: sync intel_vbt_defs.h with
 kernel commit 4d33c77cf2c3
Date: Mon, 27 Apr 2026 18:16:02 +0530
Message-ID: <20260427124607.3115567-4-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260427124607.3115567-1-ankit.k.nautiyal@intel.com>
References: <20260427124607.3115567-1-ankit.k.nautiyal@intel.com>
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

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tools/intel_vbt_defs.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
index 6612d3a4ec49..70e31520c560 100644
--- a/tools/intel_vbt_defs.h
+++ b/tools/intel_vbt_defs.h
@@ -437,6 +437,22 @@ enum vbt_gmbus_ddi {
 #define BDB_230_VBT_DP_MAX_LINK_RATE_UHBR13P5	6
 #define BDB_230_VBT_DP_MAX_LINK_RATE_UHBR20	7
 
+/* EDP link rate 263+ */
+#define BDB_263_VBT_EDP_LINK_RATE_1_62		BIT_U32(0)
+#define BDB_263_VBT_EDP_LINK_RATE_2_16		BIT_U32(1)
+#define BDB_263_VBT_EDP_LINK_RATE_2_43		BIT_U32(2)
+#define BDB_263_VBT_EDP_LINK_RATE_2_7		BIT_U32(3)
+#define BDB_263_VBT_EDP_LINK_RATE_3_24		BIT_U32(4)
+#define BDB_263_VBT_EDP_LINK_RATE_4_32		BIT_U32(5)
+#define BDB_263_VBT_EDP_LINK_RATE_5_4		BIT_U32(6)
+#define BDB_263_VBT_EDP_LINK_RATE_6_75		BIT_U32(7)
+#define BDB_263_VBT_EDP_LINK_RATE_8_1		BIT_U32(8)
+#define BDB_263_VBT_EDP_LINK_RATE_10		BIT_U32(9)
+#define BDB_263_VBT_EDP_LINK_RATE_13_5		BIT_U32(10)
+#define BDB_263_VBT_EDP_LINK_RATE_20		BIT_U32(11)
+#define BDB_263_VBT_EDP_NUM_RATES		12
+#define BDB_263_VBT_EDP_RATES_MASK		GENMASK(BDB_263_VBT_EDP_NUM_RATES - 1, 0)
+
 /*
  * The child device config, aka the display device data structure, provides a
  * description of a port and its configuration on the platform.
@@ -547,6 +563,8 @@ struct child_device_config {
 	u8 dp_max_link_rate:3;					/* 216+ */
 	u8 dp_max_link_rate_reserved:5;				/* 216+ */
 	u8 efp_index;						/* 256+ */
+	u32 edp_data_rate_override:12;				/* 263+ */
+	u32 edp_data_rate_override_reserved:20;			/* 263+ */
 } __packed;
 
 struct bdb_general_definitions {
-- 
2.45.2

