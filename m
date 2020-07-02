Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14306E20B
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jul 2020 04:17:03 +0000 (UTC)
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Thu, 2 Jul 2020 04:16:59 +0000
Message-ID: <SN6PR11MB33273EEF7679435C4617EA768D6D0@SN6PR11MB3327.namprd11.prod.outlook.com>
References: <20200511062647.9514-1-bhanuprakash.modem@intel.com>
 <20200511062647.9514-2-bhanuprakash.modem@intel.com>
 <20200602191102.GA6277@intel.com>
In-Reply-To: <20200602191102.GA6277@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [RFC PATCH 1/2] tests/kms_vrr: Use atomic API for
 page flip
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
To: "harry.wentland@amd.com" <harry.wentland@amd.com>, "nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Kiran,
 Pichika Uday" <pichika.uday.kiran@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

> -----Original Message-----
> From: Navare, Manasi D <manasi.d.navare@intel.com>
> Sent: Wednesday, June 3, 2020 12:41 AM
> To: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Cc: igt-dev@lists.freedesktop.org; harry.wentland@amd.com;
> nicholas.kazlauskas@amd.com; Kiran, Pichika Uday
> <pichika.uday.kiran@intel.com>
> Subject: Re: [RFC PATCH 1/2] tests/kms_vrr: Use atomic API for page flip
> 
> On Mon, May 11, 2020 at 11:56:46AM +0530, bhanuprakash.modem@intel.com
> wrote:
> > From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> >
> > We should avoid using drmModePageFlip as it'll only be used for
> > legacy drivers, instead, use igt_display_commit_atomic() API to
> > page flip for atomic display code path.
> >
> > Cc: Harry Wentland <harry.wentland@amd.com>
> > Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> > Cc: Manasi Navare <manasi.d.navare@intel.com>
> > Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> 
> I have tested this on i915 and the page flips are captured correctly with
> non blocking page flip requests using atomic_commit call.
> 
> @Harry, @Nicholas could you test this on AMD driver to make
> sure its not breaking anything?
[Bhanu] 
@Harry, @Nicholas did you get a chance to check this patch?
> 
> Manasi
> 
> > ---
> >  tests/kms_vrr.c | 39 ++++++++++-----------------------------
> >  1 file changed, 10 insertions(+), 29 deletions(-)
> >
> > diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> > index 73115fef..0fe28931 100644
> > --- a/tests/kms_vrr.c
> > +++ b/tests/kms_vrr.c
> > @@ -126,11 +126,11 @@ static range_t get_vrr_range(data_t *data,
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
> > @@ -210,32 +210,18 @@ wait_for_vblank(data_t *data, enum pipe pipe)
> >  	return get_vblank_event_ns(data);
> >  }
> >
> > -/* Performs an asynchronous non-blocking page-flip on a pipe. */
> > -static int
> > +/* Performs an atomic non-blocking page-flip on a pipe. */
> > +static void
> >  do_flip(data_t *data, enum pipe pipe_id, igt_fb_t *fb)
> >  {
> > -	igt_pipe_t *pipe = &data->display.pipes[pipe_id];
> > -	int ret;
> > -
> >  	igt_set_timeout(1, "Scheduling page flip\n");
> >
> > -	/*
> > -	 * Only the legacy flip ioctl supports async flips.
> > -	 * It's also non-blocking, but returns -EBUSY if flipping too fast.
> > -	 * 2x monitor tests will need async flips in the atomic API.
> > -	 */
> > -	do {
> > -		ret = drmModePageFlip(data->drm_fd, pipe->crtc_id,
> > -				      fb->fb_id,
> > -				      DRM_MODE_PAGE_FLIP_EVENT |
> > -				      DRM_MODE_PAGE_FLIP_ASYNC,
> > -				      data);
> > -	} while (ret == -EBUSY);
> > -
> > -	igt_assert_eq(ret, 0);
> > -	igt_reset_timeout();
> > +	igt_display_commit_atomic(&data->display,
> > +				  DRM_MODE_ATOMIC_NONBLOCK |
> > +				  DRM_MODE_PAGE_FLIP_EVENT,
> > +				  NULL);
> >
> > -	return 0;
> > +	igt_reset_timeout();
> >  }
> >
> >  /*
> > @@ -246,11 +232,6 @@ do_flip(data_t *data, enum pipe pipe_id, igt_fb_t
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
> > @@ -271,7 +252,7 @@ flip_and_measure(data_t *data, igt_output_t *output,
> enum pipe pipe,
> >  		front = !front;
> >  		do_flip(data, pipe, front ? &data->fb1 : &data->fb0);
> >
> > -		vblank_ns = get_vblank_event_ns(data);
> > +		vblank_ns = wait_for_vblank(data, pipe);
> >  		diff_ns = rate_ns - (vblank_ns - last_vblank_ns);
> >  		last_vblank_ns = vblank_ns;
> >
> > --
> > 2.24.1.1.gb6d4d82bd5
> >
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
