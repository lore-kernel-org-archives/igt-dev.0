Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B464C5AD49
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 12:33:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F00F110E12B;
	Thu, 29 May 2025 12:33:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fq8BGPk8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4699910E12B
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 12:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748522008; x=1780058008;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/hZgV9YdHfSQOJYaEvkQda/ynRl1siO+xqmzSD5ydIY=;
 b=Fq8BGPk8gLGRMNtE5gBy9O+3R9sJWporAWNaZVIHofyr64i9xhegTupR
 jWRSDPkchTkqNhQBHqJpFzr8cXwWAfAh3EoGWmotyUGBJc/5rplcxRNnC
 Zn3q+sedTx2IL40Nniyo3T67hbV4F205fn5cnnDMKRNBS7k3btorZoDyC
 THlUepcDkZKllHIdkbVIJOMWpSIMub5t/u/PeQ6BsqhpiPSOl5JxZiv90
 SXFmeu7KwuTA3yoSd5OXRIUdNKoHru6LQZFgYiAO9zW5ra5QcU42XfCAZ
 Q9GWK+aPApODi5qc9MB0SZVBP+2u9aWRaeC+JTDxjgHHuH1vGpIj84ngD w==;
X-CSE-ConnectionGUID: z1TClog7TRy8SVynqJ40KQ==
X-CSE-MsgGUID: yCjknRvEQ9eCwPfqND7pAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50681360"
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; d="scan'208";a="50681360"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 05:33:28 -0700
X-CSE-ConnectionGUID: B38YVuznRwmGRryHnODoPQ==
X-CSE-MsgGUID: s7n+Gg2uRyGurrW0Ubqtlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; d="scan'208";a="147441536"
Received: from lab-ah.igk.intel.com ([10.211.135.228])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 05:33:27 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH] lib/meson: refactor GPGPU assembly build process
Date: Thu, 29 May 2025 14:32:23 +0200
Message-ID: <20250529-refactor_gpgpu_asms-v1-1-cdbec40cdc15@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-6f78e
X-Developer-Signature: v=1; a=openpgp-sha256; l=14067;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=/hZgV9YdHfSQOJYaEvkQda/ynRl1siO+xqmzSD5ydIY=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBoOFOfViNpl8oQNvKcRuMYhMLLMJbOBcNq5Oz+P
 39B00KCIKKJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaDhTnwAKCRAjYrKT3hD9
 14ENC/0Zv/aJASY6cKA9GfSBOtffeaqO8mGoB36ct4HJoVN8zgscD2Uc6RdCFcDSUsREHH+9uZA
 fg5vL30kRAUZRJHMxmb0NV/PaXPWguWi9cHOczKMbrQdcWtuoI0RrHXTHoqky6WwWlHXckKlvwd
 kvQWiahkoNK+5ZIxqYHUrgzsbvMxUybAtKUhgoMTLGm8WCY9PndzBxiXpSYb3pjeA4bbMY3Qf9h
 rr2luAweAwmo7rSvY0LXKc+K55effx0a7O9R/x77BjkZNQ7k0scfx1Miu8rEXyiTHu4GpI/hlO7
 OXm9UOsgcLDMlvQ7pKrnXdNx9WXMmu9ycSnsyxw3HA/KUUv2YpIfD9riMKFpFzZJ6c8KoEOA/5Q
 wkEhz+vetU9BWOc+KLRX2CL1E7JLILVAgDtuPrqjdeQFera7x5cb01Gvc3Lre/bKDhXlHer7bXp
 pLDl33ttYfaUO60jNamQM4XMi/tTpiknz7G50Uv3AwiuVnfo2Fz1j5H9qieV9bxJecoN8=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

GPGPU inline assembly was build into one big code file
inside libigt library. This approach has few drawbacks:
1. Only files from the library can contain assembly.
2. Change of one assembly chunk results in re-build of
all chunks.
3. Most shaders lands in lib/gpgpu_shader.c.
With this change assembly codes are generated and stored
in files relative to files containing asms. For example
lib/gpgpu_shader.c will have codes in
lib/gpgpu_shader.c.gen.iga64_codes.c.
It will allow to move asms specific for particular test
into the test files, instead of putting them to lib/gpgpu_shader.c.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
This is just upstreamed version of internal patch.
---
 lib/gpgpu_fill.c.gen.iga64_codes.c                 | 80 ++++++++++++++++++++++
 ...ed_codes.c => gpgpu_shader.c.gen.iga64_codes.c} | 76 +-------------------
 lib/meson.build                                    | 40 ++++++-----
 scripts/generate_iga64_codes                       | 14 ++--
 4 files changed, 112 insertions(+), 98 deletions(-)

diff --git a/lib/gpgpu_fill.c.gen.iga64_codes.c b/lib/gpgpu_fill.c.gen.iga64_codes.c
new file mode 100644
index 000000000000..b223425d049a
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
index 551dead2be17..fffe242fe138 100644
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
index f5419805177f..c903aaa14bc9 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -236,9 +236,30 @@ lib_version = vcs_tag(input : 'version.h.in', output : 'version.h',
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
@@ -249,25 +270,12 @@ foreach f: lib_sources
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
index 1675ffe639b3..d196c7a016b7 100755
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
base-commit: f564652c85f6bf5e6e076526fe0de7c96dbbe0b2
change-id: 20250528-refactor_gpgpu_asms-dd5fb1d78843

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

