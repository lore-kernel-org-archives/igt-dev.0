Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF1EC3DA6D
	for <igt-dev@archiver.kernel.org>; Fri, 23 May 2025 08:02:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFAFB10E7C0;
	Fri, 23 May 2025 08:02:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bFHl6iVB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C5C210E7C0
 for <igt-dev@lists.freedesktop.org>; Fri, 23 May 2025 08:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747987325; x=1779523325;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=etRojjOqTtOvc0KNpbtBs+bnX950WAJa3wKQOkUGMt0=;
 b=bFHl6iVBKFb6Y1Ha03hvJKUIUSH49ceV1nN8NB80WBacjfOApwMxQ6XW
 awvSAGr8/FNhrUR7Dp2r7Lq4snp9blPo8EzA6EO6MaXPut4StwE4W6Rv7
 cfOQE15opygKoO3SvoNcRUwWC4Ie2fi834RvpVFiHfcN42kjIAzxLkhC/
 PIOupzrydaBpghkmBJ+FJH7JQ7qTRD/iQlxbc7OCmG05gheXVXXYL3PWx
 JwQmiy6/mtOTYDPUfV82fygBmq18Zy+uKwZA7EEcOHBcTjBuxmCmLRChZ
 jGoAX2vD5lEB+dY77JyKUkOjj32zCBg7lByX5cDQmJFe+ZjbD+zrlc07u A==;
X-CSE-ConnectionGUID: QEIQtw1ET2mDcfN+Nuh5xw==
X-CSE-MsgGUID: 7ruNCoGgTeSoxF4m14ZNzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50182144"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="50182144"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 01:02:05 -0700
X-CSE-ConnectionGUID: MCsZWXP5Qv2TXEVhX8wYoQ==
X-CSE-MsgGUID: SL96jB3QR7K0pbZ3VBegag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="141532233"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.56])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 01:02:04 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v3 08/11] tests/xe_copy_basic: add subtest to verify
 mem-copy in pages
Date: Fri, 23 May 2025 10:01:23 +0200
Message-ID: <20250523080126.75295-9-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523080126.75295-1-zbigniew.kempczynski@intel.com>
References: <20250523080126.75295-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Mem-copy in linear mode supports copying in 256B pages. Verify is
it properly handled in intel_blt.

Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_copy_basic.c | 56 ++++++++++++++++++++++++++++++++++---
 1 file changed, 52 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
index bed3e39426..404fe7f50a 100644
--- a/tests/intel/xe_copy_basic.c
+++ b/tests/intel/xe_copy_basic.c
@@ -48,6 +48,20 @@ struct rect {
  * @0xfffe: 0xfffe
  * @0x8fffe: 0x8fffe
  */
+
+/**
+ *
+ * SUBTEST: mem-page-copy-%s
+ * Description: Test validates MEM_COPY command, it takes various
+ *              parameters needed for the filling batch buffer for MEM_COPY command
+ *              with size %arg[1].
+ * Test category: functionality test
+ *
+ * arg[1]:
+ * @1: 1
+ * @17: 17
+ */
+
 static void
 mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ctx,
 	 enum blt_memop_type type, enum blt_memop_mode mode,
@@ -62,23 +76,45 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
 	uint8_t src_mocs = intel_get_uc_mocs_index(fd);
 	uint8_t dst_mocs = src_mocs;
 	uint32_t bb;
-	int result;
+	uint8_t *psrc, *pdst;
+	int result, i;
 
 	bb = xe_bo_create(fd, 0, bb_size, region, 0);
 
-	blt_mem_copy_init(fd, &mem, MODE_BYTE, TYPE_LINEAR);
+	blt_mem_copy_init(fd, &mem, mode, type);
 	blt_set_mem_object(&mem.src, src_handle, size, width, width, height,
 			   region, src_mocs, DEFAULT_PAT_INDEX, COMPRESSION_DISABLED);
 	blt_set_mem_object(&mem.dst, dst_handle, size, width, width, height,
 			   region, dst_mocs, DEFAULT_PAT_INDEX, COMPRESSION_DISABLED);
 	mem.src.ptr = xe_bo_map(fd, src_handle, size);
 	mem.dst.ptr = xe_bo_map(fd, dst_handle, size);
+	psrc = (uint8_t *) mem.src.ptr;
+	pdst = (uint8_t *) mem.dst.ptr;
+
+	srand(time(NULL));
+
+	/* Randomize whole src */
+	for (i = 0; i < size; i++)
+		psrc[i] = rand();
 
 	blt_set_batch(&mem.bb, bb, bb_size, region);
 	igt_assert(mem.src.width == mem.dst.width);
 
 	blt_mem_copy(fd, ctx, NULL, ahnd, &mem);
-	result = memcmp(mem.src.ptr, mem.dst.ptr, mem.src.size);
+
+	if (type == TYPE_LINEAR && mode == MODE_BYTE) {
+		result = memcmp(psrc, pdst, width);
+
+		/* Rest of dst must contain 0 */
+		for (i = width; i < size; i++) {
+			if (pdst[i] != 0) {
+				result = -1;
+				break;
+			}
+		}
+	} else {
+		result = memcmp(psrc, pdst, pitch << 8);
+	}
 
 	intel_allocator_bind(ahnd, 0, 0);
 	munmap(mem.src.ptr, size);
@@ -86,7 +122,7 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
 	gem_close(fd, bb);
 	put_ahnd(ahnd);
 
-	igt_assert_f(!result, "source and destination differ\n");
+	igt_assert_f(!result, "destination doesn't contain valid data\n");
 }
 
 /**
@@ -176,6 +212,8 @@ igt_main
 				 { 0, 0x3fff, 1 },
 				 { 0, 0xfffe, 1 },
 				 { 0, 0x8fffe, 1 } };
+	struct rect page[] = { { 0, 1, 1, MODE_PAGE },
+			       { 0, 17, 1, MODE_PAGE }};
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
@@ -195,6 +233,16 @@ igt_main
 		}
 	}
 
+	for (int i = 0; i < ARRAY_SIZE(page); i++) {
+		igt_subtest_f("mem-page-copy-%u", page[i].width) {
+			igt_require(blt_has_mem_copy(fd));
+			for_each_variation_r(regions, 1, set) {
+				region = igt_collection_get_value(regions, 0);
+				copy_test(fd, &page[i], MEM_COPY, region);
+			}
+		}
+	}
+
 	for (int i = 0; i < ARRAY_SIZE(linear); i++) {
 		igt_subtest_f("mem-set-linear-0x%x", linear[i].width) {
 			igt_require(blt_has_mem_set(fd));
-- 
2.43.0

