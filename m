Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9387CAC5A5
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 06:40:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EEBA10E6A4;
	Wed, 24 Sep 2025 06:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N0y7oxAP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B21E010E6A4
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 06:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758696031; x=1790232031;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=UAMNJ3vDQqQXq6UsOVWOy1ofSSES+tSQkKXkR8oVas8=;
 b=N0y7oxAPIv95YF7XV0AYm8tI2mNWOnjd3/VIMLzTDr7l2JKKiflvgTD7
 LBNWJH22nK7almQz1VPaMXwA/ZS9jfv9Huuxrisej8a5L6v0r9F1T7VCJ
 RqgZyy4imy0L6VPU2Ohr7wDiA/B+Yj0cyNRVyiPwxuV7VU40GC8qK6t9N
 +2BZTIPXhUWM/cEbOwBz3qqRVK4bImcLpamuzySiyEEdsCRLAKF4ZdsEB
 KK+CdZS0DSTmVbxrGWDNqgYlOaqX00ElwMMVbW70nC8A+GcbCiUOQADUp
 aU39+gI/ptmx1GbjchKJgZIepBoz1ohVM0UNjXpSXFK0mj3t45HEr7KMq Q==;
X-CSE-ConnectionGUID: 0S9W2iMUTpKYSXAu8T1sYA==
X-CSE-MsgGUID: ml37TRi/TkGWoJoc/1fIkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="64624208"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="64624208"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 23:40:31 -0700
X-CSE-ConnectionGUID: Yi4BD/9bTK66DOoMHRBWGw==
X-CSE-MsgGUID: fQseWalvTDCGSNzoO6r4nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="214083399"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.132])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 23:40:29 -0700
Date: Wed, 24 Sep 2025 08:40:26 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: Re: [PATCH v4 i-g-t 6/6] tests/xe_eudebug_online: Improve issuing
 SIGINT in set-breakpoint-sigint-debugger
Message-ID: <rrwptxvacd43d3olx6nvqtodzsjnti3yud3mflvtepdkgsc6xn@dxchujdcwj6p>
References: <20250923131002.24708-1-dominik.karol.piatkowski@intel.com>
 <20250923131002.24708-7-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250923131002.24708-7-dominik.karol.piatkowski@intel.com>
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

On Tue, Sep 23, 2025 at 03:10:02PM +0200, Dominik Karol Piątkowski wrote:
> Use xe_eudebug_debugger_kill instead of pthread_kill. Wait for the
> SIGINT handling to complete before closing the debugger fd to avoid
> tripping over asserts. Issue some SIGTERM signals in quick succession
> before SIGINT to raise the odds of hitting the ioctl.
> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> ---
>  tests/intel/xe_eudebug_online.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index aa58e5f99..2db1c5bef 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -1600,7 +1600,14 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
>  		else if (event_count > 0 && event_count < events_max)
>  			sigints_during_test++;
>  
> -		igt_assert_eq(pthread_kill(s->debugger->worker_thread, SIGINT), 0);

I would add comment about what SIGTERM does in this case.
I know it is in commit message, but reading it in the code
instead of digging in commit logs is faster.

> +		for (int i = 0; i < 50; i++) {

Define some self-explain macro, like:

#define SIGTERM_TRIES 50

> +			xe_eudebug_debugger_kill(s->debugger, SIGTERM);
> +			usleep(rand() % 1000);
> +		}
> +		xe_eudebug_debugger_kill(s->debugger, SIGINT);
> +		/* XXX: Don't close debugger fd before it dies */

Remove XXX, this comment what it does is fine.

With above nits addressed:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> +		while (!s->debugger->handled_sigint)
> +			usleep(1000);
>  		close(s->debugger->fd);
>  
>  		igt_assert_eq(READ_ONCE(s->debugger->worker_state), DEBUGGER_WORKER_ACTIVE);
> -- 
> 2.34.1
> 
