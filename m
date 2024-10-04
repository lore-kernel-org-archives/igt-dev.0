Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA61ACFA765
	for <igt-dev@archiver.kernel.org>; Fri,  4 Oct 2024 10:41:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6728310E27D;
	Fri,  4 Oct 2024 10:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="imjjz694";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A007A10E27D
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Oct 2024 10:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728038511; x=1759574511;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=4lfWsmjB9GFHH7M/AenCWVsTDRkPP3/k7I8tGD6j4jU=;
 b=imjjz694BVrUYRa1gMgFulj7YV3ElRVscrWFa6NREl/MIKpxMfCWTaoY
 cbjlbZ05Ses8MInJuTqurVG5bO/pYIWTXGC2BsimHycN4GC5W5p9KAzFM
 4tDI/VSFVL+wQXo/w7QZs5HMwl2FOd54/dUcdWSHxjlSmv18Z0W3vBxo3
 gYUNhoaaCkdCqtRfgSTpGFdIDLQjWO5V6G+ljd9rajDe3QAnvMngMI/1D
 dl2BWMF58pkHVmYk1TVo9cJdbco6EOqkNs8Ov9L8kS9/VavFS53fFvJc0
 cioyphubjqD2LjhofUgZsgXIkJPFpepw0c7RLxQJRiCGMxbdZ7X4VXBg8 g==;
X-CSE-ConnectionGUID: cQ9lPyXkQqKdOXz4G5sqyw==
X-CSE-MsgGUID: SR1CKsVUQvCGLquJMHKx5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="31140544"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="31140544"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 03:41:51 -0700
X-CSE-ConnectionGUID: 8QQI1RQRTJ+Z+sygsKkT+w==
X-CSE-MsgGUID: WXIH1lAxSK+8Orzjg2fCrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="74778391"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 04 Oct 2024 03:41:50 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 04 Oct 2024 13:41:49 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 10/14] lib/intel_bufops: Provide pread/pwrite based
 fallback when we don't have WC
Date: Fri,  4 Oct 2024 13:41:17 +0300
Message-ID: <20241004104121.32750-11-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
References: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The linear<->tiled conversion code currently assume that we may
be able to use either cpu or wc mmaps. That is not true on all
systems. As a last resort provide a pread/pwrite based fallback.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/intel_bufops.c | 68 ++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 56 insertions(+), 12 deletions(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 619222019fd8..641f1dae91b5 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -549,10 +549,12 @@ static void __copy_ccs(struct buf_ops *bops, struct intel_buf *buf,
 	munmap(map, size);
 }
 
-static void *mmap_write(int fd, struct intel_buf *buf)
+static void *mmap_write(int fd, const struct intel_buf *buf, bool *malloced)
 {
 	void *map = NULL;
 
+	*malloced = false;
+
 	if (buf->bops->driver == INTEL_DRIVER_XE)
 		return xe_bo_map(fd, buf->handle, buf->surface[0].size);
 
@@ -580,7 +582,7 @@ static void *mmap_write(int fd, struct intel_buf *buf)
 				       I915_GEM_DOMAIN_CPU);
 	}
 
-	if (!map) {
+	if (!map && gem_mmap__has_wc(fd)) {
 		map = __gem_mmap_offset__wc(fd, buf->handle, 0, buf->surface[0].size,
 					    PROT_READ | PROT_WRITE);
 		if (!map)
@@ -591,13 +593,32 @@ static void *mmap_write(int fd, struct intel_buf *buf)
 			       I915_GEM_DOMAIN_WC, I915_GEM_DOMAIN_WC);
 	}
 
+	if (!map) {
+		*malloced = true;
+
+		map = malloc(buf->surface[0].size);
+		igt_assert(map);
+	}
+
 	return map;
 }
 
-static void *mmap_read(int fd, struct intel_buf *buf)
+static void munmap_write(void *map, int fd, const struct intel_buf *buf, bool malloced)
+{
+	if (malloced) {
+		igt_assert(__gem_write(fd, buf->handle, 0, map, buf->surface[0].size) == 0);
+		free(map);
+	} else {
+		munmap(map, buf->surface[0].size);
+	}
+}
+
+static void *mmap_read(int fd, struct intel_buf *buf, bool *malloced)
 {
 	void *map = NULL;
 
+	*malloced = false;
+
 	if (buf->bops->driver == INTEL_DRIVER_XE)
 		return xe_bo_map(fd, buf->handle, buf->surface[0].size);
 
@@ -622,7 +643,7 @@ static void *mmap_read(int fd, struct intel_buf *buf)
 			gem_set_domain(fd, buf->handle, I915_GEM_DOMAIN_CPU, 0);
 	}
 
