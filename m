Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 3 Oct 2023 21:31:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20231004043130.GA53570@mdroper-desk1.amr.corp.intel.com>
References: <20231004031023.3444455-1-lucas.demarchi@intel.com>
 <20231004031023.3444455-9-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231004031023.3444455-9-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-xe] [PATCH i-g-t v2 08/13] lib/intel_mocs: Add
 Xe2 mocs indexes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Oct 03, 2023 at 08:10:18PM -0700, Lucas De Marchi wrote:
> Add WB and UC mocs indexes for Xe2 architecture and later.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  lib/intel_mocs.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_mocs.c b/lib/intel_mocs.c
> index 6a4ec25e4..d9de16932 100644
> --- a/lib/intel_mocs.c
> +++ b/lib/intel_mocs.c
> @@ -14,6 +14,8 @@
>  #define MTL_MOCS_WB_IDX				10
>  #define GEN12_MOCS_UC_IDX			3
>  #define GEN12_MOCS_WB_IDX			2
> +#define XE2_MOCS_UC_IDX				3
> +#define XE2_MOCS_WB_IDX				1

Wouldn't we want index 4 here (WB in both L3 and L4) rather than just
L3?


Matt

>  #define XY_BLOCK_COPY_BLT_MOCS_SHIFT		21
>  #define XY_CTRL_SURF_COPY_BLT_MOCS_SHIFT	25
>  
> @@ -33,7 +35,10 @@ static void get_mocs_index(int fd, struct drm_intel_mocs_index *mocs)
>  	 * This helper function is providing current UC as well
>  	 * as WB MOCS index based on platform.
>  	 */
> -	if (IS_METEORLAKE(devid)) {
> +	if (intel_graphics_ver(devid) >= IP_VER(20, 0)) {
> +		mocs->uc_index = XE2_MOCS_UC_IDX;
> +		mocs->wb_index = XE2_MOCS_WB_IDX;
> +	} else if (IS_METEORLAKE(devid)) {
>  		mocs->uc_index = MTL_MOCS_UC_IDX;
>  		mocs->wb_index = MTL_MOCS_WB_IDX;
>  	} else if (IS_DG2(devid)) {
> -- 
> 2.40.1
> 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
