Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E0FC369DC
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 01:39:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8959D10E6A2;
	Wed, 30 Apr 2025 01:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="V36MLx7y";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF5510E6A2
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 01:39:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KrSca9tZrJgs1z6izbZ+2SR4vfgTQbDd2QxLqURQ719xYlLWf6G3wc0+4PkcPlF7myErndW3woNrS5qaYHrUvj+u6gaGFyYrQSIgiKz/1mtIF8yUcV1Bl4EU1gtRui2K9vaJ6Cpt48R2aBMu0seIbLZzIXLCYCAE9mBKYkcj2xCGarSvROaMBv274yJtG4ZpkWCiSiyFenJX2Co2JKMuoQJYKYeGLjTU2mlY1ALDT/ONG0phM9A84ojes1l5sVkTGNK/CyAjlfzxG44kjWHMbkGzkW638Zrjcj8BQHxYlpqOMzbPjZG4T/vMmG5GuP4UPaoxrEZHNvy9LJI798tF+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r2VSHZ3NnVFw7aJlPhzg1iENTWlGlzgGhTMjQx7vs0I=;
 b=Gqmtq1AQDV0rl3Tt5/kzMNtlwLkEEbjVRaD8DVYciIiYuXi7IR89NSwBE9G+un01N++fxgSR0O2Lpx8jc39AemSYBU7we/vjz1VVc0Ngmqq3lWO6eUt0t6+bob+VxHWo3IjiqWxOoKLMD1YUrYlgPzE1Ft2V33nVh8JHnwBM95f6zfyK4MSnS+jtoo+9Ve1Yjyyl604ZGeb3BsNyjAGHgMxiDnHFK9W5WLHdsQds1ON/5XW3qI4uArMBJ2BDzKbDXl5lNl3Evjb93pOvFCTO73Kn6Vs3ETsEOX1Ue/SAz40LjKvciYuL4iPu454rd+2+gPnBmwEtRoO6ZsPGP7an4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2VSHZ3NnVFw7aJlPhzg1iENTWlGlzgGhTMjQx7vs0I=;
 b=V36MLx7ypLpR6GH0pKQ7SGbH3B+ZIAXa9tlFDd4n4LVBCb3gWfjMbvLGBSdnrriCyhQKHvyVSWF7ssj4YL6RgH4iVCL29nI81mwW26HJCgL0Ke2QtsgKS9mzTZOJqq2zgPznbPPeFFPmF5KqRhxuLcuehQhi5jDXSD70kP2RVgE=
Received: from BY5PR04CA0020.namprd04.prod.outlook.com (2603:10b6:a03:1d0::30)
 by BL1PR12MB5972.namprd12.prod.outlook.com (2603:10b6:208:39b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 01:39:37 +0000
Received: from BY1PEPF0001AE16.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::35) by BY5PR04CA0020.outlook.office365.com
 (2603:10b6:a03:1d0::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.40 via Frontend Transport; Wed,
 30 Apr 2025 01:39:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE16.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:39:37 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:39:35 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V8 21/36] lib/igt_color: Support color transform for
 XRGB2101010
