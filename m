Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611B5C5516D
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 18:08:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 061DF88284;
	Fri, 31 Jul 2026 18:08:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JLAaLKu2";
	dkim-atps=neutral
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012043.outbound.protection.outlook.com [52.101.43.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44EB710F36A
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 18:02:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gIhakATPoAQM6fimY8FtJrNWAXOd2woavHOinKQKd8tFRuireebZDoHSK56Cu2ySfaF4aKYJu9dlsgoF8oU1PavXw/kFBA0YT6+XFG8/STVNzDsb8aRgUQ9fzHMycf8wyPDfHNOV5aGsjIyJbVLAOiAQk1ZKj7MHjdxMX3yVysJ8FMe25OCPy3O4e4r7S6S6Fsa2eMQXEzcDHJcUuYnKs1A2L6KOE7g4yUeWBybcGPKmAa6d303Zx+Tjf/KBg1sJmv97EJnfMd6iQjoFK7/Hx+nPV7bMe6qkrcPvfrCYMaFViuYMSgdO0Uc/WXjA5awKiPkenWr/8nNBYlv6NFnqBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWb6yIMMjvtD2PDdHG7oxRHUS0xChSyKQNCRbnHHdqE=;
 b=W4094UTlV0XVACS2yOKHCHETi4qFwiMPjEYHpqOxxuiTa03Jb4yY53ObfYSVPQ8dFhztb9qwnlZikC1ttTXeM1O2PcMtKo1WI66lckL69/d1aZoYNq7vX/rODsTJ3rCqmXxJkYlyoQiSwsUnSwFr+Ba/Ff3olDJ9dNqqQjnkCDurGhkovnNo2vDyyeRqUji6r+Dc+2J17xKXXCfZ3f7nD40kdzNKRDhiswXJqJpS6GNX25681hsk+WuTkk38HVrnx4fuBVP8Nhe1fuS61dZYmcZCYuR1OdLwWsfsscghvochyA0jbQT2JoTUtzaOA4zbYLQPgIUw7eOlF4Ehz7qbiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWb6yIMMjvtD2PDdHG7oxRHUS0xChSyKQNCRbnHHdqE=;
 b=JLAaLKu297sviZiCH4o8cuENPS1ev0luyKIx/czV4GjYB8TSXr9cAPdDtO+vkJeoiA6AeXXITanL2GISnCfV0jZSZENVpad0yBg6oKWT72+fhzszopvKF1XNIQzZJcEYZsKiLnxMes7cYDVwX0c84bP7OLMcNjQxhAqepA1wskw=
Received: from SJ0PR13CA0178.namprd13.prod.outlook.com (2603:10b6:a03:2c7::33)
 by BL4PR12MB9478.namprd12.prod.outlook.com (2603:10b6:208:58e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 18:02:13 +0000
Received: from CO1PEPF00012E7F.namprd03.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::66) by SJ0PR13CA0178.outlook.office365.com
 (2603:10b6:a03:2c7::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.10 via Frontend Transport; Fri,
 31 Jul 2026 18:02:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E7F.mail.protection.outlook.com (10.167.249.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 18:02:12 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 13:02:12 -0500
Received: from hwentlanryzen (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 31 Jul 2026 13:02:11 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH v4 06/10] lib/igt_color: Add YUV pixel reading support
Date: Fri, 31 Jul 2026 14:01:56 -0400
Message-ID: <20260731180200.668795-7-harry.wentland@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260731180200.668795-1-harry.wentland@amd.com>
References: <20260731180200.668795-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7F:EE_|BL4PR12MB9478:EE_
X-MS-Office365-Filtering-Correlation-Id: abf83c90-0c83-4c86-7acb-08deef2dd8fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|22082099003|18002099003|11063799006|56012099006|3023799007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: tMtdxmMFuYkqB6YPIXjWWHSsfgU8/ZDyWE8BjL9FUuje++alyqr3SAnjDTSAzJJq2QEmCBEzJnGeEJOSD3+sbRCTXmvOAVVB4LRL3U/SBHMdAwsmDyuhy7aVS3/3TcRZv+Yw5m7CUY4Bl2G5YzIptO7qaY+anPDoQUe6HJNNS34JamIMdmAZJObqmFGd/C0Vee4rbXARIO/mGCbyQDbrgvzid2ARUnDNA6j4M/yGMOW0antvssUhxoJl2zLLn1Md69G7fs6/eLOFSuZUba4vlNiPFbHsSM+4mINuTm/fYvjzsa6g2nlv1Gh9alRB2iHWcxoOeFFOBK3gEnwtAgABnkUCwXv8/p3PiKCwOxBqo1d9ize+r94CG3mKbi427WeixqNVE3j1E9QIyCyy1uDVusVFcHYztQw4RsJxGPEjb1Bui9ZmcgnQVNiIR+7IS3vQ2D11QRwyQAb53y/NplZqGWdxom0YiZUxpxcmEwSDH48RyebSzuhZRmI+8TC+90gMywivSVr6ZVAflMWtrWlJKQ68uUr2xOnUBWEKTeONMgY/aVgi+zSQyNsfR34aEvLQ4F/aYaQYpX15f7Rcte+yYJMBK769q6iMzHfQXtFxj01qu+yTuX5JuuQCAV/dF/36/Tq1gzTlg/bk6CFCZli2uznAc7GW2QQX00lA8FlS0NbgFjR4jdWXhWX2ZQLCJ7LmHc7bysHn11c5rCPRQyL/tw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(22082099003)(18002099003)(11063799006)(56012099006)(3023799007)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4VeumFTGuaxzyl1yF7XDy+bHPrqO16ijreF6S3s/fIZEp6PAFckT/BJZ/ZgfWM60bjTKfvF/btEPTypzxqr3kQjbP5ijkorMCKcZiFPMT5DOUc0rGKImQvumdN0j/pc+y2jTEgs6yH7u85ApziI1Cfys3pnxP5UGiIHWwYAyEHMzGBDbMCvCBq8Cc3sH+XbgLWLJTWvB1IvI3JswjL52TOma/e2+E3qUIrV3PVYK8a3LI45bTp4IO9tELKNaZ+Oj9ffZvVDyBN1v33V6pBzpLjvW5YabikHjRjhzu5vWrc4AIIWER6czra542soY/YItybfhLkOJWrj8+Lj3aYliKavqxrrLWs71YNLU8DzrASMZoinFQqxD3ydU4UY13qUwZpTbMJDfwChC5eH9WY4s7X7btmC0Yr6WmnHA1C1+8oUDey4Y2kXQqviQTHrhqD7x
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 18:02:12.5385 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abf83c90-0c83-4c86-7acb-08deef2dd8fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E7F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9478
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

Assisted-by: Claude:claude-sonnet-4-5
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Alex Hung <alex.hung@amd.com>
---
 lib/igt_color.c | 72 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index 8c405275acf8..a451f5642bac 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -259,6 +259,78 @@ void igt_color_multiply_inv_125(igt_pixel_t *pixel)
 	igt_color_multiply(pixel, 1 / 125.0f);
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
 static int
 igt_get_lut3d_index_blue_fast(int r, int g, int b, long dim, int components)
 {
-- 
2.55.0

