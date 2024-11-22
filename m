Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6ECEE65D34
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 08:48:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9449C10EB17;
	Fri, 22 Nov 2024 08:48:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nhb+N543";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4490E10EB09
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 08:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732265290; x=1763801290;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=7i2M3vkZc5/3h6wufHa0KQdncGqwIByNHLFX1t35rdc=;
 b=Nhb+N54362XA6gyGFbGe8O9M1Zk+Ludm59N+oYDfAiyEO3MVmxnXDWOs
 ndgqfVrVkKjx9jNXJ8ETAJdkec3Uj2BlS49VbeFwHJzvEdSOS1kxCOsOX
 lSIobexKiAEKc7hnphwvaQ3JDL2FEJIOwdxGZ0+XwyqglTaxnE5oa5+A1
 Rvu/jYmhPHG6cMZBwkV5b8xawFFGfa0euNbJ3xY8t8dJiEQj2WRuTbohy
 UghulUDtLQ/gmi/byGzLU6gdG7IdTP9ufI5k0ySvK4U7XfGfIp4ZhBUaW
 nIn3nHHShNOuuV8ZiXvnar2xhH2ZeDZPWxPvDk91BiEMdNtAbv0NmpfZH Q==;
X-CSE-ConnectionGUID: 8dcBUOrTTkeGfp6KIdf/rA==
X-CSE-MsgGUID: gcGhNtzhTrqfQHbbFng9Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="20004054"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="20004054"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 00:48:10 -0800
X-CSE-ConnectionGUID: MHgP0r+NQdC2M2ZtWGP8rQ==
X-CSE-MsgGUID: JHGeW5FFTaOYbMQeJpPsoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="90679388"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 22 Nov 2024 00:48:08 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Nov 2024 10:48:07 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 1/4] lib/intel_bufops: Add support for gen2 and i915
 tiling layouts
Date: Fri, 22 Nov 2024 10:48:01 +0200
Message-ID: <20241122084804.29669-2-ville.syrjala@linux.intel.com>
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

Add support for tiling formats on gen2/3.

Our tile formats are as follows:
X-tile:
 gen2:  128B x 16, made of  8B QWords
 gen3:  512B x  8, made of 32B SWords
 gen4+: 512B x  8, made of 16B OWords
Y-tile:
 gen2:  128B x 16, made of  8B QWords
 i915:  512B x  8, made of 32B SWords
 i945+: 128B x 32, made of 16B OWords

We already had the i945+ Y-tile and i915+ X-tile
(since the i945 OW vs. i915 SW makes no difference
for X-tile). So just need to deal with gen2 X/Y-tile
and i915 Y-tile.

