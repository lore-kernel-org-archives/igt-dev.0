Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA96C6E4CB
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2020 08:03:37 +0000 (UTC)
Date: Fri, 23 Oct 2020 11:03:24 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201023080324.GR7444@platvala-desk.ger.corp.intel.com>
References: <20201023031859.60295-1-ashutosh.dixit@intel.com>
 <20201023075927.GQ7444@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201023075927.GQ7444@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib: sync i915_pciids.h with kernel
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
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Oct 23, 2020 at 10:59:27AM +0300, Petri Latvala wrote:
> On Thu, Oct 22, 2020 at 08:18:59PM -0700, Ashutosh Dixit wrote:
> > Align with kernel commits:
> > 
> > 605f9c290c1a2 ("drm/i915: Sort ICL PCI IDs")
> > 514dc424ce4f5 ("drm/i915: Sort CNL PCI IDs")
> > 32d4ec9a1681d ("drm/i915: Sort CFL PCI IDs")
> > df3478af1d73c ("drm/i915: Sort CML PCI IDs")
> > cd988984cbea0 ("drm/i915: Sort KBL PCI IDs")
> > b04d36f737712 ("drm/i915: Sort SKL PCI IDs")
> > 9c0b2d30441b5 ("drm/i915: Sort HSW PCI IDs")
> > 79033a0a78984 ("drm/i915: Ocd the HSW PCI ID hex numbers")
> > cfb3db8fdae25 ("drm/i915: Try to fix the SKL GT3/4 vs. GT3e/4e comments")
> > 03e399020cd20 ("drm/i915: Add SKL GT1.5 PCI IDs")
> > 812f044df08cc ("drm/i915: Reclassify SKL 0x1923 and 0x1927 as ULT")
> > 194909a32aed0 ("drm/i915: Reclassify SKL 0x192a as GT3")
> > 82e84284ab7dd ("drm/i915: Update Haswell PCI IDs")
> > 24ea098b7c0d8 ("drm/i915/jsl: Split EHL/JSL platform info and PCI ids")
> > b50b7991b739c ("drm/i915/dg1: add more PCI ids")
> > 
> > Cc: Petri Latvala <petri.latvala@intel.com>
> > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > ---
> 
> I get really confused by commit messages like this. Which commit is
> this now copied from, and which repo has that commit?

