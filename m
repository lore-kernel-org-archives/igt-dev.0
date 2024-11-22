Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C80E65D2F
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 08:48:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D34910EB01;
	Fri, 22 Nov 2024 08:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pk8AtcPl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F67810EB01
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 08:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732265293; x=1763801293;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AsxIcIx3CvSjCOSqa15Oy+bLGIP5VZRWNJhAW4fwHao=;
 b=Pk8AtcPl2U/GOGHFu9m4LyWLUQC/cvl/LTldg5EjbTeQH9p6AKX+A0u+
 ug6BDfPK35tnnGEHFFTGGhrikw0jKnFyWFJDkeJdGtPjITMBpGYRQDyfr
 l13ecrX0vglgpm5JdqhD6+ATQC7GQNAPt1iugQG8QY/XiW9EtEEGVTrLN
 xEmf6Q28FLwi7aLXzbkRtS7PFfuP6HZKa5Ee0LDq7U3+wPgSQgG778V2e
 aYq9Y6oOVIWBBrfQL/uNAQiL1OZ6jEVSq0POHlPo0i2JG0w7ulidbVgtY
 eGAQaOPBuFKVDV/8VCkc4szLYOgTTdbKyZi0vPCwzc+tgVvauQI33ZW8h A==;
X-CSE-ConnectionGUID: HmV9FRGUSfOwpor1RukZ5g==
X-CSE-MsgGUID: RHX/xZ0XSNeSE0hQrw7LpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="20004059"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="20004059"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 00:48:13 -0800
X-CSE-ConnectionGUID: m4gJdcGQQC69TJ+wF4oHxQ==
X-CSE-MsgGUID: 8oO0Oy3YTLSZDWh4cvUSCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="90679406"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 22 Nov 2024 00:48:11 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Nov 2024 10:48:10 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 2/4] lib/intel_bufops: Provide pread/pwrite based
 fallback when we don't have WC
Date: Fri, 22 Nov 2024 10:48:02 +0200
Message-ID: <20241122084804.29669-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241122084804.29669-1-ville.syrjala@linux.intel.com>
References: <20241122084804.29669-1-ville.syrjala@linux.intel.com>
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

v2: Add missing *malloced=true (Kamil)

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/intel_bufops.c | 68 ++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 56 insertions(+), 12 deletions(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 619222019fd8..15f23d0e1375 100644
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
@@ -591,13 +593,31 @@ static void *mmap_write(int fd, struct intel_buf *buf)
 			       I915_GEM_DOMAIN_WC, I915_GEM_DOMAIN_WC);
 	}
 
+	if (!map) {
+		map = malloc(buf->surface[0].size);
+		igt_assert(map);
+		*malloced = true;
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
 
@@ -622,7 +642,7 @@ static void *mmap_read(int fd, struct intel_buf *buf)
 			gem_set_domain(fd, buf->handle, I915_GEM_DOMAIN_CPU, 0);
 	}
 
-	if (!map) {
+	if (!map && gem_mmap__has_wc(fd)) {
 		map = __gem_mmap_offset__wc(fd, buf->handle, 0, buf->surface[0].size,
 					    PROT_READ);
 		if (!map)
@@ -632,9 +652,25 @@ static void *mmap_read(int fd, struct intel_buf *buf)
 		gem_set_domain(fd, buf->handle, I915_GEM_DOMAIN_WC, 0);
 	}
 
+	if (!map) {
+		map = malloc(buf->surface[0].size);
+		igt_assert(map);
+		*malloced = true;
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

