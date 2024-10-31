Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CA8D767F7
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 18:30:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 843D610E430;
	Thu, 31 Oct 2024 18:30:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JNsTjfZ4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39FDB10E430
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Oct 2024 18:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730399419; x=1761935419;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YJRP9FYcy1czCYGOyKFgwM4nLgj/QfBp3GUtyh9fR/o=;
 b=JNsTjfZ4zZMqRZYwWfo1CbNowu3lgxXiPCESlvNAxDGoOK3dC6gJD4Fg
 FJWRDUARBqf1L1SLKkbQNM4Zc9MEk8ujrwLE0QW1BFiCJcJupjrM2yKHA
 f+SM35qgg6YK6hOd7CjEHCIqi+q4cdeqj1mEkAU6PpDcI1/be/l3s/DOd
 mcAW78jpa5DtQrxh20uEz2pDGtxLi0mdaRfwP23QqCa2jS9P2/7nOerDZ
 H8SKif8GZzB37wpBnntOYl46M0p1EpPFecffo97ikLTnTK+pG5J7O8AHD
 Y2cNJE4TMtQqYej2qbnsTeGazevRuHbW1ROtqhNNYT44YgGdZ9mHS/oMs A==;
X-CSE-ConnectionGUID: EJJjs56ORGWbTWfcXi7qJQ==
X-CSE-MsgGUID: vF0v+UIORa+VkmznYcV1Lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33847417"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="33847417"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 11:30:19 -0700
X-CSE-ConnectionGUID: /3pXhpqQS5y/qAz+CESvRw==
X-CSE-MsgGUID: rRQIqDmTQ0adqcTXqHUBzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="113490209"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 11:30:17 -0700
Date: Thu, 31 Oct 2024 19:30:14 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>, saurabhg.gupta@intel.com,
 alex.zuo@intel.com, vinay.belgaumkar@intel.com
Subject: Re: [PATCH v2 2/2] tests/intel/xe_sysfs_timeslice_duration: Restore
 preempt timeout
Message-ID: <20241031183014.ljgijkh7pnvk76m6@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 saurabhg.gupta@intel.com, alex.zuo@intel.com,
 vinay.belgaumkar@intel.com
References: <20241031163122.37356-1-jonathan.cavitt@intel.com>
 <20241031163122.37356-3-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241031163122.37356-3-jonathan.cavitt@intel.com>
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
On 2024-10-31 at 16:31:22 +0000, Jonathan Cavitt wrote:
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
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2976
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> CC: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/xe_sysfs_timeslice_duration.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_sysfs_timeslice_duration.c b/tests/intel/xe_sysfs_timeslice_duration.c
> index 914575a282..576be98ede 100644
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

Imho '_lt' - zero is an error?!

> +	igt_sysfs_scanf(engine, "preempt_timeout_us", "%u", &saved);
> +	igt_assert_eq(saved, old_pt);
>  }
>  
>  igt_main
> @@ -158,7 +162,7 @@ igt_main
>  	int gt_count = 0;
>  	int fd = -1, sys_fd, gt;
>  	int engines_fd[8], gt_fd[8];
> -	unsigned int tds[8];
> +	unsigned int tds[8], pts[8];
>  
>  	igt_fixture {
>  		fd = drm_open_driver(DRIVER_XE);
> @@ -176,6 +180,9 @@ igt_main
>  			igt_assert(igt_sysfs_scanf(engines_fd[gt_count],
>  						   "timeslice_duration_us",
>  						   "%u", &tds[gt_count]) == 1);
> +			igt_assert(igt_sysfs_scanf(engines_fd[gt_count],

imho igt_require should be enough.

> +						   "preempt_timeout_us",
> +						   "%u", &pts[gt_count]) == 1);
>  			gt_count++;
>  		}
>  	}
> @@ -194,6 +201,8 @@ igt_main
>  	}
>  	igt_fixture {
>  		for (int i = gt_count - 1; i >= 0; i--) {
> +			igt_assert_lte(0, igt_sysfs_printf(engines_fd[i], "preempt_timeout_us",

This should be '> 0' as printf return number of bytes written,
also in case of error imho better use igt_abort()
We do not want proceed with any test after a failure.

Maybe add also check here if old value was really restored?

> +							   "%u", pts[i]));
>  			set_timeslice_duration(engines_fd[i], tds[i]);

Same problem is here, function makes checks and uses igt_assert(),
instead of calling it, open code restoration and abort on error.

Or code that function to return bool instead of asserting?

Same goes for restoration in patch 1.

Regards,
Kamil

>  			close(engines_fd[i]);
>  			close(gt_fd[i]);
> -- 
> 2.43.0
> 
