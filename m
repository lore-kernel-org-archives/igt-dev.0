Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80D8C3DA7E
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 11:49:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7720C10E513;
	Tue, 30 Jul 2024 11:49:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="loBJK6Ma";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6D210E513
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722340141; x=1753876141;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tnEmiC4SnLz07oi60UYhsf9CrEMUTFSQRbtkneM7zCs=;
 b=loBJK6Macye8cZGf2698JFWKginiKoW623pbxfX/5fskNpbQFuYYza6h
 xI4+ouHuudNIHCkED5id8n364KCnFzzf+qtw2g4xXvp49R2SbzctkegQj
 fvvZM19bPd+H3+W0B6yf3CR2YoOGqQKIExKd+5XtT9Y4qzQu+lUDMnehI
 TVURi1XmVLH+qBQi9dx9pvDHMeT0yznPbmEpNSf54Mr87aHhDkesNOq30
 VJ5hTkMWP9oOAcf228k7tB7j89lkr78t0fikpncjlznUab3sgVxfZYraK
 szXVFWv6SaL0c+0PrfDwSrIk6wqdyeb/QX2tptvQZQFqcWYE029mragd2 g==;
X-CSE-ConnectionGUID: 1nLXJIf+QJO51XRSgjZvcw==
X-CSE-MsgGUID: UpRd0/leSkOGyzpfTNItqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23937457"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23937457"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:49:01 -0700
X-CSE-ConnectionGUID: Bc/qYkHXQe2+EkHx9Aq+GA==
X-CSE-MsgGUID: MIha6wKLRoi4zya6YbqRLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54217298"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.43])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:48:57 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: [PATCH i-g-t v2 46/66] lib/gpgpu_shader: Add write_on_exception
 template
Date: Tue, 30 Jul 2024 13:45:03 +0200
Message-Id: <20240730114523.334156-47-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240730114523.334156-1-christoph.manszewski@intel.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
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

From: Andrzej Hajda <andrzej.hajda@intel.com>

Writing specific value to memory location on unexpected value in exception
register allows to report errors from inside shader or siplet.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/gpgpu_shader.c          | 56 ++++++++++++++++++++++++++
 lib/gpgpu_shader.h          |  2 +
 lib/iga64_generated_codes.c | 79 ++++++++++++++++++++++++++++++++++++-
 3 files changed, 136 insertions(+), 1 deletion(-)

diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
index 3b16db593..a98abc57e 100644
--- a/lib/gpgpu_shader.c
+++ b/lib/gpgpu_shader.c
@@ -628,6 +628,62 @@ void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
 	", 2, y_offset, 3, value, value, value, value);
 }
 
