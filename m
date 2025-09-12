Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B56CA101F
	for <igt-dev@archiver.kernel.org>; Fri, 12 Sep 2025 15:49:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88DF110E061;
	Fri, 12 Sep 2025 15:49:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dDtA7JE4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E43410E061
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Sep 2025 15:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757692156; x=1789228156;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3IYS+NjFiiMDjRLWlU43kqwhPWHSfy+EpdFGbq+l3Xw=;
 b=dDtA7JE4yweHerdLthZ9CjQu4S7RNtzyZyixGUmlJuEgvhqI0oSGiQvq
 Bcj6li4iNgubZRPS4yuF77zjzuvPelKwHywv9pCQDNh+n2G6cHR71Tu5u
 EQWkLxaQtWMZP+R7CL0RmSHWS7VIAU84lZVHHomwU92hhrIjR3GYx9DOq
 zCQD2Cg3g78LOTdaOpW8ROp237VGTwZqM7+9PCUPHOj2nHAPWBDoQVA0e
 VMC4BnvlJo9MOnn7X6VVgOlFT1CQbY4sUfdw2p3innZgal+C3+lTOv+pW
 QCZVepjm7ihZjOFtUnaVSPnFg4QQMZWlHAWys6CrnfLW1Y9dRxdk1X6FB Q==;
X-CSE-ConnectionGUID: 6W1nho60RQycQN391O0q3w==
X-CSE-MsgGUID: P5axPFRSQYaCFQG6lj3s3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="63671460"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="63671460"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 08:49:16 -0700
X-CSE-ConnectionGUID: NByvZY8AR7SrVKACkfUwvA==
X-CSE-MsgGUID: /L8fxEWDTm+gYdX5lpr/6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="174388387"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 08:49:14 -0700
Date: Fri, 12 Sep 2025 17:48:57 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org, saurabhg.gupta@intel.com, alex.zuo@intel.com
Subject: Re: [PATCH] lib/xe/xe_spin: Write to start only once
Message-ID: <20250912154857.xgqidegnrdb4nuo4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 igt-dev@lists.freedesktop.org, saurabhg.gupta@intel.com,
 alex.zuo@intel.com
References: <20250911210618.298333-2-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250911210618.298333-2-jonathan.cavitt@intel.com>
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

Hi Jonathan,
On 2025-09-11 at 21:06:19 +0000, Jonathan Cavitt wrote:
> Part of the loop initialized by xe_spin_init writes to the location of
> spin->start.  This is done to track that the spinner has started
> execution, and thus only needs to be performed once.  Remove this write
> from the loop section.

Makes sense, imho please change last sentence, as 'remove'
could also mean a complete removal. imho better:

s/Remove this write from the loop section/Move this write before the loop section/

This could be done at merge time. With this:

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  lib/xe/xe_spin.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index 25f7555e27..72b13ef424 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -69,13 +69,13 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
>  		spin->batch[b++] = CS_GPR(START_TS);
>  	}
>  
> -	loop_addr = opts->addr + b * sizeof(uint32_t);
> -
>  	spin->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>  	spin->batch[b++] = start_addr;
>  	spin->batch[b++] = start_addr >> 32;
>  	spin->batch[b++] = 0xc0ffee;
>  
> +	loop_addr = opts->addr + b * sizeof(uint32_t);
> +
>  	if (opts->preempt)
>  		spin->batch[b++] = MI_ARB_CHECK;
>  
> -- 
> 2.43.0
> 
