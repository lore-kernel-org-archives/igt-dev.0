Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C933C71136
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 16:37:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365CE10E3E6;
	Tue, 17 Jun 2025 16:37:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iuIRtJra";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8037410E778
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 16:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750178263; x=1781714263;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=rBdrUaI7VTHJvBA6X9bDnhwJcBO80LNuVYuXZcd30cY=;
 b=iuIRtJraGZvKyU2UQa0E91GX9Pt5yWevCFm9CChHNqgK4wCxePeFqtiv
 YtNfw0w3h0JPXv5ZIkHFUyheD+YdrJ8kOppuIv8OZJ2XrG+xyDfunM1pn
 vNQvy1K9RnuVuofC3+gDhSVUOPH87MaPnGKw5HFX2rNVp5hUsldo8L21K
 IxfGb7XHpZNtIvDO95ZknGkr6iXyoJeTzuXrQMhh7qmrAOfUU9E/NPmXv
 yPxrmNR/EzuFN/FfOEoJE4U1ba5qpvTBB8I9hPgsOQPHl4/J71heg3gYA
 rMzk3QitWDSq6EFoy+6TeNMTqb0A+b5fNif5iMnye4rQyV7aTa5c0c6ky A==;
X-CSE-ConnectionGUID: PeqGxtb5SQm6mtHfFpwBfA==
X-CSE-MsgGUID: PiqVDAC0Rc+uRcpeibieNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="69938111"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="69938111"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 09:37:42 -0700
X-CSE-ConnectionGUID: YniHZlqrRpCXrBWLTKVEvw==
X-CSE-MsgGUID: Q3mos0ziToaePkGpM2ZjsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="148750524"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 09:37:41 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Tue, 17 Jun 2025 18:36:07 +0200
Subject: [PATCH v3] lib/meson: refactor GPGPU assembly build process
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-refactor_gpgpu_asms-v3-1-c06612e31be2@intel.com>
X-B4-Tracking: v=1; b=H4sIAHaZUWgC/33NSwqDMBgE4KtI1k3Jw6h01XuUInn80UCNkqi0i
 Hdv4spF6XJg5psNRQgOIroVGwqwuuhGnwK/FEj30neAnUkZMcIEEazBAazU8xjabuqmpZVxiNg
 YYRU1ddOUHKXllErufaiPZ8pKRsAqSK/7bC1TzK3exeR8juuV5u7/l5ViirmoDVheCkHg7vwMr
 6seB5RfVnYyOPltsGRUxGplRMmkrc7Gvu9fKmRMXRABAAA=
X-Change-ID: 20250528-refactor_gpgpu_asms-dd5fb1d78843
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14848;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=rBdrUaI7VTHJvBA6X9bDnhwJcBO80LNuVYuXZcd30cY=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBoUZmmmT9VURGJWMvfNyEuxforw0ZQmv8dKX/nC
 UajjgjwDv6JAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaFGZpgAKCRAjYrKT3hD9
 1xRMC/9OxuFbn4HKZkCE3aCuv73EXc0QAl7CFNTxc43CIxI52OEiibxG9RSsCxlMpf7Qvc3tev1
 yqiTBbNhUHN/tL3m/jWDgMbrB6Y0ZbSI5ISrYn1rbn97rzknNBnlLyJg71HdiNDLeecR73/2QeC
 GmJ+F6MTDjZ8mPh1Llyk8jrnJt1jQwSZsUart0DjO6YIT+uyez17zWZu0yOFKmh8QMaY9Lz1t9q
 OTFvC3vxMPShPfJTGt0yGD0g192uidDeh2obqZpqfGr55PBO7h5+Uny4dkKIsvb5JU6rVWBTSix
 szBY6bdzPNheZfiaESjygy870ixblN/RyRb1+6j6q9QKkDRjTmmpU3rtRMCrLLdPH4kE7p90gAS
 tYAb6P6X+4feRarrQmtsdY4zHGYG6EzdBxSVadWgE83ZbfAcka2NMj2L8EfYFgp3xKdbP56TpHy
 1BKemXJ6h5ROgl/dWUV+A+AW76t7naUa8MhJf07lvbmgenBH8I5AdPyN28JdRvpDScvZE=
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

GPGPU inline assembly was build into one big code file
inside libigt library. This approach has few drawbacks:

1. Only files from the library can contain assembly.
2. Change of one assembly chunk results in re-build of
all chunks.
3. Most shaders lands in lib/gpgpu_shader.c.

