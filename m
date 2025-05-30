Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1EE3C54F30
	for <igt-dev@archiver.kernel.org>; Fri, 30 May 2025 06:41:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5292C10E78C;
	Fri, 30 May 2025 06:41:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S+xRQ/5X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC6E10E78C
 for <igt-dev@lists.freedesktop.org>; Fri, 30 May 2025 06:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748587301; x=1780123301;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cfMsbEVzL42RMay1sa05TfJzdZSB3vt4rONaWRudhyc=;
 b=S+xRQ/5Xzd/3UFA8zo7CP4yH3K05qF3rmhdZTf3eXAOvKaenHeCCf65u
 0KS7/hwggu9GHhVdsTP9aSyLxKUFBKy2vMfl+OxYCWGKRHvQHA0NFd/+s
 ljsFeVaYQnXLallPd8w5TonLUV66YTbRdQqloGUriGt6I++u7kqN9JS/t
 vJdayT2rdmUC0UtNHmQg2nsDDk/GH8qDr8YnRHn2jhA/xy07HICaRgqew
 LAOC4Ni3ooL70+uVGGlAmRrK4k9ipjGdvKDg699G1Ep8k39cuschB5/K3
 zE3mkt8T9fRlVxVG1hvrk/UCUnUTzf7c5Kk1WFTYgKVUyalps3F7JHOTV Q==;
X-CSE-ConnectionGUID: 9Z44nfMiQBefHKlt3IhFgg==
X-CSE-MsgGUID: 5uO2RjqpRYWyVyuQ3KIgmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="73205008"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="73205008"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 23:41:41 -0700
X-CSE-ConnectionGUID: ItycLx1lRZWSwdBKPHztyA==
X-CSE-MsgGUID: nsc+mMzDQ7malenBNXAvzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="143755824"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.174])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 23:41:39 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v4 08/11] tests/xe_copy_basic: add subtest to verify
 mem-copy in pages
Date: Fri, 30 May 2025 08:40:47 +0200
Message-ID: <20250530064050.1560398-9-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530064050.1560398-1-zbigniew.kempczynski@intel.com>
References: <20250530064050.1560398-1-zbigniew.kempczynski@intel.com>
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

Mem-copy in linear type supports copying in 256B pages. Verify is
it properly handled in intel_blt.

Cc: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_copy_basic.c | 74 +++++++++++++++++++++++++++++++------
 1 file changed, 62 insertions(+), 12 deletions(-)

diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
index ca971f3570..9957e93ed9 100644
--- a/tests/intel/xe_copy_basic.c
+++ b/tests/intel/xe_copy_basic.c
@@ -23,6 +23,7 @@ struct rect {
 	uint32_t pitch;
 	uint32_t width;
 	uint32_t height;
+	enum blt_memop_mode mode;
 };
 
 /**
@@ -47,8 +48,22 @@ struct rect {
  * @0xfffe: 0xfffe
  * @0x8fffe: 0x8fffe
  */
+
+/**
+ *
+ * SUBTEST: mem-page-copy-%s
+ * Description: Test validates MEM_COPY command in page mode (256B chunks).
+ *              Size %arg[1] means number of pages copied.
+ * Test category: functionality test
+ *
+ * arg[1]:
+ * @1: 1
+ * @17: 17
+ */
+
 static void
 mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ctx,
+	 enum blt_memop_type type, enum blt_memop_mode mode,
 	 uint32_t size, uint32_t pitch, uint32_t width, uint32_t height, uint32_t region)
 {
 	struct blt_mem_copy_data mem = {};
@@ -59,23 +74,45 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
 	uint8_t src_mocs = intel_get_uc_mocs_index(fd);
 	uint8_t dst_mocs = src_mocs;
 	uint32_t bb;
-	int result;
+	uint8_t *psrc, *pdst;
+	int result, i;
 
 	bb = xe_bo_create(fd, 0, bb_size, region, 0);
 
-	blt_mem_copy_init(fd, &mem, MODE_BYTE, TYPE_LINEAR);
+	blt_mem_copy_init(fd, &mem, mode, type);
 	blt_set_mem_object(&mem.src, src_handle, size, pitch, width, height,
 			   region, src_mocs, DEFAULT_PAT_INDEX, COMPRESSION_DISABLED);
 	blt_set_mem_object(&mem.dst, dst_handle, size, pitch, width, height,
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
@@ -83,7 +120,7 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
 	gem_close(fd, bb);
 	put_ahnd(ahnd);
 
-	igt_assert_f(!result, "source and destination differ\n");
+	igt_assert_f(!result, "destination doesn't contain valid data\n");
 }
 
 /**
@@ -140,7 +177,8 @@ static void copy_test(int fd, struct rect *rect, enum blt_cmd_type cmd, uint32_t
 	};
 	uint32_t src_handle, dst_handle, vm, exec_queue;
 	uint32_t pitch = rect->pitch ?: rect->width;
-	uint32_t bo_size = ALIGN(pitch * rect->height, xe_get_default_alignment(fd));
+	uint32_t blocksize = rect->mode == MODE_PAGE ? pitch << 8 : pitch;
+	uint32_t bo_size = ALIGN(blocksize * rect->height, xe_get_default_alignment(fd));
 	intel_ctx_t *ctx;
 
 	src_handle = xe_bo_create(fd, 0, bo_size, region, 0);
@@ -150,8 +188,8 @@ static void copy_test(int fd, struct rect *rect, enum blt_cmd_type cmd, uint32_t
 	ctx = intel_ctx_xe(fd, vm, exec_queue, 0, 0, 0);
 
 	if (cmd == MEM_COPY)
-		mem_copy(fd, src_handle, dst_handle, ctx, bo_size,
-			 pitch, rect->width, rect->height, region);
+		mem_copy(fd, src_handle, dst_handle, ctx, TYPE_LINEAR, rect->mode,
+			 bo_size, pitch, rect->width, rect->height, region);
 	else if (cmd == MEM_SET)
 		mem_set(fd, dst_handle, ctx, bo_size, rect->width, 1, MEM_FILL, region);
 
@@ -167,11 +205,13 @@ igt_main
 	int fd;
 	struct igt_collection *set, *regions;
 	uint32_t region;
-	struct rect linear[] = { { 0, 0xfd, 1 },
-				 { 0, 0x369, 1 },
-				 { 0, 0x3fff, 1 },
-				 { 0, 0xfffe, 1 },
-				 { 0, 0x8fffe, 1 } };
+	struct rect linear[] = { { 0, 0xfd, 1, MODE_BYTE },
+				 { 0, 0x369, 1, MODE_BYTE },
+				 { 0, 0x3fff, 1, MODE_BYTE },
+				 { 0, 0xfffe, 1, MODE_BYTE },
+				 { 0, 0x8fffe, 1, MODE_BYTE } };
+	struct rect page[] = { { 0, 1, 1, MODE_PAGE },
+			       { 0, 17, 1, MODE_PAGE }};
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
@@ -191,6 +231,16 @@ igt_main
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

