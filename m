Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD64EC27C43
	for <igt-dev@archiver.kernel.org>; Wed, 29 May 2024 09:36:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4297210E179;
	Wed, 29 May 2024 09:36:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g7TrKaV4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E774510E179
 for <igt-dev@lists.freedesktop.org>; Wed, 29 May 2024 09:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716975383; x=1748511383;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dsaY2npH3EkqceoNFxtqqGiE3PO0nS6a64G7iKJMXho=;
 b=g7TrKaV4PfViw6fC4JPckIeUJNyUSCYf7N16lskBl4FOPrVCIZQr2KCy
 MAZtjJBCOQCxBar1hA1+2mFVr0qTlaRZEKmwPZiRlDm7caP4myvzStrJd
 twZr6CUfkTKAg8O6VwMj+pxXmyfRKuUfmCyC1FeBt3PBD6Ii+RvbbIJp6
 hvtbqqNSWWvlYoICC5Gw2doX1TeHEzegaH3sAapurPG895l9wUQ6jrqEc
 KQ4XQFu179seCUypuk4M5qbbix/1DOYLC7nYUaq4Az5yUBbFRqTP43SSy
 C9kUHAr5AQ8nM47Yd4+569H8R2RIZDjXjKfFWUVNWlruN/Cl008FIxs8M A==;
X-CSE-ConnectionGUID: tb238jGZRxiQleBYHOUWBQ==
X-CSE-MsgGUID: X/NLYiptQTiOh2Z6/6bB7Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13140145"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="13140145"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 02:36:22 -0700
X-CSE-ConnectionGUID: fwOmDLvySJ+x03fornlkrg==
X-CSE-MsgGUID: W6BtBaPASJKRCJXpVDueHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="66254335"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 02:36:21 -0700
Date: Wed, 29 May 2024 11:36:18 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH v5 3/5] lib/gpgpu_shader: add inline support for iga64
 assembly
Message-ID: <20240529093618.2zh5o2o2caonvqqy@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 igt-dev@lists.freedesktop.org,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
References: <20240528-iga64_inline_ups-v5-0-fdd8e9dcd64c@intel.com>
 <20240528-iga64_inline_ups-v5-3-fdd8e9dcd64c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240528-iga64_inline_ups-v5-3-fdd8e9dcd64c@intel.com>
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

Hi Andrzej,
On 2024-05-28 at 16:04:49 +0200, Andrzej Hajda wrote:
> With this patch adding iga64 assembly should be similar to
> adding x86 assembly inline. Simple example:
>     emit_iga64_code(shdr, set_exception, R"ASM(
>         or (1|M0) cr0.1<1>:ud cr0.1<0;1,0>:ud ARG(0):ud
>     )ASM", value);
> Note presence of 'ARG(0)', it will be replaced by 'value' argument,
> multiple arguments are possible.
> More sophisticated examples in following patches.
> How does it works:
> 1. Raw string literals (C++ feature available in gcc as extension):
>    R"ASM(...)ASM" allows to use multiline/unescaped string literals.
>    If for some reason they cannot be used we could always fallback to
>    old ugly way of handling multiline strings with escape characters:
>     emit_iga64_code(shdr, set_exception, "\n\
>         or (1|M0) cr0.1<1>:ud cr0.1<0;1,0>:ud ARG(0):ud\n\
>     ", value);
> 2. emit_iga64_code puts the assembly string into special linker section,
>    and calls __emit_iga64_code with pointer to external variable
>    which will contain code templates generated from the assembly for all
>    supported platforms, remaining arguments are put to temporal array
>    to eventually patch the code with positional arguments.
> 3. During build phase the linker section is scanned for assemblies.
>    Every assembly is preprocessed with cpp, to replace ARG(x) macros with
>    magic numbers, and to provide different code for different platforms
>    if needed. Then output file is compiled with iga64, and then .c file
>    is generated with global variables pointing to hexified iga64 codes.
> 
> v2:
>  - fixed meson paths to script,
>  - added check if compiler supports all platforms,
>  - include assembly names in MD5 calculations,
>  - use more specific name for MD5 sum
> v3:
>  - bump minimal meson version to kill "ERROR:  Expecting eol got id." bug
> v4:
>  - set minimal meson to 0.49.2 - builder uses it
> v5:
>  - revert back minimal version of meson, instead use old syntax a.contains(b)
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  lib/generate_iga64_codes    | 115 ++++++++++++++++++++++++++++++++++++++++++++
>  lib/gpgpu_shader.c          |  39 +++++++++++++++
>  lib/gpgpu_shader.h          |  25 ++++++++++
>  lib/iga64_generated_codes.c |   6 +++
>  lib/iga64_macros.h          |  11 +++++
>  lib/meson.build             |  18 +++++++
>  6 files changed, 214 insertions(+)
> 
> diff --git a/lib/generate_iga64_codes b/lib/generate_iga64_codes
> new file mode 100755
> index 000000000000..4bea6c2382c9
> --- /dev/null
> +++ b/lib/generate_iga64_codes

