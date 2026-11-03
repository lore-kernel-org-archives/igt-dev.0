Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57F4606A332
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 21:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=suox4w1g
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5663E10F8A1;
	Tue,  3 Nov 2026 21:46:21 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010024.outbound.protection.outlook.com
 [40.93.198.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D48910F899
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 21:38:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JKwZPBpjuGONo1fty9IpiV1N/YQC3c7v1EDaBda4KqEqUmq1+VWCLYG1aQ77y6YqSpEL0OrAlk233VVDzTiAuYRjG/Oc+Loqu+r2Ms1AH8Qezv7aSAH6Zuo09ddlzV2YDGPylMOdx8Ie2yQCUeuNf42kBMG23q/X6QWxMQVVzvct3Nfublhjr+ZNWDv5koMhwQqabPoMb9dJMXaBHeUxKwzhDP2F0FbqCzjHJZlNad7HwPNNBDh47TJpDJRO1dqlMdb9H5zuRjtoIdx0Ctc3pTk3uLwiBP4kKTxo8SgzYzqQihJvX+3maTFNRF45w3Vbg/hU1IbHhyl1d4H0TD07og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8iiA08zKbjefpV35EXow0cGD+tkPJl701wt86i5pldw=;
 b=AUPhc8ysuNGNkBMNlXtFPoBDIciqfV5ILBFoDwNnVhm3SLSbpFiw/NzFosbzaalYB5h0ekXLvxUrr317/q/XGh+cmMGkXtf/ofKHZQCIv39KSTCJhXv7Ssyey674ljQatSy3L3mVlfjokBB1/WBcb7XhIdfoLRjQdXaC6u9lczaZtZv8Sd/aUtBRAzH4kS7jbWpVGlmKDvDZmuenq0RknsJWy9lgqrICQZO2Qw2+Qi1uzeBj8PlRTUqYhGXABXGQzZG6Fz/OLBAF/P5pOSWxm/OQpwhgjui+5k6ZpZXBT1N65Qxu9KVF7CeEE8erH4xqpxDHFjSiz7WizkA9eMF58A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8iiA08zKbjefpV35EXow0cGD+tkPJl701wt86i5pldw=;
 b=suox4w1gBDCfuuUn+Gu6yJuQZyySxWDlrwzenf5qiOg1Zi7W+qPVeaa47aLWlYB3h+Q0IIkPebgIfzAHHjhiUOI7B9X+C7OAA2eZ7/EbS8Oxf8QYlDzgqOQJduuyYClGq5F1ypiHvQV3y0UsOPf4dohE+I+JLUXkgngxme1j1do=
Received: from BN0PR02CA0012.namprd02.prod.outlook.com (2603:10b6:408:e4::17)
 by CH8PR12MB9741.namprd12.prod.outlook.com (2603:10b6:610:27a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 21:38:24 +0000
Received: from BN1PEPF00018075.namprd04.prod.outlook.com
 (2603:10b6:408:e4:cafe::70) by BN0PR02CA0012.outlook.office365.com
 (2603:10b6:408:e4::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Tue, 3
 Nov 2026 21:38:23 +0000
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
 15.21.592.5 via Frontend Transport; Tue, 3 Nov 2026 21:38:23 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 3 Nov
 2026 15:38:21 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 3 Nov
 2026 15:38:21 -0600
Received: from hwentlanryzen (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 3 Nov 2026 15:38:20 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v1 10/10] tests/kms_colorop_dma: test DMA 3D LUT framebuffer
 removal
Date: Tue, 3 Nov 2026 16:38:00 -0500
Message-ID: <20261103213800.618130-11-harry.wentland@amd.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103213800.618130-1-harry.wentland@amd.com>
References: <20261103213800.618130-1-harry.wentland@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018075:EE_|CH8PR12MB9741:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d78e819-dd9c-4747-b18e-08df39f2c9bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|10067099003|18002099003|22082099003|3023799007|56012099006|11063799006|261021121427099003|261022075727099003|261009223027099003|261026140227099003|261102123227099003|261102130727099003|261021123027099003|261028144727099003|261026121527099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: QdEqa2hZN097f2lFRyNRofaODp7AIiBgeZIDFFk1f5FSYMWQKJwYJ2PHPP19wWy6dwh6+vL36adD8fmXgGaxjBMVI7jMzeGX+YK+0y+ZH31cSAFAAxNmZfN/0h4+a0Y9gvGnSFKnTU6pEGtSqxGwrueJRgm5om3KhcMCuDlZZbQsYV86Z/LwCGaS/1fvm/LFoGsr6nJnq+b+jk/dxuUlkJgWyXeJr5Ab04QUFYrD+WniKLgO/g7dFLshJyt1jaiKCXGDZfZsknpN4lLk2D5clJGyAg7jIs+gOdgPYuY4EFfKE77HvhYTld5iqVL0GH/99F1FSBsCBceCBpgtXu72ht0bVYLu5FsKbIeRZh6gtiDKlpW/ly6QMnS31HTzTsgOiiBL97se8Fw+Gf2ZoAnzC2zvBA1PCqtuxebFiWoXo2wuikA9co5WJjiG1hzEyBFBLmLnaS0fGboyfaY7GYB+/IRxrPlLrorDNHWX6xK0QazkvLzuasHGheaVEGN4jfhGGQN8GBR5jUdFgYFN8LJSenajLndpqRQZlj3zur4b0cKrg0uxIot4GbVAJugG1M17vpoFuzHHaX/rB3Moa7DtWS6vmDlxvfvpQt9b2pgwdgRB74Lp+ih97TZtG/Pf5OKbZCwOylAfv1qsE6KhtAMY1uX6hOLhQ6hUrjko0h9p92dwGDKn7/CP1+siEHwpS+qTvsjAVDygBBzm/gMII1P3FA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(10067099003)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(261021121427099003)(261022075727099003)(261009223027099003)(261026140227099003)(261102123227099003)(261102130727099003)(261021123027099003)(261028144727099003)(261026121527099003)(261022105027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 87/FzP5jIcZPPHzCgoWc+BBQdd3xs8SiBJ0udbvFACF4ocPcW8ktoCEGDViJNjrvTp2q1+Lhl2uacYsFaxeXVQg2wow3Eus2sAYdl5BJk+UFRbm0mQJ7sz22JuN5zvi0CqGaW0KzcehOUtAHxfxMbSYw5FCbiSsg9zJ1yyycDeeBNvV4XCJSK1f8RRCBLdqq9acUlnVrwVY28l25Ahxx9L6ijPPXJPyNMErLdg6nNsZumddLRDy79Luc9CmVmEZ2Wp8Yma18dLw+3/9WXNrnlM+a3UyGW4Q1sWxu00jN77nDvAdEOU4fBHL0NSXZzvJjxhfuIRkbr6TzP+n4oV2a4tuq8FBIT3IN7LD/qGSEfowTLfPCMy+VZsGezgQLgO3v0Upq2AJBk7PUQCs4r7peVHOa1KZ2yBrpCMtB7jHXxxyIb/JdRKf7orhazpfJeWp9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 21:38:23.8841 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d78e819-dd9c-4747-b18e-08df39f2c9bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00018075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9741
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

A DMA 3D LUT colorop references its LUT through a framebuffer, so the
LUT must follow the framebuffer lifetime rules rather than those of the
buffer handles. Add subtests that make the LUT active and then:

- handle-close: export and close a DMA-BUF and close the GEM handle.
  The framebuffer keeps the buffer alive, so the LUT stays active and
  can be selected again after being replaced.

- closefb: close the framebuffer with CLOSEFB. The LUT stays active
  until it is replaced.

- rmfb: remove the framebuffer with RMFB. The colorop is bypassed with
  FB_ID cleared, the removed ID is rejected, and a new LUT is accepted.

Plane-only flips after each step check through writeback that the
removal didn't change the output.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop_dma.c | 169 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 163 insertions(+), 6 deletions(-)

diff --git a/tests/kms_colorop_dma.c b/tests/kms_colorop_dma.c
index ed078316f1bb..d8432b0c2242 100644
--- a/tests/kms_colorop_dma.c
+++ b/tests/kms_colorop_dma.c
@@ -63,6 +63,32 @@
  * Mega feature: General Display Features
  * Test category: functionality test
  *
+ * SUBTEST: plane-3dlut_dma-handle-close
+ * Description: Closing the GEM handle and a DMA-BUF file descriptor of an
+ *              active DMA 3D LUT buffer must not affect its framebuffer,
+ *              which stays active and can be reused
+ * Driver requirement: vkms, amdgpu
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: plane-3dlut_dma-closefb
+ * Description: CLOSEFB of an active DMA 3D LUT framebuffer must keep the
+ *              LUT active until it is replaced
+ * Driver requirement: vkms, amdgpu
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: plane-3dlut_dma-rmfb
+ * Description: RMFB of an active DMA 3D LUT framebuffer must bypass the
+ *              colorop and clear its FB_ID, reject the removed framebuffer,
+ *              and accept a new LUT
+ * Driver requirement: vkms, amdgpu
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
  */
 
 typedef struct {
@@ -287,7 +313,7 @@ static struct {
 	int timelines[LUT3D_DMA_NUM_PRODUCERS];
 	bool needs_signal[LUT3D_DMA_NUM_PRODUCERS];
 } pending_producer_fences = {
-	.timelines = { -1 },
+	.timelines = { -1, -1 },
 };
 
 static int create_producer_fence(enum lut3d_dma_producer producer)
@@ -350,7 +376,7 @@ static void attach_implicit_write_fence(int drm_fd, uint32_t gem_handle,
  * pending until every producer fence signals, and the captured output must
  * then reflect LUT B.
  *
- * The exit handler signals the producer fence if the test fails while the
+ * The exit handler signals the producer fences if the test fails while the
  * commit is pending.
  */
 static void lut3d_dma_fence_test(igt_display_t *display,
@@ -365,7 +391,7 @@ static void lut3d_dma_fence_test(igt_display_t *display,
 	kms_colorop_t *colorops_a[] = { &lut_a, NULL };
 	kms_colorop_t *colorops_b[] = { &lut_b, NULL };
 	enum lut3d_dma_producer order[LUT3D_DMA_NUM_PRODUCERS];
-	int fences[LUT3D_DMA_NUM_PRODUCERS] = { -1 };
+	int fences[LUT3D_DMA_NUM_PRODUCERS] = { -1, -1 };
 	int producer_pending[LUT3D_DMA_NUM_PRODUCERS] = { };
 	int crtc_pending[LUT3D_DMA_NUM_PRODUCERS] = { };
 	int wb_pending[LUT3D_DMA_NUM_PRODUCERS] = { };
@@ -445,10 +471,12 @@ static void lut3d_dma_fence_test(igt_display_t *display,
 		if (in_fence != fences[LUT3D_DMA_PRODUCER_LUT])
 			close(in_fence);
 	} else {
-		attach_implicit_write_fence(display->drm_fd, lut_b.lut3d_dma_fb.gem_handle,
+		attach_implicit_write_fence(display->drm_fd,
+					    lut_b.lut3d_dma_fb.gem_handle,
 					    fences[LUT3D_DMA_PRODUCER_LUT]);
 		if (tc->fence_scanout)
-			attach_implicit_write_fence(display->drm_fd, scanout_b.gem_handle,
+			attach_implicit_write_fence(display->drm_fd,
+						    scanout_b.gem_handle,
 						    fences[LUT3D_DMA_PRODUCER_SCANOUT]);
 	}
 
@@ -529,7 +557,7 @@ static void lut3d_dma_fence_test(igt_display_t *display,
 	}
 
 	igt_assert_f(match, "output does not reflect the DMA 3D LUT committed "
-		     "behind the implicit fence\n");
+		     "behind the producer fences\n");
 }
 
 static void lut3d_dma_commit(igt_display_t *display, igt_crtc_t *crtc,
@@ -739,6 +767,113 @@ static void lut3d_dma_transition_test(igt_display_t *display,
 	lut3d_dma_setup_fini(&s, display);
 }
 
+enum lut3d_dma_lifetime {
+	LUT3D_DMA_HANDLE_CLOSE,
+	LUT3D_DMA_CLOSEFB,
+	LUT3D_DMA_RMFB,
+};
+
+static void lut3d_dma_lifetime_test(igt_display_t *display,
+				   igt_output_t *output,
+				   igt_plane_t *plane,
+				   igt_fb_t *input_fb,
+				   igt_fb_t *output_fb,
+				   enum lut3d_dma_lifetime action)
+{
+	const uint32_t flags = DRM_MODE_ATOMIC_NONBLOCK;
+	bool bypassed = action == LUT3D_DMA_RMFB;
+	struct lut3d_dma_setup s;
+	igt_colorop_t *colorop;
+	igt_fb_t *lut_fb;
+	uint32_t lut_fb_id;
+	int fd = display->drm_fd;
+	int i, ret;
+
+	lut3d_dma_setup_init(&s, display, plane, input_fb, output_fb);
+	colorop = s.lut_b.colorop;
+	lut_fb = &s.lut_b.lut3d_dma_fb;
+
+	igt_plane_set_fb(plane, input_fb);
+	set_color_pipeline(display, plane, s.colorops_a, s.pipeline);
+	lut3d_dma_check_transition(display, output, &s.reference_a, output_fb,
+				   DRM_MODE_ATOMIC_ALLOW_MODESET, "initial LUT A");
+	set_color_pipeline(display, plane, s.colorops_b, s.pipeline);
+	lut3d_dma_check_transition(display, output, &s.reference_b[0], output_fb,
+				   flags, "replace A with B");
+	lut_fb_id = lut_fb->fb_id;
+
+	switch (action) {
+	case LUT3D_DMA_HANDLE_CLOSE:
+		close(prime_handle_to_fd(fd, lut_fb->gem_handle));
+		gem_close(fd, lut_fb->gem_handle);
+		break;
+	case LUT3D_DMA_CLOSEFB: {
+		struct drm_mode_closefb arg = { .fb_id = lut_fb_id };
+
+		ret = igt_ioctl(fd, DRM_IOCTL_MODE_CLOSEFB, &arg) ? -errno : 0;
+		igt_require_f(ret != -EINVAL, "CLOSEFB is not supported\n");
+		igt_assert_eq(ret, 0);
+		break;
+	}
+	case LUT3D_DMA_RMFB:
+		igt_assert_eq(drmModeRmFB(fd, lut_fb_id), 0);
+		break;
+	}
+
+	igt_assert_eq(igt_colorop_get_prop(display, colorop, IGT_COLOROP_BYPASS),
+		      bypassed);
+	igt_assert_eq(igt_colorop_get_prop(display, colorop, IGT_COLOROP_FB_ID),
+		      bypassed ? 0 : lut_fb_id);
+
+	for (i = 0; i < 4; i++) {
+		int index = (i + 1) % ARRAY_SIZE(s.inputs);
+
+		/* Leave the colorop as the removal left it. */
+		igt_assert_eq(colorop->changed, 0);
+		igt_plane_set_fb(plane, s.inputs[index]);
+		lut3d_dma_check_transition(display, output,
+					   bypassed ? s.inputs[index] :
+						      &s.reference_b[index],
+					   output_fb, flags, "plane-only flip");
+	}
+
+	if (action == LUT3D_DMA_RMFB) {
+		igt_colorop_set_prop_value(colorop, IGT_COLOROP_FB_ID, lut_fb_id);
+		igt_colorop_set_prop_value(colorop, IGT_COLOROP_BYPASS, 0);
+		ret = igt_display_try_commit_atomic(display,
+						    DRM_MODE_ATOMIC_TEST_ONLY,
+						    NULL);
+		igt_assert_f(ret != 0,
+			     "removed DMA 3D LUT framebuffer was accepted\n");
+	}
+
+	igt_colorop_set_prop_value(colorop, IGT_COLOROP_FB_ID,
+				   s.lut_a.lut3d_dma_fb.fb_id);
+	igt_colorop_set_prop_value(colorop, IGT_COLOROP_BYPASS, 0);
+	lut3d_dma_check_transition(display, output, &s.reference_a, output_fb,
+				   flags, "replace with LUT A");
+
+	if (action == LUT3D_DMA_HANDLE_CLOSE) {
+		igt_colorop_set_prop_value(colorop, IGT_COLOROP_FB_ID, lut_fb_id);
+		lut3d_dma_check_transition(display, output, &s.reference_b[0],
+					   output_fb, flags,
+					   "reuse LUT B without a GEM handle");
+	}
+
+	reset_colorops(s.colorops_b);
+	igt_plane_set_color_pipeline(plane, NULL);
+	lut3d_dma_check_transition(display, output, input_fb, output_fb,
+				   DRM_MODE_ATOMIC_ALLOW_MODESET, "cleanup");
+
+	/* Release what the test left of LUT B. */
+	if (action == LUT3D_DMA_HANDLE_CLOSE)
+		do_or_die(drmModeRmFB(fd, lut_fb_id));
+	else
+		gem_close(fd, lut_fb->gem_handle);
+	lut_fb->fb_id = 0;
+	lut3d_dma_setup_fini(&s, display);
+}
+
 static int opt_handler(int option, int option_index, void *_data)
 {
 	switch (option) {
@@ -931,6 +1066,28 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 								  nonblock);
 			}
 
+			igt_describe("Closing the GEM handle and a DMA-BUF file "
+				     "descriptor of an active DMA 3D LUT buffer must "
+				     "not affect its framebuffer");
+			igt_subtest("plane-3dlut_dma-handle-close")
+				lut3d_dma_lifetime_test(&display, output, plane,
+							&input_fb, &output_fb,
+							LUT3D_DMA_HANDLE_CLOSE);
+
+			igt_describe("CLOSEFB of an active DMA 3D LUT framebuffer "
+				     "must keep the LUT active until it is replaced");
+			igt_subtest("plane-3dlut_dma-closefb")
+				lut3d_dma_lifetime_test(&display, output, plane,
+							&input_fb, &output_fb,
+							LUT3D_DMA_CLOSEFB);
+
+			igt_describe("RMFB of an active DMA 3D LUT framebuffer "
+				     "must bypass the colorop and clear its FB_ID");
+			igt_subtest("plane-3dlut_dma-rmfb")
+				lut3d_dma_lifetime_test(&display, output, plane,
+							&input_fb, &output_fb,
+							LUT3D_DMA_RMFB);
+
 			igt_fixture() {
 				igt_detach_crtc(&display, output);
 				igt_remove_fb(display.drm_fd, &input_fb);
-- 
2.56.0

