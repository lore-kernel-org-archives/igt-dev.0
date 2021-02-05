Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEFD16EEAD
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Feb 2021 00:11:07 +0000 (UTC)
Date: Thu, 4 Feb 2021 16:15:59 -0800
From: "Navare, Manasi" <manasi.d.navare@intel.com>
Message-ID: <20210205001559.GA29971@labuser-Z97X-UD5H>
References: <20210204203143.25918-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210204203143.25918-1-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [PATCH V5 i-g-t] tests/kms_vrr: Update condition
 checks for flipline test
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
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Feb 05, 2021 at 02:01:43AM +0530, Bhanuprakash Modem wrote:
> This patch includes below updates
> * For Flipline test: if refresh_rate <=3D Vrr_min then
> 	- Expected returned refresh rate would be vrr_max
> 	- At least 35% of the flips should be in threshold
> * Update "igt_display_commit_atomic" with "igt_display_commit2"
> * Calculate the target timestamp based on the delta between event
>   timestamps & whatever the time left to reach the expected rate.
> * Add few debug prints
> =

> V2:
> * Rebase
> V3:
> * Compute the target timestamp based on the delta (Ville)
> V4:
> * Add a comment to justify the result with refresh rate < 40Hz (Manasi)
> V5:
> * Align the starting point with flip completion event (Manasi)

This looks good to me,

Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>

Manasi

> =

> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_vrr.c | 93 +++++++++++++++++++++----------------------------
>  1 file changed, 39 insertions(+), 54 deletions(-)
> =

> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index beb06854f..e4ea74c17 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -170,7 +170,7 @@ static void set_vrr_on_pipe(data_t *data, enum pipe p=
ipe, bool enabled)
>  {
>  	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED,
>  				enabled);
> -	igt_display_commit_atomic(&data->display, 0, NULL);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  }
>  =

>  /* Prepare the display for testing on the given pipe. */
> @@ -208,22 +208,7 @@ static void prepare_test(data_t *data, igt_output_t =
*output, enum pipe pipe)
>  	 */
>  	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED, 0);
>  =

> -	igt_display_commit_atomic(&data->display,
> -				  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> -}
> -
> -/* Waits for the vblank interval. Returns the vblank timestamp in ns. */
> -static uint64_t
> -wait_for_vblank(data_t *data, enum pipe pipe)
> -{
> -	drmVBlank vbl =3D {};
> -
> -	vbl.request.type =3D kmstest_get_vbl_flag(pipe);
> -	vbl.request.type |=3D DRM_VBLANK_RELATIVE | DRM_VBLANK_EVENT;
> -	vbl.request.sequence =3D 1;
> -	drmWaitVBlank(data->drm_fd, &vbl);
> -
> -	return get_kernel_event_ns(data, DRM_EVENT_VBLANK);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  }
>  =

