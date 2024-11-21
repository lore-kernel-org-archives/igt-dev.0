Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19FAD6ED13
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 12:23:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E55C10E403;
	Thu, 21 Nov 2024 12:23:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YJBlhrlI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0599410E403
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 12:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732191824; x=1763727824;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9cdorMxqG59Lgvj+XdKVvLcorEPb//70prtMvp/61UA=;
 b=YJBlhrlIUqugyABvTti9uW+/M9+2osIEP4MNsomEOzDHabrHu39OgNc7
 NtmtH0/77zTPbIyGrP4HdAJXWbDbFfEf3kE/cOVKYLCjvlIDFAiO1EppL
 imB0m6PVA7OqCNku+iv27bHW/dLzkYP5BGRv6Lo0Sx8eH3tTuTLBDTTKN
 /2c0LUoRE0PAqmvQbPbhuLFg2AS3RrdD9uKZM0NvreuVasomMM8VdSwcg
 Fw+qD4K+Vp+vElzTZTHWt707mRBr/wuamXuVTAjqkk8MlxuWzvjSc/uj1
 EHjWPONZN+UihK+lkjZJDzTUXb7/bfxmtdm+TMYMwwd4Jju9OI3Is6Roj g==;
X-CSE-ConnectionGUID: Mgtu1YPvTJaIUG0L7SWaRA==
X-CSE-MsgGUID: QJ/mtpAqQfOR2vHSOTEFbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="43365062"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="43365062"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 04:23:44 -0800
X-CSE-ConnectionGUID: VDII2CY/TKqJjj/0QXAgCg==
X-CSE-MsgGUID: b05Q6MxJTH+lOJ7gT+64+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="91052623"
Received: from carterle-desk.ger.corp.intel.com (HELO rapter.intel.com)
 ([10.245.246.80])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 04:23:41 -0800
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: andrzej.hajda@intel.com, christoph.manszewski@intel.com,
 jonathan.cavitt@intel.com, mika.kuoppala@intel.com,
 dominik.grzegorzek@intel.com
Subject: [PATCH i-g-t v2 2/4] lib/gppgu_shader: Add read D32 from ppgtt
 virtual address
Date: Thu, 21 Nov 2024 14:22:27 +0200
Message-ID: <20241121122230.451423-3-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241121122230.451423-1-gwan-gyeong.mun@intel.com>
References: <20241121122230.451423-1-gwan-gyeong.mun@intel.com>
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

Create a function that adds the capabilty to read an dword size from a
given ppgtt address. Use an Untyped 2D Block Array Load DataPort
functionality of XE2+ with A64 flat addressing to direct accessing an
entire ppgtt address space.

For the read to succeed, the given ppgtt virtual address has to be bound.
Otherwise a load page fault will be triggered.

v2: Fix the function name to be more clear. (Christoph)

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 lib/gpgpu_shader.c          | 94 +++++++++++++++++++++++++++++++++++++
 lib/gpgpu_shader.h          |  1 +
 lib/iga64_generated_codes.c | 21 ++++++++-
 3 files changed, 115 insertions(+), 1 deletion(-)

diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
index d9da35895..147df3a3d 100644
--- a/lib/gpgpu_shader.c
+++ b/lib/gpgpu_shader.c
@@ -897,3 +897,97 @@ void gpgpu_shader__write_a64_dword(struct gpgpu_shader *shdr, uint64_t ppgtt_add
 #endif										\n\
 	", lower_32_bits(addr), upper_32_bits(addr), value);
 }
