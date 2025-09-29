Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFA1CAC5B9
	for <igt-dev@archiver.kernel.org>; Mon, 29 Sep 2025 19:20:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F76910E48A;
	Mon, 29 Sep 2025 19:20:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WdEO9J9G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BDA110E48C
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Sep 2025 19:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759173601; x=1790709601;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=wqvvzSroEtIwK/6GG05K3pSg/2mhi7r3XQX62xOG+FI=;
 b=WdEO9J9GF7mirM5OD8Z71hJ/qrHI4qERTVxgie8VLKHRqMmEF7c9/vLs
 CB6OdIK9yvgaD70ypTxbvO4XJHSs+3/czORLQ80MLT59y8j4e0zMlhyRn
 YPJMRO0J3fa699ze6pXwAd51XK5z3fNdN4Z4zcbFJi7KmYoRiK46IDWwp
 iC5omO1BY1TMLvudd5kOVCAbVtJa9nlvSFQDzFg/7UJhZqS4l2ttcQ45g
 epKg1Uis3nBv8KEklzoXViuZ0PJN9AK1vO3Ws2gIgc+z5IpRrRNfnPguW
 mJYI6K8djlGrvFiBHn4xjBbcEYuD9nUGbT2AKkLlUAYp5fPJL4eaSLzmF g==;
X-CSE-ConnectionGUID: +eFByy6rSvmJ5CClKMO87A==
X-CSE-MsgGUID: jQQQBGASSoCCNXpwfOaaQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61589710"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="61589710"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 12:20:00 -0700
X-CSE-ConnectionGUID: W6zAQgY8Q+ON421ZV0Lxgw==
X-CSE-MsgGUID: JWOb8HgKReCx6ONBsNy8aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="178249719"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.168])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 12:19:58 -0700
Date: Mon, 29 Sep 2025 21:19:55 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: Re: [PATCH v7 i-g-t 8/9] lib/xe_eudebug: Introduce SIGTERM handling
Message-ID: <2l7n2y34xjhebffwumnjoe5o3texzeumkhgpsrbjl4dy5he7l6@u4l7oqynw7u6>
References: <20250926074801.9031-1-dominik.karol.piatkowski@intel.com>
 <20250926074801.9031-9-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250926074801.9031-9-dominik.karol.piatkowski@intel.com>
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

On Fri, Sep 26, 2025 at 09:48:00AM +0200, Dominik Karol Piątkowski wrote:
> Add SIGTERM to signals that are handled by debugger_signal_handler.
> Don't kill debugger thread on SIGTERM signal. Don't break on poll
> failure if signal was received and errno is set to EINTR.
> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> ---
>  lib/xe/xe_eudebug.c | 15 +++++++++++++++
>  lib/xe/xe_eudebug.h |  1 +
>  2 files changed, 16 insertions(+)
> 
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index 8276a6dab..e8b046f48 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -1080,6 +1080,8 @@ static void debugger_signal_handler(int sig, siginfo_t *info, void *context)
>  
>  	igt_assert(d);
>  
> +	d->received_signal = true;
> +
>  	if (sig == SIGINT)
>  		d->received_sigint = true;
>  }
> @@ -1103,6 +1105,11 @@ static void *debugger_worker_loop(void *data)
>  	sa.sa_flags |= SA_SIGINFO;
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
> @@ -1112,6 +1119,13 @@ static void *debugger_worker_loop(void *data)
>  		}
>  
>  		if (ret == -1) {
> +			if (d->received_signal) {
> +				d->received_signal = false;
> +
> +				if (errno == EINTR)
> +					continue;

According to patch 1/9 review above should land there.

--
Zbigniew


> +			}
> +
>  			igt_info("poll failed with errno %d\n", errno);
>  			break;
>  		}
> @@ -1182,6 +1196,7 @@ xe_eudebug_debugger_create(int master_fd, uint64_t flags, void *data)
>  	d->ptr = data;
>  	d->received_sigint = false;
>  	d->handled_sigint = false;
> +	d->received_signal = false;
>  
>  	return d;
>  }
> diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
> index 7c7a01471..d2f64fe4c 100644
> --- a/lib/xe/xe_eudebug.h
> +++ b/lib/xe/xe_eudebug.h
> @@ -46,6 +46,7 @@ struct xe_eudebug_debugger {
>  
>  	bool received_sigint;
>  	bool handled_sigint;
> +	bool received_signal;
>  
>  	int p_client[2];
>  };
> -- 
> 2.34.1
> 
