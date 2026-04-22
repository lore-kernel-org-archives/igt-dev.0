Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E5BF94CC2
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 03:59:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7426810E261;
	Wed, 22 Apr 2026 03:59:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J5qktbSz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8785F10E261
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2026 03:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776830312; x=1808366312;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jBEVlaL0kipUEby6BbzZoOpnOmxZVs6U/4lD7zdOkOA=;
 b=J5qktbSzBfbG/G8r8G0wAcbeWUtpyV2lf/ZVIMhbPiWIvGEprHOLpLLW
 GP71/OB2xAt8joRzU97jQxPMBFu9uKmkMHap8YiN9oLl7oehn6Q+I4MOH
 Om1FX6oa0Q0kJLnj7whbF71+GXJfYsB8psnWG20IcA5toED95z7NoAyWH
 7wbQ7F2v1/lROpKklz7gLnOxcCjWkog5mFDdYsCRGiV3IYpAyhIIiUYNQ
 8jYvu/7TbJrGfv0MKWnKJrH2MfjlFaIgyjIm+p4sorfBmiL6XxniD/rh4
 pvFsNsDKIa2JTdYQ8g8Jrd/hxFUv3swcJWZ+pIhttBHxciSwTiU0uPns/ w==;
X-CSE-ConnectionGUID: ucUt5RepSLajDVwJyJfA7g==
X-CSE-MsgGUID: cyuu1w47SLatMoUn5CnObA==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="95338485"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="95338485"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 20:58:32 -0700
X-CSE-ConnectionGUID: b5F0/d+GQya3XD4OS0fX4w==
X-CSE-MsgGUID: vznDJxBwSbmThP0Jl4zZsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="232151341"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 20:58:31 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 ville.syrjala@linux.intel.com, jani.nikula@linux.intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 3/8] tools/intel_vbt_defs: sync intel_vbt_defs.h with
 kernel commit 4d33c77cf2c3
Date: Wed, 22 Apr 2026 09:13:30 +0530
Message-ID: <20260422034335.2326098-4-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260422034335.2326098-1-ankit.k.nautiyal@intel.com>
References: <20260422034335.2326098-1-ankit.k.nautiyal@intel.com>
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

