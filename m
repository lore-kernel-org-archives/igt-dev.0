Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA444C4829A
	for <igt-dev@archiver.kernel.org>; Tue, 13 Feb 2024 10:01:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58CFE10E318;
	Tue, 13 Feb 2024 10:01:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XEZ42lrv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5486310E318
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Feb 2024 10:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707818501; x=1739354501;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ml3BLDuKs/2tQrvIXRM51TtkUjO+9PFt3L/Ya+VQdCY=;
 b=XEZ42lrvhabyBBmlp7ZiBJyDJR9HX07jbV26O8bKujEQRkMSwiLHo/7A
 ZaaaJDVJzn9+uixtRYz+sFNT2c2XYZQXZwZ4VTVePoblUqBncuau1URY4
 5QwuUXvq9v+aZZNrvgp7RUWjKGMiN3Hwwrt9YBHsZoXlpVqUzWrHDHTBf
 JR2qpTUI65/cZObjK/aRp/E0eHyDI9aOt2PaQ2Tub2WktJDjk0+MuwQQ7
 pPaz8DX2wwWAUc0IOx8S7/bYXO64euqYmO3nCDIaYbVFRxmhZ9pwy9jfD
 f7PZxmHivjQPGAt/M+yz/GbC5TBVttPlZAV3m0H/cZr6uYMI/OxQ8KYTT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="19232360"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="19232360"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 02:01:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="2815514"
Received: from gfmckenx-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.21.42])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 02:01:39 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 5/8] tests/intel: replace
 intel_buf_init_using_handle()
Date: Tue, 13 Feb 2024 10:01:22 +0000
Message-ID: <20240213100125.90085-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213100125.90085-1-matthew.auld@intel.com>
References: <20240213100125.90085-1-matthew.auld@intel.com>
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

Require the original object size, if the caller created the object and
convert all existing users over.

v2:(Zbigniew)
 - Remove old intel_buf_init_using_handle() prototype and assert size.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_bufops.c                  | 18 +++++++++++-------
 lib/intel_bufops.h                  | 19 ++++++++-----------
 tests/intel/gem_set_tiling_vs_blt.c |  7 ++++---
 3 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index fa7dc4de6..10e2d3dac 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -1011,7 +1011,7 @@ void intel_buf_close(struct buf_ops *bops, struct intel_buf *buf)
 }
 
 /**
- * intel_buf_init_using_handle
+ * intel_buf_init_using_handle_and_size
  * @bops: pointer to buf_ops
  * @handle: BO handle created by the caller
  * @buf: pointer to intel_buf structure to be filled
@@ -1021,6 +1021,7 @@ void intel_buf_close(struct buf_ops *bops, struct intel_buf *buf)
  * @alignment: alignment of the stride for linear surfaces
  * @tiling: surface tiling
  * @compression: surface compression type
+ * @size: real bo size
  *
  * Function configures BO handle within intel_buf structure passed by the caller
  * (with all its metadata - width, height, ...). Useful if BO was created
@@ -1029,14 +1030,17 @@ void intel_buf_close(struct buf_ops *bops, struct intel_buf *buf)
  * Note: intel_buf_close() can be used because intel_buf is aware it is not
  * buffer owner so it won't close it underneath.
  */
-void intel_buf_init_using_handle(struct buf_ops *bops,
-				 uint32_t handle,
-				 struct intel_buf *buf,
-				 int width, int height, int bpp, int alignment,
-				 uint32_t req_tiling, uint32_t compression)
+void intel_buf_init_using_handle_and_size(struct buf_ops *bops,
+					  uint32_t handle,
+					  struct intel_buf *buf,
+					  int width, int height, int bpp, int alignment,
+					  uint32_t req_tiling, uint32_t compression,
+					  uint64_t size)
 {
+	igt_assert(handle);
+	igt_assert(size);
 	__intel_buf_init(bops, handle, buf, width, height, bpp, alignment,
-			 req_tiling, compression, 0, 0, -1, DEFAULT_PAT_INDEX);
+			 req_tiling, compression, size, 0, -1, DEFAULT_PAT_INDEX);
 }
 
 /**
diff --git a/lib/intel_bufops.h b/lib/intel_bufops.h
index 54a143c5b..0b68482b2 100644
--- a/lib/intel_bufops.h
+++ b/lib/intel_bufops.h
@@ -150,11 +150,6 @@ void intel_buf_init_in_region(struct buf_ops *bops,
 			      uint64_t region);
 void intel_buf_close(struct buf_ops *bops, struct intel_buf *buf);
 
-void intel_buf_init_using_handle(struct buf_ops *bops,
-				 uint32_t handle,
-				 struct intel_buf *buf,
-				 int width, int height, int bpp, int alignment,
-				 uint32_t req_tiling, uint32_t compression);
 void intel_buf_init_full(struct buf_ops *bops,
 			 uint32_t handle,
 			 struct intel_buf *buf,
@@ -172,12 +167,14 @@ struct intel_buf *intel_buf_create(struct buf_ops *bops,
 				   int bpp, int alignment,
 				   uint32_t req_tiling, uint32_t compression);
 
-struct intel_buf *intel_buf_create_using_handle(struct buf_ops *bops,
-						uint32_t handle,
-						int width, int height,
-						int bpp, int alignment,
-						uint32_t req_tiling,
-						uint32_t compression);
+void intel_buf_init_using_handle_and_size(struct buf_ops *bops,
+					  uint32_t handle,
+					  struct intel_buf *buf,
+					  int width, int height,
+					  int bpp, int alignment,
+					  uint32_t req_tiling,
+					  uint32_t compression,
+					  uint64_t size);
 
 struct intel_buf *intel_buf_create_using_handle_and_size(struct buf_ops *bops,
 							 uint32_t handle,
diff --git a/tests/intel/gem_set_tiling_vs_blt.c b/tests/intel/gem_set_tiling_vs_blt.c
index e9d5e3c63..9077e0f3f 100644
--- a/tests/intel/gem_set_tiling_vs_blt.c
+++ b/tests/intel/gem_set_tiling_vs_blt.c
@@ -138,9 +138,10 @@ static void do_test(struct buf_ops *bops, uint32_t tiling, unsigned stride,
 	gem_munmap(ptr, TEST_SIZE);
 
 	/* Reuse previously aligned in the gtt object */
-	intel_buf_init_using_handle(bops, test_buf->handle, test_buf,
-				    TEST_WIDTH(stride), TEST_HEIGHT(stride), 32,
-				    0, tiling, I915_COMPRESSION_NONE);
+	intel_buf_init_using_handle_and_size(bops, test_buf->handle, test_buf,
+					     TEST_WIDTH(stride), TEST_HEIGHT(stride), 32,
+					     0, tiling, I915_COMPRESSION_NONE,
+					     test_buf->bo_size);
 	igt_assert_eq_u32(intel_buf_size(test_buf), TEST_SIZE);
 	intel_buf_set_ownership(test_buf, true);
 	intel_bb_add_intel_buf(ibb, test_buf, false);
-- 
2.43.0