imho better place is in ../scripts

> @@ -0,0 +1,115 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: MIT
> +# Copyright © 2024 Intel Corporation
> +# Author: Andrzej Hajda <andrzej.hajda@intel.com>
> +
> +# List of supported platforms, in format gen100:platform, where gen100 equals
> +# to minimal GPU generation supported by platform multiplied by 100 and platform
> +# is one of platforms supported by -p switch of iga64.
> +#
> +# Must be in decreasing order, the last one must have gen100 equal 0"
> +GEN_VERSIONS="2000:2 1272:12p72 1250:12p5 0:12p1"
> +
> +warn() {
> +    echo -e "$1" >/dev/stderr
> +}
> +
> +die() {
> +    warn "DIE: $1"
> +    exit 1
> +}
> +
> +# parse args
> +while getopts ':i:o:' opt; do
> +    case $opt in
> +    i) INPUT=$OPTARG;;
> +    o) OUTPUT=$OPTARG;;
> +    ?) die "Usage: $0 -i pre-generated-iga64-file -o generated-iga64-file libs-with-iga64-assembly [...]"
> +    esac
> +done
> +LIBS=${@:OPTIND}
> +
> +# read all assemblies into ASMS array
> +ASMS=()
> +while  read -d $'\0' asm; do
> +    test -z "$asm" && continue
> +    ASMS+=( "$asm" )
> +done < <(for f in $LIBS; do objcopy --dump-section .iga64_assembly=/dev/stdout $f.p/*.o; done)
> +
> +# check if we need to recompile - checksum difference and compiler present
> +MD5_ASMS="$(md5sum <<< "${ASMS[@]}" | cut -b1-32)"
> +MD5_PRE="$(grep -Po '(?<=^#define MD5_SUM_IGA64_ASMS )\S{32,32}' $INPUT 2>/dev/null)"
> +
> +if [ "$MD5_ASMS" = "$MD5_PRE" ]; then
> +    echo "iga64 assemblies not changed, reusing pre-compiled file $INPUT."
> +    cp $INPUT $OUTPUT
> +    exit 0
> +fi
> +
> +type iga64 >/dev/null || {
> +    warn "WARNING: iga64 assemblies changed, but iga64 compiler not present, CHANGES will have no effect. Install iga64 (libigc-tools package) to re-compile code."
> +    cp $INPUT $OUTPUT
> +    exit 0
> +}
> +
> +# generate code file
> +WD=$OUTPUT.d
> +mkdir -p $WD
> +
> +# check if all required platforms are supported
> +touch $WD/empty
> +for gen in $GEN_VERSIONS; do
> +    gen_name="${gen#*:}"
> +    iga64 -p=$gen_name -d $WD/empty 2>/dev/null || {
> +        warn "WARNING: iga64 assemblies changed, but iga64 compiler does not support platform '$gen_name', CHANGES will have no effect. Update iga64 (libigc-tools package) to re-compile code."
> +        cp $INPUT $OUTPUT
> +        exit 0
> +    }
> +done
> +
> +# returns count of numbers in strings of format "0x1234, 0x23434, ..."
> +dword_count() {
> +    n=${1//[^x]}
> +    echo ${#n}
> +}
> +
> +echo "Generating new $OUTPUT"
> +
> +cat <<-EOF >$OUTPUT
> +/* SPDX-License-Identifier: MIT */
> +/* Generated using $(iga64 |& head -1) */
> +
> +#include "gpgpu_shader.h"
> +
> +#define MD5_SUM_IGA64_ASMS $MD5_ASMS
> +EOF
> +
> +for asm in "${ASMS[@]}"; do
> +    asm_name="${asm%%:*}"
> +    asm_code="${asm_name/assembly/code}"
> +    asm_body="${asm#*:}"
> +    cur_code=""
> +    cur_ver=""
> +    echo -e "\nstruct iga64_template const $asm_code[] = {" >>$OUTPUT
> +    for gen in $GEN_VERSIONS; do
> +        gen_ver="${gen%%:*}"
> +        gen_name="${gen#*:}"
> +        warn "Generating $asm_code for platform $gen_name"
> +        cmd="cpp -P - -o $WD/$asm_name.$gen_name.asm"
> +        cmd+=" -DGEN_VER=$gen_ver -imacros ../lib/iga64_macros.h"
> +        eval "$cmd" <<<"$asm_body" || die "cpp error for $asm_name.$gen_name\ncmd: $cmd"
> +        cmd="iga64 -Xauto-deps -Wall -p=$gen_name"
> +        cmd+=" $WD/$asm_name.$gen_name.asm -o $WD/$asm_name.$gen_name.bin"
> +        eval "$cmd" || die "iga64 error for $asm_name.$gen_name\ncmd: $cmd"
> +        code="$(hexdump -e '"\t\t" 4/4 "0x%08x, " "\n"' $WD/$asm_name.$gen_name.bin)"
> +        [ -z "$cur_code" ] && cur_code="$code"
> +        [ "$cur_code" != "$code" ] && {
> +            echo -e "\t{ .gen_ver = $cur_ver, .size = $(dword_count "$cur_code"), .code = (const uint32_t []) {\n$cur_code\n\t}}," >>$OUTPUT
> +            cur_code="$code"
> +        }
> +        cur_ver=$gen_ver
> +    done
> +    echo -e "\t{ .gen_ver = $cur_ver, .size = $(dword_count "$cur_code"), .code = (const uint32_t []) {\n$cur_code\n\t}}\n};" >>$OUTPUT
> +done
> +
> +cp $OUTPUT $INPUT
> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
> index d14301789421..3317e9e35c91 100644
> --- a/lib/gpgpu_shader.c
> +++ b/lib/gpgpu_shader.c
> @@ -11,6 +11,9 @@
>  #include "gpgpu_shader.h"
>  #include "gpu_cmds.h"
>  
> +#define IGA64_ARG0 0xc0ded000
> +#define IGA64_ARG_MASK 0xffffff00
> +
>  #define SUPPORTED_GEN_VER 1200 /* Support TGL and up */
>  
>  #define PAGE_SIZE 4096
> @@ -22,6 +25,42 @@
>  #define GPGPU_CURBE_SIZE 0
>  #define GEN7_VFE_STATE_GPGPU_MODE 1
>  
> +static void gpgpu_shader_extend(struct gpgpu_shader *shdr)
> +{
> +	shdr->max_size <<= 1;
> +	shdr->code = realloc(shdr->code, 4 * shdr->max_size);
> +}
> +
> +void
> +__emit_iga64_code(struct gpgpu_shader *shdr, struct iga64_template const *tpls,
> +		  int argc, uint32_t *argv)
> +{
> +	uint32_t *ptr;
> +
> +	igt_require_f(shdr->gen_ver >= SUPPORTED_GEN_VER,
> +		      "No available shader templates for platforms older than XeLP\n");
> +
> +	while (shdr->gen_ver < tpls->gen_ver)
> +		tpls++;
> +
> +	while (shdr->max_size < shdr->size + tpls->size)
> +		gpgpu_shader_extend(shdr);
> +
> +	ptr = shdr->code + shdr->size;
> +	memcpy(ptr, tpls->code, 4 * tpls->size);
> +
> +	/* patch the template */
> +	for (int n, i = 0; i < tpls->size; ++i) {
> +		if ((ptr[i] & IGA64_ARG_MASK) != IGA64_ARG0)
> +			continue;
> +		n = ptr[i] - IGA64_ARG0;
> +		igt_assert(n < argc);
> +		ptr[i] = argv[n];
> +	}
> +
> +	shdr->size += tpls->size;
> +}
> +
>  static uint32_t fill_sip(struct intel_bb *ibb,
>  			 const uint32_t sip[][4],
>  			 const size_t size)
> diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
> index 02f6f1aad1e3..0b997deba8bb 100644
> --- a/lib/gpgpu_shader.h
> +++ b/lib/gpgpu_shader.h
> @@ -23,6 +23,27 @@ struct gpgpu_shader {
>  	};
>  };
>  
> +struct iga64_template {
> +	uint32_t gen_ver;
> +	uint32_t size;
> +	const uint32_t *code;
> +};
> +
> +#pragma GCC diagnostic ignored "-Wnested-externs"
> +
> +void
> +__emit_iga64_code(struct gpgpu_shader *shdr, const struct iga64_template *tpls,
> +		  int argc, uint32_t *argv);
> +
> +#define emit_iga64_code(__shdr, __name, __txt, __args...) \
> +({ \
> +	static const char t[] __attribute__ ((section(".iga64_assembly"),used)) \
> +		="iga64_assembly_" #__name ":" __txt "\n"; \
> +	extern struct iga64_template const iga64_code_ ## __name[]; \
> +	u32 args[] = { __args }; \
> +	__emit_iga64_code(__shdr, iga64_code_ ## __name, ARRAY_SIZE(args), args); \
> +})
> +
>  struct gpgpu_shader *gpgpu_shader_create(int fd);
>  void gpgpu_shader_destroy(struct gpgpu_shader *shdr);
>  
> @@ -35,4 +56,8 @@ void gpgpu_shader_exec(struct intel_bb *ibb,
>  		       struct gpgpu_shader *sip,
>  		       uint64_t ring, bool explicit_engine);
>  
> +void gpgpu_shader__eot(struct gpgpu_shader *shdr);
> +void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
> +			       uint32_t y_offset);
> +
>  #endif /* GPGPU_SHADER_H */
> diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
> new file mode 100644
> index 000000000000..219436983585
> --- /dev/null
> +++ b/lib/iga64_generated_codes.c
> @@ -0,0 +1,6 @@
> +/* SPDX-License-Identifier: MIT */
> +/* Generated using Intel Graphics Assembler 1.1.0-int */
> +
> +#include "gpgpu_shader.h"
> +
> +#define MD5_SUM_IGA64_ASMS 68b329da9893e34099c7d8ad5cb9c940
> diff --git a/lib/iga64_macros.h b/lib/iga64_macros.h
> new file mode 100644
> index 000000000000..008ef795d2ce
> --- /dev/null
> +++ b/lib/iga64_macros.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: MIT */
> +/* Copyright © 2024 Intel Corporation */
> +

