Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB3110E178
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Dec 2023 09:19:12 +0000 (UTC)
Message-ID: <bd2c4ac0-ac65-4b7d-b77e-acd12ffd7c17@intel.com>
Date: Tue, 12 Dec 2023 09:19:07 +0000
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t v5 3/6] lib/intel_pat: Add uc_comp pat_index
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
References: <cover.1702402592.git.akshata.jahagirdar@intel.com>
 <938cceb1db7d0aeb62eda4e35d53e21ffb86a241.1702402592.git.akshata.jahagirdar@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <938cceb1db7d0aeb62eda4e35d53e21ffb86a241.1702402592.git.akshata.jahagirdar@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 12/12/2023 17:39, Akshata Jahagirdar wrote:
> Compression in XE2 is programmed through pat-index attribute.
> Add a dedicated pat-index for compression for XE2 and later platforms.
> The caller to this helper function ensures GFX version is correct.
> 
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> ---
>   lib/intel_pat.c | 14 +++++++++++++-
>   lib/intel_pat.h |  2 ++
>   2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_pat.c b/lib/intel_pat.c
> index 2b892ee52..8ec8b72a8 100644
> --- a/lib/intel_pat.c
> +++ b/lib/intel_pat.c
> @@ -11,7 +11,7 @@ struct intel_pat_cache {
>   	uint8_t uc; /* UC + COH_NONE */
>   	uint8_t wt; /* WT + COH_NONE */
>   	uint8_t wb; /* WB + COH_AT_LEAST_1WAY */
> -
> +	uint8_t uc_comp; /* UC + COH_NONE + COMPRESSION, XE2 and later*/
>   	uint8_t max_index;
>   };
>   
> @@ -23,6 +23,7 @@ static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
>   		pat->uc = 3;
>   		pat->wt = 15; /* Compressed + WB-transient */
>   		pat->wb = 2;
> +		pat->uc_comp = 12; /* Compressed + UC, XE2 and later */
>   		pat->max_index = 31;
>   	} else if (IS_METEORLAKE(dev_id)) {
>   		pat->uc = 2;
> @@ -60,6 +61,17 @@ uint8_t intel_get_pat_idx_uc(int fd)
>   	return pat.uc;
>   }
>   
> +uint8_t intel_get_pat_idx_uc_comp(int fd)
> +{
> +	struct intel_pat_cache pat = {};
> +
> +	uint16_t dev_id = intel_get_drm_devid(fd);

Nit: keep the declarations grouped together:

{
     struct intel_pat_cache pat = {};
     uint16_t dev_id = intel_get_drm_devid(fd);

     igt_assert(AT_LEAST_GEN(dev_id, 20));


With that,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +	igt_assert(AT_LEAST_GEN(dev_id, 20));
> +
> +	intel_get_pat_idx(fd, &pat);
> +	return pat.uc_comp;
> +}
> +
>   uint8_t intel_get_pat_idx_wt(int fd)
>   {
>   	struct intel_pat_cache pat = {};
> diff --git a/lib/intel_pat.h b/lib/intel_pat.h
> index c24dbc275..eb48cbc65 100644
> --- a/lib/intel_pat.h
> +++ b/lib/intel_pat.h
> @@ -16,4 +16,6 @@ uint8_t intel_get_pat_idx_uc(int fd);
>   uint8_t intel_get_pat_idx_wt(int fd);
>   uint8_t intel_get_pat_idx_wb(int fd);
>   
> +uint8_t intel_get_pat_idx_uc_comp(int fd);
> +
>   #endif /* INTEL_PAT_H */
