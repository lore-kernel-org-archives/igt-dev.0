Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850CDC5AD49
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 15:02:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F7010E1F8;
	Tue,  3 Jun 2025 15:02:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="atv2QKFO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696C210E1F8
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 15:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748962940; x=1780498940;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=f63hN+A8t4DcS6X5xiHtPXY+7FtLT01I5+pVyFiskPQ=;
 b=atv2QKFO9o4xArSDCHUryoA5KLfed73aQbduX340cM24OymycHnvqxVk
 N2+DUhxX5yYTj+5E/+u3PrXovBA68qzn47tqnMl+CEZLeMTHkLS7+CMCI
 N5emVgzWEtmGxeoBJeZLHGNu1Xg4Se+iAHlo6oUa9jMK6b/ZrHiRTpRAX
 WKH4sYA6fKOXLomWozHc5iBhJMbqyM16Uwhv7hAK2nQdhoVHDXqCLwJZQ
 O2nk2naClfUHmkpUR7ldpfaXmWU4/MuBAjHBaCstbYAEcfwyDZOna338w
 3yhxYakaucGDu5wqPGzNv3qLTXJygoU2CO5U0sdXT6gZTsWiH6I43FB/X g==;
X-CSE-ConnectionGUID: qksrR8D7TNG8yn8v5ii7CA==
X-CSE-MsgGUID: 2bLV1aJcRGuuuoJCaRJcyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="53635763"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="53635763"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 08:02:20 -0700
X-CSE-ConnectionGUID: FjtOzft8QpSE7phXB4gM7A==
X-CSE-MsgGUID: XurSdsnrQmiPF2Xsi7uUvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="144774187"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 08:02:19 -0700
Date: Tue, 3 Jun 2025 17:02:16 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bram Stolk <b.stolk@gmail.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t] xe-perf-record: use correct sysctl suggestion.
Message-ID: <20250603150216.zv643sipdwhdzzhm@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Bram Stolk <b.stolk@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <CABYXEks8fkP15bNZJyr3A49F1eNbn1MPnYLkUtNm6FCP=nksgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CABYXEks8fkP15bNZJyr3A49F1eNbn1MPnYLkUtNm6FCP=nksgA@mail.gmail.com>
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

Hi Bram,
On 2025-06-02 at 19:55:46 -0700, Bram Stolk wrote:
> From e03269c796207749afe2f7d49ac64b672e7185af Mon Sep 17 00:00:00 2001
> From: Bram Stolk <b.stolk@gmail.com>
> Date: Sat, 31 May 2025 11:40:18 -0700
> Subject: [PATCH i-g-t] xe-perf-record: use correct sysctl suggestion.

imho subject
[PATCH i-g-t] xe-perf-record: use correct sysctl suggestion.

would be better with:
[PATCH i-g-t] tools/xe-perf/xe-perf-record: Fix printing sysctl suggestion

This could be done at merge, no need for resend.

> 
> On xe, perf_stream_paranoid is not used.
> Instead, observation_paranoid should be used.
> 

+cc Ashutosh Dixit <ashutosh.dixit@intel.com>

> Signed-off-by: Bram Stolk <b.stolk@gmail.com>
> ---
>  tools/xe-perf/xe_perf_recorder.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/xe-perf/xe_perf_recorder.c
> b/tools/xe-perf/xe_perf_recorder.c
> index 9cf51f3e1..5bd91aeb1 100644
> --- a/tools/xe-perf/xe_perf_recorder.c
> +++ b/tools/xe-perf/xe_perf_recorder.c
> @@ -1137,7 +1137,7 @@ main(int argc, char *argv[])
>   if (ctx.metric_set->perf_oa_metrics_set == 0) {
>   fprintf(stderr,
>   "Unable to load performance configuration, consider running:\n"
> - "   sysctl dev.xe.perf_stream_paranoid=0\n");
> + "   sysctl dev.xe.observation_paranoid=0\n");

I needed to tweak a little so this will apply. Besides looks ok,

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Thank you for contribution,

Regards,
Kamil

>   goto fail;
>   }
> 
> -- 
> 2.48.1
