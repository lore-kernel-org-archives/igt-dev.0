Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2403CCD1296
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 10:09:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DFA710E639;
	Wed, 10 Apr 2024 10:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SrPYiURF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411FB10E639
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 10:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712743764; x=1744279764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w6cmM/LQjD3auP2NWEW1iPjDKdszKkVS+lxTpKCYQyU=;
 b=SrPYiURFBKYZyD1XjtS1J2X+7I/BA8VkMDMl06Z23nNmWYrmKLQRSDVb
 rwYnojoqz1690Nwf2ADiI6GfxNHDaQkN9zLZUHv+JqAzaQ8y89DuDkUUz
 odgfUCms2SjoTfWRMWmcdaUJyvMyWWULnCArP++UAvbDn6OSW9oM2cS1M
 3Z7WuOtZssY2Mm2uEhRZ9/aAk8PG/OQEkJvdI9BctJZ4vtQpDjH+psf3u
 s2JUv+XfDej3+w9pAhoBMaGQrS9gCn8/t0Jtn4Z74l06oSqq+YegolfkF
 f5jUbpnl5nsgD/6fjCej8jb6AmsPLYaZiDh33eoGUw1UUXv1MpkTAed5q A==;
X-CSE-ConnectionGUID: TqlEysM7Qe2auMQl1PrXXQ==
X-CSE-MsgGUID: rfBWMav9TvCJWC6/2ELHSQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18662362"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="18662362"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 03:09:24 -0700
X-CSE-ConnectionGUID: 4OL25qbPRhaRAXb1OPNnHA==
X-CSE-MsgGUID: FUj31ToMQ5204t8VhEgFXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25023319"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.142])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 03:09:22 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Karolina Stolarek <karolina.stolarek@intel.com>,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH i-g-t v2 1/2] lib/intel_blt: Add functions which extract and
 check object ccs data
Date: Wed, 10 Apr 2024 12:09:14 +0200
Message-Id: <20240410100915.48541-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240410100915.48541-1-zbigniew.kempczynski@intel.com>
References: <20240410100915.48541-1-zbigniew.kempczynski@intel.com>
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

In tests which use compression we did very naive check in which we
compare source and destination surface. For linear we could expect
differences are related to compression, unfortunately for tiled data
this attitude is not appropriate due to natural data layout difference.

Lets add helpers to extract surface ccs data and check if such
surface is compressed. Function which extracts ccs data is defined
as public to dump such data to png in the future.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>

---
v2: fix use-before-init variable + addressing minor nits (Karolina)
---
 lib/intel_blt.c | 122 ++++++++++++++++++++++++++++++++++++++++++++++++
 lib/intel_blt.h |  11 +++++
 2 files changed, 133 insertions(+)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index fe0a45cb8e..dc6669889a 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -2094,6 +2094,128 @@ void blt_surface_info(const char *info, const struct blt_copy_object *obj)
 		 obj->x1, obj->y1, obj->x2, obj->y2);
 }
 
