Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25198D3176D
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 17:54:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C323C10E418;
	Tue,  5 Nov 2024 17:54:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YnQ2bMQ9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C12910E418
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 17:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730829259; x=1762365259;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3cVEItq5IRdYArRJ898Gms6mhD8fOaD4XOt2isVGJd4=;
 b=YnQ2bMQ9YbZAFd+8hJUGehcPmUslGVjD0oO1F8qs+vZqvDxKqiCTS0e2
 3GAxWZGUTNwaeQKYhTRt4DGr8iMEmt+OTS5HXIjAlygEj8oAODedpG7Ah
 SG7x+E9upC20MdmoTLSzMLox7I9hecNz4//B+P25As9d7cm7mvcGy6L7v
 Sgi3+DIsUe4C6Qn5PEtvCdbmjtfOMJyyw3LTHaVzUipAMKL9FqAIC8vme
 QTPX5Wox/LHY7Ac3p65HKG9ej/oQWtr8PPkpNUQ7LXs/fXjJ+suH9JpE+
 mwASSupDf27nLJSGAt/TCFfdYH7m1mDCE1q7BJ+UrCJIQC+i1HFUldul8 Q==;
X-CSE-ConnectionGUID: nh+e9pT0SKKyfu1GZfrmJA==
X-CSE-MsgGUID: IAReIqxqRWWbmCL014/RmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="30472817"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="30472817"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 09:54:19 -0800
X-CSE-ConnectionGUID: EgiUw+CFQsCN8XZ+DV6PLQ==
X-CSE-MsgGUID: ZVe3gbqHSI6Aiglz11ZveA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="84230580"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 09:54:18 -0800
Date: Tue, 5 Nov 2024 18:54:15 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>, saurabhg.gupta@intel.com,
 alex.zuo@intel.com, vinay.belgaumkar@intel.com
Subject: Re: [PATCH v3 2/2] tests/intel/xe_sysfs_timeslice_duration: Restore
 preempt timeout
Message-ID: <20241105175415.7uy4fxqsenus35pd@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 saurabhg.gupta@intel.com, alex.zuo@intel.com,
 vinay.belgaumkar@intel.com
References: <20241105154823.66078-1-jonathan.cavitt@intel.com>
 <20241105154823.66078-3-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241105154823.66078-3-jonathan.cavitt@intel.com>
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

Hi Jonathan,
On 2024-11-05 at 15:48:23 +0000, Jonathan Cavitt wrote:
> The subtests of sysfs_timeslice_duration modify the preempt_timeout_us
> and timeslice_duration_us values.  However, while the test does restore
> the timeslice_duration_us value at the end of execution, it does not do
> the same for preempt_timeout_us.  Because the value is not properly
> restored, future tests can end up using the unexpected preempt timeout
> value and thus have unexpected behavior.
> 
> Save and restore the preempt_timeout_us value during the test.
> 
> This fix does not apply to xe_sysfs_preempt_timeout because only the
> preempt_timeout_us is modified during those tests, and the value is
> correcty restored before the tests end.
> 
> v2: Also restore preempt_timeout_us on test failure (Kamil)
> 
> v3: Abort on restore failure (Kamil)
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2976
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> CC: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/xe_sysfs_timeslice_duration.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_sysfs_timeslice_duration.c b/tests/intel/xe_sysfs_timeslice_duration.c
> index b34d78a784..ef11acca13 100644
> --- a/tests/intel/xe_sysfs_timeslice_duration.c
> +++ b/tests/intel/xe_sysfs_timeslice_duration.c
> @@ -115,10 +115,11 @@ static uint64_t __test_timeout(int fd, int engine, unsigned int timeout, uint16_
>  static void test_timeout(int fd, int engine, const char **property, uint16_t class, int gt)
>  {
>  	uint64_t delays[] = { 1000, 50000, 100000, 500000 };
> -	unsigned int saved;
> +	unsigned int saved, old_pt;
>  	uint64_t elapsed;
>  	uint64_t epsilon;
>  
> +	igt_assert(igt_sysfs_scanf(engine, "preempt_timeout_us", "%u", &old_pt) == 1);
>  	igt_require(igt_sysfs_printf(engine, "preempt_timeout_us", "%u", 1) == 1);
>  	igt_assert(igt_sysfs_scanf(engine, property[0], "%u", &saved) == 1);
>  	igt_debug("Initial %s:%u\n", property[0], saved);
> @@ -140,6 +141,9 @@ static void test_timeout(int fd, int engine, const char **property, uint16_t cla
>  	}
>  
>  	set_timeslice_duration(engine, saved);
> +	igt_assert_lte(0, igt_sysfs_printf(engine, "preempt_timeout_us", "%u", old_pt));
> +	igt_sysfs_scanf(engine, "preempt_timeout_us", "%u", &saved);
> +	igt_assert_eq(saved, old_pt);
>  }
>  
>  #define	MAX_GTS	8
> @@ -159,7 +163,7 @@ igt_main
>  	int gt_count = 0;
>  	int fd = -1, sys_fd, gt;
>  	int engines_fd[MAX_GTS], gt_fd[MAX_GTS];
> -	unsigned int tds[MAX_GTS];
> +	unsigned int tds[MAX_GTS], pts[MAX_GTS];
>  
>  	igt_fixture {
>  		fd = drm_open_driver(DRIVER_XE);
> @@ -178,6 +182,9 @@ igt_main
>  			igt_require(igt_sysfs_scanf(engines_fd[gt_count],
>  						    "timeslice_duration_us",
>  						    "%u", &tds[gt_count]) == 1);
> +			igt_require(igt_sysfs_scanf(engines_fd[gt_count],
> +						    "preempt_timeout_us",
> +						    "%u", &pts[gt_count]) == 1);
>  			gt_count++;
>  		}
>  	}
> @@ -198,6 +205,11 @@ igt_main
>  		for (int i = gt_count - 1; i >= 0; i--) {
>  			unsigned int store;
>  
> +			igt_assert_lte(0, igt_sysfs_printf(engines_fd[i], "preempt_timeout_us",

Imho better abort.

> +							   "%u", pts[i]));

What about setting first:
			store = pts[i] - 1;
so it will differ in case scanf didn't read anything?

With or without above
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> +			igt_sysfs_scanf(engines_fd[i], "preempt_timeout_us", "%u", &store);
> +			igt_abort_on_f(store != pts[i], "preempt_timeout_us not restored!\n");
> +
>  			igt_assert_lte(0, igt_sysfs_printf(engines_fd[i], "timeslice_duration_us",
>  							   "%u", tds[i]));
>  			igt_sysfs_scanf(engines_fd[i], "timeslice_duration_us", "%u", &store);
> -- 
> 2.43.0
> 
