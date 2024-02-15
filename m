Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F9F3C48BC4
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 16:24:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0100C10E9A6;
	Thu, 15 Feb 2024 16:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dUMU+x04";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7382A10E9A6
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 16:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708014269; x=1739550269;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4IcHViHnvRumGzObMkQbATdPJy/9iIPpSSHpWwl34cI=;
 b=dUMU+x04WLMAdjcRWth4asCIloaW7G55C5krbKaVYy89zGfpYe3u9sSN
 8Zq9KC7vB6j0ddRg0lM5XTs9sO8eF+07UlP3j3bJjeFd8tDyyXnFaYfCb
 BqaUbjuGBGx83Rt/3jimWPknA/QIptdPXZZnIwXEwJ/G3SzO2Fzrapvbp
 boLWRdxiEblbbfaohfn48oBXr5GWfsLBBYu+2KqPRciEvEu+T8CNMYRwe
 hjRyQYq5T0uz7+LWi++IXLoxK4rVbzsW8yoR949i2G/Hssn1MjBaALwtQ
 ErCrpmLvXrfWhP9cDp6ndxmHyecbykuOHsrWokcpYdHNjh8RqTUELNWE9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="27565832"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="27565832"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 08:24:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="8184127"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 08:24:27 -0800
Date: Thu, 15 Feb 2024 17:24:10 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 01/17] scripts/code_cov_parse_info: Silent some messages
 by default
Message-ID: <20240215162410.gg6ultvr3ohamrkg@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cover.1707992666.git.mchehab@kernel.org>
 <e6fde2df69389d12b511081291843f941816d8f1.1707992666.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e6fde2df69389d12b511081291843f941816d8f1.1707992666.git.mchehab@kernel.org>
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
On 2024-02-15 at 11:27:10 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Those aren't really needed on normal output.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/code_cov_parse_info | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
> index 72a1e8c2b0ad..1498bd09cdba 100755
> --- a/scripts/code_cov_parse_info
> +++ b/scripts/code_cov_parse_info
> @@ -1030,7 +1030,7 @@ if ($has_filter) {
>  }
>  
>  my $ntests=scalar(%test_names);
> -printf "Number of tests: %d\n", $ntests if ($ntests > 1);
> +printf "Number of tests: %d\n", $ntests if ($stat && $ntests > 1);
>  
>  if ($show_files) {
>  	for my $f(sort keys %used_source) {
> -- 
> 2.43.0
> 
