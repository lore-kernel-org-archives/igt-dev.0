Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77E4F8E49D
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 07:30:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB5A10E988;
	Fri, 17 Apr 2026 07:30:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jw5FpZFI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E57E10E988
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 07:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776410966; x=1807946966;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hBm1rrJjQjL17LcaDlo2Wgzlh3KvuA+DpQrThlVOMz0=;
 b=jw5FpZFIV4Fw+VjUvsx9tbZ5fxBN2sS0kW72tswniz0R7I7WjhObIltj
 F2Lj4BQzJJkKH80v+T2DtVuDPbKFHldKe57AkrZ/W1X0P8KbgXhtDQyio
 MLrnwEE1WlmsVtRqF/n71PwQK6uv+xEGpwfVjoSoYs+DMW5E/oqXeqW+O
 0KxQcjyTlgPK6PxrFy0lrfArdkZzLXfnk5HYvDN2RLTT8EVjG5B7N4thH
 8nAxQElgUsFlz0h3rKRw4U359I17YytIf9y9A+x6QXzRJj+dy/WhdWiWz
 2peFcuYdCTRNGc6aspVevHQMGzXnOuOXUwaz3gQUwihiOOEEyDorC5M5k w==;
X-CSE-ConnectionGUID: +PFXMWAwTSqD8RceXn1nSg==
X-CSE-MsgGUID: 6qw+c35sRBq12XDhPUi6YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="81021127"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="81021127"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 00:29:26 -0700
X-CSE-ConnectionGUID: FMfVVnapSIm8mz9l14pAsA==
X-CSE-MsgGUID: gFUhcYoBQKCLnzi8vmChKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="268985279"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 00:29:25 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 3/4] tools/intel_vbt_decode: sync intel_vbt_defs.h with
 commit 4d33c77cf2c3
Date: Fri, 17 Apr 2026 12:44:31 +0530
Message-ID: <20260417071432.2252380-4-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260417071432.2252380-1-ankit.k.nautiyal@intel.com>
References: <20260417071432.2252380-1-ankit.k.nautiyal@intel.com>
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

v3: Split the header sync and tool update into separate patches. (Ville)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tools/intel_vbt_defs.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
index 52468fc99e62..feca1f46f56d 100644
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

