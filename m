Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9FBCAC5A5
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 06:29:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F8010E69E;
	Wed, 24 Sep 2025 06:29:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DnBSuVm/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19FBF10E69E
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 06:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758695396; x=1790231396;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WcbSXNBaO4ZjlxKaQMa04UuehrtBxEemLnoGx7zc9ww=;
 b=DnBSuVm/ZUpOuVIFPIob2ymJS5Y/dt1677SW7UYS+aKIguiNPyjcaTb0
 3t6OTDPjyRPbfzV31waqUFom7evnJZ/F/Pglt38A5moQW0GqZ5xnIKsiL
 mWMGlm8rTrJGiSH4QyOuB9l7IM43OkN4fJS3BulZ1QfocXX0TDrhI0XvG
 Baa0Rk2Y0yhFn/64s9fGAgJH1M8ky8HC6KctT5XWj2aqA7uk81dPgiGaZ
 Nrd+5HVnASsiR2UfoQiENpWNenWKxlS1+hlDTwW2A46c7ZrtGn4n1kiD2
 hm8qSGSdrgBe3CEI+UW29vjjeAyPftjkMe6oerGuJERnhXYJ1tOHLbRyh Q==;
X-CSE-ConnectionGUID: cxCHo9JDRcmXeo6oq3U0gw==
X-CSE-MsgGUID: bZLSB/puRw6nap/WqKDyYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="72409522"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="72409522"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 23:29:55 -0700
X-CSE-ConnectionGUID: /riCVowlQH2FZhOdZu9JzA==
X-CSE-MsgGUID: MA200zOnTN2ZHAokbm//OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="182125390"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.132])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 23:29:54 -0700
Date: Wed, 24 Sep 2025 08:29:51 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: Re: [PATCH v4 i-g-t 4/6] lib/xe_eudebug: Improve SIGINT handling
Message-ID: <nuhmzvakmfdvuo3rz6wdbzmb3d2hilmydbq7ibht7lodkvgctg@rz3aarf724hb>
References: <20250923131002.24708-1-dominik.karol.piatkowski@intel.com>
 <20250923131002.24708-5-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250923131002.24708-5-dominik.karol.piatkowski@intel.com>
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

On Tue, Sep 23, 2025 at 03:10:00PM +0200, Dominik Karol Piątkowski wrote:
> Rewrite SIGINT signal handler to toggle a variable instead of calling
> pthread_exit instantly, as the thread could be in critical section,
> causing a deadlock on the attempt of next entry into that critical
> section.
> 
> Introduce received_signal, received_sigint and handled_sigint variables
> to help with coordination of handling SIGINT and other signals.
> 
> Use the received_sigint variable in debugger_worker_loop to safely kill
> the thread, set handled_sigint to help with coordination outside the
> debugger loop.
> 
> Rename terminate_debugger to debugger_signal_handler to describe its
> new function better. Add SIGTERM to signals that are handled by
> debugger_signal_handler.
> 
> Don't kill debugger thread on non-SIGINT signals. Don't break on poll
> failure if signal was received.

Isn't this true only for SIGTERM and other signals previously configured
during igt_main()?

> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> ---
>  lib/xe/xe_eudebug.c | 26 ++++++++++++++++++++++----
>  lib/xe/xe_eudebug.h |  4 ++++
>  2 files changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index deaea25cd..647da7b32 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -1072,9 +1072,14 @@ xe_eudebug_read_event(int fd, struct drm_xe_eudebug_event *event)
>  	return ret;
>  }
>  
> -static void terminate_debugger(int sig)
> +static void debugger_signal_handler(int sig, siginfo_t *info, void *context)
>  {
> -	pthread_exit(NULL);
> +	struct xe_eudebug_debugger *d = info->si_ptr;
> +
> +	d->received_signal = true;
> +
> +	if (sig == SIGINT)
> +		d->received_sigint = true;
>  }
>  
>  static void *debugger_worker_loop(void *data)
> @@ -1092,14 +1097,24 @@ static void *debugger_worker_loop(void *data)
>  	igt_assert(d->master_fd >= 0);
>  
>  	igt_assert_eq(sigaction(SIGINT, NULL, &sa), 0);
> -	sa.sa_handler = terminate_debugger;
> +	sa.sa_sigaction = debugger_signal_handler;
> +	sa.sa_flags |= SA_SIGINFO;
>  	igt_assert_eq(sigaction(SIGINT, &sa, NULL), 0);
>  
> +	igt_assert_eq(sigaction(SIGTERM, NULL, &sa), 0);
> +	sa.sa_sigaction = debugger_signal_handler;
> +	sa.sa_flags |= SA_SIGINFO;
> +	igt_assert_eq(sigaction(SIGTERM, &sa, NULL), 0);
> +
>  	do {
>  		p.fd = d->fd;
>  		ret = poll(&p, 1, timeout_ms);
> +		if (d->received_sigint) {
> +			d->handled_sigint = true;
> +			pthread_exit(NULL);
> +		}
>  
> -		if (ret == -1) {
> +		if (!d->received_signal && ret == -1) {
>  			igt_info("poll failed with errno %d\n", errno);
>  			break;
>  		}

I don't get this. If SIGTERM will be received, we'll never process
negative return from poll(). Shouldn't this looks like:

if (d->received_signal && ret == -1) {
	d->received_signal = false;

	if (errno == ?)
		continue;
	else
		break;
}

--
Zbigniew

> @@ -1168,6 +1183,9 @@ xe_eudebug_debugger_create(int master_fd, uint64_t flags, void *data)
>  	d->fd = -1;
>  	d->master_fd = master_fd;
>  	d->ptr = data;
> +	d->received_signal = false;
> +	d->received_sigint = false;
> +	d->handled_sigint = false;
>  
>  	return d;
>  }
> diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
> index 8f7f66220..46cd3463e 100644
> --- a/lib/xe/xe_eudebug.h
> +++ b/lib/xe/xe_eudebug.h
> @@ -44,6 +44,10 @@ struct xe_eudebug_debugger {
>  	pthread_t worker_thread;
>  	enum xe_eudebug_debugger_worker_state worker_state;
>  
> +	bool received_signal;
> +	bool received_sigint;
> +	bool handled_sigint;
> +
>  	int p_client[2];
>  };
>  
> -- 
> 2.34.1
> 
