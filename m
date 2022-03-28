Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B6610EB22
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Mar 2022 14:55:29 +0000 (UTC)
From: Maxime Ripard <maxime@cerno.tech>
To: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>,
 Arkadiusz Hiler <arek@hiler.eu>
Date: Mon, 28 Mar 2022 16:55:06 +0200
Message-Id: <20220328145509.2331195-6-maxime@cerno.tech>
In-Reply-To: <20220328145509.2331195-1-maxime@cerno.tech>
References: <20220328145509.2331195-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 5/8] tests/kms_writeback: Use endianness
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
index 78dc6202ced4..12b1a912c1d7 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -31,6 +31,7 @@
 #define IGT_CORE_H
 
 #include <assert.h>
+#include <byteswap.h>
 #include <setjmp.h>
 #include <stdbool.h>
 #include <stdint.h>
@@ -1446,6 +1447,14 @@ void igt_kmsg(const char *format, ...);
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
index 21d62faabf6b..faa790cc0f72 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -239,7 +239,7 @@ static void fill_fb(igt_fb_t *fb, uint32_t pixel)
 
 	pixel_count = fb->strides[0] * fb->height / sizeof(uint32_t);
 	for (i = 0; i < pixel_count; i++)
-		ptr[i] = pixel;
+		ptr[i] = cpu_to_le32(pixel);
 
 	igt_fb_unmap_buffer(fb, ptr);
 }
-- 
2.35.1
