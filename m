Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF35E7717F
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 14:11:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC40B10EDE2;
	Thu, 12 Dec 2024 14:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gXgYxAdt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CEE110EDE2
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2024 14:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734012697; x=1765548697;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kcVJsfmdkrkP1cwF02QaN7vJR0FDur+K5n9hbxspe7U=;
 b=gXgYxAdtcovAsi6MVkpnIqyFxBfFr0wvG1CuslbX4BbBAJZKfDU3opuI
 SY5NIuITeaFAG48RF9wL27Y0dnF50lYgBuVNzYDeqZ1U9KLzcS92IK6sE
 ipHseXzScFmQCkS6j3647v2GXR5UYYEAOQITsh42NET1KBCjOaC0KFB0v
 CDEWjaG41kxUTJ74G7UPFRPD83UhQd5NeAsdkM+rnC3Xon2sY3IugEOiT
 aad211HwlcyhwyBvtgJw1RbsjgMmcREkZSkAODTaCOsq6rdM5gep8qy5L
 2hvjvouwq8uOjjRGyElXJNMWmCNb0bGU6cbojVBHJ0wlwDhsIIbpItEEy g==;
X-CSE-ConnectionGUID: iKxoOm+HSVuN+JVtdPg4Ag==
X-CSE-MsgGUID: HYjKVKn5QWqcZ2lb95XLJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="59825926"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; d="scan'208";a="59825926"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 06:11:36 -0800
X-CSE-ConnectionGUID: w0ekjqUDTQ2zxJShy5p2vA==
X-CSE-MsgGUID: 0ff/E5qaRiutZPOGQDtIdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="127228611"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 06:11:35 -0800
Date: Thu, 12 Dec 2024 15:11:17 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH] scripts/generate_iga64_codes: fix path of iga64_macros.h
Message-ID: <20241212141117.5o4y2jscmwzw3fhc@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 igt-dev@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
References: <20241212-fix_iga64_macros_path-v1-1-9e8d149c8667@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241212-fix_iga64_macros_path-v1-1-9e8d149c8667@intel.com>
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
On 2024-12-12 at 13:45:39 +0100, Andrzej Hajda wrote:
> The build process fails if the build dir is not a subdir of the project.
> 
> Fixes: cba1773fd01d ("scripts/generate_iga64_codes: add iga64_macros.h to checksum calculation")
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Works for me and looks good,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/meson.build              | 2 +-
>  scripts/generate_iga64_codes | 6 ++++--
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/meson.build b/lib/meson.build
> index 640513e6c52c..beaf43dffc5b 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -252,7 +252,7 @@ iga64_generated_codes = custom_target(
>      input : [ 'iga64_generated_codes.c' ] + iga64_assembly_libs,
>      output : 'iga64_generated_codes.c',
>      depend_files : 'iga64_macros.h',
> -    command : [ generate_iga64_codes, '-o', '@OUTPUT@', '-i', '@INPUT@' ]
> +    command : [ 'env', 'IGT_SRCDIR=@0@'.format(source_root), generate_iga64_codes, '-o', '@OUTPUT@', '-i', '@INPUT@' ]
>  )
>  
>  lib_intermediates += static_library('igt-iga64_generated_codes.c',
> diff --git a/scripts/generate_iga64_codes b/scripts/generate_iga64_codes
> index 652bf01a080c..3f207e9ff1a8 100755
> --- a/scripts/generate_iga64_codes
> +++ b/scripts/generate_iga64_codes
> @@ -22,6 +22,8 @@ die() {
>      exit 1
>  }
>  
> +: ${IGT_SRCDIR:=..}
> +
>  # parse args
>  while getopts ':i:o:' opt; do
>      case $opt in
> @@ -40,7 +42,7 @@ while  read -d $'\0' asm; do
>  done < <(for f in $LIBS; do objcopy --dump-section .iga64_assembly=/dev/stdout $f.p/*.o /dev/null; done)
>  
>  # check if we need to recompile - checksum difference and compiler present
> -MD5_ASMS="$(md5sum <<< "$(< ../lib/iga64_macros.h) ${ASMS[@]}" | cut -b1-32)"
> +MD5_ASMS="$(md5sum <<< "$(< $IGT_SRCDIR/lib/iga64_macros.h) ${ASMS[@]}" | cut -b1-32)"
>  MD5_PRE="$(grep -Po '(?<=^#define MD5_SUM_IGA64_ASMS )\S{32,32}' $INPUT 2>/dev/null)"
>  
>  if [ "$MD5_ASMS" = "$MD5_PRE" ]; then
> @@ -90,7 +92,7 @@ EOF
>  # Compiles assembly to binary representation sent to stdout.
>  compile_iga64() {
>      cmd="cpp -P - -o $WD/$asm_name.$gen_name.asm"
> -    cmd+=" -DGEN_VER=$gen_ver -D'ARG(n)=($IGA64_ARG0 + (n))' -imacros ../lib/iga64_macros.h"
> +    cmd+=" -DGEN_VER=$gen_ver -D'ARG(n)=($IGA64_ARG0 + (n))' -imacros $IGT_SRCDIR/lib/iga64_macros.h"
>      eval "$cmd" <<<"$asm_body" || die "cpp error for $asm_name.$gen_name\ncmd: $cmd"
>      cmd="iga64 -Xauto-deps -Wall -p=$gen_name"
>      cmd+=" $WD/$asm_name.$gen_name.asm"
> 
> ---
> base-commit: 7812065f4aebab1629b570bd78ef71e09480b359
> change-id: 20241212-fix_iga64_macros_path-5c38885d3d94
> 
> Best regards,
> -- 
> Andrzej Hajda <andrzej.hajda@intel.com>
> 
