Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E32CFA767
	for <igt-dev@archiver.kernel.org>; Fri,  4 Oct 2024 10:41:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01EB610E29F;
	Fri,  4 Oct 2024 10:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VoE4VgGV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51CCF10E295
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Oct 2024 10:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728038501; x=1759574501;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=XtYh6olr8V/UBYzOBs7QYyfNGQtK4do1zD/Bz0LiNxU=;
 b=VoE4VgGVPDFtEz3UUIe1kzGbvBYl/Nw0qHbu9lNYFKK0tDW1zvIXg/OG
 PIZgmIYt+PL1VUnhKm6JRDNpkb4E9Aam79UJGBmPY5+BgsT0/chOkzGuH
 HMNFn+rHQZULAkKnypZ5KxJ7AshFocO03G3RXFdMIrgmTUOwHW+29hKQU
 fhWHonLqKLxvelAPSgTOSM8yi0sM+nw5vH8RmKEOkSnVhcjhyOjUXuR+h
 ACB3obPcQ1lqMSIWyiRN642ze8ER6VzmhtAxDn/g6d3hoN375TTuQ4HHS
 j90PksQwJjzg9nkroOcPEe7WIe6fbrYwoWX8vTdRoxD0Ht8c1mj+brHmh Q==;
X-CSE-ConnectionGUID: o1xMDiNzSfGTyk+I7b+WDw==
X-CSE-MsgGUID: 328rmlZCQk2eUH/8L+pFRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="31140480"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="31140480"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 03:41:38 -0700
X-CSE-ConnectionGUID: PKavhrf6TsiA8m/BMoOWig==
X-CSE-MsgGUID: fgdH5o1ATpWEnXYctJb1Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="74778302"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 04 Oct 2024 03:41:36 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 04 Oct 2024 13:41:35 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 05/14] lib/igt_draw: Use function pointers for the
 linear<->tiled conversion
Date: Fri,  4 Oct 2024 13:41:12 +0300
Message-ID: <20241004104121.32750-6-ville.syrjala@linux.intel.com>
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

Replace the bare switch statements in the linear<->tiled
conversions with functions pointers. This will allow us to
more cleanly provide platform specific implementations for
each tiling format.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_draw.c | 79 ++++++++++++++++++++++++++++----------------------
 1 file changed, 44 insertions(+), 35 deletions(-)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index b39a33dcf2cb..dea73aca57b5 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -420,30 +420,34 @@ static void draw_rect_ptr_linear(void *ptr, uint32_t stride,
 	}
 }
 
