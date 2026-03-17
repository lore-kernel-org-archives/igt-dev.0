Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B48FED9E7
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 16:05:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D01EC10E6E1;
	Tue, 17 Mar 2026 16:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Xygl3QR8";
	dkim-atps=neutral
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011070.outbound.protection.outlook.com [52.101.57.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF8210E5A0
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 16:05:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NlXT6YKZTuKrKf55duasxdXm/R+C8d9UFoTgyg/BT4phFxeaICv+nOWb03T/89J1hjSFqxlxshLs2UbuuZlDahjWRIS0o8WAp8HaqBDg4YhWa1GSuELdoz7dG/AEvPxflH4pOvuLvTBt7a3mUYN30q2OY3ioZIAXxIRlsOVa+p3rp27qCgKd21TKbeaYL1c6QIt2+8VDbmSzdIKRcv35KiCH2wHbVYO6Bi+R7pBShZUAjxgY1kTKvOqSdeCseG0mR4GeY4Z8IEoOt5fFR1OcEV53AU+ii1Cknc2Mnmnd0dC+l2FRvkg2IhW3Q37oBcpdkxvlutJ4iW0RKzcA59zs9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=doj6yLZCPGQB5DXUYwpaqjFnErEljAJQ+S877uD/q50=;
 b=C2ePu96DUl8MA+QYPF8950I9i2TaS1DdB+RkEenQssRpB5AhIu5n71pZWYsmNBYnw+cRLUPS56hHw+zY2ujDmZNr96zAdeWXhkZdB/mz/n5URbayPyRUoITEp3mo5B20zrWpilF1KcCshZOso/2TRWWRyqcyNCItH0xllPJIZdPb7mEeebsm4lA7b9xQuJoV+1/oV8tt3WfXo7uUxLnTlKZj8C9P6kRkdCWuBgKj5DfdXp5fjn7rGkEG8fa5TB7lAE19S372ymxC4Mvzf6qpIdf6MOqtbWtocH4nwZ3q8YritUQ+MIJN/hKzgBIeq4jFyIoJ4Oh6g21Xzje3UUfWbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=doj6yLZCPGQB5DXUYwpaqjFnErEljAJQ+S877uD/q50=;
 b=Xygl3QR87l2BcMEeOFvvXk4TMyCmu9lWHm1lnhPhauS2f3eULS7HI2U0jw+a/6GcA/8rZIsacmS4pQRtLFVDWcmnAXdkKwWnQWumCf9mX01OVHq2Lg0ZR1xbsu93yAOMeu+rn/ejDiY6th/49Ycfl2zZtC3HvKFl6J0lzBFc4A8=
Received: from SJ0PR05CA0119.namprd05.prod.outlook.com (2603:10b6:a03:334::34)
 by SN7PR12MB7833.namprd12.prod.outlook.com (2603:10b6:806:344::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.9; Tue, 17 Mar
 2026 16:05:01 +0000
Received: from CO1PEPF000075EE.namprd03.prod.outlook.com
 (2603:10b6:a03:334:cafe::dc) by SJ0PR05CA0119.outlook.office365.com
 (2603:10b6:a03:334::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.13 via Frontend Transport; Tue,
 17 Mar 2026 16:04:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075EE.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 16:04:58 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 17 Mar
 2026 11:04:49 -0500
Received: from hwentlanryzen (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 17 Mar 2026 11:04:49 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH 06/10] lib/igt_color: Add CSC transform functions for YUV
 to RGB
Date: Tue, 17 Mar 2026 12:04:32 -0400
Message-ID: <20260317160443.229812-7-harry.wentland@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317160443.229812-1-harry.wentland@amd.com>
References: <20260317160443.229812-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EE:EE_|SN7PR12MB7833:EE_
X-MS-Office365-Filtering-Correlation-Id: 697c0959-2098-4c90-b92a-08de843ef078
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|1800799024|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: EBAvMCPf7cRwfy3+Vx6jQKGHaOb+l1B7v1+Eqh3Tyls2NaRujo/GBNA8GnnBUNUtIxdY/2qdEzwpnkUizB/m2+7K1Hw8Fvom1/zERjeHrdcVk16bst4dLhzFDxOwSnkHzLxYMtuAo0P/0YVWnDMVLVg8isbZsgZyRKQT2T6hJ95ZhfRJvWvaI8RA8RsyYacHHz6qLwEptf2UcUThnKq+UwOUmfLv+C4DgpCl/c2RTSSpGOYemlJgRCnWtwQmBWY+JTV1qbHlTL0akjpvAVYdQkL3l8cZ+af91qNv8FLUSWpxRiBL9jLOZlURz7eIQUae02Wbg8IWM2N/tWk2ik62AD1IiWT+ZQ+O7Y89tyVpr45Ikn82MS0k4P8ai02F2Zu1Fjzv0rFzzR24X+fHO9Tfy2wbQiHuGRxE3vwpRkGJ/oslcL+Lc61E/SJgb7LxjCnt4apwDrxqa+19QI5uUKn7TlfxdW3gMo9vC03HiDE4rXtILReUPvbmTwJBTzXAwaW0Xzdp0b80CQbNQSLjQeKr7D3UGeCOQGCE+0YrQGOGuLAG3tNvnjB7L/0wzr/KGK8UWgdeH0K5P9BYGEnpMkc1HmJGz2MxdXd/kTqfF2+PcZz83ZiHOJdghQFUumfID63akAEr1FxHqYoF0s0glmQj2AzrCjEeqpTPXtdXHsTVgjIC40WbCCABFYgQTsuXpyibTmxZAnVz0tT20XBvy9Akgtkecv18F5m2TiM86NDiOzZKkQYrW2iHZ3OFcRFkOXUfmgpUPyNDwVynxk4oPjdwwQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +VeDbPsGdm9M9df+NIaBlLEfHJjGX3QGulOtYx5mbLPt5TWrtp8KHoO0aBSlMEUes0S9ZXWSP+qyeU4NnC+4FbCu65XQEOtgmtqeG5+8+9ZN7qkJY7XmXKUcPDjMy6/uhyz1RqFbcOExHxZnirsUW8OjXZ1xUsvLUfd/0a5VqaRSxS6TXae1IGf4rtQ03KqXmB1dns4hxuXYudKzzqxXTS1RxVcKuU5sFIHiSRX7/lqjGmuPc7jK8qnjKFjxTa/CR2nOTQmVQePR4R91whAk5WxzQCjmK/udFGJUmYVdwiX9NE9uFqzl75JIVS1XKiVvdaGH3YBXPNQgla/xswAezD9+qDKZstnRc8LHAd6Zl7uUgENwxhQbbBK5wzEYj9wTeCr3WqKAa5FDRE7e0Rb2zndeGEsotBuY7HporlRz8N8Nrcj0afSfZSzv1EifSyKp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 16:04:58.9339 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 697c0959-2098-4c90-b92a-08de843ef078
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075EE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7833
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

Read YUV values in their raw format (0-255 for NV12, 0-65472
for P010), apply the appropriate conversion matrix with scaling
and offsets, and output normalized [0,1] RGB values.

Co-developed by Claude Sonnet-4.5.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_color.c     | 232 ++++++++++++++++++++++++++++++++++----------
 lib/igt_color.h     |  10 +-
 tests/kms_colorop.c |  17 +++-
 3 files changed, 206 insertions(+), 53 deletions(-)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index 6b6d0bd11135..b2456701f008 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -259,6 +259,42 @@ void igt_color_multiply_inv_125(igt_pixel_t *pixel)
 	igt_color_multiply(pixel, 1 / 125.0f);
 }
 
+void igt_color_csc_yuv_to_rgb(igt_pixel_t *pixel, uint32_t yuv_format, uint32_t rgb_format,
+			      enum igt_color_encoding encoding, enum igt_color_range range)
+{
+	struct igt_mat4 matrix;
+	struct igt_vec4 yuv, rgb;
+	float yuv_scale, rgb_scale;
+
+	/* Determine scaling factors based on format bit depth */
+	/* Default to 8-bit (255), adjust for 10-bit formats */
+	yuv_scale = 255.0f;
+	if (yuv_format == DRM_FORMAT_P010)
+		yuv_scale = 1023.0f;
+
+	rgb_scale = 255.0f;
+	if (rgb_format == DRM_FORMAT_XRGB2101010)
+		rgb_scale = 1023.0f;
+
+	/* Convert pixel (Y=r, U=g, V=b) to vec4 */
+	/* Scale from normalized [0.0-1.0] to format range for matrix */
+	yuv.d[0] = pixel->r * yuv_scale;  /* Y */
+	yuv.d[1] = pixel->g * yuv_scale;  /* U */
+	yuv.d[2] = pixel->b * yuv_scale;  /* V */
+	yuv.d[3] = 1.0f;
+
+	/* Get YUV to RGB matrix and apply transformation */
+	matrix = igt_ycbcr_to_rgb_matrix(yuv_format, rgb_format, encoding, range);
+	rgb = igt_matrix_transform(&matrix, &yuv);
+
+	/* Convert back to pixel - normalize from RGB format range to [0.0-1.0] */
+	pixel->r = rgb.d[0] / rgb_scale;
+	pixel->g = rgb.d[1] / rgb_scale;
+	pixel->b = rgb.d[2] / rgb_scale;
+}
+
+
+
 static int
 igt_get_lut3d_index_blue_fast(int r, int g, int b, long dim, int components)
 {
@@ -578,84 +614,182 @@ igt_color_pixel_to_fourcc(uint32_t drm_format, igt_pixel_t *pixel)
 	return raw_pixel;
 }
 
-int igt_color_transform_pixels(igt_fb_t *fb, igt_pixel_transform transforms[], int num_transforms)
+
+/**
+ * igt_color_transform_pixels - Transform pixels from input to output buffer
+ * @input_fb: input framebuffer (can be YUV or RGB)
+ * @output_fb: output framebuffer (must be RGB format)
+ * @transforms: array of transform functions
+ * @num_transforms: number of transforms
+ * @yuv_encoding: YUV encoding (BT.601/709/2020) for CSC, or -1 for no CSC
+ * @yuv_range: YUV range (limited/full) for CSC, ignored if input is RGB or yuv_encoding < 0
+ *
+ * Applies a series of transforms to pixels, reading from input_fb and writing
+ * to output_fb. Supports format conversion (e.g., NV12→XRGB8888, P010→XRGB2101010).
+ * When input is YUV and yuv_encoding/yuv_range are provided, performs YUV→RGB CSC
+ * conversion before applying transforms, and skips the first CSC transform.
+ *
+ * Returns: 0 on success, negative error code on failure
+ */
+int igt_color_transform_pixels(igt_fb_t *input_fb, igt_fb_t *output_fb,
+				  igt_pixel_transform transforms[],
+				  int num_transforms,
+				  int yuv_encoding,
+				  enum igt_color_range yuv_range)
 {
-	uint32_t *line = NULL;
-	void *map;
-	char *ptr;
-	int x, y, cpp = igt_drm_format_to_bpp(fb->drm_format) / 8;
-	uint32_t stride = igt_fb_calc_plane_stride(fb, 0);
+	uint32_t *input_line = NULL;
+	uint32_t *output_line = NULL;
+	void *input_map, *output_map;
+	char *input_ptr, *output_ptr;
+	int x, y;
+	int input_cpp = 0;
+	int output_cpp = igt_drm_format_to_bpp(output_fb->drm_format) / 8;
+	uint32_t input_stride = 0, output_stride = igt_fb_calc_plane_stride(output_fb, 0);
 	uint8_t *y_plane = NULL, *uv_plane = NULL;
 	int y_stride = 0, uv_stride = 0;
-	bool is_yuv = (fb->drm_format == DRM_FORMAT_NV12 || fb->drm_format == DRM_FORMAT_P010);
+	bool input_is_yuv = (input_fb->drm_format == DRM_FORMAT_NV12 ||
+			     input_fb->drm_format == DRM_FORMAT_P010);
+	bool output_is_yuv = (output_fb->drm_format == DRM_FORMAT_NV12 ||
+			      output_fb->drm_format == DRM_FORMAT_P010);
+	struct igt_mat4 csc_matrix;
+	bool apply_csc = false;
 
-	if (!is_yuv && fb->num_planes != 1)
-		return -EINVAL;
+	/* Validate framebuffer dimensions match */
+	igt_assert(input_fb->width == output_fb->width);
+	igt_assert(input_fb->height == output_fb->height);
 
-	if (is_yuv && fb->num_planes != 2)
-		return -EINVAL;
+	if (input_is_yuv && yuv_encoding >= 0) {
+		apply_csc = true;
 
-	ptr = igt_fb_map_buffer(fb->fd, fb);
-	igt_assert(ptr);
-	map = ptr;
+		csc_matrix = igt_ycbcr_to_rgb_matrix(input_fb->drm_format,
+						     output_fb->drm_format,
+						     yuv_encoding, yuv_range);
 
-	/* For YUV formats, set up plane pointers */
-	if (is_yuv) {
-		y_plane = map;
-		y_stride = fb->strides[0];
-		uv_plane = y_plane + fb->offsets[1];
-		uv_stride = fb->strides[1];
 	}
 
-	/*
-	 * Framebuffers are often uncached, which can make byte-wise accesses
-	 * very slow. We copy each line of the FB into a local buffer to speed
-	 * up the hashing.
-	 */
-	line = malloc(stride);
-	if (!line) {
-		munmap(map, fb->size);
+	/* Validate plane counts */
+	if (!input_is_yuv && input_fb->num_planes != 1)
+		return -EINVAL;
+
+	if (input_is_yuv && input_fb->num_planes != 2)
+		return -EINVAL;
+
+	if (!output_is_yuv && output_fb->num_planes != 1)
+		return -EINVAL;
+
+	if (output_is_yuv && output_fb->num_planes != 2)
+		return -EINVAL;
+
+	/* Map input buffer */
+	input_ptr = igt_fb_map_buffer(input_fb->fd, input_fb);
+	igt_assert(input_ptr);
+	input_map = input_ptr;
+
+	/* For YUV input, set up plane pointers */
+	if (input_is_yuv) {
+		y_plane = input_map;
+		y_stride = input_fb->strides[0];
+		uv_plane = y_plane + input_fb->offsets[1];
+		uv_stride = input_fb->strides[1];
+	} else {
+		input_cpp = igt_drm_format_to_bpp(input_fb->drm_format) / 8;
+		input_stride = igt_fb_calc_plane_stride(input_fb, 0);
+	}
+
+	/* Map output buffer */
+	output_ptr = igt_fb_map_buffer(output_fb->fd, output_fb);
+	igt_assert(output_ptr);
+	output_map = output_ptr;
+
+	/* Allocate line buffers for speed */
+	if (!input_is_yuv) {
+		input_line = malloc(input_stride);
+		if (!input_line) {
+			igt_fb_unmap_buffer(output_fb, output_map);
+			igt_fb_unmap_buffer(input_fb, input_map);
+			return -ENOMEM;
+		}
+	}
+
+	output_line = malloc(output_stride);
+	if (!output_line) {
+		free(input_line);
+		igt_fb_unmap_buffer(output_fb, output_map);
+		igt_fb_unmap_buffer(input_fb, input_map);
 		return -ENOMEM;
 	}
 
-	for (y = 0; y < fb->height; y++, ptr += stride) {
-		/* For RGB, get line from buffer */
-		if (!is_yuv)
-			igt_memcpy_from_wc(line, ptr, fb->width * cpp);
+	for (y = 0; y < input_fb->height; y++) {
+		/* For RGB input, read line from input buffer */
+		if (!input_is_yuv)
+			igt_memcpy_from_wc(input_line, input_ptr + y * input_stride,
+					   input_fb->width * input_cpp);
 
-		for (x = 0; x < fb->width; x++) {
+		for (x = 0; x < input_fb->width; x++) {
 			igt_pixel_t pixel;
 			int i;
+			int start_transform;
 
-			if (is_yuv) {
+			/* READ from input buffer */
+			if (input_is_yuv) {
 				uint32_t raw_y, raw_u, raw_v;
+				struct igt_vec4 yuv, rgb;
 
-				/* Extract raw Y, U, V from YUV buffer */
-				igt_color_extract_yuv_pixel(fb, x, y, y_plane, uv_plane,
+				/* Extract raw Y, U, V from YUV input buffer */
+				igt_color_extract_yuv_pixel(input_fb, x, y, y_plane, uv_plane,
 							    y_stride, uv_stride,
 							    &raw_y, &raw_u, &raw_v);
 
-				/* Convert to normalized pixel (pixel.r=Y, pixel.g=U, pixel.b=V) */
-				igt_color_yuv_to_pixel(fb->drm_format, raw_y, raw_u, raw_v, &pixel);
+				/* Convert YUV to RGB using pre-computed CSC matrix */
+				if (apply_csc) {
+					float rgb_max;
+
+					/* Matrix expects raw format values (e.g., 0-65472 for P010) */
+					yuv.d[0] = raw_y;  /* Y */
+					yuv.d[1] = raw_u;  /* U */
+					yuv.d[2] = raw_v;  /* V */
+					yuv.d[3] = 1.0f;
+
+					/* Apply matrix transformation */
+					rgb = igt_matrix_transform(&csc_matrix, &yuv);
+
+					/* Matrix outputs RGB in output format range, normalize to [0.0-1.0] */
+					/* Lookup output format's max_val (255 for XRGB8888, 1023 for XRGB2101010) */
+					rgb_max = (output_fb->drm_format == DRM_FORMAT_XRGB2101010) ? 1023.0f : 255.0f;
+
+					pixel.r = rgb.d[0] / rgb_max;
+					pixel.g = rgb.d[1] / rgb_max;
+					pixel.b = rgb.d[2] / rgb_max;
+				} else {
+					/* No CSC, just normalize YUV to pixel */
+					igt_color_yuv_to_pixel(input_fb->drm_format, raw_y, raw_u, raw_v, &pixel);
+				}
 			} else {
-				uint32_t raw_pixel = le32_to_cpu(line[x]);
-				igt_color_fourcc_to_pixel(raw_pixel, fb->drm_format, &pixel);
+				uint32_t raw_pixel = le32_to_cpu(input_line[x]);
+				igt_color_fourcc_to_pixel(raw_pixel, input_fb->drm_format, &pixel);
 			}
 
-			/* run transform on pixel */
-			for (i = 0; i < num_transforms; i++)
-				transforms[i](&pixel);
+			/* Transform pixel through remaining transforms */
+			/* Skip first transform if it was a CSC that we already applied */
+			start_transform = apply_csc ? 1 : 0;
+			for (i = start_transform; i < num_transforms; i++)
+				if (transforms[i])
+					transforms[i](&pixel);
 
-			/* write back to line */
-			line[x] = cpu_to_le32(igt_color_pixel_to_fourcc(fb->drm_format, &pixel));
+			/* write to output buffer */
+			output_line[x] = cpu_to_le32(igt_color_pixel_to_fourcc(output_fb->drm_format, &pixel));
 		}
 
-		/* copy line back to fb buffer */
-		igt_memcpy_from_wc(ptr, line, fb->width * cpp);
+		/* Copy output line to output buffer */
+		memcpy(output_ptr + y * output_stride, output_line,
+		       output_fb->width * output_cpp);
 	}
 
-	free(line);
-	igt_fb_unmap_buffer(fb, map);
+	free(output_line);
+	if (input_line)
+		free(input_line);
+	igt_fb_unmap_buffer(output_fb, output_map);
+	igt_fb_unmap_buffer(input_fb, input_map);
 
 	return 0;
 }
diff --git a/lib/igt_color.h b/lib/igt_color.h
index 722446400f01..4891faae224a 100644
--- a/lib/igt_color.h
+++ b/lib/igt_color.h
@@ -72,7 +72,11 @@ void igt_dump_fb(igt_display_t *display, igt_fb_t *fb, const char *path_name, co
 
 typedef void (*igt_pixel_transform)(igt_pixel_t *pixel);
 
-int igt_color_transform_pixels(igt_fb_t *fb, igt_pixel_transform transforms[], int num_transforms);
+int igt_color_transform_pixels(igt_fb_t *input_fb, igt_fb_t *output_fb,
+			       igt_pixel_transform transforms[],
+			       int num_transforms,
+			       int yuv_encoding,
+			       enum igt_color_range yuv_range);
 
 /* colorop helpers */
 
@@ -122,4 +126,8 @@ void igt_color_multiply_inv_125(igt_pixel_t *pixel);
 void igt_color_3dlut_17_12_rgb(igt_pixel_t *pixel);
 void igt_color_3dlut_17_12_bgr(igt_pixel_t *pixel);
 
+/* CSC transform functions */
+void igt_color_csc_yuv_to_rgb(igt_pixel_t *pixel, uint32_t yuv_format, uint32_t rgb_format,
+			      enum igt_color_encoding encoding, enum igt_color_range range);
+
 #endif
diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 125afbb0573a..c11c0c251369 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -197,15 +197,26 @@ static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
 
 #define MAX_COLOROPS 5
 
-static void apply_transforms(kms_colorop_t *colorops[], igt_fb_t *sw_transform_fb)
+static void apply_transforms(kms_colorop_t *colorops[],
+			     igt_fb_t *input_fb,
+			     igt_fb_t *output_fb)
 {
 	int i;
 	igt_pixel_transform transforms[MAX_COLOROPS];
+	int yuv_encoding = -1;  /* -1 means no CSC colorop */
+	enum igt_color_range yuv_range = IGT_COLOR_YCBCR_LIMITED_RANGE;
+
+	/* Check if first colorop is a CSC for YUV→RGB conversion */
+	if (colorops[0] && colorops[0]->type == KMS_COLOROP_CSC) {
+		yuv_encoding = colorops[0]->csc_info.encoding;
+		yuv_range = colorops[0]->csc_info.range;
+	}
 
 	for (i = 0; colorops[i]; i++)
 		transforms[i] = colorops[i]->transform;
 
-	igt_color_transform_pixels(sw_transform_fb, transforms, i);
+	igt_color_transform_pixels(input_fb, output_fb, transforms, i,
+				    yuv_encoding, yuv_range);
 }
 
 static void colorop_plane_test(igt_display_t *display,
@@ -248,7 +259,7 @@ static void colorop_plane_test(igt_display_t *display,
 
 	igt_assert(igt_cmp_fb_pixels(input_fb, &sw_transform_fb, 0, 0));
 
-	apply_transforms(colorops, &sw_transform_fb);
+	apply_transforms(colorops, input_fb, &sw_transform_fb);
 
 	if (data.dump_check)
 		igt_dump_fb(display, &sw_transform_fb, ".", "sw_transform");
-- 
2.53.0

