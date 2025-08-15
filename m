Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF99CA0EE0
	for <igt-dev@archiver.kernel.org>; Fri, 15 Aug 2025 04:10:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D24BB10E9F3;
	Fri, 15 Aug 2025 04:10:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vnYDK9Vz";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BBDB10E9F3
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Aug 2025 04:10:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ONn7rimM/DwrE89ATMN6f5voHpiOl6TmKoWT9tcAPPBpkeCdXCF0psp6gO1++Cm5Af86QOyTRI0W9xpdJLy3YoQEaZbZGGC4ys2nTOdBFAx/8bj3QasNqYSqvJUTZUdMoXu0cAVT4YoPJNLjVGLwHgWAZWOQlrl904G5oxnJ2Sd5t2sgaus0a5mfFKs8PBOpSJCPxu6wNNYDoVYd3kG+USd7INZDe3WvwFFl+e2A7Zu1NkEl9TywNVIL7cHloP90aaWMx3TC2rCkgdvBASQTFmDtZkmK5FQAk+XGf5P39mkdOmeB84nvUcJYmyzgB5P/utymfrhxyfTXkQtO/acLrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6zTqkuZ3Z9/B2qmgRqQOFm0C5DXaZZhvHuvb2xUusew=;
 b=yegb/dXR9crxSYoyrOZshud2NwpdUf7OtAkbeYMnOO/98tpLtqkCxpqK07J5TGsjSwatxrAuhRdeCcfqQ5LNhs+yVATaf8XlmSao9z+ZOdDXJtn1khOaOc0tFoZiCotE/zS33/HyGq7H7907Qlzsqv3/6oSyaF50mVO6UdS49NN+3V2ZSMVGxaT/PfoCYwFRs1kXydIevyMKLeF6md31e2eHnR1euX1UH4dawTvj5uHsR2dgC8JcM7M/spwxqMzG42SZQiddvcP6xmlKam8JCs9SAlAEntET9PIkL5NoEXE8I9mfd7rABmxHYH8qAFYF8b8jjvG1LE5uE5C8D7M3CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6zTqkuZ3Z9/B2qmgRqQOFm0C5DXaZZhvHuvb2xUusew=;
 b=vnYDK9Vzs6e72ARoYQB6P/pKmg1TmYa19RQXY7LVYIN+9G6QkcKyzRxs+QoNpYFi8Bb9tcg9DZNnPZrMyQNGBPLV1zs9Sptm9VhhYjnv1d0C00EXfXJXTI9XNtt/D20WC7qt5YNfGcX01j+oFkHQQVj48vtrU+0va1ChTI69jCE=
Received: from BYAPR21CA0005.namprd21.prod.outlook.com (2603:10b6:a03:114::15)
 by BY5PR12MB4163.namprd12.prod.outlook.com (2603:10b6:a03:202::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Fri, 15 Aug
 2025 04:10:39 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:a03:114:cafe::5f) by BYAPR21CA0005.outlook.office365.com
 (2603:10b6:a03:114::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.8 via Frontend Transport; Fri,
 15 Aug 2025 04:10:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 04:10:39 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:10:38 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V10 17/30] lib/igt_color: Support color transform for
 XRGB2101010
