Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C169D6E131
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Jan 2021 05:37:03 +0000 (UTC)
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Wed, 20 Jan 2021 05:36:59 +0000
Message-ID: <BYAPR11MB3319AA64995102C7526E39438DA20@BYAPR11MB3319.namprd11.prod.outlook.com>
References: <20210119141712.24980-1-bhanuprakash.modem@intel.com>
 <YAcv2boUKmPbVCFl@intel.com>
In-Reply-To: <YAcv2boUKmPbVCFl@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_vrr: Update condition checks
 for flipline test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

> -----Original Message-----
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Sent: Wednesday, January 20, 2021 12:46 AM
> To: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_vrr: Update condition
> checks for flipline test
> =

> On Tue, Jan 19, 2021 at 07:47:12PM +0530, Bhanuprakash Modem wrote:
> > This patch includes below updates
> > * For Flipline test: if refresh_rate <=3D Vrr_min then
> > 	- Expected returned refresh rate would be vrr_max
> > 	- At least 35% of the flips should be in threshold
> > * Update "igt_display_commit_atomic" with "igt_display_commit2"
> > * Add few debug prints
> =

> Some ideas I had for a vrr test:
> - test flipping at a few different rates
> - make sure the interval between flip timestamps
>   matches the expected rate
Actually, we are doing the same in our flipline[*] test.

Example: if we have a monitor with vrr range of 40 - 60Hz
We'll try to flip with 35, 50 and 65 Hz, and the difference between the
two flip timestamps should be within the required threshold from the
expected rate. A ~50us threshold is an arbitrary.

[*] https://patchwork.freedesktop.org/patch/392037

> - otherwise confirm the timestamps are sensible. Not quite sure what the
>   best way would be. One idea was to just make sure the timestamp points
>   to more or less the correct point in time. Another idea was to drive
>   the whole loop baed on the timestamps + target refresh rate (ie. wait
>   for event, schedule next flip for event timestamps + whatever time we
>   have left to reach the exected refresh rate). This latter idea I think
>   would catch bugs where the interval between timestamps is correct but
>   the absolute times are not correct (eg. if the timestamps are
>   miscorrected to point fr into the future based on the max vblank
>   length, or too close into the future based on min vblank length).
> - the busy loop thing I don't think should be needed. Sure, there is
>   some wakeup latency due to C-states and whatnot, but it should be
>   possible to compensate to make sure we reach the target refresh rate
>   w/o spinning.
This part is not clear to me.

Ex. To generate the flips with refresh rate 50Hz (ie. 20000000ns), below
is the expected sequence:

* Request a flip & wait for flip completion event
* Capture the event timestamp to compare
* Wait 20000000ns for next flip
* Repeat

Am I missing something here?

> =

