Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E80606EE8B
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 21:40:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB6410F899;
	Tue,  3 Nov 2026 21:40:16 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010031.outbound.protection.outlook.com
 [40.93.198.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB30810E1C6
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 21:38:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s7Y/uZRYGqZ9bugigBp2TsMiLZtEeQLwL/tYEsn2AekLGwOhjfcjyIdmOnHlocoYsssQy9wGENTn++IvgGgvOh6JS10rHleg4FVn7Utq8x+tgxWSR2roEbkKhsNV4bR3UhcoHpGQOgWkWVs2bjgbpW+NqMjBBQ4g3WzGTwwvpoT6W+C5n+pGu9l2yNL/L30yArAZ9zNFE+LkN+NJDKJiaEJTAQZQCK2FiDEvyB4KSK9e84PPADFTgAaPZmcjuyAUa5isQU9WcXzDkPGFeV1DH8FGExCl6SRyXyChJmJVLHzQysaNmvnQGO6vRuSrPk7r9cvUeISjhQgf0/6yE6S/lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l8gbt6Xy3vZChPEghqlhHjIaIE00pvk00wiJqgLZu4s=;
 b=WI4CkO9cqho3HOWYuy5xcA6H+Lu1O5zvCkciVG+Oo8wn+ykqeLuP7UAzEkD6MyKshr/W8A6e7OtcYt5jfJZDaGLHCBmSI7PcN1QONRgXeF35IJtVfzdRGXHF6lTAQfoqUFa0Jw94Y86x5cbJEg4iUjtVKb1Vc1566RcQ4I59GtpR67IZe3KIdgzV8eOw1yNnN6bfh90R1dLkeDX7G/1nAXHYoWAOL4dSk8h/X1iRqAbnypXY/pxnrSGNHLb7a5ciF6jsy5RNRyECdZZRqfv7dVzg/VM6jzcSRpcqInzhcEO0bOxDWw03dqPLsUgjNxw6thfGoCHM15X3zyCA1OH8iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l8gbt6Xy3vZChPEghqlhHjIaIE00pvk00wiJqgLZu4s=;
 b=hMR8nyAStSkF31aj1pDkaxcmoYPDboINfCUYz3IBl2W5XdzuSxsTpuRh4XqC35xdJHHxn+QLrsLRf0RWc8OZUn8L4QbVU5F3QRA1Qf9YUlk6rCczow+3Jkf7zXMeaMQ8RwiD4V/mPuDfoXs0qlynukkTJcTo2JO20pdALUs7tQs=
Received: from BN0PR02CA0030.namprd02.prod.outlook.com (2603:10b6:408:e4::35)
 by CY0PR12MB276190.namprd12.prod.outlook.com (2603:10b6:930:138::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 21:38:20 +0000
Received: from BN1PEPF00018075.namprd04.prod.outlook.com
 (2603:10b6:408:e4:cafe::21) by BN0PR02CA0030.outlook.office365.com
 (2603:10b6:408:e4::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Tue, 3
 Nov 2026 21:38:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00018075.mail.protection.outlook.com (10.167.245.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Tue, 3 Nov 2026 21:38:20 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 3 Nov
 2026 15:38:19 -0600
Received: from hwentlanryzen (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 3 Nov 2026 15:38:18 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v1 04/10] tests/kms_colorop: add a DMA 3D LUT colorop test
Date: Tue, 3 Nov 2026 16:37:54 -0500
Message-ID: <20261103213800.618130-5-harry.wentland@amd.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103213800.618130-1-harry.wentland@amd.com>
References: <20261103213800.618130-1-harry.wentland@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018075:EE_|CY0PR12MB276190:EE_
X-MS-Office365-Filtering-Correlation-Id: e297c4f8-303b-4d1b-295f-08df39f2c791
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|261022113327099003|11063799006|261009223027099003|261026121527099003|261022105027099003|261022075727099003|56012099006|261102123227099003|261021121427099003|261026140227099003|261028144727099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: cIJ54UwSHmIASejSghb5qPn6WZXr5YX8hnlJE4wqJQHOBH0JVs9rok8oV5hvT819CsUcUCClJcU1qPsdYzKvWhzOIvrq1j08NrdL1STmmr1YoVo2k2vu6vSIkQnC0ehsYJjLagJPdBjVYNSkBuymaBPAZJlldrLPMN9RqbmNnjiXiVULP/NbUWbNdiUahPAccLV+gNYCe8KNvyA0Mo4occLh/zo613nSK0HZy17eTSj0WqnAQrmcs6mnCkLbfidTnDOe5yRuFt2vib+B9ZDdf90ZilQRKpPsnnuY7KyXRJz0O/SD+DtgKxmUnw6MWwCfH/l3nu55dcr3REWL1umdwTboJTR1VLVp6cnsYQyCepM59ILp6Cvqf9Y31wMokQEuOPBQkmWm6DlHY5cRs1BAwXN7GPdh2te7rrGSI26S1h+L2D5AnGO3BBSLDd3QZA1hWgN7QfYe1MkNVXeZqcKc7gzeokuEhx8UY1x3r7UMHfA/+WWWahoQ/hkEKbECdXBJBtUGuNhKfthWU7XJkkevgwXstVFX2cT9NO8MSWqtOHxBp+MVCF8sPvStq3vcAUjFh5YlI/A/qtCVIadr7GuscnF72uGR6AgAK8x1bsOlMq493G4lixA+8meKwk5buV4S0jvrPjMhNmrdVMHpeUxZCWkputoHDS7b427pLM/VrTtNTa2REeMJ/3LGHOiflOeBkrKnWT7qcKLP85LG01ibyQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(261022113327099003)(11063799006)(261009223027099003)(261026121527099003)(261022105027099003)(261022075727099003)(56012099006)(261102123227099003)(261021121427099003)(261026140227099003)(261028144727099003)(10067099003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: sfepCNODqydh6rcQGgdIkqCzPciEUysDWfEZQQpCJMhrQGjoDveJxP9doffbl5cKE44SO+bMqdGU+Fep2Y2GZKrOo/+hypR1lUnRYvKAnxG8MIqjjDpcIx1E7hE8RFWjSvB5rlN3PGAsG1J0Sre8kCTDjkdShLTqSIgMonPetRZk1wIg+Ith+0Yh9xIcuim0EtKD2t2AU91jw13frfvwppv6wY/YJ0t9eOT4oyITSXbJYDpfGVjbPZ858NMaFZYaAE35rfqZz2kW/ya7txXbms7lDyp/WUxxRKZKW1GXcwFebNF1l8fxjEfHFc7+WkCbAmUtitF071xW4Gjg54MCjzpwTTkyg4K8zfTMzDuFCkx7ilFFI0ZT+Frrd+VAqua7H4a2DOs4ZahTtq+vhc7mV+Z81Q7p5cl3coFg/b2TaCvEP6OLtEdGfYpK8+FqauzO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 21:38:20.2519 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e297c4f8-303b-4d1b-295f-08df39f2c791
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00018075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY0PR12MB276190
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

Add a KMS_COLOROP_3DLUT_DMA colorop type and a "3dlut_dma_17_rgb" RGB
subtest that exercises the DRM_COLOROP_3D_LUT_DMA colorop end to end via
the writeback path.

For the DMA colorop the LUT data lives in a framebuffer rather than a DATA
blob: configure_3dlut_dma() reads the advertised LUT_3D_FORMATS entry
(grid size, vertex encoding, modifier, required pitch), allocates a
matching LINEAR framebuffer with the exact advertised pitch, fills it with
the reference cube, and points the colorop's FB_ID and LUT_3D_FORMAT at
it. For traversal order RGB the R-fastest vertex sequence matches the
igt_3dlut lut[] index order, so the row-major framebuffer is exactly the
reference LUT in order. XRGB16161616 vertices are written little-endian
x:R:G:B.

The composited output is compared pixel-by-pixel against the CPU
tetrahedral reference within the existing per-driver tolerance bracket.
The subtest is skipped on drivers that do not advertise the colorop.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c        |   3 +
 tests/kms_colorop_helper.c | 138 +++++++++++++++++++++++++++++++++++++
 tests/kms_colorop_helper.h |   5 ++
 3 files changed, 146 insertions(+)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 8423a642fc54..4b903b538254 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -50,6 +50,7 @@
  * SUBTEST: plane-XR24-XR24-multiply_125
  * SUBTEST: plane-XR24-XR24-multiply_inv_125
  * SUBTEST: plane-XR24-XR24-3dlut_17_12_rgb
+ * SUBTEST: plane-XR24-XR24-3dlut_dma_17_rgb
  * SUBTEST: plane-XR30-XR30-bypass
  * SUBTEST: plane-XR30-XR30-srgb_eotf
  * SUBTEST: plane-XR30-XR30-srgb_inv_eotf
@@ -80,6 +81,7 @@
  * SUBTEST: plane-XR30-XR30-multiply_125
  * SUBTEST: plane-XR30-XR30-multiply_inv_125
  * SUBTEST: plane-XR30-XR30-3dlut_17_12_rgb
+ * SUBTEST: plane-XR30-XR30-3dlut_dma_17_rgb
  * SUBTEST: plane-bypass-XR24-XR24-srgb_eotf
  * SUBTEST: plane-bypass-XR24-XR24-srgb_inv_eotf_lut
  * SUBTEST: plane-bypass-XR24-XR24-ctm_3x4_50_desat
@@ -317,6 +319,7 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 		{ { &kms_colorop_multiply_125, NULL }, "multiply_125" },
 		{ { &kms_colorop_multiply_inv_125, NULL }, "multiply_inv_125" },
 		{ { &kms_colorop_3dlut_17_12_rgb, NULL }, "3dlut_17_12_rgb" },
+		{ { &kms_colorop_3dlut_dma_17_rgb, NULL }, "3dlut_dma_17_rgb" },
 	};
 
 	/* YUV tests - CSC FF colorop with various encoding/range combinations and optional additional colorops */
diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
index 91a494724b78..3a8a5b9fedba 100644
--- a/tests/kms_colorop_helper.c
+++ b/tests/kms_colorop_helper.c
@@ -210,6 +210,17 @@ kms_colorop_t kms_colorop_3dlut_17_12_rgb = {
 	.transform = &igt_color_3dlut_17_12_rgb,
 };
 
+kms_colorop_t kms_colorop_3dlut_dma_17_rgb = {
+	.type =	KMS_COLOROP_3DLUT_DMA,
+	.lut3d = &igt_3dlut_17_rgb,
+	.lut3d_info = {
+		.size = 17,
+		.interpolation = DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
+	},
+	.name = "3dlut DMA with traversal order RGB",
+	.transform = &igt_color_3dlut_17_12_rgb,
+};
+
 kms_colorop_t kms_colorop_bt709_limited_ycbcr_to_rgb = {
 	.type = KMS_COLOROP_FIXED_MATRIX,
 	.fixed_matrix_info = {
@@ -274,6 +285,8 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
 		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_MULTIPLIER);
 	case KMS_COLOROP_LUT3D:
 		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_3D_LUT);
+	case KMS_COLOROP_3DLUT_DMA:
+		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_3D_LUT_DMA);
 	case KMS_COLOROP_FIXED_MATRIX:
 		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_FIXED_MATRIX &&
 		    igt_colorop_try_prop_enum(colorop, IGT_COLOROP_FIXED_MATRIX_TYPE,
@@ -383,6 +396,125 @@ static void configure_3dlut(igt_display_t *display, kms_colorop_t *colorop, uint
 	free(igt_3dlut);
 }
 
+static uint16_t igt_3dlut_f_to_u16(float v)
+{
+	double scaled;
+
+	if (v <= 0.0f)
+		return 0;
+	if (v >= 1.0f)
+		return 0xffff;
+	scaled = round(v * 0xffff);
+	return (uint16_t)scaled;
+}
+
+/*
+ * Build a LINEAR framebuffer holding the cube for a KMS_COLOROP_3DLUT_DMA
+ * colorop and point the colorop's FB_ID at it. The advertised LUT_3D_FORMATS
+ * entry gives the grid size, vertex encoding, modifier and required pitch.
+ *
+ * For traversal order RGB the vertex sequence is R-fastest, which matches the
+ * igt_3dlut lut[] index (r + size*g + size*size*b), so the framebuffer laid
+ * out row-major (width = size, height = size*size) is exactly lut[] in order.
+ */
+static void configure_3dlut_dma(igt_display_t *display, kms_colorop_t *colorop)
+{
+	int fd = display->drm_fd;
+	const struct drm_mode_3dlut_mode *modes, *mode = NULL;
+	drmModePropertyBlobRes *blob;
+	uint64_t blob_id;
+	unsigned int n_modes, i, sel = 0;
+	uint32_t size, x, y;
+	uint32_t tight_stride, bo_stride;
+	int r_idx, g_idx, b_idx;
+	uint8_t *map;
+
+	blob_id = igt_colorop_get_prop(display, colorop->colorop, IGT_COLOROP_LUT_3D_FORMATS);
+	igt_assert(blob_id);
+	blob = drmModeGetPropertyBlob(fd, blob_id);
+	igt_assert(blob);
+
+	modes = blob->data;
+	n_modes = blob->length / sizeof(*modes);
+	for (i = 0; i < n_modes; i++) {
+		/* The row-major CPU fill below only supports a LINEAR layout. */
+		if (modes[i].modifier != DRM_FORMAT_MOD_LINEAR)
+			continue;
+		if (modes[i].lut_size == colorop->lut3d_info.size &&
+		    modes[i].interpolation == colorop->lut3d_info.interpolation) {
+			mode = &modes[i];
+			sel = i;
+			break;
+		}
+	}
+	igt_skip_on_f(!mode, "no advertised LINEAR 3D LUT format with size %u and interpolation %u\n",
+		      colorop->lut3d_info.size, colorop->lut3d_info.interpolation);
+
+	size = mode->lut_size;
+
+	/*
+	 * Map the fourcc channel order to u16 offsets within a vertex. Both
+	 * formats are little-endian with x in the high 16 bits (offset 3).
+	 */
+	switch (mode->format) {
+	case DRM_FORMAT_XRGB16161616:	/* x:R:G:B -> mem B, G, R, x */
+		r_idx = 2; g_idx = 1; b_idx = 0;
+		break;
+	case DRM_FORMAT_XBGR16161616:	/* x:B:G:R -> mem R, G, B, x */
+		r_idx = 0; g_idx = 1; b_idx = 2;
+		break;
+	default:
+		igt_skip_on_f(true, "unsupported DMA 3D LUT fourcc 0x%x\n",
+			      mode->format);
+		return;
+	}
+
+	/* Reuse across format iterations: drop any previous buffer first. */
+	if (colorop->lut3d_dma_fb.fb_id)
+		igt_remove_fb(fd, &colorop->lut3d_dma_fb);
+
+	/*
+	 * When the advertised pitch equals the tight stride, a dumb buffer
+	 * (bo_stride 0) suffices and lands in CPU-accessible memory. When the
+	 * driver needs a wider, aligned pitch (e.g. amdgpu's 256-byte rows in
+	 * VRAM), force the advertised pitch so igt allocates a strided device BO.
+	 */
+	tight_stride = size * (igt_drm_format_to_bpp(mode->format) / 8);
+	bo_stride = (tight_stride == mode->pitch) ? 0 : mode->pitch;
+
+	igt_create_fb_with_bo_size(fd, size, size * size,
+				   mode->format, mode->modifier,
+				   IGT_COLOR_YCBCR_BT709,
+				   IGT_COLOR_YCBCR_LIMITED_RANGE,
+				   &colorop->lut3d_dma_fb, 0, bo_stride);
+	igt_assert_eq(colorop->lut3d_dma_fb.strides[0], mode->pitch);
+
+	map = igt_fb_map_buffer(fd, &colorop->lut3d_dma_fb);
+	igt_assert(map);
+
+	/* Vertices are written in the advertised fourcc's channel order. */
+	for (y = 0; y < size * size; y++) {
+		for (x = 0; x < size; x++) {
+			const struct igt_color_lut_float *e =
+				&colorop->lut3d->lut[y * size + x];
+			uint16_t *v = (uint16_t *)(map +
+				y * colorop->lut3d_dma_fb.strides[0] + x * 8);
+
+			v[r_idx] = igt_3dlut_f_to_u16(e->red);
+			v[g_idx] = igt_3dlut_f_to_u16(e->green);
+			v[b_idx] = igt_3dlut_f_to_u16(e->blue);
+			v[3] = 0;
+		}
+	}
+
+	igt_fb_unmap_buffer(&colorop->lut3d_dma_fb, map);
+	drmModeFreePropertyBlob(blob);
+
+	igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_LUT_3D_FORMAT, sel);
+	igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_FB_ID,
+				   colorop->lut3d_dma_fb.fb_id);
+}
+
 static void set_colorop(igt_display_t *display, kms_colorop_t *colorop)
 {
 	enum drm_colorop_lut3d_interpolation_type interpolation;
@@ -418,6 +550,9 @@ static void set_colorop(igt_display_t *display, kms_colorop_t *colorop)
 
 		configure_3dlut(display, colorop, lut_size);
 		break;
+	case KMS_COLOROP_3DLUT_DMA:
+		configure_3dlut_dma(display, colorop);
+		break;
 	case KMS_COLOROP_FIXED_MATRIX:
 		igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_FIXED_MATRIX_TYPE,
 					  kms_colorop_fixed_matrix_names[colorop->fixed_matrix_info.fixed_matrix_type]);
@@ -464,6 +599,9 @@ static void reset_colorop(kms_colorop_t *colorop)
 	case KMS_COLOROP_MULTIPLIER:
 		igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_MULTIPLIER, 1);
 		break;
+	case KMS_COLOROP_3DLUT_DMA:
+		igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_FB_ID, 0);
+		break;
 	case KMS_COLOROP_ENUMERATED_LUT1D:
 	default:
 		return;
