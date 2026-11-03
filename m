Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3476D606A326
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 21:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=i6hbXg5i
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB7E810E3E4;
	Tue,  3 Nov 2026 21:48:02 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010028.outbound.protection.outlook.com [52.101.61.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ADEF10F899
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 21:39:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w5jZfeOV3UDkS4DhJ3C9Eimq1KM4kugq7FMc8wYqnj2iSE22uheMavM/GyM8PQ2aZFOUkJEv+G1Nqjiq6g7zLpHj3hNW+hwt4puOJHvzEuRcMvWd7DnxJ7AucV6FofL+PCba0Ij6z30F9r4N/HWZqPhKQIZW8z8o6vvMgJczp2ShiMfvPm7zXgXWQQNNwvER/qLletJt3bHrJQ7/Z0lGqZfbqlRvbVOBsxXP7UdNT2DsCORScJFbj31n7cpFWzdWIctE5QL/uMiv9Y8H9yN0QUPjf/tqpi8iefpBrvAbmWZrEKQ7Ev4ysydJXMPdnKEw1YeaN0gfJljmpR8VIH0dTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=579Q0fHVYlVwr56vz3tQbH9tELhbuj5iCvXPWGuAy50=;
 b=MMBeGlZ+CHRo/Z7jqqpt5y513c/F8ZoH0co7XSP4s7+LbuyrDkuk9IAKv0efbtuyi3wjKDuKllg/gK0TBs5QE2MO6xDyxnwraqy5SiBXVSFH9sOSiN/NaO/E/NbiH+ZiSoOvCEa69ewCmX+3PMBr0tcJ8zth7KFUeiugE9lkOQdldcQbjM8BHFeEt+Emxx3JPmHoLJ+iB32Lt//S2kbmerSssgf48YmOffKEvMA6JpryRwsY7oz4m5t5HFTaDpuM7zV2cRTpxIS58r3t0+0SKKLG6y0McDGtfzVU2+0JVok1uNtT3RVhFJ5q0laBP4skVpA3mvLpXANej1LtHmRR9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=579Q0fHVYlVwr56vz3tQbH9tELhbuj5iCvXPWGuAy50=;
 b=i6hbXg5iM8OSOSKj7VcThxib3NKQIYln+8bVp3RMsdFBzH8+g8arQpp6qfXn3dKQUBc4sZPxnds5/bWLBwiLZ2bTPL7eG8QLVeTLlnUOaSrlfwN+XGHhMVJd5Ea09Qz1FT5HqomWWS6Lf5fsVUklTt9ZamjHibsKDo8n4PaShSc=
Received: from BN0PR02CA0029.namprd02.prod.outlook.com (2603:10b6:408:e4::34)
 by DS3PR12MB964154.namprd12.prod.outlook.com (2603:10b6:8:438::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 21:38:22 +0000
Received: from BN1PEPF00018075.namprd04.prod.outlook.com
 (2603:10b6:408:e4:cafe::86) by BN0PR02CA0029.outlook.office365.com
 (2603:10b6:408:e4::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Tue, 3
 Nov 2026 21:38:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00018075.mail.protection.outlook.com (10.167.245.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Tue, 3 Nov 2026 21:38:22 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 3 Nov
 2026 15:38:19 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 3 Nov
 2026 15:38:19 -0600
Received: from hwentlanryzen (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 3 Nov 2026 15:38:19 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v1 05/10] tests/kms_colorop_dma: add negative DMA 3D LUT tests
Date: Tue, 3 Nov 2026 16:37:55 -0500
Message-ID: <20261103213800.618130-6-harry.wentland@amd.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103213800.618130-1-harry.wentland@amd.com>
References: <20261103213800.618130-1-harry.wentland@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018075:EE_|DS3PR12MB964154:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c308d06-6bc2-4192-68ee-08df39f2c8bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|6133799003|10067099003|22082099003|18002099003|3023799007|261021123027099003|56012099006|261021121427099003|11063799006|261022115727099003|261021130227099003|261022075727099003|261026135527099003|261028144727099003|261102123227099003|261026140227099003|261026121527099003|261021133027099003|261026130827099003|261009221227099003|261022113327099003|261009221727099003|261009223327099003|261009223027099003|261009220027099003|261022105027099003|261021135927099003;
X-Microsoft-Antispam-Message-Info: lMSEdEXnlx2dPzbtgc2kz2Jh7UPWaxlap6QEVY39a09Kno1QZUSMGD8FGTuTFLivGetOddmw5Yo4bSugJg7uRQNmiJEDoln2k0QZoMEcTMn3zmRV1PxIyGIl+R9aMtq1kI5VDUdRlCEf1aj2aV3mTqmvfDV50T4weWIDN5CgFJRoQHvj7qAgMOfrOQe3EVxYSMN5la0hHrEXNwWcoD6HmPZkqjFLcntwrFeUk03J9F9lYQQsRLG8JjlNISP29kDkYeKslD4rBW79REuNF5oPilBA7kfm0nJjoik3M1kUsfLm8wuncC9cG2M2AOUTiERM07cpkCHX44acn6CPnYLw4WN43RCuABOX5k432H2H3O9k3VWPmgb7RkCb3HFhr4E7pkzyAXm9ohIrByKAEmkFrQWXqyjD8kWAJeJ6FnUp8mqW5mG1n7eru3nn4PWi3j/1K4fOOa+G1wsHOuKhbVQHBZsrdgS5wif1hIVOWBWGK4bB0+MPfdIDkz+p1LsakHJB/ZggkTyNtwDkdQa7hNluiOHLvE8VjeALEKfobq6CwigoAEiChdcomkOfaLKMLkoRO0TDliH8Y9Fl9yfBLUd2pOlZTZPI70alLAHYX2Q2AGFYnn3poFygZTtn8HYCRGSXWFzh8fU6Mvf3JKuWim2ZxwJmwdUxbHC6Q5lfjgs2oUYmY9N2DSBJxGHhayhLxqSKABZuMJfaMrHHTSzYXdUyBg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(6133799003)(10067099003)(22082099003)(18002099003)(3023799007)(261021123027099003)(56012099006)(261021121427099003)(11063799006)(261022115727099003)(261021130227099003)(261022075727099003)(261026135527099003)(261028144727099003)(261102123227099003)(261026140227099003)(261026121527099003)(261021133027099003)(261026130827099003)(261009221227099003)(261022113327099003)(261009221727099003)(261009223327099003)(261009223027099003)(261009220027099003)(261022105027099003)(261021135927099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Ou6l+KCFZFYwJ6C4f/sRIEhfn9uRvvrskJJV6IWHTsIzILXxqEbDnsxDKn9l5S8czfDBzOkzPoXZkd50OTtwjDdn/HLkcNs6eZwseMSQfV95aiZ6XJXrqRcFW0jXG/k80VdOcxuXM4kOHVmvJx486tReu9cmagX7Dfnh3i5VNAdDw6W4C3Ax8qlTN4N8QicPFCk3MotQnFnMOfa2s/Jj6v7X5HVRepHvWE+uBzeuo6lfRclDoK+gFwj4JZwUYLDWmIc9UARY9zpD173LzP900m/G4edTbESyoW1dDjRZuQ4uEfnt3riLOBV1HdkjwpfrubrgdUXePEZsY6yFgdPKj/GVDeW95Yopz7/bUmzFNiYOIXNSJq+D7vcy+Gm/2QOmijtbz96rb6wRyIIWtZmq2LR3Ia43Qr4yYcV9b2hTNtNVKzLpY6K/Oj3cVFMIfeRx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 21:38:22.2199 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c308d06-6bc2-4192-68ee-08df39f2c8bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00018075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR12MB964154
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add four negative subtests that program a valid DRM_COLOROP_3D_LUT_DMA
colorop and then corrupt one aspect of it, asserting the atomic check
rejects the TEST_ONLY commit:

- no_fb:     enabled DMA 3D LUT with FB_ID cleared
- bad_format: framebuffer fourcc differs from the advertised entry
- bad_width:  framebuffer width \!= lut_size
- bad_height: framebuffer height \!= lut_size^2

These exercise the core drm_atomic_colorop_check() framebuffer
validation. They are skipped on drivers that don't advertise the colorop.

Introduce the kms_colorop_dma executable, add it to Meson, and keep it covered
by the existing Intel CI blocklists.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/intel-ci/i915.blocklist.txt |   1 +
 tests/intel-ci/xe.blocklist.txt   |   1 +
 tests/kms_colorop_dma.c           | 298 ++++++++++++++++++++++++++++++
 tests/meson.build                 |   2 +
 4 files changed, 302 insertions(+)
 create mode 100644 tests/kms_colorop_dma.c

diff --git a/tests/intel-ci/i915.blocklist.txt b/tests/intel-ci/i915.blocklist.txt
index a6077dee20a4..c535f494429d 100644
--- a/tests/intel-ci/i915.blocklist.txt
+++ b/tests/intel-ci/i915.blocklist.txt
@@ -205,6 +205,7 @@ igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
 ##################################################################
 igt@kms_writeback@writeback.*
 igt@kms_colorop@.*
+igt@kms_colorop_dma@.*
 ##################################################################
 # Valid skip : 3D LUT is supported NVL+
 ##################################################################
diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index c1dd3c7a83f9..8049f2adebab 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -92,6 +92,7 @@ igt@kms_prime@.*
 igt@kms_scaling_modes@scaling-mode-none
 igt@kms_writeback@writeback.*
 igt@kms_colorop@.*
+igt@kms_colorop_dma@.*
 ##################################################################
 # KMS: Test was written with the idea that edid read shouldn't take an
 # unreasonable amount of time. The timeout is an arbitrary value
diff --git a/tests/kms_colorop_dma.c b/tests/kms_colorop_dma.c
new file mode 100644
index 000000000000..5fb127de60eb
--- /dev/null
+++ b/tests/kms_colorop_dma.c
@@ -0,0 +1,298 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2025 Advanced Micro Devices, Inc.
+ */
+
+#include "sw_sync.h"
+#include "kms_colorop_helper.h"
+
+/**
+ * TEST: kms colorop dma
+ * Category: Display
+ * Description: Test DMA 3D LUT validation, synchronization and framebuffer lifetime
+ *
+ * SUBTEST: plane-3dlut_dma-negative-no_fb
+ * SUBTEST: plane-3dlut_dma-negative-bad_format
+ * SUBTEST: plane-3dlut_dma-negative-bad_width
+ * SUBTEST: plane-3dlut_dma-negative-bad_height
+ * Description: An invalid DMA 3D LUT framebuffer must be rejected by atomic check
+ * Driver requirement: vkms, amdgpu
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ */
+
+typedef struct {
+	bool dump_check;
+} data_t;
+
+static data_t data;
+
+static bool writeback_format_supported(igt_display_t *display, __u32 fourcc)
+{
+	igt_output_t *output;
+	igt_crtc_t *crtc;
+
+	for_each_output(display, output) {
+		drmModePropertyBlobRes *blob;
+		const __u32 *formats;
+		bool found = false;
+		int i;
+
+		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
+			continue;
+
+		blob = igt_get_writeback_formats_blob(output);
+		if (!blob)
+			continue;
+
+		formats = blob->data;
+		for (i = 0; i < blob->length / sizeof(*formats); i++)
+			if (formats[i] == fourcc)
+				found = true;
+		drmModeFreePropertyBlob(blob);
+
+		if (!found)
+			continue;
+
+		for_each_crtc(display, crtc) {
+			if (!(output->config.valid_crtc_index_mask & (1 << crtc->crtc_index)))
+				continue;
+
+			if (igt_plane_has_format_mod(igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY),
+						     fourcc, DRM_FORMAT_MOD_LINEAR))
+				return true;
+		}
+	}
+
+	return false;
+}
+
+enum lut3d_dma_neg {
+	LUT3D_DMA_NEG_NO_FB,
+	LUT3D_DMA_NEG_BAD_FORMAT,
+	LUT3D_DMA_NEG_BAD_WIDTH,
+	LUT3D_DMA_NEG_BAD_HEIGHT,
+	LUT3D_DMA_NEG_COUNT,
+};
+
+static const char * const lut3d_dma_neg_names[LUT3D_DMA_NEG_COUNT] = {
+	[LUT3D_DMA_NEG_NO_FB] = "no_fb",
+	[LUT3D_DMA_NEG_BAD_FORMAT] = "bad_format",
+	[LUT3D_DMA_NEG_BAD_WIDTH] = "bad_width",
+	[LUT3D_DMA_NEG_BAD_HEIGHT] = "bad_height",
+};
+
+/*
+ * Verify a valid DMA 3D LUT, then corrupt one aspect of the referenced
+ * framebuffer (or drop it) and assert the atomic check rejects it.
+ */
+static void lut3d_dma_negative_test(igt_display_t *display,
+				    igt_output_t *output,
+				    igt_plane_t *plane,
+				    igt_fb_t *input_fb,
+				    igt_fb_t *output_fb,
+				    enum lut3d_dma_neg neg)
+{
+	kms_colorop_t *colorops[] = { &kms_colorop_3dlut_dma_17_rgb, NULL };
+	struct drm_mode_3dlut_mode dma_mode;
+	drmModePropertyBlobRes *blob;
+	igt_colorop_t *color_pipeline, *op;
+	igt_fb_t bad_fb = {};
+	bool have_bad_fb = false;
+	uint32_t fourcc, width, height;
+	uint64_t blob_id;
+	int ret;
+
+	igt_plane_set_color_pipeline(plane, NULL);
+	igt_plane_set_fb(plane, input_fb);
+
+	color_pipeline = get_color_pipeline(display, plane, colorops);
+	igt_skip_on(!color_pipeline);
+
+	/* Check a valid DMA 3D LUT configuration first. */
+	set_color_pipeline(display, plane, colorops, color_pipeline);
+	op = colorops[0]->colorop;
+	igt_output_set_writeback_fb(output, output_fb);
+
+	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY |
+					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_assert_f(ret == 0, "atomic check rejected a valid DMA 3D LUT (%d)\n", ret);
+
+	blob_id = igt_colorop_get_prop(display, op, IGT_COLOROP_LUT_3D_FORMATS);
+	blob = drmModeGetPropertyBlob(display->drm_fd, blob_id);
+	igt_assert(blob);
+	memcpy(&dma_mode, blob->data, sizeof(dma_mode));
+	drmModeFreePropertyBlob(blob);
+
+	fourcc = dma_mode.format;
+	width = dma_mode.lut_size;
+	height = dma_mode.lut_size * dma_mode.lut_size;
+
+	switch (neg) {
+	case LUT3D_DMA_NEG_NO_FB:
+		igt_colorop_set_prop_value(op, IGT_COLOROP_FB_ID, 0);
+		break;
+	case LUT3D_DMA_NEG_BAD_FORMAT:
+		fourcc = (dma_mode.format == DRM_FORMAT_XRGB16161616) ?
+			 DRM_FORMAT_XBGR16161616 : DRM_FORMAT_XRGB16161616;
+		break;
+	case LUT3D_DMA_NEG_BAD_WIDTH:
+		width += 1;
+		break;
+	case LUT3D_DMA_NEG_BAD_HEIGHT:
+		height += 1;
+		break;
+	default:
+		break;
+	}
+
+	if (neg != LUT3D_DMA_NEG_NO_FB) {
+		uint32_t cpp = igt_drm_format_to_bpp(fourcc) / 8;
+		uint32_t mode_cpp = igt_drm_format_to_bpp(dma_mode.format) / 8;
+		uint32_t bo_stride = 0;
+
+		/*
+		 * On drivers that need an aligned pitch (e.g. AMD) the bad FB
+		 * must still be allocatable so the kernel rejects it for its
+		 * format/dimensions, not ADDFB. Round the advertised aligned
+		 * pitch up to cover the (possibly larger) bad width.
+		 */
+		if (dma_mode.pitch != dma_mode.lut_size * mode_cpp) {
+			bo_stride = dma_mode.pitch;
+			while (bo_stride < width * cpp)
+				bo_stride += dma_mode.pitch;
+		}
+
+		igt_create_fb_with_bo_size(display->drm_fd, width, height, fourcc,
+					   dma_mode.modifier, IGT_COLOR_YCBCR_BT709,
+					   IGT_COLOR_YCBCR_LIMITED_RANGE,
+					   &bad_fb, 0, bo_stride);
+		have_bad_fb = true;
+		igt_colorop_set_prop_value(op, IGT_COLOROP_FB_ID, bad_fb.fb_id);
+	}
+
+	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY |
+					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+	/* TEST_ONLY leaves pending properties intact, including the invalid FB_ID. */
+	reset_colorops(colorops);
+	igt_plane_set_color_pipeline(plane, NULL);
+	if (have_bad_fb)
+		igt_remove_fb(display->drm_fd, &bad_fb);
+	colorops[0]->colorop = NULL;
+
+	igt_assert_f(ret, "atomic check accepted an invalid DMA 3D LUT (%s)\n",
+		     lut3d_dma_neg_names[neg]);
+}
+
+static int opt_handler(int option, int option_index, void *_data)
+{
+	switch (option) {
+	case 'd':
+		data.dump_check = true;
+		break;
+	default:
+		return IGT_OPT_HANDLER_ERROR;
+	}
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+const char *help_str =
+	" --dump | -d Prints buffer to files.\n";
+
+static const struct option long_options[] = {
+	{ .name = "dump", .has_arg = false, .val = 'd', },
+	{}
+};
+
+int igt_main_args("d", long_options, help_str, opt_handler, NULL)
+{
+	igt_display_t display;
+	int i, ret;
+	int has_plane_color_pipeline = 0;
+
+	igt_fixture() {
+		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
+
+		if (drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) == 0)
+			display.is_atomic = 1;
+
+		ret = drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
+
+		igt_require_f(!ret, "error setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
+
+		if (drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
+			has_plane_color_pipeline = 1;
+
+		kmstest_set_vt_graphics_mode();
+
+		igt_display_require(&display, display.drm_fd);
+		display.has_plane_color_pipeline = has_plane_color_pipeline;
+
+		igt_require(display.is_atomic);
+	}
+
+	/* Negative tests - an invalid DMA 3D LUT framebuffer must be rejected */
+	{
+		igt_output_t *output;
+		igt_plane_t *plane;
+		igt_fb_t input_fb, output_fb;
+		unsigned int fb_id;
+		drmModeModeInfo mode;
+
+		igt_subtest_group() {
+			igt_fixture() {
+				/*
+				 * Negatives only issue atomic TEST_ONLY, but the
+				 * writeback connector still needs a format that
+				 * both it and the primary plane support.
+				 */
+				__u32 wb_fmt = writeback_format_supported(&display, DRM_FORMAT_XRGB8888) ?
+					DRM_FORMAT_XRGB8888 : DRM_FORMAT_XRGB2101010;
+
+				output = kms_writeback_get_output(&display, wb_fmt, wb_fmt);
+				igt_require(output);
+
+				if (output->use_override_mode)
+					memcpy(&mode, &output->override_mode, sizeof(mode));
+				else
+					memcpy(&mode, &output->config.default_mode, sizeof(mode));
+
+				plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+				igt_assert(plane);
+				igt_require(igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE));
+
+				fb_id = igt_create_color_pattern_fb(display.drm_fd,
+								mode.hdisplay, mode.vdisplay,
+								wb_fmt, DRM_FORMAT_MOD_LINEAR,
+								0.2, 0.2, 0.2, &input_fb);
+				igt_assert(fb_id >= 0);
+
+				fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
+							wb_fmt, igt_fb_mod_to_tiling(0),
+							&output_fb);
+				igt_require(fb_id > 0);
+			}
+
+			for (i = 0; i < LUT3D_DMA_NEG_COUNT; i++) {
+				igt_describe("An invalid DMA 3D LUT framebuffer must be rejected by atomic check");
+				igt_subtest_f("plane-3dlut_dma-negative-%s", lut3d_dma_neg_names[i])
+					lut3d_dma_negative_test(&display, output, plane,
+								&input_fb, &output_fb, i);
+			}
+
+			igt_fixture() {
+				igt_detach_crtc(&display, output);
+				igt_remove_fb(display.drm_fd, &input_fb);
+				igt_remove_fb(display.drm_fd, &output_fb);
+			}
+		}
+	}
+
+	igt_fixture() {
+		igt_display_fini(&display);
+		drm_close_driver(display.drm_fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index bb8bef0f90fe..10d834890728 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -27,6 +27,7 @@ test_progs = [
 	'kms_color',
 	'kms_concurrent',
 	'kms_colorop',
+	'kms_colorop_dma',
 	'kms_content_protection',
 	'kms_cursor_crc',
 	'kms_cursor_edge_walk',
@@ -389,6 +390,7 @@ extra_sources = {
 	'kms_color':  [ 'kms_color_helper.c' ],
 	'kms_color_pipeline':  [ 'kms_color_helper.c', 'kms_colorop_helper.c' ],
 	'kms_colorop':  [ 'kms_colorop_helper.c' ],
+	'kms_colorop_dma':  [ 'kms_colorop_helper.c' ],
 	'kms_chamelium_audio': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_chamelium_color':  [ 'kms_color_helper.c', join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_chamelium_color_pipeline': [ 'kms_color_helper.c', 'kms_colorop_helper.c', join_paths ('chamelium', 'kms_chamelium_helper.c') ],
-- 
2.56.0

