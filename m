Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9B4D6ED18
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 12:23:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4059510E2FD;
	Thu, 21 Nov 2024 12:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m55WgKjg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EAC610E2FD
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 12:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732191821; x=1763727821;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E/bXb2Vko5PAXbgd9m1g1aD6dZ32fLqboQgOrtiDGBM=;
 b=m55WgKjg/kH7XXa2TPYQ0ceeNzZ6KKThNZRbeW01H8PuB5lss6CvMpJh
 Er23N6K8+No1rHQ+jOSFRmr0vOE/wPuL7FZ1l7SXkXbotK3wPjGK7lGTo
 zYn6MlKE+DJveKrKKPL94xiEPhHNZL2s2lEye2kpUP9Z+WrF5j5kCjjCH
 Ta4lyjLLfYdHTNxgXw4SkMZoS17Gxr7Cc38sAgNsv5L4LY6NkjeW8X0+e
 7irGqbyq2NnbAtMjQWJOJN9SFFdk+g3X6FIwJDYTDPIWuVDStEspXpU/W
 Atfmz8Ja6s2QrFr2IsfkEJXHtScecZlATl79QbKZRSeoVxrcwokoLGqQJ w==;
X-CSE-ConnectionGUID: M6PuXNgtRbWI04oXMWZIXQ==
X-CSE-MsgGUID: N+hfJq2pSD+KD7HvnLnQ4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="43365051"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="43365051"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 04:23:41 -0800
X-CSE-ConnectionGUID: xzY1FQX6TQKlNqbKewjWvA==
X-CSE-MsgGUID: 18n0w/RqRYetzmHzWu1cjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="91052616"
Received: from carterle-desk.ger.corp.intel.com (HELO rapter.intel.com)
 ([10.245.246.80])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 04:23:39 -0800
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: andrzej.hajda@intel.com, christoph.manszewski@intel.com,
 jonathan.cavitt@intel.com, mika.kuoppala@intel.com,
 dominik.grzegorzek@intel.com
Subject: [PATCH i-g-t v2 1/4] lib/gppgu_shader: Add write D32 to ppgtt virtual
 address
Date: Thu, 21 Nov 2024 14:22:26 +0200
Message-ID: <20241121122230.451423-2-gwan-gyeong.mun@intel.com>
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

Suggested-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Co-developed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 lib/gpgpu_shader.c          | 94 +++++++++++++++++++++++++++++++++++++
 lib/gpgpu_shader.h          |  2 +
 lib/iga64_generated_codes.c | 23 ++++++++-
 3 files changed, 118 insertions(+), 1 deletion(-)

diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
index 4e1b8d5e9..d9da35895 100644
--- a/lib/gpgpu_shader.c
+++ b/lib/gpgpu_shader.c
@@ -803,3 +803,97 @@ void gpgpu_shader__end_system_routine_step_if_eq(struct gpgpu_shader *shdr,
 	", 0x807fffff, /* leave breakpoint exception */
 	y_offset, value, 0x7fffff /* clear all exceptions */ );
 }
+
+/**
+ * gpgpu_shader__write_a64_dword:
+ * @shdr: shader to be modified
+ * @ppgtt_addr: write target ppgtt virtual address
+ * @value: dword to be written
+ *
+ * Write one D32 data (DW; DoubleWord) directly to the target ppgtt virtual
+ * address (A64 Flat Address model).
+ *
+ * Note: for the write to succeed, the address specified by @ppgtt_addr has
+ * to be bound. Otherwise a store page fault will be triggered.
+ */
+void gpgpu_shader__write_a64_dword(struct gpgpu_shader *shdr, uint64_t ppgtt_addr,
+				   uint32_t value)
+{
+	uint64_t addr = CANONICAL(ppgtt_addr);
+	igt_assert_f((addr & 0x3) == 0, "address must be aligned to DWord!\n");
+
+	emit_iga64_code(shdr, write_a64_dword, "				\n\
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
index c7c21c115..18a4c9725 100644
--- a/lib/gpgpu_shader.h
+++ b/lib/gpgpu_shader.h
@@ -85,6 +85,8 @@ void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
 			       uint32_t y_offset);
 void gpgpu_shader__write_on_exception(struct gpgpu_shader *shdr, uint32_t dw, uint32_t x_offset,
 				      uint32_t y_offset, uint32_t mask, uint32_t value);
+void gpgpu_shader__write_a64_dword(struct gpgpu_shader *shdr, uint64_t ppgtt_addr,
+				   uint32_t value);
 void gpgpu_shader__label(struct gpgpu_shader *shdr, int label_id);
 void gpgpu_shader__jump(struct gpgpu_shader *shdr, int label_id);
 void gpgpu_shader__jump_neq(struct gpgpu_shader *shdr, int label_id,
diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
index 6638be07b..e97bcf042 100644
--- a/lib/iga64_generated_codes.c
+++ b/lib/iga64_generated_codes.c
@@ -3,7 +3,7 @@
 
 #include "gpgpu_shader.h"
 
-#define MD5_SUM_IGA64_ASMS ec9d477415eebb7d6983395f1bcde78f
+#define MD5_SUM_IGA64_ASMS a1ee0173014ab4cda3090faeca1cbae1
 
 struct iga64_template const iga64_code_gpgpu_fill[] = {
 	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
@@ -79,6 +79,27 @@ struct iga64_template const iga64_code_gpgpu_fill[] = {
 	}}
 };
 
+struct iga64_template const iga64_code_write_a64_dword[] = {
+	{ .gen_ver = 2000, .size = 52, .code = (const uint32_t []) {
+		0x800c0061, 0x1e054330, 0x00000000, 0x00000000,
+		0x80000061, 0x1e054220, 0x00000000, 0xc0ded000,
+		0x80000061, 0x1e154220, 0x00000000, 0xc0ded001,
+		0x80000061, 0x1e254220, 0x00000000, 0x0000003f,
+		0x80000061, 0x1e354220, 0x00000000, 0x00000000,
+		0x80000061, 0x1e454220, 0x00000000, 0x0000003f,
+		0x80000061, 0x1e754220, 0x00000000, 0x0000000f,
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

