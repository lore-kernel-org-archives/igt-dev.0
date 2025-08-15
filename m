Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8809CA0EE4
	for <igt-dev@archiver.kernel.org>; Fri, 15 Aug 2025 04:08:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FDB510E997;
	Fri, 15 Aug 2025 04:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="icKdj9aM";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2055.outbound.protection.outlook.com [40.107.236.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DAAC10E997
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Aug 2025 04:08:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xg+Xw93y3tP3NZVcj9O0uej9PJ1DLCiXfwpXR8MdnQfoKjbjq0exDF1+1rDR0W/Cuhe2AJuPfUqAa+IySrplAKBeGJ3o4kYDxQaHnpDOzYBOrvZcf18tEb1BYxucDk1zPskIvQl9IIGaTpIphSoc09LTDOOunFa794VRrVEP9uv9GKUFMqD7nHk9wHuNZ91UVlK9OvMEcdelKI/KkCnATac4+eF/AitAvxKCny1cpjphe5+JHkRp6xOTxjFjn/6nXYuwf+wTyyQ38vXjBsTkXazYecpwIsmX5qpJFEZs9Ox5n6NQzEN+LheeH/CSXund2GQSr7xHUUQddk2kEiEc5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jpYyXTwFGkWIAYK+W1svkh4yMlXMF/K8vXtgxFZYS1M=;
 b=KfI2r4XWwF3PYZjGFw0IVV8PkcU7CZgj60mRrEoRbcaBY9Gesf+MAcBS9GVzSL1Dwxqeb2FXemn+w6Ze/pzdeqo2vqv8vYfsu8dR3+3bYYzz/R17x78a87S9RZT1/DgUNwH0l1RGlWP0U3Nirwb3A9B2ZmEgYHLXjY/IG/LtRJB7sogkph+8HmO5o+jJU+8SvCLgPFoJWhjejP0+aZoWxXvsZMEZbz262NnwR2j4E6HtDkAWF826NSslkLjt/7f1eRZe2cAV7iArEQd/xC/uYn83u9C+s6QHgoqgQjgV1Mf8Ta4af+Ah0uWKYMXlm8+X7bmf+o2R0vO9vdY60Q1wJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpYyXTwFGkWIAYK+W1svkh4yMlXMF/K8vXtgxFZYS1M=;
 b=icKdj9aMiLMFAcu8b8fyuVkGq6E7XBwQx+l30thl7HGavrqk0IUIZjyUjEyK1TTKk/ToXoDDvfbp4ujZq639jPT0Lz5vgX8QAwriMTq+wS0cmRyaMQAsRbuLMX+LrWaU54dhm3BX+7zaFizsP9atZRImU4LQsc/GvQGzQHKcb9A=
Received: from MW4P223CA0026.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::31)
 by CH0PR12MB8579.namprd12.prod.outlook.com (2603:10b6:610:182::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 04:08:28 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:303:80:cafe::ce) by MW4P223CA0026.outlook.office365.com
 (2603:10b6:303:80::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.17 via Frontend Transport; Fri,
 15 Aug 2025 04:08:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 04:08:27 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:08:25 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V10 06/30] igt/color: Add SW color transform functionality
