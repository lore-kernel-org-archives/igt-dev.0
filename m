Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E68B5CCF9EA
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 04:29:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915C510E8A1;
	Thu, 30 Oct 2025 04:29:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="heplw18/";
	dkim-atps=neutral
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013050.outbound.protection.outlook.com
 [40.93.196.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B3610E8A1
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 04:29:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fBL/Knmqfgq/jDX1sSoVt7JD0BTeRk9L/8Eo973PwAbyeiiM/p8uonYHfjGyKrVDlbHL3mgL1cuThNo8M+5+XpSriwzUWM6va2lHEKEENJRjX6hZIb6kilb1JN7+CE3n9P6P4v0D/owq/XOmFzxU7F4cdYXVp8ZWclL7ioPC4Zsu45joYpjDf9jKcAYB2QqrNPMu8nCOnz1oBe7qZ+FgKE4rphE7rFVXUHLbQ9Yk6F2AIX3a+TwDKAtCxg4zRVYvDfSVRPRse3cyRQgvNxyF8SmllQoakOF3WTrXzRUgzgJ6BpUtv7rGt0wLr+WST8/nC6Z9XqiEbPpb5dmiQZhabg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=arXC5MT5A7bft25jFSqYbQV5a1+1JZXpk2DE7U01RXs=;
 b=WQbSJNbHG8tPD8pXciH21U4jLhYMW+vM3c4xDOumP5Mk3i21qYqoXI/8nA1LuUHza5qJNUdZrWktIjZAfsxCs8lZjAPc6GdXU2KZd+Vdwihvx9pvuS8BFqypJ4kfPt9Yu9BhDk4JMGxEj4vOPgpW9wuR/d5stoQtlci72i/q4o0l2qsveCdu3G4wrXzY6xA1YGpveRM5lc5fRL6Xihac90lqm/hVNnKrKL7wM1APiuExbRvDM9Nm7RfOUkmLa3VOewtgwC5hmjxyd1KyW0EwDAA4NPgDX9bT+n1BJw0CnazoxKx+DVWLspa+B6mg5/RcJslK3psDO3aY95T6aTS/6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arXC5MT5A7bft25jFSqYbQV5a1+1JZXpk2DE7U01RXs=;
 b=heplw18/M6fMxJSiFGZeibzR/4tkQGoJKubZBJEn740OFnhymbAaMvkzr+isG78cM2iogHdG2xZ4mxWlY8IF5Y/4JVmrgMqfzPZtHfSpF5UkAwvGKT0YVa5KSQhNZ30Uud7wZKDUPQKSk10rVgp7E6BOywlYDy51pKk6Nwro2Qg=
Received: from BN9P221CA0024.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::23)
 by SA0PR12MB4400.namprd12.prod.outlook.com (2603:10b6:806:95::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 04:29:43 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:408:10a:cafe::c9) by BN9P221CA0024.outlook.office365.com
 (2603:10b6:408:10a::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Thu,
 30 Oct 2025 04:29:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.0 via Frontend Transport; Thu, 30 Oct 2025 04:29:43 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 21:29:42 -0700
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V11 07/32] lib/igt_color/igt_fb: Add SW color transform
 functionality
