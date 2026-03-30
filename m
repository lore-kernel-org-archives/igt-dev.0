Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A031061B0F
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 15:36:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C5D10E731;
	Mon, 30 Mar 2026 15:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Lfs7xMXH";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011013.outbound.protection.outlook.com [52.101.52.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1933210E721
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 15:36:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JlceSWIOn9rX0kKJn1fIptRMCOg8BCuMa4o/veFBoSX6zxn9qUIMwhrn8WY2jIw5Qh6H67ySwY1iGp9Kefz2KvcdOZ+Pbei4X3/LZ1O3KrcWHFCE94bZMOrNjvXTk8Nqk93PwZR06w0C6Rkr8F1RtAuNYM/OBLsY5u2OOTSnalvSnpYvp3GGEitsiEwp1wXFP2/5vsVMLWIdryTJZ9EqGyBx/nVFyEF7w1L5I5HJSfqIgoa/GeCRbO3RdykKcb8afRgd1/RzBSv/Ik7R8yJY6CcSBs9Ztslqfh0GjlN5Qe9ay6g6UJDG8ZRt1qWLC+fSSRffvznhpzECP/cJDdQp+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOrDQM21Va5m7t5KIXBOJITs3JT3sPi99WuB2dfgThg=;
 b=vfpYszJYog9e7F7eYI/Fw/qSOLWRmrRDiScsh1ItfOD9l566aPlDelkCunyyUVRJJzNYsX66yKBuT63F7qth886LnYsUyoa983PYv25Iks8deVd9UATh2FD37G5GHt22kWq5RkEQcIVtrK52BWjVl8Pup/GJpPqWy2MGsTPMPuSgQEak6Hr6D7s7EMul7tW28tZGywbAS9+488Gn2syXBHQw1IR81ZCrOBukCB0YTOH52y+M+p9j8U/c+HUzNYEqVXlhDeo004jNjsjyE0ugk0icMpp5yfcDPQq6K6SfFYdg0X47WQVIgo3YOuLQDww+AiMqw8een2fE2tiiP2aF9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOrDQM21Va5m7t5KIXBOJITs3JT3sPi99WuB2dfgThg=;
 b=Lfs7xMXHwN4M7HRMI5HUrG57S0CQue4cdOd+FV9SvXZT9IarUwERu1RTEbKAXhGXzD4CR9jfshkwHonF6ak4z/poF8NjNRdm6l2zExSlxP6NgIP4imG9HzmuXjAj47AQIbHUIFK9Z052+OVYcPTpfn8vLa4kzpuS3nzn2/Yhqqk=
Received: from SJ0PR03CA0032.namprd03.prod.outlook.com (2603:10b6:a03:33e::7)
 by CH3PR12MB9341.namprd12.prod.outlook.com (2603:10b6:610:1cd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 15:35:29 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:33e:cafe::7) by SJ0PR03CA0032.outlook.office365.com
 (2603:10b6:a03:33e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.25 via Frontend Transport; Mon,
 30 Mar 2026 15:35:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 15:35:29 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 30 Mar
 2026 10:35:25 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Mar
 2026 10:35:24 -0500
Received: from hwentlanryzen (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 30 Mar 2026 10:35:24 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH v2 06/11] lib/igt_color: Add YUV pixel reading support
Date: Mon, 30 Mar 2026 11:35:13 -0400
Message-ID: <20260330153518.99898-7-harry.wentland@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330153518.99898-1-harry.wentland@amd.com>
References: <20260330153518.99898-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|CH3PR12MB9341:EE_
X-MS-Office365-Filtering-Correlation-Id: 206b7ea5-8d2c-4899-f503-08de8e71f917
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|82310400026|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: YOXGQS+3BOppi4XM9M369/54++Ao8GsUaVd937zVUu1I9wFW4G0ffSxbqnWIUPjzTHm0gp3IUYKuz2SMUQB0PrDUOOEyCVXU/Pp2rx1GRSvH2inxu3CIIcT6d5j16AA9qA9aL7xXSuE68biB+cD/GUIsR6k5SfzeVS0Tf9qQr4b6vizs4bCF5uJwRXGqPOjauDecP7hdW/kIv/YMRr/RuONUZJY+bVVH8dDNUtolSSpbb5wZtttZKowq1QqTjvu1s17F6fbA1LpE0Qd0UmIDECDziAqF3hrd1PCaTDZ4jMdwqSvGP6Gg6Q/aku44XVygum6Pnuc7MsT95QAASnAZHwNkTUt1xR/+yHFCKILKOUmbMZbMprkG8HSj45okWRI599RXKeiFJGAZ5dDKOlOGQcFo/B6tZ++s8O0JYYgask3VOVyrcfcwp2yf28hfUcbf9w61MW5xYzRJFs/qnV2glNayhivQGalrgCOzTlrlbBGDYaxGvOq6zwe1HvAMTlD4A1uo2OvYrALXPShkW6LDDxoDRPHkfji/lS90as2YmDYHD025H2KGU8tGhQG4fGocHVOKoM0upeX30tstRoPwJt5590YWfE4XfBNFQ/MPeXNtR1Kl6h9zk6Fjqau5cOKml0lXao7OInL2xrRta7yeIMQ9QgkTygdOJj5qCUin9P61KB0jFRguh1i/xhSAxHGlXZ6LKXXbLVvwN3sx8pg3Dz8TzgHRRFtFdsHnxLmOOYq1cxzZgLkLzjjiSnLAvRvQF5/htBQ94OY9GfjaHMei6w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /Sjh30nKnpYlFMsEjEIkGqaaemM8Sv5n5XyRqgsC6cp2oPouxf5Keal7KXI5JpiGbJVt2HOtGI+Gx52XgcWxcK5FjaG5iVdwYNIll9EyVwSWoH2dV+2I14jEMUIWwy/QvflMaYynWYM+PDz9FMu25JZ0GfruNNKYVVJ7lwLlwgNu1kpbYJp4Mbh/BNDgwNWBXCT5JVQx8XWjDI2yL+jExZtDOYUkSWKWbx6jvRoZBG73MyBHXJwyYYWVWjI54jyHiuefpmREqtzRXHagkRvhde9MywDXpxYXJzDjaCKw8SgwvCOBVwuwa3efbY/3rJ/futnDSf0sZZFr6e68JFfiU5JarQu16T1bAUvys+31I7Dgj6THq8a7YMhAocc+Wqryps1i4GUKnMPU3Spn9KNOLK3WSWbMEpHMokEe4P3/GH57uW/BfsxMRZf1cwiGoTFi
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 15:35:29.3632 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 206b7ea5-8d2c-4899-f503-08de8e71f917
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9341
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
2.53.0

