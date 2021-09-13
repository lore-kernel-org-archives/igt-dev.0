Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB9F6E110
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Sep 2021 11:02:13 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Date: Mon, 13 Sep 2021 11:02:09 +0000
Message-ID: <273841ed2a4f453297cba0051461c11a@intel.com>
References: <20210913101346.1599740-1-jigar.bhatt@intel.com>
In-Reply-To: <20210913101346.1599740-1-jigar.bhatt@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/i915/i915_pm_dc: Fix DC9 test
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
Cc: "Shankar, Uma" <uma.shankar@intel.com>, "Varide, Nischal" <nischal.varide@intel.com>, "Deak, Imre" <imre.deak@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Bhatt, Jigar <jigar.bhatt@intel.com>
> Sent: Monday, September 13, 2021 3:44 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Bhatt, Jigar <jigar.bhatt@intel.com>; Shankar, Uma
> <uma.shankar@intel.com>; Varide, Nischal <nischal.varide@intel.com>; Deak=
,
> Imre <imre.deak@intel.com>; Gupta, Anshuman <anshuman.gupta@intel.com>
> Subject: [PATCH i-g-t v2] tests/i915/i915_pm_dc: Fix DC9 test
>=20
> V1:
> Currently, check_dc9 is being called with reference
> (previous) counter being read after dpms_off call.
> At this time, already the counter is 0.
> We need to read the counter before dpms_off is called so that it holds th=
e
> previous value which had incremented while testing shallow states (DC5 or=
 DC6).
>=20
> V2:
> Bit cleaner code.[Imre]
> dump the i915_pm_runtime_status debugfs file in case of test
> failure.[Anshuman]
>=20
> Signed-off-by: Jigar Bhatt <jigar.bhatt@intel.com>
> ---
>  tests/i915/i915_pm_dc.c | 35 +++++++++++++++++++++--------------
>  1 file changed, 21 insertions(+), 14 deletions(-)
>=20
> diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c index
> 9d0a15d8..37c4e7a6 100644
> --- a/tests/i915/i915_pm_dc.c
> +++ b/tests/i915/i915_pm_dc.c
> @@ -40,6 +40,7 @@
>  #define CHECK_DC3CO	(1 << 2)
>=20
>  #define PWR_DOMAIN_INFO "i915_power_domain_info"
> +#define RPM_STATUS "i915_runtime_pm_status"
>=20
>  typedef struct {
>  	double r, g, b;
> @@ -51,6 +52,7 @@ typedef struct {
>  	int debugfs_fd;
>  	uint32_t devid;
>  	char *pwr_dmn_info;
> +	char *rpm_status;
	We don't need a separate variable for debugfs data, we can use only one va=
riable with name debugfs_dump.
	Br,
	Anshuman Gupta.
>  	igt_display_t display;
>  	struct igt_fb fb_white, fb_rgb, fb_rgr;
>  	enum psr_mode op_psr_mode;
> @@ -393,23 +395,31 @@ static bool support_dc6(int debugfs_fd)
>  	return strstr(buf, "DC5 -> DC6 count");  }
>=20
> -static bool check_dc9(uint32_t debugfs_fd, int prev_dc, bool dc6_support=
ed,
> int seconds)
> +static bool dc9_wait_entry(uint32_t debugfs_fd, int prev_dc, int
> +dc_target, int seconds)
>  {
>  	/*
>  	 * since we do not have DC9 counter,
>  	 * so we rely on dc5/dc6 counter reset to check if display engine was i=
n
> DC9.
>  	 */
> -	return igt_wait(dc6_supported ? read_dc_counter(debugfs_fd,
> CHECK_DC6) <
> -			prev_dc : read_dc_counter(debugfs_fd, CHECK_DC5) <
> +	return igt_wait(read_dc_counter(debugfs_fd, dc_target) <
>  			prev_dc, seconds, 100);
>  }
>=20
> -static void setup_dc9_dpms(data_t *data, int prev_dc, bool dc6_supported=
)
> +static void check_dc9(data_t *data, int dc_target, uint32_t prev_dc)
>  {
> +	igt_assert_f(dc9_wait_entry(data->debugfs_fd, dc_target, prev_dc,
> 3000),
> +		     "DC9 state is not achieved\n%s:\n%s\n", RPM_STATUS,
> +		     data->rpm_status =3D igt_sysfs_get(data->debugfs_fd,
> RPM_STATUS));
> +}
> +
> +static void setup_dc9_dpms(data_t *data, int dc_target) {
> +	int prev_dc;
> +
> +	prev_dc =3D read_dc_counter(data->debugfs_fd, dc_target);
>  	setup_dc_dpms(data);
>  	dpms_off(data);
> -	igt_skip_on_f(!(igt_wait(dc6_supported ? read_dc_counter(data-
> >debugfs_fd, CHECK_DC6) >
> -				prev_dc : read_dc_counter(data->debugfs_fd,
> CHECK_DC5) >
> +	igt_skip_on_f(!(igt_wait(read_dc_counter(data->debugfs_fd, dc_target)
> +>
>  				prev_dc, 3000, 100)), "Unable to enters shallow
> DC states\n");
>  	dpms_on(data);
>  	cleanup_dc_dpms(data);
> @@ -417,17 +427,14 @@ static void setup_dc9_dpms(data_t *data, int
> prev_dc, bool dc6_supported)
>=20
>  static void test_dc9_dpms(data_t *data)  {
> -	bool dc6_supported;
> +	int prev_dc, dc_target;
>=20
>  	require_dc_counter(data->debugfs_fd, CHECK_DC5);
> -	dc6_supported =3D support_dc6(data->debugfs_fd);
> -	setup_dc9_dpms(data, dc6_supported ? read_dc_counter(data-
> >debugfs_fd, CHECK_DC6) :
> -			read_dc_counter(data->debugfs_fd, CHECK_DC5),
> dc6_supported);
> +	dc_target =3D support_dc6(data->debugfs_fd) ? CHECK_DC6 :
> CHECK_DC5;
> +	setup_dc9_dpms(data, dc_target);
> +	prev_dc =3D read_dc_counter(data->debugfs_fd, dc_target);
>  	dpms_off(data);
> -	igt_assert_f(check_dc9(data->debugfs_fd, dc6_supported ?
> -				read_dc_counter(data->debugfs_fd,
> CHECK_DC6) :
> -				read_dc_counter(data->debugfs_fd,
> CHECK_DC5),
> -				dc6_supported, 3000), "Not in DC9\n");
> +	check_dc9(data, dc_target, prev_dc);
>  	dpms_on(data);
>  }
>=20
> --
> 2.25.1
