Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796C5CFA768
	for <igt-dev@archiver.kernel.org>; Fri,  4 Oct 2024 10:41:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2619A10E2A2;
	Fri,  4 Oct 2024 10:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wqkr9tjA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B23F110E295
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Oct 2024 10:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728038502; x=1759574502;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=fscv6gbhXoZD+/Wa7bBuppVFAYOBsOuLvsOeTF0yxLc=;
 b=Wqkr9tjAui2mhp9H4oFmyZ61P/G6u/A7MW5HAl2r/qmoWCfIB+mPBL52
 ffmWKrZ5hBWEoh+fFvZoghfkDNGSAZzQvAtwCWiUBOXVTjgdUYOZl93IA
 jXH5kFe6BQ4ljtD+fgf/h5B9+RY09uvu4fkeDf7EUcAo1Vz7C0JPQqWHa
 sJihzsorRiIGgZb40ngDfUy5P4j/EImh13wDDc9YU7ujJxaq3sJ7XJNks
 VqgW9zYol1YjM2NM13Z8OI0nOB6rE+BIOd8FEhUUafHQPe82AU6J42Z/2
 bF+C7bS3oii0XIBSmcm9wpEBfEfgyWDRpNVSyZtDIwQsABHB4vcf3zhow g==;
X-CSE-ConnectionGUID: iI4zFsHETXSKdjDL2/5FyQ==
X-CSE-MsgGUID: ZYU4pzvsQyWTNYWeXYOrlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="31140504"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="31140504"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 03:41:40 -0700
X-CSE-ConnectionGUID: j6mqqjawQ/Km0r9qUzx64g==
X-CSE-MsgGUID: 2j3YSn/HSCiut9xEa7v1/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="74778313"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 04 Oct 2024 03:41:39 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 04 Oct 2024 13:41:38 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 06/14] lib/igt_draw: Add support for gen2 and i915
 tiling layouts
Date: Fri,  4 Oct 2024 13:41:13 +0300
Message-ID: <20241004104121.32750-7-ville.syrjala@linux.intel.com>
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

Add the full complement of X/Y-tile<->linear conversions.

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

And we finish off by nuking the (technically
incorrect) gen5+ checks so that people can use
this.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_draw.c | 124 ++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 98 insertions(+), 26 deletions(-)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index dea73aca57b5..93924ece8250 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -204,35 +204,65 @@ static void untile(int tiled_pos, int x_tile_size, int y_tile_size,
 }
 
 static int linear_x_y_to_xtiled_pos(int x, int y, uint32_t stride, int swizzle,
-				    int bpp)
+				    int bpp, int x_tile_size, int y_tile_size)
 {
 	int pos;
 	int pixel_size = bpp / 8;
 
 	x *= pixel_size;
-	pos = tile(x, y, 512, 8, stride, true);
+	pos = tile(x, y, x_tile_size, y_tile_size, stride, true);
 	pos = swizzle_addr(pos, swizzle);
 	return pos / pixel_size;
 }
 
+static int gen2_linear_x_y_to_xtiled_pos(int x, int y, uint32_t stride, int swizzle,
+					 int bpp)
+{
+	return linear_x_y_to_xtiled_pos(x, y, stride, swizzle, bpp, 128, 16);
+}
+
+static int gen3_linear_x_y_to_xtiled_pos(int x, int y, uint32_t stride, int swizzle,
+					 int bpp)
+{
+	return linear_x_y_to_xtiled_pos(x, y, stride, swizzle, bpp, 512, 8);
+}
+
 static int linear_x_y_to_ytiled_pos(int x, int y, uint32_t stride, int swizzle,
-				    int bpp)
+				    int bpp, int x_tile_size, int y_tile_size,
+				    int ow_size)
 {
 	int ow_tile_n, pos;
-	int ow_size = 16;
 	int pixel_size = bpp / 8;
 
 	/* We have an Y tiling of OWords, so use the tile() function to get the
 	 * OW number, then adjust to the fact that the OW may have more than one
 	 * pixel. */
 	x *= pixel_size;
-	ow_tile_n = tile(x / ow_size, y, 128 / ow_size, 32,
-			 stride / ow_size, false);
+	ow_tile_n = tile(x / ow_size, y, x_tile_size / ow_size,
+			 y_tile_size, stride / ow_size, false);
 	pos = ow_tile_n * ow_size + (x % ow_size);
 	pos = swizzle_addr(pos, swizzle);
 	return pos / pixel_size;
 }
 
