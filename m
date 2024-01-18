Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEAE6C4707B
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 11:29:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5100D10E789;
	Thu, 18 Jan 2024 11:29:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC5510E782
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 11:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705577341; x=1737113341;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gk37EphjA9JhEedLqQLGN+ytaeTxfrh+7FymZdlkS9U=;
 b=B8YtpXGWGTmAS9MvCnvsetA/+tBpNGUZiJHO+vBdAKHOHkcClr7WM/+C
 q2ORzBD1FspA8/qxiRJjtpWiG/LCPcZU9VNkIfmAbjPoaPzSRC444+0Aw
 irU7qqNaBrk+b9BzlDYEMsqErDapx+eEy2wNnp3irvBcCflwexj1OGNJz
 rNjtPizh6+AJNCU3fdYNDzmfFNAuSE1Lk4V9Q9F55A9LwBd/D8OmqW8mW
 mHBpX6JoiyRZF87F3Ast+jQnzRLA4d+7DCOPW86uNNTS9bu8yz5dLXUPg
 ++hcJsByHsXG9RlAsHLD9BU6iU8+ccxklre4vmYq5ch0l+8+hZCd/eT4n Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="21903138"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="21903138"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 03:29:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="1115935816"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="1115935816"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmsmga005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 03:28:59 -0800
Date: Thu, 18 Jan 2024 12:28:57 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH v2] tests/syncobj_timeline: test delayed submission with, 
 WAIT_AVAILABLE
Message-ID: <20240118112857.m2dshnhpbf6wrmxd@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Erik Kurzinger <ekurzinger@nvidia.com>
References: <477888e4-637a-4704-88f5-cde3c10e0ae0@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <477888e4-637a-4704-88f5-cde3c10e0ae0@nvidia.com>
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

Hi Erik,
On 2024-01-12 at 14:31:58 -0800, Erik Kurzinger wrote:

please drop from commit message const names you added, add also i-g-t
after PATCH, so instead of:

[PATCH v2] tests/syncobj_timeline: test delayed submission with, WAIT_AVAILABLE

this would be:

[PATCH i-g-t v2] tests/syncobj_timeline: test delayed submission

> The syncobj_timeline test suite includes cases where
> drmSyncobjTimelineWait is called with the WAIT_FOR_SUBMIT flag before
> the timeline point has been submitted. Then, after a short delay, the
> timeline point does get submitted and signaled and the test verifies
> that the drmSyncobjTimelineWait call is unblocked as expected.
> 
> Alas, while this was working correctly with the WAIT_FOR_SUBMIT flag, if
> the WAIT_AVAILABLE flag is used instead the wait will *always* block for
> the full timeout duration even if the timeline point is submitted
> earlier due to a bug in the kernel. The return value would still
> indicate that the wait completed successfully, though. That is, it
> wouldn't return -ETIME.
> 
> To ensure test coverage for such a scenario, this change adds delayed
> submission test cases which use the WAIT_AVAILABLE flag. These will be
> similar to the WAIT_FOR_SUBMIT cases mentioned above except that, after
> the delay, the timeline point will only submitted, not signaled.
> 
> Furthermore, it adds an assertion that the drmSyncobjTimelineWait call
> returned *before* the timeout expired, which it always should since the
> timeout is a full 100ms longer than the delay.
> 
> v1 -> v2: added documentation for new test cases
> 
> Signed-off-by: Erik Kurzinger <ekurzinger@nvidia.com>

Overall it looks good but I didn't test it.
Allow me few more days for reading and review,

Regards,
Kamil

