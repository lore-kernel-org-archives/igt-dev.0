Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C9CCAC5B1
	for <igt-dev@archiver.kernel.org>; Thu, 25 Sep 2025 16:34:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DAA010E94E;
	Thu, 25 Sep 2025 16:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T2fu22gH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3213610E94E
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 16:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758818076; x=1790354076;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=63DpJLzNuVtCoQ+si3+f0gTRDU2n0eidJbGmu+EKTBQ=;
 b=T2fu22gHnZ9UQqeYr9QWuwnXNmBxBJ4rdb9NE9Zcrds7CEfr9d6haWkA
 8RTyUbIaTJ37DP6Iav0th1bW8Rdmp/NKqLB1WrUOBuqvY/YbS/JpwtKTc
 9cfC6vKbEfIQqJWBd7SVuMcCDKnLFlPQb195xEJFJGgkB2FrxXWvCoqfP
 DLkyyl1zeoR2QeFhBKR66Q/YeKGqm/nADtSgxYCUixQrlqYtG6Ob5dMzx
 ReJAQLf4ejENlAeMKJ3cOgGsqi9oUuzo3eXa2bZCWXmnKsgADM104ah45
 N4gvLYSE4ptNGj5XmJL7jVq3c5ZJaxssumr57tPXAE7Sm7pQthGoQSQpH Q==;
X-CSE-ConnectionGUID: LkNuehBqQAeV4WFD+tNZXQ==
X-CSE-MsgGUID: vEB0ktraQXy7USDc/NQ7tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="78579660"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="78579660"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 09:34:26 -0700
X-CSE-ConnectionGUID: i3Q/p1FXSUu8HPT6Bc2Pqg==
X-CSE-MsgGUID: lLFzihVERUios2PT5dEN0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="182543462"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.41])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 09:34:24 -0700
Date: Thu, 25 Sep 2025 18:34:20 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: Re: [PATCH v6 i-g-t 7/9] lib/xe_eudebug: Improve SIGINT handling
Message-ID: <lfhkbhvjddrgvnbvkljdfp2bucx2fnw2thgf5tw3ymtd4r4zl3@yblkbngriypx>
References: <20250925123745.15721-1-dominik.karol.piatkowski@intel.com>
 <20250925123745.15721-8-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250925123745.15721-8-dominik.karol.piatkowski@intel.com>
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

On Thu, Sep 25, 2025 at 02:37:43PM +0200, Dominik Karol Piątkowski wrote:
> Rewrite SIGINT signal handler to toggle a variable instead of calling
> pthread_exit instantly, as the thread could be in critical section,
> causing a deadlock on the attempt of next entry into that critical
> section.
> 
> Use the received_sigint variable in debugger_worker_loop to safely kill
> the thread, set handled_sigint to help with coordination outside the
> debugger loop.
> 
> Rename terminate_debugger to debugger_signal_handler to describe its
> new function better.
> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> ---
>  lib/xe/xe_eudebug.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index 512c81bf5..a600931b7 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -1074,9 +1074,15 @@ xe_eudebug_read_event(int fd, struct drm_xe_eudebug_event *event)
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
> +	d->received_signal = true;

Above two lines should be part of next patch. And check struct
members should also occur in appropriate patches (received_signal
in one patch and received_sigint in this one).

--
Zbigniew

> +
> +	if (sig == SIGINT)
> +		d->received_sigint = true;
>  }
>  
>  static void *debugger_worker_loop(void *data)
> @@ -1094,12 +1100,17 @@ static void *debugger_worker_loop(void *data)
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
> +		if (d->received_sigint) {
> +			d->handled_sigint = true;
> +			pthread_exit(NULL);
> +		}
>  
>  		if (ret == -1) {
>  			igt_info("poll failed with errno %d\n", errno);
> -- 
> 2.34.1
> 
