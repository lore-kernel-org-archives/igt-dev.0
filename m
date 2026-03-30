Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3631061B0F
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 15:36:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF2010E6F5;
	Mon, 30 Mar 2026 15:36:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MAJgTb+J";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011036.outbound.protection.outlook.com [52.101.52.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B6210E6C7
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 15:35:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nRo1JZT4fSP1+9z35BO8lUjbIgXJYS9VsdPn0Wbp/6O1FpfCCYfC6HMTZqmvLIApiEE1jX0CaSZWLdrj+6XFU0nq/vqMutFhot1eaD5ncjFBQYoFJtwwbAbGyR5/d3N+Fl+1cztYlB26m00I8T+CiihyD3MkKOWXKQt88jH8sngK+7ksd7IXHI5RccfydU6cTO1gigSPEkuVjHhPvu0e4kzT4nBUTnJY6GLJqmeAakwZXPMtZvdUZ6q0kTylRrbn2Mm1WM5MuQh1nheNv75qs1zo1YzdKsv/QnioabPuO46tGv7gv75HY8orfcw9bV/+XAajtPDR7zV9mq4R3ygPSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhYwMM5K5wF2xdRzgjFw/5E0RbzPlxRJsFFKujU+tKg=;
 b=tbWdJ8qmZm5Pn4TjMINUU870JCOZIEwYDt2S0PJJo1EUQVQZ6bjgMs2Bp7udzZ8h+0Su1piSaJ5w2DH161r/id5uIZFjB3DsviO3zv1pY8w+0+b7ECXqFSHv1vApBuWeCo/syv6lgCfRPObD/IttGqQuqq1mLCkGZxzfAN03P+4QgvX5eVBf3I6LAYUKS2OPaTCiLHmTYZuVHpTd0olZkMV3oVhW0qW5wq0bczO43gfRd9wzcNljERtfYDeKH2wOyYfiFwYtROgDSCff1hekWxdvU2ZGxNn2JjuCQMx9i6wiHUHkbT1v0cjA5UIZsiwi/8qurjjPRJRecRpTgXO/JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhYwMM5K5wF2xdRzgjFw/5E0RbzPlxRJsFFKujU+tKg=;
 b=MAJgTb+JPsvWEHhVPwWM9vIDn1PuI/y3rtka7j61C4aKoiFsv57HPyyJUK3OKdDMW6Wj2X2CKR8FbYyEjQsuCMmFEnCRfODZuffRbfv98GzJooeB8pwaHH6E9Hk5Wshkhomu5PT5AwDEPAGY97ngWJVZYjBDX2OAwnlWB+At3Kg=
