Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B476A10EB14
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Mar 2022 14:55:35 +0000 (UTC)
From: Maxime Ripard <maxime@cerno.tech>
To: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>,
 Arkadiusz Hiler <arek@hiler.eu>
Date: Mon, 28 Mar 2022 16:55:08 +0200
Message-Id: <20220328145509.2331195-8-maxime@cerno.tech>
In-Reply-To: <20220328145509.2331195-1-maxime@cerno.tech>
References: <20220328145509.2331195-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 7/8] lib/igt_fb: Ignore the X component
 when computing CRC
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Pekka Paalanen <ppaalanen@gmail.com>, Maxime Ripard <maxime@cerno.tech>
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 lib/igt_fb.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index eafbe7fd41cd..66c52bb83876 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -4392,15 +4392,19 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc_t *crc)
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
@@ -4422,9 +4426,17 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc_t *crc)
 
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
2.35.1
