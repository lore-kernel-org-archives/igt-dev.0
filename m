Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D4D606A331
	for <igt-dev@archiver.kernel.org>; Sat, 14 Nov 2026 02:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=vvMdE+b5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3DE910E4EF;
	Sat, 14 Nov 2026 02:09:06 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012025.outbound.protection.outlook.com
 [40.107.200.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EFDC10E4EF
 for <igt-dev@lists.freedesktop.org>; Sat, 14 Nov 2026 02:07:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xr9FLG0P8XoQ+R7dMqxvlcykdSlqOuhJwgjc7UwgJkNITy/Zhx2H8pWXOZnuw+Z7P4y+sNVFVHeY0PAM4UJaIyjXiPkBsip5QfB9PY/6uGheD62eUfoFIDuEyLneqH5UBYO+LTWO3cSOzJsuO7qmwCDeR5/aV1uiVU4YlzY32Rfo2zdZL9H2z7TalEJAe+fs96DwcnSKcA/+xLhAJap7noM1RNNihFZnT2uLy2JFZh8L7Sj5sGtb1SSgBTz51gYfoC7ieb0k4htKremFDPmsNfco4LElu9PwDi/Ag6jQeQyRdpNd+VmuMZdu4Vbkt/EQVs9KbMkJiurY28HJRrPD1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eSvX/q+vbPHbcUHGxZf63RQM0tjXWX9gm/ByqskBJ6c=;
 b=rmwVUGAtPIsfwFL57rVxaSc0MHkdtWleCK+qOt4Znqde3MSDNNvjwcXjf4wLaf8B2teaEUKavmPfuedxnrNMLUKio6FRFB56yiHdTfvvZI/ej0MFhcLgeBh8K3F8glDV8D1g4Q/TnDRVpWe6D74/oVAwSW9xydkUtLA/7Kvxy1LKCt3/QaxPyBXuUpxYbxj5vxT6Fj58H/UEGfKl/RtUsIcn7c97jxvokOIuNtZfoGVlP4WovARvQCZzIGgrRAcCouJYBY4DXWqg8LhVco/ksdEP9JNnGynFyiP192av2jSGwBK53gZBOq6R3ctcJQVfyr6bqNeDipu+/nJvGXRlUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eSvX/q+vbPHbcUHGxZf63RQM0tjXWX9gm/ByqskBJ6c=;
 b=vvMdE+b5Izq53W3jmck7jbA8c/QhJ/iKyOVWXnkWtGDtpvnBxy+sMXGq9xrUftmyWa6zgxADVI0FSk+29rWtU0oXe6Baz1dGtJER/wRxMfCDIdHtTzOFBg/K2o2LKmveW06C+jYZY+Nj+n5NnlngPeWAsNEs0VHYhIcSuPXCQlc=
Received: from BL1PR13CA0226.namprd13.prod.outlook.com (2603:10b6:208:2bf::21)
 by CHBPR12MB971693.namprd12.prod.outlook.com (2603:10b6:610:340::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Sat, 14 Nov
 2026 02:07:07 +0000
Received: from BN2PEPF0000A890.namprd04.prod.outlook.com
 (2603:10b6:208:2bf:cafe::40) by BL1PR13CA0226.outlook.office365.com
 (2603:10b6:208:2bf::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.0 via Frontend Transport; Sat, 14
 Nov 2026 02:07:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000A890.mail.protection.outlook.com (10.167.248.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 14 Nov 2026 02:07:06 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 13 Nov
 2026 20:07:05 -0600
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <Harry.Wentland@amd.com>,
 <Haoming.Qi@amd.com>
CC: Alex Hung <alex.hung@amd.com>
Subject: [PATCH 1/3] tests/kms_colorop: skip early when no pipeline fits
Date: Fri, 13 Nov 2026 20:06:12 -0600
Message-ID: <20261114020614.830491-2-alex.hung@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114020614.830491-1-alex.hung@amd.com>
References: <20261114020614.830491-1-alex.hung@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A890:EE_|CHBPR12MB971693:EE_
X-MS-Office365-Filtering-Correlation-Id: bef8f130-a634-4000-ab02-08df41f3fbe6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|18002099003|6133799003|22082099003|261009223027099003|56012099006|11063799006|10067099003|261102123227099003|261022075727099003|261026140227099003|261022105027099003|261021123027099003|261021121427099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: VCU6CDcW0NYYcgU9dgWCAiheJYoCvjXpKLK3ca55oKvxfViCP14ap6E1xfV3E8Je4ev5qWOs9rCkCi/BN3nD8ZOwWpSBApzxoq1l5A+wv0/VHcXtIM300d7NqZOLxbaX9h7l+5qhwXNfOdHIvteVDCTxU1x4Q2T9K0Na31on/xuqhp+2IsQtJlzyaEbUjrEmVoUMZcvX88cSVCWEUdW7WBGGsKGnUhWujr4XHzbpayHmQSrOWTuTcOP8QT/YUQeAXzRJjpSrMSwaVPiIdd9/IIozMSSuJUjXHgByrbqgPLKJC5TI04usYAKAX8qJMigfury/ZdHbd+64Fu9oiZV6NRVpJZwIer459HNQOgtYU3zjQg8xh+c+HcYlH9zUfWEZ03ZMHrvZxv6ZCG/7UG+tsCpi/CCWj+71RsRpctDlR4Ekbbk90+DNvIpilBFgrAuGRKnkq6ZO6+9/vSDMzuYu9eFoCBM/xZkm/kWzlZM/kzWss2ject9Px0qS8GLdfcOU0FH457PDScUjcNRx45gg2bAX4TDCNQXIFDYLZ1MLABODQXBYd1JLrAsINA+2jfr08pgMPmrpFxHXrrVyCK4iJ/EkNkRcvEdBHsKcXSvRJjZ/vpZyUbq/WsHezYOhueR2MD/j63p69XVNyUthvjbGTInShX5Xu4X1ahL4HTxgvJkwWww0Od9j5dujCoqcwh8P7gCR+qQcC1yafYrjhRE1pA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(6133799003)(22082099003)(261009223027099003)(56012099006)(11063799006)(10067099003)(261102123227099003)(261022075727099003)(261026140227099003)(261022105027099003)(261021123027099003)(261021121427099003)(261028144727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: KWw5s1r/Y8kjrArAiBHXavK4blNGvFojc3uae9BXKfDnHbldXhF5Vad92WnCHG2Z6oxmwV0XqT+vX6Ial09OBhFCETQrXYD8aEQSkRXI8vjQiEKt3paSWCLjfZQR02UJEf+smgfi4dCilqPj6Rwv/d/fM7SKToMRfDcwcRDs8z8B7HbNmozvB3Y3cQic6AS6dy+htCaxGayxbVXPwVz+9PBW20Lehn6S3CoXnz4v73LZqiTO/BrNXsViHK8cbbERsiQjB7vhDKVHmelQAQJIispE3xxG5K5RWFSc96eIiIdwHZnBagu/quMehLIhaIWMdkD3ik8jv39itIZzibpsiXh51tWlox8mMUpUeqO62awSn419eBjcaOHlGRnBRlpHM3IJ18g9UsiXXzICxBjHAF0oTei03azb6LXHQuL3A/tB6cNoEkCo9JF0YPXsCebZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2026 02:07:06.8539 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bef8f130-a634-4000-ab02-08df41f3fbe6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000A890.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHBPR12MB971693
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When the plane has no color pipeline matching the requested colorops,
the subtest only skips after the reference fb was created and the
software transform ran over the input. For YUV subtests the input fb is
also created first. On amdgpu both read the framebuffers pixel by pixel
from VRAM, which takes 16-18s per P010 subtest on navi21.

Look up the color pipeline at the start of colorop_plane_test(), and in
the YUV subtests before the input fb is created, so unsupported
combinations skip without touching any framebuffer.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_colorop.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 0ccd1acdf..970594a2d 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -285,6 +285,12 @@ static void colorop_plane_test(igt_display_t *display,
 	igt_fb_t sw_transform_fb;
 	int res;
 
+	/* Skip before the costly fb creation and sw transform if no pipeline matches */
+	if (colorops[0]) {
+		color_pipeline = get_color_pipeline(display, plane, colorops);
+		igt_skip_on(!color_pipeline);
+	}
+
 	/* reset color pipeline*/
 
 	igt_plane_set_color_pipeline(plane, NULL);
@@ -311,18 +317,10 @@ static void colorop_plane_test(igt_display_t *display,
 	if (data.dump_check)
 		igt_dump_fb(display, &sw_transform_fb, ".", "sw_transform");
 
-	/* discover and set COLOR PIPELINE */
-
 	if (!colorops[0]) {
 		/* bypass test */
 		igt_plane_set_color_pipeline(plane, NULL);
 	} else {
-		/* get COLOR_PIPELINE enum */
-		color_pipeline = get_color_pipeline(display, plane, colorops);
-
-		/* skip test if we can't find applicable pipeline */
-		igt_skip_on(!color_pipeline);
-
 		set_color_pipeline(display, plane, colorops, color_pipeline);
 	}
 
@@ -727,6 +725,8 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 					encoding = tests_yuv[i].colorops[0]->fixed_matrix_info.encoding;
 					range = tests_yuv[i].colorops[0]->fixed_matrix_info.range;
 
+					igt_skip_on(!get_color_pipeline(&display, plane, tests_yuv[i].colorops));
+
 					/* Create input fb with matching encoding/range */
 					fb_id = igt_create_color_pattern_fb_yuv(display.drm_fd,
 									mode.hdisplay, mode.vdisplay,
-- 
2.53.0

