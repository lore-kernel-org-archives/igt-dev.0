Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC57C52D7C
	for <igt-dev@archiver.kernel.org>; Fri, 23 Aug 2024 06:45:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7903610EBF4;
	Fri, 23 Aug 2024 06:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XspAwgBS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA56210EBF4
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Aug 2024 06:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724395527; x=1755931527;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=12QIE02wB5HsuSgPlyURZBIn5w7eTsn14Jgw77sMr8A=;
 b=XspAwgBSEnIW9GDZ3rUZqWSdu2cy9AwdxODE61scjlLOkUtd1QIZcJYb
 a2Ii9qYLOb0eDQJniNXeJOfoVnCuCGSRPNlMnUYwKdmBZio2KO7GpxE5i
 LerulSMOj2vKzvnqYe3I0sQ/JkM1+NAg+yOv8YPiPq9rVs3xJXWbcbbXn
 Zro1KJK75zppB2BKqFzaw7vxfU1I7BOv7Y3caeb+auaU+PAbBRcShkyXo
 N88SMZPHuu0Bdz8gMW48nBi78hEGLD1D3UeujQjjvHuCqUc1IGxVTXfKV
 7v+23e+NL9rYllQKDSjT8whSQ30zuvYZ+62v7J6Ek3LBO10L2BFn+ellj w==;
X-CSE-ConnectionGUID: oR7bOQkYRmKqkJrbTEQZVA==
X-CSE-MsgGUID: M2GE3FtpR5i4ZkmcbreqOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="23000430"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="23000430"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 23:45:26 -0700
X-CSE-ConnectionGUID: bsg0ajJPRX6EuAC+6+eaoQ==
X-CSE-MsgGUID: IDwLAjfWS0ubM2Q9S3kVcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="84891639"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO dgrzegor-mobl2..)
 ([10.245.246.208])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 23:45:24 -0700
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH i-g-t v4] lib/gpgpu_fill: Write kernel using inline iga64 api
Date: Fri, 23 Aug 2024 08:44:53 +0200
Message-Id: <20240823064453.804687-1-dominik.grzegorzek@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

Rewrite gpgpu_fill shaders to utilize the newly introduced
method of writing IGA64 assembly inline.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/gpgpu_fill.c                              | 142 ++++++++----------
 lib/gpgpu_fill.h                              |  13 --
 .../shaders/gpgpu/gen12p72_gpgpu_kernel.asm   |  12 --
 .../shaders/gpgpu/xe2lpg_gpgpu_kernel.asm     |  13 --
 lib/i915/shaders/gpgpu/xehp_gpgpu_kernel.asm  |  12 --
 lib/iga64_generated_codes.c                   |  76 +++++++++-
 lib/intel_batchbuffer.c                       |   8 +-
 lib/meson.build                               |   2 +-
 8 files changed, 140 insertions(+), 138 deletions(-)
 delete mode 100644 lib/i915/shaders/gpgpu/gen12p72_gpgpu_kernel.asm
 delete mode 100644 lib/i915/shaders/gpgpu/xe2lpg_gpgpu_kernel.asm
 delete mode 100644 lib/i915/shaders/gpgpu/xehp_gpgpu_kernel.asm

diff --git a/lib/gpgpu_fill.c b/lib/gpgpu_fill.c
index 1270c2b22..fe0b8b35d 100644
--- a/lib/gpgpu_fill.c
+++ b/lib/gpgpu_fill.c
@@ -31,6 +31,7 @@
 #include "drmtest.h"
 
 #include "gpgpu_fill.h"
+#include "gpgpu_shader.h"
 #include "gpu_cmds.h"
 
 /* lib/i915/shaders/gpgpu/gpgpu_fill.gxa */
@@ -99,43 +100,6 @@ static const uint32_t gen12_gpgpu_kernel[][4] = {
 	{ 0x00040131, 0x00000004, 0x7020700c, 0x10000000 },
 };
 
