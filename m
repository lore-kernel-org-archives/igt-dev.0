Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F02C5516F
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 18:04:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55FC10F380;
	Fri, 31 Jul 2026 18:04:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0U7CG8sk";
	dkim-atps=neutral
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013033.outbound.protection.outlook.com
 [40.93.201.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89DEC10F380
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 18:02:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vGEgKpbtSGJHuxz8FNCUTRfalPFEVfL9aQbC6BJRBjfcwB0h6/oevmQbe9d6xAnAHY8mu/7g89jkuDO3VH5HZKn3v7HNrFRIm9iyeUeDWb0CPz4ORyhOUzm8hVxJsr28QfMvj9dhN3r9MuITSROQW98pVpyM+VowYBOh630p+2+RJl/8bz9iwdSDCdZ13z0gCNuYRNi+UBjMhme76KM2FqH1poY/2CTI5CehyNxr8Qhm7qst/vuO5zzei3Db5GCQtIawJsBZwjdGtSY5TfTe1o4ge6EAqiXULElWgskFC3ogunUnOVMa6q4adDWB3iFLXjboh7UQzjaEN6rKwM03ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HTKjiR4AtXThuVI6spvJTCioqDrB3W7Ykag9TDkui30=;
 b=x9F/vB08nCSKvXWm8plrUxyeLqCZAnTb9YbuV7FapIbbtuEIo3Le9kNp9nI6FMeNu67AgBulhK8sHODX+udweFGMfxtPNe9EOujUAngJCpt1uRzzznUsMG6nZl3oCoYX7/SYDrFmGm/q3rcT+TzD+NpO9dbrmdkEbxKDWxP/JQGDycvv3KANmbVQd8LtF2J/xa3NpSPIu/JFp1oIDyVe8p0f1cp3yTWo7NdMBKfc8BjZbwHY06qEEL253FE5VWh4Oo0ry5qRwvWxknEbGX4p6NsBKsM61Ky6URuF3gUl6eCgSX7nqzXtYQBzjzPJAH/rhrDYR8skq3K4GfHtUK41Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTKjiR4AtXThuVI6spvJTCioqDrB3W7Ykag9TDkui30=;
 b=0U7CG8skTjZCdBPTh+ZNNkG+IouZ6NEtdxV+0DOyMop9nzYciIQXnlwFjDU2im7617KLji+Zv6LD9LEZtk6tvhCP9A6r9QUWxaYoPoTXfaeiAGYzRdM6HKvOUPWRnzPOrNXzGM5sDzUxYHp6xDap0UPDNDcSxLpR5A9ofUyazqQ=
Received: from BY1P220CA0025.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::12)
 by CH1PR12MB9720.namprd12.prod.outlook.com (2603:10b6:610:2b2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 18:02:13 +0000
Received: from CO1PEPF00012E7E.namprd03.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::32) by BY1P220CA0025.outlook.office365.com
 (2603:10b6:a03:5c3::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.16 via Frontend Transport; Fri,
 31 Jul 2026 18:02:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E7E.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 18:02:13 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 13:02:13 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 11:02:12 -0700
Received: from hwentlanryzen (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 31 Jul 2026 13:02:12 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v4 07/10] lib/igt_color: Refactor transform_pixels for
 input/output FBs and CSC
Date: Fri, 31 Jul 2026 14:01:57 -0400
Message-ID: <20260731180200.668795-8-harry.wentland@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260731180200.668795-1-harry.wentland@amd.com>
References: <20260731180200.668795-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7E:EE_|CH1PR12MB9720:EE_
X-MS-Office365-Filtering-Correlation-Id: e8c484ad-9122-4438-5d6c-08deef2dd980
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|11063799006|56012099006|10067099003|6133799003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: xLTsUeokBIBbe5x1IY4yYhoWooniGok74igfj1KBf01nDVLEH4NfLIjlUo8A0rUSIfqZoOFKN9LKwyhf+xTNqLunW+urk7eMZSL5OAB7PKRVUXJu/P2n8m4oiFgUV5Q/NYTo7j5d7bhsKDavO6kIwP9Fc11J1246kbwDRQV4SWP1bLkXhEeL8FexwS+nPXfMsvqGDx9eocizBTQ7Vd7kaXrG8vugjpLDR0SpciTiYaNNuwe2L7KO4xGm+ZzVPMJtPCnl7VYK4KErZqLW7wPYUyQgkwEjP6TovB1dhDgIw4BK4aac6OVpj0qrDj9kDkfNaT7nkLNlFnLF1nTq/Z1gMMkWKbnD4ubkggwOua/bJ4tCCY+CK6HHbHrcHhb6ZPl2ui6TtksD4R5r6kGEDZSJagEOqufz0GqUU8J8ioKPDKw5Rz98eqOSVqlrg/70zwjw55yLyAoQIX5DxIb0MSXfOM6Jp7y9gjO0V6BsrDGkRvACGT65pIf33NWRwbFC+Q5DQnNnLT3xdP7gj1mB+rQt10v+hiOyJc1r5Ymz3D7AglA1P0N5kW5JEQx2fEP2VD9rMftTD94hwBXDI7K5awC0qpMEpoJDC1G6lHQQYsaEzr56qmM+d7Sp1c2s4OnP85nteP+zh33iGw73B3SO8l08fz5tvwnDUhekJaWNNitCvx2CpmbnBWd65LT1UjwEsjVfiOmNG/we6tFHoSAx+wptOw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(11063799006)(56012099006)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: KMsAQ2XKXSrz6vSOkh7TG1r+ogqd3c5jTXrGpLhOlfk2uQVT87IIpe6BdvnVtWcOo1HjLo85xtu6qCUOOGcFO7ZUz7sP0Hb0CqPZN7M+mwQWSBtVKYG6dXIsEVo/i6TjwQ/Kwm3XzoSCpjyylDedwrt7GCWhaI2RBhTephMgszYGSGhrEhnhGK7YUw6SMzAaVoG12NSzgTYxvvJEjSKkQ2/pI5E3TGi4mJgovCjWI5m9TFcpImnkoZfS/aeluzCPU9vbw3tm5pe7s1uGAojsCnfOCWTX7N8MmlarCgbVHClwifE92trDPip8jOjt+muyq4Y1UqYDXXNlUOPiemE6Iy8qJVeAcuACXNAYPF2QDFzXX2TcJSNH3uMGTwlehgx25xhIlJKe4AaXvbdUbjvxs+CZjJIXsdMGsoTLzW2I9yUFu4xh+wQuydnkLNpKml4z
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 18:02:13.3991 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8c484ad-9122-4438-5d6c-08deef2dd980
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E7E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9720
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

Refactor igt_color_transform_pixels() to accept separate input and
output framebuffers, plus optional YUV encoding/range parameters for
CSC conversion. This enables:
- Reading from YUV input (NV12/P010) and writing to RGB output
- Inline YUV-to-RGB CSC using the igt_color_encoding matrix library
- Skipping the first transform when CSC is applied (since it's done
  inline via the matrix)

Update apply_transforms() in kms_colorop.c to extract encoding/range
from the first colorop when it's a FIXED_MATRIX type, and pass both input
and output FBs to the refactored function.

Also update colorop_plane_test() to create sw_transform_fb with the
output format rather than copying the input FB.

Assisted-by: Claude:claude-sonnet-4-5
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_color.c     | 170 +++++++++++++++++++++++++++++++++++---------
 lib/igt_color.h     |   6 +-
 tests/kms_colorop.c |  34 +++++----
 3 files changed, 160 insertions(+), 50 deletions(-)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index a451f5642bac..582fc6c0c3bc 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -13,6 +13,7 @@
 
 #include "drmtest.h"
 #include "igt_color.h"
+#include "igt_color_encoding.h"
 #include "igt_core.h"
 #include "igt_x86.h"
 
@@ -578,58 +579,159 @@ igt_color_pixel_to_fourcc(uint32_t drm_format, igt_pixel_t *pixel)
 	return raw_pixel;
 }
 
