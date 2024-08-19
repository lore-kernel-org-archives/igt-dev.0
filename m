Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03985C5321D
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:59:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E3C10E3EE;
	Mon, 19 Aug 2024 20:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Obtbck6u";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31FD010E3EE
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:58:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jxumv0XXkgy37k19nS7NgTUUF0fg3+Xu7R6HL2SD7UuBvHv/FhfwxQQHebL3bV2XA1CrC4+g0zPA/luQkfmN4AJAf/Smr0dL2wl6aGchKaftDnVZn9G1bxtAymlGYsy84sAyhc7o9S1efr/lTHjFusWYmtDV6VOdfZGVzY6OyG8ZR8CiS92OUE5LX/K+o0nmdiGOMf2OHKGyTkOvnVsYxCxV4jR/bBog4TKuS642qv5sIng+tW0DgEw6M2N36ygAYgO8VQ/ExOb2l1b637ZnVp9M2N8H7OGE5zRPrDgPa0eUBFZ1NO6obJvbupalBgcrXgMhTsxczcEapV6s20akvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4cRi9MBmiOuHw00t52SzyJ6WKao4yxyd5b7wI/vs2o=;
 b=cJKdXU6dLsJhNoe/1FG7RqNXXcCmvv8Y0bhGdukKiCLhhsu7MfVWhUFRwXcHAimtmuCKcmhF1e/VEGe2aq1m8BuWPuKt8p644oaJKeUu18bG5ujeNBi1sX0Rt0diXFN812x1XLt/FmSB8NRAaQxDjWgAlndJe3cnB3thBl7s2LeJpanC8TrFcWHS+fTrQiBOKd3OJWfDyeTOmdIuggGmqafauiY2kZiP/xHwIbbnys22jM0/4bEWUbv12DvLw9230vmUQFweFNXUi5s9XWPiDsQUI+l002wMYYKXMyfDL1dtPdQzp9PM0NO408bVbVhR54/ZBaecjod90pChdm1L+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c4cRi9MBmiOuHw00t52SzyJ6WKao4yxyd5b7wI/vs2o=;
 b=Obtbck6uuPDDAeM29k9BVyW9F0gQdMNv+zTFt1WZzQE4fWTvKfqqGtcB6fJf3QgNoVwxVM0oU6nYdTnXm/cbRbck95W3JC8iD1PfYLOHczRFsCgUGFqlWab+3ks4LqPMxbKyUl0XX+sM+rafOvqD/3Jabgy6dlf2np7hE4/afZM=
