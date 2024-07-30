Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66059C3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 11:49:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27B8B10E514;
	Tue, 30 Jul 2024 11:49:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QML6KMaF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC3A10E514
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722340144; x=1753876144;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aFbPGxFWccxOPddD2bvl84OLlIgHoKgVZeAXJZiztYA=;
 b=QML6KMaF45HuMShIVbt6bAe5qCTZ0+YEwgWcGnC8anE1VcobcHfbUhkp
 e7JldLb8Ws2JY4qAK0334IPLRCutLVO4ixzBMSUPup2jejh+hSJtfoBwg
 NMC0HQOb5pATP7OGfBSwuQIkvldDcFojIFDudVC8+P54fn3chbraflER/
 1emOo6O+uz9zmx7SSx/mbVYTt/NYIbPL8Q3w4u+B26QzJWnbiMsb0/nPz
 F3YzYH7bhpNHn2rHx1WGqL8md+RePz4OP83tYFN/p8B1yHkZlzAsW6pZg
 w8YMBg3BBm2M2lkQdFD2yM9cY8EH/eZapWljIBd7qggmrb89HVF/YC3xB g==;
X-CSE-ConnectionGUID: NLZTkUEoSlafsU+6v9l5cw==
X-CSE-MsgGUID: olo1aV+PRQ2yFrZdY1TCCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23937467"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23937467"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:49:04 -0700
X-CSE-ConnectionGUID: VgWV4mn0RmC2bopUnDeUYg==
X-CSE-MsgGUID: etan5YNPQJqCTpNUXemaIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54217328"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.43])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:49:00 -0700
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
Subject: [PATCH i-g-t v2 47/66] lib/gpgpu_shader: Add set/clear exception
 register (cr0.1) helpers
Date: Tue, 30 Jul 2024 13:45:04 +0200
Message-Id: <20240730114523.334156-48-christoph.manszewski@intel.com>
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

To allow enabling and handling exceptions from shader and siplet
proper helpers should be provided.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/gpgpu_shader.c          | 28 ++++++++++++++++++++++++++++
 lib/gpgpu_shader.h          |  2 ++
 lib/iga64_generated_codes.c | 32 +++++++++++++++++++++++++++++++-
 3 files changed, 61 insertions(+), 1 deletion(-)

diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
index a98abc57e..40161c52b 100644
--- a/lib/gpgpu_shader.c
+++ b/lib/gpgpu_shader.c
@@ -628,6 +628,34 @@ void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
 	", 2, y_offset, 3, value, value, value, value);
 }
 
+/**
+ * gpgpu_shader__clear_exception:
+ * @shdr: shader to be modified
+ * @value: exception bits to be cleared
+ *
+ * Clear provided bits in exception register: cr0.1 &= ~value.
+ */
+void gpgpu_shader__clear_exception(struct gpgpu_shader *shdr, uint32_t value)
+{
+	emit_iga64_code(shdr, clear_exception, "		\n\
+(W)	and (1|M0) cr0.1<1>:ud cr0.1<0;1,0>:ud ARG(0):ud	\n\
+	", ~value);
+}
+
+/**
+ * gpgpu_shader__set_exception:
+ * @shdr: shader to be modified
+ * @value: exception bits to be set
+ *
+ * Set provided bits in exception register: cr0.1 |= value.
+ */
+void gpgpu_shader__set_exception(struct gpgpu_shader *shdr, uint32_t value)
+{
+	emit_iga64_code(shdr, set_exception, "		\n\
+(W)	or (1|M0) cr0.1<1>:ud cr0.1<0;1,0>:ud ARG(0):ud	\n\
+	", value);
+}
+
 /**
  * gpgpu_shader__write_on_exception:
  * @shdr: shader to be modified
diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
index 76ff4989e..0bbeae66f 100644
--- a/lib/gpgpu_shader.h
+++ b/lib/gpgpu_shader.h
@@ -66,6 +66,8 @@ void gpgpu_shader__common_target_write(struct gpgpu_shader *shdr,
 				       uint32_t y_offset, const uint32_t value[4]);
 void gpgpu_shader__common_target_write_u32(struct gpgpu_shader *shdr,
 				     uint32_t y_offset, uint32_t value);
+void gpgpu_shader__clear_exception(struct gpgpu_shader *shdr, uint32_t value);
+void gpgpu_shader__set_exception(struct gpgpu_shader *shdr, uint32_t value);
 void gpgpu_shader__end_system_routine(struct gpgpu_shader *shdr,
 				      bool breakpoint_suppress);
 void gpgpu_shader__end_system_routine_step_if_eq(struct gpgpu_shader *shdr,
diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
index 71429d442..2cba1b315 100644
--- a/lib/iga64_generated_codes.c
+++ b/lib/iga64_generated_codes.c
@@ -3,7 +3,7 @@
 
 #include "gpgpu_shader.h"
 
-#define MD5_SUM_IGA64_ASMS 88529cc180578939c0b8c4bb29da7db6
+#define MD5_SUM_IGA64_ASMS 6cfe013e2a99076bcdf69ecdbf4333cf
 
 struct iga64_template const iga64_code_end_system_routine_step_if_eq[] = {
 	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
@@ -170,6 +170,36 @@ struct iga64_template const iga64_code_write_on_exception[] = {
 	}}
 };
 
+struct iga64_template const iga64_code_set_exception[] = {
+	{ .gen_ver = 1272, .size = 8, .code = (const uint32_t []) {
+		0x80000966, 0x80118220, 0x02008010, 0xc0ded000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 1250, .size = 8, .code = (const uint32_t []) {
+		0x80000966, 0x80218220, 0x02008020, 0xc0ded000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 0, .size = 8, .code = (const uint32_t []) {
+		0x80000166, 0x80218220, 0x02008020, 0xc0ded000,
+		0x80000101, 0x00010000, 0x00000000, 0x00000000,
+	}}
+};
+
+struct iga64_template const iga64_code_clear_exception[] = {
+	{ .gen_ver = 1272, .size = 8, .code = (const uint32_t []) {
+		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 1250, .size = 8, .code = (const uint32_t []) {
+		0x80000965, 0x80218220, 0x02008020, 0xc0ded000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 0, .size = 8, .code = (const uint32_t []) {
+		0x80000165, 0x80218220, 0x02008020, 0xc0ded000,
+		0x80000101, 0x00010000, 0x00000000, 0x00000000,
+	}}
+};
+
 struct iga64_template const iga64_code_media_block_write[] = {
 	{ .gen_ver = 2000, .size = 56, .code = (const uint32_t []) {
 		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
-- 
2.34.1

