Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE05CD3424
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 06:56:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C2710ECCD;
	Wed,  6 May 2026 06:56:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WIQieSfl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ADF510E4F6
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 06:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778050556; x=1809586556;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ME8pOFVt7YcI0lHdwFi7wjGu6QrMXij0ayXYjjKz5rI=;
 b=WIQieSfl+c21irS9H37G7QWc1KXT76YcB3Kiz2bruOxPMZlAGa3g/rVv
 RgFXYsSSebYldIl4DZLvmavAsAGSnh55GqvFtpyBAsCOp2tEaaXNApSdq
 IwoEc1PY607mTmvDnUPUVtaBuV/nISwgMtJynQ/c0AXNXum0Sn8A7xGwv
 JBf2govRtPvKW+gVcP/FwF73txj2J1647Cz/AiP+8kdOc88NFN6LTR1Go
 AD88vP1P1wnFasI5YONzYjbqL8lE27DHZrfCMSujR1ZnxilN+ZrSSQiUX
 oPvz4Xb68daDLzETvr46Y4urkCnK3LOFx0fPlLu6LEbZV0Xut2oLySxia Q==;
X-CSE-ConnectionGUID: 2btF0megSaCnq40NsXZB1A==
X-CSE-MsgGUID: L9foQBMtTkqZbjDf4DaZxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="90063689"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="90063689"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 23:55:10 -0700
X-CSE-ConnectionGUID: tjXOIPAXTQihZydt3HhndQ==
X-CSE-MsgGUID: 4S4qU7OORHqfn1rwut1tjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="231677303"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.175])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 23:55:08 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH i-g-t v2 1/2] lib/gpgpu_fill: Add support for xe3p gpgpu fill
Date: Wed,  6 May 2026 08:55:02 +0200
Message-ID: <20260506065500.162563-5-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260506065500.162563-4-zbigniew.kempczynski@intel.com>
References: <20260506065500.162563-4-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

XE3P uses in non-legacy mode COMPUTE_WALKER_2 so adopt pipeline and
shader in gpgpu library to properly handle gpgpu fill.

Difference between previous platforms shaders is no surface state
is used so all geometry must be handled by the pipeline / shader
(accesses to memory are via untyped global [ugm]). Threads spawned
here are still SIMD16, but due to conditional writing to ugm memory
with 4B vector using 4x1 sizes and positions become possible.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
---
v2: drop buffer patching and pass its offset via inline (Andrzej)
---
 lib/gpgpu_fill.c                     | 117 ++++++++++++++++++++++++++-
 lib/gpgpu_fill.c.gen.iga64_codes.c   |  46 ++++++++++-
 lib/gpgpu_fill.h                     |   8 ++
 lib/gpgpu_shader.c                   |   6 +-
 lib/gpgpu_shader.c.gen.iga64_codes.c |   6 +-
 lib/gpu_cmds.c                       |  96 ++++++++++++++++++----
 lib/gpu_cmds.h                       |  16 ++++
 lib/intel_batchbuffer.c              |   4 +-
 8 files changed, 277 insertions(+), 22 deletions(-)

diff --git a/lib/gpgpu_fill.c b/lib/gpgpu_fill.c
index f83eee5f21..d4d477fd81 100644
--- a/lib/gpgpu_fill.c
+++ b/lib/gpgpu_fill.c
@@ -26,13 +26,14 @@
  */
 
 #include <i915_drm.h>
-
+#include <ioctl_wrappers.h>
 #include "intel_reg.h"
 #include "drmtest.h"
 
 #include "gpgpu_fill.h"
 #include "gpgpu_shader.h"
 #include "gpu_cmds.h"
