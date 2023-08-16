Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD47F10E3C0
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Aug 2023 20:54:04 +0000 (UTC)
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 16 Aug 2023 14:53:15 -0600
Message-ID: <20230816205316.867195-2-alex.hung@amd.com>
In-Reply-To: <20230816205316.867195-1-alex.hung@amd.com>
References: <20230816205316.867195-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 2/3] lib/igt_fb: add 10 bits (XRGB2101010)
 supports in fnv1a_crc
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: brian.starkey@arm.com, maxime@cerno.tech
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Allow 10 bits (DRM_FORMAT_XRGB2101010) components to be hashed
as well.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 lib/igt_fb.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 9beb07049..a24b4f669 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -4755,7 +4755,7 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc_t *crc)
 	if (fb->num_planes != 1)
 		return -EINVAL;
 
-	if (fb->drm_format != DRM_FORMAT_XRGB8888)
+	if (fb->drm_format != DRM_FORMAT_XRGB8888 && fb->drm_format != DRM_FORMAT_XRGB2101010)
 		return -EINVAL;
 
 	ptr = igt_fb_map_buffer(fb->fd, fb);
@@ -4781,7 +4781,11 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc_t *crc)
 
 		for (x = 0; x < fb->width; x++) {
 			uint32_t pixel = le32_to_cpu(line[x]);
-			pixel &= 0x00ffffff;
+
+			if (fb->drm_format == DRM_FORMAT_XRGB8888)
+				pixel &= 0x00ffffff;
+			else if (fb->drm_format == DRM_FORMAT_XRGB2101010)
+				pixel &= 0x3fffffff;
 
 			hash ^= pixel;
 			hash *= FNV1a_PRIME;
-- 
2.34.1
