Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2FAE68974
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 10:35:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF2A510E842;
	Thu, 31 Oct 2024 10:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WMiZuMoY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F0610E842
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Oct 2024 10:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730370949; x=1761906949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tAV/laTyLVh4PGzaL1qmkJuLVsHu1i/6qQYRW6HbYD8=;
 b=WMiZuMoYNabzLRmCyKnnC7eT6eZMAZGJ2Ml5w3nGODZ8ZqnsGv6/FjBt
 k4Ue6mfUycieQ/6tkNYGQsA0ssLfkY0OlVWqc5NrgTvsiIhm/SqbejneX
 zGi26S4Ujy9TgupBBX0dFHqDeRqdVtA7W6xvRQcUBgUywG+kTnEisSMpq
 ZWu597MCWnlPK0IoQkBktL3JBc8WDUp36nzVWX9VZ/vUnUSrL9INemEwy
 XQsrN4BuesHDaarYNRBpoDZk2Jzc5zG30BF9iI9kWXlxTq0lhvf8zXnh/
 UzZz3otN+XhJ3RPgAbdyRzz6IY7fgWVCf2cfvf01cymyMsGRMP9E9KmNs w==;
X-CSE-ConnectionGUID: 5t5PxgdNQoGUmuKQuoAOJw==
X-CSE-MsgGUID: 1AGf+IIsTJG0YcNnOrbuBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="30208883"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="30208883"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 03:35:49 -0700
X-CSE-ConnectionGUID: vmU54mPsRYi6bELE4Zt/oQ==
X-CSE-MsgGUID: 9ajyfDQJRD2Xzlh7i1e8Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="82709933"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.187])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 03:35:47 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/2] lib/igt_kmod: Simplify kunit_set_filtering()
Date: Thu, 31 Oct 2024 11:35:44 +0100
Message-ID: <18607894.sWSEgdgrri@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241031003142.863437-3-lucas.demarchi@intel.com>
References: <20241031003142.863437-1-lucas.demarchi@intel.com>
 <20241031003142.863437-3-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

Hi Lucas,

On Thursday, 31 October 2024 01:31:42 CET Lucas De Marchi wrote:
> igt_sysfs_set() already supports setting a 0-length value since commit
> 1c0b492a0b5c ("lib/igt_sysfs: make sure to write empty strings").
> Remove workaround in kunit_set_filtering() and simplify.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

> ---
>  lib/igt_kmod.c | 40 +++++-----------------------------------
>  1 file changed, 5 insertions(+), 35 deletions(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 4cb9e886d..5fd500384 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -939,7 +939,7 @@ static bool kunit_set_filtering(const char *filter_glob, const char *filter,
>  				const char *filter_action)
>  {
>  	int params;
> -	bool ret;
> +	bool ret = true;

NIT: Preserve Christmas tree order.

Thanks,
Janusz

>  
>  	params = open_parameters("kunit");
>  	if (igt_debug_on(params < 0))
> @@ -952,41 +952,11 @@ static bool kunit_set_filtering(const char *filter_glob, const char *filter,
>  	 * As a workaround, we use non-NULL strings that exhibit
>  	 * the same behaviour as if default NULLs were in place.
>  	 */
> -	ret = !igt_debug_on(!igt_sysfs_set(params, "filter_glob",
> -					   filter_glob ?: "*"));
> -	if (!ret)
> -		goto close;
> +	if (igt_debug_on(!igt_sysfs_set(params, "filter_glob", filter_glob ?: "*")) ||
> +	    igt_debug_on(!igt_sysfs_set(params, "filter", filter ?: "module!=none")) ||
> +	    igt_debug_on(!igt_sysfs_set(params, "filter_action", filter_action ?: "")))
> +		ret = false;
>  
> -	ret = !igt_debug_on(!igt_sysfs_set(params, "filter",
> -					   filter ?: "module!=none"));
> -	if (!ret)
> -		goto close;
> -
> -	ret = !igt_debug_on(!igt_sysfs_set(params, "filter_action",
> -					   filter_action ?: ""));
> -
> -	/*
> -	 * TODO: Drop the extra check below as soon as igt_sysfs_set()
> -	 *	 can correctly process empty strings which we are using
> -	 *	 as filter_action NULL equivalent.
> -	 *
> -	 * We need this check only when NULL is requested for "filter_action"
> -	 * and not for "filter" parameter, otherwise, even if "filter_action"
> -	 * was previously set to "skip", we don't care since our
> -	 * "module!=none" default filter guarantees that no test cases are
> -	 * filtered out to be processed as "filter_action" says.
> -	 */
> -	if (ret && !filter_action && filter) {
> -		filter_action = igt_sysfs_get(params, "filter_action");
> -
> -		ret = !(igt_debug_on_f(!filter_action,
> -				       "open() failed\n") ||
> -			igt_debug_on_f(strlen(filter_action),
> -				       "empty string not applied\n"));
> -		free((char *)filter_action);
> -	}
> -
> -close:
>  	close(params);
>  
>  	return ret;
> 




