Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E06C25B74
	for <igt-dev@archiver.kernel.org>; Fri, 24 May 2024 13:32:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6566310F33C;
	Fri, 24 May 2024 13:32:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="miB7CObI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C7910EA84
 for <igt-dev@lists.freedesktop.org>; Fri, 24 May 2024 13:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716557539; x=1748093539;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=3lvki1un4TKEwE9qe3morQOiquEqivORa69hA/4mYhI=;
 b=miB7CObIYe8cGCp+cT6XzheTdjcxl5Zu1UC3Urbo2J402MIJ62RNRKi3
 cXtuvMaA+V4jKylYH2G4YqU9ACPV6XADetMipMacNH/zIPY+mqdUHhzxk
 eiXHlcPKe6JDZTjx/nqU9Ft09SNmUpLT7TADdag1eZi6SCXgMmupkB7cy
 nTv6glIVz5lS+07CphuArel432JDoixoI+QdEzpdcsL9KaAggs/ZoWv1c
 eJIsWwYJfoJ6aJmDQ8MYo9d5UkfT4U7ui7oT+TCMk/XuIMHTW5m2DD6fX
 btje1SjCzIXy1LIbSGqPHHv8m9OsDSi5/rSUtG4xnVOO/zKj4xy5ftcX2 A==;
X-CSE-ConnectionGUID: xVCNfOaqR1eQIYR9BGbCMQ==
X-CSE-MsgGUID: M0MAd0g5R3iRIKyJODycBw==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="30441279"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="30441279"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 06:32:19 -0700
X-CSE-ConnectionGUID: X7j5Myi9Qw6Pk5OY4Mq7qg==
X-CSE-MsgGUID: LPByqyl+RRGKUMaUpRYSlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="34040899"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 06:32:16 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 24 May 2024 15:32:01 +0200
Subject: [PATCH v4 3/5] lib/gpgpu_shader: add inline support for iga64 assembly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240524-iga64_inline_ups-v4-3-c2e31c55e083@intel.com>
References: <20240524-iga64_inline_ups-v4-0-c2e31c55e083@intel.com>
In-Reply-To: <20240524-iga64_inline_ups-v4-0-c2e31c55e083@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11736;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=3lvki1un4TKEwE9qe3morQOiquEqivORa69hA/4mYhI=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmUJbamF/JvnDvRg+/eFtVi+iVZjHOuKLFuOQzlxaH
 AF/VqdOJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZlCW2gAKCRAjYrKT3hD9160GDA
 Cb2sNwZCp/tLG7majcJpN15h5N9r/rQD8HL5dzychYNdoOqzODElRirQF2JBVD53I6kBJQ8q1BTS8E
 XAYVjF9uq5MW65rt6VJiJ7SuH3Ug2wHu25Su41hy0t3GKFg7trw+chrvYk9NeHvCemYs8vnyHPs2vw
 0vuGNWETKrdNoKdjrbi28lIU6JtFbwW88OAD2hTd+ZIMLf72aNYaDDnN37NXGMpDRyNrMeOm1SDxNz
 py7RzF81+UH4agcGXI4yg3EJgYMKEn81SqwWvyvS3VWAzYrAhv6Pg+L/Gf89sZt0SINsoHEvbL3QhE
 MsmbyJoiHR/srv1WyWJEMR4+nwTRRRIAMWNo53ulnsOtVVBTBY7iepuwX/tCdhYVVkMZIl4yQ0AQGp
 p4SZIdrLWsaph5WUn5jpn5DCKM/uLJRzk3jhSCdtPcTb6NjJIGNgsGvMSHXHTkVPCcwYe/llTQnLQt
 r8rHuL2W8qka/WPxhaVF+wPui52fooQsIKMmY9FsI9WTg=
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

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/generate_iga64_codes    | 115 ++++++++++++++++++++++++++++++++++++++++++++
 lib/gpgpu_shader.c          |  39 +++++++++++++++
 lib/gpgpu_shader.h          |  25 ++++++++++
 lib/iga64_generated_codes.c |   6 +++
 lib/iga64_macros.h          |  11 +++++
 lib/meson.build             |  18 +++++++
 meson.build                 |   2 +-
 7 files changed, 215 insertions(+), 1 deletion(-)

diff --git a/lib/generate_iga64_codes b/lib/generate_iga64_codes
new file mode 100755
index 000000000000..4bea6c2382c9
--- /dev/null
+++ b/lib/generate_iga64_codes
@@ -0,0 +1,115 @@
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
+/* SPDX-License-Identifier: MIT */
+/* Generated using $(iga64 |& head -1) */
+
+#include "gpgpu_shader.h"
+
+#define MD5_SUM_IGA64_ASMS $MD5_ASMS
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
index 000000000000..219436983585
--- /dev/null
+++ b/lib/iga64_generated_codes.c
@@ -0,0 +1,6 @@
+/* SPDX-License-Identifier: MIT */
+/* Generated using Intel Graphics Assembler 1.1.0-int */
+
+#include "gpgpu_shader.h"
+
+#define MD5_SUM_IGA64_ASMS 68b329da9893e34099c7d8ad5cb9c940
diff --git a/lib/iga64_macros.h b/lib/iga64_macros.h
new file mode 100644
index 000000000000..008ef795d2ce
--- /dev/null
+++ b/lib/iga64_macros.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: MIT */
+/* Copyright © 2024 Intel Corporation */
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
index 0a3084f8aea2..9ac99104506c 100644
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
 
+generate_iga64_codes = find_program('generate_iga64_codes')
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
index ab44aadb1fdf..19e3d76c197f 100644
--- a/meson.build
+++ b/meson.build
@@ -7,7 +7,7 @@ project('igt-gpu-tools', 'c',
           'buildtype=debugoptimized',
         ],
 	license : 'MIT',
-	meson_version : '>=0.47.2')
+	meson_version : '>=0.49.2')
 
 if get_option('b_ndebug') != 'false'
 	error('Building without -Db_ndebug=false is not supported')

-- 
2.34.1

