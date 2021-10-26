Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A7CF6E512
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Oct 2021 08:41:08 +0000 (UTC)
Date: Tue, 26 Oct 2021 11:39:43 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YXe+z9KDNBtbxN3g@platvala-desk.ger.corp.intel.com>
References: <20210728171616.2242447-1-markyacoub@chromium.org>
 <20210924183929.508631-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210924183929.508631-1-markyacoub@chromium.org>
Subject: Re: [igt-dev] [PATCH v2] tests/kms_flip: Discard any stale event at
 each retry
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mark Yacoub <markyacoub@chromium.org>
Cc: igt-dev@lists.freedesktop.org, arek@hiler.eu, seanpaul@chromium.org, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Sep 24, 2021 at 02:39:29PM -0400, Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@google.com>
> 
> [Why]
> On slower devices, non blocking do_page_flip followed by wait_for_events
> does not finish fast enough to send an event to be consumed by wait_for_events.
> Instead, wait_for_events ends up finding an unconsumed event from a
> previous do_page_flip (i.e. a skipped preceding subtest) and signals
> that the userspace is ready to do another do_page_flip while the first
> one hasn't finished yet, resulting in an EBUSY.
> 
> [How]
> At the beginning of every test running on crtc set, check for any stale
> events and consume them so the kernel has no pending events.
> 
> Fixes: flip-vs-suspend and flip-vs-suspend-interruptible.
> Tested on ChromeOS Volteer(i915-TGL) and Trogdor(msm)
> 
> Changes since v1:
> 1. Update the discard_any_stale_events timeout
> 2. Correct a debug message
> 3. use C-style comments
> 
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>

Looks like Arek's comments have been addressed, and this LGTM.

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  tests/kms_flip.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index b4836a44..73a8e636 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -1265,6 +1265,26 @@ static bool needs_retry_after_link_reset(struct udev_monitor *mon)
>  	return hotplug_detected;
>  }
>  
> +static void discard_any_stale_events() {
> +	fd_set fds;
> +	FD_ZERO(&fds);
> +	FD_SET(drm_fd, &fds);
> +	struct timeval timeout = { .tv_sec = 0, .tv_usec = 20000 };
> +	int ret = select(drm_fd + 1, &fds, NULL, NULL, &timeout);
> +
> +	if (ret > 0) {
> +		drmEventContext evctx;
> +		memset(&evctx, 0, sizeof evctx);
> +		evctx.version = 2;
> +		igt_info("Stale Event found - Discarding now\n");
> +		drmHandleEvent(drm_fd, &evctx);
> +	}
> +	else {
> +		igt_debug("No stale events found\n");
> +	}
> +}
> +
> +
>  static void __run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
>  				   int crtc_count, int duration_ms)
>  {
> @@ -1315,6 +1335,9 @@ static void __run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
>  		kmstest_dump_mode(&o->kmode[i]);
>  
>  retry:
> +	/* Discard any pending event that hasn't been consumed from a previous retry or subtest. */
> +	discard_any_stale_events();
> +
>  	memset(&o->vblank_state, 0, sizeof(o->vblank_state));
>  	memset(&o->flip_state, 0, sizeof(o->flip_state));
>  	o->flip_state.name = "flip";
> -- 
> 2.33.0.685.g46640cef36-goog
> 