Date: Thu, 14 Aug 2025 22:06:35 -0600
Message-ID: <20250815040659.3321102-7-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|CH0PR12MB8579:EE_
X-MS-Office365-Filtering-Correlation-Id: 4affd644-d97c-49a6-6ab8-08dddbb1635e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+k826958tMRh4hXC3ra/jZxAHAfBj5biYQoSR9xHtFPG3WzMsz/gpT0uIq0Q?=
 =?us-ascii?Q?wVdsH9XQwZ3NdCCXJ+DHdUnYEs5ZgFuYK2gwHrt+lyZ+gyr4+FmY3pwQyiqu?=
 =?us-ascii?Q?sCDFqEshPZgmyUQRKf3lhJxQDznpgeAYERZRVOFjCuHhLm5zNB1KiopQNsye?=
 =?us-ascii?Q?8V2hNro/qxDWXeXRY2ZjuTGUkeM568pITJjwc3ttqQdPSSqhCUPU3/KwQ3MT?=
 =?us-ascii?Q?dNHoJSVsdntnfxyZASCLwAVdzSU7ay1HfSQ+iWMK+8TiZNbKMvoOxZa7yIks?=
 =?us-ascii?Q?3dR+JZFeg9EttiXpuzTDyU8rLbPYnyRrYsnPlYdEKJdwxaBCs3cmHxxyUsUz?=
 =?us-ascii?Q?EuE5MVT+wkEFP0gBikIaAw6T/M/absGjaFRt1eVO2kKQGYj6k57RUDHIp/2V?=
 =?us-ascii?Q?b8CXPN8ZxnwVWJmrR8nyFFzcKxEgNyxpav1i07gNQmE6edAe6/CTyU/x3rcU?=
 =?us-ascii?Q?0pCZG4sbiRc5WhZ1DU7kGbjNiQ9vE1jLcN241kP4F47JuE2x4LIChY6leFpR?=
 =?us-ascii?Q?FcN78Y6UMSn+6+ihanWkYNpe6tqS0DOtg2uXGbOYkxf44UXaZCAQ3uxfHvUA?=
 =?us-ascii?Q?6BoJsxkA8DdrKuuIsSOdRbOugAtra40GsEhU2ZS0yKHeklpML3kdy73rSfiY?=
 =?us-ascii?Q?2EEc8zSxyWwd/YuA+4H3mOBQ9ldQ9U6lYFGeFzQZhTOOx4FyAMdtnfs8ho3C?=
 =?us-ascii?Q?VpJ5lqX9VbrslyAPT91e/k53Ui1ZNT/6LQ8eEKph4KbynftcdZNhn90p8Tpt?=
 =?us-ascii?Q?I3LbsBZPBdPqz3m7zKKmyKS0zzSr7wsmfPmADGLySLFsffyAPFNYf5OGLPCI?=
 =?us-ascii?Q?QfpdEBHovHIPE/+mGDGbbAlmraaqicTyz5F91+99f/uXlqwSWDGFm+2lPHvH?=
 =?us-ascii?Q?EZmzuwhMSGY1dhj+LQeo0wfAsm8Oh5ZqS4evuxUhBmBykZtiNvm12OW9leQ/?=
 =?us-ascii?Q?lEj031bOwTDkAgU1qFYEpHZga+7cBWR1cAIyhMENtJVgjrrFH1dOmw80tJOK?=
 =?us-ascii?Q?HeuUC1if7c0dhMgimtcs8MjpOJ97ftmZBTYEUQT1scslmFgD6G4R+3MvT/8D?=
 =?us-ascii?Q?fX/Fsn3fFtcHoIAtwSScpxVII+sRKemNgeQgq/PNZ8qHzKNnuDJs1RVdXk2j?=
 =?us-ascii?Q?vcT0dx3UuWqO4480lMG9/g0bV4u0tAlfnj2YVjBYy8/TuHEudTWpLNW+bqxC?=
 =?us-ascii?Q?r3FKXuVEJY/oGA/XfiVQFGRJl9u+qyygvRYp+Cmn1ZtMDSU1MGo/ouWGk/Cu?=
 =?us-ascii?Q?BO5t/iWr/Inz335akQEZaRPCBi9WWblGRNc0ul4oJUiTN0x8HQ9sgHZUqexq?=
 =?us-ascii?Q?VgdGOtU0jDhT7eAsnXFkfR8WvD8GEH5ADLd93nfrWy+fdBl+xv1ERHbYNAc2?=
 =?us-ascii?Q?47aq5Hm3V8u8dAefRq4rfRW5DW9FtqYAWapvB/hgNqCVb962At9XEed92ih+?=
 =?us-ascii?Q?+2hb4USIxpZ0krV6P8ab7BLq6OZhGsoYUv5grTPYQ8kJIi/LBF0MDA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:08:27.7913 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4affd644-d97c-49a6-6ab8-08dddbb1635e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8579
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
---
 lib/igt_color.c | 246 ++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_color.h |  45 +++++++++
 lib/igt_fb.c    |   4 +-
 lib/igt_fb.h    |   2 +
 lib/meson.build |   1 +
 5 files changed, 296 insertions(+), 2 deletions(-)
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
index 000000000..4f34a1b0d
--- /dev/null
+++ b/lib/igt_color.h
@@ -0,0 +1,45 @@
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
+/* TODO also allow 64-bit pixels, or other weird sizes */
+typedef void (*igt_pixel_transform)(igt_pixel_t *pixel);
+
+int igt_color_transform_pixels(igt_fb_t *fb, igt_pixel_transform transforms[], int num_transforms);
+
+void igt_color_srgb_inv_eotf(igt_pixel_t *pixel);
+void igt_color_srgb_eotf(igt_pixel_t *pixel);
+
+#endif
diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 9fc1bfc65..45692b170 100644
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
index 2eaca42a4..6cc2d22ae 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -112,6 +112,7 @@ lib_sources = [
 	'igt_edid.c',
 	'igt_eld.c',
 	'igt_infoframe.c',
+	'igt_color.c',
 	'veboxcopy_gen12.c',
 	'igt_msm.c',
 	'igt_dsc.c',
-- 
2.43.0

