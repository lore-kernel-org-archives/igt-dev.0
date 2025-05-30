Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69B7C5B543
	for <igt-dev@archiver.kernel.org>; Fri, 30 May 2025 14:23:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55F2510E7E2;
	Fri, 30 May 2025 14:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z6/Qfj9u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 911C810E854
 for <igt-dev@lists.freedesktop.org>; Fri, 30 May 2025 14:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748614981; x=1780150981;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=PBv44869L23a0ZPsxldvCGg2P8rsQh8fwDHpMi+xJXA=;
 b=Z6/Qfj9uljEndnEUEAVPrF9Fs65qDogbD7kW4ZoQx4oSm7nuSZWOF3D8
 q9+c9v3dOrxdLgeaMy4GXwKnkaHBfTEcFH0jB5ondrLIUwBwnBu9kzXJD
 EnCtvrNR1mlS5w3xvNSwpEmHo3rvN7qPH0K4dF4kWPlpBFs4CrgZmEXmA
 icECK0f1ScS/6A33iv723AOVk5t5SNJ6Xj+R+1pRz4bUzlHqTG2qeNTTN
 w1K0l3k6XRFG9KoIAFHz6298GmsK/MXWE2x/x4vBAFSqjlyLaqL372I9G
 0i0m0Q5dRBsec1kbUtlwKPBNYNiIfTS+iVP5F3gru/4OZp8LggB3r5o18 w==;
X-CSE-ConnectionGUID: nLEjVlWZRJOeAHbSRWVmKg==
X-CSE-MsgGUID: Es7YGsRNRdGE3bF36dipBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="38338262"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="38338262"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 07:23:00 -0700
X-CSE-ConnectionGUID: OM/UZaWATsGohzG+hXJ8CQ==
X-CSE-MsgGUID: dJjbtty/TMasWVNA3V+hqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="143727163"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 07:22:59 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 30 May 2025 16:22:11 +0200
Subject: [PATCH] Revert "lib/meson: refactor GPGPU assembly build process"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-revert_meson-v1-1-69c9ad1ea87f@intel.com>
X-B4-Tracking: v=1; b=H4sIABK/OWgC/x3MUQqDQAyE4atInruwKkrbq5RS4jpqHrpK0hZBv
 Lupjx/M/BsZVGB0LzZS/MRkzo7yUlCaOI8I0rupilUTmzoGH0E/rzdszqFu+4Rricg3Jr8sikH
 WM/d4ujs2hE45p+kf+S5G+34AVqmjlXQAAAA=
X-Change-ID: 20250530-revert_meson-36dce81e0a9a
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13937;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=PBv44869L23a0ZPsxldvCGg2P8rsQh8fwDHpMi+xJXA=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBoOb8eh8Zd7NA3XeKyB3MgkXOP/sF+E8bdsPnRy
 s9ctNnw4v+JAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaDm/HgAKCRAjYrKT3hD9
 1xkoC/0QeIRfNNQOZraXycWeIf/arwnEhJnnvNDGaaDnYNN6q4bYBkjUr5JJwhfF4UkVwniySBw
 6md2vtTUnBNvVAPH2uYlFOtHUQq3ZDb9THIKW73lybyX0IXbUS4ElfGYfS5bssyZFZL/KTtuWRS
 5j8FkgohPtFdgJXMSydaxSFBf01xfc2B9lzhaDFj3M2kyUoTI5bNXFZ1vCB81T+SDHAyDzmjQxP
 83g3PVJU6mbB5DJR3PNFxAmT7ivR6e6JrwdfgnfKxI8p735doL14Mr9S/75QogP2zeX5Yj9nR2Z
 U8LTjYmwsMXSjPKfZqQV683PPJ4zSfIAie5reb5+dAEODQxxqOfWLnP9TwXkCJa1fVDg3T2CCjS
 DenS28wFf8cXvTQl3kQnq9XdBhIIDXo/qGs/atYMns5cznVQDWcGaASsFq8cCVM0tlm5bccfG3T
 UMGNVO9TVwnPHv4q0Bma+ZB4zznA5fXyTyjXX8Xru8ABGcuX5tg0CxpPwZ1IpA/DxMCOQ=
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

Commit causes warnigs in old meson which are treated as error:
WARNING: Project targetting '>=0.47.2' but tried to use feature introduced in '0.48.0': console arg in custom_target
As build system uses old meson for checks let's revert it.