Note that the gen2 check that was there was incorrect
becasue it completely forgot about i915 Y-tile.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/intel_bufops.c | 83 +++++++++++++++++++++++++++++++---------------
 1 file changed, 56 insertions(+), 27 deletions(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 600a485362b5..619222019fd8 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -307,10 +307,9 @@ static void *linear_ptr(void *ptr,
 
 static void *x_ptr(void *ptr,
 		   unsigned int x, unsigned int y,
-		   unsigned int stride, unsigned int cpp)
+		   unsigned int stride, unsigned int cpp,
+		   const int tile_width, const int tile_height)
 {
-	const int tile_width = 512;
-	const int tile_height = 8;
 	const int tile_size = tile_width * tile_height;
 	int offset_x, offset_y, pos;
 	int tile_x, tile_y;
@@ -327,13 +326,27 @@ static void *x_ptr(void *ptr,
 	return ptr + pos;
 }
 
+static void *gen2_x_ptr(void *ptr,
+			unsigned int x, unsigned int y,
+			unsigned int stride, unsigned int cpp)
+{
+	return x_ptr(ptr, x, y, stride, cpp, 128, 16);
+}
+
+static void *gen3_x_ptr(void *ptr,
+			unsigned int x, unsigned int y,
+			unsigned int stride, unsigned int cpp)
+{
+	return x_ptr(ptr, x, y, stride, cpp, 512, 8);
+}
+
 static void *y_ptr(void *ptr,
 		   unsigned int x, unsigned int y,
-		   unsigned int stride, unsigned int cpp)
+		   unsigned int stride, unsigned int cpp,
+		   const int tile_width,
+		   const int tile_height,
+		   const int owords)
 {
-	const int tile_width = 128;
-	const int tile_height = 32;
-	const int owords = 16;
 	const int tile_size = tile_width * tile_height;
 	int offset_x, offset_y, pos;
 	int shift_x, shift_y;
@@ -352,6 +365,27 @@ static void *y_ptr(void *ptr,
 	return ptr + pos;
 }
 
+static void *gen2_y_ptr(void *ptr,
+			unsigned int x, unsigned int y,
+			unsigned int stride, unsigned int cpp)
+{
+	return y_ptr(ptr, x, y, stride, cpp, 128, 16, 8);
+}
+
+static void *i915_y_ptr(void *ptr,
+			unsigned int x, unsigned int y,
+			unsigned int stride, unsigned int cpp)
+{
+	return y_ptr(ptr, x, y, stride, cpp, 512, 8, 32);
+}
+
+static void *i945_y_ptr(void *ptr,
+			unsigned int x, unsigned int y,
+			unsigned int stride, unsigned int cpp)
+{
+	return y_ptr(ptr, x, y, stride, cpp, 128, 32, 16);
+}
+
 /*
  * (x,y) to memory location in tiled-4 surface
  *
@@ -426,8 +460,10 @@ static void *yf_ptr(void *ptr,
 
 typedef void *(*tile_fn)(void *, unsigned int, unsigned int,
 			unsigned int, unsigned int);
-static tile_fn __get_tile_fn_ptr(int tiling)
+static tile_fn __get_tile_fn_ptr(int fd, int tiling)
 {
+	const struct intel_device_info *info =
+		intel_get_device_info(intel_get_drm_devid(fd));
 	tile_fn fn = NULL;
 
 	switch (tiling) {
@@ -435,10 +471,18 @@ static tile_fn __get_tile_fn_ptr(int tiling)
 		fn = linear_ptr;
 		break;
 	case I915_TILING_X:
-		fn = x_ptr;
+		if (info->graphics_ver == 2)
+			fn = gen2_x_ptr;
+		else
+			fn = gen3_x_ptr;
 		break;
 	case I915_TILING_Y:
-		fn = y_ptr;
+		if (info->graphics_ver == 2)
+			fn = gen2_y_ptr;
+		else if (info->is_grantsdale || info->is_alviso)
+			fn = i915_y_ptr;
+		else
+			fn = i945_y_ptr;
 		break;
 	case I915_TILING_Yf:
 		fn = yf_ptr;
@@ -595,7 +639,7 @@ static void __copy_linear_to(int fd, struct intel_buf *buf,
 			     const uint32_t *linear,
 			     int tiling, uint32_t swizzle)
 {
-	const tile_fn fn = __get_tile_fn_ptr(tiling);
+	const tile_fn fn = __get_tile_fn_ptr(fd, tiling);
 	int height = intel_buf_height(buf);
 	int width = intel_buf_width(buf);
 	void *map = mmap_write(fd, buf);
@@ -659,7 +703,7 @@ static void copy_linear_to_tile4(struct buf_ops *bops, struct intel_buf *buf,
 static void __copy_to_linear(int fd, struct intel_buf *buf,
 			     uint32_t *linear, int tiling, uint32_t swizzle)
 {
-	const tile_fn fn = __get_tile_fn_ptr(tiling);
+	const tile_fn fn = __get_tile_fn_ptr(fd, tiling);
 	int height = intel_buf_height(buf);
 	int width = intel_buf_width(buf);
 	void *map = mmap_write(fd, buf);
@@ -1699,21 +1743,6 @@ static struct buf_ops *__buf_ops_create(int fd, bool check_idempotency)
 		return bops;
 	}
 
-	/*
-	 * Warning!
-	 *
-	 * Gen2 software tiling/detiling is not supported! (yet).
-	 *
-	 * If you are brave hero with an access to Gen2 you can save the world.
-	 * Until then we're doomed to use only hardware (de)tiling.
-	 *
-	 * Ok, you have been warned.
-	 */
-	if (bops->intel_gen == 2) {
-		igt_warn("Gen2 detected. HW (de)tiling support only.");
-		return bops;
-	}
-
 	/* Let's probe X and Y hw tiling support */
 	if (is_hw_tiling_supported(bops, I915_TILING_X)) {
 		bool swizzling_supported;
-- 
2.45.2

