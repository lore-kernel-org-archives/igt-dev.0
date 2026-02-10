Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35626EA3F38
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 10:24:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF6410E54A;
	Tue, 10 Feb 2026 10:24:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EVzc5QyM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3683C10E54A
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 10:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770719073; x=1802255073;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KQGMmAlGGya+FyEwvkwbnwx8zUXWr5WRwKOBiufR4mA=;
 b=EVzc5QyMw3Rg73hwhJau0EYepFDMMcOyyEYvw35K9xNkjXz0/5JfMkxl
 JDg+XaSQzx1dFn5i5OpdaxoTU0BfFiXCJbiuCLK2YFCHgJ4LoVDQ5hxDI
 AutCeN35pVR+pltFSKxR6ewwGHCchi+Xp3fODhU63MDA++V46iHSiRQvA
 K1wpGc2NVJtnMvXzlC0oOUAfR7pRE+padEZCo6YWHPmEPZlykQERO98wg
 ObEr+MC2KQS9XT4pbxdVCRvM94PgEzeSQzCPHfquwxFtRyb0czOsBqkqG
 7xqaVRu+5wPGwFvyJhqqtRQ2tOQTwgmtF1dks4LFQT9Fs4h+k3ygoqkbG Q==;
X-CSE-ConnectionGUID: am0JXviVRRyDkOkZetfvOQ==
X-CSE-MsgGUID: p3SmCqz2ScWyjKXdTg2inw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="89258157"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="89258157"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 02:24:32 -0800
X-CSE-ConnectionGUID: J7oCOn5XSOacJ3tlUpD/pA==
X-CSE-MsgGUID: yzMOxJ/NRRmfG8LFydPhfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="242499994"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 02:24:31 -0800
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: andrzej.hajda@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 1/1] lib/gpgpu_shader: set r1.4 to dim.x
Date: Tue, 10 Feb 2026 11:24:16 +0100
Message-Id: <20260210102416.2796291-2-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260210102416.2796291-1-jan.maslak@intel.com>
References: <20260210102416.2796291-1-jan.maslak@intel.com>
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

Sets up the r1.4 to contain the value of dim.x, making it accessible from
the shader.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
---
 lib/gpgpu_fill.c.gen.iga64_codes.c                | 2 +-
 lib/gpgpu_shader.c                                | 6 ++++--
 lib/gpgpu_shader.c.gen.iga64_codes.c              | 2 +-
 lib/iga64_macros.h                                | 1 +
 tests/intel/xe_eudebug_online.c.gen.iga64_codes.c | 2 +-
 5 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/lib/gpgpu_fill.c.gen.iga64_codes.c b/lib/gpgpu_fill.c.gen.iga64_codes.c
index b223425d0..15ffb6f2d 100644
--- a/lib/gpgpu_fill.c.gen.iga64_codes.c
+++ b/lib/gpgpu_fill.c.gen.iga64_codes.c
@@ -3,7 +3,7 @@
 
 #include "gpgpu_shader.h"
 
-#define MD5_SUM_IGA64_ASMS 8304c8bb11385470bfd6ac32e1c36840
+#define MD5_SUM_IGA64_ASMS b785dce133b8fcf480cd65b219b3e008
 
 struct iga64_template const iga64_code_gpgpu_fill[] = {
 	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
index 767bddb7b..abccb4808 100644
--- a/lib/gpgpu_shader.c
+++ b/lib/gpgpu_shader.c
@@ -151,13 +151,15 @@ __xelp_gpgpu_execfunc(struct intel_bb *ibb,
 }
 
 static void
-fill_inline_data(uint32_t *inline_data, uint64_t target_offset, struct intel_buf *target)
+fill_inline_data(uint32_t *inline_data, uint64_t target_offset, struct intel_buf *target,
+		 uint32_t x_dim)
 {
 	igt_assert(target->surface[0].stride == intel_buf_width(target) * target->bpp/8);
 	*inline_data++ = lower_32_bits(target_offset);
 	*inline_data++ = upper_32_bits(target_offset);
 	*inline_data++ = target->surface[0].stride;
 	*inline_data++ = intel_buf_height(target);
+	*inline_data++ = x_dim;
 }
 
 static void
@@ -206,7 +208,7 @@ __xehp_gpgpu_execfunc(struct intel_bb *ibb,
 	/* Inline data is at 31th/32th dword of COMPUTE_WALKER, BSpec: 67028 */
 	inline_data = intel_bb_ptr(ibb) + 4 * (shdr->gen_ver < 2000 ? 31 : 32);
 	xehp_emit_compute_walk(ibb, 0, 0, x_dim * 16, y_dim, &idd, 0x0);
-	fill_inline_data(inline_data, CANONICAL(target->addr.offset), target);
+	fill_inline_data(inline_data, CANONICAL(target->addr.offset), target, x_dim);
 
 	intel_bb_out(ibb, MI_BATCH_BUFFER_END);
 	intel_bb_ptr_align(ibb, 32);
diff --git a/lib/gpgpu_shader.c.gen.iga64_codes.c b/lib/gpgpu_shader.c.gen.iga64_codes.c
index fffe242fe..ee45f8263 100644
--- a/lib/gpgpu_shader.c.gen.iga64_codes.c
+++ b/lib/gpgpu_shader.c.gen.iga64_codes.c
@@ -3,7 +3,7 @@
 
 #include "gpgpu_shader.h"
 
-#define MD5_SUM_IGA64_ASMS f5d2183439f5e7b18097c3c2c2957dbb
+#define MD5_SUM_IGA64_ASMS b3ca58d01d637034cf62ec574656a2f0
 
 struct iga64_template const iga64_code_read_a64_d32[] = {
 	{ .gen_ver = 2000, .size = 40, .code = (const uint32_t []) {
diff --git a/lib/iga64_macros.h b/lib/iga64_macros.h
index 8e452cf63..76a330ab5 100644
--- a/lib/iga64_macros.h
+++ b/lib/iga64_macros.h
@@ -27,6 +27,7 @@
 #define R1_TGT_ADDRESS r1.0<0;1,0>:uq
 #define R1_TGT_WIDTH r1.2<0;1,0>:ud
 #define R1_TGT_HEIGHT r1.3<0;1,0>:ud
+#define R1_DIM_X r1.4<0;1,0>:ud
 
 #define SET_SHARED_MEDIA_BLOCK_MSG_HDR(dst, y, width)	\
 (W)	mov (8)		dst.0<1>:ud	0x0:ud		;\
diff --git a/tests/intel/xe_eudebug_online.c.gen.iga64_codes.c b/tests/intel/xe_eudebug_online.c.gen.iga64_codes.c
index 3bd5b0c5f..32009e40f 100644
--- a/tests/intel/xe_eudebug_online.c.gen.iga64_codes.c
+++ b/tests/intel/xe_eudebug_online.c.gen.iga64_codes.c
@@ -3,7 +3,7 @@
 
 #include "gpgpu_shader.h"
 
-#define MD5_SUM_IGA64_ASMS f0897ea23eff7ea77569eca6ddd16161
+#define MD5_SUM_IGA64_ASMS d8acd22fb8afb78633ac79a0ca42d8da
 
 struct iga64_template const iga64_code_store_sr0_0[] = {
 	{ .gen_ver = 2000, .size = 40, .code = (const uint32_t []) {
-- 
2.34.1

