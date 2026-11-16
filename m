Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8A7606A31C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 23:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=H79E2/Kq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 165EA10F4AF;
	Mon, 16 Nov 2026 23:03:20 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013051.outbound.protection.outlook.com
 [40.107.201.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 479C810F4AF
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 23:02:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i+T1A5jZIPihtBM4urMr/U/r6aEOK6k489rweOMSoD9+G6WVaZoYqC3Is/w8F7Umgpb0muyLOv03cwBJ//yKRDSvfa4V0Ctn6PuOIPEloKGKgKRWkMuJzUQ4ruczeznBlG3NLFTy5zHn8mTDA/bQLDWsfyTEXmQq8HTZbE64ceUNxtauSn1IxC6bvt46dO92A8GPOC0zyWxtp70XgXOZ7bQXmVrobb3bCsubqjU1H2pny+x3vDa/CtbYcJbQlvdp/ScMsD77fXFTAQWZvomG1IeJ2F+78bz6teTakrSUh8tIPxZUT2mlprtFNypwuGXb95Lv+2AGDBTYzANhNMj89Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eSvX/q+vbPHbcUHGxZf63RQM0tjXWX9gm/ByqskBJ6c=;
 b=vVCdMc3+6/aF3/AnBvqSsGOoRgxS0LVKoxGcbSCqtcfDgUfUV+plF5fWej5nCG9B0Q9k7wMsGhIkUYC8ACFuk6oU3wAWEhPiMc+RVeOZdU8PLx3Q5v6Q8vpiLMx/81d9pT8S0lLRaQlirV+MqsIr90A5s2LyMWPfzQAV+NWu9iXzXJELU4DIT1HTkIcoSnZ/p0MKpHrNpfTawhs3uK/NP/IEpSm+ToLlWFGojRHVa/Cw8wtcVtOwR18Vx9EmirXm+LUWy52Wlt4CYUpxA1JyLqtGf9ZBiZXKSTcSJQAUTIW7AxLUDJX+bxQIsn2iTMyBVFZsiNBPHe/gEm5za+Tczw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eSvX/q+vbPHbcUHGxZf63RQM0tjXWX9gm/ByqskBJ6c=;
 b=H79E2/Kq7yW6JsLSd1U/dkoDdZRtGrFwbqbNmtyt1muNwPl9DyII3OT7vEVSDWG5PVDVYCum5f+Xi8TA3K6RbZyKWflSk2CcHDPEpr7tKOr6s7pYpnwU4zx3mxq5CULAI4dnLSsvexoYxTfdV2wPzaCr1FbP1pBY80qUBpN7KEk=
Received: from SJ0PR13CA0164.namprd13.prod.outlook.com (2603:10b6:a03:2c7::19)
 by IA0PR12MB8907.namprd12.prod.outlook.com (2603:10b6:208:492::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 23:02:05 +0000
Received: from SJ5PEPF000001CB.namprd05.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::95) by SJ0PR13CA0164.outlook.office365.com
 (2603:10b6:a03:2c7::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.0 via Frontend Transport; Mon, 16
 Nov 2026 23:02:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001CB.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 16 Nov 2026 23:02:04 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 17:02:03 -0600
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <Harry.Wentland@amd.com>,
 <Haoming.Qi@amd.com>
CC: Alex Hung <alex.hung@amd.com>
Subject: [PATCH v2 1/3] tests/kms_colorop: skip early when no pipeline fits
Date: Mon, 16 Nov 2026 17:00:46 -0600
Message-ID: <20261116230048.2020931-2-alex.hung@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116230048.2020931-1-alex.hung@amd.com>
References: <20261116230048.2020931-1-alex.hung@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CB:EE_|IA0PR12MB8907:EE_
X-MS-Office365-Filtering-Correlation-Id: af4ca267-a1f8-4254-b114-08df4435a194
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|6133799003|261009223027099003|18002099003|22082099003|261026140227099003|261021121427099003|261021123027099003|261028144727099003|261102123227099003|261022105027099003|261022075727099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: 9FjJhpmdTbqmOftgcdFFF7/NvSn7Y25aG3ntWIHlBa/aQDzpVI9yBqgRaHdOl2y9gl+TTR+M5gp9SrHbA9fHLgU4k19DTspT6jfV2LJr+24htBoCe7e0jZs/n0Sl72La9sDCxQBe7BbLOgAqVEIPDodJatmD+24J68sP0Bt2Q+AmE+tIpJJsEVA6mC0/WMhZBdFmPmcoRBLTnaVNfz/Ldda3P7T+F/07J5opguWafLkb0IkGXnKYDKtYu/MC1eq+t905fW2WVGFOZRIvUYtPLg2oa0TdGSBMRcJzmUT66vxSAWKIu2P2O1QFvfOxczUvCENRZY3hfe3FUVF4OHqy2NeMD0pT4qcjPUUC1YUE3SLbTJi787Qu1Qne8bRba9Pg8WmPRp4HMOTelsOMY4VY+P/3U9RG+p6jy9jzUWgUzB1nSHYkcH56Dru7Whs96T8wKKBAnCyOfKX5ZUydYDKOiN20Dq+Kr7HqzjOt6kY2vwfLWvKvtyPJz+KERjYYd3/OPUPQADOlRbLgjP3c7wexcwYVwgTtviciAHUUEswOXeDr+4PaoA9h7DHW6ClZpdB99G+/6rtNu21pga2x+TiX6IZDUJ4O8c1sRCVBmeynA5BeWAu7DTrcxpH6VZK9I/BSZHvk7nhWmGCeHrqoAX40nBVYaUcTiAtTHIz6uUswmM+cOp5VrscLuPQd60Vux9bNJEkGer54lhEwUysYPpqwvw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(6133799003)(261009223027099003)(18002099003)(22082099003)(261026140227099003)(261021121427099003)(261021123027099003)(261028144727099003)(261102123227099003)(261022105027099003)(261022075727099003)(56012099006)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: U3ZmOvOGIkfJsCHdoifZLnonoyzYKNYg9tXwrqkYk1NUdic8hf+1GteQycZi5tEeD+7lpV94a1EZ8mcIaz273MGLUZYZrkNNETwcAjHSx0ya9O9pCjPLP0KAT0qTxziCeBE+BG2LE2MLRUgPYrE3lIFwiGgiFC5+ibBqUio0vlb+TzY9V7Oy7vC3hzo2MzXtq8uEbdNjb4DNKUYozULrmwVXosV6AJA/FOIhKyokw7QjOszC5jD33qERfgYrqBAcsmkeMnPWUVcUmR/C3dkknDFmySzu2yur2jl3jB8YKYJgzCdv3NgOuJu/1Y3DkW28CHt+yZQT5mkZF73wPhU6+m/EJWtyzkPzCaZ4Ukuvv7Ym/MjCw7ey0jOD0+jA1TFFe9Xm5OeZJHaU9A9qVNWzIrKA0NR/yQi/exLctP6wtgSZ2uPBn/CGfA7+3V7u8Cf1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 23:02:04.3730 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af4ca267-a1f8-4254-b114-08df4435a194
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8907
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

