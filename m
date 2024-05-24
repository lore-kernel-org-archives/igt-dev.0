Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88860C25B79
	for <igt-dev@archiver.kernel.org>; Fri, 24 May 2024 08:49:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B92E510E101;
	Fri, 24 May 2024 08:49:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ADfowBPL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A10210E243
 for <igt-dev@lists.freedesktop.org>; Fri, 24 May 2024 08:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716540561; x=1748076561;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=fuEnHcUGtxxuav3sIYfDZ4hLw55fI2ncp59T6zOg2gc=;
 b=ADfowBPLpxcKlKtZTcpqczDzRY+bV4hGMoONISIrqpq9fWH5qDBAxwxe
 yx7XG6oveVv+jZ7gnfu+yzv/8kwJOq/nTneIirUfWqho2oJKwbplUPwTd
 IHbbsvkMYD+ZThn057FhQFFAGecS1TohvMGA1sxt7A7ApFSud8GxVfELC
 RJcYH26XClle0J3Gj2QEIhN5COfEZg4+qcFbyzva88Yn4Sq/of6klo3HU
 Zp0Za7vqRS4D8i76xyKof+zJsTMygcoFOnUpfGfdF7rn3NqsL0LD52CYb
 wWzvTf1yfibt85KZUn3swUB0kavKjT+XEGdv8w/9KcoFy6oZJIHrE6d/2 w==;
X-CSE-ConnectionGUID: htHlCS8aTg2Tjq+rkQDQqQ==
X-CSE-MsgGUID: yevweRzwQg6GjbkpnTfpdw==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12692332"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="12692332"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 01:49:21 -0700
X-CSE-ConnectionGUID: j4MTqlL8THOKRQ/JPlP/MA==
X-CSE-MsgGUID: rJMdCmJ0QqKXeh0OeN06Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="33940922"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 01:49:19 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 24 May 2024 10:49:05 +0200
Subject: [PATCH v3 5/5] intel/xe_exec_sip: port test for shader sanity
 check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240524-iga64_inline_ups-v3-5-62427617ced3@intel.com>
References: <20240524-iga64_inline_ups-v3-0-62427617ced3@intel.com>
In-Reply-To: <20240524-iga64_inline_ups-v3-0-62427617ced3@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=13678;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=fuEnHcUGtxxuav3sIYfDZ4hLw55fI2ncp59T6zOg2gc=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmUFSGocd8wZ4YHtLa1k28iW6lWKOKCKLVoUjoKOxR
 9bxyDPSJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZlBUhgAKCRAjYrKT3hD911GXC/
 45ItmTbK74eN532R+jw+oDVgRubuTA8Y4Hw2IpFnbr2G5A6fvlYpXxmCHvcl/yPK++4dE2U4LcXzxv
 GBbO2G+DjM8Tm2ItGyG8IxGEAGzYZdEl3HEyAyT8eWprH6ZA59NuyBnvUf1jyAhf2ZEFpoWzXh7iYa
 ZN3VJreq1AXIC+0HknqOP1BMVuz+bzpObC1FNPq3SxtSQ1RVWRInfO4YE9WCF6Nu4g/9ZdvjLmMGq3
 t1jhpH/0CWjA2zIecPpyDlR0JuAsDAt9o1E7f3G+KAoCc8jkBBVfROXwdBzyso4mGZYaBgzbsnltuo
 B6j8hvt5nWCPCSJn7G0jYdhZmHHhdUFCM9WmpY5wpNDuhqLs86KZR8hi4RNxSB2G0UmsVBX8Kfq70C
 6mrYosK6agggfCWfVlATyMu2xILLR22eOwF/pvKq95y69VdqoV2nct0D65i2ZKFZdn1WBO+xr0DdSE
 C5UwbOpqxYfXR3kADz0Nx5fJyr2DZ2yYVfREJKOSUE2CU=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

xe_exec_sip will contain tests for shader and system routine (SIP)
interaction. Shaders (also called kernels) are programs runing on
execution units(EUs).
They can generate exceptions, which should be handled by SIP.
For starters let's implement test checking if shader runs correctly.

