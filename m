Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D67860A2622
	for <igt-dev@archiver.kernel.org>; Fri, 20 Nov 2026 19:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VmLNq86f
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4EF112CB9;
	Fri, 20 Nov 2026 19:00:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5828E112C3E
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Nov 2026 18:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795201182; x=1826737182;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=B31YaHOZ+N9XSteMh4aK/5azdua6l552WtE0LxQKCgE=;
 b=VmLNq86fJLQHIwEOgdsZkLFtMvNN374SDwTWgyHcQAzeLLWSi81QMebg
 Lf4rqnH0W+6w91OTRSf+x1AHXW5ynqueHXUEdmaYG/IGK0zfbDWbcdUgF
 O69ij9Vrz7kLLJgHExwY5/tgIox+5gLaa8qstdc2gKBUIFT7Luvbyg5yX
 yBkTk62aXRMOoYQrb1TggYVeqCJ4Oe02mE7nxo0m8O1qb4TJk6s2SLgLh
 tCqI3A6MmP03x33II0UTnvsG5Brs/kImo4TyxyYEMBh5DWEtGhAm0XERS
 uyLr1ltDnN64tG2+5ksanBaw4sutLpI605VagyHNGMyAnHbP+ziF8vGE0 A==;
X-CSE-ConnectionGUID: nSt82tTHQ2aBGaxJRistaw==
X-CSE-MsgGUID: WDtpYq6JQXaHqid3QvGXVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4095937"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4095937"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 10:59:41 -0800
X-CSE-ConnectionGUID: +wA64NfsSam2IjJxFRN0rQ==
X-CSE-MsgGUID: nkzxmBcsRIGGj25JsR/2aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="10778230"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 10:59:40 -0800
Date: Fri, 20 Nov 2026 19:59:20 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Subject: Re: [PATCH] scripts/generate_iga64_codes: do not check/rebuild on
 cross-build env
Message-ID: <dwhm2a2cgsyxcasrvgdpj33ioxa66udgivsdui7lcbknptptsh@i6sglzoirn6j>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, igt-dev@lists.freedesktop.org, 
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
References: <20261120-do_not_build_geinsa_on_cross-v1-1-ed5082a06680@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261120-do_not_build_geinsa_on_cross-v1-1-ed5082a06680@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andrzej,
On 2026-11-20 at 16:48:48 +0100, Andrzej Hajda wrote:
> Cross-building IGT should be possible, but checking/re-building iga64
> codes is problematic in such case.
> Let's skip iga64 checks entirely on cross env for now.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Thank you for taking care of this, LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  lib/meson.build              | 4 +++-
>  scripts/generate_iga64_codes | 8 +++++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/meson.build b/lib/meson.build
> index 32d5029b8426..3ed1369b53d1 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -302,7 +302,9 @@ foreach f: iga64_assembly_sources
>  		input: [ f + '.gen.iga64_codes.c', libiga64_asms.extract_objects(f) ],
>  		output: name,
>  		depend_files: [ 'iga64_macros.h', generate_iga64_codes.path() ],
> -		command: [ 'env', 'IGT_SRCDIR=@SOURCE_ROOT@', generate_iga64_codes, '-o', '@OUTPUT@', '-i', '@INPUT0@', '@INPUT1@' ],
> +		command: [ 'env', 'IGT_SRCDIR=@SOURCE_ROOT@',
> +			   'IGT_IS_CROSS_BUILD=@0@'.format(meson.is_cross_build().to_int()),
> +			   generate_iga64_codes, '-o', '@OUTPUT@', '-i', '@INPUT0@', '@INPUT1@' ],
>  		console: true,
>  	)
>  endforeach
> diff --git a/scripts/generate_iga64_codes b/scripts/generate_iga64_codes
> index a5798bc596d5..6b0984c16f83 100755
> --- a/scripts/generate_iga64_codes
> +++ b/scripts/generate_iga64_codes
> @@ -34,6 +34,12 @@ while getopts ':i:o:' opt; do
>  done
>  OBJ=${@:OPTIND}
>  
> +if [ "$IGT_IS_CROSS_BUILD" = "1" ]; then
> +    warn "INFO: cross-build detected, reusing pre-compiled file $INPUT."
> +    cp -p $INPUT $OUTPUT
> +    exit 0
> +fi
> +
>  # read all assemblies into ASMS array
>  ASMS=()
>  while  read -d $'\0' asm; do
> @@ -46,7 +52,7 @@ MD5_ASMS="$(md5sum <<< "$(< $IGT_SRCDIR/lib/iga64_macros.h) ${ASMS[@]}" | cut -b
>  MD5_PRE="$(grep -Po '(?<=^#define MD5_SUM_IGA64_ASMS )\S{32,32}' $INPUT 2>/dev/null)"
>  
>  if [ "$MD5_ASMS" = "$MD5_PRE" -a "${FORCE_IGA64_REBUILD:-0}" = "0" ]; then
> -    echo "iga64 assemblies not changed, reusing pre-compiled file $INPUT."
> +    warn "INFO: iga64 assemblies not changed, reusing pre-compiled file $INPUT."
>      cp -p $INPUT $OUTPUT
>      exit 0
>  fi
> 
> ---
> base-commit: 792f1105b5f0e2bc254cf2254cc8f6aef8799659
> change-id: 20261120-do_not_build_geinsa_on_cross-202b579cc55a
> 
> Best regards,
> --  
> Andrzej Hajda <andrzej.hajda@intel.com>
> 
