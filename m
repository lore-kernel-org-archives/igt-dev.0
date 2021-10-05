Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A7D6E3D0
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Oct 2021 10:30:30 +0000 (UTC)
Date: Tue, 5 Oct 2021 13:33:58 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YVwqFqjfzVW1RcOH@platvala-desk.ger.corp.intel.com>
References: <20210916153515.21369-1-ville.syrjala@linux.intel.com>
 <20210916153515.21369-2-ville.syrjala@linux.intel.com>
 <8474adec-16b9-6a0e-3bc2-73e6e9b03fae@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <8474adec-16b9-6a0e-3bc2-73e6e9b03fae@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/6] tests/kms_invalid_mode: Convert the
 max dotclock test into a subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Karthik B S <karthik.b.s@intel.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Oct 05, 2021 at 03:43:50PM +0530, Karthik B S wrote:
> On 9/16/2021 9:05 PM, Ville Syrjala wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> >=20
> > We want to add different subtests to kms_invalud_mode. Convert
>=20
> Hi,
>=20
> Typo: 'kms_invalud_mode'
>=20
> > the current max dotclock test into a subtest.
> >=20
> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > ---
> >   tests/i915/kms_invalid_mode.c | 80 +++++++++++++++++++++++++----------
> >   1 file changed, 57 insertions(+), 23 deletions(-)
> >=20
> > diff --git a/tests/i915/kms_invalid_mode.c b/tests/i915/kms_invalid_mod=
e.c
> > index dc30e6bb5444..8b24993e40a3 100644
> > --- a/tests/i915/kms_invalid_mode.c
> > +++ b/tests/i915/kms_invalid_mode.c
> > @@ -27,13 +27,16 @@
> >   IGT_TEST_DESCRIPTION("Make sure all modesets are rejected when the re=
quested mode is invalid");
> > -typedef struct {
> > +typedef struct _data data_t;
> > +
> > +struct _data {
> >   	int drm_fd;
> >   	igt_display_t display;
> >   	igt_output_t *output;
> >   	drmModeResPtr res;
> >   	int max_dotclock;
> > -} data_t;
> > +	bool (*adjust_mode)(data_t *data, drmModeModeInfoPtr mode);
> > +};
> >   static bool has_scaling_mode_prop(data_t *data)
> >   {
> > @@ -63,13 +66,10 @@ can_bigjoiner(data_t *data)
> >   	return false;
> >   }
> > -static int
> > -test_output(data_t *data)
> > +static bool
> > +adjust_mode_clock_too_high(data_t *data, drmModeModeInfoPtr mode)
> >   {
> > -	igt_output_t *output =3D data->output;
> > -	drmModeModeInfo mode;
> > -	struct igt_fb fb;
> > -	int i;
> > +	igt_require(data->max_dotclock !=3D 0);
> >   	/*
> >   	 * FIXME When we have a fixed mode, the kernel will ignore
> > @@ -80,14 +80,28 @@ test_output(data_t *data)
> >   	 * test on  any connector with a fixed mode.
> >   	 */
> >   	if (has_scaling_mode_prop(data))
> > -		return 0;
> > +		return false;
> > +
> > +	mode->clock =3D data->max_dotclock + 1;
> > +
> > +	return true;
> > +}
> > +
> > +static int
> > +test_output(data_t *data)
> > +{
> > +	igt_output_t *output =3D data->output;
> > +	drmModeModeInfo mode;
> > +	struct igt_fb fb;
> > +	int i;
> >   	/*
> >   	 * FIXME test every mode we have to be more
> >   	 * sure everything is really getting rejected?
> >   	 */
> >   	mode =3D *igt_output_get_mode(output);
> > -	mode.clock =3D data->max_dotclock + 1;
> > +	if (!data->adjust_mode(data, &mode))
> > +		return 0;
> >   	/*
> >   	 * Newer platforms can support modes higher than the maximum dot clo=
ck
> > @@ -154,25 +168,45 @@ static int i915_max_dotclock(data_t *data)
> >   	return max_dotclock;
> >   }
> > +static const struct {
> > +	const char *name;
> > +	bool (*adjust_mode)(data_t *data, drmModeModeInfoPtr mode);
> > +} subtests[] =3D {
> > +	{ .name =3D "clock-too-high",
> > +	  .adjust_mode =3D adjust_mode_clock_too_high,
> > +	},
> > +};
> > +
> >   static data_t data;
> > -igt_simple_main
> > +igt_main
> >   {
> > -	data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL);
> > -	igt_require_intel(data.drm_fd);
> > +	igt_fixture {
> > +		igt_skip_on_simulation();
>=20
> 'igt_skip_on_simulation()' is not used in any other kms tests now. Do we
> still need this?

Drive-by commenting: No, please remove the call.

--=20
Petri Latvala


>=20
> In any case, the changes look good to me.
>=20
> Reviewed-by: Karthik B S <karthik.b.s@intel.com>
>=20
> > -	kmstest_set_vt_graphics_mode();
> > +		data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL);
> > +		igt_require_intel(data.drm_fd);
> > -	igt_display_require(&data.display, data.drm_fd);
> > -	data.res =3D drmModeGetResources(data.drm_fd);
> > -	igt_assert(data.res);
> > +		kmstest_set_vt_graphics_mode();
> > -	data.max_dotclock =3D i915_max_dotclock(&data);
> > -	igt_info("Max dotclock: %d kHz\n", data.max_dotclock);
> > +		igt_display_require(&data.display, data.drm_fd);
> > +		data.res =3D drmModeGetResources(data.drm_fd);
> > +		igt_assert(data.res);
> > -	test(&data);
> > +		data.max_dotclock =3D i915_max_dotclock(&data);
> > +		igt_info("Max dotclock: %d kHz\n", data.max_dotclock);
> > +	}
> > -	igt_display_fini(&data.display);
> > -	igt_reset_connectors();
> > -	drmModeFreeResources(data.res);
> > +	for (int i =3D 0; i < ARRAY_SIZE(subtests); i++) {
> > +		igt_subtest(subtests[i].name) {
> > +			data.adjust_mode =3D subtests[i].adjust_mode;
> > +			test(&data);
> > +		}
> > +	}
> > +
> > +	igt_fixture {
> > +		igt_display_fini(&data.display);
> > +		igt_reset_connectors();
> > +		drmModeFreeResources(data.res);
> > +	}
> >   }
>=20
>=20
