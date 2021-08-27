Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F1A6E8D5
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Aug 2021 05:44:25 +0000 (UTC)
Date: Fri, 27 Aug 2021 08:47:18 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YSh8Zot/cr7EFTJj@platvala-desk.ger.corp.intel.com>
References: <20210728171616.2242447-1-markyacoub@chromium.org>
 <20210826125516.dbxzwxmgx5amokkr@outlook.office365.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210826125516.dbxzwxmgx5amokkr@outlook.office365.com>
Subject: Re: [igt-dev] [PATCH] tests/kms_flip: Discard any stale event at
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
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Mark Yacoub <markyacoub@chromium.org>, Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>, igt-dev@lists.freedesktop.org, robdclark@chromium.org, seanpaul@chromium.org, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Aug 26, 2021 at 08:55:16AM -0400, Rodrigo Siqueira wrote:
> Hi Lakshminarayana,
> 
> I noticed that the CI pipeline for GitLab failed in this patch. I look
> at the log, and I think this failed due to CI instabilities. Could you
> trigger the CI again for this patch?

Triggered a full test round. Repeating just the gitlab parts would
just repeat with the timeouting setup.


-- 
Petri Latvala


> 
> Thanks
> Siqueira
> 
> On 07/28, Mark Yacoub wrote:
> > From: Mark Yacoub <markyacoub@google.com>
> > 
> > [Why]
> > On slower devices, non blocking do_page_flip followed by wait_for_events does not finish fast enough to send an event to be consumed by wait_for_events.
> > Instead, wait_for_events ends up finding an unconsumed event from a
> > previous do_page_flip (i.e. a skipped preceding subtest) and signals
> > that the userspace is ready to do another do_page_flip while the first
> > one hasn't finished yet, resulting in an EBUSY.
> > 
> > [How]
> > At the beginning of every test running on crtc set, check for any stale
> > events and consume them so the kernel has no pending events.
> > 
> > Fixes: flip-vs-suspend and flip-vs-suspend-interruptible.
> > Tested on ChromeOS Volteer(i915-TGL) and Trogdor(msm)
> > 
> > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> > Change-Id: I254a84a202140c332312aba1d9edf15ea78b7a61
> > ---
> >  tests/kms_flip.c | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> > 
> > diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> > index f2fce8d2..0a2041c5 100755
> > --- a/tests/kms_flip.c
> > +++ b/tests/kms_flip.c
> > @@ -1261,6 +1261,26 @@ static bool needs_retry_after_link_reset(struct udev_monitor *mon)
> >  	return hotplug_detected;
> >  }
> >  
> > +static void discard_any_stale_events() {
> > +	fd_set fds;
> > +	FD_ZERO(&fds);
> > +	FD_SET(drm_fd, &fds);
> > +	struct timeval timeout = { .tv_sec = 3, .tv_usec = 0 };
> > +	int ret = select(drm_fd + 1, &fds, NULL, NULL, &timeout);
> > +
> > +	if (ret > 0) {
> > +		drmEventContext evctx;
> > +		memset(&evctx, 0, sizeof evctx);
> > +		evctx.version = 2;
> > +		igt_info("Stale Event found - Discarding now\n");
> > +		drmHandleEvent(drm_fd, &evctx);
> > +	}
> > +	else {
> > +		igt_debug("No stale Event found\n");
> > +	}
> > +}
> > +
> > +
> >  static void __run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
> >  				   int crtc_count, int duration_ms)
> >  {
> > @@ -1311,6 +1331,9 @@ static void __run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
> >  		kmstest_dump_mode(&o->kmode[i]);
> >  
> >  retry:
> > +	// Discard any pending event that hasn't been consumed from a previous retry or subtest.
> > +	discard_any_stale_events();
> > +
> >  	memset(&o->vblank_state, 0, sizeof(o->vblank_state));
> >  	memset(&o->flip_state, 0, sizeof(o->flip_state));
> >  	o->flip_state.name = "flip";
> > -- 
> > 2.32.0.432.gabb21c7263-goog
> > 
> > _______________________________________________
> > igt-dev mailing list
> > igt-dev@lists.freedesktop.org
> > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Figt-dev&amp;data=04%7C01%7CRodrigo.Siqueira%40amd.com%7C5bc54d07bd7b47a66e0d08d951eb6c94%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637630893864077242%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=nqwaQ2ruIdx27uUE3kXgGGf5LcJaO7w0GmfSyoHOHP8%3D&amp;reserved=0
> 
> -- 
> Rodrigo Siqueira
> https://siqueira.tech
