Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F1266E408
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Feb 2021 08:09:58 +0000 (UTC)
Date: Thu, 11 Feb 2021 10:09:42 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YCTmRlhMjmbdfhbB@platvala-desk.ger.corp.intel.com>
References: <20210211074532.240868-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <YCTkugg99PO74drR@platvala-desk.ger.corp.intel.com>
 <SN6PR11MB342195B907DF5727C4D914A2DF8C9@SN6PR11MB3421.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SN6PR11MB342195B907DF5727C4D914A2DF8C9@SN6PR11MB3421.namprd11.prod.outlook.com>
Subject: Re: [igt-dev] [i-g-t] lib/adl_s: Add Alder Lake S platform
 definition and PCIids
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Surendrakumar Upadhyay,
 TejaskumarX" <tejaskumarx.surendrakumar.upadhyay@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Srivatsa,
 Anusha" <anusha.srivatsa@intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>, "Pandey, Hariom" <hariom.pandey@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Feb 11, 2021 at 10:05:39AM +0200, Surendrakumar Upadhyay, TejaskumarX wrote:
> 
> 
> > -----Original Message-----
> > From: Petri Latvala <petri.latvala@intel.com>
> > Sent: 11 February 2021 13:33
> > To: Surendrakumar Upadhyay, TejaskumarX
> > <tejaskumarx.surendrakumar.upadhyay@intel.com>
> > Cc: igt-dev@lists.freedesktop.org; Srivatsa, Anusha
> > <anusha.srivatsa@intel.com>; De Marchi, Lucas
> > <lucas.demarchi@intel.com>; Pandey, Hariom <hariom.pandey@intel.com>
> > Subject: Re: [igt-dev] [i-g-t] lib/adl_s: Add Alder Lake S platform definition
> > and PCIids
> >
> > On Thu, Feb 11, 2021 at 01:15:32PM +0530, Tejas Upadhyay wrote:
> > > Adding Alder lake platform definitions and PCIids.
> > >
> > > Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
> > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > Signed-off-by: Caz Yokoyama <caz.yokoyama@intel.com>
> > > Signed-off-by: Tejas Upadhyay
> > > <tejaskumarx.surendrakumar.upadhyay@intel.com>
> > > ---
> > >  lib/i915_pciids.h       | 11 +++++++++++
> > >  lib/intel_chipset.h     |  2 ++
> > >  lib/intel_device_info.c |  8 ++++++++
> > >  3 files changed, 21 insertions(+)
> > >
> > > diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h index
> > > 3b5ed1e4..ba87b458 100644
> > > --- a/lib/i915_pciids.h
> > > +++ b/lib/i915_pciids.h
> > > @@ -628,6 +628,17 @@
> > >  INTEL_VGA_DEVICE(0x4C90, info), \
> > >  INTEL_VGA_DEVICE(0x4C9A, info)
> > >
> > > + /* ADL-S */
> > > + #define INTEL_ADLS_IDS(info) \
> > > +INTEL_VGA_DEVICE(0x4680, info), \
> > > +INTEL_VGA_DEVICE(0x4681, info), \
> > > +INTEL_VGA_DEVICE(0x4682, info), \
> > > +INTEL_VGA_DEVICE(0x4683, info), \
> > > +INTEL_VGA_DEVICE(0x4690, info), \
> > > +INTEL_VGA_DEVICE(0x4691, info), \
> > > +INTEL_VGA_DEVICE(0x4692, info), \
> > > +INTEL_VGA_DEVICE(0x4693, info)
> > > +
> > >  /* DG1 */
> > >  #define INTEL_DG1_IDS(info) \
> > >  INTEL_VGA_DEVICE(0x4905, info), \
> >
> > Is i915_pciids.h here copied from the kernel? Commit message needs to state
> > which kernel commit sha was used.
> >
> > Preferably i915_pciids.h change is done as a separate commit.
> Tejas : Change is taken from intel reviewed internal branch. Do you want me to split patches for PCIid and platform info?


Yes, split them. And copy the pciids file from public kernel instead
of whatever is in internal.

-- 
Petri Latvala


> >
> >
> > --
> > Petri Latvala
> >
> >
> > > diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> > > index 63c98025..f766021e 100644
> > > --- a/lib/intel_chipset.h
> > > +++ b/lib/intel_chipset.h
> > > @@ -76,6 +76,7 @@ struct intel_device_info {
> > >  bool is_tigerlake : 1;
> > >  bool is_rocketlake : 1;
> > >  bool is_dg1 : 1;
> > > +bool is_alderlake_s : 1;
> > >  const char *codename;
> > >  };
> > >
> > > @@ -176,6 +177,7 @@ void intel_check_pch(void);
> > >  #define IS_TIGERLAKE(devid)(intel_get_device_info(devid)->is_tigerlake)
> > >  #define IS_ROCKETLAKE(devid)(intel_get_device_info(devid)-
> > >is_rocketlake)
> > >  #define IS_DG1(devid)(intel_get_device_info(devid)-
> > >is_dg1)
> > > +#define IS_ALDERLAKE_S(devid)(intel_get_device_info(devid)-
> > >is_alderlake_s)
> > >
> > >  #define IS_GEN(devid, x)(intel_get_device_info(devid)->gen & (1u <<
> > ((x)-1)))
> > >  #define AT_LEAST_GEN(devid, x)(intel_get_device_info(devid)->gen &
> > -(1u << ((x)-1)))
> > > diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> > > index 5c3816fe..e07fdf6f 100644
> > > --- a/lib/intel_device_info.c
> > > +++ b/lib/intel_device_info.c
> > > @@ -347,6 +347,12 @@ static const struct intel_device_info intel_dg1_info
> > = {
> > >  .codename = "dg1"
> > >  };
> > >
> > > +static const struct intel_device_info intel_alderlake_s_info = {
> > > +.gen = BIT(11),
> > > +.is_alderlake_s = true,
> > > +.codename = "alderlake_s"
> > > +};
> > > +
> > >  static const struct pci_id_match intel_device_match[] = {
> > >  INTEL_I810_IDS(&intel_i810_info),
> > >  INTEL_I815_IDS(&intel_i815_info),
> > > @@ -437,6 +443,8 @@ static const struct pci_id_match
> > intel_device_match[] = {
> > >
> > >  INTEL_DG1_IDS(&intel_dg1_info),
> > >
> > > +INTEL_ADLS_IDS(&intel_alderlake_s_info),
> > > +
> > >  INTEL_VGA_DEVICE(PCI_MATCH_ANY, &intel_generic_info),
> > >  };
> > >
> > > --
> > > 2.30.0
> > >
> > > _______________________________________________
> > > igt-dev mailing list
> > > igt-dev@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
