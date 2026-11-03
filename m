Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2761606A31B
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 21:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Bj0WfV52
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63AD410E839;
	Tue,  3 Nov 2026 21:42:53 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011060.outbound.protection.outlook.com
 [40.93.194.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79DF410F894
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 21:38:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pPFkjVpGP9x5CeNeUWwyLfzwveUougpmL18YtbMmArjIfCwUku4FtByLKCR6Shq64YvTKAASx4L7e9Uf1NrXT1/y1xCremeTjvIJFKTBx6JlrJCiSauNnxDVjdwq4W22Y5q4XmKuVpK26mj+HiHRYww5MMBNJMJP8wFT1MqP9lrGLeApnYuDn7s22uJo9TbM2nO3xi7G4edR+e0F+owApWLDrK4ktP3cRQms6rIuuvIS+aIB/reGfwTZsFhJJ2vWzt99Ud6IVFY7uu/SCvbgWIk6sk+4Mieqbsho50iffN+fv7KZ04hjT1bTnrcTGgnwiUjWgmQe330TNE5tp07+0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MpcTuFFVBZpe3Wu7O6uenYnkXosFGd4UqSuquRxzo/4=;
 b=V/p3aVt2XXH+opBXpHJ5Q3OV0/vZGq6X6sZOp2cPVGawra0BGKJA4OGWLBCVLTsb/06V6IfRZ/57IuxMzA79H7NzjMODFmbcyHMg+y4MpPuWjqpfUomKK8sk1bhCtAm2kgUcAO2wWdP00XJUDdGVV/DXWDI7TWTgoRLmex5ttt2l93t8hcRdwDSdRWupZx7ZvaJkqk06nqhuZ1EeKetP9JekAWndY/MK3xBNN9WNJyBRGDPTVSYpZE/LmCB/s+4KJ/jzW1a3frBHwRcVWz7fKnxMbQgVKXnrLyLqF9BqNIoCJ9/1MMQEsVfyVcPkCCoK6Woa5+a33T7du/W4Govfog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MpcTuFFVBZpe3Wu7O6uenYnkXosFGd4UqSuquRxzo/4=;
 b=Bj0WfV52SqTMnm+ycWre3RPOSnakBPZcfZggUq0stdn4euXr4p4JLThcBaOqCe7yj/o9exQIQcwB9d50OwqSiXqETpDXIDd2hpYcR5SnwzY60aF46bsElcTkcCwGH8EKhisC79iZAJ4Hkd/YwZ2SLxx6rP6k0YxNqRjKjZ8u+EM=
Received: from BN0PR02CA0029.namprd02.prod.outlook.com (2603:10b6:408:e4::34)
 by LV2PR12MB347031.namprd12.prod.outlook.com (2603:10b6:408:417::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 21:38:21 +0000
Received: from BN1PEPF00018075.namprd04.prod.outlook.com
 (2603:10b6:408:e4:cafe::23) by BN0PR02CA0029.outlook.office365.com
 (2603:10b6:408:e4::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Tue, 3
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
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 3 Nov
 2026 15:38:20 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 3 Nov
 2026 15:38:20 -0600
Received: from hwentlanryzen (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 3 Nov 2026 15:38:20 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v1 09/10] tests/kms_colorop_dma: exercise DMA 3D LUT
 framebuffer transitions
Date: Tue, 3 Nov 2026 16:37:59 -0500
Message-ID: <20261103213800.618130-10-harry.wentland@amd.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103213800.618130-1-harry.wentland@amd.com>
References: <20261103213800.618130-1-harry.wentland@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018075:EE_|LV2PR12MB347031:EE_
X-MS-Office365-Filtering-Correlation-Id: 439ecb7d-4582-4ea3-765d-08df39f2c86d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700016|23010399003|6133799003|18002099003|22082099003|261102123227099003|3023799007|56012099006|10067099003|261009223027099003|261022115727099003|261022105027099003|261021121427099003|261021123027099003|261022075727099003|11063799006|261028144727099003|261026121527099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: mjTV/48vpv0IDwJ9QRYexlbAxObvLeGOCJJNoI0udMZtDj0xwl+35l9vmwOPWyvCAUHY4tZUa4nz1CmBHww31silqjvgpb13ZKuRdZuKgKccgpAO0zfqjHwZ5CxuBwohDZtwZi1qJs3DuutqS00kFSbwSUHSZyN28fVOZYxPpX8jSjkRwW1jfj+IkVL3NKyRgyJUqSJCLPRIKpZ8CW1S89VuhLIQnQYcf46zZGKbHBl/F5ux2g6VSMuofyjhIIdnZ6lffU+rXFlq7pUqIgMmmHxKZF54/z/1ZipWb7HTSKp4aXuZTESIEX3TOxwr72z8e/93uBvC6v2FvA9+wSmH8wcrLuFom1zI4COShMEFpKYd4z4s1vrxDqZ8gbT7ZErv+COf9DCPyC2K4Hi2t45EWG1DS4ZYg6SbyMts7+a8nCXS6BVFXYYxo2EMHcahlBlcC/9hePgNML4Z/CwjlXww4/GjKUjsXsxM1mwo+8l/clyiAey7WlKiPmiFGG4WPpilWgydl9sb3gusP/UwOE4j65+GybUlS0whOtPGidzUbLI8tqFCJ0VF7kVOGNtSxFX+12kXnXwus9SK7ht89EAXAmJT+LhXQTEa2dllJd991mHDr3yLi+wLcDUcAPwSSCZOYvNjNVISdFKeFvUf5zpBxV7k1MCj5RN8LmAL+/3S8DuMhQMk8rx69BkNQi75TBBxN4wVvzFJp9gb4Ee3wxU1DA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(23010399003)(6133799003)(18002099003)(22082099003)(261102123227099003)(3023799007)(56012099006)(10067099003)(261009223027099003)(261022115727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261022075727099003)(11063799006)(261028144727099003)(261026121527099003)(261026140227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 90c6OnrsUw7injLMjNiBBe9m0UaPOERiCf1S9OWWP/y3Ncgiwu65E2aWR8vNt1FnApr5IlchcxnhH8FhtkiHI0fRSFJjxWNuGQUcLaCf8oBuyQ3jOI+Q/wDQhTO+TITrguMkCUo0VLbH1g+d78yDVYl9cF2xsPcZeW7vwULLcbYcqoPxByDNerLTrWvbqU4vHS1OM+pH6GDtRc1tUAcAFh8ua8HoFL1jC8PqSV7qrPvOA9a1BE27t2ieIpfeIkRsYHVdWwkn9ahc+iG3XJHXxdNCmVeKUcsWYRBDAsU5SU0YRgbqAAG8lBlloJXvwRuz54MzS4AotbFqy7AeaauUNw3ZuNxMgDdYQukzYE6JHjOTWG7re2z76OPkWm4t4u3Uz+Hxh6hIJmBr8U9avyA45CMzWxm71hliE1fglAommEm1gB2Q5jhqDCvMaEM2Y2v2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 21:38:21.6956 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 439ecb7d-4582-4ea3-765d-08df39f2c86d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00018075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB347031
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

DMA 3D LUT framebuffers must remain valid when plane updates reuse the
current LUT and when color processing is replaced, bypassed, or disabled.
Exercise these transitions with blocking and nonblocking atomic commits.

Alternate distinct scanout images without submitting colorop properties,
replace LUTs without changing plane properties, and repeatedly resubmit
the same LUT framebuffer. Also cover colorop bypass, pipeline deselection,
and plane and CRTC disable/re-enable while retaining the LUT buffers.
Some drivers, such as amdgpu, require the primary plane while the CRTC
is active, so probe plane disable with a TEST_ONLY commit and skip that
step when the driver rejects it.

Wait for CRTC and writeback completion and compare the captured output
against a software reference after each enabled transition. Do not issue
extra commits to accommodate delayed LUT latching.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop_dma.c | 232 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 231 insertions(+), 1 deletion(-)

diff --git a/tests/kms_colorop_dma.c b/tests/kms_colorop_dma.c
index 2a07faecab8d..ed078316f1bb 100644
--- a/tests/kms_colorop_dma.c
+++ b/tests/kms_colorop_dma.c
@@ -52,6 +52,17 @@
  * Mega feature: General Display Features
  * Test category: functionality test
  *
+ * SUBTEST: plane-3dlut_dma-transitions-blocking
+ * SUBTEST: plane-3dlut_dma-transitions-nonblocking
+ * Description: DMA 3D LUT framebuffers remain valid across plane-only flips,
+ *              LUT replacement and reuse, bypass, pipeline reselection, and
+ *              plane (where the driver allows it) and CRTC disable/re-enable,
+ *              with output checked after each enabled transition
+ * Driver requirement: vkms, amdgpu
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
  */
 
 typedef struct {
@@ -521,6 +532,213 @@ static void lut3d_dma_fence_test(igt_display_t *display,
 		     "behind the implicit fence\n");
 }
 
+static void lut3d_dma_commit(igt_display_t *display, igt_crtc_t *crtc,
+			    uint32_t flags)
+{
+	int fence, ret;
+
+	igt_crtc_request_out_fence(crtc);
+	igt_display_commit_atomic(display, flags, NULL);
+	fence = crtc->out_fence_fd;
+	crtc->out_fence_fd = -1;
+	igt_assert_lte(0, fence);
+	ret = sync_fence_wait(fence, LUT3D_DMA_FENCE_TIMEOUT_MS);
+	close(fence);
+	igt_assert_f(ret == 0, "DMA 3D LUT transition did not complete: %s\n",
+		     strerror(-ret));
+}
+
+static void lut3d_dma_check_transition(igt_display_t *display,
+				      igt_output_t *output,
+				      igt_fb_t *expected,
+				      igt_fb_t *output_fb,
+				      uint32_t flags, const char *stage)
+{
+	igt_output_set_writeback_fb(output, output_fb);
+	lut3d_dma_commit(display, igt_output_get_driving_crtc(output), flags);
+	igt_get_and_wait_out_fence(output);
+
+	if (data.dump_check) {
+		igt_dump_fb(display, expected, ".", "sw_transform");
+		igt_dump_fb(display, output_fb, ".", "output");
+	}
+	igt_assert_f(compare_with_bracket(expected, output_fb),
+		     "incorrect output after DMA 3D LUT transition: %s\n", stage);
+}
+
+static void lut3d_dma_constant_green(igt_pixel_t *pixel)
+{
+	pixel->r = 0.0;
+	pixel->g = 1.0;
+	pixel->b = 0.0;
+}
+
+struct lut3d_dma_setup {
+	kms_colorop_t lut_a, lut_b;
+	kms_colorop_t *colorops_a[2], *colorops_b[2];
+	igt_colorop_t *pipeline;
+	igt_fb_t alternate_fb, reference_a, reference_b[2];
+	igt_fb_t *inputs[2];
+};
+
+/* LUT A keeps only green. reference_b[i] is LUT B applied to inputs[i]. */
+static void lut3d_dma_setup_init(struct lut3d_dma_setup *s,
+				 igt_display_t *display, igt_plane_t *plane,
+				 igt_fb_t *input_fb, igt_fb_t *output_fb)
+{
+	int i, ret;
+
+	memset(s, 0, sizeof(*s));
+	s->lut_a = lut3d_dma_fence_lut_a;
+	s->lut_a.transform = lut3d_dma_constant_green;
+	s->lut_b = lut3d_dma_fence_lut_b;
+	s->colorops_a[0] = &s->lut_a;
+	s->colorops_b[0] = &s->lut_b;
+	s->pipeline = get_color_pipeline(display, plane, s->colorops_a);
+	igt_skip_on(!s->pipeline);
+	igt_assert(get_color_pipeline(display, plane, s->colorops_b) ==
+		   s->pipeline);
+
+	ret = igt_create_color_pattern_fb(display->drm_fd, input_fb->width,
+					  input_fb->height, input_fb->drm_format,
+					  DRM_FORMAT_MOD_LINEAR, 0.7, 0.3, 0.1,
+					  &s->alternate_fb);
+	igt_assert_lt(0, ret);
+	s->inputs[0] = input_fb;
+	s->inputs[1] = &s->alternate_fb;
+	for (i = 0; i < ARRAY_SIZE(s->reference_b); i++) {
+		ret = igt_create_fb(display->drm_fd, input_fb->width, input_fb->height,
+				    output_fb->drm_format, DRM_FORMAT_MOD_LINEAR,
+				    &s->reference_b[i]);
+		igt_assert_lt(0, ret);
+		apply_transforms(s->colorops_b, s->inputs[i], &s->reference_b[i]);
+	}
+	ret = igt_create_fb(display->drm_fd, input_fb->width, input_fb->height,
+			    output_fb->drm_format, DRM_FORMAT_MOD_LINEAR,
+			    &s->reference_a);
+	igt_assert_lt(0, ret);
+	apply_transforms(s->colorops_a, input_fb, &s->reference_a);
+}
+
+static void lut3d_dma_setup_fini(struct lut3d_dma_setup *s,
+				 igt_display_t *display)
+{
+	int i;
+
+	igt_remove_fb(display->drm_fd, &s->lut_a.lut3d_dma_fb);
+	igt_remove_fb(display->drm_fd, &s->lut_b.lut3d_dma_fb);
+	igt_remove_fb(display->drm_fd, &s->alternate_fb);
+	igt_remove_fb(display->drm_fd, &s->reference_a);
+	for (i = 0; i < ARRAY_SIZE(s->reference_b); i++)
+		igt_remove_fb(display->drm_fd, &s->reference_b[i]);
+}
+
+static void lut3d_dma_transition_test(igt_display_t *display,
+				     igt_output_t *output,
+				     igt_plane_t *plane,
+				     igt_fb_t *input_fb,
+				     igt_fb_t *output_fb,
+				     bool nonblock)
+{
+	struct lut3d_dma_setup s;
+	igt_crtc_t *crtc = igt_output_get_driving_crtc(output);
+	uint32_t flags = nonblock ? DRM_MODE_ATOMIC_NONBLOCK : 0;
+	int i, ret;
+
+	igt_assert(crtc);
+	lut3d_dma_setup_init(&s, display, plane, input_fb, output_fb);
+
+	igt_plane_set_fb(plane, input_fb);
+	set_color_pipeline(display, plane, s.colorops_a, s.pipeline);
+	lut3d_dma_check_transition(display, output, &s.reference_a, output_fb,
+				   DRM_MODE_ATOMIC_ALLOW_MODESET, "initial LUT A");
+	set_color_pipeline(display, plane, s.colorops_b, s.pipeline);
+	lut3d_dma_check_transition(display, output, &s.reference_b[0], output_fb,
+				   flags, "replace A with B");
+
+	for (i = 0; i < 8; i++) {
+		igt_colorop_t *colorop;
+		int index = (i + 1) % ARRAY_SIZE(s.inputs);
+
+		/* Do not pull colorops into the request through property updates. */
+		for_each_colorop_in_pipeline(s.pipeline, colorop)
+			igt_assert_eq(colorop->changed, 0);
+		igt_plane_set_fb(plane, s.inputs[index]);
+		lut3d_dma_check_transition(display, output, &s.reference_b[index],
+					   output_fb, flags, "plane-only flip");
+	}
+
+	for (i = 0; i < 8; i++) {
+		bool use_a = !(i % 2);
+
+		igt_assert_eq(plane->changed, 0);
+		igt_colorop_set_prop_value(s.lut_b.colorop, IGT_COLOROP_FB_ID,
+					   use_a ? s.lut_a.lut3d_dma_fb.fb_id :
+						   s.lut_b.lut3d_dma_fb.fb_id);
+		lut3d_dma_check_transition(display, output,
+					   use_a ? &s.reference_a : &s.reference_b[0],
+					   output_fb, flags, "LUT-only replacement");
+	}
+
+	for (i = 0; i < 8; i++) {
+		igt_colorop_set_prop_value(s.lut_b.colorop, IGT_COLOROP_FB_ID,
+					   s.lut_b.lut3d_dma_fb.fb_id);
+		lut3d_dma_check_transition(display, output, &s.reference_b[0],
+					   output_fb, flags, "reuse the same LUT BO");
+	}
+
+	for (i = 0; i < 4; i++) {
+		igt_colorop_set_prop_value(s.lut_b.colorop, IGT_COLOROP_BYPASS, 1);
+		lut3d_dma_check_transition(display, output, input_fb, output_fb,
+					   flags, "bypass colorop");
+		igt_colorop_set_prop_value(s.lut_b.colorop, IGT_COLOROP_BYPASS, 0);
+		lut3d_dma_check_transition(display, output, &s.reference_b[0],
+					   output_fb, flags, "re-enable colorop");
+
+		igt_plane_set_color_pipeline(plane, NULL);
+		lut3d_dma_check_transition(display, output, input_fb, output_fb,
+					   flags, "deselect pipeline");
+		igt_plane_set_color_pipeline(plane, s.pipeline);
+		lut3d_dma_check_transition(display, output, &s.reference_b[0],
+					   output_fb, flags, "reselect pipeline");
+
+		/* Some drivers require the primary plane while the CRTC is on. */
+		igt_plane_set_fb(plane, NULL);
+		ret = igt_display_try_commit_atomic(display,
+						    DRM_MODE_ATOMIC_TEST_ONLY |
+						    DRM_MODE_ATOMIC_ALLOW_MODESET,
+						    NULL);
+		if (ret == 0) {
+			lut3d_dma_commit(display, crtc,
+					 flags | DRM_MODE_ATOMIC_ALLOW_MODESET);
+			igt_plane_set_fb(plane, input_fb);
+			lut3d_dma_check_transition(display, output,
+						   &s.reference_b[0], output_fb,
+						   flags | DRM_MODE_ATOMIC_ALLOW_MODESET,
+						   "re-enable plane");
+		} else {
+			igt_debug("DMA 3D LUT transition: plane cannot be disabled while the CRTC is active (%d), skipping step\n",
+				  ret);
+			igt_plane_set_fb(plane, input_fb);
+		}
+
+		igt_plane_set_fb(plane, NULL);
+		igt_output_set_crtc(output, NULL);
+		lut3d_dma_commit(display, crtc, flags | DRM_MODE_ATOMIC_ALLOW_MODESET);
+		igt_output_set_crtc(output, crtc);
+		igt_plane_set_fb(plane, input_fb);
+		lut3d_dma_check_transition(display, output, &s.reference_b[0], output_fb,
+					   flags | DRM_MODE_ATOMIC_ALLOW_MODESET,
+					   "re-enable CRTC");
+	}
+
+	reset_colorops(s.colorops_b);
+	igt_plane_set_color_pipeline(plane, NULL);
+	lut3d_dma_check_transition(display, output, input_fb, output_fb,
+				   DRM_MODE_ATOMIC_ALLOW_MODESET, "cleanup");
+	lut3d_dma_setup_fini(&s, display);
+}
+
 static int opt_handler(int option, int option_index, void *_data)
 {
 	switch (option) {
@@ -625,7 +843,7 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 		}
 	}
 
-	/* DMA 3D LUT framebuffer synchronization tests */
+	/* DMA 3D LUT framebuffer synchronization and lifetime tests */
 	{
 		igt_output_t *output;
 		igt_plane_t *plane;
@@ -701,6 +919,18 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 							     });
 			}
 
+			for (int nonblock = 0; nonblock < 2; nonblock++) {
+				igt_describe("DMA 3D LUT framebuffers remain valid across "
+					     "plane-only flips, LUT replacement and reuse, "
+					     "bypass, pipeline reselection, and display "
+					     "disable/re-enable");
+				igt_subtest_f("plane-3dlut_dma-transitions-%s",
+					      nonblock ? "nonblocking" : "blocking")
+					lut3d_dma_transition_test(&display, output, plane,
+								  &input_fb, &output_fb,
+								  nonblock);
+			}
+
 			igt_fixture() {
 				igt_detach_crtc(&display, output);
 				igt_remove_fb(display.drm_fd, &input_fb);
-- 
2.56.0

