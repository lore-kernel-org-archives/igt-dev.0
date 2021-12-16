Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18BA310F3F7
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Dec 2021 11:37:09 +0000 (UTC)
From: "Surendrakumar Upadhyay, TejaskumarX"
 <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Thu, 16 Dec 2021 11:37:03 +0000
Message-ID: <PH7PR11MB5819714B4B0D65CCF66F2ED9DF779@PH7PR11MB5819.namprd11.prod.outlook.com>
References: <20211216111510.4094034-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <YbsirhuBf94hm3ZE@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YbsirhuBf94hm3ZE@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t] lib: sync i915_pciids.h with kernel
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
> Sent: 16 December 2021 16:58
> To: Surendrakumar Upadhyay, TejaskumarX
> <tejaskumarx.surendrakumar.upadhyay@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: Re: [igt-dev] [i-g-t] lib: sync i915_pciids.h with kernel
>=20
> On Thu, Dec 16, 2021 at 04:45:10PM +0530, Tejas Upadhyay wrote:
> > This synchronizes with kernel commit
> >
> > 52407c220c44 ("drm/i915/rpl-s: Add PCI IDS for Raptor Lake S")
> >
> > to bring in RPL-S PCI IDs.
> >
> > Signed-off-by: Tejas Upadhyay
> > <tejaskumarx.surendrakumar.upadhyay@intel.com>
> > ---
> >  lib/i915_pciids.h | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h index
> > c00ac546..baf3d1d3 100644
> > --- a/lib/i915_pciids.h
> > +++ b/lib/i915_pciids.h
> > @@ -666,4 +666,13 @@
> >  	INTEL_VGA_DEVICE(0x46C2, info), \
> >  	INTEL_VGA_DEVICE(0x46C3, info)
> >
> > +/* RPL-S */
> > +#define INTEL_RPLS_IDS(info) \
> > +	INTEL_VGA_DEVICE(0xA780, info), \
> > +	INTEL_VGA_DEVICE(0xA781, info), \
> > +	INTEL_VGA_DEVICE(0xA782, info), \
> > +	INTEL_VGA_DEVICE(0xA783, info), \
> > +	INTEL_VGA_DEVICE(0xA788, info), \
> > +	INTEL_VGA_DEVICE(0xA789, info)
> > +
> >  #endif /* _I915_PCIIDS_H */
> > --
> > 2.31.1
> >
>=20
> Acked-by: Petri Latvala <petri.latvala@intel.com>
>=20
> But you also need to change lib/intel_device_info.c accordingly. See
> 9da04f759312cae8caa9aaac863163d0d98c964e for an example.

That change we already have in internal, follow up patch will upstream it.

Thanks,
Tejas