Date: Tue, 29 Apr 2025 19:34:39 -0600
Message-ID: <20250430013454.226910-22-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE16:EE_|BL1PR12MB5972:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c95c9f8-66db-4802-d71d-08dd8787de13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?a2MKnAzrHbqPq4KZPk9/diSyvMPmG2E6u/L+aiba4sqJVdmz7rMoLc3zQRH9?=
 =?us-ascii?Q?r44YCNbF/47ZSvLpq1jbt7W7H5RJro9w6vZILkxB8MmsmSQlfnBNUjOQF+ca?=
 =?us-ascii?Q?geXYYxHLpBjWLxype7MJabeQepAcletQOO85tTxLPrmx+fvi9p9cnvcSRBDI?=
 =?us-ascii?Q?g/MKwWsnpQMF/gNUVOqq11BqYdM5vmeKuAyqgUW7mhw6YrQXIdyyaVv4iTp7?=
 =?us-ascii?Q?5442IRq1CwtOkt95Y4QwSpgOWdajYaXSzq6XKXUwHgjeLaRZi00DMqNGy0s8?=
 =?us-ascii?Q?mj+SCYQpgI7PyFcXxZ+4ECElLPZdrlhSPhy+MgPvEvIxYyEjfR4gKZJrcHCc?=
 =?us-ascii?Q?syfbxnewFsznw1d9gxCt7GFbw0MlVyXA4cMO3XLGm1ecndsZh8PSRM5rt9dU?=
 =?us-ascii?Q?YJfHSCn6Spe/jGmtxFd8W3U0sC0WXJzeQehbkbjU19tDcpyUahr7aBnCE8Tw?=
 =?us-ascii?Q?viylwprTbisJJSmUKfT26F3yXArMFoKTiJDIBBd6umy37aU+TYF0p9Z8pQ99?=
 =?us-ascii?Q?rg9xkMqfkApBDhlpGpooDk9+/AODtvyH0jdoXpzuUILE+1WWj8/M+AnnEpaE?=
 =?us-ascii?Q?vn+/EazGjwTlQmnadJinfohwqW9I6vy1MdDOCpPUw2kl9RFm+55/3yxEQ2xs?=
 =?us-ascii?Q?qnmYnjtJpVQ6OZb2SfJJPiCMwtca+BS0lIXOewztf52szLqPubHo9ElfK0OY?=
 =?us-ascii?Q?WJcLRPHRQyaODgIX3wXrd2wvhbxGcZxhaDMfgUtavF1r8Yq89raypKNGhjEH?=
 =?us-ascii?Q?5Ip5N/tqjPeDN0d4yGd0vIv/WwpuDaSkz29re33JftauZAL6lcwMKIJfD1Qs?=
 =?us-ascii?Q?fFJwYUHCb9PhDd7sF2ueu4m2sg8y9CT/2qy2/L6JZpd1k98XJ3dXKWSsnSq1?=
 =?us-ascii?Q?en9Z07tMdjTDmUqmttE9Rvc9zvBMui52I8dbdV8+25pbqulrQL3KJT3CzLyb?=
 =?us-ascii?Q?657USCFT6eda8aYSO75HDnHugR12BW7vNAt3a/2xaPhbhBcC9m37AVPeZpRy?=
 =?us-ascii?Q?1sMlk0msUygS/pQmapo0Uj7pgqA5HiOdq6lHJfrFPLn8p+q7rly77qAhpgzr?=
 =?us-ascii?Q?cicD99AkbSxwp/pS2pamlyMebI9tMb/pydBd6NYCCQ/DAqKQBjj5n02su4vO?=
 =?us-ascii?Q?zwDIklpa3r1ddVmqikKBIqnbb/555YTC2DOXC6paOl8h5B3J+LSHu6yfpC+8?=
 =?us-ascii?Q?mHzuav3EKll7JL9i80xUspr1MlcQY9IzP2VE+8AbL5Z25MlHaWMNM95xzEtp?=
 =?us-ascii?Q?7dRTr1Zx+pRQ3iD62HMvlJuKx3srIr/nyOP9kfe2u+iIr01cha2ciaee6eyG?=
 =?us-ascii?Q?DRptBOgXvrZQgPNdTkZKgk8+KDdS04v47PXrwIqC3j+U/vq4xu6bG+k4n2X7?=
 =?us-ascii?Q?gAErtNcA3cmlB3tGKeDRbwmxBSc/lkT6LyAhSk2mjMVBMyDbfgHMOLOJywAR?=
 =?us-ascii?Q?LuUcldf7vJk4KTimwQD8h6+lrMyu//rWtP+1K0xgVnLGn+/0fVOZqKhjxRVB?=
 =?us-ascii?Q?2jYA+Z37v9cu6z+RDW2tzN/NmdIRihVSo/J2?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:39:37.1239 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c95c9f8-66db-4802-d71d-08dd8787de13
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE16.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5972
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

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_color.c     | 113 +++++++++++++++++++++++++++-----------------
 tests/kms_colorop.c |   3 ++
 2 files changed, 73 insertions(+), 43 deletions(-)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index 5e1374e4b..43179a17e 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -126,6 +126,74 @@ void igt_color_ctm_3x4_bt709_dec(igt_pixel_t *pixel)
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
+		raw_pixel |= ((uint8_t) (lround(pixel->r) & 0xff)) << 16;
+		raw_pixel |= ((uint8_t) (lround(pixel->g) & 0xff)) << 8;
+		raw_pixel |= ((uint8_t) (lround(pixel->b) & 0xff));
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
@@ -138,10 +206,6 @@ int igt_color_transform_pixels(igt_fb_t *fb, igt_pixel_transform transforms[], i
 	if (fb->num_planes != 1)
 		return -EINVAL;
 
-	/* TODO expand for other formats */
-	if (fb->drm_format != DRM_FORMAT_XRGB8888)
-		return -EINVAL;
-
 	ptr = igt_fb_map_buffer(fb->fd, fb);
 	igt_assert(ptr);
 	map = ptr;
@@ -167,51 +231,14 @@ int igt_color_transform_pixels(igt_fb_t *fb, igt_pixel_transform transforms[], i
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
-			raw_pixel |= ((uint8_t) (lround(pixel.r) & 0xff)) << 16;
-			raw_pixel |= ((uint8_t) (lround(pixel.g) & 0xff)) << 8;
-			raw_pixel |= ((uint8_t) (lround(pixel.b) & 0xff));
-			/* TODO use write_rgb from igt_fb? */
-
 			/* write back to line */
-			line[x] = cpu_to_le32(raw_pixel);
+			line[x] = cpu_to_le32(igt_color_pixel_to_fourc(fb->drm_format, &pixel));
 		}
 
 		/* copy line back to fb buffer */
diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index b7d112082..8132f8f99 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -354,6 +354,9 @@ static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
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

