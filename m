Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B7BC7114A
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 04:40:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF1210E58E;
	Tue, 17 Jun 2025 04:40:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1NtA0qxd";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7715C10E572
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 04:40:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eJXBarOb2sZgdneSzenc+eajOJOCRRE4No9tn15t/sa6mO29Blb0mzb0vMUjXAvdDjdyOYrbQkJ6pbpOokRHB4Qs3d/hploCC1ov40Z6zVj6T6wrXigk5JmvCPu01vzBLIwFxjAuvCVyW/QKsK0aj8n2XjKjeWs6fSP7CBclO6o0M4M370ozU+Q7w2DrK3Rj3UcDA0ZOmrxX1Kq2HwQO+eZoZIgC4S0rJNqeP/4/XHEt7HD+JtKI1/rKWVdi/WBPXTccYEljlvejjSZoDmZkThTreIWxhnx/b1bzHkCwNyYWYeZBFFKC0i3cae7vzoLHxU8JSdJxmw0uLPiBPmmZng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ugAUW8gDEmFAAZ8i2iAwpUWmvSNSFjccQvsk1LPeo8=;
 b=AcqN21H5LvZwmqBXbUg7Wh7VVo2zQw9JeYkfRjSi2e68re3ayGW8teJw0pddoHenHG7693Pn6vXe91874y4uw3IGtWx2KHXtb7x0g04Bn6KrOUNbalm6GDAvEqEvt/Ar2EOCdzBiEWr6kquwYfZlUnMo7AAZQyOKU9cD7rVKMy1IJHso9IuIzflKjLtLsDSel+ZMdDkyJgbD0bJQsfX86z3XE1BTYpcG7Ku5Zlh0zwTNuzafEQ+C9AdJMuD00OvFjDVWH6ixqX5vWoW+rk/vCuha0ZmT8MM/jn0XAYSghJaLB2piFbPTFljxlHvH4ZKrt5g9evHyOvmaVS0iOO2vXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ugAUW8gDEmFAAZ8i2iAwpUWmvSNSFjccQvsk1LPeo8=;
 b=1NtA0qxdjYPSNmggTN6uuF+SIfUQykwbLJnua/QPBdqy+2szzLRriZGFg7TcjVfO353anxgICAbCDZyIfqX/h9QEqawoOWeeWyhBBLbzUdLDJH9SAmmkxsNpgpMTrhXGtf+3I5UKcBmwIBQ+ldSEaZCDmABUAVmqCioE7WP5b/8=
Received: from DS7PR03CA0049.namprd03.prod.outlook.com (2603:10b6:5:3b5::24)
 by CH8PR12MB9837.namprd12.prod.outlook.com (2603:10b6:610:2b4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 04:40:46 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:5:3b5:cafe::f1) by DS7PR03CA0049.outlook.office365.com
 (2603:10b6:5:3b5::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Tue,
 17 Jun 2025 04:40:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:40:46 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:40:45 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V9 20/36] lib/igt_fb: Allow any non-planar format for
 igt_copy_fb