Received: from SJ0PR03CA0036.namprd03.prod.outlook.com (2603:10b6:a03:33e::11)
 by MN0PR12MB6222.namprd12.prod.outlook.com (2603:10b6:208:3c2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 15:35:33 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:33e:cafe::d1) by SJ0PR03CA0036.outlook.office365.com
 (2603:10b6:a03:33e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Mon,
 30 Mar 2026 15:35:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 15:35:33 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 30 Mar
 2026 10:35:25 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 30 Mar
 2026 08:35:25 -0700
Received: from hwentlanryzen (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 30 Mar 2026 10:35:24 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH v2 07/11] lib/igt_color: Refactor transform_pixels for
 input/output FBs and CSC
Date: Mon, 30 Mar 2026 11:35:14 -0400
Message-ID: <20260330153518.99898-8-harry.wentland@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330153518.99898-1-harry.wentland@amd.com>
References: <20260330153518.99898-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|MN0PR12MB6222:EE_
X-MS-Office365-Filtering-Correlation-Id: deb04a81-7635-455e-994d-08de8e71fb98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|82310400026|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: uDxo4v8/2+b15CJxBaEeIx6fOT0gucGgW8d0fDY/n4AAUmj1WANSFCCLoQMg4U3FCwmjHAi348NTW0b2OrK0cep96KHyAIkXaGz6ulmUyAhe0jndI8itNc0sVSoe0IuxypGmNxIc84eWYVq5wU8bZbjx/gdD/viK5088YxwSEZY4Yo9iN+W7c/wuhhT5Z2WwNMrMaRyQj/4ZhDom6+lPlh9RIsgv1ErWBoeQmnGHYlqSFmMCtUd5OXG6s3jfRGp6t0kuQE0RMx2/RwYGkdFzfVOPrYDCobG9TG7jh8vSRD6igidbdxdXPeyjTcOZLR9L7chWK462FXG1wZjZDjwSRFNXcDHoFmmzSdLUqIQhrR04uB5ATMosDND354KQ29FQpW7xBZZw8O00tyW56KXH4BMbNTjR+yEwB0qyGQFJCho9Oe48cV1IPhZMpWV3j+/cQWd8o4j/b/OQALIQ5gqLdE/puNyc9nJ0ki9XosXcYsoiIMyeoKo1eA5EvGOVs7Q6HF9XNBVV7eBnyy6ioNV0cNCWeH2Zk7JgJzyxsZ7w4CKFOSI/HsPEvsuEuZ72igf8ir6HdiHfPKQG2MzIzRjs3qUPO/U3wVq2qduaHCKEaCAptEzo8CCSl4vQjNA+/43hKhwYpS6pi7PTzcDVIFdHpQeEZq8TH001rQ0gposuWFgo3ZQ9bfu71wEaYLqnK4ELwEtO8ZqfyJQBcbYLL/oDYxMIciPIxyQNjZnV/IML/+jD0xtDCLgEbQtMqGWmYcZqbzKaz1f5f3KJsQlnMdG3MA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: OMOYcs7VpHYIcKabyHx+PHbDQnTYFI81v+0WABhlQOjS1J3Xf6N1pubZ7s8wAtspX9WkK3UiEMXUGMJiwoZ1fXJ30g6IUZICnK3+a75IWyLuFND6bzIVAQRyAN/wQdpnyeLTSKK9j0piIIB87np3yYpKApwX/stiO9FRhs2YUVi+9E1Av8ba7I6Vm7NIQEQMsEvKWsbioMRJr2NuQWSGJgsinxkZev1awBNfBc/JinCaHA1OIjW1v6fHXVG/xZ28Q0qp/wEFgd2joF+i8Sk5VfT3j00fBPToH7PgC00Xvpn/QwnCb0lPq78wkkr4FDqQF740Gh3VKtZa7nFwofIMhafv+zaYYDSuzC8PPIvq+VE++EJGNoMlMh6Xj8PHJ4vLlN/d9D8Yuwv7KyRJKiPL5iHmOHqrljt17gbs98trlO0ItYbv3GQvEmSEi2IDQRb2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 15:35:33.5605 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: deb04a81-7635-455e-994d-08de8e71fb98
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6222
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
from the first colorop when it's a CSC FF type, and pass both input
and output FBs to the refactored function.

Also update colorop_plane_test() to create sw_transform_fb with the
output format rather than copying the input FB.

Assisted-by: Claude:claude-sonnet-4-5
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_color.c     | 170 +++++++++++++++++++++++++++++++++++---------
 lib/igt_color.h     |   6 +-
 tests/kms_colorop.c |  38 ++++++----
 3 files changed, 166 insertions(+), 48 deletions(-)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index a451f5642bac..cc425cfe5ac9 100644
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
+		memcpy(output_ptr + y * output_stride, output_line,
+		       output_fb->width * output_cpp);
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
index 125afbb0573a..ead8d9f49c22 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -197,15 +197,30 @@ static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
 
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
+	if (colorops[0] && colorops[0]->type == KMS_COLOROP_CSC_FF) {
+		enum igt_color_encoding encoding;
+		enum igt_color_range range;
+
+		csc_ff_type_to_encoding_range(colorops[0]->csc_ff_info.csc_ff_type_name,
+					     &encoding, &range);
+		yuv_encoding = encoding;
+		yuv_range = range;
+	}
+
+	igt_color_transform_pixels(input_fb, sw_transform_fb, transforms, i,
+				   yuv_encoding, yuv_range);
 }
 
 static void colorop_plane_test(igt_display_t *display,
@@ -219,7 +234,7 @@ static void colorop_plane_test(igt_display_t *display,
 {
 	igt_colorop_t *color_pipeline = NULL;
 	igt_fb_t sw_transform_fb;
-	igt_crc_t input_crc, output_crc;
+	igt_crc_t input_crc;
 	int res;
 
 	igt_fb_get_fnv1a_crc(input_fb, &input_crc);
@@ -237,18 +252,15 @@ static void colorop_plane_test(igt_display_t *display,
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
2.53.0

