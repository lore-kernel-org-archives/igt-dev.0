Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B64ACCD1A0
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 11:31:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2C110E1D0;
	Wed, 18 Sep 2024 11:31:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TFlgD3+l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A85410E1D0
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 11:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726659061; x=1758195061;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wZYMf6O8En5Q07NdYMl7Mqx1xvRyVwJN32kzhNawQac=;
 b=TFlgD3+l3grhhIJAnTf3YJjlkJ1LxmLdzrSXcdwGSjOuhjcRqvsJXvvx
 uETLjdAKW0nvLmF5jF7OtlSTqFv4EDOaZGi0ipUS43xqiyd4Jd7HVfVfi
 KCTOQjSsvCGZLQZ+ocsIsoEYgukA9OSqB2PQx2vrKArQIQM9g+wtf4D/7
 dsbwkHgdWWVt0nHrN5Zu4FKFieLcCpG2IFZ8l5nlXcalmFFYqXsHqCd2C
 i162QSp1xx/xNOWCJME8E2T83YWORQP2lvUQdc1JTAs77n57FQGcWqO8i
 LS1YVp6JD55kHAypANy4paL4bmWpmkG4LQ7SsJ/OC5YaVy3s+Ci1WUBcF Q==;
X-CSE-ConnectionGUID: iFF/FoXmSae1HzsZtpHoTA==
X-CSE-MsgGUID: D+COaeCjSv+AjESWtcO6Cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="28470065"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="28470065"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 04:30:50 -0700
X-CSE-ConnectionGUID: qtXxK+GJQ3OipoGbKVheiQ==
X-CSE-MsgGUID: /hw10VXqRCGY3rm50sJsoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="106972521"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.218])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 04:30:46 -0700
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
Subject: [PATCH i-g-t v7 04/16] lib/gpgpu_shader: Add set/clear exception
 register (cr0.1) helpers
Date: Wed, 18 Sep 2024 13:30:05 +0200
Message-Id: <20240918113017.144687-5-christoph.manszewski@intel.com>
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

To allow enabling and handling exceptions from shader and siplet
proper helpers should be provided.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/gpgpu_shader.c          | 28 ++++++++++++++++++++++
 lib/gpgpu_shader.h          |  2 ++
 lib/iga64_generated_codes.c | 48 ++++++++++++++++++++++++++++++++++++-
 3 files changed, 77 insertions(+), 1 deletion(-)

diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
index adf2a8fc7..f9969c5b5 100644
--- a/lib/gpgpu_shader.c
+++ b/lib/gpgpu_shader.c
@@ -634,6 +634,34 @@ void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
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
index 6c6953a1a..b722b9e50 100644
--- a/lib/gpgpu_shader.h
+++ b/lib/gpgpu_shader.h
@@ -71,6 +71,8 @@ void gpgpu_shader__common_target_write(struct gpgpu_shader *shdr,
 				       uint32_t y_offset, const uint32_t value[4]);
 void gpgpu_shader__common_target_write_u32(struct gpgpu_shader *shdr,
 				     uint32_t y_offset, uint32_t value);
+void gpgpu_shader__clear_exception(struct gpgpu_shader *shdr, uint32_t value);
+void gpgpu_shader__set_exception(struct gpgpu_shader *shdr, uint32_t value);
 void gpgpu_shader__end_system_routine(struct gpgpu_shader *shdr,
 				      bool breakpoint_suppress);
 void gpgpu_shader__end_system_routine_step_if_eq(struct gpgpu_shader *shdr,
diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
index 8f6d0c628..fe6d68b70 100644
--- a/lib/iga64_generated_codes.c
+++ b/lib/iga64_generated_codes.c
@@ -3,7 +3,7 @@
 
 #include "gpgpu_shader.h"
 
-#define MD5_SUM_IGA64_ASMS 2baa133a06ef71d0aec8edcf00b40eb5
+#define MD5_SUM_IGA64_ASMS aa5c79b36f48404f1da21d2316e9f9f3
 
 struct iga64_template const iga64_code_gpgpu_fill[] = {
 	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
@@ -277,6 +277,52 @@ struct iga64_template const iga64_code_write_on_exception[] = {
 	}}
 };
 
+struct iga64_template const iga64_code_set_exception[] = {
+	{ .gen_ver = 2000, .size = 8, .code = (const uint32_t []) {
+		0x80000966, 0x80118220, 0x02008010, 0xc0ded000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 1270, .size = 8, .code = (const uint32_t []) {
+		0x80000966, 0x80218220, 0x02008020, 0xc0ded000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 1260, .size = 8, .code = (const uint32_t []) {
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
+	{ .gen_ver = 2000, .size = 8, .code = (const uint32_t []) {
+		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 1270, .size = 8, .code = (const uint32_t []) {
+		0x80000965, 0x80218220, 0x02008020, 0xc0ded000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 1260, .size = 8, .code = (const uint32_t []) {
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
 		0x80100061, 0x04054220, 0x00000000, 0x00000000,
-- 
2.34.1

