Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B16D3B7E4
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 07:32:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC5C10E392;
	Mon, 25 Nov 2024 07:32:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jY6sL+Bp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0594D10E38F
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 07:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732519935; x=1764055935;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=9VBv1DZnV6oxxqjEv/wslo0TuyI9VwF9U1eVneJiAQI=;
 b=jY6sL+BppfvaPb1IcQewS7tZtyp2MSphFnZ/L//QKTX0359uX+HMU0fQ
 XpuYch+9cgUsoKVKspy5uNpmtUaBxw9PFP4eRXW5U8AQSGh+qtwCBu/hW
 4jexB4M/yTu/3r7TyzmGVyaRR3itDw8xKT56QQwL1RUc+fvHl+Ymh2Jl4
 ZaGqjlXWvTAGGFgfaF35S10vCFX7lpo/fA39VZZm7rdCeVHzRMOIKVJ8P
 F7g/Yfvauu3AXg6nKlxLQEAR3PeNvK0tQfiE189Bsw3lnfgbb+CCDzRJF
 0sy/hzoz4V+SRzxDHc3ylrTXY28A5Fy94gUf2EjWn6Vu2QAJaNTfpNn0B Q==;
X-CSE-ConnectionGUID: qg7CAlWWTvW0XF9K8zAFUA==
X-CSE-MsgGUID: v+W1DVsVSvOZQeAfnfCC0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="31972856"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="31972856"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2024 23:32:14 -0800
X-CSE-ConnectionGUID: bwF92i5qQ/aJN7ERH5Wx6A==
X-CSE-MsgGUID: 7WhCQTAFRImMnZzT5l+0rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="91595744"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.102.138.202])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2024 23:32:14 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Mon, 25 Nov 2024 08:31:53 +0100
Subject: [PATCH v4 4/4] lib/gpgpu_shader: add support for Xe3 platforms
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241125-gpgpu_send_rework-v4-4-c16b568a1f3d@intel.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5967;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=9VBv1DZnV6oxxqjEv/wslo0TuyI9VwF9U1eVneJiAQI=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBnRCf0bj1kZZZJJaLT67joyV6SOFLN9dHfPnouMgY0
 OkH4m6qJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZ0Qn9AAKCRAjYrKT3hD91+SAC/
 43uX4MogaQPzvq+qNGq9Y505WN6hWryAt4Jdpde7474EqOjqQX5IwvzKXVOZ0ZHmzQ6qyYxbIo8Z+y
 0KN2HLwmom7quyVf8WwoU51yOcvmssprK9aOohWyYZfmvbF6or+ml6LkvMYLOoWfcfoOh9B53Y1pFE
 Xt7Hq7t5/CKKWQI2xO+/JWYQuqjVtPf5Mzg/5MHb1Uxj4T7eTzZ1VenGk5s5XEQQcBRMWP1Iy6HjO3
 MnPNi8nSyoWnCVIWpX7NN8YcuLF5SacIgVt+cEmuRDPRShKMCXt3ShEWBOWD+AcqGmRrihzRwQXGDt
 Ppl99NJH7kAeTb2tbgfoYmSAUiyg2W8E3i4ToyAlxoMQQod6NE2z/ZweM+eGiBf57wSLU0qTn//7tL
 PknTwI7wVEYIsLjbvRjl1Y6rOBoS5AdxXmH/lCj3n5QPhSpFKqpM0a09Se1fXSCyYBjVMaPL6eAPVj
 aJj/q1d3vurA5vJR4WBo7YAZ7R5fpdeAmBgclLkFuJ4c8=
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

Xe3 platforms disallow indirect load/store addressing. Surface descriptor
must be passed in 2DBlock payload. Use for it inline data passed from
thread dispatcher.

v4:
  - moved gpgpu_alloc_gpu_addr changes to previous patch (Dominik)

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/iga64_generated_codes.c | 13 ++++++++-----
 lib/iga64_macros.h          | 37 +++++++++++++++++++++++++++++++++----
 2 files changed, 41 insertions(+), 9 deletions(-)

diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
index 04015b0b6d29..a12135e7dbfd 100644
--- a/lib/iga64_generated_codes.c
+++ b/lib/iga64_generated_codes.c
@@ -3,7 +3,7 @@
 
 #include "gpgpu_shader.h"
 
-#define MD5_SUM_IGA64_ASMS da66be3cf9bec819a61429de75943011
+#define MD5_SUM_IGA64_ASMS 7b1db60d1de46cf35666f2a7f51e8fc2
 
 struct iga64_template const iga64_code_gpgpu_fill[] = {
 	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
@@ -80,10 +80,11 @@ struct iga64_template const iga64_code_gpgpu_fill[] = {
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
@@ -484,13 +485,14 @@ struct iga64_template const iga64_code_media_block_write_aip[] = {
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
@@ -612,14 +614,15 @@ struct iga64_template const iga64_code_clear_r40[] = {
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
index 40b6338928e1..f82785610207 100644
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
@@ -35,28 +42,50 @@
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
 (W)	mov (1)		dst.7<1>:ud	(width - 1):ud		;\
 
 #if GEN_VER < 2000
+
 #define SET_SHARED_SPACE_ADDR(dst, y, width) SET_SHARED_MEDIA_BLOCK_MSG_HDR(dst, y, width)
 #define SET_THREAD_SPACE_ADDR(dst, x, y, width) SET_THREAD_MEDIA_BLOCK_MSG_HDR(dst, x, y, width)
 #define LOAD_SPACE_DW(dst, src) send.dc1 (1)	dst	src	src1_null 0x0	0x2190000
 #define STORE_SPACE_DW(dst, src) send.dc1 (1)	null	dst	null	0x0	0x40A8000
+
 #else
+
 #define SET_SHARED_SPACE_ADDR(dst, y, width) SET_SHARED_MEDIA_A2DBLOCK_PAYLOAD(dst, y, width)
 #define SET_THREAD_SPACE_ADDR(dst, x, y, width) SET_THREAD_MEDIA_A2DBLOCK_PAYLOAD(dst, x, y, width)
+
+#if GEN_VER < 3000
 #define LOAD_SPACE_DW(dst, src) send.tgm (1)	dst	src	null:0	0x0	0x62100003
 #define STORE_SPACE_DW(dst, src) send.tgm (1)	null	dst	null:0	0x0	0x64000007
+#else
+#define LOAD_SPACE_DW(dst, src) send.ugm (1)	dst	src	null:0	0x0	0x2120003
+#define STORE_SPACE_DW(dst, src) send.ugm (1)	null	dst	src:1	0x0	0x2020007
+#endif
+
 #endif
 
 #endif

-- 
2.34.1

