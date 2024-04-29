Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A28C4345F
	for <igt-dev@archiver.kernel.org>; Mon, 29 Apr 2024 12:08:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 037A4112BF9;
	Mon, 29 Apr 2024 12:08:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="er3rVCUO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5660C112BEC
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Apr 2024 12:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714392529; x=1745928529;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=kKeLslL4D8VvrlEPmXW4xvkHVFFPaA/GKiR7Qs9XUqE=;
 b=er3rVCUOOkGo01O1/nkO9Yrh6bRxS9FfJZLEYPA4sh+qJjK14vtXq150
 pN/lH4sFu33gesy7h5HCaouhmlDdMwmC1cLnHusfRjkxRlGs+boRJpxZv
 VTYwfH65h5oN6xoOS68OqXIH+BuixMLk5GbKGtYsXyEaYyNXx1XmQV4vw
 bGZOgGN7oRuIld68NscHVP7QqvDOzghZOjmcCkgVv6uLXkUei2o26Cr4J
 GtNZf2CeolhJOh0FKNSqJoMbItkQsizLWUyrPcYZIOdEzNlxwaPFuPUas
 wJI6r5KTYdr7y1JiZI+B6YgUF81UjFlQluTPrWdug/FkvWS17nke2DBPs Q==;
X-CSE-ConnectionGUID: TcB2LJLeQOOEmHBCEnxd1Q==
X-CSE-MsgGUID: xtgVkMDpS765k3eObhARAw==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="13823226"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="13823226"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 05:08:49 -0700
X-CSE-ConnectionGUID: M+eWIcGoR16M8OTkSL4T6Q==
X-CSE-MsgGUID: w2xXR6xeTNePTzgFO0CR9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="30772370"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 05:08:48 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Mon, 29 Apr 2024 14:08:19 +0200
Subject: [PATCH 3/4] lib/gpgpu_shader: add inline support for iga64
 assembly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240429-iga64_inline_ups-v1-3-2e9ac46cf6ba@intel.com>
References: <20240429-iga64_inline_ups-v1-0-2e9ac46cf6ba@intel.com>
In-Reply-To: <20240429-iga64_inline_ups-v1-0-2e9ac46cf6ba@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 =?utf-8?q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10470;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=kKeLslL4D8VvrlEPmXW4xvkHVFFPaA/GKiR7Qs9XUqE=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmL43JaA8mT19L3x+i5XAokJmb6X3crD5Ymr0lVKy1
 z6rQveKJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZi+NyQAKCRAjYrKT3hD91waLC/
 wLvLlgVsqcpcVpPFbCuk8IeRGE0SWRSm2k55EgJtnmqSRY0IIdr10tYFnXfradcCEqbX5NYAomBPKT
 2BNjllLjRkfakfbFUDavi2qMBOCGWHfqcTPWHhUUrcIJ1bzFomrJRvlM5X32dhfsHcH9eB7seuChTr
 VykuvoiKcroP7hMe91+jrYYc+FPOlVuLh9Dcle03FV4BdWEFbL0AmkSKgYsErywnJVyONQ6r9bBth6
 LMUMPBZIrzaFlyxaWKX/tpt3munvmYIOERo6OR3WhpzoUxmK8UTicGZDQd+/xE0/QwBIpqrFUQExUM
 oi5DjQATNkjU4M44OCS2RYLl3Un/PdlZvc7REQm0QMxKZbiMQIOGYWi8+wG0yExOGOjBPx7ZzhEg9X
 v/LhmUReB8aR4tiEI/uGqG7tg+LT70bM4VN1xaZX+xupuuxwyE4qN2G/JGoVwa9XrPpCh9qvu0BdMy
 fua9EJdVw8bXYRYpe1Tdov0HPuJgAt2q+khP/LLATFGmg=
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

With this patch adding iga64 assembly should be similar to
adding x86 assembly inline. Simple example:
    emit_iga64_code(shdr, set_exception, R"ASM(
        or (1|M0) cr0.1<1>:ud cr0.1<0;1,0>:ud ARG(0):ud
    )ASM", value);
