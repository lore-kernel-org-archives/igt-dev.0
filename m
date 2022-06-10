Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4574810EFF2
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jun 2022 12:16:51 +0000 (UTC)
From: Maxime Ripard <maxime@cerno.tech>
To: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>,
 Arkadiusz Hiler <arek@hiler.eu>
Date: Fri, 10 Jun 2022 14:16:45 +0200
Message-Id: <20220610121647.975942-2-maxime@cerno.tech>
In-Reply-To: <20220610121647.975942-1-maxime@cerno.tech>
References: <20220610121647.975942-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 1/3] tests/kms_writeback: Use endianness
 accessor to fill pixels
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

The fill_fb() function in the kms_writeback test suite will fill an
XRGB8888 buffer using a pattern passed an an argument. However, the
pattern is native endian, while XRGB8888 is little-endian.

Add an accessor and use it to fill the framebuffer with our pattern.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 lib/igt_core.h        | 9 +++++++++
 tests/kms_writeback.c | 2 +-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/lib/igt_core.h b/lib/igt_core.h
index 526282faff24..aa98e8ed8deb 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -31,6 +31,7 @@
 #define IGT_CORE_H
 
 #include <assert.h>
+#include <byteswap.h>
 #include <setjmp.h>
 #include <stdbool.h>
 #include <stdint.h>
@@ -1447,6 +1448,14 @@ void igt_kmsg(const char *format, ...);
 #define READ_ONCE(x) (*(volatile typeof(x) *)(&(x)))
 #define WRITE_ONCE(x, v) do *(volatile typeof(x) *)(&(x)) = (v); while (0)
 
+#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
+#define cpu_to_le32(x)  bswap_32(x)
+#define le32_to_cpu(x)  bswap_32(x)
+#else
+#define cpu_to_le32(x)  (x)
+#define le32_to_cpu(x)  (x)
+#endif
+
 #define MSEC_PER_SEC (1000)
 #define USEC_PER_SEC (1000*MSEC_PER_SEC)
 #define NSEC_PER_SEC (1000*USEC_PER_SEC)
diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 6efc72df4327..cf70a28e7d56 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -244,7 +244,7 @@ static void fill_fb(igt_fb_t *fb, uint32_t pixel)
 
 	pixel_count = fb->strides[0] * fb->height / sizeof(uint32_t);
 	for (i = 0; i < pixel_count; i++)
-		ptr[i] = pixel;
+		ptr[i] = cpu_to_le32(pixel);
 
 	igt_fb_unmap_buffer(fb, ptr);
 }
-- 
2.36.1
