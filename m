Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363B1C3600B
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 23:43:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA46710E79D;
	Wed, 26 Mar 2025 23:43:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aXAHJ9LK";
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2071.outbound.protection.outlook.com [40.107.100.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7AA410E79D
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 23:43:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eFdvoLAaApcYU2C/j86NbBsj20jJeBIOQWE/XSEbrBVJN2T7QzyjkVqkXhJNiw/QJB+j9s2kMjMsrXBe9dP37daZE3t/PaWmFutnG4a/dJlscXKSbvCzMcjWCkmZwsv9fz8tjZODw1NYOAvNJIoT4W5BC/Cz/nyWPDYnPhGoRkdMbWfojxUr9rKhskRPwopFRx+u7UBhv3fbBYCKLaiVOUtjjWQAzPA9wy7wlP0+9wEebhtozzJnMC0jrUZGO1+uZXO08Ry9DYQqAYHzj7htOsHXMdmSC6M903oVnz0Q4F8QaDvgpvfECRoGtfc/a/ZS/pCtwwSvkYxgGnZVUsPqZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fl2Nh9sFBloo0kNT9x9j835MKPtkdudQg9Kh3rLJCZo=;
 b=qOzGmTWxMbvFXzR0oRwE9Sq+m/lugURRjO2A3SV/0e0AD3qNSHnjNiazTgjcL9XzNdGCNIxh7t8uI9IPT114RFYWP0QbjiwSuX05P7SDwKl7Og86NDBxJah2ODTGoOClahCqHGEaYlEFJKY+gfhNa/1dGSXt8RlLERmZN5y76QuyU0qOSTT4klQlmEw0vJIW8/kDvbqcsqWqk2FbxUXZsgjHxAf+D7pXdpPezmU5SopmnAs4SCMgv+EakFWF7od7wv3xWknQ57RWTAJznAQ7Ln+AxdGN9ACkUIG5Hh7LgLiZs5fEREVq0N/IOoGdsF0ZWgEvpzhRyKOiCLAYbTwhcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fl2Nh9sFBloo0kNT9x9j835MKPtkdudQg9Kh3rLJCZo=;
 b=aXAHJ9LK2S2oYPgshrYXZQ/tM8S+b08vcuYgczGUUbG3p+/IT0H2ne/YekGaYPftDT0edR6lwVUH3/R2pZ67Quz8kJYWv+tsYKbTYTv9nGOhyNjZPF4IdfOkdRYtDLtA4cWC7ZPGD+NuJss8NECfA1YF5izsaXNw6PAH2K81e8A=
Received: from BL1P222CA0009.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::14)
 by DS2PR12MB9685.namprd12.prod.outlook.com (2603:10b6:8:27a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:43:45 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:2c7:cafe::4d) by BL1P222CA0009.outlook.office365.com
 (2603:10b6:208:2c7::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Wed,
 26 Mar 2025 23:43:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:43:45 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:43:44 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>
CC: <harry.wentland@amd.com>
Subject: [PATCH V7 21/37] kms/colorop: Do proper setup and cleanup
Date: Wed, 26 Mar 2025 17:35:53 -0600
Message-ID: <20250326233609.2980110-22-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326233609.2980110-1-alex.hung@amd.com>
References: <20250326233609.2980110-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|DS2PR12MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: 96b41494-5d7a-4314-9d2d-08dd6cc00c3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hxc48IxYjjWzEx2nT/rr5A+2/5mTAWe77tjDFfDZwBhaFOqcgFU7TLFbP0ap?=
 =?us-ascii?Q?g9zX5qFnoZZDdPmLXtYV1VnVdaOYeoNNeAUN5JBVPWNMEF6doQIrfNabcY/g?=
 =?us-ascii?Q?XIEeT/oEe/cOA34eX3Kt69NK9igkToh9/4VB5QRSXs1s/I18V2LRobIRDG81?=
 =?us-ascii?Q?2iutfavi7RcexCc2yoOmyDyNozkLbVY9mIDXwmdUOGrxk7AwCSs6Bnt3lgcd?=
 =?us-ascii?Q?CvzkJZMSWPrA1LTRAgZBb977vkbnGv0QvyHBQxuwE5LBSy4hwNTv9UsXVjFT?=
 =?us-ascii?Q?dJ6y/XaVJI9wrPKe+E308qnidd2zij/ezPpCaCqvdlj50DrRIam/YOR0qkt3?=
 =?us-ascii?Q?iW/412/6b40zQ97jD76VM9r0eELMvukGV/ceFgsKqUBZx1Byjp4+LrOOHV2/?=
 =?us-ascii?Q?AsnA3j1GVEFt4QWGOx7D8oWrUuQsMlUmb6U228X9fXRFrC2wjqPvO281Eb/V?=
 =?us-ascii?Q?hPVfXwxuFuaazENYubygEZQkMo4f0c2i/q2rPyoKbn3isOpbhHpzMuAxkD/N?=
 =?us-ascii?Q?SAhUDlh+gFo2p6iIGPwtZd0xWBoWmsBUxywkjO0E7eiUNxZ2UnDJOGGi+gIQ?=
 =?us-ascii?Q?I3dgJLnSgofB421Y8krjig6gWl1VjNjcdsDWe8CTyIwM6iSI1DKCYt9/UdU/?=
 =?us-ascii?Q?CSBBoWz2O87uFNtPjz56cPSWoe/PPjJa4u7EC2lc3J6BSx8XpF25h1fDWxJN?=
 =?us-ascii?Q?QShLoVvwqxWNG+vEvcIGgRDWRL2z9qnrf1NIIcHbxrG5WZ9aIGfugrp6JrpO?=
 =?us-ascii?Q?JjOdLeVDSIoWLBNHPup8XkBLoX8c6fK9SAdtbImHPa2k28Do24hoGlKFsL49?=
 =?us-ascii?Q?8WiaomnxihhsOdd2kD/jUOWLSYr5i5rc0hw9Dx1DGM/US0yuoUR133D3s39P?=
 =?us-ascii?Q?I9s8ss2DaZaJ/H1xGfccJs2HLIGyll6xzrYmCwbHsaNwxX1k+p5WfCL8HbJs?=
 =?us-ascii?Q?UbCXuo3MSmcwDtRnXklQ6O97FAwHNWYwcy7d7KT0fYDo36a59EgZz+ehoZ7C?=
 =?us-ascii?Q?YjeQ1/8PSuwJCevzN4QC5i1P9KBwlEqj40C2ed6jAII9NYGLa1L2q+r5gPIG?=
 =?us-ascii?Q?6iHLouTWD/ohzRhdo6qXK0F8aRpnmCmkshKDdKijem4UySmdZHkKwfLv7TlQ?=
 =?us-ascii?Q?vLbv2gnMWuJz1yfAlUqTKjWvAZGM9/is6AMLGipl3rxpsMo/7/UkoilnJ4gb?=
 =?us-ascii?Q?fteNFKRcpWz5mgtRB767G0wvxjIEkOm7fepa14VIwrsKTIb8Q098R9sjdFKy?=
 =?us-ascii?Q?yJ2f8Wwcy7CFTS8m7+OsVLtrO9cs/cH/ZgfJRipZiH7c+1uyw/uwNzNdlWD/?=
 =?us-ascii?Q?kG6+4S5s66bbUGaVNRnWfUguw+bSO/ynLKOiXbatKUsqH/spKLGdy5oDJwjb?=
 =?us-ascii?Q?voNJnuWL5mxl469fI0klw5Jx82yQ6x+4GRmQ0mVTXOa+iuZ74WAh5POliot1?=
 =?us-ascii?Q?w0e9aLwrROFWdi2nqONCKcSuuLnkm3OoGQdBvCd4fqnwzjNIYuruQez4AFoL?=
 =?us-ascii?Q?mRzTS7ln3Sf/jts=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:43:45.0894 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96b41494-5d7a-4314-9d2d-08dd6cc00c3d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9685
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

From: Harry Wentland <harry.wentland@amd.com>

We need to ensure framebuffers get removed and crcts detached
when tests fail, otherwise consecutive test runs might fail.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 139 +++++++++++++++++++++++++-------------------
 1 file changed, 78 insertions(+), 61 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 4c1751c3b..3fa799e7c 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -390,52 +390,20 @@ static void apply_transforms(kms_colorop_t *colorops[], igt_fb_t *sw_transform_f
 }
 
 static void colorop_plane_test(igt_display_t *display,
+			       igt_output_t *output,
+			       igt_plane_t *plane,
+			       igt_fb_t *input_fb,
+			       igt_fb_t *output_fb,
 			       __u32 fourcc_in,
 			       __u32 fourcc_out,
 			       kms_colorop_t *colorops[])
 {
 	igt_colorop_t *color_pipeline = NULL;
-	igt_output_t *output;
-	igt_plane_t *plane;
-	igt_fb_t input_fb;
 	igt_fb_t sw_transform_fb;
-	igt_fb_t output_fb;
-	drmModeModeInfo mode;
-	unsigned int fb_id;
 	igt_crc_t input_crc, output_crc;
+	int res;
 
-	output = kms_writeback_get_output(display, fourcc_in, fourcc_out);
-	igt_require(output);
-
-	if (output->use_override_mode)
-		memcpy(&mode, &output->override_mode, sizeof(mode));
-	else
-		memcpy(&mode, &output->config.default_mode, sizeof(mode));
-
-	/* create input fb */
-	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-	igt_assert(plane);
-
-	fb_id = igt_create_color_pattern_fb(display->drm_fd,
-					mode.hdisplay, mode.vdisplay,
-					fourcc_in, DRM_FORMAT_MOD_LINEAR,
-					0.2, 0.2, 0.2, &input_fb);
-	igt_assert(fb_id >= 0);
-	igt_plane_set_fb(plane, &input_fb);
-#if DUMP_FBS
-	igt_dump_fb(display, &input_fb, ".", "input");
-#endif
-
-	/* create output fb */
-	fb_id = igt_create_fb(display->drm_fd, mode.hdisplay, mode.vdisplay,
-				fourcc_in,
-				igt_fb_mod_to_tiling(0),
-				&output_fb);
-	igt_require(fb_id > 0);
-
-	igt_fb_get_fnv1a_crc(&input_fb, &input_crc);
-
-	igt_require(igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE));
+	igt_fb_get_fnv1a_crc(input_fb, &input_crc);
 
 	/* reset color pipeline*/
 
@@ -443,8 +411,8 @@ static void colorop_plane_test(igt_display_t *display,
 	set_color_pipeline_bypass(plane);
 
 	/* Commit */
-	igt_plane_set_fb(plane, &input_fb);
-	igt_output_set_writeback_fb(output, &output_fb);
+	igt_plane_set_fb(plane, input_fb);
+	igt_output_set_writeback_fb(output, output_fb);
 
 	igt_display_commit_atomic(output->display,
 				DRM_MODE_ATOMIC_ALLOW_MODESET,
@@ -452,14 +420,15 @@ static void colorop_plane_test(igt_display_t *display,
 	get_and_wait_out_fence(output);
 
 	/* Compare input and output buffers. They should be equal here. */
-	igt_fb_get_fnv1a_crc(&output_fb, &output_crc);
+	igt_fb_get_fnv1a_crc(output_fb, &output_crc);
 
 	igt_assert_crc_equal(&input_crc, &output_crc);
 
 	/* create sw transformed buffer */
+	res = igt_copy_fb(display->drm_fd, input_fb, &sw_transform_fb);
+	igt_assert_lte(0, res);
 
-	igt_copy_fb(display->drm_fd, &input_fb, &sw_transform_fb);
-	igt_assert(igt_cmp_fb_pixels(&input_fb, &sw_transform_fb, 0, 0));
+	igt_assert(igt_cmp_fb_pixels(input_fb, &sw_transform_fb, 0, 0));
 
 	apply_transforms(colorops, &sw_transform_fb);
 #if DUMP_FBS
@@ -480,7 +449,7 @@ static void colorop_plane_test(igt_display_t *display,
 		set_color_pipeline(display, plane, colorops, color_pipeline);
 	}
 
-	igt_output_set_writeback_fb(output, &output_fb);
+	igt_output_set_writeback_fb(output, output_fb);
 
 	/* commit COLOR_PIPELINE */
 	igt_display_commit_atomic(display,
@@ -488,28 +457,24 @@ static void colorop_plane_test(igt_display_t *display,
 				NULL);
 	get_and_wait_out_fence(output);
 #if DUMP_FBS
-	igt_dump_fb(display, &output_fb, ".", "output");
+	igt_dump_fb(display, output_fb, ".", "output");
 #endif
 
 	/* compare sw transformed and KMS transformed FBs */
-	igt_assert(compare_with_bracket(&sw_transform_fb, &output_fb));
+	igt_assert(compare_with_bracket(&sw_transform_fb, output_fb));
 
 	/* reset color pipeline*/
 	set_color_pipeline_bypass(plane);
 
 	/* Commit */
-	igt_plane_set_fb(plane, &input_fb);
-	igt_output_set_writeback_fb(output, &output_fb);
+	igt_plane_set_fb(plane, input_fb);
+	igt_output_set_writeback_fb(output, output_fb);
 
 	igt_display_commit_atomic(output->display,
 				DRM_MODE_ATOMIC_ALLOW_MODESET,
 				NULL);
 	get_and_wait_out_fence(output);
 
-	/* cleanup */
-	detach_crtc(display, output);
-	igt_remove_fb(display->drm_fd, &input_fb);
-	igt_remove_fb(display->drm_fd, &output_fb);
 }
 
 igt_main
@@ -561,17 +526,69 @@ igt_main
 		igt_display_require(&display, display.drm_fd);
 
 		igt_require(display.is_atomic);
-
 	}
 
 	for (j = 0; j < sizeof(formats) / sizeof (formats[0]); j++) {
-		for (i = 0; i < sizeof(tests) / sizeof (tests[0]); i++) {
-			igt_describe("Bla bla bla");
-			igt_subtest_f("plane-%s-%s", formats[j].name, tests[i].name)
-				colorop_plane_test(&display,
-						   formats[j].fourcc_in,
-						   formats[j].fourcc_out,
-						   tests[i].colorops);
+		igt_output_t *output;
+		igt_plane_t *plane;
+		igt_fb_t input_fb, output_fb;
+		unsigned int fb_id;
+		drmModeModeInfo mode;
+
+		igt_subtest_group {
+			igt_fixture {
+				output = kms_writeback_get_output(&display,
+								  formats[j].fourcc_in,
+								  formats[j].fourcc_out);
+				igt_require(output);
+
+				if (output->use_override_mode)
+					memcpy(&mode, &output->override_mode, sizeof(mode));
+				else
+					memcpy(&mode, &output->config.default_mode, sizeof(mode));
+
+				/* create input fb */
+				plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+				igt_assert(plane);
+				igt_require(igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE));
+
+				fb_id = igt_create_color_pattern_fb(display.drm_fd,
+								mode.hdisplay, mode.vdisplay,
+								formats[j].fourcc_in, DRM_FORMAT_MOD_LINEAR,
+								0.2, 0.2, 0.2, &input_fb);
+				igt_assert(fb_id >= 0);
+				igt_plane_set_fb(plane, &input_fb);
+#if DUMP_FBS
+				igt_dump_fb(&display, &input_fb, ".", "input");
+#endif
+
+				/* create output fb */
+				fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
+							formats[j].fourcc_in,
+							igt_fb_mod_to_tiling(0),
+							&output_fb);
+				igt_require(fb_id > 0);
+			}
+
+			for (i = 0; i < sizeof(tests) / sizeof (tests[0]); i++) {
+				igt_describe("Bla bla bla");
+				igt_subtest_f("plane-%s-%s", formats[j].name, tests[i].name)
+					colorop_plane_test(&display,
+							output,
+							plane,
+							&input_fb,
+							&output_fb,
+							formats[j].fourcc_in,
+							formats[j].fourcc_out,
+							tests[i].colorops);
+			}
+
+			igt_fixture {
+				detach_crtc(&display, output);
+				igt_remove_fb(display.drm_fd, &input_fb);
+				igt_remove_fb(display.drm_fd, &output_fb);
+
+			}
 		}
 	}
 	igt_describe("Tests getting and setting COLOR_PIPELINE property on plane");
@@ -584,8 +601,8 @@ igt_main
 	}
 #endif
 	igt_fixture {
-
 		igt_display_fini(&display);
+		drm_close_driver(display.drm_fd);
 	}
 }
 
-- 
2.43.0

