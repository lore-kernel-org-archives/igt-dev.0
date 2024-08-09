Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46125C52D7C
	for <igt-dev@archiver.kernel.org>; Fri,  9 Aug 2024 12:39:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0486E10E8F7;
	Fri,  9 Aug 2024 12:39:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kVgoUJla";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EAF110E8F7
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Aug 2024 12:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723207173; x=1754743173;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IBFZ7TE/i7p+R9jmfKt9mQ5JeCsSugLEF3QLDV+/0Go=;
 b=kVgoUJlaVnPfCu6UdHrjXv4UdaOKMZz/jjYdFyL9XNKSD2vZzcCQboih
 RH9l1a5sz8y/LRWvvjXHjJgRgQuL2HGlv8GQcOElfbCm6G9pLGpHc9il2
 1qTvFFmiXB0ig7JrFDHz6bwpGAO8eUIRUyZAW6aidqW2ytmeNFEmyHGao
 53PzFzusTcHGVB7uKOoaWvqHDoPLAJPcRHp9Gsg7I8qpyuhdRT0LVBrb9
 enmQ1wF9R8guOeQxlwoN2aLA4f/WTydBHyoysIx5HurjCjShzNqPHURLw
 CYox8srYSLinG5iYI7krdyIy+kpNJh6DR7Spes/LTpMgNESvp/GSuwrQN Q==;
X-CSE-ConnectionGUID: Ho3Z8OG+TFOhzvrY+GO+OQ==
X-CSE-MsgGUID: D+7jp8/CQ4GYmcYNnWG2Cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="32525452"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="32525452"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 05:39:33 -0700
X-CSE-ConnectionGUID: Zs8eN2DKQe+3WcrworfI/Q==
X-CSE-MsgGUID: 3IQCxv9uRjy6GH9syJ24Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="57761494"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.4])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 05:39:30 -0700
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
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t v3 08/14] lib/gpgpu_shader: Add set/clear exception
 register (cr0.1) helpers
Date: Fri,  9 Aug 2024 14:38:07 +0200
Message-Id: <20240809123813.109365-9-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240809123813.109365-1-christoph.manszewski@intel.com>
References: <20240809123813.109365-1-christoph.manszewski@intel.com>
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
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
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