This reverts commit 62557300fee4509d3adbcdaf4ee402c6e61b846f.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/gpgpu_fill.c.gen.iga64_codes.c                 | 80 ----------------------
 ...c.gen.iga64_codes.c => iga64_generated_codes.c} | 76 +++++++++++++++++++-
 lib/meson.build                                    | 40 +++++------
 scripts/generate_iga64_codes                       | 14 ++--
 4 files changed, 98 insertions(+), 112 deletions(-)

diff --git a/lib/gpgpu_fill.c.gen.iga64_codes.c b/lib/gpgpu_fill.c.gen.iga64_codes.c
deleted file mode 100644
index b223425d049a51096a2314a759d238af6887b2b9..0000000000000000000000000000000000000000
--- a/lib/gpgpu_fill.c.gen.iga64_codes.c
+++ /dev/null
@@ -1,80 +0,0 @@
-// SPDX-License-Identifier: MIT
-// Generated using Intel Graphics Assembler 1.1.0-int
-
-#include "gpgpu_shader.h"
-
-#define MD5_SUM_IGA64_ASMS 8304c8bb11385470bfd6ac32e1c36840
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
diff --git a/lib/gpgpu_shader.c.gen.iga64_codes.c b/lib/iga64_generated_codes.c
similarity index 89%
rename from lib/gpgpu_shader.c.gen.iga64_codes.c
rename to lib/iga64_generated_codes.c
index fffe242fe138cd56b5cd73a5f149637b284db02e..551dead2be173d0e48f807e3471f914e898556c4 100644
--- a/lib/gpgpu_shader.c.gen.iga64_codes.c
+++ b/lib/iga64_generated_codes.c
@@ -3,7 +3,81 @@
 
 #include "gpgpu_shader.h"
 
-#define MD5_SUM_IGA64_ASMS f5d2183439f5e7b18097c3c2c2957dbb
+#define MD5_SUM_IGA64_ASMS 22a5a4671242c3257209f4051f1c0c7e
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
 
 struct iga64_template const iga64_code_read_a64_d32[] = {
 	{ .gen_ver = 2000, .size = 40, .code = (const uint32_t []) {
diff --git a/lib/meson.build b/lib/meson.build
index c903aaa14bc9d5835ddffbddfb1e610d770b0a43..f5419805177f3b87448b4a3c16dae55fa0847595 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -236,30 +236,9 @@ lib_version = vcs_tag(input : 'version.h.in', output : 'version.h',
 		      command : vcs_command )
 
 iga64_assembly_sources = [ 'gpgpu_shader.c', 'gpgpu_fill.c' ]
-libiga64_asms = static_library('iga64_asms',
-	iga64_assembly_sources,
-	include_directories: inc,
-	dependencies : lib_deps,
-	c_args : [
-	    '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
-	    '-DIGT_SRCDIR="@0@"'.format(srcdir),
-	    '-DIGT_LOG_DOMAIN="gpu_codes"',
-	    '-ffat-lto-objects' ]
-)
-
-iga64_codes_targets = []
-foreach f: iga64_assembly_sources
-	name = f.underscorify() + '.gen.iga64_codes.c'
-	iga64_codes_targets += custom_target(name,
-		input: [ f + '.gen.iga64_codes.c', libiga64_asms.extract_objects(f) ],
-		output: name,
-		depend_files: [ 'iga64_macros.h', generate_iga64_codes.path() ],
-		command: [ 'env', 'IGT_SRCDIR=@SOURCE_ROOT@', generate_iga64_codes, '-o', '@OUTPUT@', '-i', '@INPUT0@', '@INPUT1@' ],
-		console: true,
-	)
-endforeach
 
 lib_intermediates = []
+iga64_assembly_libs = []
 foreach f: lib_sources
     name = f.underscorify()
     lib = static_library('igt-' + name,
@@ -270,12 +249,25 @@ foreach f: lib_sources
 	    '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
 	    '-DIGT_SRCDIR="@0@"'.format(srcdir),
 	    '-DIGT_LOG_DOMAIN="@0@"'.format(f.split('.')[0]),
-	])
+	] + (iga64_assembly_sources.contains(f) ? [ '-ffat-lto-objects' ] : []))
 
     lib_intermediates += lib
