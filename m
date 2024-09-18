Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755A6CCD1A0
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 11:30:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD6610E585;
	Wed, 18 Sep 2024 11:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a+fSKoEd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 309AE10E585
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 11:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726659046; x=1758195046;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y/fAL5AVFmAGKa25pYEuJpk1aC/EQr5sUlyulCK87lE=;
 b=a+fSKoEdl8DxLA7hYI5at3mF3hCLbnukfNTu2GF8/4thiCPTvqXD7fR5
 QVZbyddFdohLMePbgebrlGD7XinUPJgV5AdBK8Cbtq/rXFfEIX16Kw92W
 lmynEP5/8OiVZXBlEzSG1gneEgzQfMSZUn7U7udwZflFIDMDayXY29fEq
 WDzn+dwR9l41r9tNYNB1Op3IqThUwQr85j8C3o8g8IPruIJxnsBFdbwlA
 CNefBSQAHk8TIk9BSgRUUmoaTr/JWtzMjcTmtg79ikL/ZaWi65V2ign24
 zKVU9uyEp02CiFvOTpOSNRe2J1/yGuwGC6q0YisNYPr5YT5fnNjaHPjiI w==;
X-CSE-ConnectionGUID: cVZkUEGOSw2+BjPjUcZ6zg==
X-CSE-MsgGUID: L6C5GbbvS1amHh7RDAFV0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="28470053"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="28470053"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 04:30:46 -0700
X-CSE-ConnectionGUID: XWvdTWfZSty59IUU67NlRQ==
X-CSE-MsgGUID: KcWhFloMRIO6xx9eJKoUow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="106972500"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.218])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 04:30:41 -0700
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
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t v7 03/16] lib/gpgpu_shader: Add write_on_exception
 template
Date: Wed, 18 Sep 2024 13:30:04 +0200
Message-Id: <20240918113017.144687-4-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918113017.144687-1-christoph.manszewski@intel.com>
References: <20240918113017.144687-1-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/gpgpu_shader.c          | 53 ++++++++++++++++++++++
 lib/gpgpu_shader.h          |  2 +
 lib/iga64_generated_codes.c | 87 ++++++++++++++++++++++++++++++++++++-
 3 files changed, 141 insertions(+), 1 deletion(-)

diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
index 82210d17e..adf2a8fc7 100644
--- a/lib/gpgpu_shader.c
+++ b/lib/gpgpu_shader.c
@@ -634,6 +634,59 @@ void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
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
+	// Clear message header								\n\
+(W)	mov (16|M0)              r4.0<1>:ud    0x0:ud					\n\
+	// Payload									\n\
+(W)	mov (1|M0)               r5.0<1>:ud    ARG(3):ud				\n\
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
+	// Store X and Y block start (160:191 and 192:223)				\n\
+(W)	mov (2|M0)               r4.5<1>:ud    r2.0<2;2,1>:ud				\n\
+	// Store X and Y block max_size (224:231 and 232:239)				\n\
+(W)	mov (1|M0)               r4.7<1>:ud    ARG(2):ud				\n\
+#endif											\n\
+	// Check if masked exception is equal to provided value and write conditionally \n\
+(W)      and (1|M0)              r3.0<1>:ud     cr0.1<0;1,0>:ud ARG(4):ud		\n\
+(W)      mov (1|M0)              f0.0<1>:ud     0x0:ud					\n\
+(W)      cmp (1|M0)     (eq)f0.0 null:ud        r3.0<0;1,0>:ud  ARG(5):ud		\n\
+#if GEN_VER < 2000 // Media Block Write							\n\
+(W&f0.0) send.dc1 (16|M0)        null     r4   src1_null 0    0x40A8000			\n\
+#else // Typed 2D Block Store								\n\
+(W&f0.0) send.tgm (16|M0)        null     r4   null:0    0    0x64000007		\n\
+#endif											\n\
+	", 2, y_offset, 3, value, mask, expected);
+}
+
 /**
  * gpgpu_shader__end_system_routine:
  * @shdr: shader to be modified
diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
index da4ece983..6c6953a1a 100644
--- a/lib/gpgpu_shader.h
+++ b/lib/gpgpu_shader.h
@@ -79,6 +79,8 @@ void gpgpu_shader__end_system_routine_step_if_eq(struct gpgpu_shader *shdr,
 void gpgpu_shader__write_aip(struct gpgpu_shader *shdr, uint32_t y_offset);
 void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
 			       uint32_t y_offset);
+void gpgpu_shader__write_on_exception(struct gpgpu_shader *shdr, uint32_t dw,
+			       uint32_t y_offset, uint32_t mask, uint32_t value);
 void gpgpu_shader__label(struct gpgpu_shader *shdr, int label_id);
 void gpgpu_shader__jump(struct gpgpu_shader *shdr, int label_id);
 void gpgpu_shader__jump_neq(struct gpgpu_shader *shdr, int label_id,
diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
index 677599435..8f6d0c628 100644
--- a/lib/iga64_generated_codes.c
+++ b/lib/iga64_generated_codes.c
@@ -3,7 +3,7 @@
 
 #include "gpgpu_shader.h"
 
-#define MD5_SUM_IGA64_ASMS 54d633df7fd2c412209117d573392ef1
+#define MD5_SUM_IGA64_ASMS 2baa133a06ef71d0aec8edcf00b40eb5
 
 struct iga64_template const iga64_code_gpgpu_fill[] = {
 	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
@@ -192,6 +192,91 @@ struct iga64_template const iga64_code_breakpoint_suppress[] = {
 	}}
 };
 
+struct iga64_template const iga64_code_write_on_exception[] = {
+	{ .gen_ver = 2000, .size = 56, .code = (const uint32_t []) {
+		0x80100061, 0x04054220, 0x00000000, 0x00000000,
+		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
+		0x80000069, 0x02058220, 0x02000014, 0xc0ded000,
+		0x80000061, 0x02150220, 0x00000064, 0x00000000,
+		0x80001940, 0x02158220, 0x02000214, 0xc0ded001,
+		0x80041961, 0x04550220, 0x00220205, 0x00000000,
+		0x80000061, 0x04754220, 0x00000000, 0xc0ded002,
+		0x80000965, 0x03058220, 0x02008010, 0xc0ded004,
+		0x80000961, 0x30014220, 0x00000000, 0x00000000,
+		0x80001a70, 0x00018220, 0x12000304, 0xc0ded005,
+		0x84134031, 0x00000000, 0xd00e0494, 0x04000000,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 1270, .size = 60, .code = (const uint32_t []) {
+		0x80040061, 0x04054220, 0x00000000, 0x00000000,
+		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
+		0x80000069, 0x04058220, 0x02000024, 0xc0ded000,
+		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
+		0x80001940, 0x04258220, 0x02000424, 0xc0ded001,
+		0x80000061, 0x04454220, 0x00000000, 0xc0ded002,
+		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
+		0x80000965, 0x03058220, 0x02008020, 0xc0ded004,
+		0x80000961, 0x30014220, 0x00000000, 0x00000000,
+		0x80001a70, 0x00018220, 0x12000304, 0xc0ded005,
+		0x80001a01, 0x00010000, 0x00000000, 0x00000000,
+		0x81044031, 0x00000000, 0xc0000414, 0x02a00000,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 1260, .size = 56, .code = (const uint32_t []) {
+		0x80100061, 0x04054220, 0x00000000, 0x00000000,
+		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
+		0x80000069, 0x04058220, 0x02000014, 0xc0ded000,
+		0x80000061, 0x04150220, 0x00000064, 0x00000000,
+		0x80001940, 0x04158220, 0x02000414, 0xc0ded001,
+		0x80000061, 0x04254220, 0x00000000, 0xc0ded002,
+		0x80000061, 0x04450220, 0x00000054, 0x00000000,
+		0x80000965, 0x03058220, 0x02008010, 0xc0ded004,
+		0x80000961, 0x30014220, 0x00000000, 0x00000000,
+		0x80001a70, 0x00018220, 0x12000304, 0xc0ded005,
+		0x84134031, 0x00000000, 0xc0000414, 0x02a00000,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 1250, .size = 60, .code = (const uint32_t []) {
+		0x80040061, 0x04054220, 0x00000000, 0x00000000,
+		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
+		0x80000069, 0x04058220, 0x02000024, 0xc0ded000,
+		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
+		0x80001940, 0x04258220, 0x02000424, 0xc0ded001,
+		0x80000061, 0x04454220, 0x00000000, 0xc0ded002,
+		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
+		0x80000965, 0x03058220, 0x02008020, 0xc0ded004,
+		0x80000961, 0x30014220, 0x00000000, 0x00000000,
+		0x80001a70, 0x00018220, 0x12000304, 0xc0ded005,
+		0x80001a01, 0x00010000, 0x00000000, 0x00000000,
+		0x81044031, 0x00000000, 0xc0000414, 0x02a00000,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 0, .size = 56, .code = (const uint32_t []) {
+		0x80040061, 0x04054220, 0x00000000, 0x00000000,
+		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
+		0x80000069, 0x04058220, 0x02000024, 0xc0ded000,
+		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
+		0x80000140, 0x04258220, 0x02000424, 0xc0ded001,
+		0x80000061, 0x04454220, 0x00000000, 0xc0ded002,
+		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
+		0x80000165, 0x03058220, 0x02008020, 0xc0ded004,
+		0x80000161, 0x30014220, 0x00000000, 0x00000000,
+		0x80000270, 0x00018220, 0x12000304, 0xc0ded005,
+		0x8104a031, 0x00000000, 0xc0000414, 0x02a00000,
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
2.34.1

