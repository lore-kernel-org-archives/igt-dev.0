Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A8966E9AF
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Aug 2020 21:09:21 +0000 (UTC)
Date: Tue, 25 Aug 2020 14:10:48 -0700
From: "Navare, Manasi" <manasi.d.navare@intel.com>
Message-ID: <20200825211041.GA22686@labuser-Z97X-UD5H>
References: <20200820164248.1153-1-bhanuprakash.modem@intel.com>
 <20200820164248.1153-2-bhanuprakash.modem@intel.com>
 <20200820182347.GA28996@labuser-Z97X-UD5H>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200820182347.GA28996@labuser-Z97X-UD5H>
Subject: Re: [igt-dev] [PATCH v3 1/2] tests/kms_vrr: Use atomic API for page
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
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Aug 20, 2020 at 11:23:47AM -0700, Navare, Manasi wrote:
> On Thu, Aug 20, 2020 at 10:12:47PM +0530, Bhanuprakash Modem wrote:
> > We should avoid using drmModePageFlip as it'll only be used for
> > legacy drivers, instead, use igt_display_commit_atomic() API to
> > page flip for atomic display code path.
> > 
> > v2:
> > * Look for the page flip event not for the vblank event (Nicholas)
> > * Fix to flip with different FBs (Bhanu)
> > v3:
> > * s/get_vblank_event_ns/get_kernel_event_ns/ (Manasi)
> > * Add a comment to capture the flip event (Manasi)
> > * Make sure we are reading valid event (Bhanu)
> > * Test clean-up (Bhanu)
> > 
> > Cc: Harry Wentland <harry.wentland@amd.com>
> > Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> > Cc: Manasi Navare <manasi.d.navare@intel.com>
> > Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> > ---
> >  tests/kms_vrr.c | 66 +++++++++++++++++++++++++------------------------
> >  1 file changed, 34 insertions(+), 32 deletions(-)
> > 
> > diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> > index a0db90006d..15db7695e8 100644
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
> > @@ -60,15 +61,18 @@ static uint64_t timespec_to_ns(struct timespec *ts)
> >  }
> >  
> >  /*
> > - * Gets a vblank event from DRM and returns its timestamp in nanoseconds.
> > + * Gets an event from DRM and returns its timestamp in nanoseconds.
> > + * Asserts if the event from DRM is not matched with requested one.
> > + *
> >   * This blocks until the event is received.
> >   */
> > -static uint64_t get_vblank_event_ns(data_t *data)
> > +static uint64_t get_kernel_event_ns(data_t *data, uint32_t event)
> >  {
> >  	struct drm_event_vblank ev;
> >  
> > -	igt_set_timeout(1, "Waiting for vblank event\n");
> > +	igt_set_timeout(1, "Waiting for an event\n");
> >  	igt_assert_eq(read(data->drm_fd, &ev, sizeof(ev)), sizeof(ev));
> > +	igt_assert_eq(ev.base.type, event);
> >  	igt_reset_timeout();
> >  
> >  	return ev.tv_sec * NSECS_PER_SEC + ev.tv_usec * 1000ull;
> > @@ -126,11 +130,11 @@ static range_t get_vrr_range(data_t *data, igt_output_t *output)
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
> > @@ -165,7 +169,6 @@ static void set_vrr_on_pipe(data_t *data, enum pipe pipe, bool enabled)
> >  static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
> >  {
> >  	drmModeModeInfo mode = *igt_output_get_mode(output);
> > -	igt_plane_t *primary;
> >  	cairo_t *cr;
> >  
> >  	/* Reset output */
> > @@ -189,8 +192,8 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
> >  	igt_put_cairo_ctx(cr);
> >  
> >  	/* Take care of any required modesetting before the test begins. */
> > -	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> > -	igt_plane_set_fb(primary, &data->fb0);
> > +	data->primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> > +	igt_plane_set_fb(data->primary, &data->fb0);
> >  
> >  	igt_display_commit_atomic(&data->display,
> >  				  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> > @@ -207,35 +210,28 @@ wait_for_vblank(data_t *data, enum pipe pipe)
> >  	vbl.request.sequence = 1;
> >  	drmWaitVBlank(data->drm_fd, &vbl);
> >  
> > -	return get_vblank_event_ns(data);
> > +	return get_kernel_event_ns(data, DRM_EVENT_VBLANK);
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
> >  	int ret;
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
> > +		ret = igt_display_try_commit_atomic(&data->display,
> > +				  DRM_MODE_ATOMIC_NONBLOCK |
> > +				  DRM_MODE_PAGE_FLIP_EVENT,
> > +				  data);

Why do we need to use igt_display_try_commit_atomic() and not just
igt_display_commit_atomic()?

Also in set_vrr_on_pipe() function, I would prefer using
igt_display_commit2() call.
And IMO, the set_vrr_on_pipe() should be called before prepare_test()
since the prop needs to be set before the modeset request.

The other think that I had to change was reset vrr prop, then set it and then prepare_test
so:

set_vrr_on_pipe(data, pipe, 0)
set_vrr_on_pipe(data, pipe, 1)
prepare_test()

This is needed since the driver doesnt do a full modeset if old_crtc_state.vrr_enabled == new_crtc_state.vrr_enabled

Manasi

> >  	} while (ret == -EBUSY);
> >  
> >  	igt_assert_eq(ret, 0);
> >  	igt_reset_timeout();
> > -
> > -	return 0;
> >  }
> >  
> >  /*
> > @@ -246,11 +242,6 @@ do_flip(data_t *data, enum pipe pipe_id, igt_fb_t *fb)
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
> > @@ -269,9 +260,14 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
> >  		int64_t diff_ns;
> >  
> >  		front = !front;
> > -		do_flip(data, pipe, front ? &data->fb1 : &data->fb0);
> > +		do_flip(data, front ? &data->fb1 : &data->fb0);
> >  
> > -		vblank_ns = get_vblank_event_ns(data);
> > +		/* We need to cpture flip event instead of vblank event,
> 		            ^^capture
> 
> > +		 * because vblank is triggered after each frame, but depending
> > +		 * on the vblank evasion time flip might or might not happen in
> > +		 * that same frame.
> > +		 */
> > +		vblank_ns = get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
> Does it make sense to name this as event_ns, calling it vbalnk_ns makes it little
> confusing since in the explanation, we said we are capture flip event here?
> 
> Not a hard change requested, but just a suggestion.
> 
> Regards
> Manasi
> 
> >  		diff_ns = rate_ns - (vblank_ns - last_vblank_ns);
> >  		last_vblank_ns = vblank_ns;
> >  
> > @@ -359,6 +355,12 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
> >  		     "Target VRR off threshold exceeded, result was %u%%\n",
> >  		     result);
> >  
> > +	/* Clean-up */
> > +	igt_plane_set_fb(data->primary, NULL);
> > +	igt_output_set_pipe(output, PIPE_NONE);
> > +	igt_display_commit_atomic(&data->display,
> > +				  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> > +
> >  	igt_remove_fb(data->drm_fd, &data->fb1);
> >  	igt_remove_fb(data->drm_fd, &data->fb0);
> >  }
> > -- 
> > 2.20.1
> > 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