+    if iga64_assembly_sources.contains(f)
+	iga64_assembly_libs += lib
+    endif
 endforeach
 
-lib_intermediates += static_library('iga64_gpu_codes', iga64_codes_targets)
+iga64_generated_codes = custom_target(
+    'iga64_generated_codes.c',
+    input : [ 'iga64_generated_codes.c' ] + iga64_assembly_libs,
+    output : 'iga64_generated_codes.c',
+    depend_files : 'iga64_macros.h',
+    command : [ 'env', 'IGT_SRCDIR=@0@'.format(source_root), generate_iga64_codes, '-o', '@OUTPUT@', '-i', '@INPUT@' ]
+)
+
+lib_intermediates += static_library('igt-iga64_generated_codes.c',
+			[ iga64_generated_codes, lib_version ]
+		     )
 
 lib_igt_build = shared_library('igt',
     ['dummy.c'],
diff --git a/scripts/generate_iga64_codes b/scripts/generate_iga64_codes
index d196c7a016b75a680e38987a1f349fcc6ec934e6..1675ffe639b3bb3228266846ade3ac1f25b55f4f 100755
--- a/scripts/generate_iga64_codes
+++ b/scripts/generate_iga64_codes
@@ -29,17 +29,17 @@ while getopts ':i:o:' opt; do
     case $opt in
     i) INPUT=$OPTARG;;
     o) OUTPUT=$OPTARG;;
-    ?) die "Usage: $0 -i pre-generated-iga64-file -o generated-iga64-file obj-with-iga64-assembly [...]"
+    ?) die "Usage: $0 -i pre-generated-iga64-file -o generated-iga64-file libs-with-iga64-assembly [...]"
     esac
 done
-OBJ=${@:OPTIND}
+LIBS=${@:OPTIND}
 
 # read all assemblies into ASMS array
 ASMS=()
 while  read -d $'\0' asm; do
     test -z "$asm" && continue
     ASMS+=( "$asm" )
-done < <(objcopy --dump-section .iga64_assembly=/dev/stdout $OBJ /dev/null)
+done < <(for f in $LIBS; do objcopy --dump-section .iga64_assembly=/dev/stdout $f.p/*.o /dev/null; done)
 
 # check if we need to recompile - checksum difference and compiler present
 MD5_ASMS="$(md5sum <<< "$(< $IGT_SRCDIR/lib/iga64_macros.h) ${ASMS[@]}" | cut -b1-32)"
@@ -47,13 +47,13 @@ MD5_PRE="$(grep -Po '(?<=^#define MD5_SUM_IGA64_ASMS )\S{32,32}' $INPUT 2>/dev/n
 
 if [ "$MD5_ASMS" = "$MD5_PRE" ]; then
     echo "iga64 assemblies not changed, reusing pre-compiled file $INPUT."
-    cp -p $INPUT $OUTPUT
+    cp $INPUT $OUTPUT
     exit 0
 fi
 
 type iga64 >/dev/null || {
     warn "WARNING: iga64 assemblies changed, but iga64 compiler not present, CHANGES will have no effect. Install iga64 (libigc-tools package) to re-compile code."
-    cp -p $INPUT $OUTPUT
+    cp $INPUT $OUTPUT
     exit 0
 }
 
@@ -67,7 +67,7 @@ for gen in $GEN_VERSIONS; do
     gen_name="${gen#*:}"
     iga64 -p=$gen_name -d $WD/empty 2>/dev/null || {
         warn "WARNING: iga64 assemblies changed, but iga64 compiler does not support platform '$gen_name', CHANGES will have no effect. Update iga64 (libigc-tools package) to re-compile code."
-        cp -p $INPUT $OUTPUT
+        cp $INPUT $OUTPUT
         exit 0
     }
 done
@@ -127,4 +127,4 @@ for asm in "${ASMS[@]}"; do
     echo -e "\t{ .gen_ver = $cur_ver, .size = $(dword_count "$cur_code"), .code = (const uint32_t []) {\n$cur_code\n\t}}\n};" >>$OUTPUT
 done
 
-cp -vp $OUTPUT $INPUT
+cp $OUTPUT $INPUT

---
base-commit: 62557300fee4509d3adbcdaf4ee402c6e61b846f
change-id: 20250530-revert_meson-36dce81e0a9a

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

