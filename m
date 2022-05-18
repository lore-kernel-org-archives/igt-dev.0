Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8CE5113E37
 for <igt-dev@lists.freedesktop.org>; Wed, 18 May 2022 06:28:07 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Date: Wed, 18 May 2022 06:28:02 +0000
Message-ID: <508c7e9e8506471eb9cf047ac6ad9d81@intel.com>
References: <20220511113734.27776-1-anshuman.gupta@intel.com>
 <20220511113734.27776-5-anshuman.gupta@intel.com>
 <87o7zwf5to.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87o7zwf5to.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 4/4] i915_pm_rpm: rpm resume by user
 forcewake
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Latvala, Petri" <petri.latvala@intel.com>, "Wilson,
 Chris P" <chris.p.wilson@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Nilawar,
 Badal" <badal.nilawar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> Sent: Tuesday, May 17, 2022 10:35 PM
> To: Gupta, Anshuman <anshuman.gupta@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Nilawar, Badal <badal.nilawar@intel.co=
m>;
> Ewins, Jon <jon.ewins@intel.com>; Latvala, Petri <petri.latvala@intel.com=
>;
> Tangudu, Tilak <tilak.tangudu@intel.com>; Wilson, Chris P
> <chris.p.wilson@intel.com>
> Subject: Re: [PATCH i-g-t v2 4/4] i915_pm_rpm: rpm resume by user forcewa=
ke
>=20
> On Wed, 11 May 2022 04:37:34 -0700, Anshuman Gupta wrote:
> >
> > Few gem rpm tests relies on enabling kms crtc in order to trigger rpm
> > resume but on headless platforms these tests skip. Let it trigger the
> > rpm resume by taking user forcewake.
> >
> > v2:
> > - removed has_runtime_pm cond from
> >   enable_one_screen_or_forcewake_and_wait(). [Ashutosh]
> > - removed if (ms_data.res) cond from basic_subtest(). [Ashutosh]
> > - clear forcewake in both only for headless. [Ashutosh]
> >
> > Cc: Chris Wilson <chris.p.wilson@intel.com>
> > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > ---
> >  tests/i915/i915_pm_rpm.c | 80
> > ++++++++++++++++++++++++++++++----------
> >  1 file changed, 61 insertions(+), 19 deletions(-)
> >
> > diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c index
> > a6035e60b..de71dd41c 100644
> > --- a/tests/i915/i915_pm_rpm.c
> > +++ b/tests/i915/i915_pm_rpm.c
> > @@ -99,6 +99,7 @@ struct mode_set_data {
> >	igt_display_t display;
> >
> >	uint32_t devid;
> > +	int fw_fd;
> >  };
> >
> >  /* Stuff we query at different times so we can compare. */  @@ -369,6
> >+370,44 @@ static void enable_one_screen(struct mode_set_data *data)
> >	igt_assert(wait_for_active()); \
> >  } while (0)
> >
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
> > +	if (headless) {
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
> > +	if (!default_mode_params)
>=20
> Why introduce this new unrelated check here? Now someone needs to check i=
f
> this check is valid for headless. If we are introducing this here can we =
also
> introduce it in enable_one_screen_or_forcewake_and_wait()?
This check is already present in enable_one_screen_with_type() in switch ca=
se.
Just introduced this to make both enable_one_screen_or_forcewake_and_wait()=
 /disable_all_screens_or_clr_forcewake_and_wait()
symmetric to address the comment.
>=20
> Can we not just do:
>=20
> 	if (data->fw_fd)
>                 clear_forcewake(data);
>=20
> as I was suggesting, or even unconditional is ok since clear_forcewake() =
already
> has the check. Let's just drop the if () here then as you previously had?
Sure I will drop this check as it is not needed.
Thanks,
Anshuman Gupta.
>=20
> Also I have another comment. The kernel increments/decrements a reference
> count when "i915_forcewake_user" debugfs is open/closed. So closing the f=
ile
> doesn't necessary clear forcewake if a previous fd is open. How about cha=
nging
> function names with get/put to make this clear. E.g.
>=20
> * enable_one_screen_or_forcewake_get_and_wait
> * forcewake_put instead of clear_forcewake
> * disable_all_screens_or_forcewake_put_and_wait
>=20
> But not strictly needed, you decide, just a suggestion.
>=20
> Rest everything looks good.
>=20
> With the if () dropped this is:
>=20
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
