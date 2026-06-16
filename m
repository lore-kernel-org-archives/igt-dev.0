Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285E8CD98CF
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jun 2026 09:36:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDDA910E750;
	Tue, 16 Jun 2026 09:36:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SwsclqJX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A22710E997
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jun 2026 09:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781602563; x=1813138563;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Bn3FAaFNqPflTTzpcm4Ka6WwTK/1X0EHIgbh0OQl6hk=;
 b=SwsclqJX28BiM4/NIzG9oYIFaVCTrhbEMpolz/idqNv3DcIB0N8tKlp8
 zUhw7Pf5Q9bsL+zhgtPuvEgTPgSc72vue2AjlTqeAEP6a7x8uuluyi9m0
 tv8ta3fqyM4hmkbTpn4xDlONXKFEPlQFBjz3pScvYL8kWdl1S2wor/n5H
 HL9IQwIWDMw3pFvIe8oKoFBbE6GU5tJr3t/zkAu2AkE2Uyaqk9XSp9V2d
 cZZW5isChrXmgKLqKxIMyYYAr+0Hr39dbAwbtv/CXxgJr+zy5Rbj5EL8a
 jbJ400eCl41JJnqVuh5OIl5aVCNGQEzeRxubkdUgIAmgt8bLXKCI0Qhee Q==;
X-CSE-ConnectionGUID: iYgXnl1GQ7a8PGxcHceWtQ==
X-CSE-MsgGUID: 8seD803URjSPaoOY19Ve+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82374670"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82374670"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 02:36:03 -0700
X-CSE-ConnectionGUID: 2FoCMpr0StOxK2doVYo4iw==
X-CSE-MsgGUID: mFxPsiHKQ9CWXcY50VbpyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="285831990"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.130])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 02:36:02 -0700
Date: Tue, 16 Jun 2026 11:35:59 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, enh <enh@google.com>
Subject: Re: [PATCH i-g-t v1] include/linux_scaffold: drop _AC macro
Message-ID: <bymznjea4aboe5gu2irek3kaqt7ae66zphpwldmvtfn7ey7asg@nhnz3efzfnib>
References: <20260615174422.212996-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260615174422.212996-1-kamil.konieczny@linux.intel.com>
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

On Mon, Jun 15, 2026 at 07:44:22PM +0200, Kamil Konieczny wrote:
> The macro _AC is causing a compilation error on current android
> using linux 7.0 uapi headers on RISCV. It seems the macro is not
> really needed as it is encoding only two constants, 0UL/0ULL and
> 1UL/1ULL. Drop _AC macro and write out directly these numbers.
> 
> Cc: enh <enh@google.com>
> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  include/linux_scaffold.h | 24 ++++--------------------
>  1 file changed, 4 insertions(+), 20 deletions(-)
> 
> diff --git a/include/linux_scaffold.h b/include/linux_scaffold.h
> index 0c970c860..39f68b8d2 100644
> --- a/include/linux_scaffold.h
> +++ b/include/linux_scaffold.h
> @@ -22,30 +22,14 @@ static inline s64 sign_extend64(u64 value, int index)
>  	return (s64)(value << shift) >> shift;
>  }
>  
> -#ifndef _AC
> -#  define _AC(X, Y)      X##Y
> -#else
> -#  error "_AC macro already defined"
> -#endif
> -
>  /* Make IGT build with Kernels < 4.17 */
> -#ifndef _AC
> -#  define _AC(X, Y)	__AC(X, Y)
> -#endif
> -#ifndef _UL
> -#  define  _UL(x)		(_AC(x, UL))
> -#endif
> -#ifndef _ULL
> -#  define _ULL(x)		(_AC(x, ULL))
> -#endif
> -
>  #define GENMASK(h, l) \
> -	(((~_UL(0)) - (_UL(1) << (l)) + 1) & \
> -	(~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
> +	((~0UL - (1UL << (l)) + 1) & \
> +	(~0UL >> (BITS_PER_LONG - 1 - (h))))
>  
>  #define GENMASK_ULL(h, l) \
> -	(((~_ULL(0)) - (_ULL(1) << (l)) + 1) & \
> -	(~_ULL(0) >> (BITS_PER_LONG_LONG - 1 - (h))))
> +	((~0ULL - (1ULL << (l)) + 1) & \
> +	(~0ULL >> (BITS_PER_LONG_LONG - 1 - (h))))
>  
>  #define BITS_PER_BYTE 8
>  #define BITS_PER_TYPE(t) (sizeof(t) * BITS_PER_BYTE)
> -- 
> 2.54.0
> 

LGTM,

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
