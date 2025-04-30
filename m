Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20F1C3ABA5
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 01:39:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B9110E692;
	Wed, 30 Apr 2025 01:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ne83+6bd";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6252910E692
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 01:39:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TDDGZLxjUYaIHRKdbCQXw0Ym3nHZ3yvHtpwhTou8sb5qMjzHL14CG31iWw3thfVQHEN6ZW5y3ccXAwMdmkhtXOj7rFikuzlKb8X8MeLOoIHUpnhptyClin6XLSDUumpfRmAfER/Ve7unlmU5+Ij/MqoWONB3alVvuWquDxyM9PLzerRh6A0pHG/N+1qfgzCaRqjKVfSrBpT86EyD4Rv2emMXXx7CIt/qxvHywcdbj22Y8f7HjbxXhv1JvHcGyiebaLjHWVUp1syTeEcklsh43ZJtxl5OG5YjKku9pbkey3jHbWmDE42fYugRgjq/V6PJU4lXtzre3BMfszNW5dhMdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ugAUW8gDEmFAAZ8i2iAwpUWmvSNSFjccQvsk1LPeo8=;
 b=KGYgOn3f5HS6GDxEqTjNzR772BEyhymVqBiMZU+Q5tN7vjVkJUZTTyh3QxIcr1+/nE0fDRBsE1JFdahDOkJ7dIkcGoeQL1rKWQhE/9dfzjXFIU2lWZ+CDHH1lLKgBAZ91kp9z5htf9lNlRho3FbYiHdBvh+nC33DyRNBIxVNoEpD5EX101W9+/mndUkUcvd8q+QXbpvWPiGxedPkeXPGMedyjj2b97/WtTF03Yvxva38/w5qWHGI2jaJPZsxiz8ktFCjZBcFF6Gx1CKx2FQ+fyFKHk8f8aDR1YSXhMWS1EeSUACbt4OzUL0mSVVFGbVQZjkqF1Wqui7a0r6gSXwIeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ugAUW8gDEmFAAZ8i2iAwpUWmvSNSFjccQvsk1LPeo8=;
 b=ne83+6bdujnVNNvFikr02gzjMT53RWQQ/2WpQE/GYbMPU9y8SFsuWtz+NDCb0HwFgMHg2pRGb2yLrxZfPD2f1uzJRb82MrGfGdNro+vuwvKgVB30R0oJYX44lrGXnJL38L1W6/Jh5eZ8/+muwGsZQrtpEeMzwJrTS6OB4C4RhxU=
