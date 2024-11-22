Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2B1D75E58
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 14:35:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3911910EBB5;
	Fri, 22 Nov 2024 14:35:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dFgMEC3n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CECA310EBB5
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 14:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732286103; x=1763822103;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TeCMtGtdtHfoPor/l60VmXEgH32Cs2FVoZKVbaCKN9s=;
 b=dFgMEC3neceTkYw7lfZQn3y8C6v1YUwxyyFx2Dg40Mv/y8r17tK/qwGF
 10BTgHiJX2OM8MasBwNW8vSLn6D/ctQ6+RsfRAUhURdNznxRm8cuUWQK7
 RN9mPIqjGgmClzf/JqrUcTf7mOX6oJ2pJXEhuDjTnJf+vK/gWWfDGVQuI
 MEMQ6KJi8nrTZXd8KBxfRqBdmbPBVlBUVYPyNJcGB+xYIFEt0/EcWwcIE
 9cUgTwtGP09Pu3MLCKR4y5B5ANTt7YrlCxPueEa+B0m9dgHHPrWJNXsbW
 HiAl13hUd3cM1FmWJ3zkgct4j/Tl2oGNqfgAUxZsOXNrYsl2q0M4Cc52q w==;
X-CSE-ConnectionGUID: 9NtPKtcmSnSW4oacZ4eFgg==
X-CSE-MsgGUID: npe6tN4zS5KX7xvMpY4yrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="57845199"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="57845199"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 06:35:03 -0800
X-CSE-ConnectionGUID: KVUtVExNQA2mr0c2zWt2iQ==
X-CSE-MsgGUID: dhfNkXDJTnG/+/Y+w39UCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="91383967"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO rapter.intel.com)
 ([10.245.246.141])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 06:35:02 -0800
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: andrzej.hajda@intel.com, christoph.manszewski@intel.com,
 jonathan.cavitt@intel.com, mika.kuoppala@intel.com,
 dominik.grzegorzek@intel.com
Subject: [PATCH i-g-t v3 1/4] lib/gppgu_shader: Add write D32 to ppgtt virtual
 address
Date: Fri, 22 Nov 2024 16:34:43 +0200
Message-ID: <20241122143446.659440-2-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241122143446.659440-1-gwan-gyeong.mun@intel.com>
References: <20241122143446.659440-1-gwan-gyeong.mun@intel.com>
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

From: Jonathan Cavitt <jonathan.cavitt@intel.com>

Create a function that adds the capabilty to write an dword size at a given
ppgtt address with a dword value. Use an Untyped 2D Block Array Store
DataPort functionality of XE2+ with A64 flat addressing to direct accessing
an entire ppgtt address space.

For the write to succeed, the given ppgtt virtual address has to be bound.
Otherwise a store page fault will be triggered.

v2: Fix the function name to be more clear. (Andrzej)
    Use lower_32_bits() / upper_32_bits() macro (Andrzej)
    Drop unused code
v3: Make block write to 1 word (d32) from 4 words(d32 x 4) (Andrzej)
    Update the function name (Andrzej)
      gpgpu_shader__write_a64_dword() to gpgpu_shader__write_a64_d32()
    Drop not needed code (Andrzej)

Suggested-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Co-developed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/gpgpu_shader.c          | 90 +++++++++++++++++++++++++++++++++++++
 lib/gpgpu_shader.h          |  2 +
 lib/iga64_generated_codes.c | 22 ++++++++-
 3 files changed, 113 insertions(+), 1 deletion(-)

diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
index 4e1b8d5e9..973b5ec4c 100644
--- a/lib/gpgpu_shader.c
+++ b/lib/gpgpu_shader.c
@@ -803,3 +803,93 @@ void gpgpu_shader__end_system_routine_step_if_eq(struct gpgpu_shader *shdr,
 	", 0x807fffff, /* leave breakpoint exception */
 	y_offset, value, 0x7fffff /* clear all exceptions */ );
 }
