Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B9F10E933
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Nov 2023 11:06:33 +0000 (UTC)
Message-ID: <ae6f034d-be74-5995-aa73-5a33a28bdd1f@intel.com>
Date: Fri, 10 Nov 2023 11:06:28 +0000
MIME-Version: 1.0
Content-Language: en-GB
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
References: <cover.1699647258.git.akshata.jahagirdar@intel.com>
 <39483ac499dfb72f44809147050d632498d4363d.1699647258.git.akshata.jahagirdar@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <39483ac499dfb72f44809147050d632498d4363d.1699647258.git.akshata.jahagirdar@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 3/5] lib/intel_pat : Add uc_comp
 pat_index
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, ayaz.siddiqui@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 10/11/2023 21:24, Akshata Jahagirdar wrote:
> Compression in XE2 is programmed through pat-index attribute. Add a dedicated pat-index for compression for XE2 and later platforms. The helper function returns uc_pat_index for previous platforms.
> 
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> ---
>   lib/intel_pat.c | 12 +++++++++++-
>   lib/intel_pat.h |  1 +
>   2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_pat.c b/lib/intel_pat.c
> index 2b892ee52..36f13642f 100644
> --- a/lib/intel_pat.c
> +++ b/lib/intel_pat.c
> @@ -11,7 +11,7 @@ struct intel_pat_cache {
>   	uint8_t uc; /* UC + COH_NONE */
>   	uint8_t wt; /* WT + COH_NONE */
>   	uint8_t wb; /* WB + COH_AT_LEAST_1WAY */
> -
> +	uint8_t uc_comp; /* UC + COH_NONE + COMPRESSION*/

Maybe prefix this with xe2? i.e xe2_uc_comp.

>   	uint8_t max_index;
>   };
>   
> @@ -23,6 +23,7 @@ static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
>   		pat->uc = 3;
>   		pat->wt = 15; /* Compressed + WB-transient */
>   		pat->wb = 2;
> +		pat->uc_comp = 12; /* Compressed + UC */
>   		pat->max_index = 31;
>   	} else if (IS_METEORLAKE(dev_id)) {
>   		pat->uc = 2;
> @@ -60,6 +61,15 @@ uint8_t intel_get_pat_idx_uc(int fd)
>   	return pat.uc;
>   }
>   
> +uint8_t intel_get_pat_idx_uc_comp(int fd)
> +{
> +	struct intel_pat_cache pat = {};
> +	uint16_t dev_id = intel_get_drm_devid(fd);
> +	
> +	intel_get_pat_idx(fd, &pat);
> +	return (intel_get_device_info(dev_id)->graphics_ver >= 20) ? pat.uc_comp : pat.uc;

Maybe make just make this xe2_get_pat_idx_uc_comp()? Or if we really do 
want to return plain uc on pre-xe2 then maybe make that clearer somehow 
in the api? intel_get_pat_idx_uc_comp_if_possible()? But perhaps caller 
should just handle this.

> +}
> +
>   uint8_t intel_get_pat_idx_wt(int fd)
>   {
>   	struct intel_pat_cache pat = {};
> diff --git a/lib/intel_pat.h b/lib/intel_pat.h
> index c24dbc275..6d68b9fc2 100644
> --- a/lib/intel_pat.h
> +++ b/lib/intel_pat.h
> @@ -13,6 +13,7 @@
>   uint8_t intel_get_max_pat_index(int fd);
>   
>   uint8_t intel_get_pat_idx_uc(int fd);
> +uint8_t intel_get_pat_idx_uc_comp(int fd);
>   uint8_t intel_get_pat_idx_wt(int fd);
>   uint8_t intel_get_pat_idx_wb(int fd);
>   