+
+/**
+ * gpgpu_shader__read_a64_dword:
+ * @shdr: shader to be modified
+ * @ppgtt_addr: read target ppgtt virtual address
+ *
+ * Read one D32 data (DW; DoubleWord) directly from the target ppgtt virtual
+ * address (A64 Flat Address model).
+ *
+ * Note: for the read to succeed, the address specified by @ppgtt_addr has
+ * to be bound. Otherwise a load page fault will be triggered.
+ */
+void gpgpu_shader__read_a64_dword(struct gpgpu_shader *shdr, uint64_t ppgtt_addr)
+{
+	uint64_t addr = CANONICAL(ppgtt_addr);
+
+	igt_assert_f((addr & 0x3) == 0, "address must be aligned to DWord!\n");
+
+	emit_iga64_code(shdr, read_a64_dword, "					\n\
+#if GEN_VER >= 2000								\n\
+// Unyped 2D Block Array Load 							\n\
+// Instruction_Load2DBlockArray							\n\
+// bspec: 63972									\n\
+// src0 address payload (Untyped2DBLOCKAddressPayload) specifies both		\n\
+//	the block parameters and the 2D Surface parameters.			\n\
+// Untyped2DBLOCKAddressPayload							\n\
+// bspec: 63986									\n\
+// [243:240] Array Length: 0 (length is 1)					\n\
+// [239:232] Block Height: 0 (height is 1)					\n\
+// [231:224] Block Width: 0xf (width is 16)					\n\
+// [223:192] Block Start Y: 0							\n\
+// [191:160] Block Start X: 0							\n\
+// [159:128] Untyped 2D Surface Pitch: 0x3f (pitch is 64 bytes)			\n\
+// [127:96] Untyped 2D Surface Height: 0 (height is 1)				\n\
+// [95:64] Untyped 2D Surface Width: 0x3f (width is 64 bytes)			\n\
+// [63:0] Untyped 2D Surface Base Address					\n\
+// initialize register								\n\
+(W)	mov (8)			r30.0<1>:uq	0x0:uq				\n\
+// [0:31] Untyped 2D Surface Base Address low					\n\
+(W)	mov (1)			r30.0<1>:ud	ARG(0):ud			\n\
+// [32:63] Untyped 2D Surface Base Address high					\n\
+(W)	mov (1)			r30.1<1>:ud ARG(1):ud				\n\
+// [95:64] Untyped 2D Surface Width: 0x3f					\n\
+//	   (Width minus 1 (in bytes) of the 2D surface, it represents 64)	\n\
+(W)	mov (1) 		r30.2<1>:ud	0x3f:ud				\n\
+// [127:96] Untyped 2D Surface Height: 0x0					\n\
+//	    (Height minus 1 (in number of data elements) of			\n\
+//	    the Untyped 2D surface, it represents 1)				\n\
+(W)	mov (1) 		r30.3<1>:ud	0x0:ud				\n\
+// [159:128] Untyped 2D Surface Pitch: 0x3f					\n\
+//	     (Pitch minus 1 (in bytes) of the 2D surface, it represents 64)	\n\
+(W)	mov (1)			r30.4<1>:ud	0x3f:ud				\n\
+// [231:224] Block Width: 0xf (15)						\n\
+//	     (Specifies the width minus 1 (in number of data elements) for this	\n\
+//	     rectangular region, it represents 16)				\n\
+// Block width (encoded_value + 1) must be a multiple of DW (4 bytes).		\n\
+// [239:232] Block Height: 0							\n\
+//	     (Specifies the height minus 1 (in number of data elements) for	\n\
+//	     this rectangular region, it represents 1)				\n\
+// [243:240] Array Length: 0							\n\
+//	     (Specifies Array Length minus 1 for Load2DBlockArray messages,	\n\
+//	     must be zero for 2D Block Store messages, it represents 1)		\n\
+(W)	mov (1)			r30.7<1>:ud	0xf:ud				\n\
+//										\n\
+// dest data payload format is selected by Data Size.				\n\
+// Block Height x Block Width x Data size / GRF Register size			\n\
+//	=> 1 x 16 x 32bit / 512bit = 1						\n\
+// data payload format size is 1 GRF Register.					\n\
+//										\n\
+// send.ugm Untyped 2D Block Array Load						\n\
+// Format: send.ugm (1) dst src0 src1 ExtMsg MsgDesc				\n\
+// Execution Mask restriction: SIMT1						\n\
+//										\n\
+// Extended Message Descriptor (Dataport Extended Descriptor Imm 2D Block)	\n\
+// bspec: 67780									\n\
+// 0x0 =>									\n\
+// [32:22] Global Y_offset: 0							\n\
+// [21:12] Global X_offset: 0							\n\
+//										\n\
+// Message Descriptor								\n\
+// bspec: 63972									\n\
+// 0x2128403 =>									\n\
+// [30:29] Address Type: 0 (FLAT)						\n\
+// [28:25] Src0 Length: 1							\n\
+// [24:20] Dest Length: 1							\n\
+// [19:16] Cache : 2 (L1UC_L3UC) 10						\n\
+// [15] Transpose Block: 1							\n\
+// [11:9] Data Size: 2 (D32) 10							\n\
+// [7] VNNI Transform: 0							\n\
+// [5:0] Load Operation: 3 (Load 2D Block) 11					\n\
+(W)	send.ugm (1)		r31	r30	null	0x0	0x2128403	\n\
+#endif										\n\
+	", lower_32_bits(addr), upper_32_bits(addr));
+}
diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
index 18a4c9725..07ed0fe1b 100644
--- a/lib/gpgpu_shader.h
+++ b/lib/gpgpu_shader.h
@@ -87,6 +87,7 @@ void gpgpu_shader__write_on_exception(struct gpgpu_shader *shdr, uint32_t dw, ui
 				      uint32_t y_offset, uint32_t mask, uint32_t value);
 void gpgpu_shader__write_a64_dword(struct gpgpu_shader *shdr, uint64_t ppgtt_addr,
 				   uint32_t value);
