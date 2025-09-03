Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94746CA100C
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 07:35:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520148876A;
	Wed,  3 Sep 2025 07:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I5vbgXCP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87A28876A
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 07:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756884929; x=1788420929;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=f+/dTUmsM7nfSe97HY4mr7IYA0zHjgpxGNgxivp+hQg=;
 b=I5vbgXCPJOW7FE3EWXDyl7mzQdtOYI4Lb10wMq5eyDTeE7OzRKqTlXPK
 iJcS1fAkwfQHHVw0l4wQWp75dg5zB3q48TZgoCALjMJXuPkko3QFmkGtZ
 k/Q7CGQTYeE5G95O7NiXv+u3OCT1oJJRF/10FkKRY0KYViAV+zlif42tV
 87NvnHC/M9HgEOHpMn6Y9OjEDRmmcnW4aZir4Yx8woOELyTzp7yA/EA38
 ACuy01KeXRo+zN0S66SWZxx2vexrcagJ8E2SJE6apmNYpwJQvyNWkN/i+
 W40B5g4j8oPWnyCr2QBohPZKdNpVbfmMBTezcbEpIPcLx6Nsfd+sl2nrb g==;
X-CSE-ConnectionGUID: +odDFQK1RP2Zt9lUrCdFTA==
X-CSE-MsgGUID: eyV7W/3WSvuZeATHyzanpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="46764053"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="46764053"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 00:35:28 -0700
X-CSE-ConnectionGUID: iOejAHQkSoGJebeo6GgjVw==
X-CSE-MsgGUID: MpjdNcnHRKS/7KdVl0FcUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="171078424"
Received: from inaky-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.245.245.167])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 00:35:26 -0700
Date: Wed, 3 Sep 2025 09:35:24 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: Re: [PATCH i-g-t 2/7] lib/xe_eudebug: Harden xe_eudebug_client_stop
 for SIGINT
Message-ID: <24tz7o4s42yk2sw4q37ayklj7nmg72udox3i3j2rqgpp4xo2x4@bqik7yoqtvh6>
References: <20250902123203.4907-1-dominik.karol.piatkowski@intel.com>
 <20250902123203.4907-3-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250902123203.4907-3-dominik.karol.piatkowski@intel.com>
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

On Tue, Sep 02, 2025 at 02:31:58PM +0200, Dominik Karol Piątkowski wrote:
> Add a check if client still exists before xe_eudebug_client_wait_done
> to avoid getting stuck on wait_from_client.
> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> ---
>  lib/xe/xe_eudebug.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index 667c31c6e..5aec75282 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -1452,6 +1452,11 @@ void xe_eudebug_client_stop(struct xe_eudebug_client *c)
>  		int waitstatus;
>  		int ret;
>  
> +		/* process may be gone already (SIGINT) */
> +		ret = waitpid(c->pid, &waitstatus, WNOHANG);
> +		if (ret == -1)
> +			goto out;
> +

Looking at xe_eudebug_client_wait_done() above waitpid() just
decreases probability of failure when child is killed. But what
will happen if signal will arrive immediately after waitpid()?

I think __wait_token() -> safe_pipe_read() are missing case
where pipe is gone (child killed by signal). And waitpid()
should be called there.

--
Zbigniew


>  		xe_eudebug_client_wait_done(c);
>  
>  		token_signal(c->p_in, CLIENT_STOP, c->pid);
> @@ -1459,7 +1464,7 @@ void xe_eudebug_client_stop(struct xe_eudebug_client *c)
>  		/* process may be gone already */
>  		if (!(ret == -1 && errno == ECHILD))
>  			igt_assert_eq(ret, c->pid);
> -
> +out:
>  		c->pid = 0;
>  	}
>  }
> -- 
> 2.34.1
> 