Note presence of 'ARG(0)', it will be replaced by 'value' argument,
multiple arguments are possible.
More sophisticated examples in following patches.
How does it works:
1. Raw string literals (C++ feature available in gcc as extension):
   R"ASM(...)ASM" allows to use multiline/unescaped string literals.
   If for some reason they cannot be used we could always fallback to
   old ugly way of handling multiline strings with escape characters:
    emit_iga64_code(shdr, set_exception, "\n\
        or (1|M0) cr0.1<1>:ud cr0.1<0;1,0>:ud ARG(0):ud\n\
    ", value);
2. emit_iga64_code puts the assembly string into special linker section,
   and calls __emit_iga64_code with pointer to external variable
   which will contain code templates generated from the assembly for all
   supported platforms, remaining arguments are put to temporal array
   to eventually patch the code with positional arguments.
3. During build phase the linker section is scanned for assemblies.
   Every assembly is preprocessed with cpp, to replace ARG(x) macros with
   magic numbers, and to provide different code for different platforms
   if needed. Then output file is compiled with iga64, and then .c file
   is generated with global variables pointing to hexified iga64 codes.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/generate_iga64_codes    | 104 ++++++++++++++++++++++++++++++++++++++++++++
 lib/gpgpu_shader.c          |  39 +++++++++++++++++
 lib/gpgpu_shader.h          |  25 +++++++++++
 lib/iga64_generated_codes.c |   6 +++
 lib/iga64_macros.h          |  10 +++++
 lib/meson.build             |  18 ++++++++
 6 files changed, 202 insertions(+)

