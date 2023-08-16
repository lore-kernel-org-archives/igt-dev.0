Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2067.outbound.protection.outlook.com [40.107.237.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E27610E3BF
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Aug 2023 20:53:54 +0000 (UTC)
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 16 Aug 2023 14:53:14 -0600
Message-ID: <20230816205316.867195-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 1/3] lib/igt_fb: use the entire 32 bit for
 fnv1a_crc
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

The function was implemented as a 32-bit hashing function. Commit
85f4c1005150 ("lib/igt_fb: Ignore the X component when computing CRC")
broke this behavior by hashing 8-bit portions. Restore the 32-bit hasing
behavior while still ignoring the X compoment.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 lib/igt_fb.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 60b0e2669..9beb07049 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -4780,16 +4780,11 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc_t *crc)
 		igt_memcpy_from_wc(line, ptr, fb->width * cpp);
 
 		for (x = 0; x < fb->width; x++) {
-			unsigned int i;
 			uint32_t pixel = le32_to_cpu(line[x]);
 			pixel &= 0x00ffffff;
 
-			for (i = 0; i < sizeof(pixel); i++) {
-				uint8_t component = (pixel >> (i * 8)) & 0xff;
-
-				hash ^= component;
-				hash *= FNV1a_PRIME;
-			}
+			hash ^= pixel;
+			hash *= FNV1a_PRIME;
 		}
 	}
 
-- 
2.34.1
