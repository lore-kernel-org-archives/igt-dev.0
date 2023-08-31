Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 31 Aug 2023 12:21:50 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
Message-ID: <ZPA4hgy1NnZFI371@bvivekan-mobl>
References: <20230829141107.1505705-1-lucas.demarchi@intel.com>
 <20230829141107.1505705-3-lucas.demarchi@intel.com>
 <ZPA3tuQCuZkPKntS@bvivekan-mobl>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <ZPA3tuQCuZkPKntS@bvivekan-mobl>
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-xe] [PATCH igt 2/4] lib/intel_chipset: Add
 Lunar Lake support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 31.08.2023 12:18, Balasubramani Vivekanandan wrote:
> On 29.08.2023 07:11, Lucas De Marchi wrote:
> > Add basic definition for the Lunar Lake platform. This uses the PCI ID
> > from the xe_pciids.h which has a macro in a slighlty different form.
> > 
> > Going forward we could also trim down a little bit the the info struct
> > like was done in the kernel, relying on gmdid and IP version checks.
> > This is left for later.
> > 
> > Cc: Swati Sharma <swati2.sharma@intel.com>
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > ---
> >  lib/intel_chipset.h     |  5 +++++
> >  lib/intel_device_info.c | 12 ++++++++++++
> >  2 files changed, 17 insertions(+)
> > 
> > diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> > index 84cf1799e..52b15ccea 100644
> > --- a/lib/intel_chipset.h
> > +++ b/lib/intel_chipset.h
> > @@ -46,6 +46,7 @@ struct intel_device_info {
> >  	bool has_4tile : 1;
> >  	bool has_flatccs : 1;
> >  	bool has_oam : 1;
> > +	bool has_gmdid : 1;
> >  	bool is_mobile : 1;
> >  	bool is_whitney : 1;
> >  	bool is_almador : 1;
> > @@ -90,6 +91,7 @@ struct intel_device_info {
> >  	bool is_alderlake_n : 1;
> >  	bool is_meteorlake : 1;
> >  	bool is_pontevecchio : 1;
> > +	bool is_lunarlake : 1;
> >  	const struct intel_cmds_info *cmds_info;
> >  	const char *codename;
> >  };
> > @@ -203,6 +205,7 @@ void intel_check_pch(void);
> >  #define IS_ALDERLAKE_N(devid)	(intel_get_device_info(devid)->is_alderlake_n)
> >  #define IS_METEORLAKE(devid)	(intel_get_device_info(devid)->is_meteorlake)
> >  #define IS_PONTEVECCHIO(devid)	(intel_get_device_info(devid)->is_pontevecchio)
> > +#define IS_LUNARLAKE(devid)	(intel_get_device_info(devid)->is_lunarlake)
> >  
> >  #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
> >  #define AT_LEAST_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver >= x)
> > @@ -236,4 +239,6 @@ void intel_check_pch(void);
> >  
> >  #define HAS_OAM(devid)		(intel_get_device_info(devid)->has_oam)
> >  
> > +#define HAS_GMDID(devid)	(intel_get_device_info(devid)->has_gmdid)
> > +
> >  #endif /* _INTEL_CHIPSET_H */
> > diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> > index 5d53d2906..86a8b3650 100644
> > --- a/lib/intel_device_info.c
> > +++ b/lib/intel_device_info.c
> > @@ -504,6 +504,16 @@ static const struct intel_device_info intel_pontevecchio_info = {
> >  	.cmds_info = &gen12_pvc_cmds_info,
> >  };
> >  
> > +static const struct intel_device_info intel_lunarlake_info = {
> > +	.graphics_ver = 20,
> > +	.graphics_rel = 4,
> > +	.display_ver = 20,
> > +	.has_4tile = true,
> > +	.has_gmdid = true,
> 
> has_gmdid should be set true even for Meteorlake. If not in this patch,
> in a follow up.
> 
> Regards,
> Bala

Other than this comment,

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala

> 
> > +	.is_lunarlake = true,
> > +	.codename = "lunarlake"
> > +};
> > +
> >  static const struct pci_id_match intel_device_match[] = {
> >  	INTEL_I810_IDS(&intel_i810_info),
> >  	INTEL_I815_IDS(&intel_i815_info),
> > @@ -607,6 +617,8 @@ static const struct pci_id_match intel_device_match[] = {
> >  
> >  	INTEL_PVC_IDS(&intel_pontevecchio_info),
> >  
> > +	XE_LNL_IDS(INTEL_VGA_DEVICE, &intel_lunarlake_info),
> > +
> >  	INTEL_VGA_DEVICE(PCI_MATCH_ANY, &intel_generic_info),
> >  };
> >  
> > -- 
> > 2.40.1
> > 
