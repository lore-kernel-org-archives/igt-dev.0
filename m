Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4BDAC36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 23:41:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7938710E792;
	Wed, 26 Mar 2025 23:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OeYR9lga";
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2049.outbound.protection.outlook.com [40.107.100.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8216610E79D
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 23:41:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NUm03xXJvtkJ4w6EKx3QveenpCB11ti84/Sry4LNSLjrt9VgPJHf6ugXVUNE6x65ZzYmL8jaDhhfnVEoMKBmiIAYD34xIJ+SfoSGGjtC/PJ1sIN0OfdSzx0rPH9cgLVHWkVeMgsy3Gag5jaLbF9CzcV5OT2uaKnl1NEIX++eTLEth5jaaWppTzZD6lnPmA3vkVr2s001V5EgvmE1tEwf4u2/tWfGcF6SkaRmUYrIpseWF++TodXPQuOzmGjXKQC4gCj+FSmBP/O6rAhL2XfQug1z+qXlXzbKOgM65LCmD4F+s1QMaq6oej8ICycU7rfRENQu1F+zqkUMTkE9m/cwSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yem6bS0NqV/+q6Psfir0u7XpF/OVl9J1fVgwNtGO0sQ=;
 b=W6JVu/k5mJUhNLX4ckvP8PQzMGaRX2SKxhdULDcf/W20VpykZCXGLfkRB89NEB2/Yu0dAcGLpIjL0atT7IPPoGfXLl5ZXC6OdlgL2T6s0fs6LeRErRJqsen5C7IqhkcsAkrwaK9TwNX/7CCWunwPZvQ0Sbx+VDGVDkoeNWlh247i1dWAVweX6QSE3TQyRv7W9FR8L8IiKrfBkGrYrNMLyniEYF3brKDJPp4lTQ/4b9opakNmDRL/dut2/ktkECQbSNA2GkgfCq5ZiVLOQ1kjqx2MJkEDh7yISWET/zdMPNrj0ccjVLuxZz3qL1+ANcwhmSNujMNSdETWLo6ALI6u2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yem6bS0NqV/+q6Psfir0u7XpF/OVl9J1fVgwNtGO0sQ=;
 b=OeYR9lgaVReMGTF+5G5dmr08ZwszBsut9ByxWnQkhUHfn81MZfKZi4dQRgBIUuF4ysNXRsZYmFR+J5AIeL9TMiaa8rsRE90XaaZogm/Gg2SWgRVHFfPNqMC3Fhds5tXFUbF6LRFLXQVQHOCdwjFKnzxMmSuUE0YWlxOD5crPFt4=
Received: from BN0PR04CA0163.namprd04.prod.outlook.com (2603:10b6:408:eb::18)
 by PH7PR12MB8827.namprd12.prod.outlook.com (2603:10b6:510:26b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:41:33 +0000
Received: from BL6PEPF0001AB4F.namprd04.prod.outlook.com
 (2603:10b6:408:eb:cafe::18) by BN0PR04CA0163.outlook.office365.com
 (2603:10b6:408:eb::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Wed,
 26 Mar 2025 23:41:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4F.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:41:32 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:41:31 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>
CC: <harry.wentland@amd.com>
Subject: [PATCH V7 10/37] igt/color: Add SW color transform functionality
Date: Wed, 26 Mar 2025 17:35:42 -0600
Message-ID: <20250326233609.2980110-11-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4F:EE_|PH7PR12MB8827:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b98c527-0085-4430-0500-08dd6cbfbd6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1GqK9c/wuzs0RS8pnkQVNbO3Dc5PYnQETSGYXqzfNmeVjx0t2O+wpwAuPkgs?=
 =?us-ascii?Q?UDuBO//K/0EqP4Ra9EL6TTu+7ii6DFIR46zIQRnFKO7r2XdEC1EVYyn5oIyT?=
 =?us-ascii?Q?zCUMuPNKdHOiBnNXedjx51g+cB0CjDDYa+wcJ3s8wHZUb5vhCGmFotf5WXAe?=
 =?us-ascii?Q?hpGTmPtbGahM7E5AUrqaWulzibi8g1SfczF+zlgPBmYy5GSYIWmB/Vo2xFWa?=
 =?us-ascii?Q?su3q/8gD3m8VYNmv3BNE1E9Ef9BdWjPnbDKWq1r5erZXCLyJvYmhyoqLNrB7?=
 =?us-ascii?Q?Gq2Q+0DotBK77y+fqOK9C9USfHtBUZHblhhWK9A9ORxTmaWJ7lPtLTVDfrvW?=
 =?us-ascii?Q?6Cjo63o8d04fYbQ8muiX7797XvR96B94rZwjJ1uPUkhFiDRwsR5SKpscfl2/?=
 =?us-ascii?Q?/J5J5fIrfz1JzK6UZgLlPXAhOxJ8XKmIltCY/VVbhzScLbmZWGCsJeYxq5uY?=
 =?us-ascii?Q?gz4BXj7LJgD0LOm+eA1ri4ISWkczc1iAWopq3w8nPkfuruMYfJ0FQAUy9zZI?=
 =?us-ascii?Q?3Gjc1u2v0CvAesbZdOKEYYS5PFBWuEaIgUCuztuAiah7yXQG3qXR2TL+vact?=
 =?us-ascii?Q?bp7ryMxbHTNyHSnWOFdS39WELlZUE0TVxk2ce8YeG5QqdFM/38yrWz1Daoiv?=
 =?us-ascii?Q?3WXyMkJOKd1PclYn+RxbH0PGwgI9G63W48H7IOlXHIZP17YfFC1uXPXC4DDa?=
 =?us-ascii?Q?wOrAmPQBtEA1vCUcmaaeC7smklj2p1Pz0h7q8vJPhkClNpQxHd9U73ksfkZ+?=
 =?us-ascii?Q?HU92lV2c6XXdjdEk39hR7oLilY4YtVKCG6GXhdy6YNajGZreyWNsIsUp6nhW?=
 =?us-ascii?Q?gYPDdzCnb4B0LsnBK1QYRgKKTNyqYbQfEcWpvG5g+/5wULPuofTCHbYQMy+u?=
 =?us-ascii?Q?6F99UvtB9EU5dr7pojN5H4Qr5MC6uLw3zUZDxrswQvprGHQT+xx1RU0Tj56p?=
 =?us-ascii?Q?cdvok7dy0RdFSZ7Ltd7NrJU+x64ZW71+wSsm7OktJmspN1mTrWe+PIg2KdJR?=
 =?us-ascii?Q?DmRLZH+CDNi47A+SXQB89NJ0YbcnLPRM4Nb47hW5pG9MRUtEX+05W0zDU8Xr?=
 =?us-ascii?Q?KyWxIviT1N8+qYefaIxfjMoWdaow0QUe6VCdmm6hF8ENXkbyU0+0QldV25qC?=
 =?us-ascii?Q?iwGMAfbDjcBj6GvYWuxr7ELTzsn/PJjvYMHRW9n0J7JN9H8jx4yGAZX1fqyV?=
 =?us-ascii?Q?YfCZiTqhg6e23kIBV8bdcCjKbra4gPrlfCO9gNwvU5KE0hPaKk09kX8oHjl0?=
 =?us-ascii?Q?YZgVj1O5kehVPSzMSbTIaYdli4PwD4dBGABfJNYdMrT16nE2W9A8QZ9Uri0d?=
 =?us-ascii?Q?zbE6nY59OaoFd1/xp6uXcyVevmnIgEK8dB1/iL2hx96xdY+zqvQXtz78osz7?=
 =?us-ascii?Q?9E3kIU2poUXuGPxAzQIBTk3KRnkbiKNeWWJzV++OHVSJFx6E2N9H6c1qOu8+?=
 =?us-ascii?Q?7bc9kZTZzIivBQsrN5+QGV2+jUg0i4pexyjgbIFapxLDtUpCtUrF5CoUQUM4?=
 =?us-ascii?Q?sD78qjP37+a+3gc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:41:32.8561 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b98c527-0085-4430-0500-08dd6cbfbd6a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8827
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

In order to test color we want to compare a HW (KMS) transform
with a SW transform. This introduces color transform for an
sRGB EOTF but this can be extended to other transforms. Code is
borrowed from Skia.

v4:
 - Rename srgb_tf to srgb_eotf

v3:
 - Use SPDX style license identifier (Kamil)
 - Replace large copy-paste of Skia license with copyright note
   in file header. Skia is BSD licensed, which is compatible with
   MIT.

v2:
 - Add inverse sRGB TF
 - Make TF functions available to tests
 - Modify tranform_pixels function to take multple transforms

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_color.c | 258 ++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_color.h |  43 ++++++++
 lib/igt_fb.c    |   4 +-
 lib/igt_fb.h    |   2 +
 lib/meson.build |   1 +
 5 files changed, 306 insertions(+), 2 deletions(-)
 create mode 100644 lib/igt_color.c
 create mode 100644 lib/igt_color.h

diff --git a/lib/igt_color.c b/lib/igt_color.c
new file mode 100644
index 000000000..6349f2b15
--- /dev/null
+++ b/lib/igt_color.c
@@ -0,0 +1,258 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
+ *
+ * This file contains code adapted from Skia, which is
+ * Copyright (c) 2011 Google Inc. All rights reserved.
+ */
+
+#include <errno.h>
+#include <math.h>
+
+#include "igt_color.h"
+#include "igt_core.h"
+#include "igt_x86.h"
+
+
+static float clamp(float val, float min, float max)
+{
+	return ((val < min) ? min : ((val > max) ? max : val));
+}
+
+static float igt_color_tf_eval_unclamped(const struct igt_color_tf *fn, float x)
+{
+	if (x < fn->d)
+		return fn->c * x + fn->f;
+	return pow(fn->a * x + fn->b, fn->g) + fn->e;
+}
+
+static float igt_color_tf_eval(const struct igt_color_tf *fn, float x)
+{
+	float fn_at_x_unclamped = igt_color_tf_eval_unclamped(fn, x);
+	return clamp(fn_at_x_unclamped, 0.0f, 1.0f);
+}
+
+static void tf_inverse(const struct igt_color_tf *fn, struct igt_color_tf *inv) {
+	memset(inv, 0, sizeof(struct igt_color_tf));
+
+	if (fn->a > 0 && fn->g > 0) {
+		double a_to_the_g = pow(fn->a, fn->g);
+		inv->a = 1.f / a_to_the_g;
+		inv->b = -fn->e / a_to_the_g;
+		inv->g = 1.f / fn->g;
+	}
+
+	inv->d = fn->c * fn->d + fn->f;
+	inv->e = -fn->b / fn->a;
+	if (fn->c != 0) {
+		inv->c = 1.f / fn->c;
+		inv->f = -fn->f / fn->c;
+	}
+}
+
+void igt_color_srgb_inv_eotf(igt_pixel_t *pixel)
+{
+	struct igt_color_tf inv;
+
+	tf_inverse(&srgb_eotf, &inv);
+
+	pixel->r = igt_color_tf_eval(&inv, pixel->r);
+	pixel->g = igt_color_tf_eval(&inv, pixel->g);
+	pixel->b = igt_color_tf_eval(&inv, pixel->b);
+}
+
+
+
+void igt_color_srgb_eotf(igt_pixel_t *pixel)
+{
+	pixel->r = igt_color_tf_eval(&srgb_eotf, pixel->r);
+	pixel->g = igt_color_tf_eval(&srgb_eotf, pixel->g);
+	pixel->b = igt_color_tf_eval(&srgb_eotf, pixel->b);
+}
+
+int igt_color_transform_pixels(igt_fb_t *fb, igt_pixel_transform transforms[], int num_transforms)
+{
+	uint32_t *line = NULL;
+	void *map;
+	char *ptr;
+	int x, y, cpp = igt_drm_format_to_bpp(fb->drm_format) / 8;
+	uint32_t stride = igt_fb_calc_plane_stride(fb, 0);
+
+	if (fb->num_planes != 1)
+		return -EINVAL;
+
+	/* TODO expand for other formats */
+	if (fb->drm_format != DRM_FORMAT_XRGB8888)
+		return -EINVAL;
+
+	ptr = igt_fb_map_buffer(fb->fd, fb);
+	igt_assert(ptr);
+	map = ptr;
+
+	/*
+	 * Framebuffers are often uncached, which can make byte-wise accesses
+	 * very slow. We copy each line of the FB into a local buffer to speed
+	 * up the hashing.
+	 */
+	line = malloc(stride);
+	if (!line) {
+		munmap(map, fb->size);
+		return -ENOMEM;
+	}
+
+	for (y = 0; y < fb->height; y++, ptr += stride) {
+
+		/* get line from buffer */
+		igt_memcpy_from_wc(line, ptr, fb->width * cpp);
+
+		for (x = 0; x < fb->width; x++) {
+			uint32_t raw_pixel = le32_to_cpu(line[x]);
+			igt_pixel_t pixel;
+			int i;
+
+			raw_pixel &= 0x00ffffff;
+
+			/*
+			 * unpack pixel into igt_pixel_t
+			 *
+			 * only for XRGB8888 for now
+			 *
+			 * TODO add "generic" mechanism for unpacking
+			 * other FB formats
+			 */
+			pixel.r = (raw_pixel & 0x00ff0000) >> 16;
+			pixel.g = (raw_pixel & 0x0000ff00) >> 8;
+			pixel.b = (raw_pixel & 0x000000ff);
+
+			/* normalize for 8-bit */
+			pixel.r /= (0xff);
+			pixel.g /= (0xff);
+			pixel.b /= (0xff);
+
+			/* TODO use read_rgb from igt_fb? */
+
+			/* run transform on pixel */
+
+			for (i = 0; i < num_transforms; i++)
+				transforms[i](&pixel);
+
+			/* de-normalize back to 8-bit */
+			pixel.r *= (0xff);
+			pixel.g *= (0xff);
+			pixel.b *= (0xff);
+
+			/* re-pack pixel into FB*/
+			raw_pixel = 0x0;
+			raw_pixel |= ((uint8_t) (lround(pixel.r) & 0xff)) << 16;
+			raw_pixel |= ((uint8_t) (lround(pixel.g) & 0xff)) << 8;
+			raw_pixel |= ((uint8_t) (lround(pixel.b) & 0xff));
+			/* TODO use write_rgb from igt_fb? */
+
+			/* write back to line */
+			line[x] = cpu_to_le32(raw_pixel);
+		}
+
+		/* copy line back to fb buffer */
+		igt_memcpy_from_wc(ptr, line, fb->width * cpp);
+	}
+
+	free(line);
+	igt_fb_unmap_buffer(fb, map);
+
+	return 0;
+
+	/* for each pixel */
+
+	/* convert to float and create igt_pixel */
+
+	/* call transform */
+
+	/* convert back to fb format from igt_pixel */
+
+
+}
+
+bool igt_cmp_fb_component(uint16_t comp1, uint16_t comp2, uint8_t up, uint8_t down)
+{
+	int16_t diff = comp2 - comp1;
+
+	if ((diff < -down) || (diff > up)) {
+		printf("comp1 %x comp2 %x diff %d down %d, up %d\n", comp1, comp2, diff, -down, up);
+		return false;
+	}
+
+	return true;
+}
+
+bool igt_cmp_fb_pixels(igt_fb_t *fb1, igt_fb_t *fb2, uint8_t up, uint8_t down)
+{
+	uint32_t *ptr1, *ptr2;
+	uint32_t pixel1, pixel2, i, j;
+	bool matched = true;
+
+
+	ptr1 = igt_fb_map_buffer(fb1->fd, fb1);
+	ptr2 = igt_fb_map_buffer(fb2->fd, fb2);
+
+	igt_assert(fb1->drm_format == fb2->drm_format);
+	igt_assert(fb1->size == fb2->size);
+
+	for (i = 0; i < fb1->size / sizeof(uint32_t); i++) {
+		uint16_t mask = 0xff;
+		uint16_t shift = 8;
+
+		if (fb1->drm_format == DRM_FORMAT_XRGB2101010) {
+			/* ignore alpha */
+			pixel1 = ptr1[i] & ~0xc0000000;
+			pixel2 = ptr2[i] & ~0xc0000000;
+
+			mask = 0x3ff;
+			shift = 10;
+
+
+		} else if (fb1->drm_format == DRM_FORMAT_XRGB8888) {
+			/* ignore alpha */
+			pixel1 = ptr1[i] & ~0xff000000;
+			pixel2 = ptr2[i] & ~0xff000000;
+
+			mask = 0xff;
+			shift = 8;
+
+		} else {
+			pixel1 = ptr1[i];
+			pixel2 = ptr2[i];
+		}
+
+		for (j = 0; j < 3; j++) {
+			uint16_t comp1 = (pixel1 >> (shift*j)) & mask;
+			uint16_t comp2 = (pixel2 >> (shift*j)) & mask;
+
+			if (!igt_cmp_fb_component(comp1, comp2, up, down)) {
+				/* TODO use proper log*/
+				printf("i %d j %d shift %d mask %x comp1 %x comp2 %x, pixel1 %x pixel2 %x\n",
+				       i, j, shift, mask, comp1, comp2, pixel1, pixel2);
+				return false;
+			}
+		}
+	}
+
+	igt_fb_unmap_buffer(fb1, ptr1);
+	igt_fb_unmap_buffer(fb2, ptr2);
+
+	return matched;
+}
+
+
+void igt_dump_fb(igt_display_t *display, igt_fb_t *fb,
+		 const char *path_name, const char *file_name)
+{
+	char filepath_out[PATH_MAX];
+	cairo_surface_t *fb_surface_out;
+	cairo_status_t status;
+
+	snprintf(filepath_out, PATH_MAX, "%s/%s.png", path_name, file_name);
+	fb_surface_out = igt_get_cairo_surface(display->drm_fd, fb);
+	status = cairo_surface_write_to_png(fb_surface_out, filepath_out);
+	igt_assert_eq(status, CAIRO_STATUS_SUCCESS);
+	cairo_surface_destroy(fb_surface_out);
+}
\ No newline at end of file
diff --git a/lib/igt_color.h b/lib/igt_color.h
new file mode 100644
index 000000000..fa9f6cf42
--- /dev/null
+++ b/lib/igt_color.h
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
+ *
+ * This file contains code adapted from Skia, which is
+ * Copyright (c) 2011 Google Inc. All rights reserved.
+ */
+
+
+#ifndef __IGT_COLOR_H__
+#define __IGT_COLOR_H__
+
+#include <limits.h>
+
+#include "igt_fb.h"
+#include "igt_kms.h"
+
+struct igt_color_tf {
+    float g, a,b,c,d,e,f;
+};
+
+const struct igt_color_tf srgb_eotf = {2.4f, (float)(1/1.055), (float)(0.055/1.055), (float)(1/12.92), 0.04045f, 0, 0};
+
+typedef struct igt_pixel {
+	float r;
+	float g;
+	float b;
+} igt_pixel_t;
+
+bool igt_cmp_fb_component(uint16_t comp1, uint16_t comp2, uint8_t up, uint8_t down);
+bool igt_cmp_fb_pixels(igt_fb_t *fb1, igt_fb_t *fb2, uint8_t up, uint8_t down);
+
+void igt_dump_fb(igt_display_t *display, igt_fb_t *fb, const char *path_name, const char *file_name);
+
+/* TODO also allow 64-bit pixels, or other weird sizes */
+typedef void (*igt_pixel_transform)(igt_pixel_t *pixel);
+
+int igt_color_transform_pixels(igt_fb_t *fb, igt_pixel_transform transforms[], int num_transforms);
+
+void igt_color_srgb_inv_eotf(igt_pixel_t *pixel);
+void igt_color_srgb_eotf(igt_pixel_t *pixel);
+
+#endif
\ No newline at end of file
diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index d62a94e51..fa35a7793 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -787,7 +787,7 @@ void igt_init_fb(struct igt_fb *fb, int fd, int width, int height,
 	}
 }
 
-static uint32_t calc_plane_stride(struct igt_fb *fb, int plane)
+uint32_t igt_fb_calc_plane_stride(struct igt_fb *fb, int plane)
 {
 	uint32_t min_stride = fb->plane_width[plane] *
 		(fb->plane_bpp[plane] / 8);
@@ -977,7 +977,7 @@ void igt_calc_fb_size(struct igt_fb *fb)
 
 		/* respect the stride requested by the caller */
 		if (!fb->strides[plane])
-			fb->strides[plane] = calc_plane_stride(fb, plane);
+			fb->strides[plane] = igt_fb_calc_plane_stride(fb, plane);
 
 		align = get_plane_alignment(fb, plane);
 		if (align)
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index d5aa1e88a..fe0bb580c 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -169,6 +169,8 @@ int igt_dirty_fb(int fd, struct igt_fb *fb);
 void *igt_fb_map_buffer(int fd, struct igt_fb *fb);
 void igt_fb_unmap_buffer(struct igt_fb *fb, void *buffer);
 
+uint32_t igt_fb_calc_plane_stride(struct igt_fb *fb, int plane);
+
 void igt_create_bo_for_fb(int fd, int width, int height,
 			  uint32_t format, uint64_t modifier,
 			  struct igt_fb *fb);
diff --git a/lib/meson.build b/lib/meson.build
index d01c90df9..d515e0b92 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -108,6 +108,7 @@ lib_sources = [
 	'igt_edid.c',
 	'igt_eld.c',
 	'igt_infoframe.c',
+	'igt_color.c',
 	'veboxcopy_gen12.c',
 	'igt_msm.c',
 	'igt_dsc.c',
-- 
2.43.0

