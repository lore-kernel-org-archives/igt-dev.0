Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF7726E97D
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Oct 2021 07:36:43 +0000 (UTC)
Date: Mon, 18 Oct 2021 10:36:40 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YW0kCPq1RDkmlUy7@intel.com>
References: <20211013221727.6392-1-ville.syrjala@linux.intel.com>
 <20211013221727.6392-6-ville.syrjala@linux.intel.com>
 <42613f61-159e-9deb-e738-21a0b8a66b60@intel.com>
 <YW0iHhJVK7aLsJXw@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YW0iHhJVK7aLsJXw@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 5/8] tests/i915/kms_flip_tiling:
 Generalize away copy-pasta
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Oct 18, 2021 at 10:28:30AM +0300, Ville Syrj=E4l=E4 wrote:
> On Mon, Oct 18, 2021 at 12:32:18PM +0530, Karthik B S wrote:
> > On 10/14/2021 3:47 AM, Ville Syrjala wrote:
> > > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > >
> > > Replace the huge swaths of copypasta by just looping over the
> > > set of modifiers reported by the plane, and testing each against
> > > the others (and itself).
> > >
> > > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > ---
> > >   tests/i915/kms_flip_tiling.c | 209 +++++---------------------------=
---
> > >   1 file changed, 30 insertions(+), 179 deletions(-)
> > >
> > > diff --git a/tests/i915/kms_flip_tiling.c b/tests/i915/kms_flip_tilin=
g.c
> > > index 63e0b8b9648f..e2e6619baeca 100644
> > > --- a/tests/i915/kms_flip_tiling.c
> > > +++ b/tests/i915/kms_flip_tiling.c
> > > @@ -161,195 +161,46 @@ igt_main
> > >   		igt_display_require(&data.display, data.drm_fd);
> > >   	}
> > >  =20
> > > -	/*
> > > -	 * Test that a page flip from a tiled buffer to a linear one works
> > > -	 * correctly. First, it sets the crtc with the linear buffer and
> > > -	 * generates a reference crc for the pipe. Then, the crtc is set wi=
th
> > > -	 * the tiled one and page flip to the linear one issued. A new crc =
is
> > > -	 * generated and compared to the reference one.
> > > -	 */
> > > -
> > > -	igt_describe("Check pageflip from tiled buffer to linear one works =
correctly with x tiling");
> > > -	igt_subtest_with_dynamic("flip-changes-tiling") {
> > > -		uint64_t modifier[2] =3D { I915_FORMAT_MOD_X_TILED,
> > > -					 DRM_FORMAT_MOD_LINEAR };
> > > +	igt_describe("Check pageflip between modifiers");
> > > +	igt_subtest_with_dynamic("flip-change-tiling") {
> > >   		enum pipe pipe;
> > >  =20
> > > -		for (int i =3D 0; i < ARRAY_SIZE(modifier); i++)
> > > -			igt_require(igt_display_has_format_mod(&data.display, data.testfo=
rmat, modifier[i]));
> > > -
> > >   		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> > > -			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe=
_name(pipe))
> > > -				test_flip_tiling(&data, pipe, output, modifier);
> > > -			test_cleanup(&data, pipe, output);
> > > -		}
> > > -	}
> > > -
> > > -	igt_describe("Check pageflip from tiled buffer to linear one works =
correctly with y tiling");
> > > -	igt_subtest_with_dynamic("flip-changes-tiling-Y") {
> > > -		uint64_t modifier[2] =3D { I915_FORMAT_MOD_Y_TILED,
> > > -					 DRM_FORMAT_MOD_LINEAR };
> > > -		enum pipe pipe;
> > > +			igt_plane_t *plane;
> > >  =20
> > > -		igt_require_fb_modifiers(data.drm_fd);
> > > +			igt_output_set_pipe(output, pipe);
> > >  =20
> > > -		for (int i =3D 0; i < ARRAY_SIZE(modifier); i++)
> > > -			igt_require(igt_display_has_format_mod(&data.display, data.testfo=
rmat, modifier[i]));
> > > +			plane =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMAR=
Y);
> > >  =20
> > > -		igt_require(data.gen >=3D 9);
> > > +			for (int i =3D 0; i < plane->format_mod_count; i++) {
> > > +				if (plane->formats[i] !=3D data.testformat)
> > > +					continue;
> > >  =20
> > > -		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> > > -			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe=
_name(pipe))
> > > -				test_flip_tiling(&data, pipe, output, modifier);
> > > -			test_cleanup(&data, pipe, output);
> > > -		}
> > > -	}
> > > -
> > > -	igt_describe("Check pageflip from tiled buffer to linear one works =
correctly with yf tiling");
> > > -	igt_subtest_with_dynamic("flip-changes-tiling-Yf") {
> > > -		uint64_t modifier[2] =3D { I915_FORMAT_MOD_Yf_TILED,
> > > -					 DRM_FORMAT_MOD_LINEAR };
> > > -		enum pipe pipe;
> > > +				for (int j =3D 0; j < plane->format_mod_count; j++) {
> > > +					uint64_t modifier[2] =3D {
> > > +						plane->modifiers[i],
> > > +						plane->modifiers[j],
> > > +					};
> > >  =20
> > > -		igt_require_fb_modifiers(data.drm_fd);
> > > +					if (plane->formats[j] !=3D data.testformat)
> > > +						continue;
> > Move this check before assigning modifier[]?
>=20
> Then I'd have to split the declaration and assignment.

Hmm. Or I guess I could fully embrace c99 and declare anywhere.
But I don't *think* we're doing that anywhere else in igt so far.

--=20
Ville Syrj=E4l=E4
Intel
