Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243E3D65C6C
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 10:59:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B745A10E280;
	Thu, 14 Nov 2024 10:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n6EBzewW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B94F10E280
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 10:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731581983; x=1763117983;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Q/W9X79sAoFSaTQQvpRZ4vRB9gv+gCQoUWEAQ0WeEXA=;
 b=n6EBzewWceVqDK7189P337WBjslIES787+a5gMWqAXYl4/P/7IFHvL5E
 5u1I4P8GGEn8GzgaCnDUxDViGHvLObvqL+ZnEABnR8PvBXCACKBi+Wkhf
 80hWj6zkus968rLjNHfBvF6g2aMP7KLcp65GCedVfVhCdZ87Rr6lSSaUD
 5kIZH38wxRBPWd0FWHddulgdMiSv17HfL6GdZSfe04r7a3n0+slYaVi/z
 0oiuS//aHy9DMpixFDvVBqtI221O3xn8M3GzMcyoV/ZL+/GJ40uNT2tXi
 tmmkqm5D9ItWxsRw5yEFRUQE0b6VXIFeG/T5lczeInDXazD4hQhg3cU0S Q==;
X-CSE-ConnectionGUID: oHXPFttaTQi5/X8bJAKjTQ==
X-CSE-MsgGUID: riUidwSqS2q0YXNRyaPVvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="49032872"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="49032872"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 02:59:42 -0800
X-CSE-ConnectionGUID: ZPra8WDBTsGatNXRdcNLdw==
X-CSE-MsgGUID: 4A+oQ8k7SyCk1r3PJtqmVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="111477950"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.12])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 02:59:41 -0800
Date: Thu, 14 Nov 2024 11:59:38 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH 1/2] scripts/generate_iga64_codes: add iga64_macros.h to
 checksum calculation
Message-ID: <20241114105938.53lxospctgmmssch@zkempczy-mobl2>
References: <20241114-gpgpu_send_rework-v1-0-e0914e09e7b2@intel.com>
 <20241114-gpgpu_send_rework-v1-1-e0914e09e7b2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241114-gpgpu_send_rework-v1-1-e0914e09e7b2@intel.com>
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

On Thu, Nov 14, 2024 at 11:31:38AM +0100, Andrzej Hajda wrote:
> Since generated code depends on iga64_macros.h assemblies should be
> recompiled on it's change as well.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  lib/iga64_generated_codes.c  | 2 +-
>  lib/meson.build              | 1 +
>  scripts/generate_iga64_codes | 2 +-
>  3 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
> index 6638be07b356..0bd92b8c4dc9 100644
> --- a/lib/iga64_generated_codes.c
> +++ b/lib/iga64_generated_codes.c
> @@ -3,7 +3,7 @@
>  
>  #include "gpgpu_shader.h"
>  
> -#define MD5_SUM_IGA64_ASMS ec9d477415eebb7d6983395f1bcde78f
> +#define MD5_SUM_IGA64_ASMS e2d97ef45d5f322200793a0aa76872d7
>  
>  struct iga64_template const iga64_code_gpgpu_fill[] = {
>  	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
> diff --git a/lib/meson.build b/lib/meson.build
> index c3556a921adf..cec148388b77 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -248,6 +248,7 @@ iga64_generated_codes = custom_target(
>      'iga64_generated_codes.c',
>      input : [ 'iga64_generated_codes.c' ] + iga64_assembly_libs,
>      output : 'iga64_generated_codes.c',
> +    depend_files : 'iga64_macros.h',
>      command : [ generate_iga64_codes, '-o', '@OUTPUT@', '-i', '@INPUT@' ]
>  )
>  
> diff --git a/scripts/generate_iga64_codes b/scripts/generate_iga64_codes
> index bbf1f7008242..652bf01a080c 100755
> --- a/scripts/generate_iga64_codes
> +++ b/scripts/generate_iga64_codes
> @@ -40,7 +40,7 @@ while  read -d $'\0' asm; do
>  done < <(for f in $LIBS; do objcopy --dump-section .iga64_assembly=/dev/stdout $f.p/*.o /dev/null; done)
>  
>  # check if we need to recompile - checksum difference and compiler present
> -MD5_ASMS="$(md5sum <<< "${ASMS[@]}" | cut -b1-32)"
> +MD5_ASMS="$(md5sum <<< "$(< ../lib/iga64_macros.h) ${ASMS[@]}" | cut -b1-32)"
>  MD5_PRE="$(grep -Po '(?<=^#define MD5_SUM_IGA64_ASMS )\S{32,32}' $INPUT 2>/dev/null)"
>  
>  if [ "$MD5_ASMS" = "$MD5_PRE" ]; then
> 
> -- 
> 2.34.1
> 

LGTM but I've some nit - please add some comment to igt64_macros.h
in which you inform the person who's changing the header that after
rebuilding lib/iga64_generated_codes.c must be added to commit to
avoid MD5 sum mismatch.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