With this change assembly codes are generated and stored
in files relative to files containing asms. For example
lib/gpgpu_shader.c will have codes in
lib/gpgpu_shader.c.gen.iga64_codes.c
It will allow to move asms specific for particular test
into the test files, instead of putting all of them into
lib/gpgpu_shader.c. In result, GPGPU fill assemblies will
be sparated into new one.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
Changes in v3:
- the patch is the same as v1, just IGT contains newer meson
- Link to v2: https://lore.kernel.org/r/20250530-refactor_gpgpu_asms-v2-1-60fcbd542af6@intel.com

Changes in v2:
- removed console property - old meson does not like it,
  it is harmless, just build process will not be smooth,
  asm compilation output will be buffered before printing
- Link to v1: https://lore.kernel.org/r/20250528-refactor_gpgpu_asms-v1-1-357def34550e@intel.com
---
 lib/gpgpu_fill.c.gen.iga64_codes.c                 | 80 ++++++++++++++++++++++
 ...ed_codes.c => gpgpu_shader.c.gen.iga64_codes.c} | 76 +-------------------
 lib/meson.build                                    | 40 ++++++-----
 scripts/generate_iga64_codes                       | 14 ++--
 4 files changed, 112 insertions(+), 98 deletions(-)

diff --git a/lib/gpgpu_fill.c.gen.iga64_codes.c b/lib/gpgpu_fill.c.gen.iga64_codes.c
new file mode 100644
index 0000000000000000000000000000000000000000..b223425d049a51096a2314a759d238af6887b2b9
--- /dev/null
+++ b/lib/gpgpu_fill.c.gen.iga64_codes.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: MIT
+// Generated using Intel Graphics Assembler 1.1.0-int
+
+#include "gpgpu_shader.h"
+
+#define MD5_SUM_IGA64_ASMS 8304c8bb11385470bfd6ac32e1c36840
+
+struct iga64_template const iga64_code_gpgpu_fill[] = {
+	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
+		0x00080061, 0x01050000, 0x00000104, 0x00000000,
+		0x00000069, 0x02058220, 0x02000014, 0x00000004,
+		0x00000061, 0x02150220, 0x00000064, 0x00000000,
+		0x000c0061, 0x04054220, 0x00000000, 0x00000000,
+		0x00101c61, 0x05050220, 0x00000104, 0x00000000,
+		0x00041b61, 0x04550220, 0x00220205, 0x00000000,
+		0x00000061, 0x04754550, 0x00000000, 0x000f000f,
+		0x00132031, 0x00000000, 0xd00e0494, 0x04000000,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 1270, .size = 52, .code = (const uint32_t []) {
+		0x00020061, 0x01050000, 0x00000104, 0x00000000,
+		0x00000069, 0x02058220, 0x02000024, 0x00000004,
+		0x00000061, 0x02250220, 0x000000c4, 0x00000000,
+		0x00030061, 0x04054220, 0x00000000, 0x00000000,
+		0x00041c61, 0x05050220, 0x00000104, 0x00000000,
+		0x00011b61, 0x04050220, 0x00220205, 0x00000000,
+		0x00000061, 0x04454220, 0x00000000, 0x0000000f,
+		0x00000061, 0x04850220, 0x000000a4, 0x00000000,
+		0x80001901, 0x00010000, 0x00000000, 0x00000000,
+		0x00044031, 0x00000000, 0xc0000414, 0x02a00000,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 1260, .size = 48, .code = (const uint32_t []) {
+		0x00080061, 0x01050000, 0x00000104, 0x00000000,
+		0x00000069, 0x02058220, 0x02000014, 0x00000004,
+		0x00000061, 0x02150220, 0x00000064, 0x00000000,
+		0x000c0061, 0x04054220, 0x00000000, 0x00000000,
+		0x00101c61, 0x05050220, 0x00000104, 0x00000000,
+		0x00041b61, 0x04050220, 0x00220205, 0x00000000,
+		0x00000061, 0x04254220, 0x00000000, 0x0000000f,
+		0x00000061, 0x04450220, 0x00000054, 0x00000000,
+		0x00132031, 0x00000000, 0xc0000414, 0x02a00000,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 1250, .size = 52, .code = (const uint32_t []) {
+		0x00020061, 0x01050000, 0x00000104, 0x00000000,
+		0x00000069, 0x02058220, 0x02000024, 0x00000004,
+		0x00000061, 0x02250220, 0x000000c4, 0x00000000,
+		0x00030061, 0x04054220, 0x00000000, 0x00000000,
+		0x00041c61, 0x05050220, 0x00000104, 0x00000000,
+		0x00011b61, 0x04050220, 0x00220205, 0x00000000,
+		0x00000061, 0x04454220, 0x00000000, 0x0000000f,
+		0x00000061, 0x04850220, 0x000000a4, 0x00000000,
+		0x80001901, 0x00010000, 0x00000000, 0x00000000,
+		0x00044031, 0x00000000, 0xc0000414, 0x02a00000,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 0, .size = 48, .code = (const uint32_t []) {
+		0x00020061, 0x01050000, 0x00000104, 0x00000000,
+		0x00000069, 0x02058220, 0x02000024, 0x00000004,
+		0x00000061, 0x02250220, 0x000000c4, 0x00000000,
+		0x00030061, 0x04054220, 0x00000000, 0x00000000,
+		0x00040461, 0x05050220, 0x00000104, 0x00000000,
+		0x00010361, 0x04050220, 0x00220205, 0x00000000,
+		0x00000061, 0x04454220, 0x00000000, 0x0000000f,
+		0x00000061, 0x04850220, 0x000000a4, 0x00000000,
+		0x00049031, 0x00000000, 0xc0000414, 0x02a00000,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000101, 0x00010000, 0x00000000, 0x00000000,
+	}}
+};
diff --git a/lib/iga64_generated_codes.c b/lib/gpgpu_shader.c.gen.iga64_codes.c
similarity index 89%
rename from lib/iga64_generated_codes.c
rename to lib/gpgpu_shader.c.gen.iga64_codes.c
index 551dead2be173d0e48f807e3471f914e898556c4..fffe242fe138cd56b5cd73a5f149637b284db02e 100644
--- a/lib/iga64_generated_codes.c
+++ b/lib/gpgpu_shader.c.gen.iga64_codes.c
@@ -3,81 +3,7 @@
 
 #include "gpgpu_shader.h"
 
-#define MD5_SUM_IGA64_ASMS 22a5a4671242c3257209f4051f1c0c7e
-
-struct iga64_template const iga64_code_gpgpu_fill[] = {
-	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
-		0x00080061, 0x01050000, 0x00000104, 0x00000000,
-		0x00000069, 0x02058220, 0x02000014, 0x00000004,
-		0x00000061, 0x02150220, 0x00000064, 0x00000000,
-		0x000c0061, 0x04054220, 0x00000000, 0x00000000,
-		0x00101c61, 0x05050220, 0x00000104, 0x00000000,
-		0x00041b61, 0x04550220, 0x00220205, 0x00000000,
-		0x00000061, 0x04754550, 0x00000000, 0x000f000f,
-		0x00132031, 0x00000000, 0xd00e0494, 0x04000000,
-		0x80000001, 0x00010000, 0x20000000, 0x00000000,
-		0x80000001, 0x00010000, 0x30000000, 0x00000000,
-		0x80000901, 0x00010000, 0x00000000, 0x00000000,
-	}},
-	{ .gen_ver = 1270, .size = 52, .code = (const uint32_t []) {
-		0x00020061, 0x01050000, 0x00000104, 0x00000000,
-		0x00000069, 0x02058220, 0x02000024, 0x00000004,
-		0x00000061, 0x02250220, 0x000000c4, 0x00000000,
-		0x00030061, 0x04054220, 0x00000000, 0x00000000,
-		0x00041c61, 0x05050220, 0x00000104, 0x00000000,
-		0x00011b61, 0x04050220, 0x00220205, 0x00000000,
-		0x00000061, 0x04454220, 0x00000000, 0x0000000f,
-		0x00000061, 0x04850220, 0x000000a4, 0x00000000,
-		0x80001901, 0x00010000, 0x00000000, 0x00000000,
-		0x00044031, 0x00000000, 0xc0000414, 0x02a00000,
-		0x80000001, 0x00010000, 0x20000000, 0x00000000,
-		0x80000001, 0x00010000, 0x30000000, 0x00000000,
-		0x80000901, 0x00010000, 0x00000000, 0x00000000,
-	}},
-	{ .gen_ver = 1260, .size = 48, .code = (const uint32_t []) {
-		0x00080061, 0x01050000, 0x00000104, 0x00000000,
-		0x00000069, 0x02058220, 0x02000014, 0x00000004,
-		0x00000061, 0x02150220, 0x00000064, 0x00000000,
-		0x000c0061, 0x04054220, 0x00000000, 0x00000000,
-		0x00101c61, 0x05050220, 0x00000104, 0x00000000,
-		0x00041b61, 0x04050220, 0x00220205, 0x00000000,
-		0x00000061, 0x04254220, 0x00000000, 0x0000000f,
-		0x00000061, 0x04450220, 0x00000054, 0x00000000,
-		0x00132031, 0x00000000, 0xc0000414, 0x02a00000,
-		0x80000001, 0x00010000, 0x20000000, 0x00000000,
-		0x80000001, 0x00010000, 0x30000000, 0x00000000,
-		0x80000901, 0x00010000, 0x00000000, 0x00000000,
-	}},
-	{ .gen_ver = 1250, .size = 52, .code = (const uint32_t []) {
-		0x00020061, 0x01050000, 0x00000104, 0x00000000,
-		0x00000069, 0x02058220, 0x02000024, 0x00000004,
-		0x00000061, 0x02250220, 0x000000c4, 0x00000000,
-		0x00030061, 0x04054220, 0x00000000, 0x00000000,
-		0x00041c61, 0x05050220, 0x00000104, 0x00000000,
-		0x00011b61, 0x04050220, 0x00220205, 0x00000000,
-		0x00000061, 0x04454220, 0x00000000, 0x0000000f,
-		0x00000061, 0x04850220, 0x000000a4, 0x00000000,
-		0x80001901, 0x00010000, 0x00000000, 0x00000000,
-		0x00044031, 0x00000000, 0xc0000414, 0x02a00000,
-		0x80000001, 0x00010000, 0x20000000, 0x00000000,
-		0x80000001, 0x00010000, 0x30000000, 0x00000000,
-		0x80000901, 0x00010000, 0x00000000, 0x00000000,
-	}},
-	{ .gen_ver = 0, .size = 48, .code = (const uint32_t []) {
-		0x00020061, 0x01050000, 0x00000104, 0x00000000,
-		0x00000069, 0x02058220, 0x02000024, 0x00000004,
-		0x00000061, 0x02250220, 0x000000c4, 0x00000000,
-		0x00030061, 0x04054220, 0x00000000, 0x00000000,
-		0x00040461, 0x05050220, 0x00000104, 0x00000000,
-		0x00010361, 0x04050220, 0x00220205, 0x00000000,
-		0x00000061, 0x04454220, 0x00000000, 0x0000000f,
-		0x00000061, 0x04850220, 0x000000a4, 0x00000000,
-		0x00049031, 0x00000000, 0xc0000414, 0x02a00000,
-		0x80000001, 0x00010000, 0x20000000, 0x00000000,
-		0x80000001, 0x00010000, 0x30000000, 0x00000000,
-		0x80000101, 0x00010000, 0x00000000, 0x00000000,
-	}}
-};
+#define MD5_SUM_IGA64_ASMS f5d2183439f5e7b18097c3c2c2957dbb
 
 struct iga64_template const iga64_code_read_a64_d32[] = {
 	{ .gen_ver = 2000, .size = 40, .code = (const uint32_t []) {
diff --git a/lib/meson.build b/lib/meson.build
index ff81baae13ad810eea56b97a42d556e5c6978718..5e4247aad65902ce09c30d26747495794f018115 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -241,9 +241,30 @@ lib_version = vcs_tag(input : 'version.h.in', output : 'version.h',
 		      command : vcs_command )
 
 iga64_assembly_sources = [ 'gpgpu_shader.c', 'gpgpu_fill.c' ]
+libiga64_asms = static_library('iga64_asms',
+	iga64_assembly_sources,
+	include_directories: inc,
+	dependencies : lib_deps,
+	c_args : [
+	    '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
+	    '-DIGT_SRCDIR="@0@"'.format(srcdir),
+	    '-DIGT_LOG_DOMAIN="gpu_codes"',
+	    '-ffat-lto-objects' ]
+)
+
+iga64_codes_targets = []
+foreach f: iga64_assembly_sources
+	name = f.underscorify() + '.gen.iga64_codes.c'
+	iga64_codes_targets += custom_target(name,
+		input: [ f + '.gen.iga64_codes.c', libiga64_asms.extract_objects(f) ],
+		output: name,
+		depend_files: [ 'iga64_macros.h', generate_iga64_codes.path() ],
+		command: [ 'env', 'IGT_SRCDIR=@SOURCE_ROOT@', generate_iga64_codes, '-o', '@OUTPUT@', '-i', '@INPUT0@', '@INPUT1@' ],
+		console: true,
+	)
+endforeach
 
 lib_intermediates = []
-iga64_assembly_libs = []
 foreach f: lib_sources
     name = f.underscorify()
     lib = static_library('igt-' + name,
@@ -254,25 +275,12 @@ foreach f: lib_sources
 	    '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
 	    '-DIGT_SRCDIR="@0@"'.format(srcdir),
 	    '-DIGT_LOG_DOMAIN="@0@"'.format(f.split('.')[0]),
-	] + (iga64_assembly_sources.contains(f) ? [ '-ffat-lto-objects' ] : []))
+	])
 
     lib_intermediates += lib
