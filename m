Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60D6FED9E7
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 16:05:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD4E10E587;
	Tue, 17 Mar 2026 16:05:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QfNctz+q";
	dkim-atps=neutral
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012050.outbound.protection.outlook.com [52.101.53.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA6210E6EA
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 16:05:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XP09jHTxHSY+SNiYxXQP93tAuHYxKGRHYg6ZsXpuw1AypuJvtIb428XSasMgq0e11eIayoZRHevuL7+yk2fqJhQ4g0yj0N8k8HUA1ghN4jaMjzyLdF27Zyr95/iWKXBrdX0ho+Uju9FR4rP7eyFUxJdjdAwlDf2PwaAmR/zmgWdh4hw7fj9cl/MhPhm1uP3tqOwBcz6n/ngGcBO7ulSsmBzQO0RFafAxHXS1E2+rw5ZEiKdODsJrMDYf47XUJxtBshM7KqR8Q7wVgS5gfV7fuh545fg5JhiuerYDQHiUXoBbmGMJqQkGPS1yIyNSrNVDBanXCBzvFL++9OiR9m9SGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GOLaCfWb7HZvfbNZ52znuoeCoKKCF22ZG5vZykBKXzM=;
 b=bR0WGk2IY65Th9ZIjDwOFbEI4gU4BlYhc6+ujmAqHmm1ZGtsibigg35rToFos+wt6YRSAAJrd62nFpfMZQq0P4bJVxRc1wW8pFBXmIzJcuA7M/lz9NS+F8mNQ0EGUzq4+SRaygUJdmqW+rmcsLZVpuY7Zxi360GS/JJDQjctg3KG3s3+iCuIOezDAfExibcrc3mGLV+PhhPp/dx/iKqOZ+oQ4vaYfQRSDn3MYc+UeyPsuXbhKBrO7fjNzhksMsAFhAMp6UcMPBKA47E3j1m0l7nN6QI7tXCFvwLHUAZg7XxX5H9m7rlsZ4edzq3XqqKlHpazXYTMQwvyGqygLeoZyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOLaCfWb7HZvfbNZ52znuoeCoKKCF22ZG5vZykBKXzM=;
 b=QfNctz+ql5jqgzHWEAZxH4sl47ADRa0pwlT9SA6qI+SH1xmKC8tJu9xMMUVM61WUNdiLFtQmAmE6Yhvns3/OIs1ZVT+iWSPMqqPm/rqphl3ME0SvjaGVMR6v8jlJo23FODQsE0pua8IJtecO95NEDP2LGm4owZ7oxxC672Z4ikw=
Received: from SJ0P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::31)
 by MN2PR12MB4174.namprd12.prod.outlook.com (2603:10b6:208:15f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 16:05:13 +0000
Received: from CO1PEPF000075F1.namprd03.prod.outlook.com
 (2603:10b6:a03:41b:cafe::93) by SJ0P220CA0011.outlook.office365.com
 (2603:10b6:a03:41b::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Tue,
 17 Mar 2026 16:05:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075F1.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 16:05:12 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 17 Mar
 2026 11:04:50 -0500
Received: from hwentlanryzen (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 17 Mar 2026 11:04:50 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH 08/10] tests/kms_colorop: Keep CRTC active between YUV
 tests with temp FB
Date: Tue, 17 Mar 2026 12:04:34 -0400
Message-ID: <20260317160443.229812-9-harry.wentland@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317160443.229812-1-harry.wentland@amd.com>
References: <20260317160443.229812-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F1:EE_|MN2PR12MB4174:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c2618c3-c674-4b28-3aa9-08de843ef871
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: Gauc89y1DXf57PVa1X4WLgK2rPxSS21nQ/wG3BS455xNDVBYnsnrzjBFnsJpieyWnX3aBTwzHOzhD0ruLlc7fZDuScQHiZlAJlSmlVVw+fJaSpDDAC3UupXlNgCAuSHVyKXOzhAELDTNyUff7z1lKcqIZC7JzBSaDIH6VCLQb8jDHyIYmIwNqAZPIkJNlvzopfR+v1558UrPX7OGM7YLqN4EgCLTlk7+a0rezCvpNn5387Z3+k5HWjLSakF8jWxxSaZFViF8QkfsEvfbhZkDXkjtulDJgSgmSEdxQHHXM+hjfPx00J+hFt6UpvayufOGNEPg7iUsbvQwtGp6L+C1eXbGiN5ZMl/TaIqDQX2j64PwMF6UStpnLbfzbhfF9nTOd5/Q2ITX/jhLt09Hjz5ni7iNxiooOeIg8kIUUhPhyUSZGFGhl8XFCKft1GSwcjcHzKtfjXyD8wfc2iwwLgJAiLtbMMrVfwZetSExHYLSllEn5R6Mn7VD90Wo8BzM5unjxxos2+QKgj8V2l1/zIPhDC2cy8KwerIdCbBieDRzXxvtIi+xEY12jVV4yrIbJdCcDeBkPY7SizFWorSkPfQTRt5tDq/iGXyYDFR0p2hxoGewBRKi8FH/NihNLC7mCCc/AeCf1Tzp6CpWrke5ylLZVqmj1ZVOUajeyOS7T4h/6kzPN7vJZQYDOmnrwcRQOJCvCiViZcAEcJbjYq9o7RihfAzfdf1hMYiMZQWj3L7B6TynRnZmsEIhlzqutDQ5UlbSELJiby38TjBTIbwgcRqKLQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: aWAijw/49SkzuNbghCoiWVexG89nHkYqE0rZ8Ba3izlbf1Fa3L1IVpHBbnHl5yxdVWeg3jGoSJY+wAFZFdZFqbt6azk46/7pUtwpvcrYuUHZD53UEjiIJgFn+oOJBRTa5/hQ9WEQnBmFyxvBQScAa5e7Qkt7PnFxwD9JCeTSP7pJyxNM7qct25HUzF1ilTfpwyCXKu9WW0tbRcsDsXKKIcXRvrNctaYnw8ZJtqfy5LOOQiDgqknrn4+AADkQxxWAyh7Lz4JewNTDjBvDPcKqNsHQbAQX2D6BR4LEFEbQrPBLYGZxu+zVDL3YTnGqsIb0yiPMqvrvT7YtJow5NZCmS+mFDQRbWIj8OJT3fBOGt/e/Q3BVXkcp5ohF1P8Ly0UO7/YibVhR1GDNCEeW3yyINkKIvJ1ZaEBtq82K7X98KS7J5jl2lfrla9s1nnbYpDX8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 16:05:12.3109 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c2618c3-c674-4b28-3aa9-08de843ef871
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4174
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

Move output_fb creation to fixture and introduce temp_fb to keep the
plane/CRTC active between YUV subtests. This prevents the "framebuffer
without CRTC" error that occurred when removing input_fb caused IGT to
disable the CRTC, leaving the writeback connector detached but with FB
still set.

Each YUV test now:
- Creates input_fb with specific encoding/range
- Runs test
- Switches plane to temp_fb (commits to hardware)
- Removes input_fb safely

This matches the RGB test pattern where FBs stay alive across all tests.

Co-developed by Claude Sonnet-4.5.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 928a414236e6..3c39f917dfd3 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -586,7 +586,7 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 	for (j = 0; j < ARRAY_SIZE(formats_yuv); j++) {
 		igt_output_t *output;
 		igt_plane_t *plane;
-		igt_fb_t output_fb;
+		igt_fb_t temp_fb, output_fb;
 		unsigned int fb_id;
 		drmModeModeInfo mode;
 
@@ -606,7 +606,14 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 				igt_assert(plane);
 				igt_require(igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE));
 
-				/* create output fb */
+				/* Create temp fb to keep plane active between tests */
+				fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
+							formats_yuv[j].fourcc_in,
+							igt_fb_mod_to_tiling(0),
+							&temp_fb);
+				igt_require(fb_id > 0);
+
+				/* Create output fb shared across tests */
 				fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
 							formats_yuv[j].fourcc_out,
 							igt_fb_mod_to_tiling(0),
@@ -614,7 +621,7 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 				igt_require(fb_id > 0);
 			}
 