-static void draw_rect_ptr_tiled(void *ptr, uint32_t stride, uint32_t tiling,
+typedef int (*linear_x_y_to_tiled_pos_fn)(int x, int y, uint32_t stride, int swizzle,
+					  int bpp);
+
+static linear_x_y_to_tiled_pos_fn linear_to_tiled_fn(int fd, uint32_t tiling)
+{
+	switch (tiling) {
+	case I915_TILING_X:
+		return linear_x_y_to_xtiled_pos;
+	case I915_TILING_Y:
+		return linear_x_y_to_ytiled_pos;
+	case I915_TILING_4:
+		return linear_x_y_to_4tiled_pos;
+	default:
+		igt_assert(false);
+	}
+}
+
+static void draw_rect_ptr_tiled(int fd, void *ptr, uint32_t stride, uint32_t tiling,
 				int swizzle, struct rect *rect, uint64_t color,
 				int bpp)
 {
+	linear_x_y_to_tiled_pos_fn linear_x_y_to_tiled_pos =
+		linear_to_tiled_fn(fd, tiling);
 	int x, y, pos;
 
 	for (y = rect->y; y < rect->y + rect->h; y++) {
 		for (x = rect->x; x < rect->x + rect->w; x++) {
-			switch (tiling) {
-			case I915_TILING_X:
-				pos = linear_x_y_to_xtiled_pos(x, y, stride,
-							       swizzle, bpp);
-				break;
-			case I915_TILING_Y:
-				pos = linear_x_y_to_ytiled_pos(x, y, stride,
-							       swizzle, bpp);
-				break;
-			case I915_TILING_4:
-				pos = linear_x_y_to_4tiled_pos(x, y, stride,
-							       swizzle, bpp);
-				break;
-			default:
-				igt_assert(false);
-			}
+			pos = linear_x_y_to_tiled_pos(x, y, stride, swizzle, bpp);
 			set_pixel(ptr, pos, color, bpp);
 		}
 	}
@@ -471,7 +475,7 @@ static void draw_rect_mmap_cpu(int fd, struct buf_data *buf, struct rect *rect,
 	case I915_TILING_X:
 	case I915_TILING_Y:
 	case I915_TILING_4:
-		draw_rect_ptr_tiled(ptr, buf->stride, tiling, swizzle, rect,
+		draw_rect_ptr_tiled(fd, ptr, buf->stride, tiling, swizzle, rect,
 				    color, buf->bpp);
 		break;
 	default:
@@ -536,7 +540,7 @@ static void draw_rect_mmap_wc(int fd, struct buf_data *buf, struct rect *rect,
 	case I915_TILING_X:
 	case I915_TILING_Y:
 	case I915_TILING_4:
-		draw_rect_ptr_tiled(ptr, buf->stride, tiling, swizzle, rect,
+		draw_rect_ptr_tiled(fd, ptr, buf->stride, tiling, swizzle, rect,
 				    color, buf->bpp);
 		break;
 	default:
@@ -563,10 +567,29 @@ static void draw_rect_pwrite_untiled(int fd, struct buf_data *buf,
 	}
 }
 
+typedef void (*tiled_pos_to_x_y_linear_fn)(int tiled_pos, uint32_t stride,
+					   int swizzle, int bpp, int *x, int *y);
+
+static tiled_pos_to_x_y_linear_fn tiled_to_linear_fn(int fd, uint32_t tiling)
+{
+	switch (tiling) {
+	case I915_TILING_X:
+		return xtiled_pos_to_x_y_linear;
+	case I915_TILING_Y:
+		return ytiled_pos_to_x_y_linear;
+	case I915_TILING_4:
+		return tile4_pos_to_x_y_linear;
+	default:
+		igt_assert(false);
+	}
+}
+
 static void draw_rect_pwrite_tiled(int fd, struct buf_data *buf,
 				   uint32_t tiling, struct rect *rect,
 				   uint64_t color, uint32_t swizzle)
 {
+	tiled_pos_to_x_y_linear_fn tiled_pos_to_x_y_linear =
+		tiled_to_linear_fn(fd, tiling);
 	int i;
 	int tiled_pos, x, y, pixel_size;
 	uint8_t tmp[4096];
@@ -588,22 +611,8 @@ static void draw_rect_pwrite_tiled(int fd, struct buf_data *buf,
 		set_pixel(tmp, i, color, buf->bpp);
 
 	for (tiled_pos = 0; tiled_pos < buf->size; tiled_pos += pixel_size) {
-		switch (tiling) {
-		case I915_TILING_X:
-			xtiled_pos_to_x_y_linear(tiled_pos, buf->stride,
-						 swizzle, buf->bpp, &x, &y);
-			break;
-		case I915_TILING_Y:
-			ytiled_pos_to_x_y_linear(tiled_pos, buf->stride,
-						 swizzle, buf->bpp, &x, &y);
-			break;
-		case I915_TILING_4:
-			tile4_pos_to_x_y_linear(tiled_pos, buf->stride,
-						swizzle, buf->bpp, &x, &y);
-			break;
-		default:
-			igt_assert(false);
-		}
+		tiled_pos_to_x_y_linear(tiled_pos, buf->stride,
+					swizzle, buf->bpp, &x, &y);
 
 		if (x >= rect->x && x < rect->x + rect->w &&
 		    y >= rect->y && y < rect->y + rect->h) {
-- 
2.45.2

