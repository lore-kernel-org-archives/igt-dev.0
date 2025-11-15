Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3883CEACF9
	for <igt-dev@archiver.kernel.org>; Sat, 15 Nov 2025 00:22:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BD7610EB74;
	Sat, 15 Nov 2025 00:22:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2nu4MrBH";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011069.outbound.protection.outlook.com [52.101.52.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D826B10EB74
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Nov 2025 00:22:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xx7zO4n1CuV7Nja+VOrFT1ujYCyHU8Jri6QLbFf+Wcc0VSy6/23xxAHHlHTkLu4nRG/3r05EocIDKP/5SgVYgfnyZ10iI84bvVG5tAFtbYjbPF/S8ktTSw7h1O10PiZWEbRgjsWrnn2Ai/z3vF7ErkpI5oGyEJG9D9csD/skWtO3ibyxca/Ub7TEeeCOtMVCxmT/hNQ8PyRApxOKhw+hyEcIAuGDJNkP1tR8kC9mtZcrzHV8S+XmxsKdSidKhpz36bKXUQ7nNkCitYjCdspkhQHdyvFm1Nmv8QS+ehsXQ9U06rKtYJYaLesaiIvcg50inV66LzbKcdLl9+HuWLs9vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AF5P+mAynSkxcc87IiNQfq+uBoWRsA6rhEr9O2Je5yk=;
 b=zAYi425JnVB2TJNUCxKhqRfD6cBlWRnf/YeLyYWmbu+Nw68/gaDawYol5aa4YrmpJJIwldrrLP3oaYt/oscn0rBj55JWi/XxVbbfAeEsXdbhsIHIf7AHDAlo7C+3uzRuPSClUYNiW9evECpuK3fDUh846k1H/L/HkwV46USlQ99Qy1IN/7oEIOHOehilikMJbklhDFKWBshzk7ewbYNicYHsw/Z8beNqmQqLdqelWsUEk7/yAO6GWI1LYzstTVKaAk++fFiNBoBmsHJyWwZvw0/lCMzoGPBvf1gNbmDCFwdlc5q3T0Mgl9Xx4+oG4df3Rg5bfn1VYsMpS1n33L2H3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AF5P+mAynSkxcc87IiNQfq+uBoWRsA6rhEr9O2Je5yk=;
 b=2nu4MrBH0NBjsfrmuLlgI3zXp8qtqcUHGBMhJB0JgrQIhfpz/HgzWknBdDN3Mro5niIEqzikGJtI1tSb9mC9uoes77C21Oxv7xfl+RcRIiMBCSdtK2UrVdb69fZ5jA5dJ0d7nFAxax/5PdjYWtWAzF+ok7mywxtaLuJ348tWT/4=
