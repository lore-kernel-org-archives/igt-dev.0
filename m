Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5510D10E254
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jan 2023 10:59:31 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Petri Latvala <petri.latvala@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Emma Anholt <emma@anholt.net>,
 Jason Ekstrand <jason.ekstrand@collabora.com>,
 Iago Toral Quiroga <itoral@igalia.com>, Rob Clark <robdclark@chromium.org>
Date: Tue,  3 Jan 2023 07:58:31 -0300
Message-Id: <20230103105835.604394-2-mcanal@igalia.com>
In-Reply-To: <20230103105835.604394-1-mcanal@igalia.com>
References: <20230103105835.604394-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/6] lib/v3d: Add V3D packet helpers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

In order to make a valid job submission to V3D, some packet helpers are
needed. They are responsible for handling the data and packing it
properly. Moreover, they reuse some of the generic packet helpers from
Mesa, the bit pack helpers. Therefore, add Mesa V3D's packet helpers for
IGT use.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 lib/bitpack_helpers.h        |  78 +++++++++++++++++++++++
 lib/v3d/v3d_packet_helpers.h | 119 +++++++++++++++++++++++++++++++++++
 2 files changed, 197 insertions(+)
 create mode 100644 lib/bitpack_helpers.h
 create mode 100644 lib/v3d/v3d_packet_helpers.h

diff --git a/lib/bitpack_helpers.h b/lib/bitpack_helpers.h
new file mode 100644
index 00000000..358b5d64
--- /dev/null
+++ b/lib/bitpack_helpers.h
@@ -0,0 +1,78 @@
+/*
+ * Copyright (C) 2016 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ */
+
+#ifndef UTIL_BITPACK_HELPERS_H
+#define UTIL_BITPACK_HELPERS_H
+
+#include <math.h>
+#include <stdbool.h>
+#include <stdint.h>
+
+#ifndef util_bitpack_validate_value
+#define util_bitpack_validate_value(x)
+#endif
+
+/** Set a single bit */
+#define BITFIELD64_BIT(b)      (1ull << (b))
+/** Set all bits up to excluding bit b */
+#define BITFIELD64_MASK(b)      \
+   ((b) == 64 ? (~0ull) : BITFIELD64_BIT(b) - 1)
+
+static inline uint64_t
+util_bitpack_uint(uint64_t v, uint32_t start, __attribute__((unused)) uint32_t end)
+{
+   util_bitpack_validate_value(v);
+   return v << start;
+}
+
+static inline uint64_t
+util_bitpack_sint(int64_t v, uint32_t start, uint32_t end)
+{
+   const int bits = end - start + 1;
+   const uint64_t mask = BITFIELD64_MASK(bits);
+
+   return (v & mask) << start;
+}
+
+static inline uint64_t
+util_bitpack_sfixed(float v, uint32_t start, uint32_t end,
+                    uint32_t fract_bits)
+{
+   const float factor = (1 << fract_bits);
+   const int64_t int_val = llroundf(v * factor);
+   const uint64_t mask = ~0ull >> (64 - (end - start + 1));
+
+   return (int_val & mask) << start;
+}
+
+static inline uint64_t
+util_bitpack_ufixed(float v, uint32_t start, __attribute__((unused)) uint32_t end,
+                    uint32_t fract_bits)
+{
+   const float factor = (1 << fract_bits);
+   const uint64_t uint_val = llroundf(v * factor);
+
+   return uint_val << start;
+}
+
+#endif /* UTIL_BITPACK_HELPERS_H */
diff --git a/lib/v3d/v3d_packet_helpers.h b/lib/v3d/v3d_packet_helpers.h
new file mode 100644
index 00000000..3145333d
--- /dev/null
+++ b/lib/v3d/v3d_packet_helpers.h
@@ -0,0 +1,119 @@
+/*
+ * Copyright (C) 2016 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ */
+
+#ifndef MESA_V3D_PACKET_HELPERS_H
+#define MESA_V3D_PACKET_HELPERS_H
+
+#include <assert.h>
+#include <stdint.h>
+
+#include "bitpack_helpers.h"
+
+/*
+ * Copied from Mesa's u_math.h
+ */
+union fi {
+   float f;
+   int32_t i;
+   uint32_t ui;
+};
+
+static inline float uif(uint32_t ui)
+{
+   union fi fi;
+   fi.ui = ui;
+   return fi.f;
+}
+
+static inline unsigned fui(float f)
+{
+   union fi fi;
+   fi.f = f;
+   return fi.ui;
+}
+
+static inline uint64_t
+__gen_unpack_uint(const uint8_t *restrict cl, uint32_t start, uint32_t end)
+{
+   uint64_t val = 0;
+   const int width = end - start + 1;
+   const uint32_t mask = (width == 32 ? ~0 : (1 << width) - 1 );
+
+   for (uint32_t byte = start / 8; byte <= end / 8; byte++) {
+      val |= cl[byte] << ((byte - start / 8) * 8);
+   }
+
+   return (val >> (start % 8)) & mask;
+}
+
+static inline uint64_t
+__gen_unpack_sint(const uint8_t *restrict cl, uint32_t start, uint32_t end)
+{
+   int size = end - start + 1;
+   int64_t val = __gen_unpack_uint(cl, start, end);
+
+   /* Get the sign bit extended. */
+   return (val << (64 - size)) >> (64 - size);
+}
+
+static inline float
+__gen_unpack_sfixed(const uint8_t *restrict cl, uint32_t start, uint32_t end,
+                    uint32_t fractional_size)
+{
+     int32_t bits = __gen_unpack_sint(cl, start, end);
+     return (float)bits / (1 << fractional_size);
+}
+
+static inline float
+__gen_unpack_ufixed(const uint8_t *restrict cl, uint32_t start, uint32_t end,
+                    uint32_t fractional_size)
+{
+     int32_t bits = __gen_unpack_uint(cl, start, end);
+     return (float)bits / (1 << fractional_size);
+}
+
+static inline float
+__gen_unpack_float(const uint8_t *restrict cl, uint32_t start, uint32_t end)
+{
+   struct PACKED { float f; } *f;
+
+   assert(start % 8 == 0);
+   assert(end - start == 31);
+
+   f = (void *)(cl + (start / 8));
+
+   return f->f;
+}
+
+static inline float
+__gen_unpack_f187(const uint8_t *restrict cl, uint32_t start, uint32_t end)
+{
+   uint32_t bits;
+
+   assert(end - start == 15);
+
+   bits = __gen_unpack_uint(cl, start, end);
+   return uif(bits << 16);
+}
+
+#endif
-- 
2.38.1
