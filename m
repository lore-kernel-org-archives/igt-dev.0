Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA06C3064D
	for <igt-dev@archiver.kernel.org>; Thu, 27 Jun 2024 07:25:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 252CE10EA59;
	Thu, 27 Jun 2024 07:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W2h5I1zW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD97510EA57
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jun 2024 07:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719473126; x=1751009126;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=gDVcl4HBNf7GhGp0OxSg/HyEjyY/3LPu99PIs/bki10=;
 b=W2h5I1zWGAlBmQGaiwfEDQkJounp+ZjTGjYxf0cT/gJjvupeuUnkyUAl
 sFhQbRxyRCGg5mS1cEoYiPpeUHlTLHmxaFsRy9tusBjTO5YaJXK6e4PvY
 DOmMG8M6cpZVN3bleVkRRDuZGjh7vpbUgVlqheTUs6Cekg9eP82MZd3Wj
 +QM7vqCH1FTTSTvNYsjdwAFQasf+qjK84EZ5eFwqN8KaR76TnMzPqKSP0
 3Mrm3oF2STOvSssYYKH5Eqp1owXENWrCuBE6mO0jEe2p5W0OV99rYV1+f
 QDwdyeac/1DIpIsPe5V4wdwpczczzvgUEXPBN9u3QsxztLqEOjBaKAFVb Q==;
X-CSE-ConnectionGUID: iyI3vA/mSQKkkR5o83mJjA==
X-CSE-MsgGUID: Qoa3PaI1TxanesDmfvicjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="20466240"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="20466240"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 00:25:26 -0700
X-CSE-ConnectionGUID: kEV/9JpNS0WNH2rqHJUHtA==
X-CSE-MsgGUID: A1S5R+vqSUGKFXl3z8Cn1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="49221724"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 00:25:24 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 27 Jun 2024 09:25:02 +0200
Subject: [PATCH v8 3/5] lib/gpgpu_shader: add inline support for iga64 assembly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240627-iga64_inline_ups-v8-3-08605c9360d3@intel.com>
References: <20240627-iga64_inline_ups-v8-0-08605c9360d3@intel.com>
In-Reply-To: <20240627-iga64_inline_ups-v8-0-08605c9360d3@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=13575;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=gDVcl4HBNf7GhGp0OxSg/HyEjyY/3LPu99PIs/bki10=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmfRPdQ9AWl1pxNKA8brAgBFgcZFDw2LclKn7vUbbH
 BqTT7oqJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZn0T3QAKCRAjYrKT3hD91zhPDA
 Cl039EXoa3paCNtG51id8IXjw9IL2pdqP1gBsrr13tWryTMUTy9FcIF4SOFajzrJWaaU0K9Ck/2f1L
 XTrsoslval8MllD4j74cQetTaH67UePK+mWdwJcbZIoMXUvJats/GGFPNR5DCg0nkkE4xZv5mLmqd/
 2iwBssT2dOcUcy9DAOQ99mKJ6b9VBOrHEWdJZIvc/KpoEWWNW2Wi/HLDlU+OP2uGuIa56KKMi6mXPN
 +7fCgej3BiYAkJybyMvX3WZOPsvP3q5FobfuACF5I7vRNw0jwnkxIDCjuGPCxrRZ89kNbVu2XtNM3J
 iMNm0Ksyubh3XmCdVvRjsVdG/dAJ2FAtb1jcBewyVOiTELhI/nP4Q8dctZUlfbu99BoJ0jcKnFWv25
 ToJYwutyLStrzStJzkCWZAX8T+Y7mLNRvPxnW/DDtm6foyoLAunQtKs62IFlFH3CLOCTzub6gcCiSB
 HfBHTTOa5G5QqYSJ6SaEqDaODJWm8oTpRjQ8ARtUMl4e4=
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

v2:
 - fixed meson paths to script,
 - added check if compiler supports all platforms,
 - include assembly names in MD5 calculations,
 - use more specific name for MD5 sum
v3:
 - bump minimal meson version to kill "ERROR:  Expecting eol got id." bug
v4:
 - set minimal meson to 0.49.2 - builder uses it
v5:
 - revert back minimal ver of meson, instead use old syntax a.contains(b)
v6:
 - generate_iga64_codes moved to scripts dir,
 - added include guards to iga64_macros.h