Date: Wed, 29 Oct 2025 22:27:36 -0600
Message-ID: <20251030042801.2315866-8-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|SA0PR12MB4400:EE_
X-MS-Office365-Filtering-Correlation-Id: c4138add-4ffb-4835-fd4b-08de176cf315
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nfl+yUWZOT5RYNcXWHMkcEQz/WqgFCXmxTQFEaMjOecugItKA9C+90/OMpSo?=
 =?us-ascii?Q?koogGrbufNYSzWUIE/Qz3KH8tNxRPhRroBA+luSLn9fFg20QQ2e+5qcYv1bM?=
 =?us-ascii?Q?WZAhNcZZCeMT4NGs2aUVv531Y2Ccy/xUIrIOa7/14H4T8BZhpJNGlK+28XRi?=
 =?us-ascii?Q?8oRqP1RHk8BLdWB7vz4jFYWKIc9/vijSsbFw5Z3nWumZHxz4Agzxpb/Ync1k?=
 =?us-ascii?Q?MomG9O90K/WtKDJBl+GEuu+liKixfprk3e5Y/RUAcL2JoUzH34wbhXgCZhZP?=
 =?us-ascii?Q?CHViXV8hXaihSI0G27Q0AoomHbEaobkfvkZNP6PQP0Clnhn3zItOJE+mDTCK?=
 =?us-ascii?Q?SUlpN3EulR933p6/MNrEdXvyUh86tb012ZvMU1tc66jhME/Cox1Xapg6+zBm?=
 =?us-ascii?Q?v/TB8BSfNwPbdRFbz2KHt9IXpptEvdibiCzy2qBGIpiuZvUU1lQ5jYJLF+m/?=
 =?us-ascii?Q?GQ2zRm4gsiKm/0A7BgNHKXh7J6OKINHZknsyQ1pFdqABBoGcRb5Crp/FtjNK?=
 =?us-ascii?Q?f8pkesHutlrOnp31SKeFDL7LaJR+Gez91XEn4z4NhzE4Xx38PWL2NjnZzypL?=
 =?us-ascii?Q?GF3eQuNICemjBRg7nEGoOnuDDXi/Za5HqKp+HNksDPIiPcLGsB18P/2Pe2sj?=
 =?us-ascii?Q?yY+6LeVXh++tOHUcGxvyzNw5t9a2WZRwfEzcCWphLu7x6w+OLG7U022Nn7Lg?=
 =?us-ascii?Q?LqJhGeWkOkEi3HxrbMppuzHdMnzBGGEjgASOozi2ivq95NeM3F8gxpRTtYsZ?=
 =?us-ascii?Q?rv6lIp0s3VRrp0/LG+s5aiQHTs0raK2/i0BcrLUF0BUk7fm89ZNNTorMX/s8?=
 =?us-ascii?Q?CGJOXIzGBdwNhtgbvmrvPaLrivgwGg/Wb04QcZ11r1QsdGF0mW0WjvtduQ18?=
 =?us-ascii?Q?DaD/VCljO2tBtFQqWIJg/7h+1DTeTk0mnYGx3EztxxPfR3Q9nq+hSIL6X8D9?=
 =?us-ascii?Q?SSpf6y8vvoTOkpnIjeYs2WSkjtl9wYw84WhWKr+i8cx8gWaBdClN+SIxwn5C?=
 =?us-ascii?Q?wteNB7/yMihVhVhcXlKiqATMI7IJeLfslcW+Lr54/tnV/ezc1wds/NWcwpDU?=
 =?us-ascii?Q?mwqTo22c9wuiywcmnVieNgXyFkqXV/oYdA/TkNl8FtJO2WA7cArKZElvtLX2?=
 =?us-ascii?Q?wJHIw+zLa8XzFJWZJ2oOMaB/4GR7zuKSHkDDRJJFLUlaowuRD8iJNvaamgMs?=
 =?us-ascii?Q?8mXri4gSVevRS0IQ9vocjMNYx4bRIdN5ItJN7EhL1p4/8Z1MsPl8c2x0qajp?=
 =?us-ascii?Q?xNwuqJTIXWCief5F9LjOPqCPx8UkY/cl4VSRzq05Y1yicizfk+V0lET7CV8t?=
 =?us-ascii?Q?5WZv2thIDTCvOQ2PHL3T1GZW6D67t4XOUfYlSJs4SLz5gG3tjKrdRNnSPrEA?=
 =?us-ascii?Q?T/sVEVWBZw2k2UWN5gh1Lw3UfmQAf6qRgFAZMnEN/qXPVTT8AcGnc1IhEZUN?=
 =?us-ascii?Q?ySJvGDOEpqUUFyBqxWS4kewqWiHvkbMHzANZlns1/TVDf7LNOpuUd0h2FBFc?=
 =?us-ascii?Q?PT7N7r/cIO7VVlkH/+5drQ48vxkQkH2L0kYj?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 04:29:43.4981 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4138add-4ffb-4835-fd4b-08de176cf315
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4400
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
index 725a46e98..35844dbb0 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -114,6 +114,7 @@ lib_sources = [
 	'igt_edid.c',
 	'igt_eld.c',
 	'igt_infoframe.c',
+	'igt_color.c',
 	'veboxcopy_gen12.c',
 	'igt_msm.c',
 	'igt_dsc.c',
-- 
2.43.0

