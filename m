Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Date: Sun, 30 Aug 2020 13:44:09 -0400
Message-Id: <20200830174410.256533-4-rodrigosiqueiramelo@gmail.com>
In-Reply-To: <20200830174410.256533-1-rodrigosiqueiramelo@gmail.com>
References: <20200830174410.256533-1-rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v9 3/4] lib: Add function to hash a
 framebuffer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, nd <nd@arm.com>
Cc: Simon Ser <simon.ser@intel.com>, Petri Latvala <petri.latvala@intel.com>, Simon Ser <contact@emersion.fr>, Liviu Dudau <liviu.dudau@arm.com>, Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel@ffwll.ch>, Brian Starkey <brian.starkey@arm.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Brian Starkey <rodrigosiqueiramelo@gmail.com>

To use writeback buffers as a CRC source, we need to be able to hash
them. Implement a simple FVA-1a hashing routine for this purpose.

Doing a bytewise hash on the framebuffer directly can be very slow if
the memory is noncached. By making a copy of each line in the FB first
(which can take advantage of word-access speedup), we can do the hash
on a cached copy, which is much faster (10x speedup on my platform).

Changes since V7 (Maxime Ripard):
* Maxime Ripard:
  - Replace `gem_mmap__gtt` by `igt_fb_map_buffer` on `igt_fb_get_crc()`
* Rodrigo Siqueira:
  - Rename igt_fb_get_crc to igt_fb_get_fnv1a_crc

Changes since V6 (Simon Ser):
* Use plain uint32_t for FNV1a_OFFSET_BIAS and FNV1a_PRIME
* Return -EINVAL in case fb->num_planes != 1
* Just copy fb->width * cpp instead of copy the whole stride

v5: use igt_memcpy_from_wc() instead of plain memcpy, as suggested by
    Chris Wilson

Signed-off-by: Brian Starkey <brian.starkey@arm.com>
[rebased and updated to the most recent API]
Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>
[rebased and updated]
Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Reviewed-by: Simon Ser <simon.ser@intel.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
---
 lib/igt_fb.c | 63 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_fb.h |  2 ++
 2 files changed, 65 insertions(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 3864b7a1..5e3706e9 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -3783,6 +3783,69 @@ bool igt_fb_supported_format(uint32_t drm_format)
 	return true;
 }
 
+/*
+ * This implements the FNV-1a hashing algorithm instead of CRC, for
+ * simplicity
+ * http://www.isthe.com/chongo/tech/comp/fnv/index.html
+ *
+ * hash = offset_basis
+ * for each octet_of_data to be hashed
+ *         hash = hash xor octet_of_data
+ *         hash = hash * FNV_prime
+ * return hash
+ *
+ * 32 bit offset_basis = 2166136261
+ * 32 bit FNV_prime = 224 + 28 + 0x93 = 16777619
+ */
+int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc_t *crc)
+{
+	const uint32_t FNV1a_OFFSET_BIAS = 2166136261;
+	const uint32_t FNV1a_PRIME = 16777619;
+	uint32_t hash;
+	void *map;
+	char *ptr, *line = NULL;
+	int x, y, cpp = igt_drm_format_to_bpp(fb->drm_format) / 8;
+	uint32_t stride = calc_plane_stride(fb, 0);
+
+	if (fb->num_planes != 1)
+		return -EINVAL;
+
+	ptr = igt_fb_map_buffer(fb->fd, fb);
+	igt_assert(ptr);
+	map = ptr;
+
+	/*
+	 * Framebuffers are often uncached, which can make byte-wise accesses
+	 * very slow. We copy each line of the FB into a local buffer to speed
+	 * up the hashing.
+	 */
+	line = malloc(stride);
+	if (!line) {
+		munmap(map, fb->size);
+		return -ENOMEM;
+	}
+
+	hash = FNV1a_OFFSET_BIAS;
+
+	for (y = 0; y < fb->height; y++, ptr += stride) {
+
+		igt_memcpy_from_wc(line, ptr, fb->width * cpp);
+
+		for (x = 0; x < fb->width * cpp; x++) {
+			hash ^= line[x];
+			hash *= FNV1a_PRIME;
+		}
+	}
+
+	crc->n_words = 1;
+	crc->crc[0] = hash;
+
+	free(line);
+	igt_fb_unmap_buffer(fb, map);
+
+	return 0;
+}
+
 /**
  * igt_format_is_yuv:
  * @drm_format: drm fourcc
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index 5ec906b7..debfb5ad 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -207,5 +207,7 @@ int igt_format_plane_bpp(uint32_t drm_format, int plane);
 void igt_format_array_fill(uint32_t **formats_array, unsigned int *count,
 			   bool allow_yuv);
 
+int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc_t *crc);
+
 #endif /* __IGT_FB_H__ */
 
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
