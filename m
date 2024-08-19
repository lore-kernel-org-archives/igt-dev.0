Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDE8C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:58:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F45E10E45B;
	Mon, 19 Aug 2024 20:58:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rjT1EgRV";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC2810E42C
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:58:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rwkIdfxSBU8y38XahGyIzHLpr44qy2KWVkvXEcX6nMwlif0mzAMCKuJDcLYwEKQEiZrzeMIvCdcfT1UliINxWw+I5KxChiGn3gt/t5/k6mM+07zHIoH1XfqUT95UbeZEewJZjq6seR1jZBQQYoba9QL4ZPyaq32Vhzs4NtL+XlXG9W/KBhn6CK9ZeaTeb16KzjMz3dnpTLFHxDHUZEgywEONEK2O9l7dX3PVvmVcCKGaJ1VKYrbAYNj8bhsecpjO1Kjh3XTmlHRWaAvH2Z5WgKhsfxDhG/qoly8kNRIF25SDIlMespvqGZp2u5E9aQrgKe0/6itJo5SEg84eVnW57g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QWUmn3tSx9mNkgnB4uhfwexTQcLIYhhZnnFnuHZXj0=;
 b=hKtf+VM+h5fa1Ub2kuMVaidlQERNkAef3LEiyPYQcHZpq2L39uT9lPi8Qxh1Y2PNpTCy/WK7cqv3aETk2Hb9dHzEskH/HMp39S1biFQnNlPQMaHWQ8aU5AE2kn0iU/NrAr66zSiDlm36DPHd+zGIn36XnZzwihwW47bTbWpYA84PcYyEdJthoVvdq0Oo6Kmp1Q+GE4hY2dDMECSSz1KRaHBw86B31cAlmaDTIaWsZxjhfU4p/NGFeTpoG0/ekeZDwLsvutzs1XGhv57jvYH52PiSbaOQqyB9yDuL8Lge3eXj/oV1IobCEfEiu1Nc2hUr4lUCi+UhBlXoLGJAG0dRXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QWUmn3tSx9mNkgnB4uhfwexTQcLIYhhZnnFnuHZXj0=;
 b=rjT1EgRVV0VJvQYRXxF9U0bWLEtFkzgwPectWd4LmPMTRGcQbvOpYMvLL0WulmU76OaHT4Javd0DO/CtW3D3IX/z9NewGHFXB30FmhiniH2as2WddhnZcnLXf5KPV0bFchnkSytGO+VPZyPJMYroXiiOz05+XyFN9Dxl1YPYctk=
Received: from CH0PR13CA0025.namprd13.prod.outlook.com (2603:10b6:610:b1::30)
 by DS0PR12MB9446.namprd12.prod.outlook.com (2603:10b6:8:192::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:58:33 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::6) by CH0PR13CA0025.outlook.office365.com
 (2603:10b6:610:b1::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.13 via Frontend
 Transport; Mon, 19 Aug 2024 20:58:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:58:33 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:30 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:58:30 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v5 10/37] igt/color: Add SW color transform functionality