> >
> > V2:
> > * Rebase
> >
> > Cc: Manasi Navare <manasi.d.navare@intel.com>
> > Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> > Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> > ---
> >  tests/kms_vrr.c | 51 ++++++++++++++++++++-----------------------------
> >  1 file changed, 21 insertions(+), 30 deletions(-)
> >
> > diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> > index beb06854f..e6edd131f 100644
> > --- a/tests/kms_vrr.c
> > +++ b/tests/kms_vrr.c
> > @@ -170,7 +170,7 @@ static void set_vrr_on_pipe(data_t *data, enum pipe
> pipe, bool enabled)
> >  {
> >  	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED,
> >  				enabled);
> > -	igt_display_commit_atomic(&data->display, 0, NULL);
> > +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> >  }
> >
> >  /* Prepare the display for testing on the given pipe. */
> > @@ -208,8 +208,7 @@ static void prepare_test(data_t *data, igt_output_t
> *output, enum pipe pipe)
> >  	 */
> >  	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED,
> 0);
> >
> > -	igt_display_commit_atomic(&data->display,
> > -				  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> > +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> >  }
> >
> >  /* Waits for the vblank interval. Returns the vblank timestamp in ns.
> */
> > @@ -291,14 +290,10 @@ flip_and_measure(data_t *data, igt_output_t
> *output, enum pipe pipe,
> >  		 * difference between 144Hz and 143Hz which should give this
> >  		 * enough accuracy for most use cases.
> >  		 */
> > -		if (rate_ns <=3D vtest_ns.min && rate_ns >=3D vtest_ns.max)
> > +		if ((rate_ns < vtest_ns.min) && (rate_ns >=3D vtest_ns.max))
> >  			diff_ns =3D rate_ns;
> > -		else if (rate_ns > vtest_ns.min)
> > -			diff_ns =3D vtest_ns.min;
> > -		else if (rate_ns < vtest_ns.max)
> > -			diff_ns =3D vtest_ns.max;
> >  		else
> > -			diff_ns =3D rate_ns;
> > +			diff_ns =3D vtest_ns.max;
> >  		diff_ns -=3D event_ns - last_event_ns;
> >
> >  		if (llabs(diff_ns) < 50000ll)
> > @@ -323,8 +318,8 @@ flip_and_measure(data_t *data, igt_output_t *output,
> enum pipe pipe,
> >  		while (get_time_ns() < target_ns);
> >  	}
> >
> > -	igt_info("Completed %u flips, %u were in threshold for
> %"PRIu64"ns.\n",
> > -		 total_flip, total_pass, rate_ns);
> > +	igt_info("Completed %u flips, %u were in threshold for (%llu Hz)
> %"PRIu64"ns.\n",
> > +		 total_flip, total_pass, (NSECS_PER_SEC/rate_ns), rate_ns);
> >
> >  	return total_flip ? ((total_pass * 100) / total_flip) : 0;
> >  }
> > @@ -338,8 +333,8 @@ test_basic(data_t *data, enum pipe pipe,
> igt_output_t *output, uint32_t flags)
> >  	range_t range =3D get_vrr_range(data, output);
> >  	uint64_t rate =3D vtest_ns.mid;
> >
> > -	igt_info("VRR Test execution on %s, PIPE_%s\n",
> > -		 output->name, kmstest_pipe_name(pipe));
> > +	igt_info("VRR Test execution on %s, PIPE_%s with VRR range: (%u-%u)
> Hz\n",
> > +		 output->name, kmstest_pipe_name(pipe), range.min, range.max);
> >
> >  	prepare_test(data, output, pipe);
> >
> > @@ -370,46 +365,42 @@ test_basic(data_t *data, enum pipe pipe,
> igt_output_t *output, uint32_t flags)
> >  	 * decision boundary.
> >  	 *
> >  	 * Example: if range is 40 - 60Hz and
> > -	 * if refresh_rate > 60Hz:
> > +	 * if refresh_rate > 60Hz or <=3D 40Hz:
> >  	 *      Flip should happen at the flipline boundary & returned
> refresh rate
> >  	 *      would be 60Hz.
> >  	 * if refresh_rate is 50Hz:
> >  	 *      Flip will happen right away so returned refresh rate is
> 50Hz.
> > -	 * if refresh_rate < 40Hz:
> > -	 *      Flip should happen at the vmax so the returned refresh rate
> > -	 *      would be 40Hz.
> >  	 */
> >  	if (flags & TEST_FLIPLINE) {
> > -		rate =3D rate_from_refresh(range.min - 5);
> > +		rate =3D rate_from_refresh(range.max + 5);
> >  		result =3D flip_and_measure(data, output, pipe, rate,
> TEST_DURATION_NS);
> >  		igt_assert_f(result > 75,
> > -			     "Refresh rate %"PRIu64"ns: Target VRR on threshold
> not reached, result was %u%%\n",
> > -			     rate, result);
> > +			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on
> threshold not reached, result was %u%%\n",
> > +			     (range.max + 5), rate, result);
> >
> > -		rate =3D rate_from_refresh(range.max + 5);
> > +		rate =3D rate_from_refresh(range.min - 5);
> >  		result =3D flip_and_measure(data, output, pipe, rate,
> TEST_DURATION_NS);
> > -		igt_assert_f(result > 75,
> > -			     "Refresh rate %"PRIu64"ns: Target VRR on threshold
> not reached, result was %u%%\n",
> > -			     rate, result);
> > +		igt_assert_f(result > 35,
> > +			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on
> threshold not reached, result was %u%%\n",
> > +			     (range.min - 5), rate, result);
> >  	}
> >
> >  	rate =3D vtest_ns.mid;
> >  	result =3D flip_and_measure(data, output, pipe, rate,
> TEST_DURATION_NS);
> >  	igt_assert_f(result > 75,
> > -		     "Refresh rate %"PRIu64"ns: Target VRR on threshold not
> reached, result was %u%%\n",
> > -		     rate, result);
> > +		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold
> not reached, result was %u%%\n",
> > +		     ((range.max + range.min) / 2), rate, result);
> >
> >  	set_vrr_on_pipe(data, pipe, 0);
> >  	result =3D flip_and_measure(data, output, pipe, rate,
> TEST_DURATION_NS);
> >  	igt_assert_f(result < 10,
> > -		     "Refresh rate %"PRIu64"ns: Target VRR off threshold
> exceeded, result was %u%%\n",
> > -		     rate, result);
> > +		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR off
> threshold exceeded, result was %u%%\n",
> > +		     ((range.max + range.min) / 2), rate, result);
> >
> >  	/* Clean-up */
> >  	igt_plane_set_fb(data->primary, NULL);
> >  	igt_output_set_pipe(output, PIPE_NONE);
> > -	igt_display_commit_atomic(&data->display,
> > -				  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> > +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> >
> >  	igt_remove_fb(data->drm_fd, &data->fb1);
> >  	igt_remove_fb(data->drm_fd, &data->fb0);
> > --
> > 2.20.1
> >
> > _______________________________________________
> > igt-dev mailing list
> > igt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/igt-dev
> =

> --
> Ville Syrj=E4l=E4
> Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
