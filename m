Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF557C54ED0
	for <igt-dev@archiver.kernel.org>; Fri, 23 May 2025 08:02:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DED310E7B2;
	Fri, 23 May 2025 08:02:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h/vGzH5p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5F310E7B2
 for <igt-dev@lists.freedesktop.org>; Fri, 23 May 2025 08:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747987333; x=1779523333;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SBs7tC1L+WgtEY1BxLHR3hPmlQfFGJlpT4u7b6FDv2w=;
 b=h/vGzH5p/BEasTLJxEACCPIYq4E9TV2qm4QCrW8AmnWylCuCsvEl0Ml7
 w2EXR9Icz1VE0ZNr42bA/LeyHzs/ul+Snf1pBj7Zolk0OzLTIw3yAxiX3
 KgFICbimFLybzD/RaMUBU12jqWSI5wwxVqui8FGJKqX/GCwFpRta1OAlM
 5vwDP/ltumZ/qgb3AUOr0PtacVraLhGG6yU5vl5XkmsC2jm9e3dcJGvOi
 O2X4IEVy11oFNev4MQ4jJ1JUboctS48recQmUh9ypvU1c3WBMVa1lVSMM
 zafO3tE6+GDB1bJ70fHMD7T9Um8tVddEykwg6kf0KKRy4IN1PSmSjdlYC A==;
X-CSE-ConnectionGUID: x0INbckKQ8q2zXBnf6QBMw==
X-CSE-MsgGUID: 9ynbr7wfQN6xxVf4TBPBFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50182159"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="50182159"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 01:02:12 -0700
X-CSE-ConnectionGUID: sP073dWmTPC+cSanS2o5Kw==
X-CSE-MsgGUID: HYUwqCP2T6OoUMECphTcrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="141532282"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.56])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 01:02:11 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v3 10/11] tests/xe_copy_basic: add mem-copy matrix
 subtests
Date: Fri, 23 May 2025 10:01:25 +0200
Message-ID: <20250523080126.75295-11-zbigniew.kempczynski@intel.com>
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

Verify intel_blt is able to properly copy matrix from one buffer
to another.

Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_copy_basic.c | 52 +++++++++++++++++++++++++++++++++----
 1 file changed, 47 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
index 404fe7f50a..be400e3175 100644
--- a/tests/intel/xe_copy_basic.c
+++ b/tests/intel/xe_copy_basic.c
@@ -62,6 +62,19 @@ struct rect {
  * @17: 17
  */
 
+/**
+ *
+ * SUBTEST: mem-matrix-copy-%s
+ * Description: Test validates MEM_COPY command, it takes various
+ *              parameters needed for the filling batch buffer for MEM_COPY command
+ *              with size %arg[1].
+ * Test category: functionality test
+ *
+ * arg[1]:
+ * @2x2: 2x2
+ * @200x127: 200x127
+ */
+
 static void
 mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ctx,
 	 enum blt_memop_type type, enum blt_memop_mode mode,
@@ -79,13 +92,17 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
 	uint8_t *psrc, *pdst;
 	int result, i;
 
+	igt_debug("size: %u, pitch: %u, width: %u, height: %u (type: %d, mode: %d)\n",
+		  size, pitch, width, height, type, mode);
+
 	bb = xe_bo_create(fd, 0, bb_size, region, 0);
 
 	blt_mem_copy_init(fd, &mem, mode, type);
-	blt_set_mem_object(&mem.src, src_handle, size, width, width, height,
+	blt_set_mem_object(&mem.src, src_handle, size, pitch, width, height,
 			   region, src_mocs, DEFAULT_PAT_INDEX, COMPRESSION_DISABLED);
-	blt_set_mem_object(&mem.dst, dst_handle, size, width, width, height,
+	blt_set_mem_object(&mem.dst, dst_handle, size, pitch, width, height,
 			   region, dst_mocs, DEFAULT_PAT_INDEX, COMPRESSION_DISABLED);
+
 	mem.src.ptr = xe_bo_map(fd, src_handle, size);
 	mem.dst.ptr = xe_bo_map(fd, dst_handle, size);
 	psrc = (uint8_t *) mem.src.ptr;
@@ -112,8 +129,20 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
 				break;
 			}
 		}
-	} else {
+	} else if (type == TYPE_LINEAR && mode == MODE_PAGE) {
 		result = memcmp(psrc, pdst, pitch << 8);
+	} else {
+		result = 0;
+
+		for (i = 0; i < pitch * height; i++) {
+			if (i % pitch > width && pdst[i] != 0) {
+				result = -1;
+				break;
+			} else if (i % pitch < width && psrc[i] != pdst[i]) {
+				result = -1;
+				break;
+			}
+		}
 	}
 
 	intel_allocator_bind(ahnd, 0, 0);
@@ -190,8 +219,10 @@ static void copy_test(int fd, struct rect *rect, enum blt_cmd_type cmd, uint32_t
 	ctx = intel_ctx_xe(fd, vm, exec_queue, 0, 0, 0);
 
 	if (cmd == MEM_COPY)
-		mem_copy(fd, src_handle, dst_handle, ctx, TYPE_LINEAR, rect->mode,
-			 bo_size, pitch, rect->width, rect->height, region);
+		mem_copy(fd, src_handle, dst_handle, ctx,
+			 rect->height > 1 ? TYPE_MATRIX : TYPE_LINEAR,
+			 rect->mode, bo_size, pitch,
+			 rect->width, rect->height, region);
 	else if (cmd == MEM_SET)
 		mem_set(fd, dst_handle, ctx, bo_size, rect->width, 1, MEM_FILL, region);
 
@@ -214,6 +245,7 @@ igt_main
 				 { 0, 0x8fffe, 1 } };
 	struct rect page[] = { { 0, 1, 1, MODE_PAGE },
 			       { 0, 17, 1, MODE_PAGE }};
+	struct rect matrix[] = { { 4, 2, 2 }, { 256, 200, 127 } };
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
@@ -243,6 +275,16 @@ igt_main
 		}
 	}
 
+	for (int i = 0; i < ARRAY_SIZE(matrix); i++) {
+		igt_subtest_f("mem-matrix-copy-%ux%u", matrix[i].width, matrix[i].height) {
+			igt_require(blt_has_mem_copy(fd));
+			for_each_variation_r(regions, 1, set) {
+				region = igt_collection_get_value(regions, 0);
+				copy_test(fd, &matrix[i], MEM_COPY, region);
+			}
+		}
+	}
+
 	for (int i = 0; i < ARRAY_SIZE(linear); i++) {
 		igt_subtest_f("mem-set-linear-0x%x", linear[i].width) {
 			igt_require(blt_has_mem_set(fd));
-- 
2.43.0

