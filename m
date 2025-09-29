Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14F3CAC5B9
	for <igt-dev@archiver.kernel.org>; Mon, 29 Sep 2025 19:17:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB2A10E485;
	Mon, 29 Sep 2025 19:17:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a1xUTPTF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C247310E485
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Sep 2025 19:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759173424; x=1790709424;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=FZVEH/DN4cuAg9LrgQyUgXICUTg6Rj0Se9wTX5Yw0q0=;
 b=a1xUTPTF0AwSPMhrGFPuktUQIWgpQHeTWudvwN0QwwNQ/A3Ipk+d1X4d
 xlChzIXf4DDY0fdlTdWDbkqO6oklUT1Xt5sc3GyjuX22jBt5UFPWMb3kB
 K+4SOkyFW5CW+Vc9DNFodpAJD9S7+IRxnrk0pco6JnBuEsv955WsKMQqW
 sTrEUXZ11vuvddZfHxGXSBwrrAiuLEZyPl0u9vDcJG9CDriAWHoLEr/U1
 E8is1xx5aWcEJv3swkhITu4VHeQvm05fNHCgvRUXL0RWKRanvDrL/u3kx
 0lYz283SIWu6sQqaf0iQWynUQ3adsiYsjwJ3KCIeesrIFKHjVK8ND0pIB w==;
X-CSE-ConnectionGUID: E+qgmVUlRD+cU8N90MTmSQ==
X-CSE-MsgGUID: 1HdH8GmTRbGLoLSsBUWBNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61466796"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61466796"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 12:17:04 -0700
X-CSE-ConnectionGUID: jqdE7ns1S5quB47uRlz4ZA==
X-CSE-MsgGUID: fs2QTx9JQ/ihZklJC2SUvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="179077842"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.168])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 12:17:02 -0700
Date: Mon, 29 Sep 2025 21:16:59 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: Re: [PATCH v7 i-g-t 6/9] lib/xe_eudebug: Improve SIGINT handling
Message-ID: <om3rcumj2u2iayp33epk2j4rbfd4snmpvzjfdbffzq7n7ozsa6@sssrt7exasbv>
References: <20250926074801.9031-1-dominik.karol.piatkowski@intel.com>
 <20250926074801.9031-7-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250926074801.9031-7-dominik.karol.piatkowski@intel.com>
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

On Fri, Sep 26, 2025 at 09:47:58AM +0200, Dominik Karol Piątkowski wrote:
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
>  lib/xe/xe_eudebug.c | 18 +++++++++++++++---
>  lib/xe/xe_eudebug.h |  3 +++
>  2 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index 3495354e3..8276a6dab 100644
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
> @@ -1094,12 +1099,17 @@ static void *debugger_worker_loop(void *data)
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
> @@ -1170,6 +1180,8 @@ xe_eudebug_debugger_create(int master_fd, uint64_t flags, void *data)
>  	d->fd = -1;
>  	d->master_fd = master_fd;
>  	d->ptr = data;
> +	d->received_sigint = false;
> +	d->handled_sigint = false;
>  
>  	return d;
>  }
> diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
> index 389572ed0..7c7a01471 100644
> --- a/lib/xe/xe_eudebug.h
> +++ b/lib/xe/xe_eudebug.h
> @@ -44,6 +44,9 @@ struct xe_eudebug_debugger {
>  	pthread_t worker_thread;
>  	enum xe_eudebug_debugger_worker_state worker_state;
>  
> +	bool received_sigint;
> +	bool handled_sigint;

This member should be imo set in next patch as there's no use of it
in this one (I mean it is logically bound to next patch).

--
Zbigniew

> +
>  	int p_client[2];
>  };
>  
> -- 
> 2.34.1
> 