Date: Thu, 14 Aug 2025 22:06:46 -0600
Message-ID: <20250815040659.3321102-18-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815040659.3321102-1-alex.hung@amd.com>
References: <20250815040659.3321102-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|BY5PR12MB4163:EE_
X-MS-Office365-Filtering-Correlation-Id: 4609a7c8-4bd9-408c-f06c-08dddbb1b205
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7p1kKpzK4IIMxJiAFU6ptarKSeDzwF/a6oo+5DXH9he7e1bij596K8syQHnZ?=
 =?us-ascii?Q?JZKHqFo2FvIffjqxxOgH+BR9YDjWYRcQg1TSS11fZFaU146NAkrlSRv2rdgy?=
 =?us-ascii?Q?aNWB12J6mCm3HHwYfy643bKThaPf8FscCA0pEq4EwOdY7NE3xO8z2sJgDTUK?=
 =?us-ascii?Q?5rc+OWmyeCFC30FgTrHh4Dq+SVA6oZluLL80L4tWL7HyeomDoT5xT045SLF+?=
 =?us-ascii?Q?K/lwlAW1dAy676U94GYfZKj4oIzQUtgglrYNS6sLEQtg3zgBwBqSbTgAvrlT?=
 =?us-ascii?Q?9i48zpEGxU3NMNfqRf6Yxbt9TAKF3aQIYB06prdIiM1vlvBrJ4zR00EFXW7Y?=
 =?us-ascii?Q?sif0dQEphoV2fLDR1j+4ivHhsmljB28tepeP/YQGuVr5dYBVMWaXt8U6y+cX?=
 =?us-ascii?Q?nnFppF2142h9MBONLDyPKLiXXLYKpbQ2EffH4XLup7H7UV2AF2bqYVgFJg13?=
 =?us-ascii?Q?Op5kyjl8DPDzo+dxjRY5suauFKDFbnKklcEbT3TgCEICshM7wxpb2DtkhuwW?=
 =?us-ascii?Q?mggys2wqQKoezWhMofGwmTOJoNqJwwt4QfjYyzz55hveR6ATQW1E3WnCQI1t?=
 =?us-ascii?Q?hlPTQAst79Ksokp+0GssHD50fLkXY16E0ozwu89NjSPthiBDRBWvsvlH1pHA?=
 =?us-ascii?Q?tj1DypBDTkjpOMun3rdaWoNSG73iArTeu3Gxr+2SpUebXtaqeUbDxloYRuGc?=
 =?us-ascii?Q?5xe2HkxUV07qCTkZ776T8ZarrMRBWIv1FSbCYhlp/nNWlJ5I4hD8Pv+8Dhf/?=
 =?us-ascii?Q?LiJl6OTD1aN4ManahK2LUSvIExLoEMrFaw47gLgNW8v10ai27PLIIEIAUxE6?=
 =?us-ascii?Q?6xUyyKuUvwJWm1QwqGuYgM11o9IyKziDnNw/+vL9zyD0bSJFFVejg2OB7qFn?=
 =?us-ascii?Q?5gmlC5tQs4/JIGGgAzJW9yJvBp46SVySMsE47IdG04XTo2bczbiGH1cQd99Z?=
 =?us-ascii?Q?NrgJp7uF7e/MuQqICrpTPfiOLxTXbXtnzaucJloCPzuaJEnHNGZ8YloUdSOm?=
 =?us-ascii?Q?WbLpeGwxRIz+AzcX1p+GlOheoxWByFsM3LmJjCIgDd8YrDFxjs9P65iPlDs1?=
 =?us-ascii?Q?A96YhJ2H5TPi3mJVojErRkGiJ6C7SnT88GClaXCgnDscSDdy6d7ehRIOXih9?=
 =?us-ascii?Q?I4olApIcG9L87tQywWIvsCeDW5zQoKDlWkGSs4hqW+AWR4hoBMFyQTuBwNYL?=
 =?us-ascii?Q?Fy2fIdrciTDv3AwkfWe1naruXU0CTYef5+W1nJCGbz4COZIPLRbVar4Lm0b3?=
 =?us-ascii?Q?sPceMXZFqmZVcYeJR+b2o6Del7aFqtHcKU991fo8Oe7vkOb3xL1x5zrfGxsp?=
 =?us-ascii?Q?yv3s79LjDn+NnpLF/NyOObA6GpDdpY5imXYwAt4JnLgxYE4sokPaDr5Y9D6R?=
 =?us-ascii?Q?AtNbzsjbwV4cNFF4dys0VDSROuBtUn5fJ2m4ShYgf880qYoqPb5ML/ElUQkt?=
 =?us-ascii?Q?MS2Zsc0XyhCG+RGL6SRg/CTkF4H4/WwEWrpu0GXcrecvcmQsfODK81191l+K?=
 =?us-ascii?Q?lZ6AppCZlTyyAq8ufLluIM3tpbm5Avx3xNvD?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:10:39.7472 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4609a7c8-4bd9-408c-f06c-08dddbb1b205
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4163
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

Support color format XRGB2101010.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_color.c     | 113 +++++++++++++++++++++++++++-----------------
 tests/kms_colorop.c |   3 ++
 2 files changed, 73 insertions(+), 43 deletions(-)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index bc90fbdca..adf08fa2a 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -132,6 +132,74 @@ void igt_color_ctm_3x4_bt709_dec(igt_pixel_t *pixel)
 	igt_color_apply_3x4_ctm(pixel, &igt_matrix_3x4_bt709_dec);
 }
 
