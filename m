Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD16882B5
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Aug 2021 05:51:17 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Date: Wed, 4 Aug 2021 05:51:13 +0000
Message-ID: <ac9b2064c690417c8c0ef6cab1ff55e6@intel.com>
References: <20210729132008.3258299-1-jigar.bhatt@intel.com>
In-Reply-To: <20210729132008.3258299-1-jigar.bhatt@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t RFC] tests/i915/i915_pm_dc: Fix DC9 test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Bhatt, Jigar" <jigar.bhatt@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Varide, Nischal" <nischal.varide@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Bhatt, Jigar <jigar.bhatt@intel.com>
> Sent: Thursday, July 29, 2021 6:50 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Bhatt, Jigar <jigar.bhatt@intel.com>; Varide, Nischal
> <nischal.varide@intel.com>; Gupta, Anshuman <anshuman.gupta@intel.com>;
> Shankar, Uma <uma.shankar@intel.com>
> Subject: [PATCH i-g-t RFC] tests/i915/i915_pm_dc: Fix DC9 test
>=20
Please use the standard patch header format.
> 1. Currently, check_dc9 is being called with reference
> (previous) counter being read after dpms_off call.
> At this time, already the counter is 0.
> We need to read the counter before dpms_off is called so that it holds th=
e
> previous value which had incremented while testing shallow states (DC5 or=
 DC6).
>=20
> 2. Check for a condition dc counter to be reset along with system should =
in
> runtime suspend state :
> currect_dc < prev_dc && i915 runtime status =3D=3D SUSPENDED.
> If above condition pass, test is passed otherwise test is failed.
>=20
> 3. adding dc9_dpms_off()
>=20
> Signed-off-by: Jigar Bhatt <jigar.bhatt@intel.com>
> ---
>  tests/i915/i915_pm_dc.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
>=20
> diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c index
> 9d0a15d81..a6fddb617 100644
> --- a/tests/i915/i915_pm_dc.c
> +++ b/tests/i915/i915_pm_dc.c
> @@ -358,6 +358,15 @@ static void dpms_off(data_t *data)
>  			   (IGT_RUNTIME_PM_STATUS_SUSPENDED));
>  }
>=20
> +static void dc9_dpms_off(data_t *data)
> +{
> +	for (int i =3D 0; i < data->display.n_outputs; i++) {
> +		kmstest_set_connector_dpms(data->drm_fd,
> +					   data-
> >display.outputs[i].config.connector,
> +					   DRM_MODE_DPMS_OFF);
> +	}
> +}
> +
>  static void dpms_on(data_t *data)
>  {
>  	for (int i =3D 0; i < data->display.n_outputs; i++) { @@ -400,8 +409,11=
 @@
> static bool check_dc9(uint32_t debugfs_fd, int prev_dc, bool dc6_supporte=
d, int
>  	 * so we rely on dc5/dc6 counter reset to check if display engine was i=
n
> DC9.
>  	 */
>  	return igt_wait(dc6_supported ? read_dc_counter(debugfs_fd,
> CHECK_DC6) <
> -			prev_dc : read_dc_counter(debugfs_fd, CHECK_DC5) <
> -			prev_dc, seconds, 100);
> +			prev_dc &&
> +
> 	igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED)
Don't use igt_wait_for_pm_status here , it waits for 10 seconds internally.
We just need i915 runtime pm status and that should check against suspended=
.
This will waste may CI cycles.
Br,
Anshuman
> +			: read_dc_counter(debugfs_fd, CHECK_DC5) < prev_dc
> &&
> +
> 	igt_wait_for_pm_status(IGT_RUNTIME_STATUS_PM_SUSPENDED)
> +			, seconds, 100);
>  }
>=20
>  static void setup_dc9_dpms(data_t *data, int prev_dc, bool dc6_supported=
)
> @@ -418,15 +430,16 @@ static void setup_dc9_dpms(data_t *data, int
> prev_dc, bool dc6_supported)  static void test_dc9_dpms(data_t *data)  {
>  	bool dc6_supported;
> +	int prev_dc;
>=20
>  	require_dc_counter(data->debugfs_fd, CHECK_DC5);
>  	dc6_supported =3D support_dc6(data->debugfs_fd);
>  	setup_dc9_dpms(data, dc6_supported ? read_dc_counter(data-
> >debugfs_fd, CHECK_DC6) :
>  			read_dc_counter(data->debugfs_fd, CHECK_DC5),
> dc6_supported);
> -	dpms_off(data);
> -	igt_assert_f(check_dc9(data->debugfs_fd, dc6_supported ?
> -				read_dc_counter(data->debugfs_fd,
> CHECK_DC6) :
> -				read_dc_counter(data->debugfs_fd,
> CHECK_DC5),
> +	prev_dc =3D dc6_supported ? read_dc_counter(data->debugfs_fd,
> CHECK_DC6) :
> +		read_dc_counter(data->debugfs_fd, CHECK_DC5);
> +	dc9_dpms_off(data);
> +	igt_assert_f(check_dc9(data->debugfs_fd, prev_dc,
>  				dc6_supported, 3000), "Not in DC9\n");
>  	dpms_on(data);
>  }
> --
> 2.25.1