Received: from BN9P222CA0005.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::10)
 by PH0PR12MB8774.namprd12.prod.outlook.com (2603:10b6:510:28e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:58:38 +0000
Received: from BN1PEPF00005FFD.namprd05.prod.outlook.com
 (2603:10b6:408:10c:cafe::c6) by BN9P222CA0005.outlook.office365.com
 (2603:10b6:408:10c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20 via Frontend
 Transport; Mon, 19 Aug 2024 20:58:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFD.mail.protection.outlook.com (10.167.243.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:58:37 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:36 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:58:36 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v5 22/37] lib/igt_color: Support color transform for
 XRGB2101010
Date: Mon, 19 Aug 2024 16:58:08 -0400
Message-ID: <20240819205823.316656-23-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205823.316656-1-harry.wentland@amd.com>
References: <20240819205823.316656-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFD:EE_|PH0PR12MB8774:EE_
X-MS-Office365-Filtering-Correlation-Id: 14cf19f6-5ef0-49f2-7e00-08dcc091b276
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?71TXetk5qE9Ugl20LzADLKum5KlJbUg/QHu5ZO0aM/VWX3Hy1i1BRmxBvM+g?=
 =?us-ascii?Q?khz2ld61L7yuXO4i5raJN2znnz6E7G+JuAy8YyIsP/oaU56CAlEtBoYIonBv?=
 =?us-ascii?Q?XdkE6biNM2Qu40gMvuxrBwpHwZw0HVCEeHLe0YDfMHBAYPu+UX9OUhCO7xWz?=
 =?us-ascii?Q?HPJrPaNIQ6aUqjZVLBy0OgyasgjMqRfdiC9IFYyHwFQx7vkn7BEVl35AHy60?=
 =?us-ascii?Q?ZWAKs353/QJzEwlXZXnJrpAbaHwl0aYqWc6pZpTz4MdRKiP4SAWfzKpYb6Qa?=
 =?us-ascii?Q?4T6gpfxa3PxxQheSxfjo5gbYLbwD0LM6DAlHrUerLNZhDURRIJpLoQDdqKso?=
 =?us-ascii?Q?gIFtEsqmKRA3OZIYNc+dQ6AeUg1UOY47TtIpMGXmT2lr7jaMi3CsfHtiEA1C?=
 =?us-ascii?Q?74fdwqlrrgllrAM6kE8S0ixxZeSB+XZIH6B+5a3YQd2yBPRLMM1tzR0SrR3D?=
 =?us-ascii?Q?Bb8YvEH7AGSBRKVzddCeBMpOKChLzFyK4cs/lR697A+iUSAtSgBZA5eNOw/m?=
 =?us-ascii?Q?WN1XGuJzP+llZHxsT+EZHZXVmoccvZO6WsvbPHr319x7Q5zFqQq8730cS6Nk?=
 =?us-ascii?Q?LIOFzf6rZUu8o4U+P+kwobbi+mi/Or+LObuRki20cGkYCRX+DqWYE8M9j1R4?=
 =?us-ascii?Q?8ZpZYK4Ow4pqo6t2Jn40TCi4Gk0CR3AgmTUoO33Rdvt/+n25qS+Gu+U6NdIQ?=
 =?us-ascii?Q?M9EZr67j7DXZhx3ucBRKtPM9ReSrUox8fmnxAjI1elw+UkCWtUyD7UNOmETN?=
 =?us-ascii?Q?/hpEiAz9IE7inF2wYaOdbr93p2Pr09if8iT9TNVxeIDv/VPhahahwfpOGYxH?=
 =?us-ascii?Q?21BoKjUDL+dd7IJHXuNQVGictoiKAT7s5s5PpiQaDIztX6/sncFkZDgUz52l?=
 =?us-ascii?Q?2tbTq5gQcudph9Lv1k1PfvTWNeQHgeAfIR1DeURE6x6GzZXwVtXEaW7vagnM?=
 =?us-ascii?Q?er+qak9MvMB1usSgNSMJvkEkKyW9vI0eC3Vml3Rkx+2/W+zrm2iCtq7Bnpjb?=
 =?us-ascii?Q?LOU55ZiOC2FUBGDkS1/f89v6jpv775JR0HpRlaJgTWSzUrdhAWtqp/ft1VZc?=
 =?us-ascii?Q?EihJwUbHDOOr3bb+gHjwIbYywcnWQQSlO3kR5Ie4uUce48e6Xka9Xiq54NGS?=
 =?us-ascii?Q?zpMzdH4IZ3gaYf6yKRGYUDg5szuJw4d/K91JEeGs2MMNpe1vJXGIScmeduBO?=
 =?us-ascii?Q?pzaHB4Vou8/xjnEgpyzvxz01NE2hUlTJCekoctF0IwzbkYjAGlaacgmv1h1T?=
 =?us-ascii?Q?ekEg1la1yTqpZnRozSKeMfVT0A48f0c46+ocI79LQ+DZMLTts2RPc6BX/Mec?=
 =?us-ascii?Q?sYeKYFCNmUVOL+/IlQcoxgeY3qEQcPJrSWTwTbr6/hvb9JuHafC6ARSxQ/pg?=
 =?us-ascii?Q?1FKsS1xlZmJH88uLPI6mwL7kd6PvAmswBvHSwZqgwrRU0BgVbcTPU+BQO406?=
 =?us-ascii?Q?XST7BUm2mCWB/ciWgXw0+18E+QOQ+rXX?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:58:37.5887 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14cf19f6-5ef0-49f2-7e00-08dcc091b276
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00005FFD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8774
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
2.46.0