>  /* Performs an atomic non-blocking page-flip on a pipe. */
> @@ -260,17 +245,18 @@ static uint32_t
>  flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
>  		 uint64_t rate_ns, uint64_t duration_ns)
>  {
> -	uint64_t start_ns, last_event_ns;
> +	uint64_t start_ns, last_event_ns, target_ns;
>  	uint32_t total_flip =3D 0, total_pass =3D 0;
>  	bool front =3D false;
>  	vtest_ns_t vtest_ns =3D get_test_rate_ns(data, output);
>  =

> -	/* Align with the vblank region to speed up convergence. */
> -	last_event_ns =3D wait_for_vblank(data, pipe);
> -	start_ns =3D get_time_ns();
> +	/* Align with the flip completion event to speed up convergence. */
> +	do_flip(data, &data->fb0);
> +	start_ns =3D last_event_ns =3D target_ns =3D get_kernel_event_ns(data,
> +							DRM_EVENT_FLIP_COMPLETE);
>  =

>  	for (;;) {
> -		uint64_t now_ns, event_ns, wait_ns, target_ns;
> +		uint64_t event_ns, wait_ns;
>  		int64_t diff_ns;
>  =

>  		front =3D !front;
> @@ -291,14 +277,10 @@ flip_and_measure(data_t *data, igt_output_t *output=
, enum pipe pipe,
>  		 * difference between 144Hz and 143Hz which should give this
>  		 * enough accuracy for most use cases.
>  		 */
> -		if (rate_ns <=3D vtest_ns.min && rate_ns >=3D vtest_ns.max)
> +		if ((rate_ns < vtest_ns.min) && (rate_ns >=3D vtest_ns.max))
>  			diff_ns =3D rate_ns;
> -		else if (rate_ns > vtest_ns.min)
> -			diff_ns =3D vtest_ns.min;
> -		else if (rate_ns < vtest_ns.max)
> -			diff_ns =3D vtest_ns.max;
>  		else
> -			diff_ns =3D rate_ns;
> +			diff_ns =3D vtest_ns.max;
>  		diff_ns -=3D event_ns - last_event_ns;
>  =

>  		if (llabs(diff_ns) < 50000ll)
> @@ -307,24 +289,24 @@ flip_and_measure(data_t *data, igt_output_t *output=
, enum pipe pipe,
>  		last_event_ns =3D event_ns;
>  		total_flip +=3D 1;
>  =

> -		now_ns =3D get_time_ns();
> -		if (now_ns - start_ns > duration_ns)
> +		if (event_ns - start_ns > duration_ns)
>  			break;
>  =

>  		/*
>  		 * Burn CPU until next timestamp, sleeping isn't accurate enough.
> -		 * It's worth noting that the target timestamp is based on absolute
> -		 * timestamp rather than a delta to avoid accumulation errors.
> +		 * The target timestamp is based on the delta b/w event timestamps
> +		 * and whatever the time left to reach the expected refresh rate.
>  		 */
> -		diff_ns =3D now_ns - start_ns;
> +		diff_ns =3D event_ns - target_ns;
>  		wait_ns =3D ((diff_ns + rate_ns - 1) / rate_ns) * rate_ns;
> -		target_ns =3D start_ns + wait_ns - 10;
> +		wait_ns -=3D diff_ns;
> +		target_ns =3D event_ns + wait_ns;
>  =

> -		while (get_time_ns() < target_ns);
> +		while (get_time_ns() < target_ns - 10);
>  	}
>  =

> -	igt_info("Completed %u flips, %u were in threshold for %"PRIu64"ns.\n",
> -		 total_flip, total_pass, rate_ns);
> +	igt_info("Completed %u flips, %u were in threshold for (%llu Hz) %"PRIu=
64"ns.\n",
> +		 total_flip, total_pass, (NSECS_PER_SEC/rate_ns), rate_ns);
>  =

>  	return total_flip ? ((total_pass * 100) / total_flip) : 0;
>  }
> @@ -338,8 +320,8 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t=
 *output, uint32_t flags)
>  	range_t range =3D get_vrr_range(data, output);
>  	uint64_t rate =3D vtest_ns.mid;
>  =

> -	igt_info("VRR Test execution on %s, PIPE_%s\n",
> -		 output->name, kmstest_pipe_name(pipe));
> +	igt_info("VRR Test execution on %s, PIPE_%s with VRR range: (%u-%u) Hz\=
n",
> +		 output->name, kmstest_pipe_name(pipe), range.min, range.max);
>  =

>  	prepare_test(data, output, pipe);
>  =

> @@ -376,40 +358,43 @@ test_basic(data_t *data, enum pipe pipe, igt_output=
_t *output, uint32_t flags)
>  	 * if refresh_rate is 50Hz:
>  	 *      Flip will happen right away so returned refresh rate is 50Hz.
>  	 * if refresh_rate < 40Hz:
> -	 *      Flip should happen at the vmax so the returned refresh rate
> -	 *      would be 40Hz.
> +	 *      As the driver will terminate the vblank at Vmax, the expected
> +	 *      refresh rate could be:
> +	 *      	(Vmax + time left for the next flip + Vmin)
> +	 *
> +	 *      And it is very difficult to generalize, at least 1/3 rd of the
> +	 *      flips should be at Vmin (60 Hz) is expected.
>  	 */
>  	if (flags & TEST_FLIPLINE) {
> -		rate =3D rate_from_refresh(range.min - 5);
> +		rate =3D rate_from_refresh(range.max + 5);
>  		result =3D flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS=
);
>  		igt_assert_f(result > 75,
> -			     "Refresh rate %"PRIu64"ns: Target VRR on threshold not reached, =
result was %u%%\n",
> -			     rate, result);
> +			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not r=
eached, result was %u%%\n",
> +			     (range.max + 5), rate, result);
>  =

> -		rate =3D rate_from_refresh(range.max + 5);
> +		rate =3D rate_from_refresh(range.min - 5);
>  		result =3D flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS=
);
> -		igt_assert_f(result > 75,
> -			     "Refresh rate %"PRIu64"ns: Target VRR on threshold not reached, =
result was %u%%\n",
> -			     rate, result);
> +		igt_assert_f(result > 35,
> +			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not r=
eached, result was %u%%\n",
> +			     (range.min - 5), rate, result);
>  	}
>  =

>  	rate =3D vtest_ns.mid;
>  	result =3D flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
>  	igt_assert_f(result > 75,
> -		     "Refresh rate %"PRIu64"ns: Target VRR on threshold not reached, r=
esult was %u%%\n",
> -		     rate, result);
> +		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not re=
ached, result was %u%%\n",
> +		     ((range.max + range.min) / 2), rate, result);
>  =

>  	set_vrr_on_pipe(data, pipe, 0);
>  	result =3D flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
>  	igt_assert_f(result < 10,
> -		     "Refresh rate %"PRIu64"ns: Target VRR off threshold exceeded, res=
ult was %u%%\n",
> -		     rate, result);
> +		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR off threshold excee=
ded, result was %u%%\n",
> +		     ((range.max + range.min) / 2), rate, result);
>  =

>  	/* Clean-up */
>  	igt_plane_set_fb(data->primary, NULL);
>  	igt_output_set_pipe(output, PIPE_NONE);
> -	igt_display_commit_atomic(&data->display,
> -				  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  =

>  	igt_remove_fb(data->drm_fd, &data->fb1);
>  	igt_remove_fb(data->drm_fd, &data->fb0);
> -- =

> 2.20.1
> =

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
