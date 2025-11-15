Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC795CEACF9
	for <igt-dev@archiver.kernel.org>; Sat, 15 Nov 2025 00:20:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84BFD10EBE7;
	Sat, 15 Nov 2025 00:20:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EBMDPEOp";
	dkim-atps=neutral
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010002.outbound.protection.outlook.com
 [52.101.193.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88D1110EBE7
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Nov 2025 00:20:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g+QsKVSNuVe+5V68dnZdYHzvqcU1oPDxWPvKzayi9PBXZaaG/WrQ+EZbMHJ5mE+SyBOUvkHwJxx3Rgk6YKuwn6DTfKQn1QMHtlWGChNb5HklIhwMstRtiCQMoOtBPxpyBcBcjoE7jM0LTqbDdNfH87MhHDw9Zrq6gR7zKzuRFKq2yK4mzfkBfI0A39CHqFNSSNCxozId5Oq7VAAmP+kP8ozYwJroOL4D3xuPYRJEJZdr1fgDa4OtHbeC3/9YFSFRKxbvDC+L4GeD0l7Sq02/w0MafFqEaOSnl5l1Wt4l2kdoXOZzAQUCXVeAAgRJ8gMdnxuAsybu+OkX2G8y5NOzgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vZB4yRMc6DOds9vqryp4KX6vjknToYvS6V1OPuYxSms=;
 b=cJIlxHKtdrnFw+lMG9n8CdwRw/jLSM6pVEuhtx+4iXGEqIRVlP/0YZN2Ffz91+HSmZOGS2kd0ZyrfZgVzxa/JSJ94NQzGT/A6X7erY8TuUtxSwjkvMzTzp4dOItongoGECq427BUmLcvkQWt5R9vN/Zttls/baU8/juapZHk8VTJ6Q8nPHAH+yY0FrbALeLWc//OIJD7oDgEb9RSWuaN7mWaJSpQViZGcgUFfR8lmhjax+NVJ1WQMGXKbKr9j6y+ZFVhGC5ffj9i5HCFCSTOQo64A5kbKHtfD4GNuGVJaa48vJapOyGbZ+UVYTGjL++tLPI/PFsdgAf5P9B2KN/cnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZB4yRMc6DOds9vqryp4KX6vjknToYvS6V1OPuYxSms=;
 b=EBMDPEOplFRRZoYKsLKLJ7Luf6yTKSj4eyTOZEbG2j/glLjIqqPI0xIt2ehHialO/UDogdp93AR4oDAljBoqZzEs+t6tmOU+8+PjVsq3uMq4m5OfS39l3M6jouLHrkvOGpS540P76yjFuQTZwENAjsvKopXDsdjHVhSdZqlPRkQ=
Received: from BLAP220CA0021.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::26)
 by MW4PR12MB6899.namprd12.prod.outlook.com (2603:10b6:303:208::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Sat, 15 Nov
 2025 00:20:22 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:208:32c:cafe::b6) by BLAP220CA0021.outlook.office365.com
 (2603:10b6:208:32c::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:20:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:20:21 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:20:16 -0800
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>, Leo Li
 <sunpeng.li@amd.com>
Subject: [PATCH V12 07/32] lib/igt_color/igt_fb: Add SW color transform
 functionality
Date: Fri, 14 Nov 2025 17:18:16 -0700
Message-ID: <20251115001841.3563993-8-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|MW4PR12MB6899:EE_
X-MS-Office365-Filtering-Correlation-Id: d2101dbb-cf7d-4d24-9f54-08de23dcc3e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0jQc6t+cCD3o/ZuKn2F0vIesuHZLIVnsXACTdIuH2Q3Aj2q9ShgRBahpffsP?=
 =?us-ascii?Q?n7Mcv5zxPBQ6TLmNgzNMBDtatoBdDfRDYKaAA9xe5noQgxan+0IEbGfUVfE3?=
 =?us-ascii?Q?ZzYZ9VGSFQBI1crHBigwBPeWNRX/LoCp59ukWQAu1KUN3Qt9WaTXcy4NgFx0?=
 =?us-ascii?Q?ahUojvufkZ5EdVMRgYAHHH25p5w3uai8wNu59yRrzr6NSG6sNA/6aGpRHpyG?=
 =?us-ascii?Q?7E0Zi9M41ZWvSTHqGA80CVPW+7sGxLGmgPaL/+7rmXN5kO2kDZkrnEstUITa?=
 =?us-ascii?Q?JmYtWoBrJ0kVlBQy3zVBLn1RtlWdjbuBIfFKyZCF3/cIrxW+UcCl3dSLQigm?=
 =?us-ascii?Q?ZVyeGtBGxcO+Fu3a1Uj1ghMgAmLqvoqZdFJK1V0tEJ3na6YA51imSEMHT026?=
 =?us-ascii?Q?8+xDeQvpZlInTvaJjQk37SOqnmVD7cLkAh2l7oXbajrsy9bVswkRBb0/Pb5c?=
 =?us-ascii?Q?DAFvmCjCAPXM2VrsZ/LxIl5kYqIJVrEjNWGcO5SPip13SlQgR+XnfQK9yqkc?=
 =?us-ascii?Q?/W6lKtWQCNuCpeIjp0X5+FHT6oGD3HAL3JkT9IuYqQArkZwjwOVoaJQuiwKf?=
 =?us-ascii?Q?AUavrbvEYVpC8mFKNZ4SAe9agYqXom0Yxqf9lwC8/4eTNUrkpbeUqwk6/R2C?=
 =?us-ascii?Q?JSZU5e5QIGOmUWtzPRFEKpg7yT/fTrhWN9YYctcj6OP4sSGpJhduxfGzPXXj?=
 =?us-ascii?Q?pR3LcQ35cl/eDMPBGAYgKwcgm+VIJNYssyJPO/lJcMIUtwjASCCTK22y/Jp7?=
 =?us-ascii?Q?RhWXfGvGgjs4SXnJKYdVUJOvPFCV5Vl/qL8AMCvKPF2yIxwnSJYnjcnorD8Y?=
 =?us-ascii?Q?ngr3OJ2Z8L0Ceh3eSZL/T09lHdIPTEC3E6uCcSlRels/roN4ivg9m93inzQb?=
 =?us-ascii?Q?vJHHe4Lk0CeEvoc7oRhgZpQ9DVc6bN1WnJC05dLPsoC07RkKC7g7qNBp7Plk?=
 =?us-ascii?Q?PonAl3rgCD09WImSnxrEyrKY99vY/9JP/OHFpNdR4PSPd+036mo4rTWpXjIV?=
 =?us-ascii?Q?o1EEo8DQjOxeWdWsuDeFw+CM6mNFoXwo2rD7Yt4pyIpl8ZBKPnfq+nKK0w18?=
 =?us-ascii?Q?Lydxr4fkcsGxjy/agtw+CZFNSCz5Tvt+7QxR8HNlNPgaTSHkBLJ8EcsaG/AV?=
 =?us-ascii?Q?gXo6ALMaDc7sCs6Uu32Lep9SgEpx0k0iWPGcFz3MB6QGpLL5yHt8csa3vzxD?=
 =?us-ascii?Q?+1rnwDI/PxEemur6rnasAgMXy0uQug6wIutpf34M0hEKmQRtMgKiJ9+HsuQn?=
 =?us-ascii?Q?fU1v+LQlzNbP9/BY7HkVVJd1R9BI7CkgaHnqDKN8egplIxh4HXTTVojvIIzv?=
 =?us-ascii?Q?rLe9SdTPShEc0jernIZ9WPnmDaOj0ZUbAHoopnyQPYDepX56QNNrHxOB4LKF?=
 =?us-ascii?Q?dug1uSnFKU/QbTSAEuwRaQdLi7u93khNCyHlazg9zQpBppM70uYzxH7iKh0P?=
 =?us-ascii?Q?RBo0j6whwP3SHYEv81Hl4ImuRiXycUDCa4r1knksEnDVQF1p+ppFL4fk2/IM?=
 =?us-ascii?Q?kCgzg6Tc8uyZ7bTpJBJP+777Enh08V9twogsL+Izaw3z28nmWdRcWIsL79Zp?=
 =?us-ascii?Q?yqecqpSKMnawTIA8G/s=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:20:21.8874 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2101dbb-cf7d-4d24-9f54-08de23dcc3e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6899
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

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Leo Li <sunpeng.li@amd.com>
---
 lib/igt_color.c | 246 ++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_color.h |  44 +++++++++
 lib/igt_fb.c    |   4 +-
 lib/igt_fb.h    |   2 +
 lib/meson.build |   1 +
 5 files changed, 295 insertions(+), 2 deletions(-)
 create mode 100644 lib/igt_color.c
 create mode 100644 lib/igt_color.h

diff --git a/lib/igt_color.c b/lib/igt_color.c
new file mode 100644
index 000000000..0e5f391db
--- /dev/null
+++ b/lib/igt_color.c
@@ -0,0 +1,246 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
+ *
+ * This file contains code adapted from Skia, which is
+ * distributed under a BSD-style license which can be
+ * found at
+ * https://skia.googlesource.com/skia.git/+/refs/heads/main/LICENSE
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
+
+	return pow(fn->a * x + fn->b, fn->g) + fn->e;
+}
+
+static float igt_color_tf_eval(const struct igt_color_tf *fn, float x)
+{
+	float fn_at_x_unclamped = igt_color_tf_eval_unclamped(fn, x);
+
+	return clamp(fn_at_x_unclamped, 0.0f, 1.0f);
+}
+
+static void tf_inverse(const struct igt_color_tf *fn, struct igt_color_tf *inv)
+{
+	memset(inv, 0, sizeof(struct igt_color_tf));
+
+	if (fn->a > 0 && fn->g > 0) {
+		double a_to_the_g = pow(fn->a, fn->g);
+
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
+			raw_pixel |= ((uint8_t)(lround(pixel.r) & 0xff)) << 16;
+			raw_pixel |= ((uint8_t)(lround(pixel.g) & 0xff)) << 8;
+			raw_pixel |= ((uint8_t)(lround(pixel.b) & 0xff));
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
+}
+
+bool igt_cmp_fb_component(uint16_t comp1, uint16_t comp2, uint8_t up, uint8_t down)
+{
+	int16_t diff = comp2 - comp1;
+
+	if (diff < -down || diff > up)
+		return false;
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
+		} else if (fb1->drm_format == DRM_FORMAT_XRGB8888) {
+			/* ignore alpha */
+			pixel1 = ptr1[i] & ~0xff000000;
+			pixel2 = ptr2[i] & ~0xff000000;
+
+			mask = 0xff;
+			shift = 8;
+		} else {
+			pixel1 = ptr1[i];
+			pixel2 = ptr2[i];
+		}
+
+		for (j = 0; j < 3; j++) {
+			uint16_t comp1 = (pixel1 >> (shift * j)) & mask;
+			uint16_t comp2 = (pixel2 >> (shift * j)) & mask;
+
+			if (!igt_cmp_fb_component(comp1, comp2, up, down)) {
+				igt_info("i %d j %d shift %d mask %x comp1 %x comp2 %x, pixel1 %x pixel2 %x\n",
+					 i, j, shift, mask, comp1, comp2, pixel1, pixel2);
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
diff --git a/lib/igt_color.h b/lib/igt_color.h
new file mode 100644
index 000000000..f368344b9
--- /dev/null
+++ b/lib/igt_color.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
+ *
+ * This file contains code adapted from Skia, which is
+ * distributed under a BSD-style license which can be
+ * found at
+ * https://skia.googlesource.com/skia.git/+/refs/heads/main/LICENSE
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
+	float g, a, b, c, d, e, f;
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
+typedef void (*igt_pixel_transform)(igt_pixel_t *pixel);
+
+int igt_color_transform_pixels(igt_fb_t *fb, igt_pixel_transform transforms[], int num_transforms);
+
+void igt_color_srgb_inv_eotf(igt_pixel_t *pixel);
+void igt_color_srgb_eotf(igt_pixel_t *pixel);
+
+#endif
diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 60853b0af..a1df3d070 100644
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
index 707ce6ff9..65b6a79ff 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -115,6 +115,7 @@ lib_sources = [
 	'igt_edid.c',
 	'igt_eld.c',
 	'igt_infoframe.c',
+	'igt_color.c',
 	'veboxcopy_gen12.c',
 	'igt_msm.c',
 	'igt_dsc.c',
-- 
2.43.0

