Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23E4912A92D
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jun 2022 05:24:28 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  7 Jun 2022 07:24:09 +0200
Message-Id: <20220607052411.7357-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220607052411.7357-1-zbigniew.kempczynski@intel.com>
References: <20220607052411.7357-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/4] lib/igt_crc: Introduce common place for
 crc tables and functions
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add crc32 table for on-cpu crc calculation function. Other tables and
algorithms should be added here allowing reuse tables for in-gpu crc
calculation.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 .../igt-gpu-tools/igt-gpu-tools-docs.xml      |   1 +
 lib/igt_crc.c                                 | 107 ++++++++++++++++++
 lib/igt_crc.h                                 |  31 +++++
 lib/meson.build                               |   1 +
 4 files changed, 140 insertions(+)
 create mode 100644 lib/igt_crc.c
 create mode 100644 lib/igt_crc.h

diff --git a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
index 1774256530..b78f1eb6ff 100644
--- a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
+++ b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
@@ -22,6 +22,7 @@
     <xi:include href="xml/igt_chamelium.xml"/>
     <xi:include href="xml/igt_collection.xml"/>
     <xi:include href="xml/igt_core.xml"/>
+    <xi:include href="xml/igt_crc.xml"/>
     <xi:include href="xml/igt_debugfs.xml"/>
     <xi:include href="xml/igt_device.xml"/>
     <xi:include href="xml/igt_device_scan.xml"/>