Add standard #ifndef/define/undef IGA64_MACROS_H
here.

> +#define ARG(n) (0xc0ded000 + n)
---------- ^^^

A little too short name for macro.

Regards,
Kamil

> +
> +/* send instruction for DG2+ requires 0 length in case src1 is null, BSpec: 47443 */
> +#if GEN_VER < 1271
> +#define src1_null null
> +#else
> +#define src1_null null:0
> +#endif
> diff --git a/lib/meson.build b/lib/meson.build
> index 0a3084f8aea2..46594062e019 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -216,7 +216,10 @@ lib_version = vcs_tag(input : 'version.h.in', output : 'version.h',
>  		      fallback : 'NO-GIT',
>  		      command : vcs_command )
>  
> +iga64_assembly_sources = [ 'gpgpu_shader.c' ]
> +
>  lib_intermediates = []
> +iga64_assembly_libs = []
>  foreach f: lib_sources
>      name = f.underscorify()
>      lib = static_library('igt-' + name,
> @@ -230,8 +233,23 @@ foreach f: lib_sources
>  	])
>  
>      lib_intermediates += lib
> +    if iga64_assembly_sources.contains(f)
> +	iga64_assembly_libs += lib
> +    endif
>  endforeach
>  
> +generate_iga64_codes = find_program('generate_iga64_codes')
> +iga64_generated_codes = custom_target(
> +    'iga64_generated_codes.c',
> +    input : [ 'iga64_generated_codes.c' ] + iga64_assembly_libs,
> +    output : 'iga64_generated_codes.c',
> +    command : [ generate_iga64_codes, '-o', '@OUTPUT@', '-i', '@INPUT@' ]
> +)
> +
> +lib_intermediates += static_library('igt-iga64_generated_codes.c',
> +			[ iga64_generated_codes, lib_version ]
> +		     )
> +
>  lib_igt_build = shared_library('igt',
>      ['dummy.c'],
>      link_whole: lib_intermediates,
> 
> -- 
> 2.34.1
> 
