Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 858BCC36002
	for <igt-dev@archiver.kernel.org>; Fri, 21 Mar 2025 18:28:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C22710E81A;
	Fri, 21 Mar 2025 18:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W+tlRqm5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5BB110E81A
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Mar 2025 18:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742581715; x=1774117715;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=PM6y0PIaSwCLiKVTP5cfl6fqPdHwVIssFkfgRZ/ozsk=;
 b=W+tlRqm5EeT/3i1faQYvFaqzb0pnUTybeocBM1ay0sXPJc8yw1zov5qq
 iBmyvfbRP8PCefNz1i1PwPFXUDPgfNUGy4yd0tJOSanNTEOh/SOcQNml7
 89r21xrLNs0uqAyZwYWKEBHImclD7KABdHa0oUlzvC/qgSFXN8/CMeBYg
 UxFl5/VlHTrruu0Xm0JRqvMSynchg56jNE2DnKgcw57Qmt27/Y3HVqnVs
 fDDA2YcbhxUZWvY+4ns8gdouNBiVYRD9DrYPdah4o25tQoWMEJYzsrgfO
 /z+2HUGJ/FmI5TZaPQ57KKaCMm/soqlN2G6eidjRVvY3VEHJc3cbJug4p Q==;
X-CSE-ConnectionGUID: YWw6J40ySjS51L0XnKP2eA==
X-CSE-MsgGUID: oG38Gt6fRUCeZKMhrHrXpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="55243071"
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; d="scan'208";a="55243071"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 11:28:34 -0700
X-CSE-ConnectionGUID: au5R3IrkSYO6/XKcZmH4AQ==
X-CSE-MsgGUID: gqHKZgnSQVCchPR/HtoMqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; d="scan'208";a="123183533"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 11:28:33 -0700
Date: Fri, 21 Mar 2025 19:28:20 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Pawel Sikora <pawel.sikora@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v3 1/1] lib/igt_core: capture logs for child
 processes
Message-ID: <20250321182820.akmp3ip4pznbsx5s@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Pawel Sikora <pawel.sikora@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <20250321120344.737080-1-pawel.sikora@linux.intel.com>
 <20250321120344.737080-2-pawel.sikora@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250321120344.737080-2-pawel.sikora@linux.intel.com>
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

Hi Pawel,
On 2025-03-21 at 13:03:44 +0100, Pawel Sikora wrote:
> This change addresses the issue of missing logs for child
> processes in the IGT runner.
> 
> The '_igt_log_buffer_dump()' function is now called before
> exiting child processes, ensuring that logs are properly
> captured and not lost when IGT fails and child processes
> dump logs before exiting.
> 
> v2: Make the dump conditional based on active comms (Kamil)
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2178
> 

Remove empty line here.

> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Pawel Sikora <pawel.sikora@linux.intel.com>
> ---
>  lib/igt_core.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index c19689a51..512d88437 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -296,6 +296,7 @@ static bool in_fixture = false;
>  static bool test_with_subtests = false;
>  static bool in_atexit_handler = false;
>  static bool show_ftrace = false;
> +static bool has_comms = false;
>  static enum {
>  	CONT = 0, SKIP, FAIL
>  } skip_subtests_henceforth = CONT;
> @@ -1905,11 +1906,17 @@ void igt_fail(int exitcode)
>  		failed_one = true;
>  	}
>  
> -	/* Silent exit, parent will do the yelling. */
> +	/* If igt_runner uses comms, it could grab each child's logs without
> +	 * them interleaving in stdout/stderr. */

I just realised that there is another _child exit after if(!has_comms)...
What about dropping those runner_connected() if's and just dump it
unconditionally here? Let the user cope with non-runner runs?
So imho we could have new comment like above and here:

	_igt_log_buffer_dump();

What is you opinion Zbigniew?

Regards,
Kamil

> +	has_comms = runner_connected();
> +	if (has_comms)
> +		_igt_log_buffer_dump();
> +
>  	if (test_child)
>  		exit(exitcode);
>  
> -	_igt_log_buffer_dump();
> +	if (!has_comms)
> +		_igt_log_buffer_dump();
>  
>  	if (test_multi_fork_child)
>  		exit(exitcode);
> -- 
> 2.34.1
> 
