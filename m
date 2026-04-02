Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F151CC6B02
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 14:56:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA3110E0BF;
	Thu,  2 Apr 2026 14:56:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Al/pNbkW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4DAE10E0BF
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 14:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775141777; x=1806677777;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=R+m8crYOSqfDbHE8eoQhYx2p0eT8P+FwQQ9x5tAI070=;
 b=Al/pNbkW9TJVy59H8XkVFQAEDBB1bv+vl+Vx79PB//yptXQp3CkmF2CC
 +KDSDyREm3c9qGRvr+k8iZuj9QQexRl1QANSuIOu7LA4uj2eykKo9gWyq
 aA5Qe3aAdQZwkQ7QgDjqHnJN221EUaulgLqiI1rYLmaCwUZDnbE05oNuH
 IajHET0Bab1T/MMtHPhpZEwt4p5WaNzYAEy+nj4pr3tZFX2raXz+tpT/L
 dFabiAYyxrtHR9p8jhon5vnmuux3BfuvEMMmmNlCHIfl1i1krgo+CbFnX
 NvCLpa0SbtWK7cKs3aychQCyPSlNoUGC8+hJ0ar74y6dLRXfo1F3Z/Xa7 Q==;
X-CSE-ConnectionGUID: z5KvixhlSSG7L1JLawtZSg==
X-CSE-MsgGUID: 5BA7KbGSTqC7v+zc7h+JBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="86821343"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="86821343"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 07:56:17 -0700
X-CSE-ConnectionGUID: zkq/uluzSOqCQFicvaSyig==
X-CSE-MsgGUID: U4S4m23yS7GNsFhMYafnQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="222146838"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 07:56:17 -0700
Date: Thu, 2 Apr 2026 16:56:00 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Vidya Srinivas <vidya.srinivas@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] tools/gputop: Fix zero output when stdout is not a
 terminal
Message-ID: <20260402145600.4m3qwxyqwowsvcr2@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Vidya Srinivas <vidya.srinivas@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260402134522.108322-1-vidya.srinivas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260402134522.108322-1-vidya.srinivas@intel.com>
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

Hi Vidya,
On 2026-04-02 at 19:15:21 +0530, Vidya Srinivas wrote:
> When gputop output is redirected to a file or pipe, such as:
> 
>   gputop -n 5 -d 1 > results.txt
>   gputop -n 3 -d 2 | grep rcs
> 
> ioctl(0, TIOCGWINSZ) fails with -1 since stdin is not a terminal.
> update_console_size() then returns without setting *w and *h, leaving
> con_w and con_h at their initial value of -1.
> 
> The main display loop uses 'if (lines >= con_h) break' to limit output
> to the terminal height. With con_h = -1, the condition (0 >= -1) is
> immediately true on the very first line, causing all client output to be
> silently suppressed. The result is that gputop produces only ANSI clear-
> screen escape sequences and zero actual data.
> 
> This affects anyone using gputop in automation, CI pipelines, or any
> non-interactive context on Linux or Android where output is redirected
> or piped.
> 
> Fix this by falling back to a default console size of 80x50 when the
> ioctl fails, consistent with the existing fallback for serial consoles
> (where ws_col and ws_row are both 0).
> 
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>

Good catch, LGTM

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tools/gputop.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/gputop.c b/tools/gputop.c
> index 9b2e8cb6f..112ec5ddb 100644
> --- a/tools/gputop.c
> +++ b/tools/gputop.c
> @@ -505,8 +505,11 @@ static void update_console_size(int *w, int *h)
>  {
>  	struct winsize ws = {};
>  
> -	if (ioctl(0, TIOCGWINSZ, &ws) == -1)
> +	if (ioctl(0, TIOCGWINSZ, &ws) == -1) {
> +		*w = 80;
> +		*h = 50;
>  		return;
> +	}
>  
>  	*w = ws.ws_col;
>  	*h = ws.ws_row;
> -- 
> 2.45.2
> 
