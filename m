Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17089C71155
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 04:41:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A1910E4C4;
	Tue, 17 Jun 2025 04:41:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zqiQJ+qT";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2051.outbound.protection.outlook.com [40.107.223.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873F110E4C4
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 04:41:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j9PGwLztdQ7RTXqG49SwEFc2rAFm75LBijdZBy3b8NwJIFCVdVoK6bPg6XnIpKHipHC3CyyiEgrj15ADI2k92laRj3s+ACOFKWQ/ShthNq2K3TZzJRizIv7Z9cXNdsh/ZmXths6COZN2IaYRo1WCY45FuuwLXfdcfp5TzO9R9OwxY7yGY8Oo8VEv6Pr7kNZev/3c6G04aMXhN0xPqRnT3JJcmiUH2Ocm9eCcGUz4471kJfL4OLfUtm0oJWrNmFmK/58DVq0+YhTtUEa/ucvMTpZsUXPecUpg68eDIZfRunBO+o2v/IJXlEMaQ3aVe7v3f+jbBLoow3Af+WnyO1TL7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r2VSHZ3NnVFw7aJlPhzg1iENTWlGlzgGhTMjQx7vs0I=;
 b=Zuifof563Trorzcpb8qIw2CjihaeBCluKL3tQxyOAH89+6hHhEis5/f7m3avqabr2sqSYG34bV33sk1GSrLiBiU65Iatod1Hkvk3EvfwM/bmZ0uldxwNORzmHS/CN2nrRAj/k81yDQ5roJNchStCkGrySCCSvvAvFKDGmo40cKhBKu/h0jJGSbMctK/DCOSOK0JkCalbajihZvIJ2Ugf5O8JoHUdA5RSaNsqMBZyKK6PP2SRn4aMrEmRk1O+8V5NtTwKUMpag6f7b51rj0q30k29gLVWhZ+UAhaKp/iaB9Ov0PEvh6HGgSmwIDTs4BWpxzS30ZxAUGCpi9Q8MOFjOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2VSHZ3NnVFw7aJlPhzg1iENTWlGlzgGhTMjQx7vs0I=;
 b=zqiQJ+qTy75pZKcTXRNeRwn92zYHAXjE/f2rzjDkDy79QrVAdTFPdGe41mr7lU7Tf5HC0yI8kg6rzFTL9ji3jf5wWsE11Zh1NqRog0nsuymuzLHlu+yiky355wBhU4O9QJrUpTh8zRrLK4uXpKl/c1z7dCeW1gzcjN/NbqAZ5Fo=
Received: from DM6PR07CA0037.namprd07.prod.outlook.com (2603:10b6:5:74::14) by
 CYYPR12MB8704.namprd12.prod.outlook.com (2603:10b6:930:c2::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.30; Tue, 17 Jun 2025 04:40:58 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:5:74:cafe::26) by DM6PR07CA0037.outlook.office365.com
 (2603:10b6:5:74::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.34 via Frontend Transport; Tue,
 17 Jun 2025 04:40:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:40:58 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:40:57 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V9 21/36] lib/igt_color: Support color transform for
 XRGB2101010