+/**
+ * gpgpu_shader__write_on_exception:
+ * @shdr: shader to be modified
+ * @value: dword to be written
+ * @y_offset: write target offset within the surface in rows
+ * @mask: mask to be applied on exception register
+ * @expected: expected value of exception register with @mask applied
+ *
+ * Check if bits specified by @mask in exception register(cr0.1) are equal
+ * to provided ones: cr0.1 & @mask == @expected,
+ * if yes fill dword in (row, column/dword) == (tg_id_y + @y_offset, tg_id_x).
+ */
+void gpgpu_shader__write_on_exception(struct gpgpu_shader *shdr, uint32_t value,
+				      uint32_t y_offset, uint32_t mask, uint32_t expected)
+{
+	emit_iga64_code(shdr, write_on_exception, "					\n\
+	// Payload									\n\
+(W)	mov (1|M0)               r5.0<1>:ud    ARG(3):ud				\n\
+(W)	mov (1|M0)               r5.1<1>:ud    ARG(4):ud				\n\
+(W)	mov (1|M0)               r5.2<1>:ud    ARG(5):ud				\n\
+(W)	mov (1|M0)               r5.3<1>:ud    ARG(6):ud				\n\
+#if GEN_VER < 2000 // prepare Media Block Write						\n\
+	// X offset of the block in bytes := (thread group id X << ARG(0))		\n\
+(W)	shl (1|M0)               r4.0<1>:ud    r0.1<0;1,0>:ud    ARG(0):ud		\n\
+	// Y offset of the block in rows := thread group id Y				\n\
+(W)	mov (1|M0)               r4.1<1>:ud    r0.6<0;1,0>:ud				\n\
+(W)	add (1|M0)               r4.1<1>:ud    r4.1<0;1,0>:ud   ARG(1):ud		\n\
+	// block width [0,63] representing 1 to 64 bytes				\n\
+(W)	mov (1|M0)               r4.2<1>:ud    ARG(2):ud				\n\
+	// FFTID := FFTID from R0 header						\n\
+(W)	mov (1|M0)               r4.4<1>:ud    r0.5<0;1,0>:ud				\n\
+#else // prepare Typed 2D Block Store							\n\
+	// Load r2.0-3 with tg id X << ARG(0)						\n\
+(W)	shl (1|M0)               r2.0<1>:ud    r0.1<0;1,0>:ud    ARG(0):ud		\n\
+	// Load r2.4-7 with tg id Y + ARG(1):ud						\n\
+(W)	mov (1|M0)               r2.1<1>:ud    r0.6<0;1,0>:ud				\n\
+(W)	add (1|M0)               r2.1<1>:ud    r2.1<0;1,0>:ud    ARG(1):ud		\n\
+	// payload setup								\n\
+(W)	mov (16|M0)              r4.0<1>:ud    0x0:ud					\n\
+	// Store X and Y block start (160:191 and 192:223)				\n\
+(W)	mov (2|M0)               r4.5<1>:ud    r2.0<2;2,1>:ud				\n\
+	// Store X and Y block max_size (224:231 and 232:239)				\n\
+(W)	mov (1|M0)               r4.7<1>:ud    ARG(2):ud				\n\
+#endif											\n\
+	// Check if masked exception is equal to provided value and write conditionally \n\
+(W)      and (1|M0)              r3.0<1>:ud     cr0.1<0;1,0>:ud ARG(7):ud		\n\
+(W)      mov (1|M0)              f0.0<1>:ud     0x0:ud					\n\
+(W)      cmp (1|M0)     (eq)f0.0 null:ud        r3.0<0;1,0>:ud  ARG(8):ud		\n\
+#if GEN_VER < 2000 // Media Block Write							\n\
+(W&f0.0) send.dc1 (16|M0)        null     r4   src1_null 0    0x40A8000			\n\
+#else // Typed 2D Block Store								\n\
+(W&f0.0) send.tgm (16|M0)        null     r4   null:0    0    0x64000007		\n\
+#endif											\n\
+	", 2, y_offset, 3, value, value, value, value, mask, expected);
+}
+
 /**
  * gpgpu_shader__end_system_routine:
  * @shdr: shader to be modified
diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
index e4ca0be4c..76ff4989e 100644
--- a/lib/gpgpu_shader.h
+++ b/lib/gpgpu_shader.h
@@ -74,6 +74,8 @@ void gpgpu_shader__end_system_routine_step_if_eq(struct gpgpu_shader *shdr,
 void gpgpu_shader__write_aip(struct gpgpu_shader *shdr, uint32_t y_offset);
 void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
 			       uint32_t y_offset);
+void gpgpu_shader__write_on_exception(struct gpgpu_shader *shdr, uint32_t dw,
+			       uint32_t y_offset, uint32_t mask, uint32_t value);
 void gpgpu_shader__label(struct gpgpu_shader *shdr, int label_id);
 void gpgpu_shader__jump(struct gpgpu_shader *shdr, int label_id);
 void gpgpu_shader__jump_neq(struct gpgpu_shader *shdr, int label_id,
diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
index fea436dee..71429d442 100644
--- a/lib/iga64_generated_codes.c
+++ b/lib/iga64_generated_codes.c
@@ -3,7 +3,7 @@
 
 #include "gpgpu_shader.h"
 
-#define MD5_SUM_IGA64_ASMS 61a15534954fe7c6bd0e983fbfd54c27
+#define MD5_SUM_IGA64_ASMS 88529cc180578939c0b8c4bb29da7db6
 
 struct iga64_template const iga64_code_end_system_routine_step_if_eq[] = {
 	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
@@ -93,6 +93,83 @@ struct iga64_template const iga64_code_breakpoint_suppress[] = {
 	}}
 };
 
+struct iga64_template const iga64_code_write_on_exception[] = {
+	{ .gen_ver = 2000, .size = 68, .code = (const uint32_t []) {
+		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
+		0x80000061, 0x05154220, 0x00000000, 0xc0ded004,
+		0x80000061, 0x05254220, 0x00000000, 0xc0ded005,
+		0x80000061, 0x05354220, 0x00000000, 0xc0ded006,
+		0x80000069, 0x02058220, 0x02000014, 0xc0ded000,
+		0x80000061, 0x02150220, 0x00000064, 0x00000000,
+		0x80001940, 0x02158220, 0x02000214, 0xc0ded001,
+		0x80100061, 0x04054220, 0x00000000, 0x00000000,
+		0x80041a61, 0x04550220, 0x00220205, 0x00000000,
+		0x80000061, 0x04754220, 0x00000000, 0xc0ded002,
+		0x80000965, 0x03058220, 0x02008010, 0xc0ded007,
+		0x80000961, 0x30014220, 0x00000000, 0x00000000,
+		0x80001a70, 0x00018220, 0x12000304, 0xc0ded008,
+		0x84134031, 0x00000000, 0xd00e0494, 0x04000000,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 1272, .size = 64, .code = (const uint32_t []) {
+		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
+		0x80000061, 0x05154220, 0x00000000, 0xc0ded004,
+		0x80000061, 0x05254220, 0x00000000, 0xc0ded005,
+		0x80000061, 0x05354220, 0x00000000, 0xc0ded006,
+		0x80000069, 0x04058220, 0x02000014, 0xc0ded000,
+		0x80000061, 0x04150220, 0x00000064, 0x00000000,
+		0x80001940, 0x04158220, 0x02000414, 0xc0ded001,
+		0x80000061, 0x04254220, 0x00000000, 0xc0ded002,
+		0x80000061, 0x04450220, 0x00000054, 0x00000000,
+		0x80000965, 0x03058220, 0x02008010, 0xc0ded007,
+		0x80000961, 0x30014220, 0x00000000, 0x00000000,
+		0x80001a70, 0x00018220, 0x12000304, 0xc0ded008,
+		0x84134031, 0x00000000, 0xc0000414, 0x02a00000,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 1250, .size = 68, .code = (const uint32_t []) {
+		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
+		0x80000061, 0x05254220, 0x00000000, 0xc0ded004,
+		0x80000061, 0x05454220, 0x00000000, 0xc0ded005,
+		0x80000061, 0x05654220, 0x00000000, 0xc0ded006,
+		0x80000069, 0x04058220, 0x02000024, 0xc0ded000,
+		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
+		0x80001940, 0x04258220, 0x02000424, 0xc0ded001,
+		0x80000061, 0x04454220, 0x00000000, 0xc0ded002,
+		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
+		0x80000965, 0x03058220, 0x02008020, 0xc0ded007,
+		0x80000961, 0x30014220, 0x00000000, 0x00000000,
+		0x80001a70, 0x00018220, 0x12000304, 0xc0ded008,
+		0x80001a01, 0x00010000, 0x00000000, 0x00000000,
+		0x81044031, 0x00000000, 0xc0000414, 0x02a00000,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 0, .size = 64, .code = (const uint32_t []) {
+		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
+		0x80000061, 0x05254220, 0x00000000, 0xc0ded004,
+		0x80000061, 0x05454220, 0x00000000, 0xc0ded005,
+		0x80000061, 0x05654220, 0x00000000, 0xc0ded006,
+		0x80000069, 0x04058220, 0x02000024, 0xc0ded000,
+		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
+		0x80000140, 0x04258220, 0x02000424, 0xc0ded001,
+		0x80000061, 0x04454220, 0x00000000, 0xc0ded002,
+		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
+		0x80000165, 0x03058220, 0x02008020, 0xc0ded007,
+		0x80000161, 0x30014220, 0x00000000, 0x00000000,
+		0x80000270, 0x00018220, 0x12000304, 0xc0ded008,
+		0x8104a031, 0x00000000, 0xc0000414, 0x02a00000,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000101, 0x00010000, 0x00000000, 0x00000000,
+	}}
+};
+
 struct iga64_template const iga64_code_media_block_write[] = {
 	{ .gen_ver = 2000, .size = 56, .code = (const uint32_t []) {
 		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
-- 
2.34.1

