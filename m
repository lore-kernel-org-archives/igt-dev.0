Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1607C27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 11:24:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7189C10EBF2;
	Fri,  7 Jun 2024 11:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LYCfMcY7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D80E10EBF2
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 11:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717759498; x=1749295498;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Oql0uCgvcsrvsRUR3TIUe5/Jpv+W3OWEsyzNhA7RCE0=;
 b=LYCfMcY75gPYDEXrd2SJIQ0nZ3c5Udfny7q/sccIg8i1e0cTOK1P2cE0
 GboUSvHfT2d+9EuJpjHeog5dQFPF/4k9EvJrEDdHypwJxukREhp7Q8UZY
 3idN68fWW4nFQ/yckAq03ORtnbucmFlNG6yUdgEIo27tBLqt4anL9wRtR
 EJFD5B/8ZW5n1yxf0jIgEWWX8p1rFsECsiMxrqIml3mw+I76SHt2gziyT
 uHz2z89w2zNx8SY63aKCOE2QByoTRoYpW3ZVeomdYHR6Tq9sKBlslNxyG
 IwzgZoaVlmQPAofZojm0igd70PZtQwsy+7HAhfxLQjU54B1b5pbgDgeZk w==;
X-CSE-ConnectionGUID: g3BccMtuTTGTi5b2QG5A9w==
X-CSE-MsgGUID: KjqVSnLdTY+6ZN7r1VrIGg==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="25103544"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="25103544"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 04:24:57 -0700
X-CSE-ConnectionGUID: Nn5J5jX3T6yB8vtdxOQNpg==
X-CSE-MsgGUID: tNksJoJ4R++RSRTOCGlXvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="42754483"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 04:24:56 -0700
Date: Fri, 7 Jun 2024 13:24:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
Subject: Re: [PATCH] tests/intel/xe_create: Isolate performance tests
Message-ID: <20240607112428.dl5zloect22yizt7@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
References: <20240607094936.1564474-1-balasubramani.vivekanandan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240607094936.1564474-1-balasubramani.vivekanandan@intel.com>
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

Hi Balasubramani,
On 2024-06-07 at 15:19:36 +0530, Balasubramani Vivekanandan wrote:

please subscribe to igt-dev mailinglist.

If you will ever send cc to kmd list, please add i-g-t after PATCH.

> create_execqueues subtest is testing the time required for creating
> execqueues along with testing the functionality.
> Performance measurements are mostly not relevant when testing on PreSi
> environments. Isolate the performance checks into new tests allowing it
> to be skipped for PreSi testing.
> 
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  tests/intel/xe_create.c | 28 +++++++++++++++++++---------
>  1 file changed, 19 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
> index d41557c85..346c807c0 100644
> --- a/tests/intel/xe_create.c
> +++ b/tests/intel/xe_create.c
> @@ -171,9 +171,11 @@ enum vm_count {
>   * @leak:				destroy exec_queues in close() path
>   * @noleak-shared:			same as noleak, but with a shared vm
>   * @leak-shared:			same as leak, but with a shared vm
> + * @performance:			Measure time required for creating execqueues
> + * @performance-shared:			same as performance, but with a shared vm

You didn't created any new test, the only thing changed is skipping
assert.

>   */
>  static void create_execqueues(int fd, enum exec_queue_destroy ed,
> -			      enum vm_count vc)
> +			      enum vm_count vc, bool perf)

Instead of bool parameter imho it is better to check for simulation.

>  {
>  	struct timespec tv = { };
>  	uint32_t num_engines, exec_queues_per_process, vm;
> @@ -237,10 +239,12 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed,
>  		drm_close_driver(fd);
>  	}
>  
> -	seconds = igt_seconds_elapsed(&tv);
> -	igt_assert_f(seconds < real_timeout,
> -		     "Creating %d exec_queues tooks too long: %d [limit: %d]\n",
> -		     MAXEXECQUEUES, seconds, real_timeout);
> +	if (perf) {
> +		seconds = igt_seconds_elapsed(&tv);
> +		igt_assert_f(seconds < real_timeout,
> +			     "Creating %d exec_queues tooks too long: %d [limit: %d]\n",
> +			     MAXEXECQUEUES, seconds, real_timeout);
> +	}

imho you could still print this info and only assert if not in simulation,
so your change will be only here like:

	seconds = igt_seconds_elapsed(&tv);
    if (igt_run_in_simulation())
		     igt_info("Creating %d exec_queues tooks: %d [limit: %d]\n",
		     MAXEXECQUEUES, seconds, real_timeout);
    else
	        igt_assert_f(seconds < real_timeout,
		                "Creating %d exec_queues tooks too long: %d [limit: %d]\n",
                        MAXEXECQUEUES, seconds, real_timeout);

Regards,
Kamil

>  }
>  
>  /**
> @@ -410,16 +414,22 @@ igt_main_args("Q:p:", NULL, help_str, opt_handler, NULL)
>  	}
>  
>  	igt_subtest("create-execqueues-noleak")
> -		create_execqueues(xe, NOLEAK, MULTI);
> +		create_execqueues(xe, NOLEAK, MULTI, false);
>  
>  	igt_subtest("create-execqueues-leak")
> -		create_execqueues(xe, LEAK, MULTI);
> +		create_execqueues(xe, LEAK, MULTI, false);
>  
>  	igt_subtest("create-execqueues-noleak-shared")
> -		create_execqueues(xe, NOLEAK, SHARED);
> +		create_execqueues(xe, NOLEAK, SHARED, false);
>  
>  	igt_subtest("create-execqueues-leak-shared")
> -		create_execqueues(xe, LEAK, SHARED);
> +		create_execqueues(xe, LEAK, SHARED, false);
> +
> +	igt_subtest("create-execqueues-performance")
> +		create_execqueues(xe, NOLEAK, MULTI, true);
> +
> +	igt_subtest("create-execqueues-performance-shared")
> +		create_execqueues(xe, NOLEAK, SHARED, true);
>  
>  	igt_subtest("create-massive-size") {
>  		create_massive_size(xe);
> -- 
> 2.25.1
> 