+static int gen2_linear_x_y_to_ytiled_pos(int x, int y, uint32_t stride, int swizzle,
+					 int bpp)
+{
+	return linear_x_y_to_ytiled_pos(x, y, stride, swizzle, bpp, 128, 16, 8);
+}
+
+static int i915_linear_x_y_to_ytiled_pos(int x, int y, uint32_t stride, int swizzle,
+					 int bpp)
+{
+	return linear_x_y_to_ytiled_pos(x, y, stride, swizzle, bpp, 512, 8, 32);
+}
+
+static int i945_linear_x_y_to_ytiled_pos(int x, int y, uint32_t stride, int swizzle,
+					 int bpp)
+{
+	return linear_x_y_to_ytiled_pos(x, y, stride, swizzle, bpp, 128, 32, 16);
+}
+
 #define OW_SIZE 16			/* in bytes */
 #define TILE_4_SUBTILE_SIZE 64		/* in bytes */
 #define TILE_4_WIDTH 128		/* in bytes */
@@ -299,32 +329,63 @@ static int linear_x_y_to_4tiled_pos(int x, int y, uint32_t stride, int swizzle,
 }
 
 static void xtiled_pos_to_x_y_linear(int tiled_pos, uint32_t stride,
-				     int swizzle, int bpp, int *x, int *y)
+				     int swizzle, int bpp, int *x, int *y,
+				     int x_tile_size, int y_tile_size)
 {
 	int pixel_size = bpp / 8;
 
 	tiled_pos = swizzle_addr(tiled_pos, swizzle);
 
-	untile(tiled_pos, 512, 8, stride, true, x, y);
+	untile(tiled_pos, x_tile_size, y_tile_size, stride, true, x, y);
 	*x /= pixel_size;
 }
 
+static void gen2_xtiled_pos_to_x_y_linear(int tiled_pos, uint32_t stride,
+					  int swizzle, int bpp, int *x, int *y)
+{
+	return xtiled_pos_to_x_y_linear(tiled_pos, stride, swizzle, bpp, x, y, 128, 16);
+}
+
+static void gen3_xtiled_pos_to_x_y_linear(int tiled_pos, uint32_t stride,
+					  int swizzle, int bpp, int *x, int *y)
+{
+	return xtiled_pos_to_x_y_linear(tiled_pos, stride, swizzle, bpp, x, y, 512, 8);
+}
+
 static void ytiled_pos_to_x_y_linear(int tiled_pos, uint32_t stride,
-				     int swizzle, int bpp, int *x, int *y)
+				     int swizzle, int bpp, int *x, int *y,
+				     int x_tile_size, int y_tile_size, int ow_size)
 {
 	int ow_tile_n;
-	int ow_size = 16;
 	int pixel_size = bpp / 8;
 
 	tiled_pos = swizzle_addr(tiled_pos, swizzle);
 
 	ow_tile_n = tiled_pos / ow_size;
-	untile(ow_tile_n, 128 / ow_size, 32, stride / ow_size, false, x, y);
+	untile(ow_tile_n, x_tile_size / ow_size, y_tile_size, stride / ow_size, false, x, y);
 	*x *= ow_size;
 	*x += tiled_pos % ow_size;
 	*x /= pixel_size;
 }
 
