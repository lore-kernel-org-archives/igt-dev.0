Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5237D3B7E1
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 07:32:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74FB210E38A;
	Mon, 25 Nov 2024 07:32:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PohVcnw9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6865B10E38A
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 07:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732519931; x=1764055931;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=JLEjRgZWssee7nrQKBCO5qpXc3vcfXU+Pa7dyMdCjpk=;
 b=PohVcnw9q/u839qmBUIEminFepzg6HprY//dZKx5xJtVcIy/fwNUDXmQ
 7hFBKF+sKTZjLImhNV8ocqTPuhMGVjH8WPSADHLayQ9v67AfiBprFo4fE
 7iTmHo89sncNZKtp9PJKPzH6CsjfPtp6H+cTmHU4ztlB9w4lspks5TICT
 Ab9M0pnixUSA5IdcAuBsB9qOI4s5LfMEUUc2nIT5cXtjuQBD8j2lnq3RX
 M9sSYX74uwIRITJhxctHz9nw3hPO1fSHmbJvk/L33WH5Aeg4z8RTr60kP
 lmbfCJk8MW+ua4V4jiuo6065v7Bdzqg0BjO7CmRVZxvNjnB3RwtaNXdvG A==;
X-CSE-ConnectionGUID: ABALGHDPQViIhLhPzspYxA==
X-CSE-MsgGUID: HBrXgWLUQtiEizh1EpG7Jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="31972849"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="31972849"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2024 23:32:11 -0800
X-CSE-ConnectionGUID: EfzlMs2OSXOXkd1cf0tOHQ==
X-CSE-MsgGUID: rkEEVToSSY65MQ7d3gTQaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="91595705"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.102.138.202])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2024 23:32:10 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Mon, 25 Nov 2024 08:31:51 +0100
Subject: [PATCH v4 2/4] lib/gpgpu_shader: simplify load/store shaders
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241125-gpgpu_send_rework-v4-2-c16b568a1f3d@intel.com>
References: <20241125-gpgpu_send_rework-v4-0-c16b568a1f3d@intel.com>
In-Reply-To: <20241125-gpgpu_send_rework-v4-0-c16b568a1f3d@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=45317;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=JLEjRgZWssee7nrQKBCO5qpXc3vcfXU+Pa7dyMdCjpk=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBnRCf08zmLOKFKcXvoiqo2h1Eta+QxzhxaBjWiGaTg
 PtTTlh+JAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZ0Qn9AAKCRAjYrKT3hD915b2C/
 97hnAeKKkp+BP0paut8XSYePcTPFVB5kUiRo5hpglLxMOBPPIZGZaJzMzteBQ2QxNfixghKyj960+P
 4U7xORwN8MRyz+dTKsgn8U9RTAaejuNDOZHoAlExduiJRWhN3R2SuF0SiVhQN2eOPklimkDoDFeymF
 zJECif5Fl+bq6ryy4r/PhTRxnaZK+v3FlJjdW7Ud+PBin9OTy+nE1C/P+DA9ruwHdTe5f0aYd13xMU
 iKcAmLc2PW1ZurTu54aN82zmvMfg84A8lS/PlfYlsWl9E6nZH1CBxL/UgCNybkVgbsb3KKkOYOFigD
 rdeFMwS8AXzUMK5xWiWhmcUufmv1XfbSKWr7TctCOkuca+7LHk6bIHbWmHZLy56Mt0EUf4QVNHdh9+
 fvQBsOpw+REtTB4lotvyHrODFhTc9qgxL7i6R9TyoZLsJxTXwpOorX8ytMEcpD8WJ7Mjj/29t56LL6
 OY4WmCJDLLsJaX3QlD2vkKYBwqSFAr2NWQ/2nwLitdfUM=
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

There is lot of redundancy in shaders code regarding load/store messages.
It makes the code barely readable. Simplify it by using macros in iga64
assembler.
Every load/store operation is split into two phases:
1. Load address/descriptor (from) where data should be stored/loaded.
2. Issue load/store instruction.
Shader threads needs two types of memory access:
3. Private area per thread.
4. Area shared per all threads.
Different platforms access surface in different ways:
5. Using media block messages.
6. Using untyped 2d block messages.
7. Future platforms will use different messages.

All this is simplified to two macros per message in shader:
	SET_(SHARED|THREAD)_SPACE_ADDR(dst,y,width)
	(LOAD_STORE)_SPACE_DW(dst, src)

v2:
  - captialze introduced macros (Dominik)
  - fixed thread -> shared call (Zbigniew)

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 lib/gpgpu_shader.c          | 160 +++-------------------
 lib/iga64_generated_codes.c | 318 +++++++++++++++++++++-----------------------
 lib/iga64_macros.h          |  43 ++++++
 3 files changed, 215 insertions(+), 306 deletions(-)

diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
index 4e1b8d5e9009..363435e7efd3 100644
--- a/lib/gpgpu_shader.c
+++ b/lib/gpgpu_shader.c
@@ -431,22 +431,8 @@ void gpgpu_shader__jump_neq(struct gpgpu_shader *shdr, int label_id,
 
 	size = emit_iga64_code(shdr, jump_dw_neq, "					\n\
 L0:											\n\
-(W)		mov (16|M0)              r30.0<1>:ud    0x0:ud				\n\
-#if GEN_VER < 2000 // Media Block Write							\n\
-	// Y offset of the block in rows := thread group id Y				\n\
-(W)		mov (1|M0)               r30.1<1>:ud    ARG(0):ud			\n\
-	// block width [0,63] representing 1 to 64 bytes, we want dword			\n\
-(W)		mov (1|M0)               r30.2<1>:ud    0x3:ud				\n\
-	// FFTID := FFTID from R0 header						\n\
-(W)		mov (1|M0)               r30.4<1>:ud    r0.5<0;1,0>:ud  		\n\
-(W)		send.dc1 (16|M0)         r31     r30      null    0x0	0x2190000	\n\
-#else // Typed 2D Block Store								\n\
-	// Store X and Y block start (160:191 and 192:223)				\n\
-(W)            mov (1|M0)               r30.6<1>:ud    ARG(0):ud			\n\
-	// Store X and Y block size (224:231 and 232:239)				\n\
-(W)            mov (1|M0)               r30.7<1>:ud    0x3:ud				\n\
-(W)            send.tgm (16|M0)         r31     r30    null:0    0x0    0x62100003	\n\
-#endif											\n\
+		SET_SHARED_SPACE_ADDR(r30, ARG(0):ud, 4)				\n\
+(W)		LOAD_SPACE_DW(r31, r30)							\n\
 	// clear the flag register							\n\
 (W)		mov (1|M0)               f0.0<1>:ud    0x0:ud				\n\
 (W)		cmp (1|M0)    (ne)f0.0   null<1>:ud     r31.0<0;1,0>:ud   ARG(1):ud	\n\
@@ -511,28 +497,13 @@ void gpgpu_shader__common_target_write(struct gpgpu_shader *shdr,
 				       uint32_t y_offset, const uint32_t value[4])
 {
 	emit_iga64_code(shdr, common_target_write, "				\n\
-(W)	mov (16|M0)		r30.0<1>:ud	0x0:ud				\n\
 (W)	mov (16|M0)		r31.0<1>:ud	0x0:ud				\n\
 (W)	mov (1|M0)		r31.0<1>:ud	ARG(1):ud			\n\
 (W)	mov (1|M0)		r31.1<1>:ud	ARG(2):ud			\n\
 (W)	mov (1|M0)		r31.2<1>:ud	ARG(3):ud			\n\
 (W)	mov (1|M0)		r31.3<1>:ud	ARG(4):ud			\n\
-#if GEN_VER < 2000 // Media Block Write						\n\
-	// Y offset of the block in rows					\n\
-(W)	mov (1|M0)		r30.1<1>:ud	ARG(0):ud			\n\
-	// block width [0,63] representing 1 to 64 bytes			\n\
-(W)	mov (1|M0)		r30.2<1>:ud	0xf:ud				\n\
-	// FFTID := FFTID from R0 header					\n\
-(W)	mov (1|M0)		r30.4<1>:ud	r0.5<0;1,0>:ud			\n\
-	// written value							\n\
-(W)	send.dc1 (16|M0)	null	r30	src1_null  0x0	0x40A8000	\n\
-#else	// Typed 2D Block Store							\n\
-	// Store X and Y block start (160:191 and 192:223)			\n\
-(W)	mov (1|M0)              r30.6<1>:ud     ARG(0):ud			\n\
-	// Store X and Y block size (224:231 and 232:239)			\n\
-(W)	mov (1|M0)              r30.7<1>:ud     0xf:ud				\n\
-(W)	send.tgm (16|M0)        null    r30     null:0  0x0     0x64000007	\n\
-#endif										\n\
+	SET_SHARED_SPACE_ADDR(r30, ARG(0):ud, 16)				\n\
+(W)	STORE_SPACE_DW(r30, r31)						\n\
 	", y_offset, value[0], value[1], value[2], value[3]);
 }
 
@@ -565,31 +536,8 @@ void gpgpu_shader__write_aip(struct gpgpu_shader *shdr, uint32_t y_offset)
 	emit_iga64_code(shdr, media_block_write_aip, "				\n\
 	// Payload								\n\
 (W)	mov (1|M0)               r5.0<1>:ud    cr0.2:ud				\n\
-#if GEN_VER < 2000 // Media Block Write						\n\
-	// X offset of the block in bytes := (thread group id X << ARG(0))	\n\
-(W)	shl (1|M0)               r4.0<1>:ud    r0.1<0;1,0>:ud    0x2:ud		\n\
-	// Y offset of the block in rows := thread group id Y			\n\
-(W)	mov (1|M0)               r4.1<1>:ud    r0.6<0;1,0>:ud			\n\
-(W)	add (1|M0)               r4.1<1>:ud    r4.1<0;1,0>:ud    ARG(0):ud	\n\
-	// block width [0,63] representing 1 to 64 bytes			\n\
-(W)	mov (1|M0)               r4.2<1>:ud    0x3:ud				\n\
-	// FFTID := FFTID from R0 header					\n\
-(W)	mov (1|M0)               r4.4<1>:ud    r0.5<0;1,0>:ud			\n\
-(W)	send.dc1 (16|M0)         null     r4   src1_null 0       0x40A8000	\n\
-#else // Typed 2D Block Store							\n\
-	// Load r2.0-3 with tg id X << ARG(0)					\n\
-(W)	shl (1|M0)               r2.0<1>:ud    r0.1<0;1,0>:ud    0x2:ud		\n\
-	// Load r2.4-7 with tg id Y + ARG(1):ud					\n\
-(W)	mov (1|M0)               r2.1<1>:ud    r0.6<0;1,0>:ud			\n\
-(W)	add (1|M0)               r2.1<1>:ud    r2.1<0;1,0>:ud    ARG(0):ud	\n\
-	// payload setup							\n\
-(W)	mov (16|M0)              r4.0<1>:ud    0x0:ud				\n\
-	// Store X and Y block start (160:191 and 192:223)			\n\
-(W)	mov (2|M0)               r4.5<1>:ud    r2.0<2;2,1>:ud			\n\
-	// Store X and Y block max_size (224:231 and 232:239)			\n\
-(W)	mov (1|M0)               r4.7<1>:ud    0x3:ud				\n\
-(W)	send.tgm (16|M0)         null     r4   null:0    0    0x64000007	\n\
-#endif										\n\
+	SET_THREAD_SPACE_ADDR(r4, 0, ARG(0):ud, 4)				\n\
+(W)	STORE_SPACE_DW(r4, r5)							\n\
 	", y_offset);
 }
 