-    if iga64_assembly_sources.contains(f)
-	iga64_assembly_libs += lib
-    endif
 endforeach
 
-iga64_generated_codes = custom_target(
-    'iga64_generated_codes.c',
-    input : [ 'iga64_generated_codes.c' ] + iga64_assembly_libs,
-    output : 'iga64_generated_codes.c',
-    depend_files : 'iga64_macros.h',
-    command : [ 'env', 'IGT_SRCDIR=@0@'.format(source_root), generate_iga64_codes, '-o', '@OUTPUT@', '-i', '@INPUT@' ]
-)
-
-lib_intermediates += static_library('igt-iga64_generated_codes.c',
-			[ iga64_generated_codes, lib_version ]
-		     )
+lib_intermediates += static_library('iga64_gpu_codes', iga64_codes_targets)
 
 lib_igt_build = shared_library('igt',
     ['dummy.c'],
diff --git a/scripts/generate_iga64_codes b/scripts/generate_iga64_codes
index 1675ffe639b3bb3228266846ade3ac1f25b55f4f..d196c7a016b75a680e38987a1f349fcc6ec934e6 100755
--- a/scripts/generate_iga64_codes
+++ b/scripts/generate_iga64_codes
@@ -29,17 +29,17 @@ while getopts ':i:o:' opt; do
     case $opt in
     i) INPUT=$OPTARG;;
     o) OUTPUT=$OPTARG;;