Regardless of that confusion, the file matches what's in drm-tip so

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> 
> 
> --
> Petri Latvala
> 
> 
> 
> >  lib/i915_pciids.h | 141 ++++++++++++++++++++++++----------------------
> >  1 file changed, 75 insertions(+), 66 deletions(-)
> > 
> > diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
> > index 7eeecb07c9..3b5ed1e4f3 100644
> > --- a/lib/i915_pciids.h
> > +++ b/lib/i915_pciids.h
> > @@ -170,9 +170,9 @@
> >  
> >  #define INTEL_HSW_ULT_GT1_IDS(info) \
> >  	INTEL_VGA_DEVICE(0x0A02, info), /* ULT GT1 desktop */ \
> > +	INTEL_VGA_DEVICE(0x0A06, info), /* ULT GT1 mobile */ \
> >  	INTEL_VGA_DEVICE(0x0A0A, info), /* ULT GT1 server */ \
> > -	INTEL_VGA_DEVICE(0x0A0B, info), /* ULT GT1 reserved */ \
> > -	INTEL_VGA_DEVICE(0x0A06, info)  /* ULT GT1 mobile */
> > +	INTEL_VGA_DEVICE(0x0A0B, info)  /* ULT GT1 reserved */
> >  
> >  #define INTEL_HSW_ULX_GT1_IDS(info) \
> >  	INTEL_VGA_DEVICE(0x0A0E, info) /* ULX GT1 mobile */
> > @@ -181,26 +181,26 @@
> >  	INTEL_HSW_ULT_GT1_IDS(info), \
> >  	INTEL_HSW_ULX_GT1_IDS(info), \
> >  	INTEL_VGA_DEVICE(0x0402, info), /* GT1 desktop */ \
> > -	INTEL_VGA_DEVICE(0x040a, info), /* GT1 server */ \
> > +	INTEL_VGA_DEVICE(0x0406, info), /* GT1 mobile */ \
> > +	INTEL_VGA_DEVICE(0x040A, info), /* GT1 server */ \
> >  	INTEL_VGA_DEVICE(0x040B, info), /* GT1 reserved */ \
> >  	INTEL_VGA_DEVICE(0x040E, info), /* GT1 reserved */ \
> >  	INTEL_VGA_DEVICE(0x0C02, info), /* SDV GT1 desktop */ \
> > +	INTEL_VGA_DEVICE(0x0C06, info), /* SDV GT1 mobile */ \
> >  	INTEL_VGA_DEVICE(0x0C0A, info), /* SDV GT1 server */ \
> >  	INTEL_VGA_DEVICE(0x0C0B, info), /* SDV GT1 reserved */ \
> >  	INTEL_VGA_DEVICE(0x0C0E, info), /* SDV GT1 reserved */ \
> >  	INTEL_VGA_DEVICE(0x0D02, info), /* CRW GT1 desktop */ \
> > +	INTEL_VGA_DEVICE(0x0D06, info), /* CRW GT1 mobile */	\
> >  	INTEL_VGA_DEVICE(0x0D0A, info), /* CRW GT1 server */ \
> >  	INTEL_VGA_DEVICE(0x0D0B, info), /* CRW GT1 reserved */ \
> > -	INTEL_VGA_DEVICE(0x0D0E, info), /* CRW GT1 reserved */ \
> > -	INTEL_VGA_DEVICE(0x0406, info), /* GT1 mobile */ \
> > -	INTEL_VGA_DEVICE(0x0C06, info), /* SDV GT1 mobile */ \
> > -	INTEL_VGA_DEVICE(0x0D06, info)  /* CRW GT1 mobile */
> > +	INTEL_VGA_DEVICE(0x0D0E, info)  /* CRW GT1 reserved */
> >  
> >  #define INTEL_HSW_ULT_GT2_IDS(info) \
> >  	INTEL_VGA_DEVICE(0x0A12, info), /* ULT GT2 desktop */ \
> > +	INTEL_VGA_DEVICE(0x0A16, info), /* ULT GT2 mobile */	\
> >  	INTEL_VGA_DEVICE(0x0A1A, info), /* ULT GT2 server */ \
> > -	INTEL_VGA_DEVICE(0x0A1B, info), /* ULT GT2 reserved */ \
> > -	INTEL_VGA_DEVICE(0x0A16, info)  /* ULT GT2 mobile */
> > +	INTEL_VGA_DEVICE(0x0A1B, info)  /* ULT GT2 reserved */ \
> >  
> >  #define INTEL_HSW_ULX_GT2_IDS(info) \
> >  	INTEL_VGA_DEVICE(0x0A1E, info) /* ULX GT2 mobile */ \
> > @@ -209,45 +209,45 @@
> >  	INTEL_HSW_ULT_GT2_IDS(info), \
> >  	INTEL_HSW_ULX_GT2_IDS(info), \
> >  	INTEL_VGA_DEVICE(0x0412, info), /* GT2 desktop */ \
> > -	INTEL_VGA_DEVICE(0x041a, info), /* GT2 server */ \
> > +	INTEL_VGA_DEVICE(0x0416, info), /* GT2 mobile */ \
> > +	INTEL_VGA_DEVICE(0x041A, info), /* GT2 server */ \
> >  	INTEL_VGA_DEVICE(0x041B, info), /* GT2 reserved */ \
> >  	INTEL_VGA_DEVICE(0x041E, info), /* GT2 reserved */ \
> >  	INTEL_VGA_DEVICE(0x0C12, info), /* SDV GT2 desktop */ \
> > +	INTEL_VGA_DEVICE(0x0C16, info), /* SDV GT2 mobile */ \
> >  	INTEL_VGA_DEVICE(0x0C1A, info), /* SDV GT2 server */ \
> >  	INTEL_VGA_DEVICE(0x0C1B, info), /* SDV GT2 reserved */ \
> >  	INTEL_VGA_DEVICE(0x0C1E, info), /* SDV GT2 reserved */ \
> >  	INTEL_VGA_DEVICE(0x0D12, info), /* CRW GT2 desktop */ \
> > +	INTEL_VGA_DEVICE(0x0D16, info), /* CRW GT2 mobile */ \
> >  	INTEL_VGA_DEVICE(0x0D1A, info), /* CRW GT2 server */ \
> >  	INTEL_VGA_DEVICE(0x0D1B, info), /* CRW GT2 reserved */ \
> > -	INTEL_VGA_DEVICE(0x0D1E, info), /* CRW GT2 reserved */ \
> > -	INTEL_VGA_DEVICE(0x0416, info), /* GT2 mobile */ \
> > -	INTEL_VGA_DEVICE(0x0426, info), /* GT2 mobile */ \
> > -	INTEL_VGA_DEVICE(0x0C16, info), /* SDV GT2 mobile */ \
> > -	INTEL_VGA_DEVICE(0x0D16, info)  /* CRW GT2 mobile */
> > +	INTEL_VGA_DEVICE(0x0D1E, info)  /* CRW GT2 reserved */
> >  
> >  #define INTEL_HSW_ULT_GT3_IDS(info) \
> >  	INTEL_VGA_DEVICE(0x0A22, info), /* ULT GT3 desktop */ \
> > +	INTEL_VGA_DEVICE(0x0A26, info), /* ULT GT3 mobile */ \
> >  	INTEL_VGA_DEVICE(0x0A2A, info), /* ULT GT3 server */ \
> >  	INTEL_VGA_DEVICE(0x0A2B, info), /* ULT GT3 reserved */ \
> > -	INTEL_VGA_DEVICE(0x0A26, info), /* ULT GT3 mobile */ \
> >  	INTEL_VGA_DEVICE(0x0A2E, info)  /* ULT GT3 reserved */
> >  
> >  #define INTEL_HSW_GT3_IDS(info) \
> >  	INTEL_HSW_ULT_GT3_IDS(info), \
> >  	INTEL_VGA_DEVICE(0x0422, info), /* GT3 desktop */ \
> > -	INTEL_VGA_DEVICE(0x042a, info), /* GT3 server */ \
> > +	INTEL_VGA_DEVICE(0x0426, info), /* GT3 mobile */ \
> > +	INTEL_VGA_DEVICE(0x042A, info), /* GT3 server */ \
> >  	INTEL_VGA_DEVICE(0x042B, info), /* GT3 reserved */ \
> >  	INTEL_VGA_DEVICE(0x042E, info), /* GT3 reserved */ \
> >  	INTEL_VGA_DEVICE(0x0C22, info), /* SDV GT3 desktop */ \
> > +	INTEL_VGA_DEVICE(0x0C26, info), /* SDV GT3 mobile */ \
> >  	INTEL_VGA_DEVICE(0x0C2A, info), /* SDV GT3 server */ \
> >  	INTEL_VGA_DEVICE(0x0C2B, info), /* SDV GT3 reserved */ \
> >  	INTEL_VGA_DEVICE(0x0C2E, info), /* SDV GT3 reserved */ \
> >  	INTEL_VGA_DEVICE(0x0D22, info), /* CRW GT3 desktop */ \
> > +	INTEL_VGA_DEVICE(0x0D26, info), /* CRW GT3 mobile */ \
> >  	INTEL_VGA_DEVICE(0x0D2A, info), /* CRW GT3 server */ \
> >  	INTEL_VGA_DEVICE(0x0D2B, info), /* CRW GT3 reserved */ \
> > -	INTEL_VGA_DEVICE(0x0D2E, info), /* CRW GT3 reserved */ \
> > -	INTEL_VGA_DEVICE(0x0C26, info), /* SDV GT3 mobile */ \
> > -	INTEL_VGA_DEVICE(0x0D26, info)  /* CRW GT3 mobile */
> > +	INTEL_VGA_DEVICE(0x0D2E, info)  /* CRW GT3 reserved */
> >  
> >  #define INTEL_HSW_IDS(info) \
> >  	INTEL_HSW_GT1_IDS(info), \
> > @@ -329,17 +329,20 @@
> >  	INTEL_VGA_DEVICE(0x22b3, info)
> >  
> >  #define INTEL_SKL_ULT_GT1_IDS(info) \
> > -	INTEL_VGA_DEVICE(0x1906, info) /* ULT GT1 */
> > +	INTEL_VGA_DEVICE(0x1906, info), /* ULT GT1 */ \
> > +	INTEL_VGA_DEVICE(0x1913, info)  /* ULT GT1.5 */
> >  
> >  #define INTEL_SKL_ULX_GT1_IDS(info) \
> > -	INTEL_VGA_DEVICE(0x190E, info) /* ULX GT1 */
> > +	INTEL_VGA_DEVICE(0x190E, info), /* ULX GT1 */ \
> > +	INTEL_VGA_DEVICE(0x1915, info)  /* ULX GT1.5 */
> >  
> >  #define INTEL_SKL_GT1_IDS(info)	\
> >  	INTEL_SKL_ULT_GT1_IDS(info), \
> >  	INTEL_SKL_ULX_GT1_IDS(info), \
> >  	INTEL_VGA_DEVICE(0x1902, info), /* DT  GT1 */ \
> > +	INTEL_VGA_DEVICE(0x190A, info), /* SRV GT1 */ \
> >  	INTEL_VGA_DEVICE(0x190B, info), /* Halo GT1 */ \
> > -	INTEL_VGA_DEVICE(0x190A, info) /* SRV GT1 */
> > +	INTEL_VGA_DEVICE(0x1917, info)  /* DT  GT1.5 */
> >  
> >  #define INTEL_SKL_ULT_GT2_IDS(info) \
> >  	INTEL_VGA_DEVICE(0x1916, info), /* ULT GT2 */ \
> > @@ -352,26 +355,26 @@
> >  	INTEL_SKL_ULT_GT2_IDS(info), \
> >  	INTEL_SKL_ULX_GT2_IDS(info), \
> >  	INTEL_VGA_DEVICE(0x1912, info), /* DT  GT2 */ \
> > -	INTEL_VGA_DEVICE(0x191B, info), /* Halo GT2 */ \
> >  	INTEL_VGA_DEVICE(0x191A, info), /* SRV GT2 */ \
> > +	INTEL_VGA_DEVICE(0x191B, info), /* Halo GT2 */ \
> >  	INTEL_VGA_DEVICE(0x191D, info)  /* WKS GT2 */
> >  
> >  #define INTEL_SKL_ULT_GT3_IDS(info) \
> > -	INTEL_VGA_DEVICE(0x1926, info) /* ULT GT3 */
> > +	INTEL_VGA_DEVICE(0x1923, info), /* ULT GT3 */ \
> > +	INTEL_VGA_DEVICE(0x1926, info), /* ULT GT3e */ \
> > +	INTEL_VGA_DEVICE(0x1927, info)  /* ULT GT3e */
> >  
> >  #define INTEL_SKL_GT3_IDS(info) \
> >  	INTEL_SKL_ULT_GT3_IDS(info), \
> > -	INTEL_VGA_DEVICE(0x1923, info), /* ULT GT3 */ \
> > -	INTEL_VGA_DEVICE(0x1927, info), /* ULT GT3 */ \
> > -	INTEL_VGA_DEVICE(0x192B, info), /* Halo GT3 */ \
> > -	INTEL_VGA_DEVICE(0x192D, info)  /* SRV GT3 */
> > +	INTEL_VGA_DEVICE(0x192A, info), /* SRV GT3 */ \
> > +	INTEL_VGA_DEVICE(0x192B, info), /* Halo GT3e */ \
> > +	INTEL_VGA_DEVICE(0x192D, info)  /* SRV GT3e */
> >  
> >  #define INTEL_SKL_GT4_IDS(info) \
> >  	INTEL_VGA_DEVICE(0x1932, info), /* DT GT4 */ \
> > -	INTEL_VGA_DEVICE(0x193B, info), /* Halo GT4 */ \
> > -	INTEL_VGA_DEVICE(0x193D, info), /* WKS GT4 */ \
> > -	INTEL_VGA_DEVICE(0x192A, info), /* SRV GT4 */ \
> > -	INTEL_VGA_DEVICE(0x193A, info)  /* SRV GT4e */
> > +	INTEL_VGA_DEVICE(0x193A, info), /* SRV GT4e */ \
> > +	INTEL_VGA_DEVICE(0x193B, info), /* Halo GT4e */ \
> > +	INTEL_VGA_DEVICE(0x193D, info) /* WKS GT4e */
> >  
> >  #define INTEL_SKL_IDS(info)	 \
> >  	INTEL_SKL_GT1_IDS(info), \
> > @@ -403,8 +406,8 @@
> >  	INTEL_KBL_ULX_GT1_IDS(info), \
> >  	INTEL_VGA_DEVICE(0x5902, info), /* DT  GT1 */ \
> >  	INTEL_VGA_DEVICE(0x5908, info), /* Halo GT1 */ \
> > -	INTEL_VGA_DEVICE(0x590B, info), /* Halo GT1 */ \
> > -	INTEL_VGA_DEVICE(0x590A, info) /* SRV GT1 */
> > +	INTEL_VGA_DEVICE(0x590A, info), /* SRV GT1 */ \
> > +	INTEL_VGA_DEVICE(0x590B, info) /* Halo GT1 */
> >  
> >  #define INTEL_KBL_ULT_GT2_IDS(info) \
> >  	INTEL_VGA_DEVICE(0x5916, info), /* ULT GT2 */ \
> > @@ -416,10 +419,10 @@
> >  #define INTEL_KBL_GT2_IDS(info)	\
> >  	INTEL_KBL_ULT_GT2_IDS(info), \
> >  	INTEL_KBL_ULX_GT2_IDS(info), \
> > -	INTEL_VGA_DEVICE(0x5917, info), /* Mobile GT2 */ \
> >  	INTEL_VGA_DEVICE(0x5912, info), /* DT  GT2 */ \
> > -	INTEL_VGA_DEVICE(0x591B, info), /* Halo GT2 */ \
> > +	INTEL_VGA_DEVICE(0x5917, info), /* Mobile GT2 */ \
> >  	INTEL_VGA_DEVICE(0x591A, info), /* SRV GT2 */ \
> > +	INTEL_VGA_DEVICE(0x591B, info), /* Halo GT2 */ \
> >  	INTEL_VGA_DEVICE(0x591D, info) /* WKS GT2 */
> >  
> >  #define INTEL_KBL_ULT_GT3_IDS(info) \
> > @@ -444,10 +447,10 @@
> >  
> >  /* CML GT1 */
> >  #define INTEL_CML_GT1_IDS(info)	\
> > -	INTEL_VGA_DEVICE(0x9BA5, info), \
> > -	INTEL_VGA_DEVICE(0x9BA8, info), \
> > +	INTEL_VGA_DEVICE(0x9BA2, info), \
> >  	INTEL_VGA_DEVICE(0x9BA4, info), \
> > -	INTEL_VGA_DEVICE(0x9BA2, info)
> > +	INTEL_VGA_DEVICE(0x9BA5, info), \
> > +	INTEL_VGA_DEVICE(0x9BA8, info)
> >  
> >  #define INTEL_CML_U_GT1_IDS(info) \
> >  	INTEL_VGA_DEVICE(0x9B21, info), \
> > @@ -456,11 +459,11 @@
> >  
> >  /* CML GT2 */
> >  #define INTEL_CML_GT2_IDS(info)	\
> > -	INTEL_VGA_DEVICE(0x9BC5, info), \
> > -	INTEL_VGA_DEVICE(0x9BC8, info), \
> > -	INTEL_VGA_DEVICE(0x9BC4, info), \
> >  	INTEL_VGA_DEVICE(0x9BC2, info), \
> > +	INTEL_VGA_DEVICE(0x9BC4, info), \
> > +	INTEL_VGA_DEVICE(0x9BC5, info), \
> >  	INTEL_VGA_DEVICE(0x9BC6, info), \
> > +	INTEL_VGA_DEVICE(0x9BC8, info), \
> >  	INTEL_VGA_DEVICE(0x9BE6, info), \
> >  	INTEL_VGA_DEVICE(0x9BF6, info)
> >  
> > @@ -494,8 +497,8 @@
> >  	INTEL_VGA_DEVICE(0x3E9C, info)
> >  
> >  #define INTEL_CFL_H_GT2_IDS(info) \
> > -	INTEL_VGA_DEVICE(0x3E9B, info), /* Halo GT2 */ \
> > -	INTEL_VGA_DEVICE(0x3E94, info)  /* Halo GT2 */
> > +	INTEL_VGA_DEVICE(0x3E94, info),  /* Halo GT2 */ \
> > +	INTEL_VGA_DEVICE(0x3E9B, info) /* Halo GT2 */
> >  
> >  /* CFL U GT2 */
> >  #define INTEL_CFL_U_GT2_IDS(info) \
> > @@ -540,54 +543,57 @@
> >  
> >  /* CNL */
> >  #define INTEL_CNL_PORT_F_IDS(info) \
> > -	INTEL_VGA_DEVICE(0x5A54, info), \
> > -	INTEL_VGA_DEVICE(0x5A5C, info), \
> >  	INTEL_VGA_DEVICE(0x5A44, info), \
> > -	INTEL_VGA_DEVICE(0x5A4C, info)
> > +	INTEL_VGA_DEVICE(0x5A4C, info), \
> > +	INTEL_VGA_DEVICE(0x5A54, info), \
> > +	INTEL_VGA_DEVICE(0x5A5C, info)
> >  
> >  #define INTEL_CNL_IDS(info) \
> >  	INTEL_CNL_PORT_F_IDS(info), \
> > -	INTEL_VGA_DEVICE(0x5A51, info), \
> > -	INTEL_VGA_DEVICE(0x5A59, info), \
> > +	INTEL_VGA_DEVICE(0x5A40, info), \
> >  	INTEL_VGA_DEVICE(0x5A41, info), \
> > -	INTEL_VGA_DEVICE(0x5A49, info), \
> > -	INTEL_VGA_DEVICE(0x5A52, info), \
> > -	INTEL_VGA_DEVICE(0x5A5A, info), \
> >  	INTEL_VGA_DEVICE(0x5A42, info), \
> > +	INTEL_VGA_DEVICE(0x5A49, info), \
> >  	INTEL_VGA_DEVICE(0x5A4A, info), \
> >  	INTEL_VGA_DEVICE(0x5A50, info), \
> > -	INTEL_VGA_DEVICE(0x5A40, info)
> > +	INTEL_VGA_DEVICE(0x5A51, info), \
> > +	INTEL_VGA_DEVICE(0x5A52, info), \
> > +	INTEL_VGA_DEVICE(0x5A59, info), \
> > +	INTEL_VGA_DEVICE(0x5A5A, info)
> >  
> >  /* ICL */
> >  #define INTEL_ICL_PORT_F_IDS(info) \
> >  	INTEL_VGA_DEVICE(0x8A50, info), \
> > -	INTEL_VGA_DEVICE(0x8A5C, info), \
> > -	INTEL_VGA_DEVICE(0x8A59, info),	\
> > -	INTEL_VGA_DEVICE(0x8A58, info),	\
> >  	INTEL_VGA_DEVICE(0x8A52, info), \
> > +	INTEL_VGA_DEVICE(0x8A53, info), \
> > +	INTEL_VGA_DEVICE(0x8A54, info), \
> > +	INTEL_VGA_DEVICE(0x8A56, info), \
> > +	INTEL_VGA_DEVICE(0x8A57, info), \
> > +	INTEL_VGA_DEVICE(0x8A58, info),	\
> > +	INTEL_VGA_DEVICE(0x8A59, info),	\
> >  	INTEL_VGA_DEVICE(0x8A5A, info), \
> >  	INTEL_VGA_DEVICE(0x8A5B, info), \
> > -	INTEL_VGA_DEVICE(0x8A57, info), \
> > -	INTEL_VGA_DEVICE(0x8A56, info), \
> > -	INTEL_VGA_DEVICE(0x8A71, info), \
> > +	INTEL_VGA_DEVICE(0x8A5C, info), \
> >  	INTEL_VGA_DEVICE(0x8A70, info), \
> > -	INTEL_VGA_DEVICE(0x8A53, info), \
> > -	INTEL_VGA_DEVICE(0x8A54, info)
> > +	INTEL_VGA_DEVICE(0x8A71, info)
> >  
> >  #define INTEL_ICL_11_IDS(info) \
> >  	INTEL_ICL_PORT_F_IDS(info), \
> >  	INTEL_VGA_DEVICE(0x8A51, info), \
> >  	INTEL_VGA_DEVICE(0x8A5D, info)
> >  
> > -/* EHL/JSL */
> > +/* EHL */
> >  #define INTEL_EHL_IDS(info) \
> >  	INTEL_VGA_DEVICE(0x4500, info),	\
> >  	INTEL_VGA_DEVICE(0x4571, info), \
> >  	INTEL_VGA_DEVICE(0x4551, info), \
> >  	INTEL_VGA_DEVICE(0x4541, info), \
> > -	INTEL_VGA_DEVICE(0x4E71, info), \
> >  	INTEL_VGA_DEVICE(0x4557, info), \
> > -	INTEL_VGA_DEVICE(0x4555, info), \
> > +	INTEL_VGA_DEVICE(0x4555, info)
> > +
> > +/* JSL */
> > +#define INTEL_JSL_IDS(info) \
> > +	INTEL_VGA_DEVICE(0x4E71, info), \
> >  	INTEL_VGA_DEVICE(0x4E61, info), \
> >  	INTEL_VGA_DEVICE(0x4E57, info), \
> >  	INTEL_VGA_DEVICE(0x4E55, info), \
> > @@ -624,6 +630,9 @@
> >  
> >  /* DG1 */
> >  #define INTEL_DG1_IDS(info) \
> > -	INTEL_VGA_DEVICE(0x4905, info)
> > +	INTEL_VGA_DEVICE(0x4905, info), \
> > +	INTEL_VGA_DEVICE(0x4906, info), \
> > +	INTEL_VGA_DEVICE(0x4907, info), \
> > +	INTEL_VGA_DEVICE(0x4908, info)
> >  
> >  #endif /* _I915_PCIIDS_H */
> > -- 
> > 2.26.2.108.g048abe1751
> > 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
