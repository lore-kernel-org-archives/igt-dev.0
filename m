Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF3D606D81B
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 21:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=LKdA+pdX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 705E510E839;
	Tue,  3 Nov 2026 21:43:45 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013052.outbound.protection.outlook.com
 [40.93.196.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AAE810F896
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 21:38:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZvzOl5q3z8UBLi4lBcC/39LVF2ITmCcgmYl3ZFZ0uE6E/yKufTV3xMlWPiBxLyik4E8v49mzl1cvgrZ1FF1VxgU+5JgMAJmMLz/eejlCUDlZ42wDSqIwqGF4+RiWLpsTysTc/58T2kxbAPXKJkhPIU6zYFrvC/kmfZLLMy6/aRtmVkb2ISgZEuljSMdvg2o6Q+NFM2kynymKBlvzLe85ZzCJtC47Gt1vMAIWpkfuBCMfnMkhcacZml8HOQPwTyHffRiG6CRFuyO0XmJdg9FGofNUmXdqH5w1RkjLwHrpTTjFhZcnNquGYjM94KWvRVIr88LY9kKB8PuXhg+K42NbuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7zi5M4vjHjaxXy+m2ueFURugiP1pW1+lfl/mxu8YB0=;
 b=KVM8f7CiUyw/EqO8KQzVouA2Y4dFdQdMywfwbwdbv3LvOkT69kS7qO38HKaE3AQMJSFngUqsjMwqDkk7juNr4Di9Y6N/ij2JgLU0qbLBAIUnQKlh8/LMGnQyOwnXWixpWjOFhqg/HEGpnZrQmptAMdMh8qWAPFY1Wr89PwUko/Ii5SmBXQAZjfZjuZe5wZBFAMne2uOYqGYLTitW4Eqy5QdiRAiFLEOdd3ybPO73HA6xfA1pqGUeUxFlACrOh3+ZWBNXLNen5tM4o/5d7D5CLd1rCwfi28KOuWXXqHe9q1c+Cyh1gkljrrIXX6aC8Ez++E13v6XAeSt+Xrtvga4zOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7zi5M4vjHjaxXy+m2ueFURugiP1pW1+lfl/mxu8YB0=;
 b=LKdA+pdX1jqf3e2edJbUUWNTEqcYAxHrHw1KqldypVrbE9VvGzVAewcIkhFgB79W8BLHQusaTs5axMLeH/VYqu1mOpCrmEIJkeuW5WviCy7pTYtIJvHMi40t8gnA9qfm1vtVJFIMjdv9DiJ488UDzliM5/rxhn1CDbx/gUwsimU=
Received: from BN0PR02CA0021.namprd02.prod.outlook.com (2603:10b6:408:e4::26)
 by CH3PR12MB7572.namprd12.prod.outlook.com (2603:10b6:610:144::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 21:38:21 +0000
Received: from BN1PEPF00018075.namprd04.prod.outlook.com
 (2603:10b6:408:e4:cafe::2b) by BN0PR02CA0021.outlook.office365.com
 (2603:10b6:408:e4::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Tue, 3
 Nov 2026 21:38:21 +0000
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
 15.21.592.5 via Frontend Transport; Tue, 3 Nov 2026 21:38:21 +0000
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
 Transport; Tue, 3 Nov 2026 15:38:20 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v1 08/10] tests/kms_colorop_dma: test a merged in-fence
 covering DMA 3D LUT producers
Date: Tue, 3 Nov 2026 16:37:58 -0500
Message-ID: <20261103213800.618130-9-harry.wentland@amd.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103213800.618130-1-harry.wentland@amd.com>
References: <20261103213800.618130-1-harry.wentland@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018075:EE_|CH3PR12MB7572:EE_
X-MS-Office365-Filtering-Correlation-Id: 7af970b9-2be1-444f-418d-08df39f2c822
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|23010399003|36860700016|1800799024|261009223027099003|261026140227099003|261028144727099003|261102123227099003|261022105027099003|261021121427099003|261022075727099003|261021123027099003|11063799006|56012099006|3023799007|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: m8NFVxn6rcvMuPWJywWJMAcuHMTexwYdvV8CMZETp1U0efX7D0dlMs3C27D3WsM9lDmqPPPsE+Adi1G7+5jOuWBvKZCsRl+6mi6ckQLwyYJ8cewPQDSHZaO06hQJ2CIiZdmHgl1em9kbZQB9DRYmwtXsqPDXeU6FU23zzLm2MYO0QvOA/bsiDkZAl6FTLSe9JIUrUY+5Hvm5SNnODF3fgr0y0iRKUT395MHgEcc79AdJUtDczoFi/3/AULdLX6PyTK3YyP+7eqKBhKznVaFxnVcfCZo11jz9XWQkNtA31ro5YCk1rPHMnNw+K3mSs/nEwviWQsQdJxuPNi93JnvPLqpYO3vTsqDqkr5NCzg2B5eKjcYs0vBgwIDGbLncVHJJ0zFLzX9v/VVyHeut4JyA4Fwetc2vaBJf9+9OEL/6Ol6uxaao+JD42RBUN7Oj53Aqy8ty0abBDxfD01s9n47cwukIQR/lrt4fP2YUYLMtIa55hU5WV12aHH1my9AfHHbHdSR/ul1UtzRf20FO9IxF4lsUZJyDqk32YaDM+lNPyvgSwEntBkWnDilgNbwjUML6j5JBr8UQzAdXtW6JytI9gVdAyUB4XhckZIDFM4cHCCoVEFL73Jr/K4hN7N6ANKE9sahObgUgxG4kehDE4rGYyL+12GEAP4wW15+C0QTYnttpey2aUiwzfnRfey7AM5ctvoqu75dSWe85lUDUuWMJ9Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(23010399003)(36860700016)(1800799024)(261009223027099003)(261026140227099003)(261028144727099003)(261102123227099003)(261022105027099003)(261021121427099003)(261022075727099003)(261021123027099003)(11063799006)(56012099006)(3023799007)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3THImagKlT/SxUeKgU3TKKC89JmGSCIhSdTIImtIKuvcR1s2WMfUHUS2ORs9ZGdZf3sDDMS534/7S0hn2bysVWaHTJgSA5YewxG9zBVDDR3Pg80I4tPTqFdChDMDoG268Zzrf4Up0iBO8zU0Wn073qe+LuYPjpmDyJtetpyL5bF6RV8Pjc1qYQCg7l0Cg4LPgRP+Dhj/iVGkyovrBB9VSrtMz0AwUUcQbZm4l9JCGyXQkkBJk7/KxorOI5RVLkKlbueOdisR3ZYHsQkwzee6HU08XhM08wGLLxzBV3uayOJSrv2O7/FVhqyMjFkwTtb2Azp7g+qdKUXrrmdajY44Vb/IdwAavD3FD05CciIPs//ukQ3jtHhcTg/rvNcE3qjJsg4uGzWEDFXb6GMG2Nr6ml6ZKN8GxgVhzaQh+8rdv6t4uPArKQccTW4GL0GBKu5d
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 21:38:21.2032 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7af970b9-2be1-444f-418d-08df39f2c822
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00018075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7572
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

When userspace supplies an explicit plane IN_FENCE_FD, implicit write
fences on the scanout and DMA 3D LUT buffers are not dependencies of the
commit. The explicit fence then has to cover every producer the commit
consumes, including the LUT writer.

Add subtests that flip both the scanout and DMA 3D LUT framebuffers and
pass a merge of their producer fences through IN_FENCE_FD instead of
attaching implicit fences. Check that completion stays pending until
both producers signal, in either order.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop_dma.c | 72 +++++++++++++++++++++++++++++++++++------
 1 file changed, 62 insertions(+), 10 deletions(-)

diff --git a/tests/kms_colorop_dma.c b/tests/kms_colorop_dma.c
index 5fa2934e1721..2a07faecab8d 100644
--- a/tests/kms_colorop_dma.c
+++ b/tests/kms_colorop_dma.c
@@ -41,6 +41,17 @@
  * Mega feature: General Display Features
  * Test category: functionality test
  *
+ * SUBTEST: plane-3dlut_dma-merged-in-fence-signal-lut-first
+ * SUBTEST: plane-3dlut_dma-merged-in-fence-signal-scanout-first
+ * Description: A commit flipping both the scanout and DMA 3D LUT
+ *              framebuffers, with their producer fences merged into the
+ *              plane IN_FENCE_FD, must not complete until both producers
+ *              signal, in either order
+ * Driver requirement: vkms, amdgpu
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
  */
 
 typedef struct {
@@ -252,6 +263,11 @@ static const char * const lut3d_dma_producer_desc[] = {
 struct lut3d_dma_fence_case {
 	/* Also flip to a new scanout FB with its own producer fence. */
 	bool fence_scanout;
+	/*
+	 * Merge the producer fences into the plane's IN_FENCE_FD instead of
+	 * attaching them to the BOs as implicit write fences.
+	 */
+	bool explicit_fence;
 	/* Producer signaled first when there are two. */
 	enum lut3d_dma_producer first;
 };
@@ -315,11 +331,13 @@ static void attach_implicit_write_fence(int drm_fd, uint32_t gem_handle,
 }
 
 /*
- * Switch from LUT A to LUT B behind unsignaled producer fences. B's BO always
- * carries an implicit write fence. With fence_scanout, the plane also flips
- * to a copy of the input FB whose BO carries an independent implicit write
- * fence. The commit must stay pending until every producer fence signals,
- * and the captured output must then reflect LUT B.
+ * Switch from LUT A to LUT B behind unsignaled producer fences. B always has
+ * a producer fence. With fence_scanout, the plane also flips to a copy of the
+ * input FB with an independent producer fence. By default each fence is
+ * attached to its BO as an implicit write fence; with explicit_fence they
+ * are merged into the plane's IN_FENCE_FD instead. The commit must stay
+ * pending until every producer fence signals, and the captured output must
+ * then reflect LUT B.
  *
  * The exit handler signals the producer fence if the test fails while the
  * commit is pending.
@@ -350,6 +368,8 @@ static void lut3d_dma_fence_test(igt_display_t *display,
 	bool match = false;
 
 	igt_require_sw_sync();
+	if (tc->explicit_fence)
+		igt_require(igt_plane_has_prop(plane, IGT_PLANE_IN_FENCE_FD));
 	igt_install_exit_handler(signal_pending_producer_fences);
 	igt_assert(crtc);
 
@@ -401,16 +421,32 @@ static void lut3d_dma_fence_test(igt_display_t *display,
 		igt_plane_set_fb(plane, &scanout_b);
 	}
 
-	attach_implicit_write_fence(display->drm_fd, lut_b.lut3d_dma_fb.gem_handle,
-				    fences[LUT3D_DMA_PRODUCER_LUT]);
-	if (tc->fence_scanout)
-		attach_implicit_write_fence(display->drm_fd, scanout_b.gem_handle,
-					    fences[LUT3D_DMA_PRODUCER_SCANOUT]);
+	if (tc->explicit_fence) {
+		int in_fence = fences[LUT3D_DMA_PRODUCER_LUT];
+
+		if (tc->fence_scanout) {
+			in_fence = sync_fence_merge(fences[LUT3D_DMA_PRODUCER_LUT],
+						    fences[LUT3D_DMA_PRODUCER_SCANOUT]);
+			igt_assert_lte(0, in_fence);
+		}
+
+		igt_plane_set_fence_fd(plane, in_fence);
+		if (in_fence != fences[LUT3D_DMA_PRODUCER_LUT])
+			close(in_fence);
+	} else {
+		attach_implicit_write_fence(display->drm_fd, lut_b.lut3d_dma_fb.gem_handle,
+					    fences[LUT3D_DMA_PRODUCER_LUT]);
+		if (tc->fence_scanout)
+			attach_implicit_write_fence(display->drm_fd, scanout_b.gem_handle,
+						    fences[LUT3D_DMA_PRODUCER_SCANOUT]);
+	}
 
 	igt_output_set_writeback_fb(output, output_fb);
 	igt_crtc_request_out_fence(crtc);
 
 	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_NONBLOCK, NULL);
+	/* A successful commit consumes the in-fence; a failed one leaves it set. */
+	igt_plane_set_fence_fd(plane, -1);
 
 	if (ret == 0) {
 		out_fence = crtc->out_fence_fd;
@@ -649,6 +685,22 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 							     });
 			}
 
+			for (int p = 0; p < LUT3D_DMA_NUM_PRODUCERS; p++) {
+				igt_describe("A commit flipping both the scanout and DMA 3D LUT "
+					     "framebuffers, with their producer fences merged "
+					     "into the plane IN_FENCE_FD, must not complete "
+					     "until both producers signal, in either order");
+				igt_subtest_f("plane-3dlut_dma-merged-in-fence-signal-%s-first",
+					      lut3d_dma_producer_names[p])
+					lut3d_dma_fence_test(&display, output, plane,
+							     &input_fb, &output_fb,
+							     &(struct lut3d_dma_fence_case) {
+								.fence_scanout = true,
+								.explicit_fence = true,
+								.first = p,
+							     });
+			}
+
 			igt_fixture() {
 				igt_detach_crtc(&display, output);
 				igt_remove_fb(display.drm_fd, &input_fb);
-- 
2.56.0