@@ -618,38 +566,11 @@ void gpgpu_shader__increase_aip(struct gpgpu_shader *shdr, uint32_t value)
 void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
 			       uint32_t y_offset)
 {
-	emit_iga64_code(shdr, media_block_write, "				\n\
-	// Clear message header							\n\
-(W)	mov (16|M0)              r4.0<1>:ud    0x0:ud				\n\
-	// Payload								\n\
-(W)	mov (1|M0)               r5.0<1>:ud    ARG(3):ud			\n\
-(W)	mov (1|M0)               r5.1<1>:ud    ARG(4):ud			\n\
-(W)	mov (1|M0)               r5.2<1>:ud    ARG(5):ud			\n\
-(W)	mov (1|M0)               r5.3<1>:ud    ARG(6):ud			\n\
-#if GEN_VER < 2000 // Media Block Write						\n\
-	// X offset of the block in bytes := (thread group id X << ARG(0))	\n\
-(W)	shl (1|M0)               r4.0<1>:ud    r0.1<0;1,0>:ud    ARG(0):ud	\n\
-	// Y offset of the block in rows := thread group id Y			\n\
-(W)	mov (1|M0)               r4.1<1>:ud    r0.6<0;1,0>:ud			\n\
-(W)	add (1|M0)               r4.1<1>:ud    r4.1<0;1,0>:ud   ARG(1):ud	\n\
-	// block width [0,63] representing 1 to 64 bytes			\n\
-(W)	mov (1|M0)               r4.2<1>:ud    ARG(2):ud			\n\
-	// FFTID := FFTID from R0 header					\n\
-(W)	mov (1|M0)               r4.4<1>:ud    r0.5<0;1,0>:ud			\n\
-(W)	send.dc1 (16|M0)         null     r4   src1_null 0    0x40A8000		\n\
-#else // Typed 2D Block Store							\n\
-	// Load r2.0-3 with tg id X << ARG(0)					\n\
-(W)	shl (1|M0)               r2.0<1>:ud    r0.1<0;1,0>:ud    ARG(0):ud	\n\
-	// Load r2.4-7 with tg id Y + ARG(1):ud					\n\
-(W)	mov (1|M0)               r2.1<1>:ud    r0.6<0;1,0>:ud			\n\
-(W)	add (1|M0)               r2.1<1>:ud    r2.1<0;1,0>:ud    ARG(1):ud	\n\
-	// Store X and Y block start (160:191 and 192:223)			\n\
-(W)	mov (2|M0)               r4.5<1>:ud    r2.0<2;2,1>:ud			\n\
-	// Store X and Y block max_size (224:231 and 232:239)			\n\
-(W)	mov (1|M0)               r4.7<1>:ud    ARG(2):ud			\n\
-(W)	send.tgm (16|M0)         null     r4   null:0    0    0x64000007	\n\
-#endif										\n\
-	", 2, y_offset, 3, value, value, value, value);
+	emit_iga64_code(shdr, media_block_write, "		\n\
+(W)	mov (1)		r5.0<1>:ud    ARG(1):ud			\n\
+	SET_THREAD_SPACE_ADDR(r4, 0, ARG(0):ud, 4)		\n\
+(W)	STORE_SPACE_DW(r4, r5)					\n\
+	", y_offset, value);
 }
 
 /**
@@ -697,41 +618,14 @@ void gpgpu_shader__write_on_exception(struct gpgpu_shader *shdr, uint32_t value,
 				      uint32_t y_offset, uint32_t mask, uint32_t expected)
 {
 	emit_iga64_code(shdr, write_on_exception, "					\n\
-	// Clear message header								\n\
-(W)	mov (16|M0)              r4.0<1>:ud    0x0:ud					\n\
-	// Payload									\n\
-(W)	mov (1|M0)               r5.0<1>:ud    ARG(4):ud				\n\
-#if GEN_VER < 2000 // prepare Media Block Write						\n\
-	// X offset of the block in bytes := (thread group id X << ARG(0))		\n\
-(W)	add (1|M0)               r4.0<1>:ud    r0.1<0;1,0>:ud	 ARG(1):ud		\n\
-(W)	shl (1|M0)               r4.0<1>:ud    r4.0<0;1,0>:ud    ARG(0):ud		\n\
-	// Y offset of the block in rows := thread group id Y				\n\
-(W)	add (1|M0)               r4.1<1>:ud    r0.6<0;1,0>:ud   ARG(2):ud		\n\
-	// block width [0,63] representing 1 to 64 bytes				\n\
-(W)	mov (1|M0)               r4.2<1>:ud    ARG(3):ud				\n\
-	// FFTID := FFTID from R0 header						\n\
-(W)	mov (1|M0)               r4.4<1>:ud    r0.5<0;1,0>:ud				\n\
-#else // prepare Typed 2D Block Store							\n\
-	// Load r2.0 with tg id (X + ARG(1)) << ARG(0)					\n\
-(W)	add (1|M0)               r2.0<1>:ud    r0.1<0;1,0>:ud	 ARG(1):ud		\n\
-(W)	shl (1|M0)               r2.0<1>:ud    r2.0<0;1,0>:ud    ARG(0):ud		\n\
-	// Load r2.4-7 with tg id Y + ARG(2):ud						\n\
-(W)	add (1|M0)               r2.1<1>:ud    r0.6<0;1,0>:ud    ARG(2):ud		\n\
-	// Store X and Y block start (160:191 and 192:223)				\n\
-(W)	mov (2|M0)               r4.5<1>:ud    r2.0<2;2,1>:ud				\n\
-	// Store X and Y block max_size (224:231 and 232:239)				\n\
-(W)	mov (1|M0)               r4.7<1>:ud    ARG(3):ud				\n\
-#endif											\n\
+(W)	mov (1|M0)		r5.0<1>:ud	ARG(2):ud				\n\
+	SET_THREAD_SPACE_ADDR(r4, ARG(0), ARG(1):ud, 4)				\n\
 	// Check if masked exception is equal to provided value and write conditionally \n\
-(W)      and (1|M0)              r3.0<1>:ud     cr0.1<0;1,0>:ud ARG(5):ud		\n\
-(W)      mov (1|M0)              f0.0<1>:ud     0x0:ud					\n\
-(W)      cmp (1|M0)     (eq)f0.0 null:ud        r3.0<0;1,0>:ud  ARG(6):ud		\n\
-#if GEN_VER < 2000 // Media Block Write							\n\
-(W&f0.0) send.dc1 (16|M0)        null     r4   src1_null 0    0x40A8000			\n\
-#else // Typed 2D Block Store								\n\
-(W&f0.0) send.tgm (16|M0)        null     r4   null:0    0    0x64000007		\n\
-#endif											\n\
-	", 2, x_offset, y_offset, 3, value, mask, expected);
+(W)     and (1|M0)		r3.0<1>:ud     cr0.1<0;1,0>:ud ARG(3):ud		\n\
+(W)     mov (1|M0)		f0.0<1>:ud     0x0:ud					\n\
+(W)     cmp (1|M0) (eq)f0.0	null:ud        r3.0<0;1,0>:ud  ARG(4):ud		\n\
+(W&f0.0) STORE_SPACE_DW(r4, r5)								\n\
+	", 4 * x_offset, y_offset, value, mask, expected);
 }
 
 /**
@@ -778,22 +672,8 @@ void gpgpu_shader__end_system_routine_step_if_eq(struct gpgpu_shader *shdr,
 	emit_iga64_code(shdr, end_system_routine_step_if_eq, "				\n\
 (W)		or  (1|M0)               cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x8000:ud	\n\
 (W)		and (1|M0)               cr0.1<1>:ud   cr0.1<0;1,0>:ud   ARG(0):ud	\n\
-(W)		mov (16|M0)              r30.0<1>:ud    0x0:ud				\n\
-#if GEN_VER < 2000 // Media Block Write							\n\
-		// Y offset of the block in rows := thread group id Y			\n\
-(W)		mov (1|M0)               r30.1<1>:ud    ARG(1):ud			\n\
-		// block width [0,63] representing 1 to 64 bytes, we want dword		\n\
-(W)		mov (1|M0)               r30.2<1>:ud    0x3:ud				\n\
-		// FFTID := FFTID from R0 header					\n\
-(W)		mov (1|M0)               r30.4<1>:ud    r0.5<0;1,0>:ud			\n\
-(W)		send.dc1 (16|M0)         r31     r30      null    0x0	0x2190000	\n\
-#else	// Typed 2D Block Store								\n\
-		// Store X and Y block start (160:191 and 192:223)			\n\
-(W)		mov (1|M0)               r30.6<1>:ud    ARG(1):ud			\n\
-		// Store X and Y block size (224:231 and 232:239)			\n\
-(W)		mov (1|M0)               r30.7<1>:ud    0x3:ud				\n\
-(W)		send.tgm (16|M0)         r31     r30    null:0    0x0    0x62100003	\n\
-#endif											\n\
+		SET_SHARED_SPACE_ADDR(r30, ARG(0):ud, 4)				\n\
+(W)		LOAD_SPACE_DW(r31, r30)							\n\
 		// clear the flag register						\n\
 (W)		mov (1|M0)               f0.0<1>:ud    0x0:ud				\n\
 (W)		cmp (1|M0)    (ne)f0.0   null<1>:ud     r31.0<0;1,0>:ud   ARG(2):ud	\n\
diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
index 41be66f74486..04015b0b6d29 100644
--- a/lib/iga64_generated_codes.c
+++ b/lib/iga64_generated_codes.c
@@ -3,7 +3,7 @@
 
 #include "gpgpu_shader.h"
 
-#define MD5_SUM_IGA64_ASMS 09d72b5fd1f62c8c2905caa80f400567
+#define MD5_SUM_IGA64_ASMS da66be3cf9bec819a61429de75943011
 
 struct iga64_template const iga64_code_gpgpu_fill[] = {
 	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
@@ -83,10 +83,10 @@ struct iga64_template const iga64_code_end_system_routine_step_if_eq[] = {
 	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
 		0x80000966, 0x80018220, 0x02008000, 0x00008000,
 		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
-		0x80100961, 0x1e054220, 0x00000000, 0x00000000,
-		0x80000061, 0x1e654220, 0x00000000, 0xc0ded001,
+		0x800c0961, 0x1e054220, 0x00000000, 0x00000000,
+		0x80000061, 0x1e654220, 0x00000000, 0xc0ded000,
 		0x80000061, 0x1e754220, 0x00000000, 0x00000003,
-		0x80132031, 0x1f0c0000, 0xd0061e8c, 0x04000000,
+		0x80032031, 0x1f0c0000, 0xd0061e8c, 0x04000000,
 		0x80000061, 0x30014220, 0x00000000, 0x00000000,
 		0x80008070, 0x00018220, 0x22001f04, 0xc0ded002,
 		0x84000965, 0x80118220, 0x02008010, 0xc0ded003,
@@ -96,12 +96,12 @@ struct iga64_template const iga64_code_end_system_routine_step_if_eq[] = {
 	{ .gen_ver = 1270, .size = 52, .code = (const uint32_t []) {
 		0x80000966, 0x80018220, 0x02008000, 0x00008000,
 		0x80000965, 0x80218220, 0x02008020, 0xc0ded000,
-		0x80040961, 0x1e054220, 0x00000000, 0x00000000,
-		0x80000061, 0x1e254220, 0x00000000, 0xc0ded001,
+		0x80030961, 0x1e054220, 0x00000000, 0x00000000,
+		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
 		0x80000061, 0x1e454220, 0x00000000, 0x00000003,
 		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
 		0x80001901, 0x00010000, 0x00000000, 0x00000000,
-		0x80044031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
+		0x80004031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
 		0x80000061, 0x30014220, 0x00000000, 0x00000000,
 		0x80002070, 0x00018220, 0x22001f04, 0xc0ded002,
 		0x81000965, 0x80218220, 0x02008020, 0xc0ded003,
@@ -111,11 +111,11 @@ struct iga64_template const iga64_code_end_system_routine_step_if_eq[] = {
 	{ .gen_ver = 1260, .size = 48, .code = (const uint32_t []) {
 		0x80000966, 0x80018220, 0x02008000, 0x00008000,
 		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
-		0x80100961, 0x1e054220, 0x00000000, 0x00000000,
-		0x80000061, 0x1e154220, 0x00000000, 0xc0ded001,
+		0x800c0961, 0x1e054220, 0x00000000, 0x00000000,
+		0x80000061, 0x1e154220, 0x00000000, 0xc0ded000,
 		0x80000061, 0x1e254220, 0x00000000, 0x00000003,
 		0x80000061, 0x1e450220, 0x00000054, 0x00000000,
-		0x80132031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
+		0x80032031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
 		0x80000061, 0x30014220, 0x00000000, 0x00000000,
 		0x80008070, 0x00018220, 0x22001f04, 0xc0ded002,
 		0x84000965, 0x80118220, 0x02008010, 0xc0ded003,
@@ -125,12 +125,12 @@ struct iga64_template const iga64_code_end_system_routine_step_if_eq[] = {
 	{ .gen_ver = 1250, .size = 52, .code = (const uint32_t []) {
 		0x80000966, 0x80018220, 0x02008000, 0x00008000,
 		0x80000965, 0x80218220, 0x02008020, 0xc0ded000,
-		0x80040961, 0x1e054220, 0x00000000, 0x00000000,
-		0x80000061, 0x1e254220, 0x00000000, 0xc0ded001,
+		0x80030961, 0x1e054220, 0x00000000, 0x00000000,
+		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
 		0x80000061, 0x1e454220, 0x00000000, 0x00000003,
 		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
 		0x80001901, 0x00010000, 0x00000000, 0x00000000,
-		0x80044031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
+		0x80004031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
 		0x80000061, 0x30014220, 0x00000000, 0x00000000,
 		0x80002070, 0x00018220, 0x22001f04, 0xc0ded002,
 		0x81000965, 0x80218220, 0x02008020, 0xc0ded003,
@@ -140,11 +140,11 @@ struct iga64_template const iga64_code_end_system_routine_step_if_eq[] = {
 	{ .gen_ver = 0, .size = 48, .code = (const uint32_t []) {
 		0x80000166, 0x80018220, 0x02008000, 0x00008000,
 		0x80000165, 0x80218220, 0x02008020, 0xc0ded000,
-		0x80040161, 0x1e054220, 0x00000000, 0x00000000,
-		0x80000061, 0x1e254220, 0x00000000, 0xc0ded001,
+		0x80030161, 0x1e054220, 0x00000000, 0x00000000,
+		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
 		0x80000061, 0x1e454220, 0x00000000, 0x00000003,
 		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
-		0x80049031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
+		0x80009031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
 		0x80000061, 0x30014220, 0x00000000, 0x00000000,
 		0x80002070, 0x00018220, 0x22001f04, 0xc0ded002,
 		0x81000165, 0x80218220, 0x02008020, 0xc0ded003,
@@ -193,84 +193,83 @@ struct iga64_template const iga64_code_breakpoint_suppress[] = {
 };
 
 struct iga64_template const iga64_code_write_on_exception[] = {
-	{ .gen_ver = 2000, .size = 56, .code = (const uint32_t []) {
-		0x80100061, 0x04054220, 0x00000000, 0x00000000,
-		0x80000061, 0x05054220, 0x00000000, 0xc0ded004,
-		0x80000040, 0x02058220, 0x02000014, 0xc0ded001,
-		0x80001969, 0x02058220, 0x02000204, 0xc0ded000,
-		0x80000040, 0x02158220, 0x02000064, 0xc0ded002,
-		0x80041961, 0x04550220, 0x00220205, 0x00000000,
-		0x80000061, 0x04754220, 0x00000000, 0xc0ded003,
-		0x80000965, 0x03058220, 0x02008010, 0xc0ded005,
+	{ .gen_ver = 2000, .size = 52, .code = (const uint32_t []) {
+		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
+		0x800c0061, 0x04054220, 0x00000000, 0x00000000,
+		0x80000069, 0x04558220, 0x02000014, 0x00000002,
+		0x80001940, 0x04558220, 0x02000454, 0xc0ded000,
+		0x80000040, 0x04658220, 0x02000064, 0xc0ded001,
+		0x80000061, 0x04754220, 0x00000000, 0x00000003,
+		0x80000965, 0x03058220, 0x02008010, 0xc0ded003,
 		0x80000961, 0x30014220, 0x00000000, 0x00000000,
-		0x80001a70, 0x00018220, 0x12000304, 0xc0ded006,
-		0x84132031, 0x00000000, 0xd00e0494, 0x04000000,
+		0x80001a70, 0x00018220, 0x12000304, 0xc0ded004,
+		0x84032031, 0x00000000, 0xd00e0494, 0x04000000,
 		0x80000001, 0x00010000, 0x20000000, 0x00000000,
 		0x80000001, 0x00010000, 0x30000000, 0x00000000,
 		0x80000901, 0x00010000, 0x00000000, 0x00000000,
 	}},
 	{ .gen_ver = 1270, .size = 60, .code = (const uint32_t []) {
-		0x80040061, 0x04054220, 0x00000000, 0x00000000,
-		0x80000061, 0x05054220, 0x00000000, 0xc0ded004,
-		0x80000040, 0x04058220, 0x02000024, 0xc0ded001,
-		0x80001969, 0x04058220, 0x02000404, 0xc0ded000,
-		0x80000040, 0x04258220, 0x020000c4, 0xc0ded002,
-		0x80000061, 0x04454220, 0x00000000, 0xc0ded003,
+		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
+		0x80030061, 0x04054220, 0x00000000, 0x00000000,
+		0x80000069, 0x04058220, 0x02000024, 0x00000002,
+		0x80001940, 0x04058220, 0x02000404, 0xc0ded000,
+		0x80000040, 0x04258220, 0x020000c4, 0xc0ded001,
+		0x80000061, 0x04454220, 0x00000000, 0x00000003,
 		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
-		0x80000965, 0x03058220, 0x02008020, 0xc0ded005,
+		0x80000965, 0x03058220, 0x02008020, 0xc0ded003,
 		0x80000961, 0x30014220, 0x00000000, 0x00000000,
-		0x80001a70, 0x00018220, 0x12000304, 0xc0ded006,
+		0x80001a70, 0x00018220, 0x12000304, 0xc0ded004,
 		0x80001901, 0x00010000, 0x00000000, 0x00000000,
-		0x81044031, 0x00000000, 0xc0000414, 0x02a00000,
+		0x81004031, 0x00000000, 0xc0000414, 0x02a00000,
 		0x80000001, 0x00010000, 0x20000000, 0x00000000,
 		0x80000001, 0x00010000, 0x30000000, 0x00000000,
 		0x80000901, 0x00010000, 0x00000000, 0x00000000,
 	}},
 	{ .gen_ver = 1260, .size = 56, .code = (const uint32_t []) {
-		0x80100061, 0x04054220, 0x00000000, 0x00000000,
-		0x80000061, 0x05054220, 0x00000000, 0xc0ded004,
-		0x80000040, 0x04058220, 0x02000014, 0xc0ded001,
-		0x80001969, 0x04058220, 0x02000404, 0xc0ded000,
-		0x80000040, 0x04158220, 0x02000064, 0xc0ded002,
-		0x80000061, 0x04254220, 0x00000000, 0xc0ded003,
+		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
+		0x800c0061, 0x04054220, 0x00000000, 0x00000000,
+		0x80000069, 0x04058220, 0x02000014, 0x00000002,
+		0x80001940, 0x04058220, 0x02000404, 0xc0ded000,
+		0x80000040, 0x04158220, 0x02000064, 0xc0ded001,
+		0x80000061, 0x04254220, 0x00000000, 0x00000003,
 		0x80000061, 0x04450220, 0x00000054, 0x00000000,
-		0x80000965, 0x03058220, 0x02008010, 0xc0ded005,
+		0x80000965, 0x03058220, 0x02008010, 0xc0ded003,
 		0x80000961, 0x30014220, 0x00000000, 0x00000000,
-		0x80001a70, 0x00018220, 0x12000304, 0xc0ded006,
-		0x84132031, 0x00000000, 0xc0000414, 0x02a00000,
+		0x80001a70, 0x00018220, 0x12000304, 0xc0ded004,
+		0x84032031, 0x00000000, 0xc0000414, 0x02a00000,
 		0x80000001, 0x00010000, 0x20000000, 0x00000000,
 		0x80000001, 0x00010000, 0x30000000, 0x00000000,
 		0x80000901, 0x00010000, 0x00000000, 0x00000000,
 	}},
 	{ .gen_ver = 1250, .size = 60, .code = (const uint32_t []) {
-		0x80040061, 0x04054220, 0x00000000, 0x00000000,
-		0x80000061, 0x05054220, 0x00000000, 0xc0ded004,
-		0x80000040, 0x04058220, 0x02000024, 0xc0ded001,
-		0x80001969, 0x04058220, 0x02000404, 0xc0ded000,
-		0x80000040, 0x04258220, 0x020000c4, 0xc0ded002,
-		0x80000061, 0x04454220, 0x00000000, 0xc0ded003,
+		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
+		0x80030061, 0x04054220, 0x00000000, 0x00000000,
+		0x80000069, 0x04058220, 0x02000024, 0x00000002,
+		0x80001940, 0x04058220, 0x02000404, 0xc0ded000,
+		0x80000040, 0x04258220, 0x020000c4, 0xc0ded001,
+		0x80000061, 0x04454220, 0x00000000, 0x00000003,
 		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
-		0x80000965, 0x03058220, 0x02008020, 0xc0ded005,
+		0x80000965, 0x03058220, 0x02008020, 0xc0ded003,
 		0x80000961, 0x30014220, 0x00000000, 0x00000000,
-		0x80001a70, 0x00018220, 0x12000304, 0xc0ded006,
+		0x80001a70, 0x00018220, 0x12000304, 0xc0ded004,
 		0x80001901, 0x00010000, 0x00000000, 0x00000000,
-		0x81044031, 0x00000000, 0xc0000414, 0x02a00000,
+		0x81004031, 0x00000000, 0xc0000414, 0x02a00000,
 		0x80000001, 0x00010000, 0x20000000, 0x00000000,
 		0x80000001, 0x00010000, 0x30000000, 0x00000000,
 		0x80000901, 0x00010000, 0x00000000, 0x00000000,
 	}},
 	{ .gen_ver = 0, .size = 56, .code = (const uint32_t []) {
-		0x80040061, 0x04054220, 0x00000000, 0x00000000,
-		0x80000061, 0x05054220, 0x00000000, 0xc0ded004,
-		0x80000040, 0x04058220, 0x02000024, 0xc0ded001,
-		0x80000169, 0x04058220, 0x02000404, 0xc0ded000,
-		0x80000040, 0x04258220, 0x020000c4, 0xc0ded002,
-		0x80000061, 0x04454220, 0x00000000, 0xc0ded003,
+		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
+		0x80030061, 0x04054220, 0x00000000, 0x00000000,
+		0x80000069, 0x04058220, 0x02000024, 0x00000002,
+		0x80000140, 0x04058220, 0x02000404, 0xc0ded000,
+		0x80000040, 0x04258220, 0x020000c4, 0xc0ded001,
+		0x80000061, 0x04454220, 0x00000000, 0x00000003,
 		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
-		0x80000165, 0x03058220, 0x02008020, 0xc0ded005,
+		0x80000165, 0x03058220, 0x02008020, 0xc0ded003,
 		0x80000161, 0x30014220, 0x00000000, 0x00000000,
-		0x80000270, 0x00018220, 0x12000304, 0xc0ded006,
-		0x81049031, 0x00000000, 0xc0000414, 0x02a00000,
+		0x80000270, 0x00018220, 0x12000304, 0xc0ded004,
+		0x81009031, 0x00000000, 0xc0000414, 0x02a00000,
 		0x80000001, 0x00010000, 0x20000000, 0x00000000,
 		0x80000001, 0x00010000, 0x30000000, 0x00000000,
 		0x80000101, 0x00010000, 0x00000000, 0x00000000,
@@ -324,84 +323,68 @@ struct iga64_template const iga64_code_clear_exception[] = {
 };
 
 struct iga64_template const iga64_code_media_block_write[] = {
-	{ .gen_ver = 2000, .size = 56, .code = (const uint32_t []) {
-		0x80100061, 0x04054220, 0x00000000, 0x00000000,
-		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
-		0x80000061, 0x05154220, 0x00000000, 0xc0ded004,
-		0x80000061, 0x05254220, 0x00000000, 0xc0ded005,
-		0x80000061, 0x05354220, 0x00000000, 0xc0ded006,
-		0x80000069, 0x02058220, 0x02000014, 0xc0ded000,
-		0x80000061, 0x02150220, 0x00000064, 0x00000000,
-		0x80001940, 0x02158220, 0x02000214, 0xc0ded001,
-		0x80041961, 0x04550220, 0x00220205, 0x00000000,
-		0x80000061, 0x04754220, 0x00000000, 0xc0ded002,
-		0x80132031, 0x00000000, 0xd00e0494, 0x04000000,
+	{ .gen_ver = 2000, .size = 40, .code = (const uint32_t []) {
+		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
+		0x800c0061, 0x04054220, 0x00000000, 0x00000000,
+		0x80000069, 0x04558220, 0x02000014, 0x00000002,
+		0x80001940, 0x04558220, 0x02000454, 0x00000000,
+		0x80000040, 0x04658220, 0x02000064, 0xc0ded000,
+		0x80000061, 0x04754220, 0x00000000, 0x00000003,
+		0x80032031, 0x00000000, 0xd00e0494, 0x04000000,
 		0x80000001, 0x00010000, 0x20000000, 0x00000000,
 		0x80000001, 0x00010000, 0x30000000, 0x00000000,
 		0x80000901, 0x00010000, 0x00000000, 0x00000000,
 	}},
-	{ .gen_ver = 1270, .size = 60, .code = (const uint32_t []) {
-		0x80040061, 0x04054220, 0x00000000, 0x00000000,
-		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
-		0x80000061, 0x05254220, 0x00000000, 0xc0ded004,
-		0x80000061, 0x05454220, 0x00000000, 0xc0ded005,
-		0x80000061, 0x05654220, 0x00000000, 0xc0ded006,
-		0x80000069, 0x04058220, 0x02000024, 0xc0ded000,
-		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
-		0x80001940, 0x04258220, 0x02000424, 0xc0ded001,
-		0x80000061, 0x04454220, 0x00000000, 0xc0ded002,
+	{ .gen_ver = 1270, .size = 48, .code = (const uint32_t []) {
+		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
+		0x80030061, 0x04054220, 0x00000000, 0x00000000,
+		0x80000069, 0x04058220, 0x02000024, 0x00000002,
+		0x80001940, 0x04058220, 0x02000404, 0x00000000,
+		0x80000040, 0x04258220, 0x020000c4, 0xc0ded000,
+		0x80000061, 0x04454220, 0x00000000, 0x00000003,
 		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
 		0x80001901, 0x00010000, 0x00000000, 0x00000000,
-		0x80044031, 0x00000000, 0xc0000414, 0x02a00000,
+		0x80004031, 0x00000000, 0xc0000414, 0x02a00000,
 		0x80000001, 0x00010000, 0x20000000, 0x00000000,
 		0x80000001, 0x00010000, 0x30000000, 0x00000000,
 		0x80000901, 0x00010000, 0x00000000, 0x00000000,
 	}},
-	{ .gen_ver = 1260, .size = 56, .code = (const uint32_t []) {
-		0x80100061, 0x04054220, 0x00000000, 0x00000000,
-		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
-		0x80000061, 0x05154220, 0x00000000, 0xc0ded004,
-		0x80000061, 0x05254220, 0x00000000, 0xc0ded005,
-		0x80000061, 0x05354220, 0x00000000, 0xc0ded006,
-		0x80000069, 0x04058220, 0x02000014, 0xc0ded000,
-		0x80000061, 0x04150220, 0x00000064, 0x00000000,
-		0x80001940, 0x04158220, 0x02000414, 0xc0ded001,
-		0x80000061, 0x04254220, 0x00000000, 0xc0ded002,
+	{ .gen_ver = 1260, .size = 44, .code = (const uint32_t []) {
+		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
+		0x800c0061, 0x04054220, 0x00000000, 0x00000000,
+		0x80000069, 0x04058220, 0x02000014, 0x00000002,
+		0x80001940, 0x04058220, 0x02000404, 0x00000000,
+		0x80000040, 0x04158220, 0x02000064, 0xc0ded000,
+		0x80000061, 0x04254220, 0x00000000, 0x00000003,
 		0x80000061, 0x04450220, 0x00000054, 0x00000000,
-		0x80132031, 0x00000000, 0xc0000414, 0x02a00000,
+		0x80032031, 0x00000000, 0xc0000414, 0x02a00000,
 		0x80000001, 0x00010000, 0x20000000, 0x00000000,
 		0x80000001, 0x00010000, 0x30000000, 0x00000000,
 		0x80000901, 0x00010000, 0x00000000, 0x00000000,
 	}},
-	{ .gen_ver = 1250, .size = 60, .code = (const uint32_t []) {
-		0x80040061, 0x04054220, 0x00000000, 0x00000000,
-		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
-		0x80000061, 0x05254220, 0x00000000, 0xc0ded004,
-		0x80000061, 0x05454220, 0x00000000, 0xc0ded005,
-		0x80000061, 0x05654220, 0x00000000, 0xc0ded006,
-		0x80000069, 0x04058220, 0x02000024, 0xc0ded000,
-		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
-		0x80001940, 0x04258220, 0x02000424, 0xc0ded001,
-		0x80000061, 0x04454220, 0x00000000, 0xc0ded002,
+	{ .gen_ver = 1250, .size = 48, .code = (const uint32_t []) {
+		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
+		0x80030061, 0x04054220, 0x00000000, 0x00000000,
+		0x80000069, 0x04058220, 0x02000024, 0x00000002,
+		0x80001940, 0x04058220, 0x02000404, 0x00000000,
+		0x80000040, 0x04258220, 0x020000c4, 0xc0ded000,
+		0x80000061, 0x04454220, 0x00000000, 0x00000003,
 		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
 		0x80001901, 0x00010000, 0x00000000, 0x00000000,
-		0x80044031, 0x00000000, 0xc0000414, 0x02a00000,
+		0x80004031, 0x00000000, 0xc0000414, 0x02a00000,
 		0x80000001, 0x00010000, 0x20000000, 0x00000000,
 		0x80000001, 0x00010000, 0x30000000, 0x00000000,
 		0x80000901, 0x00010000, 0x00000000, 0x00000000,
 	}},
-	{ .gen_ver = 0, .size = 56, .code = (const uint32_t []) {
-		0x80040061, 0x04054220, 0x00000000, 0x00000000,
-		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
-		0x80000061, 0x05254220, 0x00000000, 0xc0ded004,
-		0x80000061, 0x05454220, 0x00000000, 0xc0ded005,
-		0x80000061, 0x05654220, 0x00000000, 0xc0ded006,
-		0x80000069, 0x04058220, 0x02000024, 0xc0ded000,
-		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
-		0x80000140, 0x04258220, 0x02000424, 0xc0ded001,
-		0x80000061, 0x04454220, 0x00000000, 0xc0ded002,
+	{ .gen_ver = 0, .size = 44, .code = (const uint32_t []) {
+		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
+		0x80030061, 0x04054220, 0x00000000, 0x00000000,
+		0x80000069, 0x04058220, 0x02000024, 0x00000002,
+		0x80000140, 0x04058220, 0x02000404, 0x00000000,
+		0x80000040, 0x04258220, 0x020000c4, 0xc0ded000,
+		0x80000061, 0x04454220, 0x00000000, 0x00000003,
 		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
-		0x80049031, 0x00000000, 0xc0000414, 0x02a00000,
+		0x80009031, 0x00000000, 0xc0000414, 0x02a00000,
 		0x80000001, 0x00010000, 0x20000000, 0x00000000,
 		0x80000001, 0x00010000, 0x30000000, 0x00000000,
 		0x80000101, 0x00010000, 0x00000000, 0x00000000,
@@ -432,65 +415,68 @@ struct iga64_template const iga64_code_write_aip[] = {
 };
 
 struct iga64_template const iga64_code_media_block_write_aip[] = {
-	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
+	{ .gen_ver = 2000, .size = 40, .code = (const uint32_t []) {
 		0x80000961, 0x05050220, 0x00008020, 0x00000000,
-		0x80000969, 0x02058220, 0x02000014, 0x00000002,
-		0x80000061, 0x02150220, 0x00000064, 0x00000000,
-		0x80001940, 0x02158220, 0x02000214, 0xc0ded000,
-		0x80100061, 0x04054220, 0x00000000, 0x00000000,
-		0x80041a61, 0x04550220, 0x00220205, 0x00000000,
+		0x800c0961, 0x04054220, 0x00000000, 0x00000000,
+		0x80000069, 0x04558220, 0x02000014, 0x00000002,
+		0x80001940, 0x04558220, 0x02000454, 0x00000000,
+		0x80000040, 0x04658220, 0x02000064, 0xc0ded000,
 		0x80000061, 0x04754220, 0x00000000, 0x00000003,
-		0x80132031, 0x00000000, 0xd00e0494, 0x04000000,
+		0x80032031, 0x00000000, 0xd00e0494, 0x04000000,
 		0x80000001, 0x00010000, 0x20000000, 0x00000000,
 		0x80000001, 0x00010000, 0x30000000, 0x00000000,
 		0x80000901, 0x00010000, 0x00000000, 0x00000000,
 	}},
-	{ .gen_ver = 1270, .size = 44, .code = (const uint32_t []) {
+	{ .gen_ver = 1270, .size = 48, .code = (const uint32_t []) {
 		0x80000961, 0x05050220, 0x00008040, 0x00000000,
-		0x80000969, 0x04058220, 0x02000024, 0x00000002,
-		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
-		0x80001940, 0x04258220, 0x02000424, 0xc0ded000,
+		0x80030961, 0x04054220, 0x00000000, 0x00000000,
+		0x80000069, 0x04058220, 0x02000024, 0x00000002,
+		0x80001940, 0x04058220, 0x02000404, 0x00000000,
+		0x80000040, 0x04258220, 0x020000c4, 0xc0ded000,
 		0x80000061, 0x04454220, 0x00000000, 0x00000003,
 		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
 		0x80001901, 0x00010000, 0x00000000, 0x00000000,
-		0x80044031, 0x00000000, 0xc0000414, 0x02a00000,
+		0x80004031, 0x00000000, 0xc0000414, 0x02a00000,
 		0x80000001, 0x00010000, 0x20000000, 0x00000000,
 		0x80000001, 0x00010000, 0x30000000, 0x00000000,
 		0x80000901, 0x00010000, 0x00000000, 0x00000000,
 	}},
-	{ .gen_ver = 1260, .size = 40, .code = (const uint32_t []) {
+	{ .gen_ver = 1260, .size = 44, .code = (const uint32_t []) {
 		0x80000961, 0x05050220, 0x00008020, 0x00000000,
-		0x80000969, 0x04058220, 0x02000014, 0x00000002,
-		0x80000061, 0x04150220, 0x00000064, 0x00000000,
-		0x80001940, 0x04158220, 0x02000414, 0xc0ded000,
+		0x800c0961, 0x04054220, 0x00000000, 0x00000000,
+		0x80000069, 0x04058220, 0x02000014, 0x00000002,
+		0x80001940, 0x04058220, 0x02000404, 0x00000000,
+		0x80000040, 0x04158220, 0x02000064, 0xc0ded000,
 		0x80000061, 0x04254220, 0x00000000, 0x00000003,
 		0x80000061, 0x04450220, 0x00000054, 0x00000000,
-		0x80132031, 0x00000000, 0xc0000414, 0x02a00000,
+		0x80032031, 0x00000000, 0xc0000414, 0x02a00000,
 		0x80000001, 0x00010000, 0x20000000, 0x00000000,
 		0x80000001, 0x00010000, 0x30000000, 0x00000000,
 		0x80000901, 0x00010000, 0x00000000, 0x00000000,
 	}},
-	{ .gen_ver = 1250, .size = 44, .code = (const uint32_t []) {
+	{ .gen_ver = 1250, .size = 48, .code = (const uint32_t []) {
 		0x80000961, 0x05050220, 0x00008040, 0x00000000,
-		0x80000969, 0x04058220, 0x02000024, 0x00000002,
-		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
-		0x80001940, 0x04258220, 0x02000424, 0xc0ded000,
+		0x80030961, 0x04054220, 0x00000000, 0x00000000,
+		0x80000069, 0x04058220, 0x02000024, 0x00000002,
+		0x80001940, 0x04058220, 0x02000404, 0x00000000,
+		0x80000040, 0x04258220, 0x020000c4, 0xc0ded000,
 		0x80000061, 0x04454220, 0x00000000, 0x00000003,
 		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
 		0x80001901, 0x00010000, 0x00000000, 0x00000000,
-		0x80044031, 0x00000000, 0xc0000414, 0x02a00000,
+		0x80004031, 0x00000000, 0xc0000414, 0x02a00000,
 		0x80000001, 0x00010000, 0x20000000, 0x00000000,
 		0x80000001, 0x00010000, 0x30000000, 0x00000000,
 		0x80000901, 0x00010000, 0x00000000, 0x00000000,
 	}},
-	{ .gen_ver = 0, .size = 40, .code = (const uint32_t []) {
+	{ .gen_ver = 0, .size = 44, .code = (const uint32_t []) {
 		0x80000161, 0x05050220, 0x00008040, 0x00000000,
-		0x80000169, 0x04058220, 0x02000024, 0x00000002,
-		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
-		0x80000140, 0x04258220, 0x02000424, 0xc0ded000,
+		0x80030161, 0x04054220, 0x00000000, 0x00000000,
+		0x80000069, 0x04058220, 0x02000024, 0x00000002,
+		0x80000140, 0x04058220, 0x02000404, 0x00000000,
+		0x80000040, 0x04258220, 0x020000c4, 0xc0ded000,
 		0x80000061, 0x04454220, 0x00000000, 0x00000003,
 		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
-		0x80049031, 0x00000000, 0xc0000414, 0x02a00000,
+		0x80009031, 0x00000000, 0xc0000414, 0x02a00000,
 		0x80000001, 0x00010000, 0x20000000, 0x00000000,
 		0x80000001, 0x00010000, 0x30000000, 0x00000000,
 		0x80000101, 0x00010000, 0x00000000, 0x00000000,
@@ -499,77 +485,77 @@ struct iga64_template const iga64_code_media_block_write_aip[] = {
 
 struct iga64_template const iga64_code_common_target_write[] = {
 	{ .gen_ver = 2000, .size = 48, .code = (const uint32_t []) {
-		0x80100061, 0x1e054220, 0x00000000, 0x00000000,
 		0x80100061, 0x1f054220, 0x00000000, 0x00000000,
 		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
 		0x80000061, 0x1f154220, 0x00000000, 0xc0ded002,
 		0x80000061, 0x1f254220, 0x00000000, 0xc0ded003,
 		0x80000061, 0x1f354220, 0x00000000, 0xc0ded004,
+		0x800c0061, 0x1e054220, 0x00000000, 0x00000000,
 		0x80000061, 0x1e654220, 0x00000000, 0xc0ded000,
 		0x80000061, 0x1e754220, 0x00000000, 0x0000000f,
-		0x80132031, 0x00000000, 0xd00e1e94, 0x04000000,
+		0x80032031, 0x00000000, 0xd00e1e94, 0x04000000,
 		0x80000001, 0x00010000, 0x20000000, 0x00000000,
 		0x80000001, 0x00010000, 0x30000000, 0x00000000,
 		0x80000901, 0x00010000, 0x00000000, 0x00000000,
 	}},
 	{ .gen_ver = 1270, .size = 56, .code = (const uint32_t []) {
-		0x80040061, 0x1e054220, 0x00000000, 0x00000000,
 		0x80040061, 0x1f054220, 0x00000000, 0x00000000,
 		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
 		0x80000061, 0x1f254220, 0x00000000, 0xc0ded002,
 		0x80000061, 0x1f454220, 0x00000000, 0xc0ded003,
 		0x80000061, 0x1f654220, 0x00000000, 0xc0ded004,
+		0x80030061, 0x1e054220, 0x00000000, 0x00000000,
 		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
 		0x80000061, 0x1e454220, 0x00000000, 0x0000000f,
 		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
 		0x80001901, 0x00010000, 0x00000000, 0x00000000,
-		0x80044031, 0x00000000, 0xc0001e14, 0x02a00000,
+		0x80004031, 0x00000000, 0xc0001e14, 0x02a00000,
 		0x80000001, 0x00010000, 0x20000000, 0x00000000,
 		0x80000001, 0x00010000, 0x30000000, 0x00000000,
 		0x80000901, 0x00010000, 0x00000000, 0x00000000,
 	}},
 	{ .gen_ver = 1260, .size = 52, .code = (const uint32_t []) {
-		0x80100061, 0x1e054220, 0x00000000, 0x00000000,
 		0x80100061, 0x1f054220, 0x00000000, 0x00000000,
 		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
 		0x80000061, 0x1f154220, 0x00000000, 0xc0ded002,
 		0x80000061, 0x1f254220, 0x00000000, 0xc0ded003,
 		0x80000061, 0x1f354220, 0x00000000, 0xc0ded004,
+		0x800c0061, 0x1e054220, 0x00000000, 0x00000000,
 		0x80000061, 0x1e154220, 0x00000000, 0xc0ded000,
 		0x80000061, 0x1e254220, 0x00000000, 0x0000000f,
 		0x80000061, 0x1e450220, 0x00000054, 0x00000000,
-		0x80132031, 0x00000000, 0xc0001e14, 0x02a00000,
+		0x80032031, 0x00000000, 0xc0001e14, 0x02a00000,
 		0x80000001, 0x00010000, 0x20000000, 0x00000000,
 		0x80000001, 0x00010000, 0x30000000, 0x00000000,
 		0x80000901, 0x00010000, 0x00000000, 0x00000000,
 	}},
 	{ .gen_ver = 1250, .size = 56, .code = (const uint32_t []) {
-		0x80040061, 0x1e054220, 0x00000000, 0x00000000,
 		0x80040061, 0x1f054220, 0x00000000, 0x00000000,
 		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
 		0x80000061, 0x1f254220, 0x00000000, 0xc0ded002,
 		0x80000061, 0x1f454220, 0x00000000, 0xc0ded003,
 		0x80000061, 0x1f654220, 0x00000000, 0xc0ded004,
+		0x80030061, 0x1e054220, 0x00000000, 0x00000000,
 		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
 		0x80000061, 0x1e454220, 0x00000000, 0x0000000f,
 		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
 		0x80001901, 0x00010000, 0x00000000, 0x00000000,
-		0x80044031, 0x00000000, 0xc0001e14, 0x02a00000,
+		0x80004031, 0x00000000, 0xc0001e14, 0x02a00000,
 		0x80000001, 0x00010000, 0x20000000, 0x00000000,
 		0x80000001, 0x00010000, 0x30000000, 0x00000000,
 		0x80000901, 0x00010000, 0x00000000, 0x00000000,
 	}},
 	{ .gen_ver = 0, .size = 52, .code = (const uint32_t []) {
-		0x80040061, 0x1e054220, 0x00000000, 0x00000000,
 		0x80040061, 0x1f054220, 0x00000000, 0x00000000,
 		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
 		0x80000061, 0x1f254220, 0x00000000, 0xc0ded002,
 		0x80000061, 0x1f454220, 0x00000000, 0xc0ded003,
 		0x80000061, 0x1f654220, 0x00000000, 0xc0ded004,
+		0x80030061, 0x1e054220, 0x00000000, 0x00000000,
 		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
 		0x80000061, 0x1e454220, 0x00000000, 0x0000000f,
 		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
-		0x80049031, 0x00000000, 0xc0001e14, 0x02a00000,
+		0x80009031, 0x00000000, 0xc0001e14, 0x02a00000,
 		0x80000001, 0x00010000, 0x20000000, 0x00000000,
 		0x80000001, 0x00010000, 0x30000000, 0x00000000,
 		0x80000101, 0x00010000, 0x00000000, 0x00000000,
@@ -627,56 +613,56 @@ struct iga64_template const iga64_code_clear_r40[] = {
 
 struct iga64_template const iga64_code_jump_dw_neq[] = {
 	{ .gen_ver = 2000, .size = 32, .code = (const uint32_t []) {
-		0x80100061, 0x1e054220, 0x00000000, 0x00000000,
+		0x800c0061, 0x1e054220, 0x00000000, 0x00000000,
 		0x80000061, 0x1e654220, 0x00000000, 0xc0ded000,
 		0x80000061, 0x1e754220, 0x00000000, 0x00000003,
-		0x80132031, 0x1f0c0000, 0xd0061e8c, 0x04000000,
+		0x80032031, 0x1f0c0000, 0xd0061e8c, 0x04000000,
 		0x80000061, 0x30014220, 0x00000000, 0x00000000,
 		0x80008070, 0x00018220, 0x22001f04, 0xc0ded001,
 		0x84000020, 0x00004000, 0x00000000, 0xffffffa0,
 		0x80000901, 0x00010000, 0x00000000, 0x00000000,
 	}},
 	{ .gen_ver = 1270, .size = 40, .code = (const uint32_t []) {
-		0x80040061, 0x1e054220, 0x00000000, 0x00000000,
+		0x80030061, 0x1e054220, 0x00000000, 0x00000000,
 		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
 		0x80000061, 0x1e454220, 0x00000000, 0x00000003,
 		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
 		0x80001901, 0x00010000, 0x00000000, 0x00000000,
-		0x80044031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
+		0x80004031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
 		0x80000061, 0x30014220, 0x00000000, 0x00000000,
 		0x80002070, 0x00018220, 0x22001f04, 0xc0ded001,
 		0x81000020, 0x00004000, 0x00000000, 0xffffff80,
 		0x80000901, 0x00010000, 0x00000000, 0x00000000,
 	}},
 	{ .gen_ver = 1260, .size = 36, .code = (const uint32_t []) {
-		0x80100061, 0x1e054220, 0x00000000, 0x00000000,
+		0x800c0061, 0x1e054220, 0x00000000, 0x00000000,
 		0x80000061, 0x1e154220, 0x00000000, 0xc0ded000,
 		0x80000061, 0x1e254220, 0x00000000, 0x00000003,
 		0x80000061, 0x1e450220, 0x00000054, 0x00000000,
-		0x80132031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
+		0x80032031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
 		0x80000061, 0x30014220, 0x00000000, 0x00000000,
 		0x80008070, 0x00018220, 0x22001f04, 0xc0ded001,
 		0x84000020, 0x00004000, 0x00000000, 0xffffff90,
 		0x80000901, 0x00010000, 0x00000000, 0x00000000,
 	}},
 	{ .gen_ver = 1250, .size = 40, .code = (const uint32_t []) {
-		0x80040061, 0x1e054220, 0x00000000, 0x00000000,
+		0x80030061, 0x1e054220, 0x00000000, 0x00000000,
 		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
 		0x80000061, 0x1e454220, 0x00000000, 0x00000003,
 		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
 		0x80001901, 0x00010000, 0x00000000, 0x00000000,
-		0x80044031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
+		0x80004031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
 		0x80000061, 0x30014220, 0x00000000, 0x00000000,
 		0x80002070, 0x00018220, 0x22001f04, 0xc0ded001,
 		0x81000020, 0x00004000, 0x00000000, 0xffffff80,
 		0x80000901, 0x00010000, 0x00000000, 0x00000000,
 	}},
 	{ .gen_ver = 0, .size = 36, .code = (const uint32_t []) {
-		0x80040061, 0x1e054220, 0x00000000, 0x00000000,
+		0x80030061, 0x1e054220, 0x00000000, 0x00000000,
 		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
 		0x80000061, 0x1e454220, 0x00000000, 0x00000003,
 		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
-		0x80049031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
+		0x80009031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
 		0x80000061, 0x30014220, 0x00000000, 0x00000000,
 		0x80002070, 0x00018220, 0x22001f04, 0xc0ded001,
 		0x81000120, 0x00004000, 0x00000000, 0xffffff90,
diff --git a/lib/iga64_macros.h b/lib/iga64_macros.h
index 6459b524c3fd..40b6338928e1 100644
--- a/lib/iga64_macros.h
+++ b/lib/iga64_macros.h
@@ -16,4 +16,47 @@
 #define src1_null null:0
 #endif
 
+/* GPGPU_R0Payload fields, Bspec: 55396, 56587 */
+#define R0_TGIDX r0.1<0;1,0>:ud
+#define R0_TGIDY r0.6<0;1,0>:ud
+#define R0_FFTID r0.5<0;1,0>:ud
+
+#define SET_SHARED_MEDIA_BLOCK_MSG_HDR(dst, y, width)	\
+(W)	mov (8)		dst.0<1>:ud	0x0:ud		;\
+(W)	mov (1)		dst.1<1>:ud	y		;\
+(W)	mov (1)		dst.2<1>:ud	(width - 1):ud	;\
+(W)	mov (1)		dst.4<1>:ud	R0_FFTID
+
+#define SET_THREAD_MEDIA_BLOCK_MSG_HDR(dst, x, y, width)	\
+(W)	mov (8)		dst.0<1>:ud	0x0:ud			;\
+(W)	shl (1)		dst.0<1>:ud	R0_TGIDX	0x2:ud	;\
+(W)	add (1)		dst.0<1>:ud	dst.0<0;1,0>:ud	x:ud	;\
+(W)	add (1)		dst.1<1>:ud	R0_TGIDY	y	;\
+(W)	mov (1)		dst.2<1>:ud	(width - 1):ud		;\
+(W)	mov (1)		dst.4<1>:ud	R0_FFTID
+
+#define SET_SHARED_MEDIA_A2DBLOCK_PAYLOAD(dst, y, width)	\
+(W)	mov (8)		dst.0<1>:ud	0x0:ud		;\
+(W)	mov (1)		dst.6<1>:ud	y		;\
+(W)	mov (1)		dst.7<1>:ud	(width - 1):ud
+
+#define SET_THREAD_MEDIA_A2DBLOCK_PAYLOAD(dst, x, y, width)		\
+(W)	mov (8)		dst.0<1>:ud	0x0:ud			;\
+(W)	shl (1)		dst.5<1>:ud	R0_TGIDX	0x2:ud	;\
+(W)	add (1)		dst.5<1>:ud	dst.5<0;1,0>:ud	x:ud	;\
+(W)	add (1)		dst.6<1>:ud	R0_TGIDY	y	;\
+(W)	mov (1)		dst.7<1>:ud	(width - 1):ud		;\
+
+#if GEN_VER < 2000
+#define SET_SHARED_SPACE_ADDR(dst, y, width) SET_SHARED_MEDIA_BLOCK_MSG_HDR(dst, y, width)
+#define SET_THREAD_SPACE_ADDR(dst, x, y, width) SET_THREAD_MEDIA_BLOCK_MSG_HDR(dst, x, y, width)
+#define LOAD_SPACE_DW(dst, src) send.dc1 (1)	dst	src	src1_null 0x0	0x2190000
+#define STORE_SPACE_DW(dst, src) send.dc1 (1)	null	dst	null	0x0	0x40A8000
+#else
+#define SET_SHARED_SPACE_ADDR(dst, y, width) SET_SHARED_MEDIA_A2DBLOCK_PAYLOAD(dst, y, width)
+#define SET_THREAD_SPACE_ADDR(dst, x, y, width) SET_THREAD_MEDIA_A2DBLOCK_PAYLOAD(dst, x, y, width)
+#define LOAD_SPACE_DW(dst, src) send.tgm (1)	dst	src	null:0	0x0	0x62100003
+#define STORE_SPACE_DW(dst, src) send.tgm (1)	null	dst	null:0	0x0	0x64000007
+#endif
+
 #endif

-- 
2.34.1

