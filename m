Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C71EBD58D54
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 14:34:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 890CA10E672;
	Mon, 25 Nov 2024 14:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g6cpU3TN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A59010E672
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 14:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732545241; x=1764081241;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=TYv+cNrNCG1+BReAiTevh+FdJglCyh4CjC41AAqW3SM=;
 b=g6cpU3TNn3ic0hPswXe09fQp6btGcyG6Jaa7OdmmCh6e2K6BCllI2pBH
 9WpUDoGIjf3oQFqUF5CfB1TUdByGdMeAKJ4Q4LdpHpTPY93I63cUXUoA0
 QIfeg7g+v358KndXJJlUb0J+k/Ug4DoVFFIPVKiocFFkdvmpGwWMmbsPk
 O4RYmLaNyFbsTWSo5C/ADb0xhPvqo/o+VhEfo89BDRPRmZ5o9tfvgaoJB
 PZHEmf7BUR9qV4zaij222RYh0wMCnLUkSMwiT0YQYFfsGsfGDTHMyXTCH
 6lAEuGK9K0QLp4KV/KcndaCs9t0sFU7sX7/I+4CJoWuMOmDH76X80B58t w==;
X-CSE-ConnectionGUID: +W2boBv8RAeUy4dzubXiuA==
X-CSE-MsgGUID: x77NLSw5SqygrqvdU8a0UA==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="50177113"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="50177113"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 06:34:01 -0800
X-CSE-ConnectionGUID: 7CrtwVe8RJKGp9N5LpvDiQ==
X-CSE-MsgGUID: CmkPuTO4RWiVjAw6BDEt6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="96350055"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.102.138.202])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 06:33:59 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Mon, 25 Nov 2024 15:33:03 +0100
Subject: [PATCH v5 4/4] lib/gpgpu_shader: add support for Xe3 platforms
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241125-gpgpu_send_rework-v5-4-4454df13e1e1@intel.com>
References: <20241125-gpgpu_send_rework-v5-0-4454df13e1e1@intel.com>
In-Reply-To: <20241125-gpgpu_send_rework-v5-0-4454df13e1e1@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5767;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=TYv+cNrNCG1+BReAiTevh+FdJglCyh4CjC41AAqW3SM=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBnRIrO1jwxDg3jMj6LOSBcG5PRzcgwItona38P4USM
 SijFFgyJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZ0SKzgAKCRAjYrKT3hD91+EnC/
 kBeFM4vZTrEFAr5spxhH3QcXAWCoAvTLkKkzClZeSrq/07N+0R+Ph5qX9SeU9y6USWVR+pvRlM5jRP
 Z1mZ01VZJMBCQleW0Cinj0nti8IWY3DS9BGzT3EfJgoo6lX/GCro3scueAZbPfgGGbkamKE05LiUyG
 KVEWqnp2eurWR+rQSMDSZ7pZS6fbP81p3cah9c/+k7BJ5EMxIqJxFSQ/TcbYUrvDQHfoYNo2uoH9FV
 IuQ4YZ2UKay/qkFFX5iE7K6lPjB+8ZTFQjtkq1k+Mpt5gbQriUbsM6s3I0fsspJZYQ4/3i//PEU4n6
 13LmZvOvFgP8Hf09Rah63q3qsWK37vCNhTGPUbEkErJhZNl8Jesk3L/miSF8MONViX83YkWa0F+bE0
 38XRUk66LW4W8mSvVxtmhQCwv4Vd3b9LUWNVcK0KEVUvmmROrP0HXOyf912M4GafFRQ/NDs72xz44P
 OMCX0jCOYYzyE0DUdx1zVJk2txbuvzCrXLFeKKlpOh9KM=
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

System routine (SIP) on Xe3 platforms disallow indirect load/store
addressing. Surface descriptor must be passed in 2DBlock payload.
Use for it inline data passed from thread dispatcher.

v4:
  - moved gpgpu_alloc_gpu_addr changes to previous patch (Dominik)
