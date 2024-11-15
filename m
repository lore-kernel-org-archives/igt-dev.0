Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64529D637CE
	for <igt-dev@archiver.kernel.org>; Fri, 15 Nov 2024 14:12:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D5B910E2CD;
	Fri, 15 Nov 2024 14:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F20UnAy7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F43C10E2CD
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 14:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731679945; x=1763215945;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YRLj7jEXt2qiYCmG+60q3nLba/e6U4sZAvustFpRqes=;
 b=F20UnAy7WQBAvtUWYKjLTeDid45LTxKhZiiCqBcPD9fXz1ZQKABPA1i+
 9KAvbMA6KpetOOTlFX+o/cQDqssc2+oyH+e4oTmu0bBEEqDhykU9j49Rr
 C9a26vjw+OqkMirXudOl1/4fSpPD3CEorz2o5+zBaWqHMJBLQApZB88Wj
 M+ycFjZ9pUo86xW9c3CmeKyPHhP3YGpcz+5UHA+4MDj7J7DSeNlFj9wj5
 4g1SES3VDsFHD8Js29nFrSQZ+cCFTAqlczFqjvc2nbDaerDWu7Y24eCih
 P43xlYOUB14Eh6lCtlDcoL1sTRKqtaiuOGd/tdvJToeqei9AdsQ/bO61d w==;
X-CSE-ConnectionGUID: g7qIwBnSRS6YrSa28+IuTg==
X-CSE-MsgGUID: Lm20m+UZTomqzEyi3exumA==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="31822542"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="31822542"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 06:12:25 -0800
X-CSE-ConnectionGUID: 2BOqL9JgTzez3Q+EiEnPFw==
X-CSE-MsgGUID: dM9XedyEQPONwca0l+tA+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="88979960"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO rapter.intel.com)
 ([10.245.246.40])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 06:12:22 -0800
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, mika.kuoppala@intel.com,
 dominik.grzegorzek@intel.com
Subject: [PATCH i-g-t 1/4] lib/gppgu_shader: Add write to ppgtt offset
Date: Fri, 15 Nov 2024 16:11:29 +0200
Message-ID: <20241115141132.866838-2-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241115141132.866838-1-gwan-gyeong.mun@intel.com>
References: <20241115141132.866838-1-gwan-gyeong.mun@intel.com>
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

Create a function that adds the capacity to fill an oword at a given
ppgtt offset with a dword value.  Xe2 does this with an Untyped 2D Block
Array Store operation, though older platforms used to do this with a
Media Write Block, so both means are supported.

Suggested-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Co-developed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 lib/gpgpu_shader.c          | 109 ++++++++++++++++++++++++++++++++++++
 lib/gpgpu_shader.h          |   2 +
 lib/iga64_generated_codes.c |  81 ++++++++++++++++++++++++++-
 3 files changed, 191 insertions(+), 1 deletion(-)

diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
index 4e1b8d5e9..7a2f0d28d 100644
--- a/lib/gpgpu_shader.c
+++ b/lib/gpgpu_shader.c
@@ -652,6 +652,115 @@ void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
 	", 2, y_offset, 3, value, value, value, value);
 }
 
