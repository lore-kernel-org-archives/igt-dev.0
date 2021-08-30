Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A1A89CB5
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Aug 2021 09:12:36 +0000 (UTC)
From: "Surendrakumar Upadhyay, TejaskumarX"
 <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Mon, 30 Aug 2021 09:12:25 +0000
Message-ID: <SN6PR11MB34217D6C6F8CCBEE73712585DFCB9@SN6PR11MB3421.namprd11.prod.outlook.com>
References: <20210827130002.1188868-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <YSyYqeaPapBItJE8@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YSyYqeaPapBItJE8@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t] lib/i915: Use FIXED mapping only for discrete
 memory
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Latvala, Petri" <petri.latvala@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Latvala, Petri <petri.latvala@intel.com>
> Sent: 30 August 2021 14:07
> To: Surendrakumar Upadhyay, TejaskumarX
> <tejaskumarx.surendrakumar.upadhyay@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: Re: [igt-dev] [i-g-t] lib/i915: Use FIXED mapping only for discr=
ete
> memory
>=20
> On Fri, Aug 27, 2021 at 06:30:02PM +0530, Tejas Upadhyay wrote:
> > The FIXED mapping is only used for discrete, and mapping type is
> > pre-defined. This disables the other type of mmap offsets when
> > discrete memory is used.
> >
> > Taken from kernel commit:
> > commit 7961c5b60f23 ("drm/i915: Add TTM offset argument to mmap.")
> >
> > Signed-off-by: Tejas Upadhyay
> > <tejaskumarx.surendrakumar.upadhyay@intel.com>
> > ---
> >  include/drm-uapi/i915_drm.h | 1 +
> >  lib/i915/gem_mman.c         | 8 +++++++-
> >  2 files changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
> > index a1c0030c..b46367f2 100644
> > --- a/include/drm-uapi/i915_drm.h
> > +++ b/include/drm-uapi/i915_drm.h
> > @@ -871,6 +871,7 @@ struct drm_i915_gem_mmap_offset {  #define
> > I915_MMAP_OFFSET_WC  1  #define I915_MMAP_OFFSET_WB  2  #define
> > I915_MMAP_OFFSET_UC  3
> > +#define I915_MMAP_OFFSET_FIXED 4
> >
> >  	/*
> >  	 * Zero-terminated chain of extensions.
> > diff --git a/lib/i915/gem_mman.c b/lib/i915/gem_mman.c index
> > 0406a0b9..1917c24d 100644
> > --- a/lib/i915/gem_mman.c
> > +++ b/lib/i915/gem_mman.c
> > @@ -75,7 +75,13 @@ bool gem_has_legacy_mmap(int fd)
> >
> >  bool gem_has_mmap_offset_type(int fd, const struct mmap_offset *t)  {
> > -	return gem_has_mmap_offset(fd) || t->type =3D=3D
> I915_MMAP_OFFSET_GTT;
> > +	if (gem_has_mmap_offset(fd))
> > +		if (!gem_has_lmem(fd))
> > +			return !(t->type =3D=3D I915_MMAP_OFFSET_FIXED);
> > +		else
> > +			return !(t->type !=3D I915_MMAP_OFFSET_FIXED);
>=20
> Why the !(a =3D=3D b) stuff?
>        ^^^

If its discrete memory and offset type is fixed then only its valid combina=
tion.  Reverse if not discrete then any offset type except fixed is valid c=
ombination.

Thanks,
Tejas=20
>=20
>=20
> --
> Petri Latvala
