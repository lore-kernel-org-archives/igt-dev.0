Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D8FE6E49B
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Oct 2021 21:26:25 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Wed, 27 Oct 2021 00:26:18 +0300
Message-Id: <20211026212620.2718277-3-imre.deak@intel.com>
In-Reply-To: <20211026212620.2718277-1-imre.deak@intel.com>
References: <20211026212620.2718277-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/4] lib/igt_fb/tgl+: Prevent CCS FB UV
 surface offset overalignment
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

The offset of semiplanar UV surfaces in CCS FBs must be 64 kbyte aligned
as required by the Vebox engine which IGT uses to convert between tiling
formats. At the same time the display engine requires the offset to be
tile-row aligned. So far we ensured both of these alignment requirements
by aligning all color surface widths/heights to 4x4 tiles. This however
wastes memory in case the number of tiles in one tile-row modulo 16 is 0
or 8 where 1 or 2 tile-row alignment correspondingly would be enough.

The next patch removes the 4x4 tile alignment, here prepare for that by
aligning TGL+ UV surface offsets to LCM(tile-row size, 64 kbyte)
ensuring the minimum tile-row size and 64 kbyte alignment.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 lib/igt_fb.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index b8b2396d3..86d0ae426 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -392,6 +392,12 @@ bool igt_format_is_yuv_semiplanar(uint32_t format)
 	return igt_format_is_yuv(format) && f->num_planes == 2;
 }
 
+static bool is_yuv_semiplanar_plane(const struct igt_fb *fb, int color_plane)
+{
+	return igt_format_is_yuv_semiplanar(fb->drm_format) &&
+	       color_plane == 1;
+}
+
 /**
  * igt_get_fb_tile_size:
  * @fd: the DRM file descriptor
@@ -843,16 +849,61 @@ static uint64_t calc_plane_size(struct igt_fb *fb, int plane)
 	}
 }
 
+static unsigned int gcd(unsigned int a, unsigned int b)
+{
+	if (b == 0)
+		return a;
+
+	return gcd(b, a % b);
+}
+
+static unsigned int lcm(unsigned int a, unsigned int b)
+{
+	unsigned int g = gcd(a, b);
+
+	if (g == 0 || b == 0)
+		return 0;
+
+	return a / g * b;
+}
+
+static unsigned int get_plane_alignment(struct igt_fb *fb, int color_plane)
+{
+	unsigned int tile_width, tile_height;
+	unsigned int tile_row_size;
+	unsigned int alignment;
+
+	if (!(is_i915_device(fb->fd) &&
+	      is_gen12_ccs_modifier(fb->modifier) &&
+	      is_yuv_semiplanar_plane(fb, color_plane)))
+		return 0;
+
+	igt_get_fb_tile_size(fb->fd, fb->modifier, fb->plane_bpp[color_plane],
+			     &tile_width, &tile_height);
+
+	tile_row_size = fb->strides[color_plane] * tile_height;
+
+	alignment = lcm(tile_row_size, 64 * 1024);
+
+	return alignment;
+}
+
 static uint64_t calc_fb_size(struct igt_fb *fb)
 {
 	uint64_t size = 0;
 	int plane;
 
 	for (plane = 0; plane < fb->num_planes; plane++) {
+		unsigned int align;
+
 		/* respect the stride requested by the caller */
 		if (!fb->strides[plane])
 			fb->strides[plane] = calc_plane_stride(fb, plane);
 
+		align = get_plane_alignment(fb, plane);
+		if (align)
+			size += align - (size % align);
+
 		fb->offsets[plane] = size;
 
 		size += calc_plane_size(fb, plane);
-- 
2.27.0