-int igt_color_transform_pixels(igt_fb_t *fb, igt_pixel_transform transforms[], int num_transforms)
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
+	uint8_t *y_plane = NULL, *uv_plane = NULL;
+	int y_stride = 0, uv_stride = 0;
+	bool input_is_yuv = (input_fb->drm_format == DRM_FORMAT_NV12 ||
+			     input_fb->drm_format == DRM_FORMAT_P010);
+	bool output_is_yuv = (output_fb->drm_format == DRM_FORMAT_NV12 ||
+			      output_fb->drm_format == DRM_FORMAT_P010);
+	struct igt_mat4 csc_matrix;
+	bool apply_csc = false;
 
-	if (fb->num_planes != 1)
+	/* Validate framebuffer dimensions match */
+	igt_assert(input_fb->width == output_fb->width);
+	igt_assert(input_fb->height == output_fb->height);
+
+	if (input_is_yuv && yuv_encoding >= 0) {
+		apply_csc = true;
+
+		csc_matrix = igt_ycbcr_to_rgb_matrix(input_fb->drm_format,
+						     output_fb->drm_format,
+						     yuv_encoding, yuv_range);
+	}
+
+	/* Validate plane counts */
+	if (!input_is_yuv && input_fb->num_planes != 1)
 		return -EINVAL;
 
