Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4285D89B5F
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2020 11:14:26 +0000 (UTC)
Date: Mon, 16 Nov 2020 13:14:21 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201116111421.GR7444@platvala-desk.ger.corp.intel.com>
References: <20201113164940.48427-1-jcline@redhat.com>
 <20201113164940.48427-3-jcline@redhat.com>
 <0a3ff43f827bf1bda286ca5b6fc6fe627f25ecbf.camel@redhat.com>
 <20201113214116.GA29161@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201113214116.GA29161@xps13>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/kms_addfb_basic: Relax errno
 assertions
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
To: Jeremy Cline <jcline@redhat.com>
Cc: IGT GPU Tools <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Nov 13, 2020 at 04:41:16PM -0500, Jeremy Cline wrote:
> On Fri, Nov 13, 2020 at 01:59:55PM -0500, Lyude Paul wrote:
> > On Fri, 2020-11-13 at 11:49 -0500, Jeremy Cline wrote:
> > > This adjusts the check on failed calls to DRM_IOCTL_MODE_ADDFB2 in
> > > various scenarios. According to the kernel's
> > > drm_mode_config_funcs.fb_create documentation, a negative return code=
 is
> > > all that is required to signal failure, and different drivers return
> > > different errors in these scenarios.
> > > =

> > > Particularly, Nouveau returns -ERANGE rather than -EINVAL in scenarios
> > > where the buffer is too small for the proposed configuration.
> > > =

> > > Signed-off-by: Jeremy Cline <jcline@redhat.com>
> > > ---
> > > =A0tests/kms_addfb_basic.c | 16 ++++++++--------
> > > =A01 file changed, 8 insertions(+), 8 deletions(-)
> > > =

> > > diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
> > > index 0ec583fe..b284bfc1 100644
> > > --- a/tests/kms_addfb_basic.c
> > > +++ b/tests/kms_addfb_basic.c
> > > @@ -282,7 +282,7 @@ static void pitch_tests(int fd)
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0igt_subtest_f("bad-pi=
tch-%i", bad_pitches[i]) {
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0f.pitches[0] =3D bad_pitches[i];
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) =3D=3D
> > > -1 &&
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 errno =3D=3D EINVAL);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 errno !=3D 0);
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> > > =A0=A0=A0=A0=A0=A0=A0=A0}
> > > =A0
> > > @@ -413,11 +413,11 @@ static void size_tests(int fd)
> > > =A0=A0=A0=A0=A0=A0=A0=A0f_8.width++;
> > > =A0=A0=A0=A0=A0=A0=A0=A0igt_subtest("too-wide") {
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0igt_assert(drmIoctl(f=
d, DRM_IOCTL_MODE_ADDFB2, &f) =3D=3D -1 &&
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 errno =3D=3D EINVAL);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 errno !=3D 0);
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0igt_assert(drmIoctl(f=
d, DRM_IOCTL_MODE_ADDFB2, &f_16) =3D=3D -1 &&
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 errno =3D=3D EINVAL);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 errno !=3D 0);
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0igt_assert(drmIoctl(f=
d, DRM_IOCTL_MODE_ADDFB2, &f_8) =3D=3D -1 &&
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 errno =3D=3D EINVAL);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 errno !=3D 0);
> > > =A0=A0=A0=A0=A0=A0=A0=A0}
> > > =A0=A0=A0=A0=A0=A0=A0=A0f.width--;
> > > =A0=A0=A0=A0=A0=A0=A0=A0f_16.width--;
> > > @@ -427,17 +427,17 @@ static void size_tests(int fd)
> > > =A0=A0=A0=A0=A0=A0=A0=A0f_8.height++;
> > > =A0=A0=A0=A0=A0=A0=A0=A0igt_subtest("too-high") {
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0igt_assert(drmIoctl(f=
d, DRM_IOCTL_MODE_ADDFB2, &f) =3D=3D -1 &&
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 errno =3D=3D EINVAL);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 errno !=3D 0);
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0igt_assert(drmIoctl(f=
d, DRM_IOCTL_MODE_ADDFB2, &f_16) =3D=3D -1 &&
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 errno =3D=3D EINVAL);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 errno !=3D 0);
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0igt_assert(drmIoctl(f=
d, DRM_IOCTL_MODE_ADDFB2, &f_8) =3D=3D -1 &&
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 errno =3D=3D EINVAL);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 errno !=3D 0);
> > > =A0=A0=A0=A0=A0=A0=A0=A0}
> > > =A0
> > > =A0=A0=A0=A0=A0=A0=A0=A0f.handles[0] =3D gem_bo_small;
> > > =A0=A0=A0=A0=A0=A0=A0=A0igt_subtest("bo-too-small") {
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0igt_assert(drmIoctl(f=
d, DRM_IOCTL_MODE_ADDFB2, &f) =3D=3D -1 &&
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 errno =3D=3D EINVAL);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 errno !=3D 0);
> > =

> > Probably should be do_ioctl_err() instead. JFYI too, there's an old out=
dated
> > cocci file for converting things like this automatically that I meant t=
o update.
> > I made some progress, but had to put it on the backburner because of ti=
me
> > constraints.
> =

> Ah, neat, thanks for the pointer. It looks like the macro wants one to
> provide the exact error. It seems like breaking this out into
> vendor-specific tests where it checks for EINVAL for Intel and ERANGE
> for Nouveau would be better in any case. Assuming I do that, would it be
> good to leave this here for generic "at least don't succeed" testing for
> any additional vendors?

Yeah, +1 for vendor-specific error code checks, +1 for fallback to
"any error". Also add an igt_info() in the fallback that tells what
the error code was.


-- =

Petri Latvala


> =

> - Jeremy
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