-static const uint32_t xehp_gpgpu_kernel[][4] = {
-	{ 0x00020061, 0x01050000, 0x00000104, 0x00000000 },
-	{ 0x00000069, 0x02058220, 0x02000024, 0x00000004 },
-	{ 0x00000061, 0x02250220, 0x000000c4, 0x00000000 },
-	{ 0x00030061, 0x04050220, 0x00460005, 0x00000000 },
-	{ 0x00011a61, 0x04050220, 0x00220205, 0x00000000 },
-	{ 0x00000061, 0x04454220, 0x00000000, 0x0000000f },
-	{ 0x00041e61, 0x05050220, 0x00000104, 0x00000000 },
-	{ 0x80001901, 0x00010000, 0x00000000, 0x00000000 },
-	{ 0x00044031, 0x00000000, 0xc0000414, 0x02a00000 },
-	{ 0x00030031, 0x00000004, 0x3000500c, 0x00000000 },
-};
-
-static const uint32_t xehpc_gpgpu_kernel[][4] = {
-	{ 0x00080061, 0x01050000, 0x00000104, 0x00000000 },
-	{ 0x00000069, 0x02058220, 0x02000014, 0x00000004 },
-	{ 0x00000061, 0x02150220, 0x00000064, 0x00000000 },
-	{ 0x000c0061, 0x04050220, 0x00460005, 0x00000000 },
-	{ 0x00041a61, 0x04050220, 0x00220205, 0x00000000 },
-	{ 0x00000061, 0x04254220, 0x00000000, 0x0000000f },
-	{ 0x00101e61, 0x05050220, 0x00000104, 0x00000000 },
-	{ 0x00132031, 0x00000000, 0xc0000414, 0x02a00000 },
-	{ 0x000c0031, 0x00000004, 0x3000500c, 0x00000000 },
-};
-
-static const uint32_t xe2lpg_gpgpu_kernel[][4] = {
-	{ 0x00080061, 0x01050000, 0x00000104, 0x00000000 },
-	{ 0x00000069, 0x02058220, 0x02000014, 0x00000004 },
-	{ 0x00000061, 0x02150220, 0x00000064, 0x00000000 },
-	{ 0x00100061, 0x04054220, 0x00000000, 0x00000000 },
-	{ 0x00041a61, 0x04550220, 0x00220205, 0x00000000 },
-	{ 0x00000061, 0x04754550, 0x00000000, 0x000f000f },
-	{ 0x00101e61, 0x05050220, 0x00000104, 0x00000000 },
-	{ 0x00132031, 0x00000000, 0xd00e0494, 0x04000000 },
-	{ 0x000c0031, 0x00000004, 0x3000500c, 0x00000000 },
-};
-
 /*
  * This sets up the gpgpu pipeline,
  *
@@ -317,15 +281,66 @@ __gen9_gpgpu_fillfunc(int i915,
 	intel_bb_destroy(ibb);
 }
 
-static void
-__xehp_gpgpu_fillfunc(int i915,
-		      struct intel_buf *buf,
-		      unsigned int x, unsigned int y,
-		      unsigned int width, unsigned int height,
-		      uint8_t color, const uint32_t kernel[][4],
-		      size_t kernel_size)
+static struct gpgpu_shader *__xehp_gpgpu_kernel(int i915)
+{
+	struct gpgpu_shader *kernel = gpgpu_shader_create(i915);
+
+	emit_iga64_code(kernel, gpgpu_fill, "					\n\
+// fill up r1 with target colour						\n\
+mov (4|M0)		r1.0<1>:ub	r1.0<0;1,0>:ub				\n\
+// prepare block x offset (Thread Group Id X * 16)				\n\
+shl (1|M0)		r2.0<1>:ud	r0.1<0;1,0>:ud	0x4:ud			\n\
+// prepare block y offset (Thread Group Id Y)					\n\
+mov (1|M0)		r2.1<1>:ud	r0.6<0;1,0>:ud				\n\
+// zero message header payload							\n\
+mov (8|M0)		r4.0<1>:ud	0x0:ud					\n\
+// fill up message payload with target colour					\n\
+mov (16|M0)		r5.0<1>:ud	r1.0<0;1,0>:ud				\n\
+#if GEN_VER < 2000								\n\
+// load block offsets into message header payload				\n\
+mov (2|M0)		r4.0<1>:ud	r2.0<2;2,1>:ud				\n\
+// load block width								\n\
+mov (1|M0)		r4.2<1>:ud	0xF:ud					\n\
+// load FFTID from R0 header							\n\
+mov (1|M0)		r4.4<1>:ud	r0.5<0;1,0>:ud				\n\
+// Media block write to bti[0] surface						\n\
+// Message Descriptor								\n\
+//	0x40A8000:								\n\
+//	[28:25]		Mlen: 2							\n\
+//	[24:20]		Rlen: 0							\n\
+//	[19]		Header: 1 (included)					\n\
+//	[18:14]		MessageType: 0xA (media block write)			\n\
+//	[7:0]		BTI: 0							\n\
+send.dc1 (16|M0)	null	r4	src1_null	0x0	0x40A8000	\n\
+#else										\n\
+// load block offsets into message header payload				\n\
+mov (2|M0)		r4.5<1>:ud	r2.0<2;2,1>:ud				\n\
+// load block width								\n\
+mov (1|M0)		 r4.14<1>:w	0xF:w					\n\
+// Typed 2D block store to bti[0] surface					\n\
+// Message Descriptor								\n\
+//	0x6400007:								\n\
+//	[30:29]		AddrType: 3 (BTI)					\n\
+//	[28:25]		Mlen: 2							\n\
+//	[24:20]		Rlen: 0							\n\
+//	[19:17]		Caching: 0  (use state settings for both L1 and L3)	\n\
+//	[5:0]		Opcode: 0x07  (store_block2d)				\n\
+send.tgm (16|M0)	null	r4	null	0x0	0x64000007		\n\
+#endif										\n\
+	");
+
+	gpgpu_shader__eot(kernel);
+	return kernel;
+}
+
+void xehp_gpgpu_fillfunc(int i915,
+			 struct intel_buf *buf,
+			 unsigned int x, unsigned int y,
+			 unsigned int width, unsigned int height,
+			 uint8_t color)
 {
 	struct intel_bb *ibb;
+	struct gpgpu_shader *kernel;
 	struct xehp_interface_descriptor_data idd;
 
 	ibb = intel_bb_create(i915, PAGE_SIZE);
@@ -333,8 +348,10 @@ __xehp_gpgpu_fillfunc(int i915,
 
 	intel_bb_ptr_set(ibb, BATCH_STATE_SPLIT);
 
-	xehp_fill_interface_descriptor(ibb, buf,
-				       kernel, kernel_size, &idd);
+	kernel = __xehp_gpgpu_kernel(i915);
+	xehp_fill_interface_descriptor(ibb, buf, kernel->instr,
+				       kernel->size * 4, &idd);
+	gpgpu_shader_destroy(kernel);
 
 	intel_bb_ptr_set(ibb, 0);
 
@@ -388,36 +405,3 @@ void gen12_gpgpu_fillfunc(int i915,
 			      gen12_gpgpu_kernel,
 			      sizeof(gen12_gpgpu_kernel));
 }
-
-void xehp_gpgpu_fillfunc(int i915,
-			 struct intel_buf *buf,
-			 unsigned int x, unsigned int y,
-			 unsigned int width, unsigned int height,
-			 uint8_t color)
-{
-	__xehp_gpgpu_fillfunc(i915, buf, x, y, width, height, color,
-			      xehp_gpgpu_kernel,
-			      sizeof(xehp_gpgpu_kernel));
-}
-
-void xehpc_gpgpu_fillfunc(int i915,
-			  struct intel_buf *buf,
-			  unsigned int x, unsigned int y,
-			  unsigned int width, unsigned int height,
-			  uint8_t color)
-{
-	__xehp_gpgpu_fillfunc(i915, buf, x, y, width, height, color,
-			      xehpc_gpgpu_kernel,
-			      sizeof(xehpc_gpgpu_kernel));
-}
-
-void xe2lpg_gpgpu_fillfunc(int i915,
-			   struct intel_buf *buf,
-			   unsigned int x, unsigned int y,
-			   unsigned int width, unsigned int height,
-			   uint8_t color)
-{
-	__xehp_gpgpu_fillfunc(i915, buf, x, y, width, height, color,
-			      xe2lpg_gpgpu_kernel,
-			      sizeof(xe2lpg_gpgpu_kernel));
-}
diff --git a/lib/gpgpu_fill.h b/lib/gpgpu_fill.h
index c3b47c10a..a483859e5 100644
--- a/lib/gpgpu_fill.h
+++ b/lib/gpgpu_fill.h
@@ -68,17 +68,4 @@ xehp_gpgpu_fillfunc(int i915,
 		    unsigned int width, unsigned int height,
 		    uint8_t color);
 
-void
-xehpc_gpgpu_fillfunc(int i915,
-		     struct intel_buf *dst,
-		     unsigned int x, unsigned int y,
-		     unsigned int width, unsigned int height,
-		     uint8_t color);
-
-void xe2lpg_gpgpu_fillfunc(int i915,
-			   struct intel_buf *buf,
-			   unsigned int x, unsigned int y,
-			   unsigned int width, unsigned int height,
-			   uint8_t color);
-
 #endif /* GPGPU_FILL_H */