v2:
 - use introduced helper to access sysfs attributes,
 - remove redundant xe_device_get,
 - use drm_close_driver
v3:
 - switched to old style multiline string literals to satisfy clang

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/gpgpu_shader.c          |  63 ++++++++++++++
 lib/iga64_generated_codes.c |  83 ++++++++++++++++++-
 tests/intel/xe_exec_sip.c   | 195 ++++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build           |   1 +
 4 files changed, 341 insertions(+), 1 deletion(-)

diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
index 3317e9e35c91..ccc8e1974c5f 100644
--- a/lib/gpgpu_shader.c
+++ b/lib/gpgpu_shader.c
@@ -248,3 +248,66 @@ void gpgpu_shader_destroy(struct gpgpu_shader *shdr)
 	free(shdr->code);
 	free(shdr);
 }
+
+/**
+ * gpgpu_shader__eot:
+ * @shdr: shader to be modified
+ *
+ * Append end of thread instruction to @shdr.
+ */
+void gpgpu_shader__eot(struct gpgpu_shader *shdr)
+{
+	emit_iga64_code(shdr, eot, "						\n\
+(W)	mov (8|M0)               r112.0<1>:ud  r0.0<8;8,1>:ud			\n\
+#if GEN_VER < 1250								\n\
+(W)	send.ts (16|M0)          null r112 null 0x10000000 0x02000010 {EOT,@1}	\n\
+#else										\n\
+(W)	send.gtwy (8|M0)         null r112 src1_null     0 0x02000000 {EOT}	\n\
+#endif										\n\
+	");
+}
+
+/**
+ * gpgpu_shader__write_dword:
+ * @shdr: shader to be modified
+ * @value: dword to be written
+ * @y_offset: write target offset within the surface in rows
+ *
+ * Fill dword in (row, column/dword) == (tg_id_y + @y_offset, tg_id_x).
+ */
+void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
+			       uint32_t y_offset)
+{
+	emit_iga64_code(shdr, media_block_write, "				\n\
+	// Payload								\n\
+(W)	mov (1|M0)               r5.0<1>:ud    ARG(3):ud			\n\
+(W)	mov (1|M0)               r5.1<1>:ud    ARG(4):ud			\n\
+(W)	mov (1|M0)               r5.2<1>:ud    ARG(5):ud			\n\
+(W)	mov (1|M0)               r5.3<1>:ud    ARG(6):ud			\n\
+#if GEN_VER < 2000 // Media Block Write						\n\
+	// X offset of the block in bytes := (thread group id X << ARG(0))	\n\
+(W)	shl (1|M0)               r4.0<1>:ud    r0.1<0;1,0>:ud    ARG(0):ud	\n\
+	// Y offset of the block in rows := thread group id Y			\n\
+(W)	mov (1|M0)               r4.1<1>:ud    r0.6<0;1,0>:ud			\n\
+(W)	add (1|M0)               r4.1<1>:ud    r4.1<0;1,0>:ud   ARG(1):ud	\n\
+	// block width [0,63] representing 1 to 64 bytes			\n\
+(W)	mov (1|M0)               r4.2<1>:ud    ARG(2):ud			\n\
+	// FFTID := FFTID from R0 header					\n\
+(W)	mov (1|M0)               r4.4<1>:ud    r0.5<0;1,0>:ud			\n\
+(W)	send.dc1 (16|M0)         null     r4   src1_null 0    0x40A8000		\n\
+#else // Typed 2D Block Store							\n\
+	// Load r2.0-3 with tg id X << ARG(0)					\n\
+(W)	shl (1|M0)               r2.0<1>:ud    r0.1<0;1,0>:ud    ARG(0):ud	\n\
+	// Load r2.4-7 with tg id Y + ARG(1):ud					\n\
+(W)	mov (1|M0)               r2.1<1>:ud    r0.6<0;1,0>:ud			\n\
+(W)	add (1|M0)               r2.1<1>:ud    r2.1<0;1,0>:ud    ARG(1):ud	\n\
+	// payload setup							\n\
+(W)	mov (16|M0)              r4.0<1>:ud    0x0:ud				\n\
+	// Store X and Y block start (160:191 and 192:223)			\n\
+(W)	mov (2|M0)               r4.5<1>:ud    r2.0<2;2,1>:ud			\n\
+	// Store X and Y block max_size (224:231 and 232:239)			\n\
+(W)	mov (1|M0)               r4.7<1>:ud    ARG(2):ud			\n\
+(W)	send.tgm (16|M0)         null     r4   null:0    0    0x64000007	\n\
+#endif										\n\
+	", 2, y_offset, 3, value, value, value, value);
+}
diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
index 219436983585..ece7df94c793 100644
--- a/lib/iga64_generated_codes.c
+++ b/lib/iga64_generated_codes.c
@@ -3,4 +3,85 @@
 
 #include "gpgpu_shader.h"
 
