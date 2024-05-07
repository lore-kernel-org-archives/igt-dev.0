Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21400C10F1A
	for <igt-dev@archiver.kernel.org>; Tue,  7 May 2024 18:22:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74F51125B8;
	Tue,  7 May 2024 18:22:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lgYTNMGM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB61B1125D4
 for <igt-dev@lists.freedesktop.org>; Tue,  7 May 2024 18:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715106131; x=1746642131;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SKWq3evZmyWQbP3oEQntahx5I/TB2qZ0ndW58tZfdoA=;
 b=lgYTNMGM/MG2QP0Pfyln2tog+X/i+1LqThHwZVtuMm0/hnFcp5S0MY8j
 n+KPNSghs2+vWUYj4b1Znzayq1xQdpIips32GQ0stbIAeRh2mo7jfKB7p
 KjGzAw1hQNoSZUVJzSZP/GuO78YEzBDtzfj+P9dwlRVk27d8sHuqAu0mY
 Jf96IqXokuVq7OFQ3N1HptePRpJ1asGCg0b4ODFpi3/5Xa+DTFEfrHPQZ
 m5CGv24i2iO+OAqOSkFJ4FTu/4WmKt4hWyYUXtGHkMj7raMsQIEditz+V
 iUrC/hwx+nd32CouQfcWFhnonoC0tUR1IeXWgewmxqlJiqFdvuClYB0o2 Q==;
X-CSE-ConnectionGUID: 51v7pVpkR1eLnLk/ojc6aQ==
X-CSE-MsgGUID: DbVdoggUQ5WhoT5GF705YA==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="36304814"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="36304814"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 11:22:10 -0700
X-CSE-ConnectionGUID: bI8ZhxE/SRyF3dtQqL0UhQ==
X-CSE-MsgGUID: GOReE0PmS9CMffCMIW6K4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="33418342"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 11:22:09 -0700
Date: Tue, 7 May 2024 20:22:06 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH 1/4] gputop: print percentage number
Message-ID: <20240507182206.klvgx62pplmvtbix@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
References: <20240501173303.115737-1-lucas.demarchi@intel.com>
 <20240501173303.115737-2-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240501173303.115737-2-lucas.demarchi@intel.com>
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
On 2024-05-01 at 12:33:00 -0500, Lucas De Marchi wrote:
> Besides printing the bar, also print the raw number for easy
> visualization of small quantities. While at it, make sure gputop still
> works with small console widths.
> 
> v2: Use %5.1f instead of %.1f so it also aligns the non-decimal part
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tools/gputop.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/gputop.c b/tools/gputop.c
> index 8cec951b4..7fd9e9790 100644
> --- a/tools/gputop.c
> +++ b/tools/gputop.c
> @@ -42,17 +42,19 @@ static void n_spaces(const unsigned int n)
>  
>  static void print_percentage_bar(double percent, int max_len)
>  {
> -	int bar_len, i, len = max_len - 2;
> +	int bar_len, i, len = max_len - 1;
>  	const int w = 8;
>  
> -	assert(max_len > 0);
> +	len -= printf("|%5.1f%% ", percent);
> +
> +	/* no space left for bars, do what we can */
> +	if (len < 0)
> +		len = 0;
>  
>  	bar_len = ceil(w * percent * len / 100.0);
>  	if (bar_len > w * len)
>  		bar_len = w * len;
>  
> -	putchar('|');
> -
>  	for (i = bar_len; i >= w; i -= w)
>  		printf("%s", bars[w]);
>  	if (i)
> -- 
> 2.45.0
> 
