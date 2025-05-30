Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525DBC54F30
	for <igt-dev@archiver.kernel.org>; Fri, 30 May 2025 06:41:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F4610E03A;
	Fri, 30 May 2025 06:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mad6fK33";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA86A10E7C4
 for <igt-dev@lists.freedesktop.org>; Fri, 30 May 2025 06:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748587309; x=1780123309;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8NwQjjTpT+c1iKN2Fu2sE1NW/n2Z8gMDgaRZ7p82aH8=;
 b=mad6fK33TZoHcRz2g0/E5dL0VMLakrmK+Of2J7Adr4AAPW6IJmSQIqN1
 UFlfRZyC5SBVL5GjxpDJDF3N7Z1rfKLecrCDLKMLRNwbjy2VJRy3Kn5zq
 hUp3CjNfA/pH8JqXK6ARbwTKfs6xg4H7mmvHq4VdSFIvUQmbfZ2qDIflj
 wE0b15mTg4zGv7M9ie9J96Em5NhsabHjREwaX9IgpRqZd38t45dhgpDEc
 C536WFbiXoc6UrtzWEtFCsauNcHeuQkhk9vh8FDe1AoLAmXyFA8l4gwUv
 kVcMDcWbCaRWBpu2/b/DlkZNglwF8BkfIjg+OG3cM2fW4PuPEsYDtN61+ Q==;
X-CSE-ConnectionGUID: NMZgzDwSRAGrCseiqIEoJA==
X-CSE-MsgGUID: q6X+nIwAQi6dNBzw8wBMDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="68095513"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="68095513"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 23:41:48 -0700
X-CSE-ConnectionGUID: DyraKukKQfGdt56l7/+DeA==
X-CSE-MsgGUID: ZYRdkZdbRc6tHGk+8nR1/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="144131030"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.174])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 23:41:46 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v4 10/11] tests/xe_copy_basic: add mem-copy matrix type
 subtests
Date: Fri, 30 May 2025 08:40:49 +0200
Message-ID: <20250530064050.1560398-11-zbigniew.kempczynski@intel.com>
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

Verify intel_blt is able to properly copy matrix from one buffer
to another.

Cc: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_copy_basic.c | 47 ++++++++++++++++++++++++++++++++++---
 1 file changed, 44 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
index 9957e93ed9..f2f27c0c57 100644
--- a/tests/intel/xe_copy_basic.c
+++ b/tests/intel/xe_copy_basic.c
@@ -61,6 +61,18 @@ struct rect {
  * @17: 17
  */
 
+/**
+ *
+ * SUBTEST: mem-matrix-copy-%s
+ * Description: Test validates MEM_COPY command in matrix type.
+ *              Size %arg[1] represents width x height.
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
@@ -77,6 +89,9 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
 	uint8_t *psrc, *pdst;
 	int result, i;
 
+	igt_debug("size: %u, pitch: %u, width: %u, height: %u (type: %d, mode: %d)\n",
+		  size, pitch, width, height, type, mode);
+
 	bb = xe_bo_create(fd, 0, bb_size, region, 0);
 
 	blt_mem_copy_init(fd, &mem, mode, type);
@@ -84,6 +99,7 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
 			   region, src_mocs, DEFAULT_PAT_INDEX, COMPRESSION_DISABLED);
 	blt_set_mem_object(&mem.dst, dst_handle, size, pitch, width, height,
 			   region, dst_mocs, DEFAULT_PAT_INDEX, COMPRESSION_DISABLED);
+
 	mem.src.ptr = xe_bo_map(fd, src_handle, size);
 	mem.dst.ptr = xe_bo_map(fd, dst_handle, size);
 	psrc = (uint8_t *) mem.src.ptr;
@@ -110,8 +126,20 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
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
@@ -188,8 +216,10 @@ static void copy_test(int fd, struct rect *rect, enum blt_cmd_type cmd, uint32_t
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
 
@@ -212,6 +242,7 @@ igt_main
 				 { 0, 0x8fffe, 1, MODE_BYTE } };
 	struct rect page[] = { { 0, 1, 1, MODE_PAGE },
 			       { 0, 17, 1, MODE_PAGE }};
+	struct rect matrix[] = { { 4, 2, 2 }, { 256, 200, 127 } };
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
@@ -241,6 +272,16 @@ igt_main
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