-#define MD5_SUM_IGA64_ASMS 68b329da9893e34099c7d8ad5cb9c940
+#define MD5_SUM_IGA64_ASMS 2c503cbfbd7b3043e9a52188ae4da7a8
+
+struct iga64_template const iga64_code_media_block_write[] = {
+	{ .gen_ver = 2000, .size = 56, .code = (const uint32_t []) {
+		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
+		0x80000061, 0x05154220, 0x00000000, 0xc0ded004,
+		0x80000061, 0x05254220, 0x00000000, 0xc0ded005,
+		0x80000061, 0x05354220, 0x00000000, 0xc0ded006,
+		0x80000069, 0x02058220, 0x02000014, 0xc0ded000,
+		0x80000061, 0x02150220, 0x00000064, 0x00000000,
+		0x80001940, 0x02158220, 0x02000214, 0xc0ded001,
+		0x80100061, 0x04054220, 0x00000000, 0x00000000,
+		0x80041a61, 0x04550220, 0x00220205, 0x00000000,
+		0x80000061, 0x04754220, 0x00000000, 0xc0ded002,
+		0x80132031, 0x00000000, 0xd00e0494, 0x04000000,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 1272, .size = 52, .code = (const uint32_t []) {
+		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
+		0x80000061, 0x05154220, 0x00000000, 0xc0ded004,
+		0x80000061, 0x05254220, 0x00000000, 0xc0ded005,
+		0x80000061, 0x05354220, 0x00000000, 0xc0ded006,
+		0x80000069, 0x04058220, 0x02000014, 0xc0ded000,
+		0x80000061, 0x04150220, 0x00000064, 0x00000000,
+		0x80001940, 0x04158220, 0x02000414, 0xc0ded001,
+		0x80000061, 0x04254220, 0x00000000, 0xc0ded002,
+		0x80000061, 0x04450220, 0x00000054, 0x00000000,
+		0x80132031, 0x00000000, 0xc0000414, 0x02a00000,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 1250, .size = 56, .code = (const uint32_t []) {
+		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
+		0x80000061, 0x05254220, 0x00000000, 0xc0ded004,
+		0x80000061, 0x05454220, 0x00000000, 0xc0ded005,
+		0x80000061, 0x05654220, 0x00000000, 0xc0ded006,
+		0x80000069, 0x04058220, 0x02000024, 0xc0ded000,
+		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
+		0x80001940, 0x04258220, 0x02000424, 0xc0ded001,
+		0x80000061, 0x04454220, 0x00000000, 0xc0ded002,
+		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
+		0x80001901, 0x00010000, 0x00000000, 0x00000000,
+		0x80044031, 0x00000000, 0xc0000414, 0x02a00000,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 0, .size = 52, .code = (const uint32_t []) {
+		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
+		0x80000061, 0x05254220, 0x00000000, 0xc0ded004,
+		0x80000061, 0x05454220, 0x00000000, 0xc0ded005,
+		0x80000061, 0x05654220, 0x00000000, 0xc0ded006,
+		0x80000069, 0x04058220, 0x02000024, 0xc0ded000,
+		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
+		0x80000140, 0x04258220, 0x02000424, 0xc0ded001,
+		0x80000061, 0x04454220, 0x00000000, 0xc0ded002,
+		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
+		0x80049031, 0x00000000, 0xc0000414, 0x02a00000,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000101, 0x00010000, 0x00000000, 0x00000000,
+	}}
+};
+
+struct iga64_template const iga64_code_eot[] = {
+	{ .gen_ver = 1272, .size = 8, .code = (const uint32_t []) {
+		0x800c0061, 0x70050220, 0x00460005, 0x00000000,
+		0x800f2031, 0x00000004, 0x3000700c, 0x00000000,
+	}},
+	{ .gen_ver = 1250, .size = 12, .code = (const uint32_t []) {
+		0x80030061, 0x70050220, 0x00460005, 0x00000000,
+		0x80001901, 0x00010000, 0x00000000, 0x00000000,
+		0x80034031, 0x00000004, 0x3000700c, 0x00000000,
+	}},
+	{ .gen_ver = 0, .size = 8, .code = (const uint32_t []) {
+		0x80030061, 0x70050220, 0x00460005, 0x00000000,
+		0x80049031, 0x00000004, 0x7020700c, 0x10000000,
+	}}
+};
diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
new file mode 100644
index 000000000000..98ae61a5e12a
--- /dev/null
+++ b/tests/intel/xe_exec_sip.c
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+/**
+ * TEST: Tests for gpgpu shader and system routine (SIP) execution
+ * Category: Software building block
+ * Sub-category: gpgpu
+ * Functionality: system routine
+ * Test category: functionality test
+ * Description: Exercise interaction between gpgpu shader and system routine
+ *              (SIP), which should handle exceptions raised on Execution Unit.
+ */
+
+#include <dirent.h>
+#include <fcntl.h>
+#include <stdio.h>
+
+#include "gpgpu_shader.h"
+#include "igt.h"
+#include "igt_sysfs.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
+#define WIDTH 64
+#define HEIGHT 64
+
+#define COLOR_C4 0xc4
+
+#define SHADER_CANARY 0x01010101
+
+#define NSEC_PER_MSEC (1000 * 1000ull)
+
+static struct intel_buf *
+create_fill_buf(int fd, int width, int height, uint8_t color)
+{
+	struct intel_buf *buf;
+	uint8_t *ptr;
+
+	buf = calloc(1, sizeof(*buf));
+	igt_assert(buf);
+
+	intel_buf_init(buf_ops_create(fd), buf, width / 4, height, 32, 0,
+		       I915_TILING_NONE, 0);
+
+	ptr = xe_bo_map(fd, buf->handle, buf->surface[0].size);
+	memset(ptr, color, buf->surface[0].size);
+	munmap(ptr, buf->surface[0].size);
+
+	return buf;
+}
+
+static struct gpgpu_shader *get_shader(int fd)
+{
+	static struct gpgpu_shader *shader;
+
+	shader = gpgpu_shader_create(fd);
+	gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
+	gpgpu_shader__eot(shader);
+	return shader;
+}
+
+static uint32_t gpgpu_shader(int fd, struct intel_bb *ibb, unsigned int threads,
+			     unsigned int width, unsigned int height)
+{
+	struct intel_buf *buf = create_fill_buf(fd, width, height, COLOR_C4);
+	struct gpgpu_shader *shader = get_shader(fd);
+
+	gpgpu_shader_exec(ibb, buf, 1, threads, shader, NULL, 0, 0);
+	gpgpu_shader_destroy(shader);
+	return buf->handle;
+}
+
+static void check_fill_buf(uint8_t *ptr, const int width, const int x,
+			   const int y, const uint8_t color)
+{
+	const uint8_t val = ptr[y * width + x];
+
+	igt_assert_f(val == color,
+		     "Expected 0x%02x, found 0x%02x at (%d,%d)\n",
+		     color, val, x, y);
+}
+
+static void check_buf(int fd, uint32_t handle, int width, int height,
+		      uint8_t poison_c)
+{
+	unsigned int sz = ALIGN(width * height, 4096);
+	int thread_count = 0;
+	uint32_t *ptr;
+	int i, j;
+
+	ptr = xe_bo_mmap_ext(fd, handle, sz, PROT_READ);
+
+	for (i = 0, j = 0; j < height / 2; ++j) {
+		if (ptr[j * width / 4] == SHADER_CANARY) {
+			++thread_count;
+			i = 4;
+		}
+
+		for (; i < width; i++)
+			check_fill_buf((uint8_t *)ptr, width, i, j, poison_c);
+
+		i = 0;
+	}
+
+	igt_assert(thread_count);
+
+	munmap(ptr, sz);
+}
+
+static uint64_t
+xe_sysfs_get_job_timeout_ms(int fd, struct drm_xe_engine_class_instance *eci)
+{
+	int engine_fd = -1;
+	uint64_t ret;
+
+	engine_fd = xe_sysfs_engine_open(fd, eci->gt_id, eci->engine_class);
+	ret = igt_sysfs_get_u64(engine_fd, "job_timeout_ms");
+	close(engine_fd);
+
+	return ret;
+}
+
+/**
+ * SUBTEST: sanity
+ * Description: check basic shader with write operation
+ * Run type: BAT
+ *
+ */
+static void test_sip(struct drm_xe_engine_class_instance *eci, uint32_t flags)
+{
+	unsigned int threads = 512;
+	unsigned int height = max_t(threads, HEIGHT, threads * 2);
+	uint32_t exec_queue_id, handle, vm_id;
+	unsigned int width = WIDTH;
+	struct timespec ts = { };
+	uint64_t timeout;
+	struct intel_bb *ibb;
+	int fd;
+
+	igt_debug("Using %s\n", xe_engine_class_string(eci->engine_class));
+
+	fd = drm_open_driver(DRIVER_XE);
+	xe_device_get(fd);
+
+	vm_id = xe_vm_create(fd, 0, 0);
+
+	/* Get timeout for job, and add 4s to ensure timeout processes in subtest. */
+	timeout = xe_sysfs_get_job_timeout_ms(fd, eci) + 4ull * MSEC_PER_SEC;
+	timeout *= NSEC_PER_MSEC;
+	timeout *= igt_run_in_simulation() ? 10 : 1;
+
+	exec_queue_id = xe_exec_queue_create(fd, vm_id, eci, 0);
+	ibb = intel_bb_create_with_context(fd, exec_queue_id, vm_id, NULL, 4096);
+
+	igt_nsec_elapsed(&ts);
+	handle = gpgpu_shader(fd, ibb, threads, width, height);
+
+	intel_bb_sync(ibb);
+	igt_assert_lt_u64(igt_nsec_elapsed(&ts), timeout);
+
+	check_buf(fd, handle, width, height, COLOR_C4);
+
+	gem_close(fd, handle);
+	intel_bb_destroy(ibb);
+
+	xe_exec_queue_destroy(fd, exec_queue_id);
+	xe_vm_destroy(fd, vm_id);
+	xe_device_put(fd);
+	close(fd);
+}
+
+#define test_render_and_compute(t, __fd, __eci) \
+	igt_subtest_with_dynamic(t) \
+		xe_for_each_engine(__fd, __eci) \
+			if (__eci->engine_class == DRM_XE_ENGINE_CLASS_RENDER || \
+			    __eci->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) \
+				igt_dynamic_f("%s%d", xe_engine_class_string(__eci->engine_class), \
+					      __eci->engine_instance)
+
+igt_main
+{
+	struct drm_xe_engine_class_instance *eci;
+	int fd;
+
+	igt_fixture
+		fd = drm_open_driver(DRIVER_XE);
+
+	test_render_and_compute("sanity", fd, eci)
+		test_sip(eci, 0);
+
+	igt_fixture
+		drm_close_driver(fd);
+}
diff --git a/tests/meson.build b/tests/meson.build
index 758ae090c927..021421cfe92b 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -292,6 +292,7 @@ intel_xe_progs = [
 	'xe_exec_fault_mode',
 	'xe_exec_queue_property',
 	'xe_exec_reset',
+	'xe_exec_sip',
 	'xe_exec_store',
 	'xe_exec_threads',
 	'xe_exercise_blt',

-- 
2.34.1

