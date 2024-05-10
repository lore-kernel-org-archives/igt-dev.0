Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25704C25B10
	for <igt-dev@archiver.kernel.org>; Fri, 10 May 2024 17:53:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1EA210E0A9;
	Fri, 10 May 2024 17:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lWWDtqlZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5342210E0A9
 for <igt-dev@lists.freedesktop.org>; Fri, 10 May 2024 17:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715363629; x=1746899629;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xajzfEbhJcgO+LfiKUyBpDHXu3NTUnbT3fgX74KB2Os=;
 b=lWWDtqlZgMJOc5jlb3IuCKBl6InT/KjxiIMhUhO8r3+F28wb+TEDplpb
 drvOOXTYCj157yiw10ktqk0vyvJQpm8LbhmTKqW36B7Sv7ly+xO3jq901
 +5B32nQMp4JpcUWX3TPzNLA2K539C/G8w+GgvOzF13HByJ0ZMVC0EcQPP
 yjReVirN5Rcr/+GY1zWOWtNxbzYrtDYXeilYyENqgRpanAjhnT+/JtCcg
 mn2KSYsv8Ut+cdXOx8/9H/EXrAImb84Ui+YS5tWSeWDOmuOMli1b7Rxjc
 ingoxiuLWaSs2dg9lDCtxR4ADvNfHai0ijWT4mDTZsLLJFgWpTrarFJoE g==;
X-CSE-ConnectionGUID: vi9h2ud0RZKH+PHAAP7hbw==
X-CSE-MsgGUID: yPvnPnBOS2OKgwEPPpAWSw==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="21958842"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="21958842"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 10:53:48 -0700
X-CSE-ConnectionGUID: Ab8irNOcRXi/hQ7xhL7aCQ==
X-CSE-MsgGUID: aFgKx0/JRc25n6La0yMLTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="30250608"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 10:53:46 -0700
Date: Fri, 10 May 2024 19:53:43 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH i-g-t] lib/i915/perf: Accumulate clocks for MPEC format too
Message-ID: <20240510175343.353nuuzddxzmpsoh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20240510170450.2404385-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240510170450.2404385-1-ashutosh.dixit@intel.com>
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

Hi Ashutosh,
On 2024-05-10 at 10:04:50 -0700, Ashutosh Dixit wrote:
> Clocks/gpu_ticks should also be accumulated in intel_perf_accumulate_reports.
> 
> Fixes: cbe11c2939f8 ("lib/i915/perf: Add support for select MPEC formats")
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/i915/perf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/i915/perf.c b/lib/i915/perf.c
> index bbfa360607..9333edfebb 100644
> --- a/lib/i915/perf.c
> +++ b/lib/i915/perf.c
> @@ -928,7 +928,7 @@ void intel_perf_accumulate_reports(struct intel_perf_accumulator *acc,
>  			deltas[idx++] += (end64[1] - start64[1]) >> (-perf->devinfo.oa_timestamp_shift);
>  
>  		/* 64 bit clock */
> -		deltas[idx++] = end64[3] - start64[3];
> +		deltas[idx++] += end64[3] - start64[3];
>  
>  		/* 8x 32bit MPEC counters */
>  		for (i = 0; i < 8; i++)
> -- 
> 2.41.0
> 