+static void
+igt_color_fourcc_to_pixel(uint32_t raw_pixel, uint32_t drm_format, igt_pixel_t *pixel)
+{
+	if (drm_format == DRM_FORMAT_XRGB8888) {
+		raw_pixel &= 0x00ffffff;
+
+		pixel->r = (raw_pixel & 0x00ff0000) >> 16;
+		pixel->g = (raw_pixel & 0x0000ff00) >> 8;
+		pixel->b = (raw_pixel & 0x000000ff);
+
+		/* normalize for 8-bit */
+		pixel->r /= (0xff);
+		pixel->g /= (0xff);
+		pixel->b /= (0xff);
+	} else if (drm_format == DRM_FORMAT_XRGB2101010) {
+		raw_pixel &= 0x3fffffff;
+
+		pixel->r = (raw_pixel & 0x3ff00000) >> 20;
+		pixel->g = (raw_pixel & 0x000ffc00) >> 10;
+		pixel->b = (raw_pixel & 0x000003ff);
+
+		/* normalize for 10-bit */
+		pixel->r /= (0x3ff);
+		pixel->g /= (0x3ff);
+		pixel->b /= (0x3ff);
+	} else {
+		igt_skip("pixel format support not implemented");
+	}
+}
+
+static uint32_t
+igt_color_pixel_to_fourc(uint32_t drm_format, igt_pixel_t *pixel)
+{
+	uint32_t raw_pixel;
+
+	/* clip */
+	pixel->r = fmax(fmin(pixel->r, 1.0), 0.0);
+	pixel->g = fmax(fmin(pixel->g, 1.0), 0.0);
+	pixel->b = fmax(fmin(pixel->b, 1.0), 0.0);
+
+	if (drm_format == DRM_FORMAT_XRGB8888) {
+		/* de-normalize back to 8-bit */
+		pixel->r *= (0xff);
+		pixel->g *= (0xff);
+		pixel->b *= (0xff);
+
+		/* re-pack pixel into FB*/
+		raw_pixel = 0x0;
+		raw_pixel |= ((uint8_t)(lround(pixel->r) & 0xff)) << 16;
+		raw_pixel |= ((uint8_t)(lround(pixel->g) & 0xff)) << 8;
+		raw_pixel |= ((uint8_t)(lround(pixel->b) & 0xff));
+	} else if (drm_format == DRM_FORMAT_XRGB2101010) {
+		/* de-normalize back to 10-bit */
+		pixel->r *= (0x3ff);
+		pixel->g *= (0x3ff);
+		pixel->b *= (0x3ff);
+
+		/* re-pack pixel into FB*/
+		raw_pixel = 0x0;
+		raw_pixel |= (lround(pixel->r) & 0x3ff) << 20;
+		raw_pixel |= (lround(pixel->g) & 0x3ff) << 10;
+		raw_pixel |= (lround(pixel->b) & 0x3ff);
+	} else {
+		igt_skip("pixel format support not implemented");
+	}
+
+	return raw_pixel;
+}
 
 int igt_color_transform_pixels(igt_fb_t *fb, igt_pixel_transform transforms[], int num_transforms)
 {
@@ -144,10 +212,6 @@ int igt_color_transform_pixels(igt_fb_t *fb, igt_pixel_transform transforms[], i
 	if (fb->num_planes != 1)
 		return -EINVAL;
 
-	/* TODO expand for other formats */
-	if (fb->drm_format != DRM_FORMAT_XRGB8888)
-		return -EINVAL;
-
 	ptr = igt_fb_map_buffer(fb->fd, fb);
 	igt_assert(ptr);
 	map = ptr;
@@ -173,51 +237,14 @@ int igt_color_transform_pixels(igt_fb_t *fb, igt_pixel_transform transforms[], i
 			igt_pixel_t pixel;
 			int i;
 
-			raw_pixel &= 0x00ffffff;
-
-			/*
-			 * unpack pixel into igt_pixel_t
-			 *
-			 * only for XRGB8888 for now
-			 *
-			 * TODO add "generic" mechanism for unpacking
-			 * other FB formats
-			 */
-			pixel.r = (raw_pixel & 0x00ff0000) >> 16;
-			pixel.g = (raw_pixel & 0x0000ff00) >> 8;
-			pixel.b = (raw_pixel & 0x000000ff);
-
-			/* normalize for 8-bit */
-			pixel.r /= (0xff);
-			pixel.g /= (0xff);
-			pixel.b /= (0xff);
-
-			/* TODO use read_rgb from igt_fb? */
+			igt_color_fourcc_to_pixel(raw_pixel, fb->drm_format, &pixel);
 
 			/* run transform on pixel */
-
 			for (i = 0; i < num_transforms; i++)
 				transforms[i](&pixel);
 
-			/* clip */
-			pixel.r = fmax(fmin(pixel.r, 1.0), 0.0);
-			pixel.g = fmax(fmin(pixel.g, 1.0), 0.0);
-			pixel.b = fmax(fmin(pixel.b, 1.0), 0.0);
-
-			/* de-normalize back to 8-bit */
-			pixel.r *= (0xff);
-			pixel.g *= (0xff);
-			pixel.b *= (0xff);
-
-			/* re-pack pixel into FB*/
-			raw_pixel = 0x0;
-			raw_pixel |= ((uint8_t)(lround(pixel.r) & 0xff)) << 16;
-			raw_pixel |= ((uint8_t)(lround(pixel.g) & 0xff)) << 8;
-			raw_pixel |= ((uint8_t)(lround(pixel.b) & 0xff));
-			/* TODO use write_rgb from igt_fb? */
-
 			/* write back to line */
-			line[x] = cpu_to_le32(raw_pixel);
+			line[x] = cpu_to_le32(igt_color_pixel_to_fourc(fb->drm_format, &pixel));
 		}
 
 		/* copy line back to fb buffer */
diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 7ac74c536..1528da2f1 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -355,6 +355,9 @@ static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
 	if (is_vkms_device(in->fd))
 		return igt_cmp_fb_pixels(in, out, 1, 1);
 
+	if (is_amdgpu_device(in->fd))
+		return igt_cmp_fb_pixels(in, out, 13, 13);
+
 	/*
 	 * By default we'll look for a [0, 0] bracket. We can then
 	 * define it for each driver that implements support for this
-- 
2.43.0

