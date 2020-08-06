Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00DDD6E144
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Aug 2020 07:02:31 +0000 (UTC)
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Thu, 6 Aug 2020 07:02:04 +0000
Message-ID: <SN6PR11MB3327F0CE566AF8A840F45FE78D480@SN6PR11MB3327.namprd11.prod.outlook.com>
References: <20200511062647.9514-2-bhanuprakash.modem@intel.com>
 <20200805183506.22591-2-bhanuprakash.modem@intel.com>
 <20200805191110.GA15630@labuser-Z97X-UD5H>
In-Reply-To: <20200805191110.GA15630@labuser-Z97X-UD5H>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v2 1/2] tests/kms_vrr: Use atomic API for page
 flip
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Navare, Manasi D" <manasi.d.navare@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

> -----Original Message-----
> From: Navare, Manasi <manasi.d.navare@intel.com>
> Sent: Thursday, August 6, 2020 12:41 AM
> To: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Harry Wentland
> <harry.wentland@amd.com>; Nicholas Kazlauskas
> <nicholas.kazlauskas@amd.com>
> Subject: Re: [PATCH v2 1/2] tests/kms_vrr: Use atomic API for page flip
> 
> On Thu, Aug 06, 2020 at 12:05:05AM +0530, Bhanuprakash Modem wrote:
> > We should avoid using drmModePageFlip as it'll only be used for
> > legacy drivers, instead, use igt_display_commit_atomic() API to
> > page flip for atomic display code path.
> >
> > v2:
> > * Look for the page flip event not for the vblank event (Nicholas)
> 
> Where have you done this change to wait for page flip event instead of
> vblank event?
> I thought we would need to change the function get_vblank_event_ns() for
> this, I dont see
> that change below, may be I am missing something?
[Bhanu] I think no need to change the logic in get_vblank_event_ns(). May be we can have extra check (like "ev.base.type == event") to make sure we are reading the correct event.

Call flow:
1) drmWaitVBlank --> get_vblank_event_ns(): will get the DRM_EVENT_VBLANK event timestamp
2) igt_display_commit_atomic(DRM_MODE_PAGE_FLIP_EVENT) --> get_vblank_event_ns(): will get the DRM_EVENT_FLIP_COMPLETE event timestamp

