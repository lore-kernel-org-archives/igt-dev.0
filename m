Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549AEC52D7B
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 13:05:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 074AB10E46D;
	Wed, 14 Aug 2024 13:05:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aFsnO71V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BFEE10E46D
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2024 13:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723640733; x=1755176733;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+T/IlwD2a4oeIvGLuoLXs0Xfw1TfCJ8K+znfJ4zCek4=;
 b=aFsnO71V5GrE3UJEEooa5rMKEZ0GJtp99bkysV6TzRME06JLJBCoWOH/
 WkPnCkqnufO3JaPxWxLR/xRUxiG3JY5wj5EarDtqJp0RkKHTQ0/xJMnxY
 abO976hk+oSMu2ezdGFRrHZHoU831VtTPPFJJMzlHPrbSOvw5ORIewYJe
 ydBGmNjEfQUekcmeadVa86zM898RmYXTPl38g9/H//MQd2JkzRsVjSiEb
 RTLEm9bNQP7FSFF+H1a84jN29zf1NwDLJ/rF3NS4ruQo41+1378x9tjAf
 kT4ICLbGkqAEO5Sd7azyi2GKpnG7jz1yu0GEHfwnJjKWYIZULtYnOZJe5 Q==;
X-CSE-ConnectionGUID: ZsYbyMZ2SuGQg08sBAYiKQ==
X-CSE-MsgGUID: tf9T4/8URkKK92Bynq2psw==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="32430618"
X-IronPort-AV: E=Sophos;i="6.10,145,1719903600"; d="scan'208";a="32430618"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 06:05:33 -0700
X-CSE-ConnectionGUID: PIdxA3DTRAeFl6kSNDeC1w==
X-CSE-MsgGUID: I+7utytHR/6jsOkDlVNu2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,145,1719903600"; d="scan'208";a="58979022"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO dgrzegor-mobl2..)
 ([10.245.246.86])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 06:05:31 -0700
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH i-g-t v2] lib/gpgpu_shader: Fix compilation warning and write
 dword shader
Date: Wed, 14 Aug 2024 15:04:23 +0200
Message-Id: <20240814130423.1140740-1-dominik.grzegorzek@intel.com>
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

1) Fix src1_null macro definition to match platforms which are mentioned in
the comment above the declaration. (DG2+)

Fixes:
iga64 -Xauto-deps -Wall -p=12p71 lib/iga64_generated_codes.c.d/iga64_assembly_eot.12p71.asm
line 2.37: warning: Src1.Length should suffix src1 register (e.g. r10:4)
(W) send.gtwy (8|M0) null r112 null 0 0x02000000 {EOT}
                                    ^
2) Zero out r4 register in media block write message to prevent
   errors when the same register was used earlier in the shader.

v2: clear r4 before setting r5 (with small grfs the instruction also clears r5)

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/gpgpu_shader.c          |  4 ++--
 lib/iga64_generated_codes.c | 18 +++++++++++-------
 lib/iga64_macros.h          |  2 +-
 3 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
