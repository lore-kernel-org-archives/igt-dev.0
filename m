Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC74110E160
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Apr 2022 06:10:27 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Date: Mon, 25 Apr 2022 06:10:23 +0000
Message-ID: <1e597a2232df4c51ac6a2ac8112784bf@intel.com>
References: <20220422125912.6862-1-anshuman.gupta@intel.com>
 <87y1zx6qzs.wl-ashutosh.dixit@intel.com>
 <6b377d0333494eb1940bd2f96ba15cb8@intel.com>
 <874k2haf9t.wl-ashutosh.dixit@intel.com>
In-Reply-To: <874k2haf9t.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/intel_device_info: Add IS_DGFX()
 support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> Sent: Monday, April 25, 2022 11:14 AM
> To: Gupta, Anshuman <anshuman.gupta@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: Re: [igt-dev] [PATCH i-g-t] lib/intel_device_info: Add IS_DGFX()=
 support
>=20
> On Sun, 24 Apr 2022 22:24:06 -0700, Gupta, Anshuman wrote:
> >
> > > -----Original Message-----
> > > From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> > > Sent: Friday, April 22, 2022 9:38 PM
> > > To: Gupta, Anshuman <anshuman.gupta@intel.com>
> > > Cc: igt-dev@lists.freedesktop.org; Vivi, Rodrigo
> > > <rodrigo.vivi@intel.com>
> > > Subject: Re: [igt-dev] [PATCH i-g-t] lib/intel_device_info: Add
> > > IS_DGFX() support
> > >
> > > On Fri, 22 Apr 2022 05:59:12 -0700, Anshuman Gupta wrote:
> > > >
> > > > Currently IGT is lacking IS_DGFX() macro support.
> > > > There are some power features like D3Cold are only supported on
> > > > discrete card. So IGT test/tools specific to D3Cold requires to
> > > > consume IS_DGFX().
> > > > Adding a is_dgfx field in intel_device_info and initializing it
> > > > for DG1. All future discrete platform would require to initialize
> > > > this field.
> > >
> > > #define IS_DGFX(fd) gem_has_lmem(fd) ?
> > >
> > > gem_has_lmem() is already pretty widely used so maybe we should not
> > > introduce another way to achieve the same goal?
> >
> > Before introducing this , I thought on using gem_has_lmem.
> > But I was not sure in case every discrete platform mandatory to have lm=
em
> region.
> > If it is guaranteed that every discrete platform will have lmem memory =
region
> ?
> > I will  drop  this patch.
>=20
> So not sure what will happen in the future but till now and in the forsee=
able
> future all dGfx platforms have LMEM, so gem_has_lmem seems fine.
It seems better to carry with gem_has_lmem(), as IS_DGFX() requires to popu=
late device info fields.
This patch spined off from series https://patchwork.freedesktop.org/series/=
102780/
I will use gem_has_lmem() instead of IS_DGFX().
@rodrigo what is your opinion about it  ?
>=20
> I think if we introduce IS_DGFX() as in this patch, we should have an add=
itional
> patch to convert all tests using gem_has_lmem() to IS_DGFX() so that we d=
on't
> have multiple ways of tests deciding if something should run for dGfx.
>=20
> Or maybe both are also ok? So lmem related tests should use gem_has_lmem(=
)
> and non LMEM related tests should use IS_DGFX()?
Actually, both of these methods even are not sufficient, if needed prior to=
 open the drm_fd.
Ex. igt_device_find_first_i915_discrete_card() checks the igpu b:d:f, which=
 breaks on one of real time issue.
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/94
Thanks,
Anshuman Gupta.
=20
>=20
> So if we want to merge this let's look at other tests which are presently=
 using
> gem_has_lmem() and see if any need to be converted over to IS_DGFX(). Or =
to
> keep things simple just use gem_has_lmem() for now?
>=20
> Thanks.
