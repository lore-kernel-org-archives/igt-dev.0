Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B34D66E14F
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Sep 2021 05:43:20 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Date: Thu, 9 Sep 2021 05:43:14 +0000
Message-ID: <ac3ea882889f438298c457e2baaff4ee@intel.com>
References: <20210908111543.1552728-1-jigar.bhatt@intel.com>
 <20210908185457.GA4059482@ideak-desk.fi.intel.com>
In-Reply-To: <20210908185457.GA4059482@ideak-desk.fi.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [ PATCH i-g-t v1 ] tests/i915/i915_pm_dc: Fix DC9 test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Deak, Imre" <imre.deak@intel.com>, "Bhatt, Jigar" <jigar.bhatt@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Shankar,
 Uma" <uma.shankar@intel.com>, "Varide, Nischal" <nischal.varide@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Deak, Imre <imre.deak@intel.com>
> Sent: Thursday, September 9, 2021 12:25 AM
> To: Bhatt, Jigar <jigar.bhatt@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Shankar, Uma <uma.shankar@intel.com>;
> Varide, Nischal <nischal.varide@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>
> Subject: Re: [ PATCH i-g-t v1 ] tests/i915/i915_pm_dc: Fix DC9 test
>=20
> On Wed, Sep 08, 2021 at 04:45:43PM +0530, Jigar Bhatt wrote:
> > Currently, check_dc9 is being called with reference
> > (previous) counter being read after dpms_off call.
> > At this time, already the counter is 0.
> > We need to read the counter before dpms_off is called so that it holds
> > the previous value which had incremented while testing shallow states
> > (DC5 or DC6).
> >
> > Signed-off-by: Jigar Bhatt <jigar.bhatt@intel.com>
> > ---
> >  tests/i915/i915_pm_dc.c | 11 ++++++-----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
> >
> > diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c index
> > 9d0a15d8..d1925e5a 100644
> > --- a/tests/i915/i915_pm_dc.c
> > +++ b/tests/i915/i915_pm_dc.c
> > @@ -400,8 +400,8 @@ static bool check_dc9(uint32_t debugfs_fd, int
> prev_dc, bool dc6_supported, int
> >  	 * so we rely on dc5/dc6 counter reset to check if display engine was=
 in
> DC9.
> >  	 */
> >  	return igt_wait(dc6_supported ? read_dc_counter(debugfs_fd,
> CHECK_DC6) <
> > -			prev_dc : read_dc_counter(debugfs_fd, CHECK_DC5) <
> > -			prev_dc, seconds, 100);
> > +			prev_dc : read_dc_counter(debugfs_fd, CHECK_DC5) <
> prev_dc
> > +			, seconds, 100);
> >  }
> >
> >  static void setup_dc9_dpms(data_t *data, int prev_dc, bool
> > dc6_supported) @@ -418,15 +418,16 @@ static void setup_dc9_dpms(data_t
> > *data, int prev_dc, bool dc6_supported)  static void
> > test_dc9_dpms(data_t *data)
> >
> >  	bool dc6_supported;
>=20
> The fix looks good, but while at it could you also make things a bit clea=
ner by
>=20
> 	int dc_target =3D support_dc6() ? CHECK_DC6 : CHECK_DC5;
>=20
> > +	int prev_dc;
> >
> >  	require_dc_counter(data->debugfs_fd, CHECK_DC5);
> >  	dc6_supported =3D support_dc6(data->debugfs_fd);
> >  	setup_dc9_dpms(data, dc6_supported ? read_dc_counter(data-
> >debugfs_fd, CHECK_DC6) :
> >  			read_dc_counter(data->debugfs_fd, CHECK_DC5),
> dc6_supported);
>=20
> 	setup_dc9_dpms(data, dc_target);
>=20
> and read out the counter within setup_dc9_dpms().
>=20
> > +	prev_dc =3D dc6_supported ? read_dc_counter(data->debugfs_fd,
> CHECK_DC6) :
> > +		read_dc_counter(data->debugfs_fd, CHECK_DC5);
>=20
> 	prev_dc =3D read_dc_counter(dc_target);
>=20
> >  	dpms_off(data);
> > -	igt_assert_f(check_dc9(data->debugfs_fd, dc6_supported ?
> > -				read_dc_counter(data->debugfs_fd,
> CHECK_DC6) :
> > -				read_dc_counter(data->debugfs_fd,
> CHECK_DC5),
> > +	igt_assert_f(check_dc9(data->debugfs_fd, prev_dc,
> >  				dc6_supported, 3000), "Not in DC9\n");
This test can also fail due to any wakeup which lead to runtime resume (kms=
 connector polling is one of example), which will disable
DC9 in DC_STATE_EN register. To debug such failure it would be better to du=
mp the i915_pm_runtime_status debugfs  file in case of test failure.
Like below example:
igt_assert_f(dc_state_wait_entry(data->debugfs_fd, dc_flag, prev_dc_count),
                     "%s st\n%s:\n%s\n", tmp, PWR_DOMAIN_INFO,
                     data->pwr_dmn_info =3D igt_sysfs_get(data->debugfs_fd,=
 PWR_DOMAIN_INFO));

Br,
Anshuman Gupta.
>=20
> 		     check_dc9(data->debugfs_fd, target_dc, 3000, ...
>=20
> and simplify check_dc9() accordingly?
>=20
> >  	dpms_on(data);
> >  }
> > --
> > 2.25.1
> >
