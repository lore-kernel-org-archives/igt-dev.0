Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14E0C36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 23:44:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C3C10E793;
	Wed, 26 Mar 2025 23:44:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zzTPTlET";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEEEF10E793
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 23:44:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hug1HW8QJ/bQ7tmSvzh1Ouj6bXq/GprwqYQg3SqnJs39YiSNBFkusolHgz8UKWKDDcUK7lNiEAXGNw9FYr9hstATU1doxlsV2WcjMFlov2QvgAf7bW6vcLZgWtHANUg/3hZZNqq5z+U5SrO0NLxmR+c8/A6RKH6Y1rxX0EhkkIc0tRMgbk3EZACJyy/VFvVnI+8yulCISCHpmCHkZN3XtBVsIqPdu90i/pqf7lsTB7MiEvKHLZFtcTwauJlx2zyc8bDW3lUwTIi25u2HiaP8lrb13XsZDBvZIKpcSOouHkE7fKD3C68/Mu216Erh4nQjZeard5dtPdjxeLeTKrn03Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DkYX4bEIweL5nZu8R81ID7MtKHGF4WfPvWUsRBxEJCw=;
 b=akpgl0BtPYggf+7bykKUclmBOBP6nfej+/2B9nsj/kxjAJZvgptKzrxVZJJCNPPGZf6xkbOV+8KWZ2goU025h9oeLYPoyrkSFSGhPkP6tEN0g3I/kn8T2UYulyWX6rFhbhttVGZ82uoPIp8p3W5lIB/DXWFADltNNzGoJ3xq5CQuU2xf7x77VF9DSTpCaN8ooNei5X9VW7kpAYZ8vHeS+TDZ2zFRzNKWbovY3hHubtdDAKAlMKUgonET+B0e1NHmoEHCaWzWGTxRjf62t13nckpwkUcBROT8vpqakIKOJEUR3kukqNTe7C7H6jsu3l2IK1g6eYTdVmf0CuWF2y6a+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DkYX4bEIweL5nZu8R81ID7MtKHGF4WfPvWUsRBxEJCw=;
 b=zzTPTlETNTaPNNRjLAlQFnBnHPW0XG0kmMbSuDGPvzSQ3uJj5kVFtv924UjFZ6X294H/6cXJ2R6p/87j0vhxkk0gDpEmHh4sBPKj3todngtqikgkkhU7cNMaGL3u2K1E83kO/6wNGDuVJQ9bDBIldWiUkNzowWUxk/l+jSJsN7g=