Received: from BN1PR13CA0026.namprd13.prod.outlook.com (2603:10b6:408:e2::31)
 by SA3PR12MB9105.namprd12.prod.outlook.com (2603:10b6:806:382::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Sat, 15 Nov
 2025 00:22:41 +0000
Received: from BL6PEPF0001AB4A.namprd04.prod.outlook.com
 (2603:10b6:408:e2:cafe::ce) by BN1PR13CA0026.outlook.office365.com
 (2603:10b6:408:e2::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.7 via Frontend Transport; Sat,
 15 Nov 2025 00:22:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB4A.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:22:41 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:22:40 -0800
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>, Leo Li
 <sunpeng.li@amd.com>
Subject: [PATCH V12 19/32] lib/igt_color: Support color transform for
 XRGB2101010
Date: Fri, 14 Nov 2025 17:18:28 -0700
Message-ID: <20251115001841.3563993-20-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115001841.3563993-1-alex.hung@amd.com>
References: <20251115001841.3563993-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4A:EE_|SA3PR12MB9105:EE_
X-MS-Office365-Filtering-Correlation-Id: 131b3210-fd02-451d-8d20-08de23dd16d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gZG9sDZzrzA1kwewWdKkdYPuDdw3YqSDdIUaAghlet06XrU4B38bD6qSZ5iu?=
 =?us-ascii?Q?wPNGEWWPNRaekj56fsYHjegVl189Oyv/l6NY/VzTbC9p1Lsa96RVnT0OQMpO?=
 =?us-ascii?Q?lsFBd6SDJ/wLwgYJqhhDUriIJpDUPAFpWQNg0CIeeu0vt8BRy3y6EADWE3sS?=
 =?us-ascii?Q?uwcnTupbf2lFO07lRW9qotZAdLFprcCOTY9VEk5SIHdbUyD4U9OSiKAkuSue?=
 =?us-ascii?Q?3UDqykPu9NqXBAayToxl3+fUg1wED6Qs8uj3ckE0/f06H0S/efj2dt5dMTaD?=
 =?us-ascii?Q?1bY1rJQuNVysQjrQJ2Z0JB0O55xDlsao4S03ZfW+ILNav+sGiDLkz1+4w/pY?=
 =?us-ascii?Q?wUVMNdVQcVIZiZCHKdok1JdqytS1XsfOrYf1tefFkR4Gx1nefhqFfUNs0g6d?=
 =?us-ascii?Q?s0CT1pH4UguDs/XGKLOZwDrSHLbjtU7lmLI9bFyRY9odd3deVzKnRQym380D?=
 =?us-ascii?Q?8w2lXLsDL835cYpUaYuawUlq90IpHBshz/rNce8FkvNIb3xu+1IHiWBmD+1M?=
 =?us-ascii?Q?4Is/zQOGjwG6F1waUzOBzg5hNfajSG/4j3RX42pvFpFonFwNObynmLanL6W/?=
 =?us-ascii?Q?PcqBlaEy+/VxHgKqrbuYPkqMCvk5DDjc3jec3ENkmhNcYOmjudUEPC6qqUZU?=
 =?us-ascii?Q?mMCDLB8OMiU6aYMhbwGw2Q3hx2pgV31IlRF/rUJiu+bnP89A/yCoDdIYgt7n?=
 =?us-ascii?Q?s4uRNitR/gcahM5FoIl1m70MNUM+iqNB9ae4rbGj+gnLFu8YJfpabQMiCycu?=
 =?us-ascii?Q?sRqraz593tobqG7G2A1CmW3e0dfET6xLLZItZdPAFQB9pKsikvAjJogcf7Oc?=
 =?us-ascii?Q?TNrZurS6uFW22HcfVpRcgYwGR1DFTUb5QfqQGi27os5mRlz4TQiGktwvdq9x?=
 =?us-ascii?Q?Z+R3tfyZgjtjb5Ozqcr8tYY2XT6lcHzGIvzrwB88KzZfviH4ue3r5mCOwK3+?=
 =?us-ascii?Q?tuEdQR5a5tOvn1cbPAnJRuNN2qx7D/202DcurTD8hy/pI8lqiH0Hoh6ea94D?=
 =?us-ascii?Q?KRn48HDjRazTkgRppMc1KFqdrrGrDr09QNhZJf52wMSfXNw/s7z7zMO+8dd0?=
 =?us-ascii?Q?nICzTZ02mEFv1yYtPWpUtgS9tEMsyQ7CSm5VWUL2RTJ/zl3p90t8D30C0tZb?=
 =?us-ascii?Q?bzp8i0z+T8TexJJroMC5mwgTkzfZMtBtjqgE3mXnosFUZJZxs3SZjvQYCWQR?=
 =?us-ascii?Q?qhkYrV2SJYkpKpCupA8f1Ds2Oo81YuZINrAWqkPyKFBhN2u4UVGh0ypFYOw7?=
 =?us-ascii?Q?xHvi/NvLbESB1wWHEYe++viQL6DAtmjdOpXG8Pjne0+c3vq9GbacuoGQsi8s?=
 =?us-ascii?Q?CpOLzJJD7zCpOMk4UOXfyoZelvkgemA+ODvBYDzSH7AZIOc5jHDeaiogs0zu?=
 =?us-ascii?Q?jgO5kBwQXGlB0kyDKbY3J+f4gjBYdTOVlHSZPcZeB4GoceH9a/MGsuxV3lXG?=
 =?us-ascii?Q?7W59mh/oZq6BaNcKQOjc4qtjH++vz4/bLRDfwEj/ZrijE8psRXuKW+TLV12x?=
 =?us-ascii?Q?xaBueYdmdDMRY9VZyGg8eYK30WXOonxdd1I6SB/d9miLDaHdldEQCT18Cs7/?=
 =?us-ascii?Q?HigLP3vqRCYk0zITvfc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:22:41.0324 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 131b3210-fd02-451d-8d20-08de23dd16d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9105
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
Reviewed-by: Leo Li <sunpeng.li@amd.com>
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