Yeah, we can rename the get_vblank_event_ns() in a generic way like get_event_ns()
> 
> @Nicholas, have you tested the AMD stack with the page flip event
> timestamp deltas
> instead of the vblank event timetsmap deltas and does that work?
> 
> Manasi
> 
> > * Fix to flip with different FBs (Bhanu)
> >
> > Cc: Harry Wentland <harry.wentland@amd.com>
> > Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> > Cc: Manasi Navare <manasi.d.navare@intel.com>
> > Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> > ---
> >  tests/kms_vrr.c | 45 +++++++++++++++++----------------------------
> >  1 file changed, 17 insertions(+), 28 deletions(-)
> >
> > diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> > index 559ef203..b433a12e 100644
> > --- a/tests/kms_vrr.c
> > +++ b/tests/kms_vrr.c
> > @@ -47,6 +47,7 @@ typedef struct range {
> >  typedef struct data {
> >  	igt_display_t display;
> >  	int drm_fd;
> > +	igt_plane_t *primary;
> >  	igt_fb_t fb0;
> >  	igt_fb_t fb1;
> >  } data_t;
> > @@ -126,11 +127,11 @@ static range_t get_vrr_range(data_t *data,
> igt_output_t *output)
> >  }
> >
> >  /* Returns a suitable vrr test frequency. */
> > -static uint32_t get_test_rate_ns(data_t *data, igt_output_t *output)
> > +static uint64_t get_test_rate_ns(data_t *data, igt_output_t *output)
> >  {
> >  	drmModeModeInfo *mode = igt_output_get_mode(output);
> >  	range_t range;
> > -	uint32_t vtest;
> > +	uint64_t vtest;
> >
> >  	/*
> >  	 * The frequency with the fastest convergence speed should be
> > @@ -165,7 +166,6 @@ static void set_vrr_on_pipe(data_t *data, enum pipe
> pipe, bool enabled)
> >  static void prepare_test(data_t *data, igt_output_t *output, enum pipe
> pipe)
> >  {
> >  	drmModeModeInfo mode = *igt_output_get_mode(output);
> > -	igt_plane_t *primary;
> >  	cairo_t *cr;
> >
> >  	/* Reset output */
> > @@ -189,8 +189,8 @@ static void prepare_test(data_t *data, igt_output_t
> *output, enum pipe pipe)
> >  	igt_put_cairo_ctx(cr);
> >
> >  	/* Take care of any required modesetting before the test begins. */
> > -	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> > -	igt_plane_set_fb(primary, &data->fb0);
> > +	data->primary = igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY);
> > +	igt_plane_set_fb(data->primary, &data->fb0);
> >
> >  	igt_display_commit_atomic(&data->display,
> >  				  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> > @@ -210,32 +210,25 @@ wait_for_vblank(data_t *data, enum pipe pipe)
> >  	return get_vblank_event_ns(data);
> >  }
> >
> > -/* Performs an asynchronous non-blocking page-flip on a pipe. */
> > -static int
> > -do_flip(data_t *data, enum pipe pipe_id, igt_fb_t *fb)
> > +/* Performs an atomic non-blocking page-flip on a pipe. */
> > +static void
> > +do_flip(data_t *data, igt_fb_t *fb)
> >  {
> > -	igt_pipe_t *pipe = &data->display.pipes[pipe_id];
> > -	int ret;
> > +	int ret = 0;
> >
> >  	igt_set_timeout(1, "Scheduling page flip\n");
> >
> > -	/*
> > -	 * Only the legacy flip ioctl supports async flips.
> > -	 * It's also non-blocking, but returns -EBUSY if flipping too fast.
> > -	 * 2x monitor tests will need async flips in the atomic API.
> > -	 */
> > +	igt_plane_set_fb(data->primary, fb);
> > +
> >  	do {
> > -		ret = drmModePageFlip(data->drm_fd, pipe->crtc_id,
> > -				      fb->fb_id,
> > -				      DRM_MODE_PAGE_FLIP_EVENT |
> > -				      DRM_MODE_PAGE_FLIP_ASYNC,
> > -				      data);
> > +		igt_display_commit_atomic(&data->display,
> > +				  DRM_MODE_ATOMIC_NONBLOCK |
> > +				  DRM_MODE_PAGE_FLIP_EVENT,
> > +				  data);
> >  	} while (ret == -EBUSY);
> >
> >  	igt_assert_eq(ret, 0);
> >  	igt_reset_timeout();
> > -
> > -	return 0;
> >  }
> >
> >  /*
> > @@ -246,11 +239,6 @@ do_flip(data_t *data, enum pipe pipe_id, igt_fb_t
> *fb)
> >   * can arbitrarily restrict the bounds further than the absolute
> >   * min and max range. But VRR is really about extending the flip
> >   * to prevent stuttering or to match a source content rate.
> > - *
> > - * The only way to "present" at a fixed rate like userspace in a vendor
> > - * neutral manner is to do it with async flips. This avoids the need
> > - * to wait for next vblank and it should eventually converge at the
> > - * desired rate.
> >   */
> >  static uint32_t
> >  flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
> > @@ -269,7 +257,7 @@ flip_and_measure(data_t *data, igt_output_t *output,
> enum pipe pipe,
> >  		int64_t diff_ns;
> >
> >  		front = !front;
> > -		do_flip(data, pipe, front ? &data->fb1 : &data->fb0);
> > +		do_flip(data, front ? &data->fb1 : &data->fb0);
> >
> >  		vblank_ns = get_vblank_event_ns(data);
> >  		diff_ns = rate_ns - (vblank_ns - last_vblank_ns);
> > @@ -359,6 +347,7 @@ test_basic(data_t *data, enum pipe pipe,
> igt_output_t *output, uint32_t flags)
> >  		     "Target VRR off threshold exceeded, result was %u%%\n",
> >  		     result);
> >
> > +	igt_plane_set_fb(data->primary, NULL);
> >  	igt_remove_fb(data->drm_fd, &data->fb1);
> >  	igt_remove_fb(data->drm_fd, &data->fb0);
> >  }
> > --
> > 2.20.1
> >
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