Received: from BL1PR13CA0243.namprd13.prod.outlook.com (2603:10b6:208:2ba::8)
 by DS0PR12MB7994.namprd12.prod.outlook.com (2603:10b6:8:149::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:43:57 +0000
Received: from BL6PEPF0001AB4C.namprd04.prod.outlook.com
 (2603:10b6:208:2ba:cafe::fd) by BL1PR13CA0243.outlook.office365.com
 (2603:10b6:208:2ba::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Wed,
 26 Mar 2025 23:43:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4C.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:43:57 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:43:56 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>
CC: <harry.wentland@amd.com>
Subject: [PATCH V7 22/37] lib/igt_color: Support color transform for
 XRGB2101010
Date: Wed, 26 Mar 2025 17:35:54 -0600
Message-ID: <20250326233609.2980110-23-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326233609.2980110-1-alex.hung@amd.com>
References: <20250326233609.2980110-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4C:EE_|DS0PR12MB7994:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c59c76d-5ec6-46f9-ed35-08dd6cc0135b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mRRJF4Nze/FnyQ9ZNYvbiOFYoC2utJW38JdasFTX011gdHetqFAEFKpHQB/E?=
 =?us-ascii?Q?ec++9g08+ow4zzHfIFvbtqCVR4bzDGzQCgbjKWRF7mbeNX4gYfblF/C1kNKQ?=
 =?us-ascii?Q?AMpsCUgFSSkwuKDgsjdksvDotX7rQJZYQfFbzW9WiQAm5P9L8AhwvG2bL9cd?=
 =?us-ascii?Q?0PXOxymU74LvbTo/5mWf7kUh6wfx70yK9fP9QbVFiaqhmbYjewAYWSqR6j8W?=
 =?us-ascii?Q?dKIhtRQlaCvkA9SuW9EeKeGYQxFBGnLxWz6BY2IC3TcALOHOogCpERR7+W1l?=
 =?us-ascii?Q?dD0LR5SRTbKgTbI2uvA9US5TSBgZrfGQcsv1jkDVbWJQspQ25XGOozh1gACd?=
 =?us-ascii?Q?zEr//MX7TSle5Fd0Wl7Mi8XxvsTMiwXLcZHa49aqJCGk6byQcQ/Yz6RP+wmy?=
 =?us-ascii?Q?Bw0lWhA7mcOx3C7hHF10rNAMCpkwgdcRPOCdeHaLGB9ctyt5EesxM2QB3TRd?=
 =?us-ascii?Q?ai1PNXEJ6Qj1p5+ZUMexs7T8eJgDPUiGhQ94U5qQbi4UmYUy/BgCxb6xWGXA?=
 =?us-ascii?Q?MwESrQ9G9yfC2XiLqquJ4kI8ds23WF8LYIK6FcHSzm6f2YlDCVgbZVVr0NmK?=
 =?us-ascii?Q?4h8vRVyKYdau0rPo6RQSB3sIeD+L3VnA8BdhBtSibQo4sKGIDGHV/yNuez53?=
 =?us-ascii?Q?O03gAkvG+dGnZNJiZ7XrNSEVvzL0YHROzz/kH5strMS17N3YMySNUw3xc0LD?=
 =?us-ascii?Q?ExwbZPDY4A3e/BnVSvm03O7NW29x4K9p/ERBzWfsmZhkghhSGtR9AiLQPh2t?=
 =?us-ascii?Q?1ldxtXKKzGnGUOxUyZ3YJ14s1ABWP1rNge/Chh+/0Tpxx7lQL+6E2rhC2jzf?=
 =?us-ascii?Q?PICuccDXXnQaPaBDvi0/QHAayvol4NKhoISsMtg00skEd5IOTsiHTwrEpYay?=
 =?us-ascii?Q?vZhEkCzG2oJbGi4WQmMWw4TueERevexGXi4o8ujro6bFKezewmie/LKPT73t?=
 =?us-ascii?Q?sUNjP1YCXQBioW7Mo7nF5sKto0zmoibguY9YL17+/V9a5igol1js0YusF6Ng?=
 =?us-ascii?Q?6/C9YR+JHz0UFhk03GT5oKN8frrXYNZk5F9ynS0yQ4fAN4pnZ2nH1vuXDeBU?=
 =?us-ascii?Q?tUJifvxw3e1SrqEld4end6gV1bQ8ijdOF3PAAZdGenxjA1NMP/NnQSBighhq?=
 =?us-ascii?Q?W2b+XgKQYQSoKBB+sgAySNJalWQK/vWd8RdiLmtVJK6tiuHc4XgEGzpEb240?=
 =?us-ascii?Q?edaYCPfOn9Onc/LumwrgvjnfVFO+2VQMhltvNuPXSPyT2sFYNnF2ydHKveqE?=
 =?us-ascii?Q?RIIcAZt+W/3LQflcHTpoHIJ/Pb+NHlWi42uTPwfL1v8rgVY6YzPFDih4tmxq?=
 =?us-ascii?Q?DuMBzWv3/abh9TquCpWeWDxxdsnIJhdasXQw5Ly6INYKfLGAnjSYVnpF0W7c?=
 =?us-ascii?Q?H42RoH0p25UsMI188q07Gk/IW99uUzIp8ReeI0l0Ph5nSe2HJI+IcD4mM0L/?=
 =?us-ascii?Q?Ge6gw3rXpCmCTH5e+3M0iR6M7WKG1TDVBbRKbmnkfcqaoYMzSSfi0plUtJv9?=
 =?us-ascii?Q?BvMKO7WfkYeJ9e7Djo1qIAvQhARrqHXnhVO9?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:43:57.0321 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c59c76d-5ec6-46f9-ed35-08dd6cc0135b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7994
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
 lib/igt_color.c | 113 ++++++++++++++++++++++++++++++------------------
 1 file changed, 70 insertions(+), 43 deletions(-)

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
-- 
2.43.0

