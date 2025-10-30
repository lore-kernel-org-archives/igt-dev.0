Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B98CCCF9EA
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 04:32:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB7A010E8BB;
	Thu, 30 Oct 2025 04:32:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fIoYTzEj";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011036.outbound.protection.outlook.com [52.101.52.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA1410E8BB
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 04:32:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wg4YU2FskMrhHuImTje5mo9MlFuikCeqheAC7+K2TE5XRtD4RuHncgFU2yg0aFUFUfSVYYcvQoDZsv1BoN+HHstiYYb4il8t79MUeCFG3U8eektsxSoWBtAOMIG90KU0MKlTmHq1e7X9q85XhD4KLG0peGdpcVzq5U84bctIEi8PHAElTBhkrPKBzEyhaUUm13x5V8vKfM0PShS1WGmAhpWo7sORijKNzMhpvYxnDnSrGCX84/oi1OmGhUZ1mlc5398BCUtsg4NEGXPW+l8spronSesah7M5IJCqnua745YDvgUjIIGmy3oVAwzfn/uZpOGSyE5AamlpZ8YXUiy80A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1VCFCJhq3ftb1QRxFtmorYjdOxVu3YJ1ExElWtcNWEk=;
 b=t7SuE1P6xyyN7O6v3au+i0HF8oOCI6/gN8Nl7BkmJ4roseBJnJVuT+y0/sprLEWfpETmnGCLDDz4Rpw7qurgpufiuCyFImHG+AJaPqmye1SYporqXKHJye8CWVqcLGxG2LxiTDkBy44ryLxowLs7LQffeDaIUdr741tAE+rG5la+9JjEbxvqONVWv4yGQVh2ANbztdQ7XlB56NHr73amJizEOKoMa7/l8xdeXiUwvro5sWiaz3azh9LX3SC+NmSFobyqxqJtZREOkkHdYOsUhH5nxJPfwsiynLx6NXKlt5iuoDKemvnhqLtrdtrXFHCF7OXkiKUrGBUnbu6Qbt8DZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1VCFCJhq3ftb1QRxFtmorYjdOxVu3YJ1ExElWtcNWEk=;
 b=fIoYTzEjaKKUIoSy64aDfGaH/b2hBprAL9ks1tWui/IkF2PK7VoHyhq5OYbhxXJIdtAlbgfT+oqoDlqiUW2MwqG5VO431+0pNgKNYi4vsSubgUTTjWlJoch/kx66soM7YwFnBuSz5+7HN+eBePrGKTslDNq3xEF+2qQpOvCrJnY=