Date: Mon, 16 Jun 2025 22:36:16 -0600
Message-ID: <20250617043631.2920587-22-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617043631.2920587-1-alex.hung@amd.com>
References: <20250617043631.2920587-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|CYYPR12MB8704:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f10fae9-9b4b-4d15-8ba7-08ddad59276e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Bn344Hk0prVvXqoLLG8AVZ+Df52qLr97K1xOxvJKjKRYaudtxMuuf6AggTOt?=
 =?us-ascii?Q?5M8fD3Ri3T5KTxV6C50gKLMIGHM4ucK6a63wFsV9uN7KdLXDPqfs1JBXypTH?=
 =?us-ascii?Q?ejX5u4A3EDeSswUCFiF7MEQ8WSx74omEJKoRTXE7QyOCLwBTGCkkUYpgTNER?=
 =?us-ascii?Q?Pync7/nO9ENW9QBHAxD/xwxC7nDUFD02QOnrUkCCsIUS6zOJL/iVOQxvyh38?=
 =?us-ascii?Q?zyG6v/2hTCOMGJnbwe6BLzzeQYuLaOMmp7uG6NzP553EniLBolQ+ant90lWW?=
 =?us-ascii?Q?JHQOJf1I08jJAYOJL5SOWXoJhyhqZf3UU3X05jVXcw/kkHxluqMKWFN4vbYe?=
 =?us-ascii?Q?2/fkho2oDFvACOTL4RR+ES9mS221CgHKczZoHFucgHmT3t6bzAEfg31MgX6u?=
 =?us-ascii?Q?b26p4nIKllSpV5K+kVWSz140IDNhVGn0iA/IxeqeVeyxm4Fz7ma8LgJLbBwS?=
 =?us-ascii?Q?hfUyLGizx3ZxMe/6hY+egiQtTothRImZN+Z2sKKJmav60pLkODc2fm+ieFR7?=
 =?us-ascii?Q?FNOgy+hBaHrEa2CgKxoO4raBITwjVbJdYY039UtR82bHYatkEFgNKCTzjAyx?=
 =?us-ascii?Q?OISlxfbmABH9irpXpJdo+F8wueEcH9fnDsQxCS/vx8FOhRUZTHwRp+Q/2f0K?=
 =?us-ascii?Q?9P+k3lI/+nmQQGnlvWDztTt3lUf9Dgf/TTsVY+OlbSrit2973fOXnvuKS0SM?=
 =?us-ascii?Q?/R7unFbzz+3Y9nDFcCFNenTwnkPZriH/Fd9M6kqny2uNWZoK19/l3dW4KJzZ?=
 =?us-ascii?Q?2rGvE6FjI1Kr0LiGGzcxKK6mn+aje9GpmY46jhrulTND3hrN221O9yLlWax5?=
 =?us-ascii?Q?mzajhR0r2qEDE4bkiC5r80g7IiaQcXTR4mNV+/ZKMsNx6RPf+Mf0XtD4bj9w?=
 =?us-ascii?Q?jTnsl4zgzMnZMyMqjUgqocrhwPHFmfat204zNXpIkg2FLtqkWQYa0bCZibOt?=
 =?us-ascii?Q?p3X4LaC1vw+FNc2ocQZlf3wUje6mXzYZqooZjjsCgSx6hGQjj3zZQqKq6r8R?=
 =?us-ascii?Q?KY6m1kObsWcqCDqyGm/vLqpG3UY6RuAhEA+R5A8VYJlYvAwdk23/FiwDzGks?=
 =?us-ascii?Q?aT/RPmNi768krg+u15YWxBShbeaaOyF8UqltIKSfTuSmcVcd7QUMx1T3Sj7H?=
 =?us-ascii?Q?2seBYCtMvxzepKOg/NuaU+jVtsY51rNFDCBE5R5pZ43KBpl+iz4Q6Xa9i/Pn?=
 =?us-ascii?Q?WX0OiG+/LLE2R13zknFH6DXKGALmyztT5Jx3emUwcXUb7RgWICB4dQER0FEl?=
 =?us-ascii?Q?6OtoVSMCd2fusbg0HMShDDXvpKx/TZ6XxtNaKiVO4CAi3NM9GxBhdNQ3tqff?=
 =?us-ascii?Q?VUdbXwMBjKG2F9VcOdzKeJSdAJycfEV/bEq79YGOT9EUuYEvZ+K94QCmKU5t?=
 =?us-ascii?Q?0dcGi54iAyCJcA41TkBiqItGQvf3C2gSgXBIjEAXWbi6cORRT+F+MGze+UKZ?=
 =?us-ascii?Q?96KhG2aSpOCipIc0wljEzVbJWMCF1PEdkNsS/yvLX9qvMbIq1kWBLUIb3JRr?=
 =?us-ascii?Q?o6mCKreJs/oYxcwzBglubm5RMI0pBJTps9At?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:40:58.0917 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f10fae9-9b4b-4d15-8ba7-08ddad59276e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8704
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

