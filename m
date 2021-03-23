Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B2596E086
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Mar 2021 06:05:41 +0000 (UTC)
Date: Tue, 23 Mar 2021 08:06:20 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YFmFXK6OE2X1lOM6@platvala-desk.ger.corp.intel.com>
References: <20210322082535.1137703-1-martin.peres@mupuf.org>
 <7f2b6add0365462747512d6d0142cfc67e69ae28.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7f2b6add0365462747512d6d0142cfc67e69ae28.camel@redhat.com>
Subject: Re: [igt-dev] [PATCH i-g-t] Revert "tests/kms_plane: Don't unset
 primary_fb when testing other planes"
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
To: Lyude Paul <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Mar 22, 2021 at 08:24:26PM -0400, Lyude Paul wrote:
> hm - I gave my reviewed-by: here before but taking a closer look at this,=
 I am
> seeing underruns being noted in the pixel format tests:
> =

> https://intel-gfx-ci.01.org/tree/drm-tip/index.html?testfilter=3Dkms_plan=
e@pixel-format&hosts=3Dtgl%7Cicl
> =

> I haven't gotten a closer look yet, but I'm extremely doubtful this is an=
 error
> on the test's part unless those underruns were there before.

The underruns are the regression. The commit might be doing the right
thing as far as the documented interface is concerned but Intel folks
need to figure out the actual cause of the underruns and help get this
in without regressions.


-- =

Petri Latvala



> =

> On Mon, 2021-03-22 at 10:25 +0200, Martin Peres wrote:
> > The patch led to a regression in i915 results. The regression wasn't
> > caught pre-merge because the test was blacklisted for pre-merge by
> > yours truly due to its prohibitive execution time, but my creation
> > came back to bite me in the ass, Frakenstein-style.
> > =

> > It is currently unclear if the regression introduced by this change is
> > an i915 bug, a KMS spec violation introduced by the change, or
> > generally a loose-spec and just incompatible HW between NVIDIA and
> > Intel. While we figure this thing out, let's just revert the change
> > and put the cost of integration on the people proposing the
> > change (Lyude and I).
> > =

> > Sorry for the noise!
> > =

> > Signed-off-by: Martin Peres <martin.peres@mupuf.org>
> > Cc: Jani Saarinen <jani.saarinen@intel.com>
> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: juhapekka.heikkila@gmail.com
> > ---
> > =A0tests/kms_plane.c | 9 ++++-----
> > =A01 file changed, 4 insertions(+), 5 deletions(-)
> > =

> > diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> > index c87983a4..298a9375 100644
> > --- a/tests/kms_plane.c
> > +++ b/tests/kms_plane.c
> > @@ -817,10 +817,9 @@ enum crc_set { PACKED_CRC_SET,
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 MAX_CRC_SET };
> > =A0
> > =A0static bool test_format_plane(data_t *data, enum pipe pipe,
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 igt_output_t *output, igt_plane_t *plane, igt_fb_t
> > *primary_fb)
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 igt_output_t *output, igt_plane_t *plane)
> > =A0{
> > =A0=A0=A0=A0=A0=A0=A0=A0struct igt_fb fb =3D {};
> > -=A0=A0=A0=A0=A0=A0=A0struct igt_fb *clear_fb =3D plane->type =3D=3D DR=
M_PLANE_TYPE_PRIMARY ?
> > primary_fb : NULL;
> > =A0=A0=A0=A0=A0=A0=A0=A0drmModeModeInfo *mode;
> > =A0=A0=A0=A0=A0=A0=A0=A0uint32_t format, ref_format;
> > =A0=A0=A0=A0=A0=A0=A0=A0uint64_t modifier, ref_modifier;
> > @@ -880,7 +879,7 @@ static bool test_format_plane(data_t *data, enum pi=
pe pipe,
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0height =3D test_fb.height;
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> > =A0
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0igt_plane_set_fb(plane, c=
lear_fb);
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0igt_plane_set_fb(plane, N=
ULL);
> > =A0
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0igt_remove_fb(data->drm=
_fd, &test_fb);
> > =A0=A0=A0=A0=A0=A0=A0=A0}
> > @@ -938,7 +937,7 @@ static bool test_format_plane(data_t *data, enum pi=
pe pipe,
> > =A0
> > =A0=A0=A0=A0=A0=A0=A0=A0igt_pipe_crc_stop(data->pipe_crc);
> > =A0
> > -=A0=A0=A0=A0=A0=A0=A0igt_plane_set_fb(plane, clear_fb);
> > +=A0=A0=A0=A0=A0=A0=A0igt_plane_set_fb(plane, NULL);
> > =A0=A0=A0=A0=A0=A0=A0=A0igt_remove_fb(data->drm_fd, &fb);
> > =A0
> > =A0=A0=A0=A0=A0=A0=A0=A0return result;
> > @@ -1011,7 +1010,7 @@ test_pixel_formats(data_t *data, enum pipe pipe)
> > =A0=A0=A0=A0=A0=A0=A0=A0for_each_plane_on_pipe(&data->display, pipe, pl=
ane) {
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (skip_plane(data, pl=
ane))
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0continue;
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0result &=3D test_format_p=
lane(data, pipe, output, plane,
> > &primary_fb);
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0result &=3D test_format_p=
lane(data, pipe, output, plane);
> > =A0=A0=A0=A0=A0=A0=A0=A0}
> > =A0
> > =A0=A0=A0=A0=A0=A0=A0=A0test_fini(data);
> =

> -- =

> Sincerely,
>    Lyude Paul (she/her)
>    Software Engineer at Red Hat
>    =

> Note: I deal with a lot of emails and have a lot of bugs on my plate. If =
you've
> asked me a question, are waiting for a review/merge on a patch, etc. and I
> haven't responded in a while, please feel free to send me another email t=
o check
> on my status. I don't bite!
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
