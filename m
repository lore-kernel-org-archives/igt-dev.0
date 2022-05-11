Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A2A10E167
 for <igt-dev@lists.freedesktop.org>; Wed, 11 May 2022 08:03:29 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Date: Wed, 11 May 2022 08:03:11 +0000
Message-ID: <54f86f76208046e2bbb317aabaeba675@intel.com>
References: <20220421170245.11898-1-anshuman.gupta@intel.com>
 <20220421170245.11898-4-anshuman.gupta@intel.com>
 <875ymmqer3.wl-ashutosh.dixit@intel.com>
In-Reply-To: <875ymmqer3.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] i915_pm_rpm: rpm resume by user
 forcewake
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Wilson,
 Chris P" <chris.p.wilson@intel.com>, "Nilawar,
 Badal" <badal.nilawar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> Sent: Wednesday, May 4, 2022 6:46 AM
> To: Gupta, Anshuman <anshuman.gupta@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Nilawar, Badal <badal.nilawar@intel.co=
m>;
> Ewins, Jon <jon.ewins@intel.com>; Wilson, Chris P <chris.p.wilson@intel.c=
om>
> Subject: Re: [PATCH i-g-t 3/3] i915_pm_rpm: rpm resume by user forcewake
>=20
> On Thu, 21 Apr 2022 10:02:45 -0700, Anshuman Gupta wrote:
> >
> > Few gem rpm tests relies on enabling kms crtc in order to trigger rpm
> > resume but on headless platforms these tests skips.
>=20
> skip
>=20
> > Let it triggered the rpm resume by taking user forcewake.
>=20
> Let it trigger rpm resume by taking user forcewake.
Thanks for review comments.
>=20
> > +static void
> > +enable_one_screen_or_forcewake_and_wait(struct mode_set_data *data) {
> > +	bool headless;
> > +
> > +	/* Try to resume by enabling any type of display */
> > +	headless =3D !enable_one_screen_with_type(data, SCREEN_TYPE_ANY);
> > +
> > +	/*
> > +	 * Get User Forcewake to trigger rpm resume in case of headless
> > +	 * as well as no display being connected.
> > +	 */
> > +	if (headless && has_runtime_pm) {
>=20
> I think we should remove 'has_runtime_pm' from here, it's confusing. E.g.=
 what
> should we do in the '(headless && !has_runtime_pm)'
> case? There is already a 'igt_require(has_runtime_pm)' in
> setup_environment() triggered from igt_fixture.
Make sense I will do that change.
>=20
> Different question: do we need to do this only in headless or can we do t=
his
> unconditionally (i.e. get forcewake both with and without display)? If we=
 can do
> this unconditionally the function becomes
> enable_one_screen_and_forcewake_and_wait() (s/or/and/).
I was conservative to add forcewake overhead to display test.
IMO let's only add this for non-display test.
enable_one_screen() does a modeset and that forces a resume, we need forcew=
ake=20
only when system is headless as it can't resume.
>=20
> (Note to myself: with this change display tests will use
> enable_one_screen_and_wait() and skip when no display and tests which can
> run with or without display will use
> enable_one_screen_or_forcewake_and_wait(). For display tests we do need t=
o
> call enable_one_screen_with_type() to initialize display).
Correct enable_one_screen_with_type() will do a modeset , display init will=
 be there=20
in setup_envirnment().

>=20
> > +		data->fw_fd =3D igt_open_forcewake_handle(drm_fd);
> > +		igt_require(data->fw_fd > 0);
> > +	}
> > +	igt_assert(wait_for_active());
> > +}
> > +
> > +static void clear_forcewake(struct mode_set_data *data) {
> > +	if (data->fw_fd <=3D 0)
> > +		return;
> > +
> > +	data->fw_fd =3D close(data->fw_fd);
> > +	igt_assert_eq(data->fw_fd, 0);
> > +}
> > +
> > +static void
> > +disable_all_screens_or_clr_forcewake_and_wait(struct mode_set_data
> > +*data) {
> > +	clear_forcewake(data);
> > +	disable_all_screens(data);
> > +	igt_assert(wait_for_suspended());
> > +}
> > +
>=20
> Change function name to disable_all_screens_and_clr_forcewake_and_wait()
> (s/or/and/) since we are doing both?
>=20
> >  static drmModePropertyBlobPtr get_connector_edid(drmModeConnectorPtr
> connector,
> >						 int index)
> >  {
> > @@ -842,8 +879,10 @@ static void basic_subtest(void)
> >  {
> >	disable_all_screens_and_wait(&ms_data);
> >
> > -	if (ms_data.res)
> > -		enable_one_screen_and_wait(&ms_data);
> > +	if (ms_data.res) {
>=20
> We shouldn't have this check now since we are now supporting headless?
Thanks for pointing this out,  I will remove this cond.
>=20
> > +		enable_one_screen_or_forcewake_and_wait(&ms_data);
> > +		clear_forcewake(&ms_data);
> > +	}
>=20
> /snip/
>=20
> > @@ -2195,8 +2237,10 @@ igt_main_args("", long_options, help_str,
> opt_handler, NULL)
> >		pm_test_caching();
> >	}
> >
> > -	igt_fixture
> > +	igt_fixture {
> >		teardown_environment(false);
> > +		clear_forcewake(&ms_data);
>=20
> Also looks like we do not need to install an exit_handler (which calls
> clear_forcewake()) since just closing the fd disables forcewake (and fd w=
ill be
> closed on process exit whether in error or not). So that part is ok.
>=20
> Other tests seem display related but do we also need to change
> pm_test_tiling()?
This is display specific tilling , TileX, TileY. AFAIU tilling can not be t=
ested without
connected display.
Only missing test I could think of module-reload test, there wcan have a te=
st for headless .

Thanks,
Anshuman Gupta. =20