+
+/**
+ * gpgpu_shader__write_a64_d32:
+ * @shdr: shader to be modified
+ * @ppgtt_addr: write target ppgtt virtual address
+ * @value: D32 data (DW; DoubleWord) to be written
+ *
+ * Write one D32 data (DW; DoubleWord) directly to the target ppgtt virtual
+ * address (A64 Flat Address model).
+ *
+ * Note: for the write to succeed, the address specified by @ppgtt_addr has
+ * to be bound. Otherwise a store page fault will be triggered.
+ */
+void gpgpu_shader__write_a64_d32(struct gpgpu_shader *shdr, uint64_t ppgtt_addr,
+				 uint32_t value)
+{
+	uint64_t addr = CANONICAL(ppgtt_addr);
+	igt_assert_f((addr & 0x3) == 0, "address must be aligned to DWord!\n");
+
+	emit_iga64_code(shdr, write_a64_d32, "					\n\
+#if GEN_VER >= 2000								\n\
+// Unyped 2D Block Store							\n\
+// Instruction_Store2DBlock							\n\
+// bspec: 63981									\n\
+// src0 address payload (Untyped2DBLOCKAddressPayload) specifies both		\n\
+//	the block parameters and the 2D Surface parameters.			\n\
+// src1 data payload format is selected by Data Size.				\n\
+// Untyped2DBLOCKAddressPayload							\n\
+// bspec: 63986									\n\
+// [243:240] Array Length: 0 (length is 1)					\n\
+// [239:232] Block Height: 0 (height is 1)					\n\
+// [231:224] Block Width: 0x3 (width is 4 bytes)				\n\
+// [223:192] Block Start Y: 0							\n\
+// [191:160] Block Start X: 0							\n\
+// [159:128] Untyped 2D Surface Pitch: 0x3f (pitch is 64 bytes)			\n\
+// [127:96] Untyped 2D Surface Height: 0 (height is 1)				\n\
+// [95:64] Untyped 2D Surface Width: 0x3f (width is 64 bytes)			\n\
+// [63:0] Untyped 2D Surface Base Address					\n\
+// initialize register								\n\
+(W)	mov (8)			r30.0<1>:uq	0x0:uq				\n\
+// [31:0] Untyped 2D Surface Base Address low					\n\
+(W)	mov (1)			r30.0<1>:ud	ARG(0):ud			\n\
+// [63:32] Untyped 2D Surface Base Address high					\n\
+(W)	mov (1)			r30.1<1>:ud ARG(1):ud				\n\
+// [95:64] Untyped 2D Surface Width: 0x3f					\n\
+//	   (Width minus 1 (in bytes) of the 2D surface, it represents 64)	\n\
+(W)	mov (1) 		r30.2<1>:ud	0x3f:ud				\n\
+// [159:128] Untyped 2D Surface Pitch: 0x3f					\n\
+//	     (Pitch minus 1 (in bytes) of the 2D surface, it represents 64)	\n\
+(W)	mov (1)			r30.4<1>:ud	0x3f:ud				\n\
+// [231:224] Block Width: 0x3 (4 bytes)						\n\
+//	     (Specifies the width minus 1 (in number of data elements) for this	\n\
+//	     rectangular region, it represents 4)				\n\
+// Block width (encoded_value + 1) must be a multiple of DW (4 bytes).		\n\
+// [239:232] Block Height: 0							\n\
+//	     (Specifies the height minus 1 (in number of data elements) for	\n\
+//	     this rectangular region, it represents 1)				\n\
+// [243:240] Array Length: 0							\n\
+//	     (Specifies Array Length minus 1 for Load2DBlockArray messages,	\n\
+//	     must be zero for 2D Block Store messages, it represents 1)		\n\
+(W)	mov (1)			r30.7<1>:ud	0x3:ud				\n\
+// src1 data payload size							\n\
+// Block Height x Block Width x Data size / GRF Register size			\n\
+//	=> 1 x 16 x 32bit / 512bit = 1						\n\
+// data payload size is 1							\n\
+(W)	mov (8)			r31.0<1>:uq	0x0:uq				\n\
+(W)	mov (1|M0)		r31.0<1>:ud 	ARG(2):ud			\n\
+// send.ugm Untyped 2D Block Array Store					\n\
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
+// bspec: 63981									\n\
+// 0x2020407 =>									\n\
+// [30:29] Address Type: 0 (FLAT)						\n\
+// [28:25] Src0 Length: 1							\n\
+// [24:20] Dest Length: 0							\n\
+// [19:16] Cache : 2 (L1UC_L3UC)						\n\
+// [11:9] Data Size: 2 (D32)							\n\
+// [5:0] Store Operation: 7							\n\
+(W)	send.ugm (1)		null	r30	r31:1	0x0	0x2020407	\n\
+#endif										\n\
+	", lower_32_bits(addr), upper_32_bits(addr), value);
+}
diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
index c7c21c115..e5eefa0a1 100644
--- a/lib/gpgpu_shader.h
+++ b/lib/gpgpu_shader.h
@@ -85,6 +85,8 @@ void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
 			       uint32_t y_offset);
 void gpgpu_shader__write_on_exception(struct gpgpu_shader *shdr, uint32_t dw, uint32_t x_offset,
 				      uint32_t y_offset, uint32_t mask, uint32_t value);
+void gpgpu_shader__write_a64_d32(struct gpgpu_shader *shdr, uint64_t ppgtt_addr,
+				 uint32_t value);
 void gpgpu_shader__label(struct gpgpu_shader *shdr, int label_id);
 void gpgpu_shader__jump(struct gpgpu_shader *shdr, int label_id);
 void gpgpu_shader__jump_neq(struct gpgpu_shader *shdr, int label_id,
diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
index 6638be07b..e778a4617 100644
--- a/lib/iga64_generated_codes.c
+++ b/lib/iga64_generated_codes.c
@@ -3,7 +3,7 @@
 
 #include "gpgpu_shader.h"
 
-#define MD5_SUM_IGA64_ASMS ec9d477415eebb7d6983395f1bcde78f
+#define MD5_SUM_IGA64_ASMS e9da0ec3ffba2cd02079f91c38b24e8b
 
 struct iga64_template const iga64_code_gpgpu_fill[] = {
 	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
@@ -79,6 +79,26 @@ struct iga64_template const iga64_code_gpgpu_fill[] = {
 	}}
 };
 
+struct iga64_template const iga64_code_write_a64_d32[] = {
+	{ .gen_ver = 2000, .size = 48, .code = (const uint32_t []) {
+		0x800c0061, 0x1e054330, 0x00000000, 0x00000000,
+		0x80000061, 0x1e054220, 0x00000000, 0xc0ded000,
+		0x80000061, 0x1e154220, 0x00000000, 0xc0ded001,
+		0x80000061, 0x1e254220, 0x00000000, 0x0000003f,
+		0x80000061, 0x1e454220, 0x00000000, 0x0000003f,
+		0x80000061, 0x1e754220, 0x00000000, 0x00000003,
+		0x800c0061, 0x1f054330, 0x00000000, 0x00000000,
+		0x80000061, 0x1f054220, 0x00000000, 0xc0ded002,
+		0x80032031, 0x00000000, 0xf80e1e0c, 0x00801f0c,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 0, .size = 0, .code = (const uint32_t []) {
+
+	}}
+};
+
 struct iga64_template const iga64_code_end_system_routine_step_if_eq[] = {
 	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
 		0x80000966, 0x80018220, 0x02008000, 0x00008000,
-- 
2.46.1