index 991455c49..80bad342a 100644
--- a/lib/gpgpu_shader.c
+++ b/lib/gpgpu_shader.c
@@ -281,6 +281,8 @@ void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
 			       uint32_t y_offset)
 {
 	emit_iga64_code(shdr, media_block_write, "				\n\
+	// Clear message header							\n\
+(W)	mov (16|M0)              r4.0<1>:ud    0x0:ud				\n\
 	// Payload								\n\
 (W)	mov (1|M0)               r5.0<1>:ud    ARG(3):ud			\n\
 (W)	mov (1|M0)               r5.1<1>:ud    ARG(4):ud			\n\
@@ -303,8 +305,6 @@ void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
 	// Load r2.4-7 with tg id Y + ARG(1):ud					\n\
 (W)	mov (1|M0)               r2.1<1>:ud    r0.6<0;1,0>:ud			\n\
 (W)	add (1|M0)               r2.1<1>:ud    r2.1<0;1,0>:ud    ARG(1):ud	\n\
-	// payload setup							\n\
-(W)	mov (16|M0)              r4.0<1>:ud    0x0:ud				\n\
 	// Store X and Y block start (160:191 and 192:223)			\n\
 (W)	mov (2|M0)               r4.5<1>:ud    r2.0<2;2,1>:ud			\n\
 	// Store X and Y block max_size (224:231 and 232:239)			\n\
diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
index 6a08c4844..87270bb46 100644
--- a/lib/iga64_generated_codes.c
+++ b/lib/iga64_generated_codes.c
@@ -3,10 +3,11 @@
 
 #include "gpgpu_shader.h"
 
-#define MD5_SUM_IGA64_ASMS 2c503cbfbd7b3043e9a52188ae4da7a8
+#define MD5_SUM_IGA64_ASMS 96abf1aa2d0cc900ebba8203cefdd30c
 
 struct iga64_template const iga64_code_media_block_write[] = {
 	{ .gen_ver = 2000, .size = 56, .code = (const uint32_t []) {
+		0x80100061, 0x04054220, 0x00000000, 0x00000000,
 		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
 		0x80000061, 0x05154220, 0x00000000, 0xc0ded004,
 		0x80000061, 0x05254220, 0x00000000, 0xc0ded005,
@@ -14,15 +15,15 @@ struct iga64_template const iga64_code_media_block_write[] = {
 		0x80000069, 0x02058220, 0x02000014, 0xc0ded000,
 		0x80000061, 0x02150220, 0x00000064, 0x00000000,
 		0x80001940, 0x02158220, 0x02000214, 0xc0ded001,
-		0x80100061, 0x04054220, 0x00000000, 0x00000000,
-		0x80041a61, 0x04550220, 0x00220205, 0x00000000,
+		0x80041961, 0x04550220, 0x00220205, 0x00000000,
 		0x80000061, 0x04754220, 0x00000000, 0xc0ded002,
 		0x80132031, 0x00000000, 0xd00e0494, 0x04000000,
 		0x80000001, 0x00010000, 0x20000000, 0x00000000,
 		0x80000001, 0x00010000, 0x30000000, 0x00000000,
 		0x80000901, 0x00010000, 0x00000000, 0x00000000,
 	}},
-	{ .gen_ver = 1270, .size = 56, .code = (const uint32_t []) {
+	{ .gen_ver = 1270, .size = 60, .code = (const uint32_t []) {
+		0x80040061, 0x04054220, 0x00000000, 0x00000000,
 		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
 		0x80000061, 0x05254220, 0x00000000, 0xc0ded004,
 		0x80000061, 0x05454220, 0x00000000, 0xc0ded005,
@@ -38,7 +39,8 @@ struct iga64_template const iga64_code_media_block_write[] = {
 		0x80000001, 0x00010000, 0x30000000, 0x00000000,
 		0x80000901, 0x00010000, 0x00000000, 0x00000000,
 	}},
-	{ .gen_ver = 1260, .size = 52, .code = (const uint32_t []) {
+	{ .gen_ver = 1260, .size = 56, .code = (const uint32_t []) {
+		0x80100061, 0x04054220, 0x00000000, 0x00000000,
 		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
 		0x80000061, 0x05154220, 0x00000000, 0xc0ded004,
 		0x80000061, 0x05254220, 0x00000000, 0xc0ded005,
@@ -53,7 +55,8 @@ struct iga64_template const iga64_code_media_block_write[] = {
 		0x80000001, 0x00010000, 0x30000000, 0x00000000,
 		0x80000901, 0x00010000, 0x00000000, 0x00000000,
 	}},
-	{ .gen_ver = 1250, .size = 56, .code = (const uint32_t []) {
+	{ .gen_ver = 1250, .size = 60, .code = (const uint32_t []) {
+		0x80040061, 0x04054220, 0x00000000, 0x00000000,
 		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
 		0x80000061, 0x05254220, 0x00000000, 0xc0ded004,
 		0x80000061, 0x05454220, 0x00000000, 0xc0ded005,
@@ -69,7 +72,8 @@ struct iga64_template const iga64_code_media_block_write[] = {
 		0x80000001, 0x00010000, 0x30000000, 0x00000000,
 		0x80000901, 0x00010000, 0x00000000, 0x00000000,
 	}},
-	{ .gen_ver = 0, .size = 52, .code = (const uint32_t []) {
+	{ .gen_ver = 0, .size = 56, .code = (const uint32_t []) {
+		0x80040061, 0x04054220, 0x00000000, 0x00000000,
 		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
 		0x80000061, 0x05254220, 0x00000000, 0xc0ded004,
 		0x80000061, 0x05454220, 0x00000000, 0xc0ded005,
diff --git a/lib/iga64_macros.h b/lib/iga64_macros.h
index f4ef5cb16..03cc726d4 100644
--- a/lib/iga64_macros.h
+++ b/lib/iga64_macros.h
@@ -7,7 +7,7 @@
 #define IGA64_MACROS_H
 
 /* send instruction for DG2+ requires 0 length in case src1 is null, BSpec: 47443 */
-#if GEN_VER < 1271
+#if GEN_VER <= 1250
 #define src1_null null
 #else
 #define src1_null null:0
-- 
2.34.1