+#include "xe/xe_util.h"
 
 /* lib/i915/shaders/gpgpu/gpgpu_fill.gxa */
 static const uint32_t gen7_gpgpu_kernel[][4] = {
@@ -328,6 +329,79 @@ mov (1|M0)		 r4.14<1>:w	0xF:w					\n\
 send.tgm (16|M0)	null	r4	null	0x0	0x64000007		\n\
 #endif										\n\
 	");
+	gpgpu_shader__eot(kernel);
+	return kernel;
+}
+
+static struct gpgpu_shader *__xe3p_gpgpu_kernel(int xe)
+{
+	struct gpgpu_shader *kernel = gpgpu_shader_create(xe);
+
+	emit_iga64_code(kernel, xe3p_gpgpu_fill, R"(
+#define RX		r0.1
+#define RY		r0.6
+#define COLOR		r1.0
+#define SURFWIDTH	r1.1
+#define SURFHEIGHT	r1.2
+#define WIDTH		r1.3
+#define HEIGHT		r1.4
+#define XPOS		r1.5
+#define YPOS		r1.6
+#define ADDR_BO_LOW	r1.7
+#define ADDR_BO_HIGH	r1.8
+#define OFFSET		r3.0
+#define XOFFSET		r3.1
+#define YOFFSET		r3.2
+#define XEND		r3.3
+#define XCURRENT	r3.4
+#define TMP		r3.7
+#define ADDR_LO		r4.0
+#if GEN_VER >= 3500
+(W)	add (1)		XEND<1>:ud	XPOS:ud		WIDTH:ud
+(W)	mov (1)		OFFSET<1>:ud	0x0:ud
+
+(W)	shl (1)		XOFFSET<1>:ud	RX:ud		0x4:ud
+(W)	add (1)		XOFFSET<1>:ud	XOFFSET:ud	XPOS:ud
+(W)	mov (1)		XCURRENT<1>:ud	XOFFSET:ud
+
+(W)	add (1)		TMP<1>:ud	RY:ud		YPOS:ud
+(W)	mul (1)		YOFFSET<1>:ud	TMP:ud		SURFWIDTH:ud
+(W)	add (1)		OFFSET<1>:ud	XOFFSET:ud	YOFFSET:ud
+
+// Set base address with scalar register
+(W)	add (1)		ADDR_LO<1>:ud	OFFSET:ud	ADDR_BO_LOW:ud
+(W)	mov (1)		s0.0<1>:ud	ADDR_LO:ud
+(W)	mov (1)		s0.1<1>:ud	ADDR_BO_HIGH:ud
+
+// color
+(W)	mov (4)		r20.0<1>:ub		COLOR:ub
+
+// A64 offset
+(W)	mov (8)		r30.0<1>:uq		0x0:uq
+
+//dword: 0
+(W)	cmp (1)		(lt)f0.0 null:ud        XCURRENT:ud	XEND:ud
+(W&f0.0)sendg.ugm (1)	null	r30:1	r20:1	s0.0	0x29404
+//dword: 1
+(W)	add (1)		XCURRENT<1>:ud		XCURRENT:ud	4:ud
+(W)	add (1)		ADDR_LO<1>:ud		ADDR_LO:ud	0x4:ud
+(W)	mov (1)		s0.0<1>:ud		ADDR_LO:ud
+(W)	cmp (1)		(lt)f0.0 null:ud        XCURRENT:ud	XEND:ud
+(W&f0.0)sendg.ugm (1)	null	r30:1	r20:1	s0.0	0x29404
+//dword: 2
+(W)	add (1)		XCURRENT<1>:ud		XCURRENT:ud	4:ud
+(W)	add (1)		ADDR_LO<1>:ud		ADDR_LO:ud	0x4:ud
+(W)	mov (1)		s0.0<1>:ud		ADDR_LO:ud
+(W)	cmp (1)		(lt)f0.0 null:ud        XCURRENT:ud	XEND:ud
+(W&f0.0)sendg.ugm (1)	null	r30:1	r20:1	s0.0	0x29404
+//dword: 3
+(W)	add (1)		XCURRENT<1>:ud		XCURRENT:ud	4:ud
+(W)	add (1)		ADDR_LO<1>:ud		ADDR_LO:ud	0x4:ud
+(W)	mov (1)		s0.0<1>:ud		ADDR_LO:ud
+(W)	cmp (1)		(lt)f0.0 null:ud        XCURRENT:ud	XEND:ud
+(W&f0.0)sendg.ugm (1)	null	r30:1	r20:1	s0.0	0x29404
+#endif
+)");
 
 	gpgpu_shader__eot(kernel);
 	return kernel;
@@ -373,6 +447,47 @@ void xehp_gpgpu_fillfunc(int i915,
 	intel_bb_destroy(ibb);
 }
 
+void xe3p_gpgpu_fillfunc(int fd,
+			 struct intel_buf *buf,
+			 unsigned int x, unsigned int y,
+			 unsigned int width, unsigned int height,
+			 uint8_t color)
+{
+	struct intel_bb *ibb;
+	struct gpgpu_shader *kernel;
+	struct xe3p_interface_descriptor_data idd;
+
+	ibb = intel_bb_create(fd, PAGE_SIZE);
+	intel_bb_add_intel_buf(ibb, buf, true);
+
+	intel_bb_ptr_set(ibb, BATCH_STATE_SPLIT);
+
+	kernel = __xe3p_gpgpu_kernel(fd);
+	xe3p_fill_interface_descriptor(ibb, buf, kernel->instr,
+				       kernel->size * 4, &idd);
+	gpgpu_shader_destroy(kernel);
+
+	intel_bb_ptr_set(ibb, 0);
+
+	/* GPGPU pipeline */
+	intel_bb_out(ibb, GEN7_PIPELINE_SELECT | GEN9_PIPELINE_SELECTION_MASK |
+		  PIPELINE_SELECT_GPGPU);
+	xe3p_emit_state_base_address(ibb);
+	xehp_emit_state_compute_mode(ibb, false);
+	xe3p_emit_fill_compute_walk2(ibb, buf->width * buf->bpp / 8, buf->height,
+				     xe_canonical_va(fd, buf->addr.offset),
+				     x, y, width, height, &idd, color);
+
+	intel_bb_out(ibb, MI_BATCH_BUFFER_END);
+	intel_bb_ptr_align(ibb, 32);
+
+	intel_bb_exec(ibb, intel_bb_offset(ibb),
+		      I915_EXEC_RENDER | I915_EXEC_NO_RELOC, true);
+
+	intel_bb_destroy(ibb);
+}
+
+
 void gen9_gpgpu_fillfunc(int i915,
 			 struct intel_buf *buf,
 			 unsigned x, unsigned y,
diff --git a/lib/gpgpu_fill.c.gen.iga64_codes.c b/lib/gpgpu_fill.c.gen.iga64_codes.c
index 400ff7b18a..8c61ce9984 100644
--- a/lib/gpgpu_fill.c.gen.iga64_codes.c
+++ b/lib/gpgpu_fill.c.gen.iga64_codes.c
@@ -3,7 +3,51 @@
 
 #include "gpgpu_shader.h"
 
-#define MD5_SUM_IGA64_ASMS ebaa9e23021939d874c576c7cea482bf
+#define MD5_SUM_IGA64_ASMS a2e53c9b23d1d1bcb0e2271f8b47c7c7
+
+struct iga64_template const iga64_code_xe3p_gpgpu_fill[] = {
+	{ .gen_ver = 3500, .size = 144, .code = (const uint32_t []) {
+		0x80000040, 0x03350220, 0x02000154, 0x00100134,
+		0x80000061, 0x03054220, 0x00000000, 0x00000000,
+		0x80000069, 0x03158220, 0x02000014, 0x00000004,
+		0x80001940, 0x03150220, 0x02000314, 0x00100154,
+		0x80001961, 0x03450220, 0x00000314, 0x00000000,
+		0x80000040, 0x03750220, 0x02000064, 0x00100164,
+		0x80001941, 0x03250220, 0x02000374, 0x00100114,
+		0x80001940, 0x03050220, 0x02000314, 0x00100324,
+		0x80001940, 0x04050220, 0x02000304, 0x00100174,
+		0x80001961, 0x60010220, 0x00000404, 0x00000000,
+		0x80000061, 0x60110220, 0x00000184, 0x00000000,
+		0x80080061, 0x14050000, 0x00000104, 0x00000000,
+		0x800c0061, 0x1e054330, 0x00000000, 0x00000000,
+		0x80001f70, 0x00010220, 0x52000344, 0x00100334,
+		0x84032033, 0x00000004, 0xf0021e0c, 0x9404140c,
+		0x80000040, 0x03458220, 0x02000344, 0x00000004,
+		0x80000040, 0x04058220, 0x02000404, 0x00000004,
+		0x8000a001, 0x00010000, 0x00000000, 0x00000000,
+		0x80001961, 0x60010220, 0x00000404, 0x00000000,
+		0x80001b70, 0x00010220, 0x52000344, 0x00100334,
+		0x84032133, 0x00000004, 0xf0021e0c, 0x9404140c,
+		0x80000040, 0x03458220, 0x02000344, 0x00000004,
+		0x80000040, 0x04058220, 0x02000404, 0x00000004,
+		0x8000a101, 0x00010000, 0x00000000, 0x00000000,
+		0x80001961, 0x60010220, 0x00000404, 0x00000000,
+		0x80001b70, 0x00010220, 0x52000344, 0x00100334,
+		0x84032233, 0x00000004, 0xf0021e0c, 0x9404140c,
+		0x80000040, 0x03458220, 0x02000344, 0x00000004,
+		0x80000040, 0x04058220, 0x02000404, 0x00000004,
+		0x8000a201, 0x00010000, 0x00000000, 0x00000000,
+		0x80001961, 0x60010220, 0x00000404, 0x00000000,
+		0x80001b70, 0x00010220, 0x52000344, 0x00100334,
+		0x84032333, 0x00000004, 0xf0021e0c, 0x9404140c,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 0, .size = 0, .code = (const uint32_t []) {
+
+	}}
+};
 
 struct iga64_template const iga64_code_gpgpu_fill[] = {
 	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
diff --git a/lib/gpgpu_fill.h b/lib/gpgpu_fill.h
index a483859e5e..96d291c987 100644
--- a/lib/gpgpu_fill.h
+++ b/lib/gpgpu_fill.h
@@ -68,4 +68,12 @@ xehp_gpgpu_fillfunc(int i915,
 		    unsigned int width, unsigned int height,
 		    uint8_t color);
 
+void
+xe3p_gpgpu_fillfunc(int fd,
+		    struct intel_buf *dst,
+		    unsigned int x, unsigned int y,
+		    unsigned int width, unsigned int height,
+		    uint8_t color);
+
+
 #endif /* GPGPU_FILL_H */
diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
index ffa357eeb1..ccab4d4b0f 100644
--- a/lib/gpgpu_shader.c
+++ b/lib/gpgpu_shader.c
@@ -599,8 +599,12 @@ void gpgpu_shader__eot(struct gpgpu_shader *shdr)
 (W)	mov (8|M0)               r112.0<1>:ud  r0.0<8;8,1>:ud			\n\
 #if GEN_VER < 1250								\n\
 (W)	send.ts (16|M0)          null r112 null 0x10000000 0x02000010 {EOT,@1}	\n\
-#else										\n\
+										\n\
+#elif GEN_VER <= 3000								\n\
 (W)	send.gtwy (8|M0)         null r112 src1_null     0 0x02000000 {EOT}	\n\
+										\n\
+#else										\n\
+(W)	sendg.gtwy (1|M0)        null     r0:1  null:0  0x0 {EOT}		\n\
 #endif										\n\
 		");
 }
diff --git a/lib/gpgpu_shader.c.gen.iga64_codes.c b/lib/gpgpu_shader.c.gen.iga64_codes.c
index 59172cdfd1..064564cfb2 100644
--- a/lib/gpgpu_shader.c.gen.iga64_codes.c
+++ b/lib/gpgpu_shader.c.gen.iga64_codes.c
@@ -3,7 +3,7 @@
 
 #include "gpgpu_shader.h"
 
-#define MD5_SUM_IGA64_ASMS 4311fff3bece03802f3220b7d239c33b
+#define MD5_SUM_IGA64_ASMS bd1d8e873d1021863cf0b0cde7c332ea
 
 struct iga64_template const iga64_code_read_a64_d32[] = {
 	{ .gen_ver = 2000, .size = 40, .code = (const uint32_t []) {
@@ -843,6 +843,10 @@ struct iga64_template const iga64_code_jump[] = {
 };
 
 struct iga64_template const iga64_code_eot[] = {
+	{ .gen_ver = 3500, .size = 8, .code = (const uint32_t []) {
+		0x800c0061, 0x70050220, 0x00460005, 0x00000000,
+		0x8000c033, 0x00000001, 0x3000000c, 0x00000000,
+	}},
 	{ .gen_ver = 2000, .size = 8, .code = (const uint32_t []) {
 		0x800c0061, 0x70050220, 0x00460005, 0x00000000,
 		0x800f2031, 0x00000004, 0x3000700c, 0x00000000,
diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
index 10c8bfb8dd..f7b6c8703f 100644
--- a/lib/gpu_cmds.c
+++ b/lib/gpu_cmds.c
@@ -1267,13 +1267,14 @@ xehp_emit_compute_walk(struct intel_bb *ibb,
 	}
 }
 
-void
-xe3p_emit_compute_walk2(struct intel_bb *ibb,
-			unsigned int x, unsigned int y,
-			unsigned int width, unsigned int height,
-			struct xe3p_interface_descriptor_data *pidd,
-			uint32_t max_threads,
-			struct xe3p_cw2_interrupt_data *intdata)
+static void
+__xe3p_emit_compute_walk2(struct intel_bb *ibb,
+			  unsigned int x, unsigned int y,
+			  unsigned int width, unsigned int height,
+			  struct xe3p_interface_descriptor_data *pidd,
+			  uint32_t max_threads,
+			  struct xe3p_cw2_interrupt_data *intdata,
+			  struct xe3p_cw2_gpgpu_fill_data *filldata)
 {
 	/*
 	 * Max Threads represent range: [1, 2^16-1],
@@ -1282,6 +1283,14 @@ xe3p_emit_compute_walk2(struct intel_bb *ibb,
 	const uint32_t MAX_THREADS = (1 << 16) - 1;
 	uint32_t x_dim, y_dim, mask, max;
 
+	if (filldata) {
+		if (width + x > filldata->buf_width)
+			width = filldata->buf_width - x;
+
+		if (height + y > filldata->buf_height)
+			height = filldata->buf_height - y;
+	}
+
 	/*
 	 * Simply do SIMD16 based dispatch, so every thread uses
 	 * SIMD16 channels.
@@ -1294,7 +1303,7 @@ xe3p_emit_compute_walk2(struct intel_bb *ibb,
 	 * thread group Y = height;
 	 */
 	x_dim = (x + width + 15) / 16;
-	y_dim = y + height;
+	y_dim = height + y * (filldata ? 0 : 1);
 
 	mask = (x + width) & 15;
 	if (mask == 0)
@@ -1332,9 +1341,15 @@ xe3p_emit_compute_walk2(struct intel_bb *ibb,
 	intel_bb_out(ibb, 1);						//dw8
 
 	/* Thread Group ID Starting X, Y, Z */
-	intel_bb_out(ibb, x / 16);					//dw9
-	intel_bb_out(ibb, y);						//dw10
-	intel_bb_out(ibb, 0);						//dw11
+	if (filldata) {
+		intel_bb_out(ibb, 0);					//dw9
+		intel_bb_out(ibb, 0);					//dw10
+		intel_bb_out(ibb, 0);					//dw11
+	} else {
+		intel_bb_out(ibb, x / 16);				//dw9
+		intel_bb_out(ibb, y);					//dw10
+		intel_bb_out(ibb, 0);					//dw11
+	}
 
 	/* partition type / id / size */
 	intel_bb_out(ibb, 0);						//dw12-13
@@ -1366,12 +1381,27 @@ xe3p_emit_compute_walk2(struct intel_bb *ibb,
 		}
 	}
 
-	/* Inline data */
-	/* DW31 and DW32 of Inline data will be copied into R0.14 and R0.15. */
-	/* The rest of DW33 through DW46 will be copied to the following GRFs. */
-	intel_bb_out(ibb, x_dim);					//dw31
-	for (int i = 0; i < 15; i++) {					//dw32-46
-		intel_bb_out(ibb, 0);
+	if (filldata) {
+		/* Inline data */
+		intel_bb_out(ibb, filldata->color);			//dw31
+		intel_bb_out(ibb, filldata->buf_width);			//dw32
+		intel_bb_out(ibb, filldata->buf_height);		//dw33
+		intel_bb_out(ibb, width);				//dw34
+		intel_bb_out(ibb, height);				//dw35
+		intel_bb_out(ibb, x);					//dw36
+		intel_bb_out(ibb, y);					//dw37
+		intel_bb_out(ibb, filldata->buf_addr);			//dw38
+		intel_bb_out(ibb, filldata->buf_addr >> 32);		//dw39
+		for (int i = 0; i < 7; i++)				//dw40-46
+			intel_bb_out(ibb, 0x0);
+
+	} else {
+		/* Inline data */
+		/* DW31 and DW32 of Inline data will be copied into R0.14 and R0.15. */
+		/* The rest of DW33 through DW46 will be copied to the following GRFs. */
+		intel_bb_out(ibb, x_dim);				//dw31
+		for (int i = 0; i < 15; i++)				//dw32-46
+			intel_bb_out(ibb, 0);
 	}
 
 	/* Post Sync command payload 1 */
@@ -1392,3 +1422,35 @@ xe3p_emit_compute_walk2(struct intel_bb *ibb,
 	/* Preempt CS Interrupt Vector: Saved by HW on a TG preemption */
 	intel_bb_out(ibb, 0);						//dw62
 }
+
+void
+xe3p_emit_compute_walk2(struct intel_bb *ibb,
+			unsigned int x, unsigned int y,
+			unsigned int width, unsigned int height,
+			struct xe3p_interface_descriptor_data *pidd,
+			uint32_t max_threads,
+			struct xe3p_cw2_interrupt_data *intdata)
+{
+	__xe3p_emit_compute_walk2(ibb, x, y, width, height,
+				  pidd, max_threads, intdata, NULL);
+}
+
+void
+xe3p_emit_fill_compute_walk2(struct intel_bb *ibb,
+			     unsigned int buf_width, unsigned int buf_height,
+			     uint64_t buf_addr,
+			     unsigned int x, unsigned int y,
+			     unsigned int width, unsigned int height,
+			     struct xe3p_interface_descriptor_data *pidd,
+			     uint8_t color)
+{
+	struct xe3p_cw2_gpgpu_fill_data filldata = {
+		.buf_width = buf_width,
+		.buf_height = buf_height,
+		.buf_addr = buf_addr,
+		.color = color,
+	};
+
+	__xe3p_emit_compute_walk2(ibb, x, y, width, height,
+				  pidd, 64, NULL, &filldata);
+}
diff --git a/lib/gpu_cmds.h b/lib/gpu_cmds.h
index b3bfb137b0..b9895801e8 100644
--- a/lib/gpu_cmds.h
+++ b/lib/gpu_cmds.h
@@ -45,6 +45,13 @@ struct xe3p_cw2_interrupt_data {
 	uint64_t post_sync_val;
 };
 
+struct xe3p_cw2_gpgpu_fill_data {
+	uint32_t buf_width;
+	uint32_t buf_height;
+	uint64_t buf_addr;
+	uint8_t color;
+};
+
 uint32_t
 gen7_fill_curbe_buffer_data(struct intel_bb *ibb, uint8_t color);
 
@@ -168,4 +175,13 @@ xe3p_emit_compute_walk2(struct intel_bb *ibb,
 			uint32_t max_threads,
 			struct xe3p_cw2_interrupt_data *intdata);
 
+void
+xe3p_emit_fill_compute_walk2(struct intel_bb *ibb,
+			     unsigned int buf_width, unsigned int buf_height,
+			     uint64_t buf_addr,
+			     unsigned int x, unsigned int y,
+			     unsigned int width, unsigned int height,
+			     struct xe3p_interface_descriptor_data *pidd,
+			     uint8_t color);
+
 #endif /* GPU_CMDS_H */
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index b095065746..189a411968 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -769,7 +769,9 @@ igt_fillfunc_t igt_get_gpgpu_fillfunc(int devid)
 {
 	igt_fillfunc_t fill = NULL;
 
-	if (intel_graphics_ver(devid) >= IP_VER(12, 50))
+	if (intel_graphics_ver(devid) >= IP_VER(35, 0))
+		fill = xe3p_gpgpu_fillfunc;
+	else if (intel_graphics_ver(devid) >= IP_VER(12, 50))
 		fill = xehp_gpgpu_fillfunc;
 	else if (IS_GEN12(devid))
 		fill = gen12_gpgpu_fillfunc;
-- 
2.43.0