+/**
+ * gpgpu_shader__write_offset:
+ * @shdr: shader to be modified
+ * @ppgtt_offset: write target virtual address
+ * @value: dword to be written
+ *
+ * Fill oword at @ppgtt with dword stored in @value.
+ *
+ * Note: for the write to succeed, the address specified by @ppgtt_offset has
+ * to be bound. Otherwise a page fault will be triggered.
+ */
+void gpgpu_shader__write_offset(struct gpgpu_shader *shdr, uint64_t ppgtt_offset,
+				uint32_t value)
+{
+	uint64_t offset = CANONICAL(ppgtt_offset);
+	igt_assert_f((offset & 0xf) == 0, "Offset must be aligned to oword!\n");
+
+	emit_iga64_code(shdr, write_offset, "					\n\
+#if GEN_VER < 2000 // Media Block Write						\n\
+(W)	mov (8|M0)		r30.0<1>:ud	0x0:ud				\n\
+	// canonical address							\n\
+(W)	mov (1|M0)		r30.0<1>:ud	ARG(0):ud			\n\
+(W)	mov (1|M0)		r30.1<1>:ud	ARG(1):ud			\n\
+	// written value							\n\
+(W)	mov (1|M0)		r31.0<1>:ud	ARG(2):ud			\n\
+(W)	mov (1|M0)		r31.1<1>:ud	ARG(3):ud			\n\
+(W)	mov (1|M0)		r31.2<1>:ud	ARG(4):ud			\n\
+(W)	mov (1|M0)		r31.3<1>:ud	ARG(5):ud			\n\
+	// owblock write							\n\
+(W)	send.dc1 (16|M0)	null	r30	r31	0x0	0x20d40ff	\n\
+	// owblock read, to block the thread until the write is materialized	\n\
+(W)	send.dc1 (16|M0)	r32	r30	null	0x0	0x21500ff	\n\
+#else // Unyped 2D Block Store							\n\
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
+(W)	mov (1|M0)		r31.1<1>:ud	ARG(3):ud			\n\
+(W)	mov (1|M0)		r31.2<1>:ud	ARG(4):ud			\n\
+(W)	mov (1|M0)		r31.3<1>:ud	ARG(5):ud			\n\
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
+	", offset & 0xffffffff, offset >> 32, value, value, value, value);
+}
+
 /**
  * gpgpu_shader__clear_exception:
  * @shdr: shader to be modified
diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
index c7c21c115..355b128b5 100644
--- a/lib/gpgpu_shader.h
+++ b/lib/gpgpu_shader.h
@@ -83,6 +83,8 @@ void gpgpu_shader__write_aip(struct gpgpu_shader *shdr, uint32_t y_offset);
 void gpgpu_shader__increase_aip(struct gpgpu_shader *shdr, uint32_t value);
 void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
 			       uint32_t y_offset);
+void gpgpu_shader__write_offset(struct gpgpu_shader *shdr, uint64_t ppgtt_offset,
+				uint32_t value);
 void gpgpu_shader__write_on_exception(struct gpgpu_shader *shdr, uint32_t dw, uint32_t x_offset,
 				      uint32_t y_offset, uint32_t mask, uint32_t value);
 void gpgpu_shader__label(struct gpgpu_shader *shdr, int label_id);
diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
index 6638be07b..b23613ac4 100644
--- a/lib/iga64_generated_codes.c
+++ b/lib/iga64_generated_codes.c
@@ -3,7 +3,7 @@
 
 #include "gpgpu_shader.h"
 
-#define MD5_SUM_IGA64_ASMS ec9d477415eebb7d6983395f1bcde78f
+#define MD5_SUM_IGA64_ASMS 4fcde43dedb9d3212f1d85b5b180b0c1
 
 struct iga64_template const iga64_code_gpgpu_fill[] = {
 	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
@@ -323,6 +323,85 @@ struct iga64_template const iga64_code_clear_exception[] = {
 	}}
 };
 
+struct iga64_template const iga64_code_write_offset[] = {
+	{ .gen_ver = 2000, .size = 64, .code = (const uint32_t []) {
+		0x800c0061, 0x1e054330, 0x00000000, 0x00000000,
+		0x80000061, 0x1e054220, 0x00000000, 0xc0ded000,
+		0x80000061, 0x1e154220, 0x00000000, 0xc0ded001,
+		0x80000061, 0x1e254220, 0x00000000, 0x0000003f,
+		0x80000061, 0x1e354220, 0x00000000, 0x00000000,
+		0x80000061, 0x1e454220, 0x00000000, 0x0000003f,
+		0x80000061, 0x1e754220, 0x00000000, 0x0000000f,
+		0x800c0061, 0x1f054330, 0x00000000, 0x00000000,
+		0x80000061, 0x1f054220, 0x00000000, 0xc0ded002,
+		0x80000061, 0x1f154220, 0x00000000, 0xc0ded003,
+		0x80000061, 0x1f254220, 0x00000000, 0xc0ded004,
+		0x80000061, 0x1f354220, 0x00000000, 0xc0ded005,
+		0x80032031, 0x00000000, 0xf80e1e0c, 0x00801f0c,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 1270, .size = 52, .code = (const uint32_t []) {
+		0x80030061, 0x1e054220, 0x00000000, 0x00000000,
+		0x80000061, 0x1e054220, 0x00000000, 0xc0ded000,
+		0x80000061, 0x1e254220, 0x00000000, 0xc0ded001,
+		0x80000061, 0x1f054220, 0x00000000, 0xc0ded002,
+		0x80000061, 0x1f254220, 0x00000000, 0xc0ded003,
+		0x80000061, 0x1f454220, 0x00000000, 0xc0ded004,
+		0x80000061, 0x1f654220, 0x00000000, 0xc0ded005,
+		0x80001d01, 0x00010000, 0x00000000, 0x00000000,
+		0x80044031, 0x00000000, 0xc1fe1e0c, 0x03501f04,
+		0x80044131, 0x200c0000, 0xc1fe1e0c, 0x01400000,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 1260, .size = 48, .code = (const uint32_t []) {
+		0x800c0061, 0x1e054220, 0x00000000, 0x00000000,
+		0x80000061, 0x1e054220, 0x00000000, 0xc0ded000,
+		0x80000061, 0x1e154220, 0x00000000, 0xc0ded001,
+		0x80000061, 0x1f054220, 0x00000000, 0xc0ded002,
+		0x80000061, 0x1f154220, 0x00000000, 0xc0ded003,
+		0x80000061, 0x1f254220, 0x00000000, 0xc0ded004,
+		0x80000061, 0x1f354220, 0x00000000, 0xc0ded005,
+		0x8013a031, 0x00000000, 0xc1fe1e0c, 0x03501f04,
+		0x8010c131, 0x200c0000, 0xc1fe1e0c, 0x01400000,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 1250, .size = 52, .code = (const uint32_t []) {
+		0x80030061, 0x1e054220, 0x00000000, 0x00000000,
+		0x80000061, 0x1e054220, 0x00000000, 0xc0ded000,
+		0x80000061, 0x1e254220, 0x00000000, 0xc0ded001,
+		0x80000061, 0x1f054220, 0x00000000, 0xc0ded002,
+		0x80000061, 0x1f254220, 0x00000000, 0xc0ded003,
+		0x80000061, 0x1f454220, 0x00000000, 0xc0ded004,
+		0x80000061, 0x1f654220, 0x00000000, 0xc0ded005,
+		0x80001d01, 0x00010000, 0x00000000, 0x00000000,
+		0x80044031, 0x00000000, 0xc1fe1e0c, 0x03501f04,
+		0x80044131, 0x200c0000, 0xc1fe1e0c, 0x01400000,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 0, .size = 48, .code = (const uint32_t []) {
+		0x80030061, 0x1e054220, 0x00000000, 0x00000000,
+		0x80000061, 0x1e054220, 0x00000000, 0xc0ded000,
+		0x80000061, 0x1e254220, 0x00000000, 0xc0ded001,
+		0x80000061, 0x1f054220, 0x00000000, 0xc0ded002,
+		0x80000061, 0x1f254220, 0x00000000, 0xc0ded003,
+		0x80000061, 0x1f454220, 0x00000000, 0xc0ded004,
+		0x80000061, 0x1f654220, 0x00000000, 0xc0ded005,
+		0x8004d031, 0x00000000, 0xc1fe1e0c, 0x03501f04,
+		0x80044131, 0x200c0000, 0xc1fe1e0c, 0x01400000,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000101, 0x00010000, 0x00000000, 0x00000000,
+	}}
+};
+
 struct iga64_template const iga64_code_media_block_write[] = {
 	{ .gen_ver = 2000, .size = 56, .code = (const uint32_t []) {
 		0x80100061, 0x04054220, 0x00000000, 0x00000000,
-- 
2.46.1