diff --git a/lib/igt_crc.c b/lib/igt_crc.c
new file mode 100644
index 0000000000..e634f5cf27
--- /dev/null
+++ b/lib/igt_crc.c
@@ -0,0 +1,107 @@
+/*-
+ *  COPYRIGHT (C) 1986 Gary S. Brown.  You may use this program, or
+ *  code or tables extracted from it, as desired without restriction.
+ */
+
+/*
+ *  First, the polynomial itself and its table of feedback terms.  The
+ *  polynomial is
+ *  X^32+X^26+X^23+X^22+X^16+X^12+X^11+X^10+X^8+X^7+X^5+X^4+X^2+X^1+X^0
+ *
+ *  Note that we take it "backwards" and put the highest-order term in
+ *  the lowest-order bit.  The X^32 term is "implied"; the LSB is the
+ *  X^31 term, etc.  The X^0 term (usually shown as "+1") results in
+ *  the MSB being 1
+ *
+ *  Note that the usual hardware shift register implementation, which
+ *  is what we're using (we're merely optimizing it by doing eight-bit
+ *  chunks at a time) shifts bits into the lowest-order term.  In our
+ *  implementation, that means shifting towards the right.  Why do we
+ *  do it this way?  Because the calculated CRC must be transmitted in
+ *  order from highest-order term to lowest-order term.  UARTs transmit
+ *  characters in order from LSB to MSB.  By storing the CRC this way
+ *  we hand it to the UART in the order low-byte to high-byte; the UART
+ *  sends each low-bit to hight-bit; and the result is transmission bit
+ *  by bit from highest- to lowest-order term without requiring any bit
+ *  shuffling on our part.  Reception works similarly
+ *
+ *  The feedback terms table consists of 256, 32-bit entries.  Notes
+ *
+ *      The table can be generated at runtime if desired; code to do so
+ *      is shown later.  It might not be obvious, but the feedback
+ *      terms simply represent the results of eight shift/xor opera
+ *      tions for all combinations of data and CRC register values
+ *
+ *      The values must be right-shifted by eight bits by the "updcrc
+ *      logic; the shift must be unsigned (bring in zeroes).  On some
+ *      hardware you could probably optimize the shift in assembler by
+ *      using byte-swap instructions
+ *      polynomial $edb88320
+ *
+ *
+ * CRC32 code derived from work by Gary S. Brown.
+ */
+
+#include <stddef.h>
+#include <stdint.h>
+#include "igt_crc.h"
+
+const uint32_t igt_crc32_tab[256] = {
+	0x00000000, 0x77073096, 0xee0e612c, 0x990951ba, 0x076dc419, 0x706af48f,
+	0xe963a535, 0x9e6495a3,	0x0edb8832, 0x79dcb8a4, 0xe0d5e91e, 0x97d2d988,
+	0x09b64c2b, 0x7eb17cbd, 0xe7b82d07, 0x90bf1d91, 0x1db71064, 0x6ab020f2,
+	0xf3b97148, 0x84be41de,	0x1adad47d, 0x6ddde4eb, 0xf4d4b551, 0x83d385c7,
+	0x136c9856, 0x646ba8c0, 0xfd62f97a, 0x8a65c9ec,	0x14015c4f, 0x63066cd9,
+	0xfa0f3d63, 0x8d080df5,	0x3b6e20c8, 0x4c69105e, 0xd56041e4, 0xa2677172,
+	0x3c03e4d1, 0x4b04d447, 0xd20d85fd, 0xa50ab56b,	0x35b5a8fa, 0x42b2986c,
+	0xdbbbc9d6, 0xacbcf940,	0x32d86ce3, 0x45df5c75, 0xdcd60dcf, 0xabd13d59,
+	0x26d930ac, 0x51de003a, 0xc8d75180, 0xbfd06116, 0x21b4f4b5, 0x56b3c423,
+	0xcfba9599, 0xb8bda50f, 0x2802b89e, 0x5f058808, 0xc60cd9b2, 0xb10be924,
+	0x2f6f7c87, 0x58684c11, 0xc1611dab, 0xb6662d3d,	0x76dc4190, 0x01db7106,
+	0x98d220bc, 0xefd5102a, 0x71b18589, 0x06b6b51f, 0x9fbfe4a5, 0xe8b8d433,
+	0x7807c9a2, 0x0f00f934, 0x9609a88e, 0xe10e9818, 0x7f6a0dbb, 0x086d3d2d,
+	0x91646c97, 0xe6635c01, 0x6b6b51f4, 0x1c6c6162, 0x856530d8, 0xf262004e,
+	0x6c0695ed, 0x1b01a57b, 0x8208f4c1, 0xf50fc457, 0x65b0d9c6, 0x12b7e950,
+	0x8bbeb8ea, 0xfcb9887c, 0x62dd1ddf, 0x15da2d49, 0x8cd37cf3, 0xfbd44c65,
+	0x4db26158, 0x3ab551ce, 0xa3bc0074, 0xd4bb30e2, 0x4adfa541, 0x3dd895d7,
+	0xa4d1c46d, 0xd3d6f4fb, 0x4369e96a, 0x346ed9fc, 0xad678846, 0xda60b8d0,
+	0x44042d73, 0x33031de5, 0xaa0a4c5f, 0xdd0d7cc9, 0x5005713c, 0x270241aa,
+	0xbe0b1010, 0xc90c2086, 0x5768b525, 0x206f85b3, 0xb966d409, 0xce61e49f,
+	0x5edef90e, 0x29d9c998, 0xb0d09822, 0xc7d7a8b4, 0x59b33d17, 0x2eb40d81,
+	0xb7bd5c3b, 0xc0ba6cad, 0xedb88320, 0x9abfb3b6, 0x03b6e20c, 0x74b1d29a,
+	0xead54739, 0x9dd277af, 0x04db2615, 0x73dc1683, 0xe3630b12, 0x94643b84,
+	0x0d6d6a3e, 0x7a6a5aa8, 0xe40ecf0b, 0x9309ff9d, 0x0a00ae27, 0x7d079eb1,
+	0xf00f9344, 0x8708a3d2, 0x1e01f268, 0x6906c2fe, 0xf762575d, 0x806567cb,
+	0x196c3671, 0x6e6b06e7, 0xfed41b76, 0x89d32be0, 0x10da7a5a, 0x67dd4acc,
+	0xf9b9df6f, 0x8ebeeff9, 0x17b7be43, 0x60b08ed5, 0xd6d6a3e8, 0xa1d1937e,
+	0x38d8c2c4, 0x4fdff252, 0xd1bb67f1, 0xa6bc5767, 0x3fb506dd, 0x48b2364b,
+	0xd80d2bda, 0xaf0a1b4c, 0x36034af6, 0x41047a60, 0xdf60efc3, 0xa867df55,
+	0x316e8eef, 0x4669be79, 0xcb61b38c, 0xbc66831a, 0x256fd2a0, 0x5268e236,
+	0xcc0c7795, 0xbb0b4703, 0x220216b9, 0x5505262f, 0xc5ba3bbe, 0xb2bd0b28,
+	0x2bb45a92, 0x5cb36a04, 0xc2d7ffa7, 0xb5d0cf31, 0x2cd99e8b, 0x5bdeae1d,
+	0x9b64c2b0, 0xec63f226, 0x756aa39c, 0x026d930a, 0x9c0906a9, 0xeb0e363f,
+	0x72076785, 0x05005713, 0x95bf4a82, 0xe2b87a14, 0x7bb12bae, 0x0cb61b38,
+	0x92d28e9b, 0xe5d5be0d, 0x7cdcefb7, 0x0bdbdf21, 0x86d3d2d4, 0xf1d4e242,
+	0x68ddb3f8, 0x1fda836e, 0x81be16cd, 0xf6b9265b, 0x6fb077e1, 0x18b74777,
+	0x88085ae6, 0xff0f6a70, 0x66063bca, 0x11010b5c, 0x8f659eff, 0xf862ae69,
+	0x616bffd3, 0x166ccf45, 0xa00ae278, 0xd70dd2ee, 0x4e048354, 0x3903b3c2,
+	0xa7672661, 0xd06016f7, 0x4969474d, 0x3e6e77db, 0xaed16a4a, 0xd9d65adc,
+	0x40df0b66, 0x37d83bf0, 0xa9bcae53, 0xdebb9ec5, 0x47b2cf7f, 0x30b5ffe9,
+	0xbdbdf21c, 0xcabac28a, 0x53b39330, 0x24b4a3a6, 0xbad03605, 0xcdd70693,
+	0x54de5729, 0x23d967bf, 0xb3667a2e, 0xc4614ab8, 0x5d681b02, 0x2a6f2b94,
+	0xb40bbe37, 0xc30c8ea1, 0x5a05df1b, 0x2d02ef8d
+};
+
+uint32_t igt_cpu_crc32(const void *buf, size_t size)
+{
+
+	const uint8_t *p = buf;
+	uint32_t crc;
+
+	crc = ~0U;
+
+	while (size--)
+		crc = igt_crc32_tab[(crc ^ *p++) & 0xFF] ^ (crc >> 8);
+
+	return crc ^ ~0U;
+}
diff --git a/lib/igt_crc.h b/lib/igt_crc.h
new file mode 100644
index 0000000000..5c0b934ea5
--- /dev/null
+++ b/lib/igt_crc.h
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#ifndef __IGT_CRC_H__
+#define __IGT_CRC_H__
+
+#include <stddef.h>
+#include <stdint.h>
+
+/**
+ * SECTION:igt_crc
+ * @short_description: igt crc tables and calculation functions
+ * @title: CRC
+ * @include: igt_crc.h
+ *
+ * # Introduction
+ *
+ * Providing vendor agnostic crc calculation is useful to avoid code
+ * duplication. Especially if vendor will decide to do on-gpu crc calculation
+ * it will need to inject crc table to gpu.
+ *
+ * All crc tables are globals to allow direct in-code use.
+ */
+
+const uint32_t igt_crc32_tab[256];
+
+uint32_t igt_cpu_crc32(const void *buf, size_t size);
+
+#endif
diff --git a/lib/meson.build b/lib/meson.build
index 0a173c1fc6..cc2b2abee6 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -15,6 +15,7 @@ lib_sources = [
 	'i915/i915_blt.c',
 	'igt_collection.c',
 	'igt_color_encoding.c',
+	'igt_crc.c',
 	'igt_debugfs.c',
 	'igt_device.c',
 	'igt_device_scan.c',
-- 
2.32.0
