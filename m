Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E17CAC5A7
	for <igt-dev@archiver.kernel.org>; Tue, 23 Sep 2025 06:46:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A18810E0E3;
	Tue, 23 Sep 2025 06:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hSQ12kdH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531F310E0E3
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Sep 2025 06:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758609999; x=1790145999;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tpj6Oyyw2pflXO7+QR7mUU+p+FaZHWv1wxHxomSIO0w=;
 b=hSQ12kdHL+ruT9WgcTbuXdhPW2H0PU6vY3FMXiidc24tAQAqblz0m2/P
 A8vjtBBfqSUAP/N+Ij+PNS0Hf//7kOJdbPKRfq33z4IHz76fZHYOTaTzH
 A9UFzg1nFu5fN/nah/XSN/5OOMFuuAkv/e6ssi6NTSIngqHnqRsT7tV9Q
 NzpYq3SKVjuW9QcBSEUAxVWnRFGLp7R2YUHmE7tjUZS0JxZ51rVAtEHDw
 UNQeE3FVJY+S77SAzfiMjQa7ioYMA83UQU0Zju8AsCxyXfkr4zSIM9DwA
 CJEvamZBrt1yNCBavtPSCq0DVD8xP5hMyW65483TmdlDqggGGoarPSOBw Q==;
X-CSE-ConnectionGUID: nfjM7E4TQK2oU/xuxlsdiA==
X-CSE-MsgGUID: nwauA53fT+6vgoSUhzWHcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="71503779"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="71503779"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 23:46:39 -0700
X-CSE-ConnectionGUID: BJHPqQF7TJWu3U1WHa5NDw==
X-CSE-MsgGUID: Lu6HQVEGRVOSCiEq6bwt4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="213844312"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.223])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 23:46:37 -0700
Date: Tue, 23 Sep 2025 08:46:33 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: Re: [PATCH v3 i-g-t 5/5] tests/xe_eudebug_online: Improve issuing
 SIGINT in set-breakpoint-sigint-debugger
Message-ID: <ukypm24nf6jrkoljgnzo4jc2h2cml3edjp5xal5fnuusozye7p@uketg4fr3zng>
References: <20250918123401.5433-1-dominik.karol.piatkowski@intel.com>
 <20250918123401.5433-6-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250918123401.5433-6-dominik.karol.piatkowski@intel.com>
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

On Thu, Sep 18, 2025 at 02:34:01PM +0200, Dominik Karol Piątkowski wrote:
> Use pthread_sigqueue instead of pthread_kill in order to be able to pass
> debugger to signal handler. Wait for the SIGINT handling to complete
> before closing the debugger fd to avoid tripping over asserts.
> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> ---
>  tests/intel/xe_eudebug_online.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index aa58e5f99..2576477eb 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -1600,7 +1600,11 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
>  		else if (event_count > 0 && event_count < events_max)
>  			sigints_during_test++;
>  
> -		igt_assert_eq(pthread_kill(s->debugger->worker_thread, SIGINT), 0);
> +		pthread_sigqueue(s->debugger->worker_thread, SIGINT,
> +				 (union sigval){ .sival_ptr = (void*)s->debugger });

This imo should be part 4/5 (debugger_worker_loop()). Gracefully handling
sigint should be part of the debugger code, not the test.

--
Zbigniew

> +		/* XXX: Don't close debugger fd before it dies */
> +		while (!s->debugger->handled_sigint)
> +			usleep(1000);
>  		close(s->debugger->fd);
>  
>  		igt_assert_eq(READ_ONCE(s->debugger->worker_state), DEBUGGER_WORKER_ACTIVE);
> -- 
> 2.34.1
> 