diff --git a/lib/generate_iga64_codes b/lib/generate_iga64_codes
new file mode 100755
index 000000000000..efc2a29b409c
--- /dev/null
+++ b/lib/generate_iga64_codes
@@ -0,0 +1,104 @@
+#!/bin/bash
+# SPDX-License-Identifier: MIT
+# Copyright © 2024 Intel Corporation
+# Author: Andrzej Hajda <andrzej.hajda@intel.com>
+
+# List of supported platforms, in format gen100:platform, where gen100 equals
+# to minimal GPU generation supported by platform multiplied by 100 and platform
+# is one of platforms supported by -p switch of iga64.
+#
+# Must be in decreasing order, the last one must have gen100 equal 0"
+GEN_VERSIONS="2000:2 1272:12p72 1250:12p5 0:12p1"
+
+warn() {
+    echo -e "$1" >/dev/stderr
+}
+
+die() {
+    warn "DIE: $1"
+    exit 1
+}
+
+# parse args
+while getopts ':i:o:' opt; do
+    case $opt in
+    i) INPUT=$OPTARG;;
+    o) OUTPUT=$OPTARG;;
+    ?) die "Usage: $0 -i pre-generated-iga64-file -o generated-iga64-file libs-with-iga64-assembly [...]"
+    esac
+done
+LIBS=${@:OPTIND}
+
+# read all assemblies into ASMS array
+ASMS=()
+while  read -d $'\0' asm; do
+    test -z "$asm" && continue
+    ASMS+=( "$asm" )
+done < <(for f in $LIBS; do objcopy --dump-section .iga64_assembly=/dev/stdout $f.p/*.o; done)
+
+# check if we need to recompile - checksum difference and compiler present
+MD5_ASMS="$(for a in "${ASMS[@]}"; do echo "${a#*:}"; done | md5sum|cut -b1-32)"
+MD5_PRE="$(grep -Po '(?<=^#define MD5_SUM )\S{32,32}' $INPUT 2>/dev/null)"
+
+if [ "$MD5_ASMS" = "$MD5_PRE" ]; then
+    echo "iga64 assemblies not changed, reusing pre-compiled file $INPUT."
+    cp $INPUT $OUTPUT
+    exit 0
+fi
+
+type iga64 >/dev/null || {
+    warn "WARNING: iga64 assemblies changed, but iga64 compiler not present, CHANGES will have no effect. Install iga64 (libigc-tools package) to re-compile code."
+    cp $INPUT $OUTPUT
+    exit 0
+}
+
+# returns count of numbers in strings of format "0x1234, 0x23434, ..."
+dword_count() {
+    n=${1//[^x]}
+    echo ${#n}
+}
+
+# generate code file
+WD=$OUTPUT.d
+mkdir -p $WD
+
+echo "Generating new $OUTPUT"
+
+cat <<-EOF >$OUTPUT
+/* SPDX-License-Identifier: MIT */
+/* Generated using $(iga64 |& head -1) */
+
+#include "gpgpu_shader.h"
+
+#define MD5_SUM $MD5_ASMS
+EOF
+
+for asm in "${ASMS[@]}"; do
+    asm_name="${asm%%:*}"
+    asm_code="${asm_name/assembly/code}"
+    asm_body="${asm#*:}"
+    cur_code=""
+    cur_ver=""
+    echo -e "\nstruct iga64_template const $asm_code[] = {" >>$OUTPUT
+    for gen in $GEN_VERSIONS; do
+        gen_ver="${gen%%:*}"
+        gen_name="${gen#*:}"
+        warn "Generating $asm_code for platform $gen_name"
+        cmd="cpp -P - -o $WD/$asm_name.$gen_name.asm"
+        cmd+=" -DGEN_VER=$gen_ver -imacros ../lib/iga64_macros.h"
+        eval "$cmd" <<<"$asm_body" || die "cpp error for $asm_name.$gen_name\ncmd: $cmd"
+        cmd="iga64 -Xauto-deps -Wall -p=$gen_name"
+        cmd+=" $WD/$asm_name.$gen_name.asm -o $WD/$asm_name.$gen_name.bin"
+        eval "$cmd" || die "iga64 error for $asm_name.$gen_name\ncmd: $cmd"
+        code="$(hexdump -e '"\t\t" 4/4 "0x%08x, " "\n"' $WD/$asm_name.$gen_name.bin)"
+        [ -z "$cur_code" ] && cur_code="$code"
+        [ "$cur_code" != "$code" ] && {
+            echo -e "\t{ .gen_ver = $cur_ver, .size = $(dword_count "$cur_code"), .code = (const uint32_t []) {\n$cur_code\n\t}}," >>$OUTPUT
+            cur_code="$code"
+        }
+        cur_ver=$gen_ver
+    done
+    echo -e "\t{ .gen_ver = $cur_ver, .size = $(dword_count "$cur_code"), .code = (const uint32_t []) {\n$cur_code\n\t}}\n};" >>$OUTPUT
+done
+
+cp $OUTPUT $INPUT
diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
index d14301789421..3317e9e35c91 100644
--- a/lib/gpgpu_shader.c
+++ b/lib/gpgpu_shader.c
@@ -11,6 +11,9 @@
 #include "gpgpu_shader.h"
 #include "gpu_cmds.h"
 
+#define IGA64_ARG0 0xc0ded000
+#define IGA64_ARG_MASK 0xffffff00
+
 #define SUPPORTED_GEN_VER 1200 /* Support TGL and up */
 
 #define PAGE_SIZE 4096
@@ -22,6 +25,42 @@
 #define GPGPU_CURBE_SIZE 0
 #define GEN7_VFE_STATE_GPGPU_MODE 1
 
+static void gpgpu_shader_extend(struct gpgpu_shader *shdr)
+{
+	shdr->max_size <<= 1;
+	shdr->code = realloc(shdr->code, 4 * shdr->max_size);
+}
+
+void
+__emit_iga64_code(struct gpgpu_shader *shdr, struct iga64_template const *tpls,
+		  int argc, uint32_t *argv)
+{
+	uint32_t *ptr;
+
+	igt_require_f(shdr->gen_ver >= SUPPORTED_GEN_VER,
+		      "No available shader templates for platforms older than XeLP\n");
+
+	while (shdr->gen_ver < tpls->gen_ver)
+		tpls++;
+
+	while (shdr->max_size < shdr->size + tpls->size)
+		gpgpu_shader_extend(shdr);
+
+	ptr = shdr->code + shdr->size;
+	memcpy(ptr, tpls->code, 4 * tpls->size);
+
+	/* patch the template */
+	for (int n, i = 0; i < tpls->size; ++i) {
+		if ((ptr[i] & IGA64_ARG_MASK) != IGA64_ARG0)
+			continue;
+		n = ptr[i] - IGA64_ARG0;
+		igt_assert(n < argc);
+		ptr[i] = argv[n];
+	}
+
+	shdr->size += tpls->size;
+}
+
 static uint32_t fill_sip(struct intel_bb *ibb,
 			 const uint32_t sip[][4],
 			 const size_t size)
diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
index 02f6f1aad1e3..0b997deba8bb 100644
--- a/lib/gpgpu_shader.h
+++ b/lib/gpgpu_shader.h
@@ -23,6 +23,27 @@ struct gpgpu_shader {
 	};
 };
 
