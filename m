Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF956C4829E
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 16:35:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4609C10E9CF;
	Thu, 15 Feb 2024 16:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JxfoksW7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B004910E9CF
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 16:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708014929; x=1739550929;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+PXUahx7NdCkp2bjpfxpFOwrTptITMilb+LDhjSyObI=;
 b=JxfoksW7mxO7M//5jESwdYVzXxInWoEaF8qlwzlIhNkiA6amXBsS6mCL
 mUsCDYjDjQ/09XLP31WPMl4nDEwf+8bQveZF444ZoabvmANknnnX0Bv6L
 cT1iycP40TBwrM/GZF03VihFswIjSgr543RKAdRvWX73bCAQGMNDaiDTT
 RmqV3h79Ud25W6IgLNDohT/0Kx34UA9soC5SwNfzFcQN1rcM/q7bBsHiI
 730hLkHTHgwHyOUb/JM6xFXfREzsH4F3GvcdTUVSE0VH9q9uIF512AWCN
 Nqqqeb18qdX6ClMzmgOUPoOGelECW57Ob0rOK26zsnpRJJYf9eIemmEnt A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2230654"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="2230654"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 08:35:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="34383180"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 08:35:27 -0800
Date: Thu, 15 Feb 2024 17:35:24 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 03/17] scripts/code_cov_parse_info: better handle include
 regexes
Message-ID: <20240215163524.nbpcvkitplfmz2gs@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cover.1707992666.git.mchehab@kernel.org>
 <384e42d3f04aee9b3b489f29cee0d64c7e13150d.1707992666.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <384e42d3f04aee9b3b489f29cee0d64c7e13150d.1707992666.git.mchehab@kernel.org>
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

Hi Mauro,
On 2024-02-15 at 11:27:12 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> When there are both exclude and include regexes, the include ones
> may be overriding the more generic excluded ones. So, handle them
> first.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/code_cov_parse_info | 38 ++++++++++++++++++++-----------------
>  1 file changed, 21 insertions(+), 17 deletions(-)
> 
> diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
> index d3739211b68a..ceea67a13d5a 100755
> --- a/scripts/code_cov_parse_info
> +++ b/scripts/code_cov_parse_info
> @@ -34,17 +34,24 @@ sub is_function_excluded($)
>  
>  	my $func = shift;
>  
> +	# Handle includes first, as, when there are both include and exclude
> +	# includes should take preference, as they can be overriding exclude
> +	# rules
> +	foreach my $r (@func_include_regexes) {
> +	    return 0 if ($func =~ m/$r/);
> +	}
> +
>  	foreach my $r (@func_exclude_regexes) {
>  		return 1 if ($func =~ m/$r/);
>  	}
>  
> -	return 0 if (!@func_include_regexes);
> -
> -	foreach my $r (@func_include_regexes) {
> -		return 0 if ($func =~ m/$r/);
> +	# If there are no exclude regexes, only include functions that are
> +	# explicitly included.
> +	if ($#func_exclude_regexes == 0) {
> +		return 1;
>  	}
>  
> -	return 1;
> +	return 0;
>  }
>  
>  sub is_file_excluded($)
> @@ -1178,9 +1185,10 @@ Each line at B<[filter's file]> may contain a new regex:
>  
>  =back
>  
> -When both include and exclude regexes are found, exclude regexes are
> -applied first and any functions that don't match the include regular
> -expressions from the B<[filter's file]> will be ignored.
> +Include regexes are handled first, as they can override an exclude regex.
> +
> +When just include regexes are used, any functions that don't match the
> +include regular expressions from the B<[filter's file]> will be ignored.
>  
>  Please notice that, when this filter is used, B<--ignore-unused> will be
>  automaticaly enabled, as the final goal is to report per-function usage.
> @@ -1189,7 +1197,8 @@ automaticaly enabled, as the final goal is to report per-function usage.
>  
>  Include B<regex> to the function filter. Can be used multiple times.
>  
> -When used together with B<--func-filters>, regexes here are handled first.
> +When used together with B<--func-filters> or B<--exclude-func>, regexes
> +here are handled first.
>  
>  Please notice that, when this filter is used, B<--ignore-unused> will be
>  automaticaly enabled, as the final goal is to report per-function usage.
> @@ -1198,8 +1207,6 @@ automaticaly enabled, as the final goal is to report per-function usage.
>  
>  Include B<regex> to the function filter. Can be used multiple times.
>  
> -When used together with B<--func-filters>, regexes here are handled first.
> -
>  Please notice that, when this filter is used, B<--ignore-unused> will be
>  automaticaly enabled, as the final goal is to report per-function usage.
>  
> @@ -1229,22 +1236,19 @@ Each line at B<[filter's file]> may contain a new regex:
>  
>  =back
>  
> -When both include and exclude regexes are found, exclude regexes are
> -applied first and any functions that don't match the include regular
> -expressions from the B<[filter's file]> will be ignored.
> +Include regexes are handled first, as they can override an exclude regex.
>  
>  =item B<--include-src> B<regex>
>  
>  Include B<regex> to the sources filter. Can be used multiple times.
>  
> -When used together with B<--src-filters>, regexes here are handled first.
> +When used together with B<--src-filters> and B<--exclude-src>, regexes
> +here are handled first.
>  
>  =item B<--exclude-src> B<regex>
>  
>  Include B<regex> to the sources filter. Can be used multiple times.
>  
> -When used together with B<--src-filters>, regexes here are handled first.
> -
>  =item B<--ignore-unused> or B<--ignore_unused>
>  
>  Filters out unused C files and headers from the code coverage results.
> -- 
> 2.43.0
> 
