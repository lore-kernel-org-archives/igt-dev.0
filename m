Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF59C54E49
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 21:14:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9335E10F29E;
	Mon, 26 Feb 2024 21:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pbqYTMPN";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0BCA10E6DC
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 21:14:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VP1JlbyuaQmgzjASd6OqP7tL3TzSBZ5fBijJXCAhHUTPYlQ8D/haz5Lm/hC/+qSk3v29QnUQafEVt99Pw1hO8ygdcem2X+ty4CtULPo+NRTEdykJdEqkP5Md8r493mWyT5stTQb5+6uRA9fsUJ6vgXaMos6RPwbjr9Rz2q6kiHwAmso9t8XZ0l9vrSbsaOMANHa8e0ODFQWmuXiLH0EyWvPK5Pi9mkvSiYedG5TN+V4j6tC4gkc7g37QXN89tVhlKx0ViJsAmD3yOwR19Ok5Ssxw/pXcgU6XUPfVMTl+IVXuqmZhdtygdv8mKiKfL2dPwCF5m9kHw8r5nN8AwMI8zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FtuQO6kInFDIUGJSJW5PQdUHai9q8Umbd8D/YJYfgPc=;
 b=SQUaW2LPjF4vFK4gMCuh9nzA22J+u7I+8AXomTMTD9ez6bQpM5/A2TdMYEqBrM7pNkPTM4eOwEDP3eJxyjUzNa6e7XYMUj4wiG7h6JiN3wS9rfWhnH1FnK/usadUe9wIJ3enVdoHaWY0aihwdXXxWmmvhJeiuqbYb/cFGQZgJXVuq0BkFjdrBVVJwCz/Vih4Fe1H5WCD6ZjHcFKPd9lHjDVndyqL+jsAME610/lcLb/6KCa2LHCCGjlECLn7n1MF3z+tasFQOwRZ6Fcci+s/GtIIQSbpW2rCQYXuvAdzFNi8N0q0GDkhX/NYBfODXkEnq4q7D7gRX40xB9xKHaNikA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FtuQO6kInFDIUGJSJW5PQdUHai9q8Umbd8D/YJYfgPc=;
 b=pbqYTMPNpVphgTAqoNWu0T8BbRXWxSI9wYpnz8MSSUCqyd5SfMRztNFqqZavw4ZVR0da/d+7blsUzPzA/kiRi0F5NkOdnMZ/kzovkYEZcWHWQ97MSl+ZoTnlqjNIlwvRB+TBkKHLixTaPsCCU+MLX8an+itRECQRvOQNh6zf374=
Received: from MN2PR15CA0004.namprd15.prod.outlook.com (2603:10b6:208:1b4::17)
 by SJ2PR12MB8925.namprd12.prod.outlook.com (2603:10b6:a03:542::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 21:14:41 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:1b4:cafe::3f) by MN2PR15CA0004.outlook.office365.com
 (2603:10b6:208:1b4::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:14:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:14:40 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:14:40 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:14:39 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:14:39 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH v5 21/32] kms/colorop: Do proper setup and cleanup
Date: Mon, 26 Feb 2024 16:14:05 -0500
Message-ID: <20240226211416.100660-22-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211416.100660-1-harry.wentland@amd.com>
References: <20240226211416.100660-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|SJ2PR12MB8925:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b0664c1-238b-42d3-e7fa-08dc370ff253
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UuWqs72i2wuFKLa8DwiYrEHDHfAStGBHt/qkybuZQc+MQCm2XZKpcIzyczmQZ98cwDilpIaT/clWwdEJqoNzZBw1yyy/nwuPxIpsLBEESQsNtJZ6ALPr4uMIAeglkbCXwRQkoGgklKYRK8WjvA18Hjrfk7N5fy1kP8IdIi4Pl2AJCAK0bRTF4sTB6Wha3m55RtgceS8zfNKaX5/m+motxzqujftvNE5zw6Ipjo0HiNdDxWumJq2N3cvdG2OmA2HaDGHzFd2Pg3aljxB3Ynd9L8QjsWQKKDMgz9AaokX/C288DE8C69hJLPssGzu3X9HiNv8gQIOoxiPEZPMmKw9xjR6oxWFUd2IjX5dKDGeHny2zYc5rQWkr2bw1OEwbPKzwc4sWO66zFVIG7kCpTVefKZ3czA37KFr9XmT9rhvVzV4gnaNtOUwr5tA1Uh+O4BNUBuwAATad4eujD2n28sOo13GrToLX4/nSa+D3lp11FDQaqp3UnLrfrev0EpnvpxSf7yXRQXEeMkS/lTzkQrDeoXzM+7suiQPS2BpouoPK9L18Ea6bBCm7whQA+AQhrZdH5BSoDlnxrYYcFcT65fVcWuNFqbHz5uDoN6tue/urFAw3JbkZKdSI2xHap6IiK1ijRQNgP/IiRy80Kx9bzntU9IvPUeRalJGHlbkjbonOZUorGf5fUzVis/ZcRQ+/BeNF2vQdYyzdRmOhpjJOiJbRytHOUSE6R94ygidQbClLQYZLZb8MA3/GFpvW0tseKbeO
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:14:40.8921 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b0664c1-238b-42d3-e7fa-08dc370ff253
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8925
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

We need to ensure framebuffers get removed and crcts detached
when tests fail, otherwise consecutive test runs might fail.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 139 +++++++++++++++++++++++++-------------------
 1 file changed, 78 insertions(+), 61 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 5b0b32819baf..f0f4d83d8c8c 100644
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
@@ -553,17 +518,69 @@ igt_main
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
@@ -576,8 +593,8 @@ igt_main
 	}
 #endif
 	igt_fixture {
-
 		igt_display_fini(&display);
+		drm_close_driver(display.drm_fd);
 	}
 }
 
-- 
2.44.0

