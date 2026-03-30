Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B241061B0F
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 15:36:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60EE810E6CB;
	Mon, 30 Mar 2026 15:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LwzjnCRM";
	dkim-atps=neutral
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010071.outbound.protection.outlook.com [52.101.46.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA0710E6B7
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 15:35:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SUCKt2oMnp59bwFMRlMMRtGuVrsV7jn03hAyOEhxSF7hZTf/qYzDjcQWfiHOogWAi1OvPrKctKFN7h6QFu7S2A/o25xN0vhOhl/Ah9c9eoxxMv2SZEUNVT53kB7ZXB4Bv05joFe7O91vO3HY62OdFIpAp69whEMzKIGqYp9wtEAULAxoyQ5/+SGGkTMYGrd1wdYB0lbKzJ+JqN10qKiKYztqWtWstXWQ8rEceqonfQHIc31lhQIdqCYs1eS5rGc0uhb+cc0lsEspblwdITtQJbvS+5B/BjgBfrMQSthyuNySWlkR3hf0xqoTCa7jSdSOC8hL7yDhT3lfm5MK7Nbgxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FWyLxflAKC0+sMzN3MMsBhINlaSUximfDnde6/I8eKg=;
 b=SYBm+L3YkV2WLAukF0gk6icfrGbAXL3dWKjzjJfuI+W1riYBEscJfvq2i2GpYKgk4fJhzkNlgUh+FSWsbJUgxTEdVAfMwhajvvzep06h6jqCBHHIv1bRmh0cDHfi/bRoyRxNiPe5Hcp5hTF/jTLdTHb8CyUSaWp4ZTuAG13QTJ1OW78KCeqSWAgE9aN6pSTM56mQkLIoveUQwUY5V9imU0aGgmKEeZ2Mys+h8rCg/113I7xfVptmbK1ZspdGv+UauXBSfLoZcbQUKUvD14k9hWPgjS9IHR5nnKNeqwjWz5HyljmLuRzjJL0ho3weiV60EXriETT7mk7/oyxXp36CcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWyLxflAKC0+sMzN3MMsBhINlaSUximfDnde6/I8eKg=;
 b=LwzjnCRM9aBBQOWpTqmuXSgnGD0+K6GFVX4llqJtd+u58Udv8PA/pobH8KzpL77qITTAlGc3ydoPKrbzP5jol6/UY1OziDGUoPKJaLdwz9OYdJEesnPeMj8Rt4oy6y/hLOfn82V/seF3lv2/F7eS5/l7WaD+l9iDxyJsM6Mnank=
Received: from SJ0PR05CA0069.namprd05.prod.outlook.com (2603:10b6:a03:332::14)
 by LV2PR12MB5797.namprd12.prod.outlook.com (2603:10b6:408:17b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 15:35:30 +0000
Received: from SJ5PEPF000001EB.namprd05.prod.outlook.com
 (2603:10b6:a03:332:cafe::81) by SJ0PR05CA0069.outlook.office365.com
 (2603:10b6:a03:332::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Mon,
 30 Mar 2026 15:35:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001EB.mail.protection.outlook.com (10.167.242.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 15:35:29 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 30 Mar
 2026 10:35:26 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Mar
 2026 10:35:26 -0500
Received: from hwentlanryzen (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 30 Mar 2026 10:35:26 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH v2 09/11] tests/kms_colorop: Keep CRTC active between YUV
 tests with temp FB
Date: Mon, 30 Mar 2026 11:35:16 -0400
Message-ID: <20260330153518.99898-10-harry.wentland@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330153518.99898-1-harry.wentland@amd.com>
References: <20260330153518.99898-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EB:EE_|LV2PR12MB5797:EE_
X-MS-Office365-Filtering-Correlation-Id: 59caf768-323c-4a51-892c-08de8e71f8f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|1800799024|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: fb2J2JSBkBpd608uaRTkuyTlzsAKDzkPCX6s0hEg08mnN9dEHbYX+SX1Ndcam2hqYAnWLLxHe3vTM0OQLYQLK2VbBl4OYKsYUPWXljpZb0y0AYoSHXjVkKFDwUtgLH7ni0URwfgevQuicXi3Pm+TatJoULWVCW1kg3O/JxaMTrfKEL+CbEuxY6hSv5kN+2hOPf1ruwKm0qV3OINMfUxYMBmKmEAG6eaqH/j+bhSue3tieikazOSmXTvEEHtx/eQy+kHom4plIiEEn/C2TzSh/Xh1d58RgO/YXKtB9jsx1l+sCdqtF7tnPDiKsm55jFaLaSBAT1NUOMt4sBKV/2uOD224zDW09+X3uvqZJWdMblwidmQXS3UCCdAmTydUN8EQ/A6BSTuuPxkX1YC6BHDu/eFa2JTOLaMKYV4PpU7B/g8N1mZh3B+WEfokHmaEerBpbc5FLUh2HMMZxYRbekXNR9CdvWG6f0aYSOoNNRB/2SWHBT3wvuu1tvnEdxI150WDRZqgEQPjJH53e8giFFApxPy0B2VdGY4aLQeWtTLsjVz1RckYV9MvlwNszCZRoJtjfOWhbsyskRViqvR/17CSnhcH2CTinRMT5W5de/fKFPunHE5n92dDt2KVsERbmD7B/+ttiETQiP0FkyWFa5xsKLpa/GOkXbywPf2iTAiadKmde8iNJLqtiArKTo/Arf9IOnlpz/VnsNaHrY9TimsMZwZMsLmJa/YGL1nHg58QtQh35E/IX9e5e4sLXJtswyp8+BmURhNodSKzfiitZfZetA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: AIOeMe9snKYwxKNLGzNrhZGBEfpLLSUrBkxCp4RFyi81J8QS6glhQdwWSmhzcOrWytKuS4lMDNW6FgrN30yRTbB8iwCprdVQA1R4lvhv0OXjRx7bcdya7XjSRWZmdsNoaQoOuYajlXccfGNc9Sv6MwG2ISsnCeVHXrbdsU8ihKp1UY8DaPa1AIG1/nUItrPUZd55BMgLwF0/QSEv07OIy8qQ2CHfEEIF2R4tOAI9xp5cKGLwY9aBt3zo0U/3BiyXDr6FLYj4udss9GGbv6Xn3NtWd+rS9a2Vj5QMizoPRSaPpxvGlIbCVEfzwCYtrYuCMI36xZY859Y+9rTLYfI3vfxImx19CgMdO5wP9Ds9HOHMmRVx1pWdUbrv0vVZOvLqZKJ6csbM3REUCPDNC9i6Lvbhkn0FGi0UQ0XZnrStpwcxY+SoCJDTL+F16bcIviHn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 15:35:29.0930 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59caf768-323c-4a51-892c-08de8e71f8f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5797
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

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index fbf254b694bb..34c3b5d1fe5b 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -591,7 +591,7 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 	for (j = 0; j < ARRAY_SIZE(formats_yuv); j++) {
 		igt_output_t *output;
 		igt_plane_t *plane;
-		igt_fb_t output_fb;
+		igt_fb_t temp_fb, output_fb;
 		unsigned int fb_id;
 		drmModeModeInfo mode;
 
@@ -611,7 +611,14 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
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
@@ -619,7 +626,7 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 				igt_require(fb_id > 0);
 			}
 
-			/* Run YUV tests - create input_fb per test with correct encoding/range */
+			/* Run YUV tests - create input_fb per test */
 			for (i = 0; i < ARRAY_SIZE(tests_yuv); i++) {
 				igt_describe("Check YUV CSC colorop");
 				igt_subtest_f("plane-%s-%s", formats_yuv[j].name, tests_yuv[i].name) {
@@ -654,14 +661,20 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
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

