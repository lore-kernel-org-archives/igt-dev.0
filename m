Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E2EF10E92D
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Dec 2023 14:36:51 +0000 (UTC)
Date: Thu, 14 Dec 2023 15:36:28 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] lib: sync i915_pciids.h with kernel
Message-ID: <20231214143628.xyisz4tovwg3jjo2@kamilkon-desk.igk.intel.com>
References: <20231212090841.2060493-1-chaitanya.kumar.borah@intel.com>
 <c3cae6fc-8a97-4abd-9918-bba55c1757ca@gmail.com>
 <DM4PR11MB614147FFF506542FADD01654B98CA@DM4PR11MB6141.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DM4PR11MB614147FFF506542FADD01654B98CA@DM4PR11MB6141.namprd11.prod.outlook.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nemesa Garg <nemesa.garg@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On 2023-12-14 at 04:48:27 +0000, Borah, Chaitanya Kumar wrote:
> Hello JP,
> 
> > -----Original Message-----
> > From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > Sent: Wednesday, December 13, 2023 6:47 PM
> > To: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; igt-
> > dev@lists.freedesktop.org
> > Cc: Garg, Nemesa <nemesa.garg@intel.com>
> > Subject: Re: [PATCH] lib: sync i915_pciids.h with kernel
> > 
> > This is not correct. This does not synchronize with kernel commit.
> > i915_pciids.h is supposed to be copied as is from kernel.
> 
> This has crossed my mind but there are a lot of changes[1] unrelated to ARL-S if we just copy the file.
> Therefore, it made me a bit uncomfortable. Should I go ahead anyway?
> 
> At least for PVC device ids, we might have to take an exception. Or may be they did not belong there in the first place.
> 

You may add only ARL-S but then write in subject what you did
as it is not syncing, for example:

[PATCH] lib/i915_pciids: Add ARL-S

and describe why you added only that. Write also which commit (hash and subject)
you used (working link could also help).

One more thing: why not adding all without removing PVC ids?

Regards,
Kamil

