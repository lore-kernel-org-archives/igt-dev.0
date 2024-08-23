Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34EE5C52D7C
	for <igt-dev@archiver.kernel.org>; Fri, 23 Aug 2024 18:23:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A8810E4B8;
	Fri, 23 Aug 2024 18:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OetYB/qe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93FB110E4B8
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Aug 2024 18:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724437384; x=1755973384;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OlUm22D3coaibg5BQQ3v7xnJJgYj8RcMu9/DPf3Oy3k=;
 b=OetYB/qefiljonOo5z02/2HaLmdcyq6Osa7AVf7vBtaV6JaSSyzR04nZ
 Vw99l6vo4cWBdtuVqxSu6w4TSLfaRs1taRLH+Xp+MklexhY+So2bIA6aa
 7KBWYF5A3EAq+4WtCTvRs3QAzHUp8saEz6dc8fD7BLO03566xclHaRiMX
 v1IUo1H/dgX2QrZ7OQ5TYmiTKCpJN7IuSST2s+kub2wSaJUWknGMYwW8U
 qUfLPMr2rnTORgMbIYlrcKhu8X3dWJC6W2SKOJDGGwfQDhUljJB5wcKbI
 h6sTnZWh9TeaxetdjrWTTl+BTzK2gd19A5BJ7m549s7hn1cEyNhHKdsa3 w==;
X-CSE-ConnectionGUID: wC37dFxdQMuNiW6PsBHQZA==
X-CSE-MsgGUID: 0BKOWPSPSeCZw0vaPwNQgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="34079283"
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; d="scan'208";a="34079283"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 11:23:03 -0700
X-CSE-ConnectionGUID: hVk8XCXfSB6q0h4MtVufDQ==
X-CSE-MsgGUID: HJC3Qq+mRAKvzDSbtwYt4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; d="scan'208";a="92606076"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.10])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 11:22:59 -0700
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
Subject: [PATCH i-g-t v4 06/17] lib/gpgpu_shader: Add set/clear exception
 register (cr0.1) helpers
Date: Fri, 23 Aug 2024 20:22:11 +0200
Message-Id: <20240823182222.305965-7-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240823182222.305965-1-christoph.manszewski@intel.com>
References: <20240823182222.305965-1-christoph.manszewski@intel.com>
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
 lib/gpgpu_shader.c          | 28 ++++++++++++++++++++++
 lib/gpgpu_shader.h          |  2 ++
 lib/iga64_generated_codes.c | 48 ++++++++++++++++++++++++++++++++++++-
 3 files changed, 77 insertions(+), 1 deletion(-)

diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
index 920db0be2..1616c1942 100644
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
index 695e921fa..b9d1f6f0a 100644
--- a/lib/iga64_generated_codes.c
+++ b/lib/iga64_generated_codes.c
@@ -3,7 +3,7 @@
 
 #include "gpgpu_shader.h"
 
-#define MD5_SUM_IGA64_ASMS 872801f6be6b8c5141d85b9d5eb466cd
+#define MD5_SUM_IGA64_ASMS ff21151a5dd5398ffc2e0404e9b6f605
 
 struct iga64_template const iga64_code_end_system_routine_step_if_eq[] = {
 	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
@@ -218,6 +218,52 @@ struct iga64_template const iga64_code_write_on_exception[] = {
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