Date: Mon, 19 Aug 2024 16:57:56 -0400
Message-ID: <20240819205823.316656-11-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205823.316656-1-harry.wentland@amd.com>
References: <20240819205823.316656-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|DS0PR12MB9446:EE_
X-MS-Office365-Filtering-Correlation-Id: 62241083-bfe1-4c5e-cbfa-08dcc091afec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BJjgt4LzsviQGONGxflz4qextpJyYmKJP9y0n7kEuQ6gAAVto97k7XY0Oefg?=
 =?us-ascii?Q?yeZHIGpPuv/df8sz1ME6KriclQA4QwiHWKr7nzTt1uizQrdJODS3aSvRkeZy?=
 =?us-ascii?Q?46sgX2O7KdkuoSXkCHD557erJnRzOJN5J/pakxRX3k3R6aiClm5NwJ+4EvhY?=
 =?us-ascii?Q?Y5omrihVSNBR8uCkhivjXgxdaO/JiT01t8kJeeU2v0ZtpHT7CBtUC/sTGaK2?=
 =?us-ascii?Q?JwFsNwkU9grELo6m7gI99CqdlljEa5+07y3QLSr4KktCDe0UC3IVZft3bZKn?=
 =?us-ascii?Q?L23SDvtS8iBdkOaync2bo+Cqm1wxhkLWr7B5ncwIUmTYayAWz3uz+xYzYqHT?=
 =?us-ascii?Q?fl8HBeZHOMXKQlp8kgYjnIOxbgff5g2ADalhlapM3FOhmEyFhARy5cOfc0Zu?=
 =?us-ascii?Q?0VmmTM3ny+/xQMiHKgadMcudHL+ghignofpbA2lIcQfInxKs76c40e4FBhaw?=
 =?us-ascii?Q?OUe15/Wbd8KOusM/x5SAmdYlOrEVeRgyTolvLLySzGUBduhEcKeyKB/UM5WI?=
 =?us-ascii?Q?S8lsH6BKoy0AzcKV8mBqvaR9z5glPxnKObzCfeyCjNCduP0EZr9e32VEQ9Cq?=
 =?us-ascii?Q?LTpjP+Cnp64RirmZPTHJwXcshLi3f6q8iF9Kfkry8OMY5qRDrmOSv+MXL35s?=
 =?us-ascii?Q?ja+7wPusHadFevOqDKkf3/R8oZQ3E5KrHDeKMAVCB5mjD34MUBTXJ+st92sR?=
 =?us-ascii?Q?t+T6mCHpFKhOpx6i5mbwUTUo7u6sOBix8LVMqbEAcTISmH0utPUlv/Fp8Ugc?=
 =?us-ascii?Q?VkFdvCPnlolFT9GC43+wefvR0aOtlBTD9tQB60HM+CwTNBsmrB1Fpaw28Coa?=
 =?us-ascii?Q?KE9rmT1SzMSaKtJ42OipMtfyOy/ojDCoKsLWgqqtbq2xQGvgkaAamyMX2/Ck?=
 =?us-ascii?Q?o43Ywx0XMjJnKeeyBQYM1S6kBQrF0kJaLQ4Q7QtyjEIToe9429cnb3q/e/pd?=
 =?us-ascii?Q?rzTRLxXpokIHpmzvPiPR6lfl3+cbV0RnNTvTwBAXzTIfpnBtZz/O/BAL95B0?=
 =?us-ascii?Q?rsqBcRc3k3MAE52v0vm6xMEgb3SCC/Z/xNH+V2KGLW0v1e9Y/RFbmoENAa7K?=
 =?us-ascii?Q?PI4k5DQ6c5JF1wQ4YIxvHVdhb3+PnwCCgNedpD2FgxO4/YjTTIG5xruvjwPy?=
 =?us-ascii?Q?sZ2WpEfTqkCid8ZiINbORBvK3GT5gtnyJTDHikpjPuyZrYtWwinCi3iE5Wm2?=
 =?us-ascii?Q?BlwDcirp2H0qP3LgRDbGIsIg8Y1cm9G/anIWpJyO5s5uXe2FSOsn903VO628?=
 =?us-ascii?Q?spAA474+njPCmriRxzybj06YI4yw9hKoAypm0B+QChJJmiTBZQrPlQnTIQJk?=
 =?us-ascii?Q?GiNugHXZoyUiwwdg0So37noUjN6J39YAefYsi/B52CoXDnF8Mr4MNodsdgFZ?=
 =?us-ascii?Q?aB2pj3p/y3p7mx/3Byq5/OGgMO8P//RkfNTw3ZFBn6P4uZ/c+2szcj4Vh8QJ?=
 =?us-ascii?Q?6s8Oy72d9T5oRZe+vr0pkEg9yc3V2pWB?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:58:33.3308 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62241083-bfe1-4c5e-cbfa-08dcc091afec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9446
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
 lib/igt_fb.c    |   6 +-
 lib/igt_fb.h    |   2 +
 lib/meson.build |   1 +
 5 files changed, 307 insertions(+), 3 deletions(-)
 create mode 100644 lib/igt_color.c
 create mode 100644 lib/igt_color.h

diff --git a/lib/igt_color.c b/lib/igt_color.c
new file mode 100644
index 000000000000..6349f2b15a47
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
index 000000000000..fa9f6cf42991
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
index addff2cfba3b..abee42918def 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -762,7 +762,7 @@ void igt_init_fb(struct igt_fb *fb, int fd, int width, int height,
 	}
 }
 
-static uint32_t calc_plane_stride(struct igt_fb *fb, int plane)
+uint32_t igt_fb_calc_plane_stride(struct igt_fb *fb, int plane)
 {
 	uint32_t min_stride = fb->plane_width[plane] *
 		(fb->plane_bpp[plane] / 8);
@@ -944,7 +944,7 @@ static uint64_t calc_fb_size(struct igt_fb *fb)
 
 		/* respect the stride requested by the caller */
 		if (!fb->strides[plane])
-			fb->strides[plane] = calc_plane_stride(fb, plane);
+			fb->strides[plane] = igt_fb_calc_plane_stride(fb, plane);
 
 		align = get_plane_alignment(fb, plane);
 		if (align)
@@ -4814,7 +4814,7 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc_t *crc)
 	void *map;
 	char *ptr;
 	int x, y, cpp = igt_drm_format_to_bpp(fb->drm_format) / 8;
-	uint32_t stride = calc_plane_stride(fb, 0);
+	uint32_t stride = igt_fb_calc_plane_stride(fb, 0);
 
 	if (fb->num_planes != 1)
 		return -EINVAL;
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index 834aaef54dea..d2751c0bb772 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -170,6 +170,8 @@ int igt_dirty_fb(int fd, struct igt_fb *fb);
 void *igt_fb_map_buffer(int fd, struct igt_fb *fb);
 void igt_fb_unmap_buffer(struct igt_fb *fb, void *buffer);
 
+uint32_t igt_fb_calc_plane_stride(struct igt_fb *fb, int plane);
+
 void igt_create_bo_for_fb(int fd, int width, int height,
 			  uint32_t format, uint64_t modifier,
 			  struct igt_fb *fb);
diff --git a/lib/meson.build b/lib/meson.build
index f711e60a736a..15fe5f5c2a18 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -107,6 +107,7 @@ lib_sources = [
 	'igt_edid.c',
 	'igt_eld.c',
 	'igt_infoframe.c',
+	'igt_color.c',
 	'veboxcopy_gen12.c',
 	'igt_msm.c',
 	'igt_dsc.c',
-- 
2.46.0