> ---
>  tests/syncobj_timeline.c | 46 ++++++++++++++++++++++++++++++++++++----
>  1 file changed, 42 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
> index ea8341a30..25ccd6889 100644
> --- a/tests/syncobj_timeline.c
> +++ b/tests/syncobj_timeline.c
> @@ -394,6 +394,9 @@
>   * SUBTEST: wait-all-for-submit-delayed-submit
>   * Description: Verifies wait behavior on a timeline syncobj with a delayed signal from a different thread
>   *
> + * SUBTEST: wait-all-available-delayed-submit
> + * Description: Verifies wait behavior on a timeline syncobj with a delayed submit from a different thread
> + *
>   * SUBTEST: wait-all-for-submit-snapshot
>   * Description: Verifies waiting on a list of timeline syncobjs with different thread for wait/signal
>   *
> @@ -425,6 +428,9 @@
>   * SUBTEST: wait-for-submit-delayed-submit
>   * Description: Verifies wait behavior on a timeline syncobj with a delayed signal from a different thread
>   *
> + * SUBTEST: wait-available-delayed-submit
> + * Description: Verifies wait behavior on a timeline syncobj with a delayed submit from a different thread
> + *
>   * SUBTEST: wait-for-submit-snapshot
>   * Description: Verifies waiting on a list of timeline syncobjs with different thread for wait/signal
>   */
> @@ -490,6 +496,13 @@ syncobj_trigger(int fd, uint32_t handle, uint64_t point)
>  	close(timeline);
>  }
>  
> +static void
> +syncobj_submit(int fd, uint32_t handle, uint64_t point)
> +{
> +	int timeline = syncobj_attach_sw_sync(fd, handle, point);
> +	close(timeline);
> +}
> +
>  static timer_t
>  set_timer(void (*cb)(union sigval), void *ptr, int i, uint64_t nsec)
>  {
> @@ -534,8 +547,17 @@ syncobj_trigger_free_pair_func(union sigval sigval)
>  	free(pair);
>  }
>  
> +static void
> +syncobj_submit_free_pair_func(union sigval sigval)
> +{
> +	struct fd_handle_pair *pair = sigval.sival_ptr;
> +	syncobj_submit(pair->fd, pair->handle, pair->point);
> +	free(pair);
> +}
> +
>  static timer_t
> -syncobj_trigger_delayed(int fd, uint32_t syncobj, uint64_t point, uint64_t nsec)
> +syncobj_delayed_operation(int fd, uint32_t syncobj, uint64_t point, uint64_t nsec,
> +			  void (*operation)(union sigval))
>  {
>  	struct fd_handle_pair *pair = malloc(sizeof(*pair));
>  
> @@ -543,7 +565,7 @@ syncobj_trigger_delayed(int fd, uint32_t syncobj, uint64_t point, uint64_t nsec)
>  	pair->handle = syncobj;
>  	pair->point = point;
>  
> -	return set_timer(syncobj_trigger_free_pair_func, pair, 0, nsec);
> +	return set_timer(operation, pair, 0, nsec);
>  }
>  
>  static const char *test_wait_bad_flags_desc =
> @@ -942,18 +964,26 @@ test_wait_delayed_signal(int fd, uint32_t test_flags)
>  	uint64_t point = 1;
>  	int timeline = -1;
>  	timer_t timer;
> +	uint64_t start_time;
>  
>  	if (test_flags & WAIT_FOR_SUBMIT) {
> -		timer = syncobj_trigger_delayed(fd, syncobj, point, SHORT_TIME_NSEC);
> +		timer = syncobj_delayed_operation(fd, syncobj, point, SHORT_TIME_NSEC,
> +						  syncobj_trigger_free_pair_func);
> +	} else if (test_flags & WAIT_AVAILABLE) {
> +		timer = syncobj_delayed_operation(fd, syncobj, point, SHORT_TIME_NSEC,
> +						  syncobj_submit_free_pair_func);
>  	} else {
>  		timeline = syncobj_attach_sw_sync(fd, syncobj, point);
>  		timer = set_timer(timeline_inc_func, NULL,
>  				  timeline, SHORT_TIME_NSEC);
>  	}
>  
> +	start_time = gettime_ns();
>  	igt_assert(syncobj_timeline_wait(fd, &syncobj, &point, 1,
> -				gettime_ns() + SHORT_TIME_NSEC * 2,
> +				start_time + SHORT_TIME_NSEC * 2,
>  				flags, NULL));
> +	/* ensure we were unblocked before the timeout expired */
> +	igt_assert(gettime_ns() - start_time < SHORT_TIME_NSEC * 2);
>  
>  	timer_delete(timer);
>  
> @@ -1809,6 +1839,10 @@ igt_main
>  	igt_subtest("wait-for-submit-delayed-submit")
>  		test_wait_delayed_signal(fd, WAIT_FOR_SUBMIT);
>  
> +	igt_describe(test_wait_delayed_signal_desc);
> +	igt_subtest("wait-available-delayed-submit")
> +		test_wait_delayed_signal(fd, WAIT_AVAILABLE);
> +
>  	igt_describe(test_wait_delayed_signal_desc);
>  	igt_subtest("wait-all-delayed-signal")
>  		test_wait_delayed_signal(fd, WAIT_ALL);
> @@ -1817,6 +1851,10 @@ igt_main
>  	igt_subtest("wait-all-for-submit-delayed-submit")
>  		test_wait_delayed_signal(fd, WAIT_ALL | WAIT_FOR_SUBMIT);
>  
> +	igt_describe(test_wait_delayed_signal_desc);
> +	igt_subtest("wait-all-available-delayed-submit")
> +		test_wait_delayed_signal(fd, WAIT_ALL | WAIT_AVAILABLE);
> +
>  	igt_describe(test_reset_unsignaled_desc);
>  	igt_subtest("reset-unsignaled")
>  		test_reset_unsignaled(fd);
> -- 
> 2.43.0
> 
> 