v5:
  - make the requirement in the description more precise (Dominik)
  - removed extra lines from macro file (Dominik)

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 lib/iga64_generated_codes.c | 13 ++++++++-----
 lib/iga64_macros.h          | 32 ++++++++++++++++++++++++++++----
 2 files changed, 36 insertions(+), 9 deletions(-)

diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
index 96126b8c50c2..e1f68c968645 100644
--- a/lib/iga64_generated_codes.c
+++ b/lib/iga64_generated_codes.c
@@ -3,7 +3,7 @@
 
 #include "gpgpu_shader.h"
 
-#define MD5_SUM_IGA64_ASMS 3534731658223b1594f68ca427687773
+#define MD5_SUM_IGA64_ASMS f0c9d803408104207f0427e387a8050c
 
 struct iga64_template const iga64_code_gpgpu_fill[] = {
 	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
@@ -118,10 +118,11 @@ struct iga64_template const iga64_code_write_a64_d32[] = {
 };
 
 struct iga64_template const iga64_code_end_system_routine_step_if_eq[] = {
-	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
+	{ .gen_ver = 2000, .size = 48, .code = (const uint32_t []) {
 		0x80000966, 0x80018220, 0x02008000, 0x00008000,
 		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
 		0x800c0961, 0x1e054220, 0x00000000, 0x00000000,
+		0x80000061, 0x1e554220, 0x00000000, 0x00000000,
 		0x80000061, 0x1e654220, 0x00000000, 0xc0ded000,
 		0x80000061, 0x1e754220, 0x00000000, 0x00000003,
 		0x80032031, 0x1f0c0000, 0xd0061e8c, 0x04000000,
@@ -522,13 +523,14 @@ struct iga64_template const iga64_code_media_block_write_aip[] = {
 };
 
 struct iga64_template const iga64_code_common_target_write[] = {
-	{ .gen_ver = 2000, .size = 48, .code = (const uint32_t []) {
+	{ .gen_ver = 2000, .size = 52, .code = (const uint32_t []) {
 		0x80100061, 0x1f054220, 0x00000000, 0x00000000,
 		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
 		0x80000061, 0x1f154220, 0x00000000, 0xc0ded002,
 		0x80000061, 0x1f254220, 0x00000000, 0xc0ded003,
 		0x80000061, 0x1f354220, 0x00000000, 0xc0ded004,
 		0x800c0061, 0x1e054220, 0x00000000, 0x00000000,
+		0x80000061, 0x1e554220, 0x00000000, 0x00000000,
 		0x80000061, 0x1e654220, 0x00000000, 0xc0ded000,
 		0x80000061, 0x1e754220, 0x00000000, 0x0000000f,
 		0x80032031, 0x00000000, 0xd00e1e94, 0x04000000,
@@ -650,14 +652,15 @@ struct iga64_template const iga64_code_clear_r40[] = {
 };
 
 struct iga64_template const iga64_code_jump_dw_neq[] = {
-	{ .gen_ver = 2000, .size = 32, .code = (const uint32_t []) {
+	{ .gen_ver = 2000, .size = 36, .code = (const uint32_t []) {
 		0x800c0061, 0x1e054220, 0x00000000, 0x00000000,
+		0x80000061, 0x1e554220, 0x00000000, 0x00000000,
 		0x80000061, 0x1e654220, 0x00000000, 0xc0ded000,
 		0x80000061, 0x1e754220, 0x00000000, 0x00000003,
 		0x80032031, 0x1f0c0000, 0xd0061e8c, 0x04000000,
 		0x80000061, 0x30014220, 0x00000000, 0x00000000,
 		0x80008070, 0x00018220, 0x22001f04, 0xc0ded001,
-		0x84000020, 0x00004000, 0x00000000, 0xffffffa0,
+		0x84000020, 0x00004000, 0x00000000, 0xffffff90,
 		0x80000901, 0x00010000, 0x00000000, 0x00000000,
 	}},
 	{ .gen_ver = 1270, .size = 40, .code = (const uint32_t []) {
diff --git a/lib/iga64_macros.h b/lib/iga64_macros.h
index 40b6338928e1..ac482e47c05e 100644
--- a/lib/iga64_macros.h
+++ b/lib/iga64_macros.h
@@ -21,6 +21,13 @@
 #define R0_TGIDY r0.6<0;1,0>:ud
 #define R0_FFTID r0.5<0;1,0>:ud
 
+/* Inline data from COMPUTE_WALKER*, Bspec: 47203, 73584
+ * Filled by __xe*_gpgpu_execfunc.
+ */
+#define R1_TGT_ADDRESS r1.0<0;1,0>:uq
+#define R1_TGT_WIDTH r1.2<0;1,0>:ud
+#define R1_TGT_HEIGHT r1.3<0;1,0>:ud
+
 #define SET_SHARED_MEDIA_BLOCK_MSG_HDR(dst, y, width)	\
 (W)	mov (8)		dst.0<1>:ud	0x0:ud		;\
 (W)	mov (1)		dst.1<1>:ud	y		;\
@@ -35,13 +42,25 @@
 (W)	mov (1)		dst.2<1>:ud	(width - 1):ud		;\
 (W)	mov (1)		dst.4<1>:ud	R0_FFTID
 
+#if GEN_VER < 3000
+#define SET_SURFACE_DESC(dst)			\
+(W)	mov (8)		dst.0<1>:ud	0x0:ud
+#else
+#define SET_SURFACE_DESC(dst)					\
+(W)	mov (1)		dst.0<1>:uq	R1_TGT_ADDRESS		;\
+(W)	add (1)		dst.2<1>:ud	R1_TGT_WIDTH	-1:d	;\
+(W)	add (1)		dst.3<1>:ud	R1_TGT_HEIGHT	-1:d	;\
+(W)	add (1)		dst.4<1>:ud	R1_TGT_WIDTH	-1:d
+#endif
+
 #define SET_SHARED_MEDIA_A2DBLOCK_PAYLOAD(dst, y, width)	\
-(W)	mov (8)		dst.0<1>:ud	0x0:ud		;\
-(W)	mov (1)		dst.6<1>:ud	y		;\
+	SET_SURFACE_DESC(dst)					;\
+(W)	mov (1)		dst.5<1>:ud	0x0:ud			;\
+(W)	mov (1)		dst.6<1>:ud	y			;\
 (W)	mov (1)		dst.7<1>:ud	(width - 1):ud
 
-#define SET_THREAD_MEDIA_A2DBLOCK_PAYLOAD(dst, x, y, width)		\
-(W)	mov (8)		dst.0<1>:ud	0x0:ud			;\
+#define SET_THREAD_MEDIA_A2DBLOCK_PAYLOAD(dst, x, y, width)	\
+	SET_SURFACE_DESC(dst)					;\
 (W)	shl (1)		dst.5<1>:ud	R0_TGIDX	0x2:ud	;\
 (W)	add (1)		dst.5<1>:ud	dst.5<0;1,0>:ud	x:ud	;\
 (W)	add (1)		dst.6<1>:ud	R0_TGIDY	y	;\
@@ -55,8 +74,13 @@
 #else
 #define SET_SHARED_SPACE_ADDR(dst, y, width) SET_SHARED_MEDIA_A2DBLOCK_PAYLOAD(dst, y, width)
 #define SET_THREAD_SPACE_ADDR(dst, x, y, width) SET_THREAD_MEDIA_A2DBLOCK_PAYLOAD(dst, x, y, width)
+#if GEN_VER < 3000
 #define LOAD_SPACE_DW(dst, src) send.tgm (1)	dst	src	null:0	0x0	0x62100003
 #define STORE_SPACE_DW(dst, src) send.tgm (1)	null	dst	null:0	0x0	0x64000007
+#else
+#define LOAD_SPACE_DW(dst, src) send.ugm (1)	dst	src	null:0	0x0	0x2120003
+#define STORE_SPACE_DW(dst, src) send.ugm (1)	null	dst	src:1	0x0	0x2020007
+#endif
 #endif
 
 #endif

-- 
2.34.1

