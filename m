Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3911ECD98F2
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 18:03:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D92C710EC3D;
	Tue, 23 Jun 2026 18:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0VUKI8M6";
	dkim-atps=neutral
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013017.outbound.protection.outlook.com
 [40.107.201.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067EC10EC3A
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2026 17:58:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rtELa6DpltrbDdIQVdi/k9gswsJ9kJqHhQU9CSqshUpf/26Hfw15nqT29jMzXrS+/fInEt0OKh7zFshDXZ3zMXY6HVtvjM4A74vnG+0xC/OfovdWMHiuLYUelnhBGmx4gnroy81UHRcC052cpIJxY8zJXHqh2fmWq/1f4qn1vO+z8/p397h4rVnbQr818HlwkL1WvKA2Z+fX07lEUlzDc+KPHdojcw+1VL1MtN9ZgHGiTq1MsGBp4BLGx6HPlvbFNGmZ2ETNfeyDi1/qlYFxNlAGUa3s8KT6tGXD54VOD8DGQCxC121NXZlSB99hXJOYw5dqjtI4Wfzn3MOVAyuWeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9j6MJqCL6Bke1ovR4s82yc9f518GqoymitlMdxyMABI=;
 b=fLNGUdEDYsNJizzcDquzjWvs5QoWwV5XXw++rgxooGrufNE0um/ITW5e28Q2u8JCGBD95Y1U9YfHL147OXTeplUM1pmZriJljSAXz6CB49zBxMtQARdJDwT6EoSAIhD/ip0neN0/IrRRhfr1PPlDkD89NE3HPn1sGGu1vVAnHIiIlGgxonrOe2ujLt9Wdi1p3yrUPzNx/yUQUSeoFxfa0AsJ3G+CrBwVe4/MvYkKn8WaozBJmUypRQSIhjZfrn7lf+UNRaT4q4foSQ1qX5hQLlvLW3wlTeW8EfymgBY0GhpqhK2SR6zWPv+FEFTLA6qkEPUS50mzm2s8LKvKKk9esQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9j6MJqCL6Bke1ovR4s82yc9f518GqoymitlMdxyMABI=;
 b=0VUKI8M62EqfxD5V/HuglMzB7LTkdXaYNBuNga8a8ooZrgsEpqOUbc4wZQUUJC0ZwjDOjVsEthZhA+GFy2VCLuIEryiWtDGdyF8b8GwfsCCdZToShgBWWUtDAFMl1Wh2keITqlMVI8qAJ0F4l7vWYoIvmnhh752xwLHw7brR8Do=
Received: from PH8P221CA0052.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::16)
 by BL3PR12MB6427.namprd12.prod.outlook.com (2603:10b6:208:3b6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Tue, 23 Jun
 2026 17:57:56 +0000
Received: from CY4PEPF0000EDD2.namprd03.prod.outlook.com
 (2603:10b6:510:346:cafe::24) by PH8P221CA0052.outlook.office365.com
 (2603:10b6:510:346::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.13 via Frontend Transport; Tue,
 23 Jun 2026 17:57:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD2.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Tue, 23 Jun 2026 17:57:56 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 23 Jun
 2026 12:57:49 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 23 Jun
 2026 12:57:49 -0500
Received: from hwentlanryzen (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 23 Jun 2026 12:57:48 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v3 07/12] lib/igt_color: Add YUV pixel reading support
Date: Tue, 23 Jun 2026 13:57:32 -0400
Message-ID: <20260623175737.171142-8-harry.wentland@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623175737.171142-1-harry.wentland@amd.com>
References: <20260623175737.171142-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD2:EE_|BL3PR12MB6427:EE_
X-MS-Office365-Filtering-Correlation-Id: 00041441-407e-4270-1a1f-08ded150f494
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|6133799003|18002099003|22082099003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: NHt/5L5n9Ur4NywExG+jQ23bEEUqK7wJ/uM8puxx0T9lq4CmuN5mU05jVWP3OIF2xa1LqO/oDgmpT++LVHzbJKoPO/31duNRcspa4xXHvFR+sCakyNCXyOt81Cb/leQHFZnQEvs1WhE8qSu/LmWdjqgptYzGfa7TWFjJkAF+myuq+VugMCzjLk3GQ+pdNTDUe+BHCwFFFBByMG6040q6HlwcF1isq4VTE2T85+pm89/1etr3imcAzXklA3RBpjHX5XbsAxg9anbC2dEur9594LnLHtjPN8TOdPNMjboJKVOzv6f2AMjc9T4G8TV+3bv0ps2LVJwkl6IrY370cJ1qhvPdQhqb9fkVumhdYsmsMUGusSc12o9/7gdwlFOW+K473s6WMFxTV386v/BIjrxqC56x/NLmBLD4DBpA/754fCvvIqe0ZaZd7TEcgim3ju23O2SkVlGcmSO85xLWrEOFCqJMnVG5F0gmaL1XymQXpY5MasEmC9Qlyuvp+vgKL0jYt6fGaX9hnT/5SamAepJU+bTe6LFoQ5gxyu6/GryYxMSHZKXdCJiakPLbOb7vR9DNKuEXf7IrH22CiQmNXw4puBKqpyy7lX6gZmUmsZ12+3CzJJ+/y92EchsEpdZVyMx+cxgtaSKVr4Z+bVxLVaMSjwEwVA2X4FziVAi/P10BJ43VixN8sdcsc8gvtQgjzzA5lyE1WWJHHRBy0iuAge8DVg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +BZCDWn4ln0nnufZm87EnieMAfwU/CeCyj9+TEm2DmUE7IlzrykHXYUKDFAVDWY3IGD4RBSogznRBq8QXszK4e1ZUAAgPnZ01tNoGvXpu8rKDiPqY5eMSg/zj44dH1SVSLWdcwSgu3uXdDTUz1tuHkpDXu9R9nbUltXtluM50bVrKFjd8lFCkSqNOBclD5cRwoUk4tEmvfmuqcWGovm2COHE/fJbuvoddnkCMRRQAZ81uBBfKmor0c1XCt3aLaAf5eejOO2pnVl2uhM91buxlXOcQpimEfUK/JPVhEb8RNYUIuwz3j4liY+ovFnlV7vejfjjMSWLJnVgU1nZEBSJaII5eZD4CpiD39Gv7/ODTgZ+SfjWxbnKUNkUOXBaqSTYkVyPmJUYp6EJUwNVer2EmKV0wR4OWH3PTh1UscBMeSS2/sIBHVv8uIlMPk8rM06D
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 17:57:56.3256 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00041441-407e-4270-1a1f-08ded150f494
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6427
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
2.54.0