+/**
+ * blt_surface_get_flatccs_data:
+ * @fd: drm fd
+ * @ctx: intel_ctx_t context
+ * @e: blitter engine for @ctx
+ * @ahnd: allocator handle
+ * @obj: object from which flatccs data will be extracted
+ *
+ * Function executes ctrl-surf-copy to extract object ccs data from flatccs
+ * area. Memory for the result ccs data are allocated in the function and must
+ * be freed by the caller.
+ */
+void blt_surface_get_flatccs_data(int fd,
+				  intel_ctx_t *ctx,
+				  const struct intel_execution_engine2 *e,
+				  uint64_t ahnd,
+				  const struct blt_copy_object *obj,
+				  uint32_t **ccsptr, uint64_t *sizeptr)
+{
+	struct blt_ctrl_surf_copy_data surf = {};
+	uint32_t bb, ccs, *ccsmap;
+	uint64_t bb_size, ccssize = obj->size / CCS_RATIO(fd);
+	uint32_t *ccscopy;
+	uint32_t sysmem;
+	uint8_t uc_mocs = intel_get_uc_mocs_index(fd);
+	uint8_t comp_pat_index = DEFAULT_PAT_INDEX;
+
+	igt_assert(ccsptr);
+	igt_assert(sizeptr);
+
+	blt_ctrl_surf_copy_init(fd, &surf);
+
+	ccscopy = (uint32_t *)malloc(ccssize);
+	igt_assert(ccscopy);
+
+	if (surf.driver == INTEL_DRIVER_XE) {
+		uint16_t cpu_caching;
+		uint64_t ccs_bo_size;
+
+		sysmem = system_memory(fd);
+		cpu_caching = __xe_default_cpu_caching(fd, sysmem, 0);
+		ccs_bo_size = ALIGN(ccssize, xe_get_default_alignment(fd));
+
+		if (AT_LEAST_GEN(intel_get_drm_devid(fd), 20) && obj->compression) {
+			comp_pat_index  = intel_get_pat_idx_uc_comp(fd);
+			cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
+		}
+
+		ccs = xe_bo_create_caching(fd, 0, ccs_bo_size, sysmem, 0, cpu_caching);
+		bb_size = xe_bb_size(fd, SZ_4K);
+		bb = xe_bo_create(fd, 0, bb_size, sysmem, 0);
+	} else {
+		sysmem = REGION_SMEM;
+		ccs = gem_create(fd, ccssize);
+		bb_size = 4096;
+		igt_assert_eq(__gem_create(fd, &bb_size, &bb), 0);
+	}
+
+	blt_set_ctrl_surf_object(&surf.src, obj->handle, obj->region, obj->size,
+				 uc_mocs, comp_pat_index, BLT_INDIRECT_ACCESS);
+	blt_set_ctrl_surf_object(&surf.dst, ccs, sysmem, ccssize, uc_mocs,
+				 DEFAULT_PAT_INDEX, DIRECT_ACCESS);
+	blt_set_batch(&surf.bb, bb, bb_size, sysmem);
+	blt_ctrl_surf_copy(fd, ctx, e, ahnd, &surf);
+
+	if (surf.driver == INTEL_DRIVER_XE) {
+		intel_ctx_xe_sync(ctx, true);
+		ccsmap = xe_bo_map(fd, ccs, surf.dst.size);
+	} else {
+		gem_sync(fd, surf.dst.handle);
+		ccsmap = gem_mmap__device_coherent(fd, ccs, 0, surf.dst.size,
+						   PROT_READ | PROT_WRITE);
+	}
+
+	memcpy(ccscopy, ccsmap, ccssize);
+	munmap(ccsmap, surf.dst.size);
+
+	gem_close(fd, ccs);
+	gem_close(fd, bb);
+	put_offset(ahnd, ccs);
+	put_offset(ahnd, bb);
+	if (surf.driver == INTEL_DRIVER_XE)
+		intel_allocator_bind(ahnd, 0, 0);
+
+	*ccsptr = ccscopy;
+	*sizeptr = ccssize;
+}
+
+/**
+ * blt_surface_is_compressed:
+ * @fd: drm fd
+ * @ctx: intel_ctx_t context
+ * @e: blitter engine for @ctx
+ * @ahnd: allocator handle
+ * @obj: object to check
+ *
+ * Function extracts object ccs data and check it contains any non-zero
+ * value what means surface is compressed. Returns true if it is, otherwise
+ * false.
+ */
+bool blt_surface_is_compressed(int fd,
+			       intel_ctx_t *ctx,
+			       const struct intel_execution_engine2 *e,
+			       uint64_t ahnd,
+			       const struct blt_copy_object *obj)
+{
+	uint64_t size;
+	uint32_t *ptr;
+	bool is_compressed = false;
+
+	blt_surface_get_flatccs_data(fd, ctx, e, ahnd, obj, &ptr, &size);
+	for (int i = 0; i < size / sizeof(*ptr); i++) {
+		if (ptr[i] != 0) {
+			is_compressed = true;
+			break;
+		}
+	}
+	free(ptr);
+
+	return is_compressed;
+}
+
 /**
  * blt_surface_to_png:
  * @fd: drm fd
diff --git a/lib/intel_blt.h b/lib/intel_blt.h
index 1f6c713596..d9c4d107f1 100644
--- a/lib/intel_blt.h
+++ b/lib/intel_blt.h
@@ -311,6 +311,17 @@ void blt_set_ctrl_surf_object(struct blt_ctrl_surf_copy_object *obj,
 			      uint8_t mocs_index, uint8_t pat_index,
 			      enum blt_access_type access_type);
 
+void blt_surface_get_flatccs_data(int fd,
+				  intel_ctx_t *ctx,
+				  const struct intel_execution_engine2 *e,
+				  uint64_t ahnd,
+				  const struct blt_copy_object *obj,
+				  uint32_t **ccsptr, uint64_t *sizeptr);
+bool blt_surface_is_compressed(int fd,
+			       intel_ctx_t *ctx,
+			       const struct intel_execution_engine2 *e,
+			       uint64_t ahnd,
+			       const struct blt_copy_object *obj);
 void blt_surface_info(const char *info,
 		      const struct blt_copy_object *obj);
 void blt_surface_fill_rect(int fd, const struct blt_copy_object *obj,
-- 
2.34.1

