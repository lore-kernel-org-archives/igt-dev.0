Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E30311217A
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Apr 2022 07:45:14 +0000 (UTC)
Date: Fri, 22 Apr 2022 10:45:14 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Talla Raviteja Goud <ravitejax.goud.talla@intel.com>
Message-ID: <YmJdCqB1xcc7JtPU@platvala-desk.ger.corp.intel.com>
References: <20220421055819.3765382-1-ravitejax.goud.talla@intel.com>
 <20220421055819.3765382-2-ravitejax.goud.talla@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220421055819.3765382-2-ravitejax.goud.talla@intel.com>
Subject: Re: [igt-dev] [i-g-t, v2,
 2/2] lib/rpl_p: Add Raptor Lake P platform definition
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, tejaskumarx.surendrakumar.upadhyay@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Apr 21, 2022 at 11:28:19AM +0530, Talla Raviteja Goud wrote:
> From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> 
> Adding Raptor lake platform definitions
> 
> v2: Modifying intel_device_info.c in seperate commit (Petri)
>     Earlier changes done in i915_pciids.h commit
> 
> Signed-off-by: Adam Miszczak <adam.miszczak@intel.com>
> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> Signed-off-by: Raviteja Goud Talla <ravitejax.goud.talla@intel.com>

Acked-by: Petri Latvala <petri.latvala@intel.com>

but,


> ---
>  lib/intel_device_info.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index e55841df..0253a732 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -521,6 +521,7 @@ static const struct pci_id_match intel_device_match[] = {
>  	INTEL_ADLS_IDS(&intel_alderlake_s_info),
>  	INTEL_RPLS_IDS(&intel_raptorlake_s_info),
>  	INTEL_ADLP_IDS(&intel_alderlake_p_info),
> +	INTEL_RPLP_IDS(&intel_alderlake_p_info),
>  	INTEL_ADLN_IDS(&intel_alderlake_n_info),

Not necessary to do in this patch, but as also discussed internally,
this needs to be made consistent. RPL-P using ADL-P info but RPL-S
using RPL-S info. Either both use the corresponding ADL info struct or
neither, not this mix of in between.


-- 
Petri Latvala
