Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C45A1CAC59A
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 06:37:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7910610E6A3;
	Wed, 24 Sep 2025 06:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J67+4CaE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F7110E6A3
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 06:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758695849; x=1790231849;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=SeH7X4nFMj2h3eckKrzp0eE5x+6hC4tcLbckPNvpcfM=;
 b=J67+4CaExGA8foGziAo74p/7nSI4mP6VAfECqAlR3kwF/ciprpxOZ/0h
 Ca986v7yDNEebfB5lcLjkRJmBqLnDjEv+JugF3qgnwnZMYsHXsKU6qJT7
 YsQIovjYubuuRtISzcAJdA93XmpP8tasGJzBayLcpov+dy9m2Fuia3Dz+
 pmjR1bgguXBhlLUnghnzbKtAT+VDIj8u8Q2BKjPQDHSpVL0q952EJ+8GL
 tN/Yz021NP1WMfFnZjN9pc1+iSjaaXilFgWLdKrshQRfzkdREBsSFhWgU
 j4DcMqeZKfD/Faa8JOfLa6w7Mui/TpMoHTGOUFWTmWaTKJOd3Sw1q79rk Q==;
X-CSE-ConnectionGUID: yVJSLKH+QKGeXz8fClmdZg==
X-CSE-MsgGUID: OuHJdHm2RBO8+XNxjeVmGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="78423117"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="78423117"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 23:37:29 -0700
X-CSE-ConnectionGUID: CHw7t8h6SxmFlf3drA/pjw==
X-CSE-MsgGUID: QjmiAgP7R72BRjgfP/a6tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="176896992"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.132])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 23:37:28 -0700
Date: Wed, 24 Sep 2025 08:37:25 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: Re: [PATCH v4 i-g-t 5/6] lib/xe_eudebug: Introduce
 xe_eudebug_debugger_kill
Message-ID: <mqjcbbdkypbcc6rqg7vw727nl6of5v2stm2dh2rw2dwfzczhik@qwo5xmvpalqs>
References: <20250923131002.24708-1-dominik.karol.piatkowski@intel.com>
 <20250923131002.24708-6-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250923131002.24708-6-dominik.karol.piatkowski@intel.com>
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

On Tue, Sep 23, 2025 at 03:10:01PM +0200, Dominik Karol Piątkowski wrote:
> Introduce xe_eudebug_debugger_kill helper for issuing signals to
> debugger thread. Passes the debugger struct to signal handler.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> ---
>  lib/xe/xe_eudebug.c | 13 +++++++++++++
>  lib/xe/xe_eudebug.h |  1 +
>  2 files changed, 14 insertions(+)
> 
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index 647da7b32..d3e9096c6 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -1407,6 +1407,19 @@ void xe_eudebug_debugger_wait_stage(struct xe_eudebug_session *s, uint64_t stage
>  	igt_assert_eq(stage_in, stage);
>  }
>  
> +/**
> + * xe_eudebug_debugger_kill:
> + * @d: pointer to the debugger
> + * @sig: signal to send
> + *
> + * Sends @sig signal to the debugger thread.
> + * Passes the debugger struct to signal handler.
> + */
> +void xe_eudebug_debugger_kill(struct xe_eudebug_debugger *d, int sig)
> +{
> +	pthread_sigqueue(d->worker_thread, sig, (union sigval){ .sival_ptr = (void*)d });
> +}
> +
>  /**
>   * xe_eudebug_client_create:
>   * @master_fd: xe client used to open the debugger connection
> diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
> index 46cd3463e..4d658e11b 100644
> --- a/lib/xe/xe_eudebug.h
> +++ b/lib/xe/xe_eudebug.h
> @@ -164,6 +164,7 @@ void xe_eudebug_debugger_remove_trigger(struct xe_eudebug_debugger *d, int type,
>  				     xe_eudebug_trigger_fn fn);
>  void xe_eudebug_debugger_signal_stage(struct xe_eudebug_debugger *d, uint64_t stage);
>  void xe_eudebug_debugger_wait_stage(struct xe_eudebug_session *s, uint64_t stage);
> +void xe_eudebug_debugger_kill(struct xe_eudebug_debugger *d, int sig);
>  
>  struct xe_eudebug_client *
>  xe_eudebug_client_create(int xe, xe_eudebug_client_work_fn work, uint64_t flags, void *data);
> -- 
> 2.34.1
> 