-	ptr = igt_fb_map_buffer(fb->fd, fb);
-	igt_assert(ptr);
-	map = ptr;
+	if (input_is_yuv && input_fb->num_planes != 2)
+		return -EINVAL;
 
-	/*
-	 * Framebuffers are often uncached, which can make byte-wise accesses
-	 * very slow. We copy each line of the FB into a local buffer to speed
-	 * up the hashing.
-	 */
-	line = malloc(stride);
-	if (!line) {
-		munmap(map, fb->size);
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
+	for (y = 0; y < input_fb->height; y++) {
+		/* For RGB input, read line from input buffer */
+		if (!input_is_yuv)
+			igt_memcpy_from_wc(input_line, input_ptr + y * input_stride,
+					   input_fb->width * input_cpp);
 
-		/* get line from buffer */
-		igt_memcpy_from_wc(line, ptr, fb->width * cpp);
-
-		for (x = 0; x < fb->width; x++) {
-			uint32_t raw_pixel = le32_to_cpu(line[x]);
+		for (x = 0; x < input_fb->width; x++) {
 			igt_pixel_t pixel;
 			int i;
+			int start_transform;
 
-			igt_color_fourcc_to_pixel(raw_pixel, fb->drm_format, &pixel);
+			/* READ from input buffer */
+			if (input_is_yuv) {
+				uint32_t raw_y, raw_u, raw_v;
+				struct igt_vec4 yuv, rgb;
 
-			/* run transform on pixel */
-			for (i = 0; i < num_transforms; i++)
-				transforms[i](&pixel);
+				/* Extract raw Y, U, V from YUV input buffer */
+				igt_color_extract_yuv_pixel(input_fb, x, y, y_plane, uv_plane,
+							    y_stride, uv_stride,
+							    &raw_y, &raw_u, &raw_v);
 
-			/* write back to line */
-			line[x] = cpu_to_le32(igt_color_pixel_to_fourcc(fb->drm_format, &pixel));
+				/* Convert YUV to RGB using pre-computed CSC matrix */
+				if (apply_csc) {
+					float rgb_max;
+
+					/* Matrix expects raw format values */
+					yuv.d[0] = raw_y;
+					yuv.d[1] = raw_u;
+					yuv.d[2] = raw_v;
+					yuv.d[3] = 1.0f;
+
+					rgb = igt_matrix_transform(&csc_matrix, &yuv);
+
+					rgb_max = (output_fb->drm_format == DRM_FORMAT_XRGB2101010) ? 1023.0f : 255.0f;
+
+					pixel.r = rgb.d[0] / rgb_max;
+					pixel.g = rgb.d[1] / rgb_max;
+					pixel.b = rgb.d[2] / rgb_max;
+				} else {
+					igt_color_yuv_to_pixel(input_fb->drm_format, raw_y, raw_u, raw_v, &pixel);
+				}
+			} else {
+				uint32_t raw_pixel = le32_to_cpu(input_line[x]);
+				igt_color_fourcc_to_pixel(raw_pixel, input_fb->drm_format, &pixel);
+			}
+
+			/* Transform pixel through remaining transforms */
+			/* Skip first transform if it was a CSC that we already applied */
+			start_transform = apply_csc ? 1 : 0;
+			for (i = start_transform; i < num_transforms; i++)
+				if (transforms[i])
+					transforms[i](&pixel);
+
+			/* write to output buffer */
+			output_line[x] = cpu_to_le32(igt_color_pixel_to_fourcc(output_fb->drm_format, &pixel));
 		}
 
-		/* copy line back to fb buffer */
-		igt_memcpy_from_wc(ptr, line, fb->width * cpp);
+		/* Copy output line to output buffer */
+		igt_memcpy_from_wc(output_ptr + y * output_stride, output_line,
+			      output_fb->width * output_cpp);
 	}
 
-	free(line);
-	igt_fb_unmap_buffer(fb, map);
+	free(output_line);
+	free(input_line);
+	igt_fb_unmap_buffer(output_fb, output_map);
+	igt_fb_unmap_buffer(input_fb, input_map);
 
 	return 0;
 }
diff --git a/lib/igt_color.h b/lib/igt_color.h
index 722446400f01..d66cfebc4191 100644
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
 
diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 16db0b8ad37f..bdfe312b8124 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -195,15 +195,25 @@ static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
 
 #define MAX_COLOROPS 5
 
-static void apply_transforms(kms_colorop_t *colorops[], igt_fb_t *sw_transform_fb)
+static void apply_transforms(kms_colorop_t *colorops[], igt_fb_t *input_fb,
+			     igt_fb_t *sw_transform_fb)
 {
 	int i;
+	int yuv_encoding = -1;
+	enum igt_color_range yuv_range = IGT_COLOR_YCBCR_LIMITED_RANGE;
 	igt_pixel_transform transforms[MAX_COLOROPS];
 
 	for (i = 0; colorops[i]; i++)
 		transforms[i] = colorops[i]->transform;
 
-	igt_color_transform_pixels(sw_transform_fb, transforms, i);
+	/* If first colorop is CSC FF, extract encoding/range for sw reference */
+	if (colorops[0] && colorops[0]->type == KMS_COLOROP_FIXED_MATRIX) {
+		yuv_encoding = colorops[0]->fixed_matrix_info.encoding;
+		yuv_range = colorops[0]->fixed_matrix_info.range;
+	}
+
+	igt_color_transform_pixels(input_fb, sw_transform_fb, transforms, i,
+				   yuv_encoding, yuv_range);
 }
 
 static void colorop_plane_test(igt_display_t *display,
@@ -217,11 +227,8 @@ static void colorop_plane_test(igt_display_t *display,
 {
 	igt_colorop_t *color_pipeline = NULL;
 	igt_fb_t sw_transform_fb;
-	igt_crc_t input_crc, output_crc;
 	int res;
 
-	igt_fb_get_fnv1a_crc(input_fb, &input_crc);
-
 	/* reset color pipeline*/
 
 	set_color_pipeline_bypass(plane);
@@ -235,18 +242,15 @@ static void colorop_plane_test(igt_display_t *display,
 				NULL);
 	igt_get_and_wait_out_fence(output);
 
-	/* Compare input and output buffers. They should be equal here. */
-	igt_fb_get_fnv1a_crc(output_fb, &output_crc);
-
-	igt_assert_crc_equal(&input_crc, &output_crc);
-
-	/* create sw transformed buffer */
-	res = igt_copy_fb(display->drm_fd, input_fb, &sw_transform_fb);
+	/* create sw transform buffer with output format */
+	res = igt_create_fb(display->drm_fd,
+			    input_fb->width, input_fb->height,
+			    output_fb->drm_format,
+			    DRM_FORMAT_MOD_LINEAR,
+			    &sw_transform_fb);
 	igt_assert_lte(0, res);
 
-	igt_assert(igt_cmp_fb_pixels(input_fb, &sw_transform_fb, 0, 0));
-
-	apply_transforms(colorops, &sw_transform_fb);
+	apply_transforms(colorops, input_fb, &sw_transform_fb);
 
 	if (data.dump_check)
 		igt_dump_fb(display, &sw_transform_fb, ".", "sw_transform");
-- 
2.55.0