> > Also don't do other
> > changes in same patch, put intel_device_info.c changes into their own patch.
> > 
> 
> Ack.
> 
> Regards
> 
> Chaitanya
> 
> [1]
> git diff
> diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
> index bee58554d..fcf1849aa 100644
> --- a/lib/i915_pciids.h
> +++ b/lib/i915_pciids.h
> @@ -588,6 +588,7 @@
>         INTEL_VGA_DEVICE(0x4551, info), \
>         INTEL_VGA_DEVICE(0x4555, info), \
>         INTEL_VGA_DEVICE(0x4557, info), \
> +       INTEL_VGA_DEVICE(0x4570, info), \
>         INTEL_VGA_DEVICE(0x4571, info)
> 
>  /* JSL */
> @@ -641,6 +642,7 @@
>         INTEL_VGA_DEVICE(0x4682, info), \
>         INTEL_VGA_DEVICE(0x4688, info), \
>         INTEL_VGA_DEVICE(0x468A, info), \
> +       INTEL_VGA_DEVICE(0x468B, info), \
>         INTEL_VGA_DEVICE(0x4690, info), \
>         INTEL_VGA_DEVICE(0x4692, info), \
>         INTEL_VGA_DEVICE(0x4693, info)
> @@ -683,14 +685,22 @@
>         INTEL_VGA_DEVICE(0xA78A, info), \
>         INTEL_VGA_DEVICE(0xA78B, info)
> 
> +/* RPL-U */
> +#define INTEL_RPLU_IDS(info) \
> +       INTEL_VGA_DEVICE(0xA721, info), \
> +       INTEL_VGA_DEVICE(0xA7A1, info), \
> +       INTEL_VGA_DEVICE(0xA7A9, info), \
> +       INTEL_VGA_DEVICE(0xA7AC, info), \
> +       INTEL_VGA_DEVICE(0xA7AD, info)
> +
>  /* RPL-P */
>  #define INTEL_RPLP_IDS(info) \
> +       INTEL_RPLU_IDS(info), \
>         INTEL_VGA_DEVICE(0xA720, info), \
> -       INTEL_VGA_DEVICE(0xA721, info), \
>         INTEL_VGA_DEVICE(0xA7A0, info), \
> -       INTEL_VGA_DEVICE(0xA7A1, info), \
>         INTEL_VGA_DEVICE(0xA7A8, info), \
> -       INTEL_VGA_DEVICE(0xA7A9, info)
> +       INTEL_VGA_DEVICE(0xA7AA, info), \
> +       INTEL_VGA_DEVICE(0xA7AB, info)
> 
>  /* DG2 */
>  #define INTEL_DG2_G10_IDS(info) \
> @@ -705,11 +715,14 @@
>         INTEL_VGA_DEVICE(0x5693, info), \
>         INTEL_VGA_DEVICE(0x5694, info), \
>         INTEL_VGA_DEVICE(0x5695, info), \
> -       INTEL_VGA_DEVICE(0x5698, info), \
>         INTEL_VGA_DEVICE(0x56A5, info), \
>         INTEL_VGA_DEVICE(0x56A6, info), \
>         INTEL_VGA_DEVICE(0x56B0, info), \
> -       INTEL_VGA_DEVICE(0x56B1, info)
> +       INTEL_VGA_DEVICE(0x56B1, info), \
> +       INTEL_VGA_DEVICE(0x56BA, info), \
> +       INTEL_VGA_DEVICE(0x56BB, info), \
> +       INTEL_VGA_DEVICE(0x56BC, info), \
> +       INTEL_VGA_DEVICE(0x56BD, info)
> 
>  #define INTEL_DG2_G12_IDS(info) \
>         INTEL_VGA_DEVICE(0x5696, info), \
> @@ -725,7 +738,8 @@
>         INTEL_DG2_G12_IDS(info)
> 
>  #define INTEL_ATS_M150_IDS(info) \
> -       INTEL_VGA_DEVICE(0x56C0, info)
> +       INTEL_VGA_DEVICE(0x56C0, info), \
> +       INTEL_VGA_DEVICE(0x56C2, info)
> 
>  #define INTEL_ATS_M75_IDS(info) \
>         INTEL_VGA_DEVICE(0x56C1, info)
> @@ -733,34 +747,14 @@
>  #define INTEL_ATS_M_IDS(info) \
>         INTEL_ATS_M150_IDS(info), \
>         INTEL_ATS_M75_IDS(info)
> +
>  /* MTL */
> -#define INTEL_MTL_M_IDS(info) \
> +#define INTEL_MTL_IDS(info) \
>         INTEL_VGA_DEVICE(0x7D40, info), \
> -       INTEL_VGA_DEVICE(0x7D60, info)
> -#define INTEL_MTL_P_GT2_IDS(info) \
> -       INTEL_VGA_DEVICE(0x7D45, info)
> -#define INTEL_MTL_P_GT3_IDS(info) \
> +       INTEL_VGA_DEVICE(0x7D45, info), \
>         INTEL_VGA_DEVICE(0x7D55, info), \
> +       INTEL_VGA_DEVICE(0x7D60, info), \
> +       INTEL_VGA_DEVICE(0x7D67, info), \
>         INTEL_VGA_DEVICE(0x7DD5, info)
> -#define INTEL_MTL_P_IDS(info) \
> -       INTEL_MTL_P_GT2_IDS(info), \
> -       INTEL_MTL_P_GT3_IDS(info)
> -
> -#define INTEL_MTL_IDS(info) \
> -       INTEL_MTL_M_IDS(info), \
> -       INTEL_MTL_P_IDS(info)
> -
> -/* PVC */
> -#define INTEL_PVC_IDS(info) \
> -       INTEL_VGA_DEVICE(0x0BD0, info), \
> -       INTEL_VGA_DEVICE(0x0BD5, info), \
> -       INTEL_VGA_DEVICE(0x0BD6, info), \
> -       INTEL_VGA_DEVICE(0x0BD7, info), \
> -       INTEL_VGA_DEVICE(0x0BD8, info), \
> -       INTEL_VGA_DEVICE(0x0BD9, info), \
> -       INTEL_VGA_DEVICE(0x0BDA, info), \
> -       INTEL_VGA_DEVICE(0x0BDB, info), \
> -       INTEL_VGA_DEVICE(0x0BD1, info), \
> -       INTEL_VGA_DEVICE(0x0BD2, info)
> 
>  #endif /* _I915_PCIIDS_H */
> 
> 
> 
> > You can see "git log lib/i915_pciids.h" for examples, sans two latest changes
> > into the file. Two two latest changes are broken.
> > 
> > /Juha-Pekka
> > 
> > On 12.12.2023 11.08, Chaitanya Kumar Borah wrote:
> > > This synchronizes with kernel commit
> > >
> > > 8940da9fe5f27 ("drm/i915/mtl: Adding DeviceID for Arrowlake-S under
> > > MTL") to bring in ARL-S PCI IDs.
> > >
> > > Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> > > ---
> > >   lib/i915_pciids.h       | 4 ++++
> > >   lib/intel_device_info.c | 1 +
> > >   2 files changed, 5 insertions(+)
> > >
> > > diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h index
> > > bee58554d..106e42f84 100644
> > > --- a/lib/i915_pciids.h
> > > +++ b/lib/i915_pciids.h
> > > @@ -750,6 +750,10 @@
> > >   	INTEL_MTL_M_IDS(info), \
> > >   	INTEL_MTL_P_IDS(info)
> > >
> > > +/* ARL-S */
> > > +#define INTEL_ARLS_IDS(info) \
> > > +	INTEL_VGA_DEVICE(0x7D67, info)
> > > +
> > >   /* PVC */
> > >   #define INTEL_PVC_IDS(info) \
> > >   	INTEL_VGA_DEVICE(0x0BD0, info),	\
> > > diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c index
> > > 34817f7b6..48036bec5 100644
> > > --- a/lib/intel_device_info.c
> > > +++ b/lib/intel_device_info.c
> > > @@ -614,6 +614,7 @@ static const struct pci_id_match
> > intel_device_match[] = {
> > >   	INTEL_ATS_M_IDS(&intel_ats_m_info),
> > >
> > >   	INTEL_MTL_IDS(&intel_meteorlake_info),
> > > +	INTEL_ARLS_IDS(&intel_meteorlake_info),
> > >
> > >   	INTEL_PVC_IDS(&intel_pontevecchio_info),
> > >
> 