diff --git a/lib/i915/shaders/gpgpu/gen12p72_gpgpu_kernel.asm b/lib/i915/shaders/gpgpu/gen12p72_gpgpu_kernel.asm
deleted file mode 100644
index 52699a475..000000000
--- a/lib/i915/shaders/gpgpu/gen12p72_gpgpu_kernel.asm
+++ /dev/null
@@ -1,12 +0,0 @@
-L0:
-         mov (4|M0)               r1.0<1>:ub    r1.0<0;1,0>:ub
-         shl (1|M0)               r2.0<1>:ud    r0.1<0;1,0>:ud    0x4:ud
-         mov (1|M0)               r2.1<1>:ud    r0.6<0;1,0>:ud
-         mov (8|M0)               r4.0<1>:ud    r0.0<8;8,1>:ud
-         mov (2|M0)               r4.0<1>:ud    r2.0<2;2,1>:ud                   {I@2}
-         mov (1|M0)               r4.2<1>:ud    0xF:ud
-         mov (16|M0)              r5.0<1>:ud    r1.0<0;1,0>:ud                   {I@6}
-(W)      sync.nop                             null                             {I@1}
-         send.dc1 (16|M0)         null     r4      null:0    0x0         0x40A8000  {$0} //    wr:2h+0, rd:0, Media Block Write msc:0, to #0
-         send.gtwy (8|M0)         null     r80     null:0    0x0         0x02000000 {EOT}
-L176:
diff --git a/lib/i915/shaders/gpgpu/xe2lpg_gpgpu_kernel.asm b/lib/i915/shaders/gpgpu/xe2lpg_gpgpu_kernel.asm
deleted file mode 100644
index e2ecc71f5..000000000
--- a/lib/i915/shaders/gpgpu/xe2lpg_gpgpu_kernel.asm
+++ /dev/null
@@ -1,13 +0,0 @@
-L0:
-         mov (4|M0)               r1.0<1>:ub    r1.0<0;1,0>:ub                        // Load r1.0-3 with color byte
-         shl (1|M0)               r2.0<1>:ud    r0.1<0;1,0>:ud    0x4:ud              // Load r2.0-3 with tg id X << 4
-         mov (1|M0)               r2.1<1>:ud    r0.6<0;1,0>:ud                        // Load r2.4-7 with tg id Y
-
-         // payload setup
-         mov (16|M0)              r4.0<1>:ud    0x0:ud                                // Zero out register R4
-         mov (2|M0)               r4.5<1>:ud    r2.0<2;2,1>:ud                        // Store X and Y block start (160:191 and 192:223)
-         mov (1|M0)               r4.14<1>:w    0xF:w                                 // Store X and Y block size (224:231 and 232:239)
-         mov (16|M0)              r5.0<1>:ud    r1.0<0;1,0>:ud                        // Load r5-r6 with color byte
-
-         send.tgm (16|M0)         null     r4    null:0    0x0    0x64000007          // Send TypedStore2DBlock to tgm port
-         send.gtwy (8|M0)         null    r80    null:0    0x0    0x02000000 {EOT}
diff --git a/lib/i915/shaders/gpgpu/xehp_gpgpu_kernel.asm b/lib/i915/shaders/gpgpu/xehp_gpgpu_kernel.asm
deleted file mode 100644
index 7adfbd0f0..000000000
--- a/lib/i915/shaders/gpgpu/xehp_gpgpu_kernel.asm
+++ /dev/null
@@ -1,12 +0,0 @@
-L0:
-         mov (4|M0)               r1.0<1>:ub    r1.0<0;1,0>:ub
-         shl (1|M0)               r2.0<1>:ud    r0.1<0;1,0>:ud    0x4:ud
-         mov (1|M0)               r2.1<1>:ud    r0.6<0;1,0>:ud
-         mov (8|M0)               r4.0<1>:ud    r0.0<8;8,1>:ud
-         mov (2|M0)               r4.0<1>:ud    r2.0<2;2,1>:ud                   {I@2}
-         mov (1|M0)               r4.2<1>:ud    0xF:ud
-         mov (16|M0)              r5.0<1>:ud    r1.0<0;1,0>:ud                   {I@6}
-(W)      sync.nop                             null                             {I@1}
-         send.dc1 (16|M0)         null     r4      null    0x0         0x40A8000  {$0} //    wr:2h+0, rd:0, Media Block Write msc:0, to #0
-         send.gtwy (8|M0)         null     r80     null    0x0         0x02000000 {EOT}
-L176:
diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
index 87270bb46..ea8d0f097 100644
--- a/lib/iga64_generated_codes.c
+++ b/lib/iga64_generated_codes.c
@@ -3,7 +3,81 @@
 
 #include "gpgpu_shader.h"
 
