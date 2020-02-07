Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F156FCFE
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2020 15:36:12 +0000 (UTC)
Date: Fri, 7 Feb 2020 17:36:08 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200207153608.GJ13686@intel.com>
References: <20200128112549.172135-1-daniel.vetter@ffwll.ch>
 <20200128112549.172135-3-daniel.vetter@ffwll.ch>
 <20200207141919.GA13686@intel.com>
 <20200207152945.GE43062@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200207152945.GE43062@phenom.ffwll.local>
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] tests/kms_fbcon_fbt: Drop master
 before restoring fbcon
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
To: Daniel Vetter <daniel@ffwll.ch>
Cc: IGT development <igt-dev@lists.freedesktop.org>, Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>, Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Feb 07, 2020 at 04:29:45PM +0100, Daniel Vetter wrote:
> On Fri, Feb 07, 2020 at 04:19:19PM +0200, Ville Syrj=E4l=E4 wrote:
> > On Tue, Jan 28, 2020 at 12:25:49PM +0100, Daniel Vetter wrote:
> > > fbdev helpers refuse to restore the fbdev screen if there's still a
> > > master present. This is to avoid fbcon popping up when a compositor
> > > has intentionally disabled all outputs.
> > > =

> > > Unfortunately the kernel had some bugs in this area, and kms_fbcon_fbt
> > > relied on those. Result was that fbdev restore was skipped, which
> > > skipped the frontbuffer flushing, which broke the PSR subtest's
> > > expectation that PSR is always disable when fbdev is enabled. FBC did
> > > not get broken because FBC was never enabled on linear framebuffers as
> > > used by fbdev.
> > > =

> > > Fix things up to make sure fbcon gets restored correctly in all cases.
> > > =

> > > Cc: Noralf Tr=F8nnes <noralf@tronnes.org>
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > ---
> > >  tests/kms_fbcon_fbt.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > =

> > > diff --git a/tests/kms_fbcon_fbt.c b/tests/kms_fbcon_fbt.c
> > > index 236e09ea1ebd..ed4cccbe743e 100644
> > > --- a/tests/kms_fbcon_fbt.c
> > > +++ b/tests/kms_fbcon_fbt.c
> > > @@ -74,6 +74,8 @@ static void teardown_drm(struct drm_info *drm)
> > >  {
> > >  	int i;
> > >  =

> > > +	igt_assert_eq(drmDropMaster(drm->fd), 0);
> > > +
> > =

> > Aren't we closing the whole fd soonish?
> =

> Yeah, but after the vt switch, which I think is too late (proof still
> waiting for CI). I guess I could have moved the close up too, but I
> figured trying to implement proper vt switching a bit more closely yields
> the better test.
> =

> Could also be that I'm totally misinterpreting what's going on here with
> my kernel patch series.

I can buy that the close after vt switch somehow doesn't do the
same thing as swapping them around. At least can't see any possible
harm from this (other than not testing close-after-vt-switch), so

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> -Daniel
> =

> > =

> > >  	kmstest_restore_vt_mode();
> > >  =

> > >  	for (i =3D 0; i < drm->res->count_connectors; i++)
> > > -- =

> > > 2.24.1
> > > =

> > > _______________________________________________
> > > igt-dev mailing list
> > > igt-dev@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/igt-dev
> > =

> > -- =

> > Ville Syrj=E4l=E4
> > Intel
> =

> -- =

> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
