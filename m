Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46533606A324
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 21:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=jU2getIu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E022310E839;
	Tue,  3 Nov 2026 21:42:01 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011016.outbound.protection.outlook.com
 [40.93.194.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8783410F89E
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 21:38:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P6dPty9wSCuv0dX86zD1HQkcV09McNMuAfhGCtkwAPRHEs8zOO2MCbRnctI3njP2fhgbWT3cs9xgy4LwmIDSYJQ0aCcqTmUzfuPVqYjtYB+Un53SFgKhFmyTIXUZZBnLwHRxk3ppwZz+uPQXEDet75QfoaN5OMiInLX1Tdd5Nl8JuSd6wxXvpqxZ6mb0+hpRpMCKgGKkH4DiWOK47XTWX9R0h7JAP6Eu7VzHVU3Mx6oIPl+6kKjw4KmML8jR8P/gLKjfVir35Dk8+AEfnrou7h4UF9IWNg/MqNjgUuqdkF1B5rO129hgj5O/tJmBbzG9hhWqNZIq2f2A9J5mccngLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vF5nyI5no8sHs+Xx6T8je/5GoNnbgYF7dk0zfj5/hzU=;
 b=XGBABLOtqfAHasPnu2/9RwVF/La6J0hQ9mzwNKy65KjhLg6f++K+Kwg2TCTCkgQ7tA3sKjg+aiWWzgPgRPAndNHhFAQ6fcrJcX4nJNPapqB3VFbEbzs8q6VkEcmppBB/DngODSKI87TEghwwFvBXDF6qyQE74KxNC55i+Odtwp2dfDtHugqJnv521cIYDPsR1sX/eb8bi0i2TUTyclyQppWGtgsYJHtMlwzOLjrSrgbcGPfTS54PPNdtKhYzabrXf0vplEfS+8QS+xuC/ejWfnPzZIa9IdJpFZLZAax34vzhdh2Xr+3oXWQIkeHAWc5qYFOJq78qxo36tq9uxKlbJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vF5nyI5no8sHs+Xx6T8je/5GoNnbgYF7dk0zfj5/hzU=;
 b=jU2getIuxG3NY/vI8T1VszWQz6WgB7AOAP11OmADDLkBVbxdTBCOjomPVEYHPR4IIQAH+Ge6cXHp9SYdYINNDK8rogoDNgo2lb/RxIjNgJ/k+OINWKZJw31f1mbQHQ0DGwkBSrBZUaY3dCWvkQoTbRIgU9kPlCu7WffvtWXgyps=
Received: from BN0PR02CA0028.namprd02.prod.outlook.com (2603:10b6:408:e4::33)
 by CH3PR12MB8307.namprd12.prod.outlook.com (2603:10b6:610:12f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 21:38:20 +0000
Received: from BN1PEPF00018075.namprd04.prod.outlook.com
 (2603:10b6:408:e4:cafe::9e) by BN0PR02CA0028.outlook.office365.com
 (2603:10b6:408:e4::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Tue, 3
 Nov 2026 21:38:20 +0000
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
 15.21.592.5 via Frontend Transport; Tue, 3 Nov 2026 21:38:20 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 3 Nov
 2026 15:38:20 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 3 Nov
 2026 15:38:20 -0600
Received: from hwentlanryzen (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 3 Nov 2026 15:38:19 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v1 07/10] tests/kms_colorop_dma: test scanout and DMA 3D LUT
 implicit fences together
Date: Tue, 3 Nov 2026 16:37:57 -0500
Message-ID: <20261103213800.618130-8-harry.wentland@amd.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103213800.618130-1-harry.wentland@amd.com>
References: <20261103213800.618130-1-harry.wentland@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018075:EE_|CH3PR12MB8307:EE_
X-MS-Office365-Filtering-Correlation-Id: f4d5b9ec-c37b-4bc0-1846-08df39f2c7d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|261021123027099003|11063799006|261009223027099003|261026121527099003|261022105027099003|261022075727099003|56012099006|261102123227099003|261021121427099003|261026140227099003|261028144727099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: GgnJ5OdWNmgV+y7oJR+mH037BB7QzSbyPK8stqqcWvU4RDbJRGdtvk6rw53UlTdWSJBo3JnJ3IbRx9Rp1bYMXN4BoFSvc449bjudg3kEIl458YXjyKOaTYinw8+zD64O9+loC+ndOJp4uQDyVx/vD15MoUzZUirbns+s1h7qa2KlsSuZoWW6CtcoG7/3Z219dx4jo8f9mRf/sNUBXYBlrNmFBRTvLufNxnSVBRvx25PLrC2/jSojXcvGu8IAtOzawfNW9zsaSpW3nDuFoNM5eYIWshtGsRq4yJh4SUZ5luwOmPHxbRIQcOoDnAJQ3AbLAA4IeS9O+VTcgNQAhx+hjiI/QJOaZ9tlxyGvNgypFV7HnWaYM7z2lkISM65QxZaOwuTIo9O/qse8Loj9Htdo7VVVcduIQOhDfH7kYN9iIS6JCoX354Vv8kbOllcosmOkhKEqI+/+CIrhYzPiU4IiUaMXqAnT664yOAEhSKhe8PwkVNDva1yZzL60dVa9l0Gq8S2MaYrMnqUYZn2GheTa3tf3lOa62wZ1QH21uyGtGvLOtG8iaMVw/xYUj+rgKFhzJe6o+WykRdyioDJCBVHD8MsZgY1WOvmpSOgN5QD5J0mRFd4+0jp83EMS9nu1HFOzBtpWV/aagMRwja4KB0UazF+WImsywa2O5WDYJeV+S8y0QcWnsr5Ef0XJP7Xz8Zo+p7IwHBsxA9wVxFFmaI8y5g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(261021123027099003)(11063799006)(261009223027099003)(261026121527099003)(261022105027099003)(261022075727099003)(56012099006)(261102123227099003)(261021121427099003)(261026140227099003)(261028144727099003)(10067099003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: pKSPDu+YjOSccNdKLubh+uF7wuFsTJtb0bBFJYIU8wN9hdhLuaRyb92qL6gmRdc6ThicwUzZ5djdJFLswdfRTy9Z2aVViHHuQ55oEbTkNkQ8eVPWIrGQB8tCqe9iNH5UhBV6huePJtMBoDVbbEv/bdOGRvAIl3SPz1ewjsDHemulyhUKWoVlDshEscH1oJExNtma/i7K4wht4Vatz1E9m161At5zdnimgoOn3JWtHsQcPGHvHsbVQ0vSj/bWXeJjZ3DT/AXAm4mHwi0i58wU/dXIUjfaCfsh/ZzKK28IXKzHPd2XCHe50/84WRdFi4jJ7nBh60bfWa6AWQYkkTJurhfsowxQmYGrthxRZ7o3JCteplFYk2va9EFWKZ0a8tsYzPj2VRCaTALAuJ/UF+ZgvDkkM71Z8jiAzqidCZXskvj3/tLK1qXtTs3GW9RmVOZn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 21:38:20.6963 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4d5b9ec-c37b-4bc0-1846-08df39f2c7d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00018075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8307
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

A commit that flips both the scanout framebuffer and the DMA 3D LUT
framebuffer depends on two producers. The display must wait for both,
and the scanout framebuffer's implicit fence must not be mistaken for an
explicit fence that would cause the LUT's implicit write fence to be
ignored.

Generalize the implicit LUT fence test to optionally flip to a copy of
the input framebuffer that carries its own unsignaled implicit write
fence. Release the producer fences one at a time and check that CRTC and
writeback completion stay pending until the last one signals. Cover both
signaling orders.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop_dma.c | 120 +++++++++++++++++++++++++++++++++-------
 1 file changed, 99 insertions(+), 21 deletions(-)

diff --git a/tests/kms_colorop_dma.c b/tests/kms_colorop_dma.c
index e8cbbf58dd60..5fa2934e1721 100644
--- a/tests/kms_colorop_dma.c
+++ b/tests/kms_colorop_dma.c
@@ -31,6 +31,16 @@
  * Mega feature: General Display Features
  * Test category: functionality test
  *
+ * SUBTEST: plane-3dlut_dma-scanout-implicit-fences-signal-lut-first
+ * SUBTEST: plane-3dlut_dma-scanout-implicit-fences-signal-scanout-first
+ * Description: A commit flipping both the scanout and DMA 3D LUT
+ *              framebuffers, each with an unsignaled implicit write fence,
+ *              must not complete until both fences signal, in either order
+ * Driver requirement: vkms, amdgpu
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
  */
 
 typedef struct {
@@ -225,11 +235,25 @@ static const kms_colorop_t lut3d_dma_fence_lut_b = {
 
 enum lut3d_dma_producer {
 	LUT3D_DMA_PRODUCER_LUT,
+	LUT3D_DMA_PRODUCER_SCANOUT,
 	LUT3D_DMA_NUM_PRODUCERS,
 };
 
+static const char * const lut3d_dma_producer_names[] = {
+	[LUT3D_DMA_PRODUCER_LUT] = "lut",
+	[LUT3D_DMA_PRODUCER_SCANOUT] = "scanout",
+};
+
 static const char * const lut3d_dma_producer_desc[] = {
 	[LUT3D_DMA_PRODUCER_LUT] = "DMA 3D LUT",
+	[LUT3D_DMA_PRODUCER_SCANOUT] = "scanout",
+};
+
+struct lut3d_dma_fence_case {
+	/* Also flip to a new scanout FB with its own producer fence. */
+	bool fence_scanout;
+	/* Producer signaled first when there are two. */
+	enum lut3d_dma_producer first;
 };
 
 static struct {
@@ -291,9 +315,11 @@ static void attach_implicit_write_fence(int drm_fd, uint32_t gem_handle,
 }
 
 /*
- * Switch from LUT A to LUT B behind an unsignaled implicit producer fence.
- * The commit must stay pending until the fence signals, and the captured
- * output must then reflect LUT B.
+ * Switch from LUT A to LUT B behind unsignaled producer fences. B's BO always
+ * carries an implicit write fence. With fence_scanout, the plane also flips
+ * to a copy of the input FB whose BO carries an independent implicit write
+ * fence. The commit must stay pending until every producer fence signals,
+ * and the captured output must then reflect LUT B.
  *
  * The exit handler signals the producer fence if the test fails while the
  * commit is pending.
@@ -302,7 +328,8 @@ static void lut3d_dma_fence_test(igt_display_t *display,
 				 igt_output_t *output,
 				 igt_plane_t *plane,
 				 igt_fb_t *input_fb,
-				 igt_fb_t *output_fb)
+				 igt_fb_t *output_fb,
+				 const struct lut3d_dma_fence_case *tc)
 {
 	kms_colorop_t lut_a = lut3d_dma_fence_lut_a;
 	kms_colorop_t lut_b = lut3d_dma_fence_lut_b;
@@ -316,9 +343,9 @@ static void lut3d_dma_fence_test(igt_display_t *display,
 	igt_colorop_t *color_pipeline;
 	igt_crtc_t *crtc = igt_output_get_driving_crtc(output);
 	drmModeModeInfo *mode = igt_output_get_mode(output);
-	igt_fb_t sw_transform_fb;
+	igt_fb_t scanout_b = { }, sw_transform_fb;
 	int out_fence = -1, wb_fence = -1;
-	int pending_ms, ret;
+	int num_producers, pending_ms, ret, i;
 	int crtc_done = -1, wb_done = -1;
 	bool match = false;
 
@@ -326,7 +353,16 @@ static void lut3d_dma_fence_test(igt_display_t *display,
 	igt_install_exit_handler(signal_pending_producer_fences);
 	igt_assert(crtc);
 
-	order[0] = LUT3D_DMA_PRODUCER_LUT;
+	if (tc->fence_scanout) {
+		num_producers = 2;
+		order[0] = tc->first;
+		order[1] = tc->first == LUT3D_DMA_PRODUCER_LUT ?
+			   LUT3D_DMA_PRODUCER_SCANOUT : LUT3D_DMA_PRODUCER_LUT;
+	} else {
+		num_producers = 1;
+		order[0] = LUT3D_DMA_PRODUCER_LUT;
+	}
+
 	pending_ms = max_t(int, LUT3D_DMA_FENCE_PENDING_MIN_MS,
 			   LUT3D_DMA_FENCE_PENDING_FRAMES * 1000 /
 			   (mode->vrefresh ? mode->vrefresh : 60));
@@ -344,6 +380,11 @@ static void lut3d_dma_fence_test(igt_display_t *display,
 	igt_assert_lte(0, ret);
 	apply_transforms(colorops_b, input_fb, &sw_transform_fb);
 
+	/* Same contents as the input, so one reference covers both flips. */
+	if (tc->fence_scanout)
+		igt_assert(igt_fb_convert(&scanout_b, input_fb, input_fb->drm_format,
+					  input_fb->modifier));
+
 	/* Establish LUT A as the current state. */
 	set_color_pipeline(display, plane, colorops_a, color_pipeline);
 	igt_output_set_writeback_fb(output, output_fb);
@@ -354,8 +395,17 @@ static void lut3d_dma_fence_test(igt_display_t *display,
 	set_color_pipeline(display, plane, colorops_b, color_pipeline);
 
 	fences[LUT3D_DMA_PRODUCER_LUT] = create_producer_fence(LUT3D_DMA_PRODUCER_LUT);
+	if (tc->fence_scanout) {
+		fences[LUT3D_DMA_PRODUCER_SCANOUT] =
+			create_producer_fence(LUT3D_DMA_PRODUCER_SCANOUT);
+		igt_plane_set_fb(plane, &scanout_b);
+	}
+
 	attach_implicit_write_fence(display->drm_fd, lut_b.lut3d_dma_fb.gem_handle,
 				    fences[LUT3D_DMA_PRODUCER_LUT]);
+	if (tc->fence_scanout)
+		attach_implicit_write_fence(display->drm_fd, scanout_b.gem_handle,
+					    fences[LUT3D_DMA_PRODUCER_SCANOUT]);
 
 	igt_output_set_writeback_fb(output, output_fb);
 	igt_crtc_request_out_fence(crtc);
@@ -369,13 +419,16 @@ static void lut3d_dma_fence_test(igt_display_t *display,
 		output->writeback_out_fence_fd = -1;
 	}
 
-	if (ret == 0) {
-		crtc_pending[0] = sync_fence_wait(out_fence, pending_ms);
-		wb_pending[0] = sync_fence_status(wb_fence);
-		producer_pending[0] = sync_fence_status(fences[order[0]]);
-	}
+	/* Release the producers one at a time; each step must stay pending. */
+	for (i = 0; i < num_producers; i++) {
+		if (ret == 0) {
+			crtc_pending[i] = sync_fence_wait(out_fence, pending_ms);
+			wb_pending[i] = sync_fence_status(wb_fence);
+			producer_pending[i] = sync_fence_status(fences[order[i]]);
+		}
 
-	signal_producer_fence(order[0]);
+		signal_producer_fence(order[i]);
+	}
 
 	if (ret == 0) {
 		crtc_done = sync_fence_wait(out_fence, LUT3D_DMA_FENCE_TIMEOUT_MS);
@@ -385,7 +438,9 @@ static void lut3d_dma_fence_test(igt_display_t *display,
 	}
 
 	destroy_producer_fences();
-	close(fences[LUT3D_DMA_PRODUCER_LUT]);
+	for (i = 0; i < LUT3D_DMA_NUM_PRODUCERS; i++)
+		if (fences[i] >= 0)
+			close(fences[i]);
 
 	igt_assert_f(ret == 0, "nonblocking commit of the fenced DMA 3D LUT failed: %s\n",
 		     strerror(-ret));
@@ -410,14 +465,21 @@ static void lut3d_dma_fence_test(igt_display_t *display,
 
 	igt_remove_fb(display->drm_fd, &lut_a.lut3d_dma_fb);
 	igt_remove_fb(display->drm_fd, &lut_b.lut3d_dma_fb);
+	igt_remove_fb(display->drm_fd, &scanout_b);
 	igt_remove_fb(display->drm_fd, &sw_transform_fb);
 
-	igt_assert_f(producer_pending[0] == 0, "DMA 3D LUT producer fence signaled "
-		     "before the test released it\n");
-	igt_assert_f(crtc_pending[0] == -ETIME, "commit completed while the DMA 3D "
-		     "LUT producer fence was unsignaled\n");
-	igt_assert_f(wb_pending[0] == 0, "writeback completed while the DMA 3D "
-		     "LUT producer fence was unsignaled\n");
+	for (i = 0; i < num_producers; i++) {
+		/* The last producer is unsignaled at every step. */
+		const char *waiting = lut3d_dma_producer_desc[order[num_producers - 1]];
+
+		igt_assert_f(producer_pending[i] == 0, "%s producer fence signaled "
+			     "before the test released it\n",
+			     lut3d_dma_producer_desc[order[i]]);
+		igt_assert_f(crtc_pending[i] == -ETIME, "commit completed while the %s "
+			     "producer fence was unsignaled\n", waiting);
+		igt_assert_f(wb_pending[i] == 0, "writeback completed while the %s "
+			     "producer fence was unsignaled\n", waiting);
+	}
 
 	igt_assert_f(match, "output does not reflect the DMA 3D LUT committed "
 		     "behind the implicit fence\n");
@@ -569,7 +631,23 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 				     "that fence signals, and must then apply the new LUT");
 			igt_subtest("plane-3dlut_dma-implicit-fence")
 				lut3d_dma_fence_test(&display, output, plane,
-						     &input_fb, &output_fb);
+						     &input_fb, &output_fb,
+						     &(struct lut3d_dma_fence_case) { });
+
+			for (int p = 0; p < LUT3D_DMA_NUM_PRODUCERS; p++) {
+				igt_describe("A commit flipping both the scanout and DMA 3D LUT "
+					     "framebuffers, each with an unsignaled implicit "
+					     "write fence, must not complete until both fences "
+					     "signal, in either order");
+				igt_subtest_f("plane-3dlut_dma-scanout-implicit-fences-signal-%s-first",
+					      lut3d_dma_producer_names[p])
+					lut3d_dma_fence_test(&display, output, plane,
+							     &input_fb, &output_fb,
+							     &(struct lut3d_dma_fence_case) {
+								.fence_scanout = true,
+								.first = p,
+							     });
+			}
 
 			igt_fixture() {
 				igt_detach_crtc(&display, output);
-- 
2.56.0

