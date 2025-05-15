Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B8AC2D0CD
	for <igt-dev@archiver.kernel.org>; Thu, 15 May 2025 08:15:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113BC10E7CC;
	Thu, 15 May 2025 08:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="moTx52VS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E64910E7D3
 for <igt-dev@lists.freedesktop.org>; Thu, 15 May 2025 08:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747296929; x=1778832929;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lmvCYnzWWfGkpOdaYaVd5b6fBPuBA4ggIX/i9Y1W0LE=;
 b=moTx52VSIpkAB7V50gjfzKNVJjOSeLbmW8wwen1Nv/1hfiQD8ewQHSO5
 goYQaczx4Y7wb0NSQXKWpgi+K17m5lSF9P6js3Zf+w7KRUmeoNKCLWg48
 jYGMyPFwOr9freZZpqD9O4KvJyqK7UXZ5AD2uBFeJsDQz9OqqE84KgdM1
 Tmhr6wqd6V1EdvtDx3Ua1ZUIjagU2BpS4wET3hpYmfGM+78tqGOwI+Z5+
 fgRA2GUAggOWS+XOKeI20WRjEfJJ8CFBgORFwYRVHIJzOlurNS3qqJ+hr
 RhbBnuAfReTjGUJXMcAdlFmvyF8SuxSzXqdVfJAp1atDLq2ex9A8Jv4oN Q==;
X-CSE-ConnectionGUID: IZ+VjHcdTHGW0/FXZSSEPQ==
X-CSE-MsgGUID: 0oglOLyzSbOvomcrJRReng==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="66625731"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="66625731"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 01:15:29 -0700
X-CSE-ConnectionGUID: Uh61VlCKT8iCTP2yQ7omvQ==
X-CSE-MsgGUID: Dn9esqc+Ts2tVhHu0zZyyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="138831024"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.87])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 01:15:26 -0700
Date: Thu, 15 May 2025 10:15:23 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, markyacoub@google.com, 
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH v4 07/15] lib/igt_dummyload: Avoid pthread_cancel use by
 introducing an exit flag
Message-ID: <d4avd6qqmsa5qfanflcqvgkzrmc2gvjbqjw6lbnyjjx5xdklpd@yhlqjmp7f32b>
References: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
 <20250507160148.53857-8-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507160148.53857-8-jeevaka.badrappan@intel.com>
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

On Wed, May 07, 2025 at 04:01:40PM +0000, Jeevaka Prabu Badrappan wrote:
> Android build fails due to pthread_cancel unavailability.
> Replace pthread_cancel with thread exit based on an exit flag.
> 
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> ---
>  lib/igt_dummyload.c | 6 +++---
>  lib/igt_dummyload.h | 2 ++
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
> index 3cf80b762..38249afb7 100644
> --- a/lib/igt_dummyload.c
> +++ b/lib/igt_dummyload.c
> @@ -530,7 +530,7 @@ static void *timer_thread(void *data)
>  	/* Wait until we see the timer fire, or we get cancelled */
>  	do {
>  		read(spin->timerfd, &overruns, sizeof(overruns));
> -	} while (!overruns);
> +	} while (!overruns && !spin->exit_thread);

I've experimented a bit with this - read() in this case is a
cancellation point and it will block until the timer fires.
Instead of introducing spin->exit_thread it is better to change
timer to tv_sec = 0, tv_nsec = 1 and call timerfd_settime().

>  
>  	igt_spin_end(spin);
>  	return NULL;
> @@ -565,7 +565,7 @@ void igt_spin_set_timeout(igt_spin_t *spin, int64_t ns)
>  	timerfd = timerfd_create(CLOCK_MONOTONIC, 0);
>  	igt_assert(timerfd >= 0);
>  	spin->timerfd = timerfd;
> -
> +	spin->exit_thread = false;
>  	pthread_attr_init(&attr);
>  	pthread_attr_setinheritsched(&attr, PTHREAD_EXPLICIT_SCHED);
>  	pthread_attr_setschedpolicy(&attr, SCHED_FIFO);
> @@ -631,7 +631,7 @@ void igt_spin_end(igt_spin_t *spin)
>  static void __igt_spin_free(int fd, igt_spin_t *spin)
>  {
>  	if (spin->timerfd >= 0) {
> -		pthread_cancel(spin->timer_thread);

I mean I would do:

#ifdef ANDROID
	tv_sec = 0
	tv_nsec = 1
	timerfd_settime()
#else
	pthread_cancel()
#endif

I also wonder to totally remove pthread_cancel() leaving only timer
setting, as from my experiments looks in this case cancelling is not
necessary anymore. But this should be verified by CI.

--
Zbigniew


> +		spin->exit_thread = true;
>  		igt_assert(pthread_join(spin->timer_thread, NULL) == 0);
>  		close(spin->timerfd);
>  	}
> diff --git a/lib/igt_dummyload.h b/lib/igt_dummyload.h
> index b771011af..07b21227d 100644
> --- a/lib/igt_dummyload.h
> +++ b/lib/igt_dummyload.h
> @@ -26,6 +26,7 @@
>  #define __IGT_DUMMYLOAD_H__
>  
>  #include <stdint.h>
> +#include <stdatomic.h>
>  #include <time.h>
>  
>  #include "drmtest.h"
> @@ -75,6 +76,7 @@ typedef struct igt_spin {
>  
>  	struct timespec last_signal;
>  	pthread_t timer_thread;
> +	atomic_bool exit_thread;
>  	int timerfd;
>  
>  	int out_fence;
> -- 
> 2.34.1
> 