+struct iga64_template {
+	uint32_t gen_ver;
+	uint32_t size;
+	const uint32_t *code;
+};
+
+#pragma GCC diagnostic ignored "-Wnested-externs"
+
+void
+__emit_iga64_code(struct gpgpu_shader *shdr, const struct iga64_template *tpls,
+		  int argc, uint32_t *argv);
+
+#define emit_iga64_code(__shdr, __name, __txt, __args...) \
+({ \
+	static const char t[] __attribute__ ((section(".iga64_assembly"),used)) \
+		="iga64_assembly_" #__name ":" __txt "\n"; \
+	extern struct iga64_template const iga64_code_ ## __name[]; \
+	u32 args[] = { __args }; \
+	__emit_iga64_code(__shdr, iga64_code_ ## __name, ARRAY_SIZE(args), args); \
+})
+
 struct gpgpu_shader *gpgpu_shader_create(int fd);
 void gpgpu_shader_destroy(struct gpgpu_shader *shdr);
 
@@ -35,4 +56,8 @@ void gpgpu_shader_exec(struct intel_bb *ibb,
 		       struct gpgpu_shader *sip,
 		       uint64_t ring, bool explicit_engine);
 
+void gpgpu_shader__eot(struct gpgpu_shader *shdr);
+void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
+			       uint32_t y_offset);
+
 #endif /* GPGPU_SHADER_H */
diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
new file mode 100644
index 000000000000..449c5e9bcf31
--- /dev/null
+++ b/lib/iga64_generated_codes.c
@@ -0,0 +1,6 @@
+/* SPDX-License-Identifier: MIT */
+/* Generated using Intel Graphics Assembler 1.1.0-int */
+
+#include "gpgpu_shader.h"
+
+#define MD5_SUM d41d8cd98f00b204e9800998ecf8427e
diff --git a/lib/iga64_macros.h b/lib/iga64_macros.h
new file mode 100644
index 000000000000..33375763a1d0
--- /dev/null
+++ b/lib/iga64_macros.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: MIT */
+
+#define ARG(n) (0xc0ded000 + n)
+
+/* send instruction for DG2+ requires 0 length in case src1 is null, BSpec: 47443 */
+#if GEN_VER < 1271
+#define src1_null null
+#else
+#define src1_null null:0
+#endif
diff --git a/lib/meson.build b/lib/meson.build
index 0a3084f8aea2..843c74e5187f 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -216,7 +216,10 @@ lib_version = vcs_tag(input : 'version.h.in', output : 'version.h',
 		      fallback : 'NO-GIT',
 		      command : vcs_command )
 
+iga64_assembly_sources = [ 'gpgpu_shader.c' ]
+
 lib_intermediates = []
+iga64_assembly_libs = []
 foreach f: lib_sources
     name = f.underscorify()
     lib = static_library('igt-' + name,
@@ -230,8 +233,23 @@ foreach f: lib_sources
 	])
 
     lib_intermediates += lib
+    if f in iga64_assembly_sources
+	iga64_assembly_libs += lib
+    endif
 endforeach
 
+iga64_generated_codes = custom_target(
+    'iga64_generated_codes.c',
+    output : 'iga64_generated_codes.c',
+    input : [ 'iga64_generated_codes.c' ] + iga64_assembly_libs,
+    command : [ './generate_iga64_codes', '-o', '@OUTPUT@', '-i', '@INPUT@' ],
+    depend_files: [ 'generate_iga64_codes' ]
+)
+
+lib_intermediates += static_library('igt-iga64_generated_codes.c',
+			[ iga64_generated_codes, lib_version ]
+		     )
+
 lib_igt_build = shared_library('igt',
     ['dummy.c'],
     link_whole: lib_intermediates,

-- 
2.34.1

