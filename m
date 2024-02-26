Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA2CC54E59
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 21:14:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 163D210F29C;
	Mon, 26 Feb 2024 21:14:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="W439t/6b";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4635610F29B
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 21:14:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eSKNAPAsVJrWKlgRedG1SHl+w7So/uRgpKhy3hHrkLzUJittVyduu+7wssTRszolnaxd3kypexZxHk1m1NuvreLDolUUNsDnAJEBGSJr+x/8/bYo6mlAhs3oKbj7Jy1pRHC4WqwrG2K/6+xe/1QgKkopbWeA7i2Ydx/coYHlZpsiFHpUFpZgBQaLkFFwVBBB/kNyFuVknTaX9rHhNpYfxqA2F14hWc74W5oa2ZzjayVAHyh6sElCvTI6QaTxtgP6Ewzw9zeph7rZjgZm+kO59JJyeYubTSqb0Ng7HoZ/vI8PLTRse5nbMykFrbo/EQQHdVyTijdzwKzImT7+CaRLPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xxK9HnaTOc1HYDHvcthz9+n/JqncnUCQiJEsUrp++Ok=;
 b=MGwn4r69BLxp1KFPYQACXEVzeem8RNLaIZUptKBaMyD7fIajRGRDREYhYTt7f1W43G/Tq3cGSJFHYF4y93wH+ICDn7vH4tdwMut6kKl8J33ImiCUfeOWERTJnZcCzNGz2aJ+7DeFZJIfa+3gkiihrBPims2CNRJe0rbYSBv9TPm7m1kjyvW8IDkQwwLIT+DqlNE9WMTfpHbnqkJj/JXZs+U3UW55v9R3StWhcK9ZmVVq0Iha7YfOqKuR1MYc6IxGfoUaN6TBb0mZYcL5kgdEiY8CEa0rjQqDWiAfA5k5n/pzr9iGdM04JWwwKAPtwtiIKDJYteBr72o1lw6jMTdj8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xxK9HnaTOc1HYDHvcthz9+n/JqncnUCQiJEsUrp++Ok=;
 b=W439t/6b+fRbWVY3BoyFSpEUuTmxgFIgV0IsyKoImzv2ns7J9ix45CmtSHJVTSJhSpUoeLpIvsDtrPfZLbCSJp/jB3AOmJ7yY3AdS8cPPQiQthRK8XW035tK/03J54VXbYs17ESQ5guS8cvZQuGlkkiioUcVYhk0mHL9pr27PSI=
Received: from MN2PR15CA0009.namprd15.prod.outlook.com (2603:10b6:208:1b4::22)
 by SJ0PR12MB6829.namprd12.prod.outlook.com (2603:10b6:a03:47b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Mon, 26 Feb
 2024 21:14:41 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:1b4:cafe::1d) by MN2PR15CA0009.outlook.office365.com
 (2603:10b6:208:1b4::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:14:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:14:41 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:14:40 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:14:40 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:14:39 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH v5 22/32] lib/igt_color: Support color transform for
 XRGB2101010
Date: Mon, 26 Feb 2024 16:14:06 -0500
Message-ID: <20240226211416.100660-23-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211416.100660-1-harry.wentland@amd.com>
References: <20240226211416.100660-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|SJ0PR12MB6829:EE_
X-MS-Office365-Filtering-Correlation-Id: c46449f0-e25b-49bd-6dc4-08dc370ff2ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vcIWvm8xn/TENtEQ+8djZddOcIeyurmiSAxvx8ZktilxaCfDXR6xsHVjiD3BhUoazWV2TthzTjkjIc+FgnEUrQFC83YEcubzsFeY0rMfGzFcoTntS0rDSM2XXYUa5cD5YXpivW0oXtze+gJ0UEYg/jtjhfzMNrUObSBVGIYf5yQtPFmKLHpMV63YGyb5QW+h6AO0vPtDACP9/S0KUCrISmQ1yaJLqizOJfXlyYRZX75zZxtQvoLk/kEqhbtgJa6Ox0jSbRNJ8Vl2e34DQQR+lflB0v66WJS3u/OP0FqbFqPrDaeQpaVdmb6hDgbn3d6bxIC7xOhcGM7DTB+8pmk9u/Wl199u7BU+DR4H6p9nXFAlzljhYP01HRDirBEWgnGMeCLlvQkob0IrDXi6kEheNHuCnY7+LY2dkZYgpafnEFHnxTHAt+7cajsAQqGRLDxQW+GKmVM5bdcTMFZQE9hotYI5OgnHm2SGs6rcGbj/pwgJn9JQ1IOpt0iztdKfk9S2mR8xvjXhrAgFQmvpwcFTQ5DVhRaCVbqYlW5BDho98Q0dk1AX80I9qqdicrDq8SOpJ+9AAa0IDk31zURWLIfFWOJAEpMdhLMN7QfgyEYExGrX8iOHVtVvBSGGL0XsfPmohLeAECFPI7tasbtNeCvE8Yol5BZUZKxKEdHb/Vdms7MQjbXYX7rvsHG9uFefn93OnKD2SyVvMTKAiW0dwM2Ucx1iz5gI2jz1FiHVC7GHmrZjLuI7RgyKPkcH2N/Z3FEg
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:14:41.5640 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c46449f0-e25b-49bd-6dc4-08dc370ff2ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6829
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

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_color.c | 113 ++++++++++++++++++++++++++++++------------------
 1 file changed, 70 insertions(+), 43 deletions(-)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index 5e1374e4b792..43179a17e41b 100644
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
-- 
2.44.0

