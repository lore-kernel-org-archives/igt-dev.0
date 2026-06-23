Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481D4CD98F2
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 17:59:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA0A210EC3A;
	Tue, 23 Jun 2026 17:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ll01SfiP";
	dkim-atps=neutral
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011058.outbound.protection.outlook.com [52.101.57.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A3C10EC32
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2026 17:57:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s45O5Wsb9ebc7g6IM3aCar+aQ64rvwLzd9Q0I6eGpi4xS3wyXi/aXbE4IpO0n/SlEsDNhbxjEIHDZAMzRfSSjf27gtpb04rhJDTU1AFdw674foE7MaRzrp0Ya/RvnmWNM17n388O8lgKlByBdJqP9QRXx9UL21/AU8kCx+HuhYOv/3DpEoGQRX6Q/XvRJDQ/OUNNlJAz3eDfUaGXwSWjG3jsc1ToadP7oQXGPNErdvcczYra7uS86QULKzhkpwVsBI9+dMPQP/jibhBaMlng2HGg4scVfYPsVyAS52vgW/p6FKR39LiuypOyQyqAmwdAe2Cl8wC//pyX9AOiQNlM+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z5HzYRNAfKWMUID+9rJ3a8k43QsgmbCcR+Qld77fntg=;
 b=i5fAoIZwQreezpiaxipzap1N1Q2pvwUZ5629k0SAS0eBP2F2SJO325KOwiYIoc1q4Ihh/RGPZ/my5TIFEIxsQlS2Nhl8tJBSZrcVasG6MbHzF4QFHOfvzpZQZcqANKI1Dljj297GolBMnNwloMSTaRgEGPt3LjxNOEvDw5WNRwmqBiUoWTcbqfVG6FFo4Bhx7fj1ajXEpCiZUBrgXfS1J4vJngZb0uFCYMYVtdwOC/TxRsUCCmQS38cAlGDj+DJZkKEJW2kPZmW3xECBLgT41q1LJhhlsHw/39QzKNoT3Tl6Kr026izjvEbFUKNZDH8VNN528KfwMwNAOpqofLzNQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5HzYRNAfKWMUID+9rJ3a8k43QsgmbCcR+Qld77fntg=;
 b=Ll01SfiPR3AAXkhX5YYZF4QGUYD10dF7BI1hFDgZ4AFpiLxY9UB0h8dGzHzbZIUeL36il97i2S/JDbU7lyiDDFRIZP0jgeVoCW9kr3LY1YxfEtpdF4il05P+1yNS1SdeDwoFusetNUbDwRuE3u98B5q4ajze4Eaps46QzeGwEMQ=
Received: from BN9PR03CA0622.namprd03.prod.outlook.com (2603:10b6:408:106::27)
 by SA1PR12MB7444.namprd12.prod.outlook.com (2603:10b6:806:2b3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Tue, 23 Jun
 2026 17:57:52 +0000
Received: from BN1PEPF00004680.namprd03.prod.outlook.com
 (2603:10b6:408:106:cafe::38) by BN9PR03CA0622.outlook.office365.com
 (2603:10b6:408:106::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.13 via Frontend Transport; Tue,
 23 Jun 2026 17:57:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00004680.mail.protection.outlook.com (10.167.243.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Tue, 23 Jun 2026 17:57:52 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 23 Jun
 2026 12:57:51 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 23 Jun
 2026 12:57:50 -0500
Received: from hwentlanryzen (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 23 Jun 2026 12:57:50 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v3 10/12] tests/kms_colorop: Keep CRTC active between YUV
 tests with temp FB
Date: Tue, 23 Jun 2026 13:57:35 -0400
Message-ID: <20260623175737.171142-11-harry.wentland@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623175737.171142-1-harry.wentland@amd.com>
References: <20260623175737.171142-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004680:EE_|SA1PR12MB7444:EE_
X-MS-Office365-Filtering-Correlation-Id: cfde4b23-ece6-41f9-29ec-08ded150f240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|18002099003|22082099003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: a+S6sV+RXxuFx47NvSA/QpvODuIf9CAed4z0mxouTLxGtvXVk7Ij3RBu4/G7Cp/bRM5n2PZ6EQkLWRewZfRmleOtr6ZKBG4vz/tZICVENKsxmv8qQnXHjvkoB4wTgZblSwp46U3/SOaYfvJWqD8JXIuSpOkCn1oF8LMzeXSa5A5yBSDDuwCrpnSqIObQX9QAbtC1CHjI4qDgjgDEAornbSpdJ9Ic6JcrMNuxnYTulNLfgCQPCPyeQws21Te97k5T4A1NmtGUQOgbGikLU2Ag+WvMl7gdGFnSw3HxBtUobeDQzGYHMhchhKi6h2VUeNsMYeKjg8C8rKG3lYc6G/ydsR1jIensoqa+VV1IFDeFoWzgiHvfRcZ6wWgjfLSELc3XwbuWp2cey2TCcafY+yR85S29uoLwXgdNqPX7aFiAtCFhceIIf6zDLHPOBPJ53Us7qSTZ1Vvhd7yXrmwnK1c2wYaZdm8qZo++IK9QIbvM2zsIcmlaPDsUADaf2Vuj6Ll5X6K893pWJBOUA3d3eL2e8PiBpygy7GDI7U24rRYp3+JelL2TsHY6SO1eVauYPNkE2dZeizn1KXSaqZ+MJY6mcvtGPT+B8UWLt1KEoiV8ZR9ZU4ngaqt/Qy2KlLTE25AqX9X9lz7U2CabNJQVgtVj5P1Gu2GVLrK1ZHyA1dVX6jBt71lbvwOY7eklG/dQLvHwLP7wFkAzRBHPqdpJideBNg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5co0T8DfKBG9E9e6suoLuvrFAIb6lifCCraQvNK3uPWHBIbvBGbZgWS94OWKRfbR6tQXNZv+pxS46ksIkaSrq/0JlQFZrV9r7bNTq2Wik3O5uArbmWQFZHcSyF8a3wAxhzt6tSRiN80kWOoP88eQBE9FNUPHt3LRx4dx/EVq4CwsUmcxmynTxgbgFc1TuMAy9tT4ibDW1XoPjdX2qKF/UIVyYQXqqwnlJfMytKhwaUwPQeuJ5/FbHTDKfdn0c8DXTxvVnpjj3dKzhjzonaTFEdNmMb72/jWO0OuqNoHP6gkEFop8VRf65x1aJQ1QyqO0n5WykHpqWrItPAxyCRSTqenygBcgkhbl8wrwIr0ZvUp6z2bc20eLoMxxENFXGAPu/YbX3mBUoIhcjkm19vzlccyMLXJTSVbV8Wjfu0STtFl4MVu1G/bC0iRHxOYMVYWX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 17:57:52.4647 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfde4b23-ece6-41f9-29ec-08ded150f240
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004680.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7444
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
index 1d30d2538574..4e8b2563ea4e 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -585,7 +585,7 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 	for (j = 0; j < ARRAY_SIZE(formats_yuv); j++) {
 		igt_output_t *output;
 		igt_plane_t *plane;
-		igt_fb_t output_fb;
+		igt_fb_t temp_fb, output_fb;
 		unsigned int fb_id;
 		drmModeModeInfo mode;
 
@@ -605,7 +605,14 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
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
@@ -613,7 +620,7 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 				igt_require(fb_id > 0);
 			}
 
-			/* Run YUV tests - create input_fb per test with correct encoding/range */
+			/* Run YUV tests - create input_fb per test */
 			for (i = 0; i < ARRAY_SIZE(tests_yuv); i++) {
 				igt_describe("Check YUV CSC colorop");
 				igt_subtest_f("plane-%s-%s", formats_yuv[j].name, tests_yuv[i].name) {
@@ -648,14 +655,20 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
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
2.54.0