diff --git a/tests/kms_colorop_helper.h b/tests/kms_colorop_helper.h
index 10d5ecad8340..84954cb9925f 100644
--- a/tests/kms_colorop_helper.h
+++ b/tests/kms_colorop_helper.h
@@ -26,6 +26,7 @@ typedef enum kms_colorop_type {
 	KMS_COLOROP_MULTIPLIER,
 	KMS_COLOROP_LUT3D,
 	KMS_COLOROP_FIXED_MATRIX,
+	KMS_COLOROP_3DLUT_DMA,
 } kms_colorop_type_t;
 
 typedef enum kms_colorop_lut1d_tf {
@@ -92,6 +93,9 @@ typedef struct kms_colorop {
 	/* Mapped colorop */
 	igt_colorop_t *colorop;
 
+	/* Framebuffer holding the LUT data for KMS_COLOROP_3DLUT_DMA. */
+	igt_fb_t lut3d_dma_fb;
+
 } kms_colorop_t;
 
 extern kms_colorop_t kms_colorop_srgb_eotf;
@@ -116,6 +120,7 @@ extern kms_colorop_t kms_colorop_ctm_3x4_bt709_dec;
 extern kms_colorop_t kms_colorop_multiply_125;
 extern kms_colorop_t kms_colorop_multiply_inv_125;
 extern kms_colorop_t kms_colorop_3dlut_17_12_rgb;
+extern kms_colorop_t kms_colorop_3dlut_dma_17_rgb;
 extern kms_colorop_t kms_colorop_bt709_limited_ycbcr_to_rgb;
 extern kms_colorop_t kms_colorop_bt709_full_ycbcr_to_rgb;
 extern kms_colorop_t kms_colorop_bt601_limited_ycbcr_to_rgb;
-- 
2.56.0

