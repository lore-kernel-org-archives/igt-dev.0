Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14464606D83E
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 21:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=2txrTtWi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A773D10F899;
	Tue,  3 Nov 2026 21:41:09 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012040.outbound.protection.outlook.com
 [40.93.195.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3E910F898
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 21:38:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d3H16E/1bM3lkaH+/ReK8EfsnKnK3ntElsrbZfOy7NuTJeQGLNjjcVEumdz7DoV1VpgV2FhoTuOfny5+FOWYaqAZorPqVpEEbd61YYP+QSQOuiCkKix1VTBEF7+jKSoKxAQPzcjQ9+R9Wuv/9CH4+RwQzMJ8xZGvV+OS/YPaiDN5kRzpakGvpagyPh7a9s8dKtAWIG68yoRfl34oCsCT26j7M/U9QvyhAm8T4DqtJ7DeaqJHc4s1FVxqqlXjfQ4GzKlpHeOA6qnvxyawH2naoJqLrTVmpS7v6iFnslUAsIr355uV+8GzXxneAm+RDAJbdw/WSBCM6tvFe5K0jrI3tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=puMle4r6PussUT9TnqByUT3Bd2PwkWOTDulwNP0fvas=;
 b=GkiHPVg82+iYn4t4gj4929H8IvXxjr9Ow2YNbOJ/iP+VUqDuXm4fqOqiqV7JAQ4wauQ4ivYVyaM2X4w13y0iwFJn0cxCvN/j2CB3Nl6CmPlZc2Xk/gfbJ2zR4Iu0QR4+nYEymuJ0Bc8oUvMgwiOx6tJrkyiz4WJ9DlDrueMSUP6XuF3h65XYlqJRbCPTipOreCtHhBmBotaFXS2Isrq393OIVBsSTQm4xrEZwyEcFVTNCTQs4sPbAr4uS04XxhjgSlwztQB4ZcRSxYbslYOvkWQZu3lBqVF2/TyE6q0QQE0Iky1PtLJbVZSKkxVJoIgvcLtdEUtu03F4nRJoCf5AZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=puMle4r6PussUT9TnqByUT3Bd2PwkWOTDulwNP0fvas=;
 b=2txrTtWihyqSwtceeeESgf4/NcNgZwobJ6B66CHgwUNzWGXuwJddUtkjmKh/NXHa4H+QjrQ2NsS/qOU9YFNnnf6CyMqYDLDteVeIK07x+YqFYMvQKv5a3smAsxZZjtxkaWTVpBMOhZNFU5NiEBzlYHWgWI5y2zBdsh38nw9NPlQ=
Received: from BN0PR02CA0027.namprd02.prod.outlook.com (2603:10b6:408:e4::32)
 by LY0PR12MB250945.namprd12.prod.outlook.com (2603:10b6:404:214::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 21:38:21 +0000
Received: from BN1PEPF00018075.namprd04.prod.outlook.com
 (2603:10b6:408:e4:cafe::7b) by BN0PR02CA0027.outlook.office365.com
 (2603:10b6:408:e4::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Tue, 3
 Nov 2026 21:38:21 +0000
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
 15.21.592.5 via Frontend Transport; Tue, 3 Nov 2026 21:38:21 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 3 Nov
 2026 15:38:19 -0600
Received: from hwentlanryzen (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 3 Nov 2026 15:38:19 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v1 06/10] tests/kms_colorop_dma: test implicit fencing of DMA
 3D LUT framebuffers
Date: Tue, 3 Nov 2026 16:37:56 -0500
Message-ID: <20261103213800.618130-7-harry.wentland@amd.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103213800.618130-1-harry.wentland@amd.com>
References: <20261103213800.618130-1-harry.wentland@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018075:EE_|LY0PR12MB250945:EE_
X-MS-Office365-Filtering-Correlation-Id: 23554bf4-87af-47ee-8d97-08df39f2c818
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|6133799003|10067099003|18002099003|22082099003|3023799007|56012099006|261022113327099003|261022105027099003|11063799006|261022075727099003|261021130227099003|261009223027099003|261021123027099003|261021135927099003|261028144727099003|261102123227099003|261022115727099003|261026140227099003|261026130827099003|261026135527099003|261021133027099003|261026121527099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: lEZJjN/d7NxW5+Tt084Sn5XN6GQCusnS39Dp768JKBzOFz3wJicSdKCXlklGekQ4kqbI0wJy0o/xRT0frdkHAbVGetA2OZU9RhlmFHEWU1icTC8rEn7v7Aph6KHQ5SyikQG2/Q4H79F4bFonCarmGeIKgdtL51DpdyEyntMaaSewlUh91yqSrAOa6oGYToJr2KA2wdInpIH6k9F1+Q7W434+p5ME7Oj90s48210qpJygzhkRuJ96P82UM1UX0ViAX2W51TEkt5r+Nxbv8SxexfdqyoTieF5rYE7k/leM1z/ZLtfuwWTXRp4i/4yu1kYM/kTDBNlG9ZCp6gVVONm7h9P22TOvB2mMVQijmBTBJmOQDV0ESW3t+H+cjctc4jOW2RYm7YNmp5N86kf+0CKcFUpURuNc9grxyPZA4JGnW9xrr8tBN1QDli/QEpgHVDTOtluKSd2f39Gp/ZFieZlRCYDpHv1SgrbsZul8FCf9QV776SRkNV9G0I1hvATPSTTw1/9OtTpXfBil8gT2Ipxs+tstKjTXDUxglOLqUzggc4gp/ZAhHEcsbrR2ehpsQDsFhhzSJ/yb0vM/PYW14j6IcFPXnWQgZ4KrJMO/hVFeZHIqDh2LMyUS+3WILdXvjTWevepoPaOYRgWL436a3d8M7SLyBgDHojiB1nfrAk0N+Zf6ED5n+/whODaYUmBNbYZ/PuXkH6O2s/F5wA4K8FlvMg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(6133799003)(10067099003)(18002099003)(22082099003)(3023799007)(56012099006)(261022113327099003)(261022105027099003)(11063799006)(261022075727099003)(261021130227099003)(261009223027099003)(261021123027099003)(261021135927099003)(261028144727099003)(261102123227099003)(261022115727099003)(261026140227099003)(261026130827099003)(261026135527099003)(261021133027099003)(261026121527099003)(261021121427099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VEEtFrYLWblrqFuo+BDBi11E86HXkFa+RBRP+X6Tu+LxWw0S0pfyFiWGczKXetax6STB4Wt9KIDnVUdc147TKtGHkJxe+f3Xt3u+TEUNVuYZi6tdUrIdd074TdBQOhzJSGT4Dqt+z/Pph1OWPz2Fv4K+njS2otowN46nwwTd61eggIxM6XJVBSK9vF8tHH/PbGkFI9t7mh1/oqqav8M5xX3o9LA3G8GxZEXRP8rBb+phZS8xX9iRFOReC14PWf/y+XDrTERiEi9wGtTIUtQUlMfvidB4xcUXqeS6beaPfSdxCbmRtEcYb8DhkkRkkjCX7LISqc4rM4GvXjv+rFKDG+kndn1MlxPUpd00olFW7knoYOGLyXTej7WfxMmfqje9FXVZ334+piH0hI5EMZ3/7kBijDDyQKhbh9VfruoYTY4BC0iOOd7T4aun8tUFOhWb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 21:38:21.1401 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23554bf4-87af-47ee-8d97-08df39f2c818
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00018075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR12MB250945
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

The display must wait for a DMA 3D LUT framebuffer's producer before
consuming its contents. Existing LUT output tests populate the buffer
before committing and do not exercise an outstanding implicit write
fence.

Switch between distinct LUTs with an unsignaled write fence attached to
the new LUT BO. Check that CRTC and writeback completion remain pending
until the fence signals, then compare the captured output against the
new LUT's software reference. Install an exit handler that signals the
producer fence if the test fails while the commit is pending.

Keep producer-fence setup and release indexed so follow-up tests can add
independent producers without duplicating synchronization logic.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop_dma.c | 288 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 288 insertions(+)

diff --git a/tests/kms_colorop_dma.c b/tests/kms_colorop_dma.c
index 5fb127de60eb..e8cbbf58dd60 100644
--- a/tests/kms_colorop_dma.c
+++ b/tests/kms_colorop_dma.c
@@ -3,6 +3,7 @@
  * Copyright 2025 Advanced Micro Devices, Inc.
  */
 
+#include "dmabuf_sync_file.h"
 #include "sw_sync.h"
 #include "kms_colorop_helper.h"
 
@@ -21,6 +22,15 @@
  * Mega feature: General Display Features
  * Test category: functionality test
  *
+ * SUBTEST: plane-3dlut_dma-implicit-fence
+ * Description: A commit switching to a DMA 3D LUT framebuffer with an
+ *              unsignaled implicit write fence must not complete until that
+ *              fence signals, and must then apply the new LUT
+ * Driver requirement: vkms, amdgpu
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
  */
 
 typedef struct {
@@ -187,6 +197,232 @@ static void lut3d_dma_negative_test(igt_display_t *display,
 		     lut3d_dma_neg_names[neg]);
 }
 
+#define LUT3D_DMA_FENCE_TIMEOUT_MS	1000
+#define LUT3D_DMA_FENCE_PENDING_FRAMES	10
+#define LUT3D_DMA_FENCE_PENDING_MIN_MS	200
+
+/* A differs visibly from B, so a stale LUT fails the comparison. */
+static const kms_colorop_t lut3d_dma_fence_lut_a = {
+	.type = KMS_COLOROP_3DLUT_DMA,
+	.lut3d = &igt_3dlut_17_green_only,
+	.lut3d_info = {
+		.size = 17,
+		.interpolation = DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
+	},
+	.name = "3dlut DMA passing only green channel (RGB order)",
+};
+
+static const kms_colorop_t lut3d_dma_fence_lut_b = {
+	.type = KMS_COLOROP_3DLUT_DMA,
+	.lut3d = &igt_3dlut_17_rgb,
+	.lut3d_info = {
+		.size = 17,
+		.interpolation = DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
+	},
+	.name = "3dlut DMA with traversal order RGB",
+	.transform = &igt_color_3dlut_17_12_rgb,
+};
+
+enum lut3d_dma_producer {
+	LUT3D_DMA_PRODUCER_LUT,
+	LUT3D_DMA_NUM_PRODUCERS,
+};
+
+static const char * const lut3d_dma_producer_desc[] = {
+	[LUT3D_DMA_PRODUCER_LUT] = "DMA 3D LUT",
+};
+
+static struct {
+	int timelines[LUT3D_DMA_NUM_PRODUCERS];
+	bool needs_signal[LUT3D_DMA_NUM_PRODUCERS];
+} pending_producer_fences = {
+	.timelines = { -1 },
+};
+
+static int create_producer_fence(enum lut3d_dma_producer producer)
+{
+	int timeline = sw_sync_timeline_create();
+
+	pending_producer_fences.timelines[producer] = timeline;
+	pending_producer_fences.needs_signal[producer] = true;
+
+	return sw_sync_timeline_create_fence(timeline, 1);
+}
+
+static void signal_producer_fence(enum lut3d_dma_producer producer)
+{
+	if (pending_producer_fences.timelines[producer] < 0 ||
+	    !pending_producer_fences.needs_signal[producer])
+		return;
+
+	sw_sync_timeline_inc(pending_producer_fences.timelines[producer], 1);
+	pending_producer_fences.needs_signal[producer] = false;
+}
+
+static void signal_pending_producer_fences(int sig)
+{
+	for (int i = 0; i < LUT3D_DMA_NUM_PRODUCERS; i++) {
+		signal_producer_fence(i);
+		pending_producer_fences.timelines[i] = -1;
+	}
+}
+
+static void destroy_producer_fences(void)
+{
+	for (int i = 0; i < LUT3D_DMA_NUM_PRODUCERS; i++) {
+		int timeline = pending_producer_fences.timelines[i];
+
+		if (timeline < 0)
+			continue;
+
+		signal_producer_fence(i);
+		pending_producer_fences.timelines[i] = -1;
+		close(timeline);
+	}
+}
+
+static void attach_implicit_write_fence(int drm_fd, uint32_t gem_handle,
+					int fence)
+{
+	int dmabuf = prime_handle_to_fd(drm_fd, gem_handle);
+
+	dmabuf_import_sync_file(dmabuf, DMA_BUF_SYNC_WRITE, fence);
+	close(dmabuf);
+}
+
+/*
+ * Switch from LUT A to LUT B behind an unsignaled implicit producer fence.
+ * The commit must stay pending until the fence signals, and the captured
+ * output must then reflect LUT B.
+ *
+ * The exit handler signals the producer fence if the test fails while the
+ * commit is pending.
+ */
+static void lut3d_dma_fence_test(igt_display_t *display,
+				 igt_output_t *output,
+				 igt_plane_t *plane,
+				 igt_fb_t *input_fb,
+				 igt_fb_t *output_fb)
+{
+	kms_colorop_t lut_a = lut3d_dma_fence_lut_a;
+	kms_colorop_t lut_b = lut3d_dma_fence_lut_b;
+	kms_colorop_t *colorops_a[] = { &lut_a, NULL };
+	kms_colorop_t *colorops_b[] = { &lut_b, NULL };
+	enum lut3d_dma_producer order[LUT3D_DMA_NUM_PRODUCERS];
+	int fences[LUT3D_DMA_NUM_PRODUCERS] = { -1 };
+	int producer_pending[LUT3D_DMA_NUM_PRODUCERS] = { };
+	int crtc_pending[LUT3D_DMA_NUM_PRODUCERS] = { };
+	int wb_pending[LUT3D_DMA_NUM_PRODUCERS] = { };
+	igt_colorop_t *color_pipeline;
+	igt_crtc_t *crtc = igt_output_get_driving_crtc(output);
+	drmModeModeInfo *mode = igt_output_get_mode(output);
+	igt_fb_t sw_transform_fb;
+	int out_fence = -1, wb_fence = -1;
+	int pending_ms, ret;
+	int crtc_done = -1, wb_done = -1;
+	bool match = false;
+
+	igt_require_sw_sync();
+	igt_install_exit_handler(signal_pending_producer_fences);
+	igt_assert(crtc);
+
+	order[0] = LUT3D_DMA_PRODUCER_LUT;
+	pending_ms = max_t(int, LUT3D_DMA_FENCE_PENDING_MIN_MS,
+			   LUT3D_DMA_FENCE_PENDING_FRAMES * 1000 /
+			   (mode->vrefresh ? mode->vrefresh : 60));
+
+	igt_plane_set_color_pipeline(plane, NULL);
+	igt_plane_set_fb(plane, input_fb);
+
+	color_pipeline = get_color_pipeline(display, plane, colorops_a);
+	igt_skip_on(!color_pipeline);
+	igt_assert(get_color_pipeline(display, plane, colorops_b) == color_pipeline);
+
+	ret = igt_create_fb(display->drm_fd, input_fb->width, input_fb->height,
+			    output_fb->drm_format, DRM_FORMAT_MOD_LINEAR,
+			    &sw_transform_fb);
+	igt_assert_lte(0, ret);
+	apply_transforms(colorops_b, input_fb, &sw_transform_fb);
+
+	/* Establish LUT A as the current state. */
+	set_color_pipeline(display, plane, colorops_a, color_pipeline);
+	igt_output_set_writeback_fb(output, output_fb);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_get_and_wait_out_fence(output);
+
+	/* Stage LUT B; its contents are written and unmapped here. */
+	set_color_pipeline(display, plane, colorops_b, color_pipeline);
+
+	fences[LUT3D_DMA_PRODUCER_LUT] = create_producer_fence(LUT3D_DMA_PRODUCER_LUT);
+	attach_implicit_write_fence(display->drm_fd, lut_b.lut3d_dma_fb.gem_handle,
+				    fences[LUT3D_DMA_PRODUCER_LUT]);
+
+	igt_output_set_writeback_fb(output, output_fb);
+	igt_crtc_request_out_fence(crtc);
+
+	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_NONBLOCK, NULL);
+
+	if (ret == 0) {
+		out_fence = crtc->out_fence_fd;
+		wb_fence = output->writeback_out_fence_fd;
+		crtc->out_fence_fd = -1;
+		output->writeback_out_fence_fd = -1;
+	}
+
+	if (ret == 0) {
+		crtc_pending[0] = sync_fence_wait(out_fence, pending_ms);
+		wb_pending[0] = sync_fence_status(wb_fence);
+		producer_pending[0] = sync_fence_status(fences[order[0]]);
+	}
+
+	signal_producer_fence(order[0]);
+
+	if (ret == 0) {
+		crtc_done = sync_fence_wait(out_fence, LUT3D_DMA_FENCE_TIMEOUT_MS);
+		wb_done = sync_fence_wait(wb_fence, LUT3D_DMA_FENCE_TIMEOUT_MS);
+		close(out_fence);
+		close(wb_fence);
+	}
+
+	destroy_producer_fences();
+	close(fences[LUT3D_DMA_PRODUCER_LUT]);
+
+	igt_assert_f(ret == 0, "nonblocking commit of the fenced DMA 3D LUT failed: %s\n",
+		     strerror(-ret));
+
+	igt_assert_f(crtc_done == 0, "commit did not complete after the producer "
+		     "fences signaled: %s\n", strerror(-crtc_done));
+	igt_assert_f(wb_done == 0, "writeback did not complete after the producer "
+		     "fences signaled: %s\n", strerror(-wb_done));
+
+	if (data.dump_check) {
+		igt_dump_fb(display, &sw_transform_fb, ".", "sw_transform");
+		igt_dump_fb(display, output_fb, ".", "output");
+	}
+	match = compare_with_bracket(&sw_transform_fb, output_fb);
+
+	reset_colorops(colorops_b);
+	igt_plane_set_color_pipeline(plane, NULL);
+	igt_plane_set_fb(plane, input_fb);
+	igt_output_set_writeback_fb(output, output_fb);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_get_and_wait_out_fence(output);
+
+	igt_remove_fb(display->drm_fd, &lut_a.lut3d_dma_fb);
+	igt_remove_fb(display->drm_fd, &lut_b.lut3d_dma_fb);
+	igt_remove_fb(display->drm_fd, &sw_transform_fb);
+
+	igt_assert_f(producer_pending[0] == 0, "DMA 3D LUT producer fence signaled "
+		     "before the test released it\n");
+	igt_assert_f(crtc_pending[0] == -ETIME, "commit completed while the DMA 3D "
+		     "LUT producer fence was unsignaled\n");
+	igt_assert_f(wb_pending[0] == 0, "writeback completed while the DMA 3D "
+		     "LUT producer fence was unsignaled\n");
+
+	igt_assert_f(match, "output does not reflect the DMA 3D LUT committed "
+		     "behind the implicit fence\n");
+}
+
 static int opt_handler(int option, int option_index, void *_data)
 {
 	switch (option) {
@@ -291,6 +527,58 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 		}
 	}
 
+	/* DMA 3D LUT framebuffer synchronization tests */
+	{
+		igt_output_t *output;
+		igt_plane_t *plane;
+		igt_fb_t input_fb, output_fb;
+		unsigned int fb_id;
+		drmModeModeInfo mode;
+
+		igt_subtest_group() {
+			igt_fixture() {
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
+			igt_describe("A commit switching to a DMA 3D LUT framebuffer with an "
+				     "unsignaled implicit write fence must not complete until "
+				     "that fence signals, and must then apply the new LUT");
+			igt_subtest("plane-3dlut_dma-implicit-fence")
+				lut3d_dma_fence_test(&display, output, plane,
+						     &input_fb, &output_fb);
+
+			igt_fixture() {
+				igt_detach_crtc(&display, output);
+				igt_remove_fb(display.drm_fd, &input_fb);
+				igt_remove_fb(display.drm_fd, &output_fb);
+			}
+		}
+	}
+
 	igt_fixture() {
 		igt_display_fini(&display);
 		drm_close_driver(display.drm_fd);
-- 
2.56.0