-			/* Run YUV tests - create input_fb per test with correct encoding/range */
+			/* Run YUV tests - create input_fb per test */
 			for (i = 0; i < ARRAY_SIZE(tests_yuv); i++) {
 				igt_describe("Check YUV CSC colorop");
 				igt_subtest_f("plane-%s-%s", formats_yuv[j].name, tests_yuv[i].name) {
@@ -635,7 +642,6 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 									encoding, range,
 									0.2, 0.2, 0.2, &input_fb);
 					igt_assert(fb_id >= 0);
-					igt_plane_set_fb(plane, &input_fb);
 
 					if (data.dump_check)
 						igt_dump_fb(&display, &input_fb, ".", "input");
@@ -649,14 +655,20 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 							formats_yuv[j].fourcc_out,
 							tests_yuv[i].colorops);
 
+					/* Switch plane back to temp_fb to keep CRTC active */
+					igt_plane_set_fb(plane, &temp_fb);
+					igt_display_commit_atomic(&display,
+								DRM_MODE_ATOMIC_ALLOW_MODESET,
+								NULL);
+
 					igt_remove_fb(display.drm_fd, &input_fb);
 				}
 			}
 
 			igt_fixture() {
 				igt_detach_crtc(&display, output);
+				igt_remove_fb(display.drm_fd, &temp_fb);
 				igt_remove_fb(display.drm_fd, &output_fb);
-
 			}
 		}
 	}
-- 
2.53.0

