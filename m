Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34998D767E3
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 16:51:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9AD010E075;
	Thu, 31 Oct 2024 16:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zn8bGC9b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54AAE10E075
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Oct 2024 16:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730393479; x=1761929479;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9V/mjDamu4V4Ghjvlk2TQCjU+qQMXFh3rFQMjexJ+o4=;
 b=Zn8bGC9blFBM+7iOeQf06kMWRbLIGK6Aulf7MdEmtR/QHOFTiInpt/I/
 kGfntzZV8ob0BRENmucbeZmU54YfhCp/AWsgdK9bfXqBPA0d9OZONOtmL
 eSwXCAhmT0wI7TdnVQRmm4B5QiA69ch0f/OvjJeAK+DNeEyMu81Ida27V
 mhhnup0Yg9/cBqGga62tZS6UpdmESMgDKT8tKN2Ygh3+ePs8b61Zf5NKk
 9DmB2lr0NHMiwd2T/UV4kOEqH7Lbby5VW53m2rfr3EcPPFYeoOCfczJw9
 Xc8OmLDL5YKBlqt14TXVbVG7/Zkih6/sgq5+b/pFk8EIIticIqzwKslqe A==;
X-CSE-ConnectionGUID: 6YDY4WzwQKObuQ4wWFohrQ==
X-CSE-MsgGUID: 8zFiJgPCT5uZIf1CP2wx1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52709368"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="52709368"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 09:51:19 -0700
X-CSE-ConnectionGUID: rzzqzHtCQR6ffJBcwf/Ihw==
X-CSE-MsgGUID: VyDXq8o2RcOnqeCwcXWGOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="87234856"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 09:51:17 -0700
Date: Thu, 31 Oct 2024 17:51:00 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeff Dagenais <jeff.dagenais@gmail.com>,
 Jeff Dagenais <jdagenais@tesla.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH i-g-t] scripts/generate_iga64_codes: prevent objcopy from
 modifying the input file
Message-ID: <20241031165100.43wkx3chdjwxnjgj@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jeff Dagenais <jeff.dagenais@gmail.com>,
 Jeff Dagenais <jdagenais@tesla.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
References: <20241030184054.73065-1-jdagenais@tesla.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241030184054.73065-1-jdagenais@tesla.com>
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

Hi Jeff,
On 2024-10-30 at 11:40:54 -0700, Jeff Dagenais wrote:
> This script uses objcopy in order to dump a section. Objcopy is meant
> for copying and expects a second argument. Failing that, it uses the
> input file as output. Even though there's no intented change to the
> file, this operation still re-writes the file completely.
> 
> In most cases, this re-writes the file as it was before. But in
> cross-compilation cases, the "objcopy" program in the PATH used here
> might be different than the toolchain which generated the ELF file.
> 
> In all cases, this causes a racy re-build of the .a, and in the worst
> case, the objcopy re-written .o and .a files are actually incompatible
> with the cross-linker used downstream in the ninja build causing failure
> to find all symbols from the libs passed to this script.
> 
> ```
> ../lib/intel_batchbuffer.c:763: undefined reference to
> `gen8_gpgpu_fillfunc'
> ../lib/intel_batchbuffer.c:762: undefined reference to
> `xehp_gpgpu_fillfunc'
> [...]
> ```
> 
> The intent of the command was just to extract info from the LIBS, not
> modify them. Using /dev/null as output file ensures the input files will
> not be modified.
> 

Thank you for a patch, if possible please subscribe to ML or expect
some delay between sending e-mail and delivering it to mailing list.

+cc Andrzej Hajda <andrzej.hajda@intel.com>

> Signed-off-by: Jeff Dagenais <jeff.dagenais@gmail.com>
> ---
>  scripts/generate_iga64_codes | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/generate_iga64_codes b/scripts/generate_iga64_codes
> index d1e40b600..bbf1f7008 100755
> --- a/scripts/generate_iga64_codes
> +++ b/scripts/generate_iga64_codes
> @@ -37,7 +37,7 @@ ASMS=()
>  while  read -d $'\0' asm; do
>      test -z "$asm" && continue
>      ASMS+=( "$asm" )
> -done < <(for f in $LIBS; do objcopy --dump-section .iga64_assembly=/dev/stdout $f.p/*.o; done)
> +done < <(for f in $LIBS; do objcopy --dump-section .iga64_assembly=/dev/stdout $f.p/*.o /dev/null; done)
>  
>  # check if we need to recompile - checksum difference and compiler present
>  MD5_ASMS="$(md5sum <<< "${ASMS[@]}" | cut -b1-32)"
> -- 
> 2.43.0
> 
