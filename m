Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5935A10EFD3
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jun 2022 12:16:53 +0000 (UTC)
From: Maxime Ripard <maxime@cerno.tech>
To: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>,
 Arkadiusz Hiler <arek@hiler.eu>
Date: Fri, 10 Jun 2022 14:16:46 +0200
Message-Id: <20220610121647.975942-3-maxime@cerno.tech>
In-Reply-To: <20220610121647.975942-1-maxime@cerno.tech>
References: <20220610121647.975942-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 2/3] lib/igt_fb: Ignore the X component
 when computing CRC
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Pekka Paalanen <ppaalanen@gmail.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

The igt_fb_get_fnv1a_crc() function will compute a FNV-1a hash over the
content of the framebuffer. The sole user of this function is the
writeback test suite, which will use it to compare an XRGB8888 buffer
used in input to an XRGB8888 buffer filled by the writeback connector.

However, that function uses each bytes of each buffers to compute the
hash, and therefore the writeback code assumes that the hardware will
preserve the content of the X component through the writeback pipeline,
which isn't true for all hardware. VC4 doesn't for example.

Since that function is only ever used for XRGB8888 buffers, let's just
set the most significant to 0 (which is the X padding) for each pixel
when computing the hash, and thus ignore whatever the hardware will
return here.

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 lib/igt_fb.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index fa31c43cb64e..7a73181168a7 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -4433,15 +4433,19 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc_t *crc)
 {
 	const uint32_t FNV1a_OFFSET_BIAS = 2166136261;
 	const uint32_t FNV1a_PRIME = 16777619;
+	uint32_t *line = NULL;
 	uint32_t hash;
 	void *map;
-	char *ptr, *line = NULL;
+	char *ptr;
 	int x, y, cpp = igt_drm_format_to_bpp(fb->drm_format) / 8;
 	uint32_t stride = calc_plane_stride(fb, 0);
 
 	if (fb->num_planes != 1)
 		return -EINVAL;
 
+	if (fb->drm_format != DRM_FORMAT_XRGB8888)
+		return -EINVAL;
+
 	ptr = igt_fb_map_buffer(fb->fd, fb);
 	igt_assert(ptr);
 	map = ptr;
@@ -4463,9 +4467,17 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc_t *crc)
 
 		igt_memcpy_from_wc(line, ptr, fb->width * cpp);
 
-		for (x = 0; x < fb->width * cpp; x++) {
-			hash ^= line[x];
-			hash *= FNV1a_PRIME;
+		for (x = 0; x < fb->width; x++) {
+			unsigned int i;
+			uint32_t pixel = le32_to_cpu(line[x]);
+			pixel &= 0x00ffffff;
+
+			for (i = 0; i < sizeof(pixel); i++) {
+				uint8_t component = (pixel >> (i * 8)) & 0xff;
+
+				hash ^= component;
+				hash *= FNV1a_PRIME;
+			}
 		}
 	}
 
-- 
2.36.1