+void gpgpu_shader__read_a64_dword(struct gpgpu_shader *shdr, uint64_t ppgtt_addr);
 void gpgpu_shader__label(struct gpgpu_shader *shdr, int label_id);
 void gpgpu_shader__jump(struct gpgpu_shader *shdr, int label_id);
 void gpgpu_shader__jump_neq(struct gpgpu_shader *shdr, int label_id,
diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
index e97bcf042..721ac267f 100644
--- a/lib/iga64_generated_codes.c
+++ b/lib/iga64_generated_codes.c
@@ -3,7 +3,7 @@
 
 #include "gpgpu_shader.h"
 
-#define MD5_SUM_IGA64_ASMS a1ee0173014ab4cda3090faeca1cbae1
+#define MD5_SUM_IGA64_ASMS bdc80eeb9a11b97ff51422a39f4623f5
 
 struct iga64_template const iga64_code_gpgpu_fill[] = {
 	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
@@ -79,6 +79,25 @@ struct iga64_template const iga64_code_gpgpu_fill[] = {
 	}}
 };
 
+struct iga64_template const iga64_code_read_a64_dword[] = {
+	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
+		0x800c0061, 0x1e054330, 0x00000000, 0x00000000,
+		0x80000061, 0x1e054220, 0x00000000, 0xc0ded000,
+		0x80000061, 0x1e154220, 0x00000000, 0xc0ded001,
+		0x80000061, 0x1e254220, 0x00000000, 0x0000003f,
+		0x80000061, 0x1e354220, 0x00000000, 0x00000000,
+		0x80000061, 0x1e454220, 0x00000000, 0x0000003f,
+		0x80000061, 0x1e754220, 0x00000000, 0x0000000f,
+		0x80032031, 0x1f0c0000, 0xf8061e0c, 0x00a00000,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 0, .size = 0, .code = (const uint32_t []) {
+
+	}}
+};
+
 struct iga64_template const iga64_code_write_a64_dword[] = {
 	{ .gen_ver = 2000, .size = 52, .code = (const uint32_t []) {
 		0x800c0061, 0x1e054330, 0x00000000, 0x00000000,
-- 
2.46.1

