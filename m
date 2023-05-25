Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB7110E6C3
 for <igt-dev@lists.freedesktop.org>; Thu, 25 May 2023 16:20:00 +0000 (UTC)
Date: Thu, 25 May 2023 09:19:54 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <janga.rahul.kumar@intel.com>
Message-ID: <20230525161954.GJ6250@mdroper-desk1.amr.corp.intel.com>
References: <20230517085817.4097456-1-janga.rahul.kumar@intel.com>
 <20230525161856.GI6250@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230525161856.GI6250@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/instdone: GEN12 INSTDONE
 initialization
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, May 25, 2023 at 09:18:59AM -0700, Matt Roper wrote:
> On Wed, May 17, 2023 at 02:28:17PM +0530, janga.rahul.kumar@intel.com wrote:
> > From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> > 
> > Add GEN12 INSTDONE initialization as per spec.
> > 
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> > ---
> >  lib/instdone.c | 69 +++++++++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 68 insertions(+), 1 deletion(-)
> > 
> > diff --git a/lib/instdone.c b/lib/instdone.c
> > index a83f8836..d1c92793 100644
> > --- a/lib/instdone.c
> > +++ b/lib/instdone.c
> > @@ -274,6 +274,30 @@
> >  # define GEN6_VS0_DONE			(1 << 1)
> >  # define GEN6_VF_DONE			(1 << 0)
> >  
> > +# define GEN12_TSG1_DONE		(1 << 24)
> > +# define GEN12_RCCFBC_CS_DONE		(1 << 23)
> > +# define GEN12_SDE_DONE			(1 << 22)
> > +# define GEN12_CS_DONE			(1 << 21)
> > +# define GEN12_RS_DONE			(1 << 20)
> > +# define GEN12_GAFD_DONE		(1 << 19)
> > +# define GEN12_GAFM_DONE		(1 << 18)
> > +# define GEN12_TSG0_DONE		(1 << 17)
> > +# define GEN12_VFE_DONE			(1 << 16)
> > +# define GEN12_GAFS_DONE		(1 << 15)
> > +# define GEN12_SVG_DONE			(1 << 14)
> > +# define GEN12_URBM_DONE		(1 << 13)
> > +# define GEN12_TDG0_DONE		(1 << 12)
> > +# define GEN12_TDG1_DONE		(1 << 11)
> > +# define GEN12_SF_DONE			(1 << 9)
> > +# define GEN12_CL_DONE			(1 << 8)
> > +# define GEN12_SOL_DONE			(1 << 7)
> > +# define GEN12_GS_DONE			(1 << 6)
> > +# define GEN12_DS_DONE			(1 << 5)
> > +# define GEN12_TE_DONE			(1 << 4)
> > +# define GEN12_HS_DONE			(1 << 3)
> > +# define GEN12_VS_DONE			(1 << 2)
> > +# define GEN12_VFG_DONE			(1 << 1)
> > +
> >  struct instdone_bit instdone_bits[MAX_INSTDONE_BITS];
> >  int num_instdone_bits = 0;
> >  
> > @@ -425,10 +449,53 @@ init_gen11_instdone(void)
> >  	init_gen8_instdone();
> >  }
> >  
> > +static void
> > +init_xehp_instdone(void)
> > +{
> > +	gen6_instdone1_bit(GEN12_RCCFBC_CS_DONE, "RCCFBC CS");
> > +	gen6_instdone1_bit(GEN12_CS_DONE, "CS");
> > +	gen6_instdone1_bit(GEN12_RS_DONE, "RS");
> > +	gen6_instdone1_bit(GEN12_VFE_DONE, "VFE");
> > +	gen6_instdone1_bit(GEN12_VFG_DONE, "VFG");
> > +}
> > +
> > +static void
> > +init_gen12_instdone(uint32_t devid)
> > +{
> > +	if (intel_graphics_ver(devid) >= IP_VER(12, 50)) {
> > +		init_xehp_instdone();
> 
> Rather than putting this inside the init_gen12_instdone function it
> would be better to add this to the top of the if/else ladder in
> init_instdone_definitions().  Even though Xe_HP platforms have a version
> number that starts with 12, they're not considered to be "gen12"
> platforms so putting it here is confusing.

Oh, and it might also be worth changing the patch title to
"lib/instdone: GEN12 and XEHP INSTDONE initialization" for similar
reasons.


Matt

> 
> Aside from that minor change,
> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> 
> > +	} else {
> > +		gen6_instdone1_bit(GEN12_TSG1_DONE, "TSG1");
> > +		gen6_instdone1_bit(GEN12_RCCFBC_CS_DONE, "RCCFBC CS");
> > +		gen6_instdone1_bit(GEN12_SDE_DONE, "SDE");
> > +		gen6_instdone1_bit(GEN12_CS_DONE, "CS");
> > +		gen6_instdone1_bit(GEN12_RS_DONE, "RS");
> > +		gen6_instdone1_bit(GEN12_GAFD_DONE, "GAFD");
> > +		gen6_instdone1_bit(GEN12_GAFM_DONE, "GAFM");
> > +		gen6_instdone1_bit(GEN12_TSG0_DONE, "TSG0");
> > +		gen6_instdone1_bit(GEN12_VFE_DONE, "VFE");
> > +		gen6_instdone1_bit(GEN12_GAFS_DONE, "GAFS");
> > +		gen6_instdone1_bit(GEN12_SVG_DONE, "SVG");
> > +		gen6_instdone1_bit(GEN12_URBM_DONE, "URBM");
> > +		gen6_instdone1_bit(GEN12_TDG0_DONE, "TDG0");
> > +		gen6_instdone1_bit(GEN12_TDG1_DONE, "TDG1");
> > +		gen6_instdone1_bit(GEN12_SF_DONE, "SF");
> > +		gen6_instdone1_bit(GEN12_CL_DONE, "CL");
> > +		gen6_instdone1_bit(GEN12_SOL_DONE, "SOL");
> > +		gen6_instdone1_bit(GEN12_GS_DONE, "GS");
> > +		gen6_instdone1_bit(GEN12_DS_DONE, "DS");
> > +		gen6_instdone1_bit(GEN12_TE_DONE, "TE");
> > +		gen6_instdone1_bit(GEN12_HS_DONE, "HS");
> > +		gen6_instdone1_bit(GEN12_VS_DONE, "VS");
> > +		gen6_instdone1_bit(GEN12_VFG_DONE, "VFG");
> > +	}
> > +}
> >  bool
> >  init_instdone_definitions(uint32_t devid)
> >  {
> > -	if (IS_GEN11(devid)) {
> > +	if (IS_GEN12(devid)) {
> > +		init_gen12_instdone(devid);
> > +	} else if (IS_GEN11(devid)) {
> >  		init_gen11_instdone();
> >  	} else if (IS_GEN8(devid) || IS_GEN9(devid) || IS_GEN10(devid)) {
> >  		init_gen8_instdone();
> > -- 
> > 2.25.1
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