Date: Mon, 16 Jun 2025 22:36:15 -0600
Message-ID: <20250617043631.2920587-21-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617043631.2920587-1-alex.hung@amd.com>
References: <20250617043631.2920587-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|CH8PR12MB9837:EE_
X-MS-Office365-Filtering-Correlation-Id: 36046fa9-871c-479b-bb2c-08ddad592090
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?58dlpQkgKkD2/FmtSNlPksnJy4EPgDJJpgvKTbT9jw39Pa7ijZc3BW3rPTec?=
 =?us-ascii?Q?QuNJLPZW5ozZgwx7nUD4ayzn1a8+DdefZTZxbS0W2PpyrM0kr6FRihf6f8AN?=
 =?us-ascii?Q?MhQg9dAz75sPyYeKhsnSBAq9+cdHsVIffSv306uDiN9GSTJOv/36spt0HluH?=
 =?us-ascii?Q?tOmDsscsD316C71oPwCWBEihGOZbM8TFdG+OOa7A/DJZc7BdguBh7fk/k7DN?=
 =?us-ascii?Q?m5S5VvPlK2jb/5JEtFpM0FJO9pyLZBIYElepZ53lygqm/+LX1QkGFHxrYkRE?=
 =?us-ascii?Q?pIvTODeO8vVZYrQuuLHbIET9Z8rS/Y2Noo0uLlLM/nMyTt7PsSkiZojL7tdU?=
 =?us-ascii?Q?QoAsfXH4jBSsolkqSEhjRNlnCEAhw40IV8OqxsVWmx/vcNlG+n6XK/xyzCEJ?=
 =?us-ascii?Q?nqchNYfybK+Zr6Ycl0Xv/aKQk2mc8nECvH87k4vYVPWVgga9KBz0RpoZCV5t?=
 =?us-ascii?Q?HWNX2evpsTQWNxgS9bbzLG2YTLknrClvBsJQWx/M7kVdtuykbKsn7RGN3k/U?=
 =?us-ascii?Q?TIqcvQ7glmYiIgKC9xxu0oYmXG1N4Ox9U/2nRiE6bSYtKay/EPIPSeRafKeg?=
 =?us-ascii?Q?6STpslYnmQE2u23KEQa3MwAx06JWeK/Bs0xqZH5OUHryWWTxkmMS6zk+B/k/?=
 =?us-ascii?Q?ixkhjcfjik+SbmJZ9hVtWnEppFEUHXtP4Hu+MGZZCu3HqRllK75LVS0dzVe0?=
 =?us-ascii?Q?obcr+b6mWsMatYg9UFS4k/S9dPzyoCCY5hfX/RCMpenLdncJ+rgj1FrRFzt2?=
 =?us-ascii?Q?Z4je/D4WpF2NuMSo2EZV/7nqgz/QC+wVqVm/1FYY0zO5+Qml7HklEzYhbAK3?=
 =?us-ascii?Q?GPHfJ/KYlqxTHOHVfm2Ok5VJOcESwsZ1fXGUbi+iOOieRCvX5p8TqvPi0iNK?=
 =?us-ascii?Q?FpgRwNABMP72KzvkpfRGyrl454T5p5SnCPsvXmC6FiyJZHQEZ90lpjoe6Ihk?=
 =?us-ascii?Q?MOD2xwrvdcZU8yVyUgPal36Nb7D7GFpfhLKkLOrNFKMUQrbLFModysOz81va?=
 =?us-ascii?Q?+2bgaiiuUSJy6KuRfrd/usRJctbz/lh2oDTJuwH7nsXepDhibz7J1gz9pDi9?=
 =?us-ascii?Q?veo+Tiufcul8KGj8zvZhg2rNpwGEmRAIie/uoa1r4OySRn+tvZCHHJ2GDDxa?=
 =?us-ascii?Q?uUeF7eWhRtSpEn+BfMZ1jcKfJCiVpFSY29azn5VpO2bvz8vOWD+J5lYdwq43?=
 =?us-ascii?Q?o7Ax0Hv/RQptaEr9cJq/Q7FhLpRHH5bA2DXIUvYJj2mxZBPv6HaJMjgF5yXM?=
 =?us-ascii?Q?Aw6Bc9emkCxgai+J1mGru3dklXDfv1jPffgd3R8hH++ioZEqadXfO4Fs2Hle?=
 =?us-ascii?Q?VoLOmDGGYp+L8+LIduHRYffcf0d5AZKI+y7864bkeDg6EIn5JlH1m7uMPJCF?=
 =?us-ascii?Q?O3zXdYj9ZosPrHLl8+eZOgSWN/RnZEiAIBM8fsfYRFGZ4eljMe6GerotJPgX?=
 =?us-ascii?Q?rIsmngr4LE6AOvoU2Peid7z+s/U1ovAg2f9VN/KOBMwuSTl1joNHwrgShgz7?=
 =?us-ascii?Q?TAiz/NkWzPEQsEy64y/SPlX2dTGITja9Ug9i?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:40:46.5748 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36046fa9-871c-479b-bb2c-08ddad592090
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9837
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

The function is able to handle any non-planar format. It's been
tested for XRGB8888 and XRGB2101010 so far but should work
for a wider range of formats.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_fb.c        |   4 --
 tests/kms_colorop.c | 139 +++++++++++++++++++++++++-------------------
 2 files changed, 78 insertions(+), 65 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index f2c09de50..47ad33512 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2182,10 +2182,6 @@ unsigned int igt_copy_fb(int fd, struct igt_fb *src, struct igt_fb *fb)
 	if (src->num_planes != 1)
 		return -EINVAL;
 
-	/* TODO expand for other formats */
-	if (src->drm_format != DRM_FORMAT_XRGB8888)
-		return -EINVAL;
-
 	fb_id = igt_create_fb(fd, src->width, src->height, src->drm_format,
 			    src->modifier, fb);
 
diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index cc260618e..b7d112082 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -389,52 +389,20 @@ static void apply_transforms(kms_colorop_t *colorops[], igt_fb_t *sw_transform_f
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
 
@@ -442,8 +410,8 @@ static void colorop_plane_test(igt_display_t *display,
 	set_color_pipeline_bypass(plane);
 
 	/* Commit */
-	igt_plane_set_fb(plane, &input_fb);
-	igt_output_set_writeback_fb(output, &output_fb);
+	igt_plane_set_fb(plane, input_fb);
+	igt_output_set_writeback_fb(output, output_fb);
 
 	igt_display_commit_atomic(output->display,
 				DRM_MODE_ATOMIC_ALLOW_MODESET,
@@ -451,14 +419,15 @@ static void colorop_plane_test(igt_display_t *display,
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
@@ -479,7 +448,7 @@ static void colorop_plane_test(igt_display_t *display,
 		set_color_pipeline(display, plane, colorops, color_pipeline);
 	}
 
-	igt_output_set_writeback_fb(output, &output_fb);
+	igt_output_set_writeback_fb(output, output_fb);
 
 	/* commit COLOR_PIPELINE */
 	igt_display_commit_atomic(display,
@@ -487,28 +456,24 @@ static void colorop_plane_test(igt_display_t *display,
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
@@ -560,17 +525,69 @@ igt_main
 		igt_display_require(&display, display.drm_fd);
 
 		igt_require(display.is_atomic);
-
 	}
 
 	for (j = 0; j < ARRAY_SIZE(formats); j++) {
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
@@ -583,7 +600,7 @@ igt_main
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

