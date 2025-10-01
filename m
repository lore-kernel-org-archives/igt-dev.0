Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3A1CAC5BB
	for <igt-dev@archiver.kernel.org>; Wed,  1 Oct 2025 09:30:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFFE710E355;
	Wed,  1 Oct 2025 09:30:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RJesyL+d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5335C10E355
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Oct 2025 09:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759311008; x=1790847008;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MHrBFtoYCp25cEAqzDIOFlYBdDJCTSS2sEr3Y7Uxo9I=;
 b=RJesyL+de68A5Ugntbi27IN3zUVv1Cc6u8GulJ1tL0nBtwPZRJs5+RuT
 7xbJO8YTswPmr1K1W1P88cEpBn1zDbqvVRY+A6cVOJJBbq3gAlm8KzF6d
 0skOxQo1qo7Ih68x194+yclYuLSDU7hcIA4h+DLwQNJKEwHDY0Yfbqjl+
 rBMPFPULC8iN121j0a6D/wTlbafRYcLSwzt2EiHyNjeFVsTGs/jvGa6gI
 baXkzL1J2x0svnokLyYPHp/Hux3MK/v3huh6RMKjQ+EkpyWURuA/56hSG
 tF4wnSY+5BXXYcvd4i3fgYi8r7GZdV6pK1gLFy1UlM6T23bNdWIJYZSbs A==;
X-CSE-ConnectionGUID: DQq9YVziSRyr6NjehBq6Cw==
X-CSE-MsgGUID: 5VpQie39SFWJzs1DJxk62A==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="72939024"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="72939024"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 02:30:08 -0700
X-CSE-ConnectionGUID: VdODbMTqTHyBV7NcneQkrg==
X-CSE-MsgGUID: yp7Jk5wdQ1SGGSnD0Vae7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="183029146"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.37])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 02:30:06 -0700
Date: Wed, 1 Oct 2025 11:30:02 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: Re: [PATCH v8 i-g-t 6/9] lib/xe_eudebug: Improve SIGINT handling
Message-ID: <xhwzfeuy3wpntkhc777jjujmhtkk5mtrfxawo5mqgqawauykc6@n2uwltozc4hh>
References: <20250930104209.22462-1-dominik.karol.piatkowski@intel.com>
 <20250930104209.22462-7-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250930104209.22462-7-dominik.karol.piatkowski@intel.com>
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

On Tue, Sep 30, 2025 at 12:42:06PM +0200, Dominik Karol Piątkowski wrote:
> Rewrite SIGINT signal handler to toggle a variable instead of calling
> pthread_exit instantly, as the thread could be in critical section,
> causing a deadlock on the attempt of next entry into that critical
> section.
> 
> Use the received_sigint variable in debugger_worker_loop to safely kill
> the thread.
> 
> Rename terminate_debugger to debugger_signal_handler to describe its
> new function better.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> ---
>  lib/xe/xe_eudebug.c | 15 ++++++++++++---
>  lib/xe/xe_eudebug.h |  2 ++
>  2 files changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index 18119c32e..0db9eaaeb 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -1074,9 +1074,14 @@ xe_eudebug_read_event(int fd, struct drm_xe_eudebug_event *event)
>  	return ret;
>  }
>  
> -static void terminate_debugger(int sig)
> +static void debugger_signal_handler(int sig, siginfo_t *info, void *context)
>  {
> -	pthread_exit(NULL);
> +	struct xe_eudebug_debugger *d = info->si_ptr;
> +
> +	igt_assert(d);
> +
> +	if (sig == SIGINT)
> +		d->received_sigint = true;
>  }
>  
>  static void *debugger_worker_loop(void *data)
> @@ -1094,12 +1099,15 @@ static void *debugger_worker_loop(void *data)
>  	igt_assert(d->master_fd >= 0);
>  
>  	igt_assert_eq(sigaction(SIGINT, NULL, &sa), 0);
> -	sa.sa_handler = terminate_debugger;
> +	sa.sa_sigaction = debugger_signal_handler;
> +	sa.sa_flags |= SA_SIGINFO;
>  	igt_assert_eq(sigaction(SIGINT, &sa, NULL), 0);
>  
>  	do {
>  		p.fd = d->fd;
>  		ret = poll(&p, 1, timeout_ms);
> +		if (d->received_sigint)
> +			pthread_exit(NULL);
>  
>  		if (ret == -1) {
>  			if (errno == EINTR)
> @@ -1173,6 +1181,7 @@ xe_eudebug_debugger_create(int master_fd, uint64_t flags, void *data)
>  	d->fd = -1;
>  	d->master_fd = master_fd;
>  	d->ptr = data;
> +	d->received_sigint = false;
>  
>  	return d;
>  }
> diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
> index 389572ed0..dd5c5e20a 100644
> --- a/lib/xe/xe_eudebug.h
> +++ b/lib/xe/xe_eudebug.h
> @@ -44,6 +44,8 @@ struct xe_eudebug_debugger {
>  	pthread_t worker_thread;
>  	enum xe_eudebug_debugger_worker_state worker_state;
>  
> +	bool received_sigint;
> +
>  	int p_client[2];
>  };
>  
> -- 
> 2.34.1
> 
