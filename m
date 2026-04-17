Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CAF9F8E4B4
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 07:29:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E1A810E987;
	Fri, 17 Apr 2026 07:29:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qru3qRrD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4558010E988
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 07:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776410968; x=1807946968;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=96O3ZsyzYD4cu5qiyHmbVPKq03+B7laMagEFxvHhJMg=;
 b=Qru3qRrDGT49XHTVynF22CLk+BMCi6YO2BdXxdsxxoR/lPNAQWmUWEVm
 cxYHN3qGmRjfDTlP0yaSAVLkNUawezedqpJEdy9OPt0BT4edFOYwnQkEy
 CNx5LRYePA5qLymfFhfOkrRKgLrTvW0/LB4qFwTAR2Af/tWordHrtpt7N
 SPWu/PZk2UdVlgwIc98LPYbuX6+5Tt5uS05kdBClERuLd9PYXgFUYIpLn
 GGzppOqjCz+XuG8M/3EklzzxblwRzI+IxeHGltULFKBOOyJwNkyG7qwzH
 SVuRURBA3lG+wXDjnKpsUUmHWlY55POmUTnP82grr6KHVmo7PDGaIW/22 w==;
X-CSE-ConnectionGUID: HNpCYZYBSC6OnQlx3wVcFA==
X-CSE-MsgGUID: 61EYq79RQVq6n4oYF1wjjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="81021129"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="81021129"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 00:29:28 -0700
X-CSE-ConnectionGUID: Q/xdqmVBToe12nCBz+6xQQ==
X-CSE-MsgGUID: HB6ydSG7SWedsnP3b9HN5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="268985291"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 00:29:27 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 4/4] tools/intel_vbt_decode: dump eDP data rate override
 field
Date: Fri, 17 Apr 2026 12:44:32 +0530
Message-ID: <20260417071432.2252380-5-ankit.k.nautiyal@intel.com>
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

Add decoding support for the eDP data rate override field introduced
in VBT version 263+.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tools/intel_vbt_decode.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 1cf2d7d352ab..778343395809 100644
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
-- 
2.45.2