Received: from MW4PR03CA0184.namprd03.prod.outlook.com (2603:10b6:303:b8::9)
 by IA1PR12MB6387.namprd12.prod.outlook.com (2603:10b6:208:389::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.30; Wed, 30 Apr
 2025 01:39:25 +0000
Received: from BY1PEPF0001AE18.namprd04.prod.outlook.com
 (2603:10b6:303:b8:cafe::c7) by MW4PR03CA0184.outlook.office365.com
 (2603:10b6:303:b8::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Wed,
 30 Apr 2025 01:39:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE18.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:39:25 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:39:23 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V8 20/36] lib/igt_fb: Allow any non-planar format for
 igt_copy_fb
Date: Tue, 29 Apr 2025 19:34:38 -0600
Message-ID: <20250430013454.226910-21-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430013454.226910-1-alex.hung@amd.com>
References: <20250430013454.226910-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE18:EE_|IA1PR12MB6387:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f41c1ba-c895-425c-8fa4-08dd8787d6f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?j1EKV+rzqiAG8leOhw+4Gx04ul2sS6fhqHoL8+wFZRhB3AxHI4q/b+Xq8Mcn?=
 =?us-ascii?Q?P7yZoVcHOMmT/s4MRpCJp0SeP3etta5OR9klLDK0/h9BqXhhfZAx1kO4aOOT?=
 =?us-ascii?Q?ncUdB1oly5kr7FD3hUfQNDqheAxcws+VpHEAZEeHVMO1BCf6fnsbKM0drWni?=
 =?us-ascii?Q?TTRVJVJ+cJmWEFQwFZGwXiB8VSuvbCU+pBVYJWBSXY6gs4eSnSdwSd3TFKJ/?=
 =?us-ascii?Q?GuTxpbl3cXysvWrzFqWoCwU808eLdeCBuMfHrg8qHixGR6XocZhb1UUpHKyV?=
 =?us-ascii?Q?Q3kBdkWNAvzqRGCXaG/jYE3JdWfToXbq13fyu7VF2WY9Nm4ozJHLlJBVSQK6?=
 =?us-ascii?Q?mx7BQLnKyG2UuNXb7mlG6MK+z72XxMImE1TbPGVZl7/j2pjLGVMZdVWiSu1O?=
 =?us-ascii?Q?fjJ7oQX0auiIsoPx4jHFcORzkzp2UDLumaYzMl4YJXrbq5QakN3+bjnB0CMs?=
 =?us-ascii?Q?YwW1w3k6bwL1d+RQB1I21hHvAMR03JQ5OnccUju2Y+I5zCm4jIu5jqrxD21p?=
 =?us-ascii?Q?sVV0gqC67o4ZhNgCPLE+p17cSDjoUFGfggg8mnSEdanY7UartPZBX5jKZcqg?=
 =?us-ascii?Q?xyGjABSBb6iLKuGxJVA5pSdnGYMFJXm0jPL8QmAe/nu6xNNLwgGght51UnpI?=
 =?us-ascii?Q?6yp9kS5GH6YZRSJyYcZLO3aNo67XRU9dlccKqvYNaU+lEbssclgG20gSMZ7P?=
 =?us-ascii?Q?geakJ87d10WhrGxT2LBA26IDlfrnP0aqIcVbhRrOa7I5tTRiWb2aivtIJP+X?=
 =?us-ascii?Q?1owYEWEibkInUrnRoJZyvu8GA9Sf5Ddu9wpf7wHeul2HRS1VCYJ7JaleRKIb?=
 =?us-ascii?Q?E9be+23XtRTavibGCAGcvCrU3cQLQCDgQQfpqSoQCXspuPWNk86Do6GN5LrF?=
 =?us-ascii?Q?bc+KD762ej8onCmOzKc9FZjT0TZa2IP1s78NihuhdQ5xslmx9iTgFFDhI7Lz?=
 =?us-ascii?Q?NnZbVIc7X0asRbtr+oZjolhiHsuRM0jvA40yndTrYmFtANIUldVEIVAJutIx?=
 =?us-ascii?Q?kwlVK5rui86GRm9TTP5BT8zgQOB+gCNeQbU7XGPzCnCLjzZVZIfvRWA/uuqs?=
 =?us-ascii?Q?1RGVYccnxAKTKyZ8r8ZNsxmMdos45fCJk5i8sNS1AZ9jTEkulJ5bOCV8OPva?=
 =?us-ascii?Q?3qgjZW+T7gxPVrfoS2GhxmFkt6APAyzbHlW2snfRJmVTAvTcDBvBNhM4b0I9?=
 =?us-ascii?Q?THGEl3JqlcvYeuaKJEDl93fQmLlOjkolawHcobrVulgIfzo+9M4oAAsIYozZ?=
 =?us-ascii?Q?GDyBblhTwEo56qmTk1rzrs2C97i3livjY6ee4A+gObTu+RYi/Wusz9bKoh+2?=
 =?us-ascii?Q?V113YG6SSpp6NU6WBX0O1qGxuI6Ojhd53YGdlH1Amt0aEoeMPaL8utKK8h5f?=
 =?us-ascii?Q?SzCAgNHMWrapRzLmqUfQC1YnFviDcKWy5noUqMNYJI3sybN2jPsYhwbof2NT?=
 =?us-ascii?Q?w6qtejg7KuD+KXwvbC9iulYuCHIDJN1wpnqslimBbCsna1xNBgc8KJhZ5vTw?=
 =?us-ascii?Q?Mn1a9hkn2J+maPTai3Oyc53FfaJt2BSeEhIO?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:39:25.2092 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f41c1ba-c895-425c-8fa4-08dd8787d6f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE18.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6387
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