-#define MD5_SUM_IGA64_ASMS 96abf1aa2d0cc900ebba8203cefdd30c
+#define MD5_SUM_IGA64_ASMS 9977ade854d57c5af5c5ca9e93c0f37e
+
+struct iga64_template const iga64_code_gpgpu_fill[] = {
+	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
+		0x00080061, 0x01050000, 0x00000104, 0x00000000,
+		0x00000069, 0x02058220, 0x02000014, 0x00000004,
+		0x00000061, 0x02150220, 0x00000064, 0x00000000,
+		0x000c0061, 0x04054220, 0x00000000, 0x00000000,
+		0x00101c61, 0x05050220, 0x00000104, 0x00000000,
+		0x00041b61, 0x04550220, 0x00220205, 0x00000000,
+		0x00000061, 0x04754550, 0x00000000, 0x000f000f,
+		0x00132031, 0x00000000, 0xd00e0494, 0x04000000,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 1270, .size = 52, .code = (const uint32_t []) {
+		0x00020061, 0x01050000, 0x00000104, 0x00000000,
+		0x00000069, 0x02058220, 0x02000024, 0x00000004,
+		0x00000061, 0x02250220, 0x000000c4, 0x00000000,
+		0x00030061, 0x04054220, 0x00000000, 0x00000000,
+		0x00041c61, 0x05050220, 0x00000104, 0x00000000,
+		0x00011b61, 0x04050220, 0x00220205, 0x00000000,
+		0x00000061, 0x04454220, 0x00000000, 0x0000000f,
+		0x00000061, 0x04850220, 0x000000a4, 0x00000000,
+		0x80001901, 0x00010000, 0x00000000, 0x00000000,
+		0x00044031, 0x00000000, 0xc0000414, 0x02a00000,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 1260, .size = 48, .code = (const uint32_t []) {
+		0x00080061, 0x01050000, 0x00000104, 0x00000000,
+		0x00000069, 0x02058220, 0x02000014, 0x00000004,
+		0x00000061, 0x02150220, 0x00000064, 0x00000000,
+		0x000c0061, 0x04054220, 0x00000000, 0x00000000,
+		0x00101c61, 0x05050220, 0x00000104, 0x00000000,
+		0x00041b61, 0x04050220, 0x00220205, 0x00000000,
+		0x00000061, 0x04254220, 0x00000000, 0x0000000f,
+		0x00000061, 0x04450220, 0x00000054, 0x00000000,
+		0x00132031, 0x00000000, 0xc0000414, 0x02a00000,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 1250, .size = 52, .code = (const uint32_t []) {
+		0x00020061, 0x01050000, 0x00000104, 0x00000000,
+		0x00000069, 0x02058220, 0x02000024, 0x00000004,
+		0x00000061, 0x02250220, 0x000000c4, 0x00000000,
+		0x00030061, 0x04054220, 0x00000000, 0x00000000,
+		0x00041c61, 0x05050220, 0x00000104, 0x00000000,
+		0x00011b61, 0x04050220, 0x00220205, 0x00000000,
+		0x00000061, 0x04454220, 0x00000000, 0x0000000f,
+		0x00000061, 0x04850220, 0x000000a4, 0x00000000,
+		0x80001901, 0x00010000, 0x00000000, 0x00000000,
+		0x00044031, 0x00000000, 0xc0000414, 0x02a00000,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 0, .size = 48, .code = (const uint32_t []) {
+		0x00020061, 0x01050000, 0x00000104, 0x00000000,
+		0x00000069, 0x02058220, 0x02000024, 0x00000004,
+		0x00000061, 0x02250220, 0x000000c4, 0x00000000,
+		0x00030061, 0x04054220, 0x00000000, 0x00000000,
+		0x00040461, 0x05050220, 0x00000104, 0x00000000,
+		0x00010361, 0x04050220, 0x00220205, 0x00000000,
+		0x00000061, 0x04454220, 0x00000000, 0x0000000f,
+		0x00000061, 0x04850220, 0x000000a4, 0x00000000,
+		0x00049031, 0x00000000, 0xc0000414, 0x02a00000,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000101, 0x00010000, 0x00000000, 0x00000000,
+	}}
+};
 
 struct iga64_template const iga64_code_media_block_write[] = {
 	{ .gen_ver = 2000, .size = 56, .code = (const uint32_t []) {
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 824e92831..f91091bc4 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -758,13 +758,7 @@ igt_fillfunc_t igt_get_gpgpu_fillfunc(int devid)
 {
 	igt_fillfunc_t fill = NULL;
 
-	if (intel_graphics_ver(devid) >= IP_VER(20, 0))
-		fill = xe2lpg_gpgpu_fillfunc;
-	else if (IS_METEORLAKE(devid))
-		fill = xehp_gpgpu_fillfunc;
-	else if (intel_graphics_ver(devid) >= IP_VER(12, 60))
-		fill = xehpc_gpgpu_fillfunc;
-	else if (intel_graphics_ver(devid) >= IP_VER(12, 50))
+	if (intel_graphics_ver(devid) >= IP_VER(12, 50))
 		fill = xehp_gpgpu_fillfunc;
 	else if (IS_GEN12(devid))
 		fill = gen12_gpgpu_fillfunc;
diff --git a/lib/meson.build b/lib/meson.build
index ab4cf9c7a..4af2bc743 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -217,7 +217,7 @@ lib_version = vcs_tag(input : 'version.h.in', output : 'version.h',
 		      fallback : 'NO-GIT',
 		      command : vcs_command )
 
-iga64_assembly_sources = [ 'gpgpu_shader.c' ]
+iga64_assembly_sources = [ 'gpgpu_shader.c', 'gpgpu_fill.c' ]
 
 lib_intermediates = []
 iga64_assembly_libs = []
-- 
2.34.1