v7:
 - use C++ style comments in generated file,
 - style fixes
v8:
 - added sanity check for assembly

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/gpgpu_shader.c           |  40 ++++++++++++++
 lib/gpgpu_shader.h           |  25 +++++++++
 lib/iga64_generated_codes.c  |   6 ++
 lib/iga64_macros.h           |  16 ++++++
 lib/meson.build              |  17 ++++++
 meson.build                  |   9 +--
 scripts/generate_iga64_codes | 129 +++++++++++++++++++++++++++++++++++++++++++
 scripts/meson.build          |   1 +
 8 files changed, 239 insertions(+), 4 deletions(-)

diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
index 3b5ba82223b2..62171952ec21 100644
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
@@ -22,6 +25,43 @@
 #define GPGPU_CURBE_SIZE 0
 #define GEN7_VFE_STATE_GPGPU_MODE 1
 
+static void gpgpu_shader_extend(struct gpgpu_shader *shdr)
+{
+	shdr->max_size <<= 1;
+	shdr->code = realloc(shdr->code, 4 * shdr->max_size);
+	igt_assert(shdr->code);
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
index 02f6f1aad1e3..255f93b4dd81 100644
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
+	static const char t[] __attribute__ ((section(".iga64_assembly"), used)) =\
+		"iga64_assembly_" #__name ":" __txt "\n"; \
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
index 000000000000..452d4b3dae53
--- /dev/null
+++ b/lib/iga64_generated_codes.c
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: MIT
+// Generated using Intel Graphics Assembler 1.1.0-int
+
+#include "gpgpu_shader.h"
+
+#define MD5_SUM_IGA64_ASMS 68b329da9893e34099c7d8ad5cb9c940
diff --git a/lib/iga64_macros.h b/lib/iga64_macros.h
new file mode 100644
index 000000000000..f4ef5cb16217
--- /dev/null
+++ b/lib/iga64_macros.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: MIT */
+/* Copyright © 2024 Intel Corporation */
+
+/* Header used during pre-process phase of iga64 assembly. */
+
+#ifndef IGA64_MACROS_H
+#define IGA64_MACROS_H
+
+/* send instruction for DG2+ requires 0 length in case src1 is null, BSpec: 47443 */
+#if GEN_VER < 1271
+#define src1_null null
+#else
+#define src1_null null:0
+#endif
+
+#endif
diff --git a/lib/meson.build b/lib/meson.build
index 0a3084f8aea2..82e7dacad153 100644
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
@@ -230,8 +233,22 @@ foreach f: lib_sources
 	])
 
     lib_intermediates += lib
+    if iga64_assembly_sources.contains(f)
+	iga64_assembly_libs += lib
+    endif
 endforeach
 