Received: from PH0PR07CA0026.namprd07.prod.outlook.com (2603:10b6:510:5::31)
 by LV3PR12MB9404.namprd12.prod.outlook.com (2603:10b6:408:219::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Thu, 30 Oct
 2025 04:32:40 +0000
Received: from SA2PEPF000015C8.namprd03.prod.outlook.com
 (2603:10b6:510:5:cafe::62) by PH0PR07CA0026.outlook.office365.com
 (2603:10b6:510:5::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Thu,
 30 Oct 2025 04:32:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015C8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 04:32:40 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 21:32:39 -0700
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V11 19/32] lib/igt_color: Support color transform for
 XRGB2101010
Date: Wed, 29 Oct 2025 22:27:48 -0600
Message-ID: <20251030042801.2315866-20-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030042801.2315866-1-alex.hung@amd.com>
References: <20251030042801.2315866-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C8:EE_|LV3PR12MB9404:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a868eaf-a2e1-4581-5b53-08de176d5c99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?h5HNG1l0VWa5152wE/pOsGXWUgXDABaf2rCmNE8PdQac47jIhQ34vSHGeKxP?=
 =?us-ascii?Q?WzWxSefFMg8Eo1qKlzKkhgSDorS0v2Rdq51N94DlLI6+6fOi+/RDmPiODL5m?=
 =?us-ascii?Q?sccKWorN75a+ycjkqD4XhmZQqM7lhcFYkcYfdBWcWfOTYlzra8ZwGE8RtKVP?=
 =?us-ascii?Q?9zeDD5aBch8GeBgVKGN3p+oaGjBRrdXZ7egK5oOwQOw+cWbmrksZHXIqDXS5?=
 =?us-ascii?Q?ltowNxskDYKNoMveNpdiLD/gL7KAO62SYjMDSFVa+bHBAatk7mDjY1ncr1Ey?=
 =?us-ascii?Q?zNeS0RmnoRa6gQN74T7n3RNul1nclp7403JiRKCDGnMH4LSrrcgKGi4sHOGz?=
 =?us-ascii?Q?8u2jWbus/Ahjpk6tgTqH2RdIMb9c5mj589CxB2tHues993eN334UfQUfe/jf?=
 =?us-ascii?Q?e7hOQ3qUNxdFRGFSy7OqBXffSrZwEHo7I6pbsdWBcD7xChLRVQtFRJHu+0Gk?=
 =?us-ascii?Q?1IhdlqfvCtnPPlSJYMolU2sNxluefCaui5mJZO/MzQdrOJPkdeNyARkWbpJh?=
 =?us-ascii?Q?sixFgxXb08uj6v9CcaRNZHEiDxkbBioOEQ1vqk6TvCSj33taBEu5YoiEedZc?=
 =?us-ascii?Q?98I09kkafUQG5MVhtwdPEcVdlvKVmLvvkVaS3Sv6xSSBs07zmSP8sZpOgtKT?=
 =?us-ascii?Q?x4Nw+gzzT2Fcol/Ao+VhyuTM3paFxUo50kYOnWRG8vdQ4ilE+58lhjlvIwyZ?=
 =?us-ascii?Q?9HD5VKAYKd02BOq7oya4Mbj6ogkejyZbzT+m8y9LVnNmfmJbRSJWUVmswuEX?=
 =?us-ascii?Q?2CZPdDBLeDPhayNMlx1RG13StG7AiXiNDx+stN3E+50KlF6Kbrc4k73AMfUf?=
 =?us-ascii?Q?0GR1i6DGAeEEoly47/DviVkyNi1paKEkX8LwFgXy6xAa6gFokdfZkNodz+fR?=
 =?us-ascii?Q?aYVB8Bgc8aJxb5/J0MdU9fqNhGBb5+/k7Dw2UrrgBelfm2emC7x9sAo7vCs9?=
 =?us-ascii?Q?thj6ul9wTA3ykXGhwnQE2noh4gcDIp/lvsMj1NSr/zmsg3jmWQqIbX5wqN3J?=
 =?us-ascii?Q?BJK4DV4/zyGYt3h4NJfuXCEE1jwkEGtCp2Zc4yKGxKuV5JYYQWmBPk+2FJ7V?=
 =?us-ascii?Q?qFCXnHWcNIabsECx7few5eenN1Hfg7L6JdIa97HmqLU3RaeEys3iekTcY5Tm?=
 =?us-ascii?Q?1RMBKfy65l+sJsSYVW0RpIDE6KjQR6d1zq+Bz96COl16jH4/wDZ58OhKvHsw?=
 =?us-ascii?Q?4i4c+9O0N6jgjrOsrycmspYFIZjcz5gERolvUO03MzPQt9E0NleQJbNcTc6s?=
 =?us-ascii?Q?BaPFQFqX49ctj8XlN2k19DD18koPCdRubMvD6b5BKm/A2ALp5JnrfJdKT9Hg?=
 =?us-ascii?Q?eMDL1hmWWQt813d84y5MzHNAjgb70Vx15sEBxmP27AQCbF/UCfQ3VN+imCBK?=
 =?us-ascii?Q?pWwjPlDBIigYYmCisGcPd276Ye/E5kYnt2QIf9g8RmCY+KR+eIlklCqOm7ne?=
 =?us-ascii?Q?NVI4GN1OQq3UIJhKnv3xSxLQs/va4VEzAj7sj5HZGm4ZfmhvZasDZwESGTBo?=
 =?us-ascii?Q?ANu8geyfyhlkoNj4TJNIG0yWcmS+rwquswZe8QjHiYpp9RoKAk94illghuT+?=
 =?us-ascii?Q?by1lAsBWuvSCGugxJHE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 04:32:40.4923 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a868eaf-a2e1-4581-5b53-08de176d5c99
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9404
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
index bc90fbdca..dac016755 100644
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
+igt_color_pixel_to_fourcc(uint32_t drm_format, igt_pixel_t *pixel)
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
+			line[x] = cpu_to_le32(igt_color_pixel_to_fourcc(fb->drm_format, &pixel));
 		}
 
 		/* copy line back to fb buffer */
diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index f361018c9..80d1f87e6 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -297,6 +297,9 @@ static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
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

