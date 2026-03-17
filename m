Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEAD3FED9E7
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 16:05:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE6A10E5A0;
	Tue, 17 Mar 2026 16:05:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EPbThxtK";
	dkim-atps=neutral
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010026.outbound.protection.outlook.com
 [52.101.193.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67EB710E6E1
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 16:05:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AplWjkOd5o4N5qIrefSVZ0yEfNgyFhCHwQMBseP6eteWFw+VnJ4eVrYzHunkR8valDS1x2elYBOPIDZCGc76gwElVb+Gm+5Q6u+5x86hWtUKyabOwK+xrC3ZEs+6MmYHGbs8Xw8r4EhJaOgMhzdvIjgy8AptQpc6djPCei/GTlb5iEz7NxKs6krW6HGzhl6XjmLJRFysGmZTeCqkYAAG2L87Wq5vPWBo25ziED8V3CbRKAvLMJv5UDAvNqhjEODo6gE/r3JvAbIU4mxadX5ypMFTsFbW2RWDqwKGR++qmxVjFhJMNboIIy10cq+LHBtjTOxvNSOTpxpS4hangjgH3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FU4fxELSZl4Jfbk2PHMaqpnA3NtW6Vx/58UfKqhZrlw=;
 b=ffOP2/C3QIqgtQ9ic5ie473JUQ516bd0tJH/+Gwg6n8Yhe1dxYJ+NTN96JKbgHyu6yEm6gml1mfcJynDnfrigOjD1HL3ByNxoR3+IwYp6K/lYvV4pDAakfBvYeBU02oB/1IWB5PJCu5rzVH0NfLy7mUNF9ek8ZCQukDEr4HTmuPUIXTdbMnbc4G5L5Cl1efc1XCgIq9zJjFpbx31IaV7+8Zxq+sQGjKpki+CxNuq65/9Dgs5op+Yepwhmos8f4a9eRpyBB8kE4P47LYanJb1nbntYmdObPUjPN9ivIZ8ffh+QLjtDdMs3WWLlrMrNyxVZmMHi2uNPDFdb6+rY3s3mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FU4fxELSZl4Jfbk2PHMaqpnA3NtW6Vx/58UfKqhZrlw=;
 b=EPbThxtKoUcnNBHLv/Y24egbymf37BXw8EfKcrasZNEF24QiNzv97JOrQ5KquwE14v48iEptpiooUd6NEpNql2hhTEKVPYsgG0IBjXa2EKbq3uC5ruE9UekYj9cd67GKwGEcpIzND91zfYIDxjNHfV2hHJfiefZs2XuR+6hZgi8=
Received: from SJ2PR07CA0007.namprd07.prod.outlook.com (2603:10b6:a03:505::12)
 by SA3PR12MB9225.namprd12.prod.outlook.com (2603:10b6:806:39e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 16:04:58 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:a03:505:cafe::69) by SJ2PR07CA0007.outlook.office365.com
 (2603:10b6:a03:505::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Tue,
 17 Mar 2026 16:04:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 16:04:58 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 17 Mar
 2026 11:04:49 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Mar
 2026 11:04:49 -0500
Received: from hwentlanryzen (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 17 Mar 2026 11:04:48 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH 05/10] lib/igt_color: Add YUV pixel reading support
Date: Tue, 17 Mar 2026 12:04:31 -0400
Message-ID: <20260317160443.229812-6-harry.wentland@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317160443.229812-1-harry.wentland@amd.com>
References: <20260317160443.229812-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|SA3PR12MB9225:EE_
X-MS-Office365-Filtering-Correlation-Id: 987b3783-1b69-482f-eea9-08de843eeffc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700016|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: u3HDwkCiOVbJK9s0d+KRkgxomuZBj3dRmAQceSb+P9LE4qy0Ij3yjFDas6hF/2/qvECAIqHdfef06dXX3Zkw1EC4OFLE8/n9o6230ryA5KX3RuEk7UCEeemm9ldjypJsYFIpNZJBF4LPKdEbz4J0VF9oFn6l5+pPzt0dR5y4U7Oy3LMBSIuRN4QGpOxd5QEinI/wvuGVWxAF4DVA8tr2IrnpeB6IiNpQh1HUnHB+R8DDht7pQedViiZv9koXzPPOpk/I3ErhdBOP/k4JziyG/gF26542mQyNY10VlFRTB5khFCLO1OVSUliztB5+YsByjUZa/5y8gqB0Yt89f850I2YUiyFH2sSXwnPF38GxIoqrBRbfY8qf/RNOTy3y++TWsuDm5rNc1O1Yn+STNE7YJdJU7sF1W5+h0jSPziv5pnIoIEk8lYpfaQvDKtDfvrd9tbMOEZ1alYjiX1XKP/5fmwz4VsQViM+0dDuM6fqnCM0I9mzN38ngbbduPx8v9xCkAFHKW8wzHITzPoyMEp3f8cdB/WN4T9f/m1LBXBy2OS0cTFU1DYZBahtwXohk1Xw7dKn4oxeGr2Pkk+ZOSaOZgvgcNpWgKn1r5Q5OltUYmUJPp3bUYJ2uiSZQ1Vefws0EESS5vR11pPRSevGvKC8A9OID2xI9cXarbuBLF3jTPY5l7Kf/nX69o9Iz1XtnIANm8corJjrJLVLnEE0/pF9cNqm9jSBCEn09/qVgiq2JJTk5n+kBKqaJOrYSUZa3d6yYRiyiVHRA89EiMltBcUboxQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: QxjH06Sd0NKE9jVJpSf5JkM/BeVo88jVNlsiBG921oFqzq8Rx61ulXqqYkmaQZqm4WzC53O+M5SHpvnBSaIgjpfMqV9m3g2TfYMpg+51lQK9v4rEs5Ki81lyezRwYtS7Cr5pCefCwCYJ5glmesSJ1VOXVxPZdukZiN5DSXEDKxJRAOopaqXTHUFSBnCGpue7fhlD6wc/7C+CWSobAw+es2crHam/uNbLaoGgONPFqtJCR4LDsD2kUiuYsXScU72rFDRKJE5AJxqfmiDkhKR5LLdywbqOGCSWQRkUoIxGoKMLL129pPZwiXPnz8ml87LJ84PhEBfug5EYhM5f76fjucki4cVMEkgW6lo7/0hCuL1AmuoCJWGj5SHIOz0oLpbyjJTzIp7bo/TtzHUZ3x5iuuIRNV0F5EzjVZ8rE8DkaggLqIpSnQwNkpDBE7Ef8dqN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 16:04:58.1219 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 987b3783-1b69-482f-eea9-08de843eeffc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9225
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

Add functions to read YUV pixel values from framebuffers. Supports
NV12 and P010 formats with proper handling of:
- Multi-planar Y/UV data layout
- 8-bit and 10-bit sample depths
- Chroma subsampling

This provides the foundation for YUV color transformation testing.

Co-developed by Claude Sonnet-4.5.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_color.c | 110 +++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 104 insertions(+), 6 deletions(-)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index 8c405275acf8..6b6d0bd11135 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -437,6 +437,78 @@ void igt_color_3dlut_17_12_rgb(igt_pixel_t *pixel)
 	igt_color_3dlut_tetrahedral(pixel, &igt_3dlut_17_rgb, 17);
 }
 
+/**
+ * igt_color_extract_yuv_pixel - Extract raw Y, U, V values from YUV buffer
+ * @fb: framebuffer
+ * @x: x coordinate
+ * @y: y coordinate
+ * @y_plane: pointer to Y plane
+ * @uv_plane: pointer to UV plane
+ * @y_stride: stride of Y plane
+ * @uv_stride: stride of UV plane
+ * @out_y: output Y value (raw, not normalized)
+ * @out_u: output U value (raw, not normalized)
+ * @out_v: output V value (raw, not normalized)
+ *
+ * Extracts raw Y, U, V component values from a YUV framebuffer at the given
+ * coordinates. Handles 4:2:0 subsampling for UV components. Values are raw
+ * (not normalized) and format-specific.
+ */
+static void
+igt_color_extract_yuv_pixel(igt_fb_t *fb, int x, int y,
+			    uint8_t *y_plane, uint8_t *uv_plane,
+			    int y_stride, int uv_stride,
+			    uint32_t *out_y, uint32_t *out_u, uint32_t *out_v)
+{
+	if (fb->drm_format == DRM_FORMAT_NV12) {
+		*out_y = y_plane[y * y_stride + x];
+		*out_u = uv_plane[(y / 2) * uv_stride + (x / 2) * 2 + 0];
+		*out_v = uv_plane[(y / 2) * uv_stride + (x / 2) * 2 + 1];
+	} else if (fb->drm_format == DRM_FORMAT_P010) {
+		uint16_t *y16 = (uint16_t *)y_plane;
+		uint16_t *uv16 = (uint16_t *)uv_plane;
+
+		*out_y = y16[y * (y_stride / 2) + x];
+		*out_u = uv16[(y / 2) * (uv_stride / 2) + (x / 2) * 2 + 0];
+		*out_v = uv16[(y / 2) * (uv_stride / 2) + (x / 2) * 2 + 1];
+	} else {
+		igt_skip("YUV pixel format support not implemented");
+	}
+}
+
+/**
+ * igt_color_yuv_to_pixel - Convert raw Y, U, V values to normalized pixel
+ * @drm_format: YUV format (NV12 or P010)
+ * @raw_y: raw Y value
+ * @raw_u: raw U value
+ * @raw_v: raw V value
+ * @pixel: output pixel structure
+ *
+ * Converts raw Y, U, V component values to a normalized igt_pixel_t structure.
+ * For NV12 (8-bit), normalizes by 255. For P010 (10-bit in upper bits),
+ * shifts and normalizes by 1023.
+ *
+ * Result: pixel->r = normalized Y, pixel->g = normalized U, pixel->b = normalized V
+ */
+static void
+igt_color_yuv_to_pixel(uint32_t drm_format, uint32_t raw_y, uint32_t raw_u,
+		       uint32_t raw_v, igt_pixel_t *pixel)
+{
+	if (drm_format == DRM_FORMAT_NV12) {
+		/* Normalize 8-bit values to [0.0, 1.0] */
+		pixel->r = raw_y / 255.0f;
+		pixel->g = raw_u / 255.0f;
+		pixel->b = raw_v / 255.0f;
+	} else if (drm_format == DRM_FORMAT_P010) {
+		/* P010 uses upper 10 bits of 16-bit value */
+		pixel->r = (raw_y >> 6) / 1023.0f;
+		pixel->g = (raw_u >> 6) / 1023.0f;
+		pixel->b = (raw_v >> 6) / 1023.0f;
+	} else {
+		igt_skip("YUV pixel format support not implemented");
+	}
+}
+
 static void
 igt_color_fourcc_to_pixel(uint32_t raw_pixel, uint32_t drm_format, igt_pixel_t *pixel)
 {
@@ -513,14 +585,28 @@ int igt_color_transform_pixels(igt_fb_t *fb, igt_pixel_transform transforms[], i
 	char *ptr;
 	int x, y, cpp = igt_drm_format_to_bpp(fb->drm_format) / 8;
 	uint32_t stride = igt_fb_calc_plane_stride(fb, 0);
+	uint8_t *y_plane = NULL, *uv_plane = NULL;
+	int y_stride = 0, uv_stride = 0;
+	bool is_yuv = (fb->drm_format == DRM_FORMAT_NV12 || fb->drm_format == DRM_FORMAT_P010);
 
-	if (fb->num_planes != 1)
+	if (!is_yuv && fb->num_planes != 1)
+		return -EINVAL;
+
+	if (is_yuv && fb->num_planes != 2)
 		return -EINVAL;
 
 	ptr = igt_fb_map_buffer(fb->fd, fb);
 	igt_assert(ptr);
 	map = ptr;
 
+	/* For YUV formats, set up plane pointers */
+	if (is_yuv) {
+		y_plane = map;
+		y_stride = fb->strides[0];
+		uv_plane = y_plane + fb->offsets[1];
+		uv_stride = fb->strides[1];
+	}
+
 	/*
 	 * Framebuffers are often uncached, which can make byte-wise accesses
 	 * very slow. We copy each line of the FB into a local buffer to speed
@@ -533,16 +619,28 @@ int igt_color_transform_pixels(igt_fb_t *fb, igt_pixel_transform transforms[], i
 	}
 
 	for (y = 0; y < fb->height; y++, ptr += stride) {
-
-		/* get line from buffer */
-		igt_memcpy_from_wc(line, ptr, fb->width * cpp);
+		/* For RGB, get line from buffer */
+		if (!is_yuv)
+			igt_memcpy_from_wc(line, ptr, fb->width * cpp);
 
 		for (x = 0; x < fb->width; x++) {
-			uint32_t raw_pixel = le32_to_cpu(line[x]);
 			igt_pixel_t pixel;
 			int i;
 
-			igt_color_fourcc_to_pixel(raw_pixel, fb->drm_format, &pixel);
+			if (is_yuv) {
+				uint32_t raw_y, raw_u, raw_v;
+
+				/* Extract raw Y, U, V from YUV buffer */
+				igt_color_extract_yuv_pixel(fb, x, y, y_plane, uv_plane,
+							    y_stride, uv_stride,
+							    &raw_y, &raw_u, &raw_v);
+
+				/* Convert to normalized pixel (pixel.r=Y, pixel.g=U, pixel.b=V) */
+				igt_color_yuv_to_pixel(fb->drm_format, raw_y, raw_u, raw_v, &pixel);
+			} else {
+				uint32_t raw_pixel = le32_to_cpu(line[x]);
+				igt_color_fourcc_to_pixel(raw_pixel, fb->drm_format, &pixel);
+			}
 
 			/* run transform on pixel */
 			for (i = 0; i < num_transforms; i++)
-- 
2.53.0