+static void gen2_ytiled_pos_to_x_y_linear(int tiled_pos, uint32_t stride,
+					  int swizzle, int bpp, int *x, int *y)
+{
+	ytiled_pos_to_x_y_linear(tiled_pos, stride, swizzle, bpp, x, y, 128, 16, 8);
+}
+
+static void i915_ytiled_pos_to_x_y_linear(int tiled_pos, uint32_t stride,
+					  int swizzle, int bpp, int *x, int *y)
+{
+	ytiled_pos_to_x_y_linear(tiled_pos, stride, swizzle, bpp, x, y, 512, 8, 32);
+}
+
+static void i945_ytiled_pos_to_x_y_linear(int tiled_pos, uint32_t stride,
+					  int swizzle, int bpp, int *x, int *y)
+{
+	ytiled_pos_to_x_y_linear(tiled_pos, stride, swizzle, bpp, x, y, 128, 32, 16);
+}
+
 static void tile4_pos_to_x_y_linear(int tiled_pos, uint32_t stride,
 				    int swizzle, int bpp, int *x, int *y)
 {
@@ -425,11 +486,22 @@ typedef int (*linear_x_y_to_tiled_pos_fn)(int x, int y, uint32_t stride, int swi
 
 static linear_x_y_to_tiled_pos_fn linear_to_tiled_fn(int fd, uint32_t tiling)
 {
+	const struct intel_device_info *info =
+		intel_get_device_info(intel_get_drm_devid(fd));
+
 	switch (tiling) {
 	case I915_TILING_X:
-		return linear_x_y_to_xtiled_pos;
+		if (info->graphics_ver == 2)
+			return gen2_linear_x_y_to_xtiled_pos;
+		else
+			return gen3_linear_x_y_to_xtiled_pos;
 	case I915_TILING_Y:
-		return linear_x_y_to_ytiled_pos;
+		if (info->graphics_ver == 2)
+			return gen2_linear_x_y_to_ytiled_pos;
+		else if (info->is_grantsdale || info->is_alviso)
+			return i915_linear_x_y_to_ytiled_pos;
+		else
+			return i945_linear_x_y_to_ytiled_pos;
 	case I915_TILING_4:
 		return linear_x_y_to_4tiled_pos;
 	default:
@@ -461,10 +533,6 @@ static void draw_rect_mmap_cpu(int fd, struct buf_data *buf, struct rect *rect,
 	gem_set_domain(fd, buf->handle, I915_GEM_DOMAIN_CPU,
 		       I915_GEM_DOMAIN_CPU);
 
-	/* We didn't implement suport for the older tiling methods yet. */
-	if (tiling != I915_TILING_NONE)
-		igt_require(intel_display_ver(intel_get_drm_devid(fd)) >= 5);
-
 	ptr = gem_mmap__cpu_coherent(fd, buf->handle, 0, PAGE_ALIGN(buf->size),
 				     PROT_READ | PROT_WRITE);
 
@@ -513,10 +581,6 @@ static void draw_rect_mmap_wc(int fd, struct buf_data *buf, struct rect *rect,
 		gem_set_domain(fd, buf->handle, I915_GEM_DOMAIN_GTT,
 			       I915_GEM_DOMAIN_GTT);
 
-		/* We didn't implement suport for the older tiling methods yet. */
-		if (tiling != I915_TILING_NONE)
-			igt_require(intel_display_ver(intel_get_drm_devid(fd)) >= 5);
-
 		if (gem_has_lmem(fd))
 			ptr = gem_mmap_offset__fixed(fd, buf->handle, 0,
 						     PAGE_ALIGN(buf->size),
@@ -572,11 +636,22 @@ typedef void (*tiled_pos_to_x_y_linear_fn)(int tiled_pos, uint32_t stride,
 
 static tiled_pos_to_x_y_linear_fn tiled_to_linear_fn(int fd, uint32_t tiling)
 {
+	const struct intel_device_info *info =
+		intel_get_device_info(intel_get_drm_devid(fd));
+
 	switch (tiling) {
 	case I915_TILING_X:
-		return xtiled_pos_to_x_y_linear;
+		if (info->graphics_ver == 2)
+			return gen2_xtiled_pos_to_x_y_linear;
+		else
+			return gen3_xtiled_pos_to_x_y_linear;
 	case I915_TILING_Y:
-		return ytiled_pos_to_x_y_linear;
+		if (info->graphics_ver == 2)
+			return gen2_ytiled_pos_to_x_y_linear;
+		else if (info->is_grantsdale || info->is_alviso)
+			return i915_ytiled_pos_to_x_y_linear;
+		else
+			return i945_ytiled_pos_to_x_y_linear;
 	case I915_TILING_4:
 		return tile4_pos_to_x_y_linear;
 	default:
@@ -598,9 +673,6 @@ static void draw_rect_pwrite_tiled(int fd, struct buf_data *buf,
 	int tmp_start_pos = 0;
 	int pixels_written = 0;
 
-	/* We didn't implement suport for the older tiling methods yet. */
-	igt_require(intel_display_ver(intel_get_drm_devid(fd)) >= 5);
-
 	pixel_size = buf->bpp / 8;
 	tmp_size = sizeof(tmp) / pixel_size;
 
-- 
2.45.2