+iga64_generated_codes = custom_target(
+    'iga64_generated_codes.c',
+    input : [ 'iga64_generated_codes.c' ] + iga64_assembly_libs,
+    output : 'iga64_generated_codes.c',
+    command : [ generate_iga64_codes, '-o', '@OUTPUT@', '-i', '@INPUT@' ]
+)
+
+lib_intermediates += static_library('igt-iga64_generated_codes.c',
+			[ iga64_generated_codes, lib_version ]
+		     )
+
 lib_igt_build = shared_library('igt',
     ['dummy.c'],
     link_whole: lib_intermediates,
diff --git a/meson.build b/meson.build
index 6ae3c268443e..25bf1e4426fb 100644
--- a/meson.build
+++ b/meson.build
@@ -357,6 +357,11 @@ else
 	vmwgfx_rpathdir = ''
 endif
 
+build_testplan = get_option('testplan')
+build_sphinx = get_option('sphinx')
+
+subdir('scripts')
+
 subdir('lib')
 if build_tests
 	subdir('tests')
@@ -365,9 +370,6 @@ else
 endif
 build_info += 'Build tests: @0@'.format(build_tests)
 
-build_testplan = get_option('testplan')
-build_sphinx = get_option('sphinx')
-
 subdir('benchmarks')
 subdir('tools')
 subdir('runner')
@@ -376,7 +378,6 @@ if libdrm_intel.found()
 endif
 subdir('overlay')
 subdir('man')
-subdir('scripts')
 subdir('docs')
 
 message('Build options')
diff --git a/scripts/generate_iga64_codes b/scripts/generate_iga64_codes
new file mode 100755
index 000000000000..3d114ea0e119
--- /dev/null
+++ b/scripts/generate_iga64_codes
@@ -0,0 +1,129 @@
+#!/bin/bash
+# SPDX-License-Identifier: MIT
+# Copyright © 2024 Intel Corporation
+# Author: Andrzej Hajda <andrzej.hajda@intel.com>
+
+# List of supported platforms, in format gen100:platform, where gen100 equals
+# to minimal GPU generation supported by platform multiplied by 100 and platform
+# is one of platforms supported by -p switch of iga64.
+# Must be in decreasing order, the last one must have gen100 equal 0.
+GEN_VERSIONS="2000:2 1272:12p72 1250:12p5 0:12p1"
+
+# Magic values to encode asm template args, must be the the same as in gpgpu_shader.c.
+IGA64_ARG0=0xc0ded000
+IGA64_ARG_MASK=0xffffff00
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
+MD5_ASMS="$(md5sum <<< "${ASMS[@]}" | cut -b1-32)"
+MD5_PRE="$(grep -Po '(?<=^#define MD5_SUM_IGA64_ASMS )\S{32,32}' $INPUT 2>/dev/null)"
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
+# generate code file
+WD=$OUTPUT.d
+mkdir -p $WD
+
+# check if all required platforms are supported
+touch $WD/empty
+for gen in $GEN_VERSIONS; do
+    gen_name="${gen#*:}"
+    iga64 -p=$gen_name -d $WD/empty 2>/dev/null || {
+        warn "WARNING: iga64 assemblies changed, but iga64 compiler does not support platform '$gen_name', CHANGES will have no effect. Update iga64 (libigc-tools package) to re-compile code."
+        cp $INPUT $OUTPUT
+        exit 0
+    }
+done
+
+# returns count of numbers in strings of format "0x1234, 0x23434, ..."
+dword_count() {
+    n=${1//[^x]}
+    echo ${#n}
+}
+
+echo "Generating new $OUTPUT"
+
+cat <<-EOF >$OUTPUT
+// SPDX-License-Identifier: MIT
+// Generated using $(iga64 |& head -1)
+
+#include "gpgpu_shader.h"
+
+#define MD5_SUM_IGA64_ASMS $MD5_ASMS
+EOF
+
+# Compiles assembly to binary representation sent to stdout.
+compile_iga64() {
+    cmd="cpp -P - -o $WD/$asm_name.$gen_name.asm"
+    cmd+=" -DGEN_VER=$gen_ver -D'ARG(n)=($IGA64_ARG0 + (n))' -imacros ../lib/iga64_macros.h"
+    eval "$cmd" <<<"$asm_body" || die "cpp error for $asm_name.$gen_name\ncmd: $cmd"
+    cmd="iga64 -Xauto-deps -Wall -p=$gen_name"
+    cmd+=" $WD/$asm_name.$gen_name.asm"
+    warn "$cmd"
+    eval "$cmd" || die "iga64 error for $asm_name.$gen_name\ncmd: $cmd"
+}
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
+        # Verify generated code will not contain IGA64_ARGs.
+        for d in $(IGA64_ARG0=0 compile_iga64 | hexdump -v -e '1/4 "0x%08x\n"'); do
+            (( (d & IGA64_ARG_MASK) == IGA64_ARG0 )) || continue
+            die "Assembly for $asm_name.$gen_name contains instruction which compiles to $d, conflicts with IGA64_ARG0/mask $IGA64_ARG0/$IGA64_ARG_MASK\ncmd: $cmd"
+        done
+        compile_iga64 > "$WD/$asm_name.$gen_name.bin" || die "Cannot write to $WD/$asm_name.$gen_name.bin"
+        code="$(hexdump -v -e '"\t\t" 4/4 "0x%08x, " "\n"' $WD/$asm_name.$gen_name.bin)"
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
diff --git a/scripts/meson.build b/scripts/meson.build
index 98783222b6fc..6e64065c5ee7 100644
--- a/scripts/meson.build
+++ b/scripts/meson.build
@@ -14,3 +14,4 @@ endif
 
 igt_doc_script = find_program('igt_doc.py', required : build_testplan)
 gen_rst_index = find_program('gen_rst_index', required : build_sphinx)
+generate_iga64_codes = find_program('generate_iga64_codes')

-- 
2.34.1