-    ?) die "Usage: $0 -i pre-generated-iga64-file -o generated-iga64-file libs-with-iga64-assembly [...]"
+    ?) die "Usage: $0 -i pre-generated-iga64-file -o generated-iga64-file obj-with-iga64-assembly [...]"
     esac
 done
-LIBS=${@:OPTIND}
+OBJ=${@:OPTIND}
 
 # read all assemblies into ASMS array
 ASMS=()
 while  read -d $'\0' asm; do
     test -z "$asm" && continue
     ASMS+=( "$asm" )
-done < <(for f in $LIBS; do objcopy --dump-section .iga64_assembly=/dev/stdout $f.p/*.o /dev/null; done)
+done < <(objcopy --dump-section .iga64_assembly=/dev/stdout $OBJ /dev/null)
 
 # check if we need to recompile - checksum difference and compiler present
 MD5_ASMS="$(md5sum <<< "$(< $IGT_SRCDIR/lib/iga64_macros.h) ${ASMS[@]}" | cut -b1-32)"
@@ -47,13 +47,13 @@ MD5_PRE="$(grep -Po '(?<=^#define MD5_SUM_IGA64_ASMS )\S{32,32}' $INPUT 2>/dev/n
 
 if [ "$MD5_ASMS" = "$MD5_PRE" ]; then
     echo "iga64 assemblies not changed, reusing pre-compiled file $INPUT."
-    cp $INPUT $OUTPUT
+    cp -p $INPUT $OUTPUT
     exit 0
 fi
 
 type iga64 >/dev/null || {
     warn "WARNING: iga64 assemblies changed, but iga64 compiler not present, CHANGES will have no effect. Install iga64 (libigc-tools package) to re-compile code."
-    cp $INPUT $OUTPUT
+    cp -p $INPUT $OUTPUT
     exit 0
 }
 
@@ -67,7 +67,7 @@ for gen in $GEN_VERSIONS; do
     gen_name="${gen#*:}"
     iga64 -p=$gen_name -d $WD/empty 2>/dev/null || {
         warn "WARNING: iga64 assemblies changed, but iga64 compiler does not support platform '$gen_name', CHANGES will have no effect. Update iga64 (libigc-tools package) to re-compile code."
-        cp $INPUT $OUTPUT
+        cp -p $INPUT $OUTPUT
         exit 0
     }
 done
@@ -127,4 +127,4 @@ for asm in "${ASMS[@]}"; do
     echo -e "\t{ .gen_ver = $cur_ver, .size = $(dword_count "$cur_code"), .code = (const uint32_t []) {\n$cur_code\n\t}}\n};" >>$OUTPUT
 done
 
-cp $OUTPUT $INPUT
+cp -vp $OUTPUT $INPUT

---
base-commit: a0d787e069ce10aa444c54b7d1ffdf5894826c68
change-id: 20250528-refactor_gpgpu_asms-dd5fb1d78843

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

