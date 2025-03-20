Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B2AC28B30
	for <igt-dev@archiver.kernel.org>; Thu, 20 Mar 2025 17:01:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A40310E28B;
	Thu, 20 Mar 2025 17:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dhl0D/bE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92ADA10E3AD
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Mar 2025 17:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742490118; x=1774026118;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1ThmEePVusurlAE6WFuL612F8fp0Dr72mufLx61Qfsw=;
 b=dhl0D/bE4yZqEmK02NlzkcLqlRsoOofFF03XuEKZWOLSosQp1xW4I63j
 MTEAzwj2bkhVNXXcwyx4b/bqSPLKMZnxVYNd5QFj3nYKf7QNNGWRn0l9h
 yo8hbv1Z8H4z/1h/Nj34O6+Q0RRRR8G4G0MrFWgbCiDuC4Ceui5XqH7VE
 IkW1u9iw7GKYhSFfmGV4uWh80taiBmF4sCw3o4GA1ev+TwsUrUeE1nzM0
 YN/QS5/5ph/SY0EotbkG5kG5JD4E1mGNsmXoI7z18EBguTHPMrUPaNzt2
 RG7BuRegLg2VaZzFXcYQog4EXNbhQwjhMjPk/JiS7lxbD8CH2TXcfW3gh A==;
X-CSE-ConnectionGUID: fOhMv322THiEui1GQYAS1A==
X-CSE-MsgGUID: DPT5MwlXTX+PR8iB8Q/pEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43868350"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="43868350"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 10:01:52 -0700
X-CSE-ConnectionGUID: ZKwgcas1TQqjkjDUSuabtA==
X-CSE-MsgGUID: rd9UVJP6SfimvoJbMNE1rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="154149917"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 10:01:51 -0700
Date: Thu, 20 Mar 2025 18:01:49 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH 3/4] scripts/generate_iga64_codes: fix handling empty asms
Message-ID: <20250320170149.3up6icbkx6qzmckm@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20250314-iga64_misc-v1-0-b2d1337b808d@intel.com>
 <20250314-iga64_misc-v1-3-b2d1337b808d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250314-iga64_misc-v1-3-b2d1337b808d@intel.com>
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
On 2025-03-14 at 15:59:10 +0100, Andrzej Hajda wrote:
> Script incorrectly handled empty asms in case of the newest
> platforms.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/generate_iga64_codes | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/generate_iga64_codes b/scripts/generate_iga64_codes
> index 16bdc6fd6d0f..bfef0e5c2853 100755
> --- a/scripts/generate_iga64_codes
> +++ b/scripts/generate_iga64_codes
> @@ -104,7 +104,7 @@ for asm in "${ASMS[@]}"; do
>      asm_name="${asm%%:*}"
>      asm_code="${asm_name/assembly/code}"
>      asm_body="${asm#*:}"
> -    cur_code=""
> +    cur_code="NONE"
>      cur_ver=""
>      echo -e "\nstruct iga64_template const $asm_code[] = {" >>$OUTPUT
>      for gen in $GEN_VERSIONS; do
> @@ -117,7 +117,7 @@ for asm in "${ASMS[@]}"; do
>          done
>          SHOW_CMD=1 compile_iga64 > "$WD/$asm_name.$gen_name.bin" || die "Cannot write to $WD/$asm_name.$gen_name.bin"
>          code="$(hexdump -v -e '"\t\t" 4/4 "0x%08x, " "\n"' $WD/$asm_name.$gen_name.bin)"
> -        [ -z "$cur_code" ] && cur_code="$code"
> +        [ "$cur_code" = "NONE" ] && cur_code="$code"
>          [ "$cur_code" != "$code" ] && {
>              echo -e "\t{ .gen_ver = $cur_ver, .size = $(dword_count "$cur_code"), .code = (const uint32_t []) {\n$cur_code\n\t}}," >>$OUTPUT
>              cur_code="$code"
> 
> -- 
> 2.34.1
> 