-	if (!map) {
+	if (!map && gem_mmap__has_wc(fd)) {
 		map = __gem_mmap_offset__wc(fd, buf->handle, 0, buf->surface[0].size,
 					    PROT_READ);
 		if (!map)
@@ -632,9 +653,24 @@ static void *mmap_read(int fd, struct intel_buf *buf)
 		gem_set_domain(fd, buf->handle, I915_GEM_DOMAIN_WC, 0);
 	}
 
+	if (!map) {
+		map = malloc(buf->surface[0].size);
+		igt_assert(map);
+
+		igt_assert(__gem_read(fd, buf->handle, 0, map, buf->surface[0].size) == 0);
+	}
+
 	return map;
 }
 
+static void munmap_read(void *map, int fd, const struct intel_buf *buf, bool malloced)
+{
+	if (malloced)
+		free(map);
+	else
+		munmap(map, buf->surface[0].size);
+}
+
 static void __copy_linear_to(int fd, struct intel_buf *buf,
 			     const uint32_t *linear,
 			     int tiling, uint32_t swizzle)
@@ -642,7 +678,10 @@ static void __copy_linear_to(int fd, struct intel_buf *buf,
 	const tile_fn fn = __get_tile_fn_ptr(fd, tiling);
 	int height = intel_buf_height(buf);
 	int width = intel_buf_width(buf);
-	void *map = mmap_write(fd, buf);
+	bool malloced;
+	void *map;
+
+	map = mmap_write(fd, buf, &malloced);
 
 	for (int y = 0; y < height; y++) {
 		for (int x = 0; x < width; x++) {
@@ -655,7 +694,7 @@ static void __copy_linear_to(int fd, struct intel_buf *buf,
 		}
 	}
 
-	munmap(map, buf->surface[0].size);
+	munmap_write(map, fd, buf, malloced);
 }
 
 static void copy_linear_to_none(struct buf_ops *bops, struct intel_buf *buf,
@@ -706,7 +745,10 @@ static void __copy_to_linear(int fd, struct intel_buf *buf,
 	const tile_fn fn = __get_tile_fn_ptr(fd, tiling);
 	int height = intel_buf_height(buf);
 	int width = intel_buf_width(buf);
-	void *map = mmap_write(fd, buf);
+	bool malloced;
+	void *map;
+
+	map = mmap_write(fd, buf, &malloced);
 
 	for (int y = 0; y < height; y++) {
 		for (int x = 0; x < width; x++) {
@@ -719,7 +761,7 @@ static void __copy_to_linear(int fd, struct intel_buf *buf,
 		}
 	}
 
-	munmap(map, buf->surface[0].size);
+	munmap_write(map, fd, buf, malloced);
 }
 
 static void copy_none_to_linear(struct buf_ops *bops, struct intel_buf *buf,
@@ -803,25 +845,27 @@ static void copy_gtt_to_linear(struct buf_ops *bops, struct intel_buf *buf,
 static void copy_linear_to_wc(struct buf_ops *bops, struct intel_buf *buf,
 			      uint32_t *linear)
 {
+	bool malloced;
 	void *map;
 
 	DEBUGFN();
 
-	map = mmap_write(bops->fd, buf);
+	map = mmap_write(bops->fd, buf, &malloced);
 	memcpy(map, linear, buf->surface[0].size);
-	munmap(map, buf->surface[0].size);
+	munmap_write(map, bops->fd, buf, malloced);
 }
 
 static void copy_wc_to_linear(struct buf_ops *bops, struct intel_buf *buf,
 			      uint32_t *linear)
 {
+	bool malloced;
 	void *map;
 
 	DEBUGFN();
 
-	map = mmap_read(bops->fd, buf);
+	map = mmap_read(bops->fd, buf, &malloced);
 	igt_memcpy_from_wc(linear, map, buf->surface[0].size);
-	munmap(map, buf->surface[0].size);
+	munmap_read(map, bops->fd, buf, malloced);
 }
 
 void intel_buf_to_linear(struct buf_ops *bops, struct intel_buf *buf,
-- 
2.45.2

