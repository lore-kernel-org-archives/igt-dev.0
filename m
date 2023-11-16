Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A4D10E5CD
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Nov 2023 11:41:07 +0000 (UTC)
Date: Thu, 16 Nov 2023 12:41:02 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231116114102.uydfv6wkzyvt5fal@kamilkon-desk.igk.intel.com>
References: <cover.1700146980.git.akshata.jahagirdar@intel.com>
 <4cd8ceed162e23947f793769cb4363f9f624f8b0.1700146980.git.akshata.jahagirdar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4cd8ceed162e23947f793769cb4363f9f624f8b0.1700146980.git.akshata.jahagirdar@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/5] lib/intel_pat : Add uc_comp
 pat_index
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: matthew.auld@intel.com, ayaz.siddiqui@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Akshata,

regarding subject, remove space before ':'
[PATCH i-g-t 3/5] lib/intel_pat : Add uc_comp pat_index

should be:

[PATCH i-g-t 3/5] lib/intel_pat: Add uc_comp pat_index

Also when sending new version, add version number, for example
for version 2:

[PATCH i-g-t v2 3/5] lib/intel_pat: Add uc_comp pat_index

On 2023-11-16 at 07:38:30 -0800, Akshata Jahagirdar wrote:
> Compression in XE2 is programmed through pat-index attribute.
> Add a dedicated pat-index for compression for XE2 and later platforms.
> The caller to this helper function ensures GFX version is correct,
> else it will call the intel_uc_pat_index() function..

Two dots at end, remove one: s/\.\././

> 
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> ---
>  lib/intel_pat.c | 12 +++++++++++-
>  lib/intel_pat.h |  2 ++
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_pat.c b/lib/intel_pat.c
> index 2b892ee52..3c8043f59 100644
> --- a/lib/intel_pat.c
> +++ b/lib/intel_pat.c
> @@ -11,7 +11,7 @@ struct intel_pat_cache {
>  	uint8_t uc; /* UC + COH_NONE */
>  	uint8_t wt; /* WT + COH_NONE */
>  	uint8_t wb; /* WB + COH_AT_LEAST_1WAY */
> -
> +	uint8_t xe2_uc_comp; /* UC + COH_NONE + COMPRESSION*/
----------- ^^^
As you stated in description, xe2 or later, imho this should be "uc_comp"
and if you want you may add note about xe2 in comment, like:

	uint8_t uc_comp; /* UC + COH_NONE + COMPRESSION, xe2 and later */

>  	uint8_t max_index;
>  };
>  
> @@ -23,6 +23,7 @@ static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
>  		pat->uc = 3;
>  		pat->wt = 15; /* Compressed + WB-transient */
>  		pat->wb = 2;
> +		pat->xe2_uc_comp = 12; /* Compressed + UC */

		pat->uc_comp = 12; /* Compressed + UC */

>  		pat->max_index = 31;
>  	} else if (IS_METEORLAKE(dev_id)) {
>  		pat->uc = 2;
> @@ -60,6 +61,15 @@ uint8_t intel_get_pat_idx_uc(int fd)
>  	return pat.uc;
>  }
>  
> +uint8_t xe2_get_pat_idx_uc_comp(int fd)
---------- ^^^
imho should start with intel_, see note at header.

> +{
> +	struct intel_pat_cache pat = {};
> +	uint16_t dev_id = intel_get_drm_devid(fd);
------------ ^
Unused, did you want use it for checking xe2?

> +	
> +	intel_get_pat_idx(fd, &pat);

Put newline before return.

> +	return pat.xe2_uc_comp;

from description imho something like: IS_XE2_OR_ABOVE(dev_id) ? pat.uc_comp : pat.uc
or assert if < Xe2

> +}
> +
>  uint8_t intel_get_pat_idx_wt(int fd)
>  {
>  	struct intel_pat_cache pat = {};
> diff --git a/lib/intel_pat.h b/lib/intel_pat.h
> index c24dbc275..de929e16a 100644
> --- a/lib/intel_pat.h
> +++ b/lib/intel_pat.h
> @@ -16,4 +16,6 @@ uint8_t intel_get_pat_idx_uc(int fd);
>  uint8_t intel_get_pat_idx_wt(int fd);
>  uint8_t intel_get_pat_idx_wb(int fd);
>  
> +uint8_t xe2_get_pat_idx_uc_comp(int fd);
---------- ^^^^
Inconsistent, imho should start with intel_, so:

uint8_t intel_get_pat_idx_uc_comp(int fd);

Regards,
Kamil

> +
>  #endif /* INTEL_PAT_H */
> -- 
> 2.34.1
> 
