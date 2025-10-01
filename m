Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79754CCA470
	for <igt-dev@archiver.kernel.org>; Wed,  1 Oct 2025 09:31:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24ED910E704;
	Wed,  1 Oct 2025 09:31:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B1WKJv2m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89D210E6C2
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Oct 2025 09:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759311085; x=1790847085;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=uH8W18M2wm934s4PY8gaty32OTDYvSjCB3fNZ7htgP8=;
 b=B1WKJv2mXcXrH90kVzCu1p4INVLBWN/JlzAvaXmpk+9xb6zeSyoAL3sL
 E3+igGWjVcmfbjeDaBbFV2LQgPYD+0+QrsPOLUkZkFWBh87Dz0sH5A/IQ
 w3RJv0wNa7ov/8qqzpNefFAGkPTFgrW0xRx2Moxf+WthxbvVaVdacNo8t
 gZkn23fQibkpXdLftSeUm65mjxcdRcCElbOSoiO1piufYY7eX2OxwFRDX
 6tu8bpZ/jCOpGsbS3VD4tTliV29RqowhF3Fgp8OY8F4Aw57w3qHzsq+XX
 3oSf/8Pkz+qPhhOMVGgad12UsA/XEk6w8vgfcuitNrYLZoGRFvljKeQC+ A==;
X-CSE-ConnectionGUID: 0M8SUCenTOO/K7LLsoOEWA==
X-CSE-MsgGUID: AfjyMTd9TVOzZcpKTm+BLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="72939220"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="72939220"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 02:31:24 -0700
X-CSE-ConnectionGUID: EqXBvMgxTOqYcMcsjwvTQg==
X-CSE-MsgGUID: OrUO2GxDQWWaceZ0VwEbxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="178547659"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.37])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 02:31:21 -0700
Date: Wed, 1 Oct 2025 11:31:19 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: Re: [PATCH v8 i-g-t 8/9] lib/xe_eudebug: Introduce SIGTERM handling
Message-ID: <o3zvwhiwe5wq5ldannbmlrx4p3upyjxlucll7glclpcei7guno@tucyufetgnuy>
References: <20250930104209.22462-1-dominik.karol.piatkowski@intel.com>
 <20250930104209.22462-9-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250930104209.22462-9-dominik.karol.piatkowski@intel.com>
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

On Tue, Sep 30, 2025 at 12:42:08PM +0200, Dominik Karol Piątkowski wrote:
> Add SIGTERM to signals that are handled by debugger_signal_handler.
> Don't kill debugger thread on SIGTERM signal.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> ---
>  lib/xe/xe_eudebug.c | 16 ++++++++++++++--
>  lib/xe/xe_eudebug.h |  1 +
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index 1282e2918..811a0e14a 100644
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
> @@ -1112,8 +1119,12 @@ static void *debugger_worker_loop(void *data)
>  		}
>  
>  		if (ret == -1) {
> -			if (errno == EINTR)
> -				continue;
> +			if (d->received_signal) {
> +				d->received_signal = false;
> +
> +				if (errno == EINTR)
> +					continue;
> +			}
>  
>  			igt_info("poll failed with errno %d\n", errno);
>  			break;
> @@ -1185,6 +1196,7 @@ xe_eudebug_debugger_create(int master_fd, uint64_t flags, void *data)
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
