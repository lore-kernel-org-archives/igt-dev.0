Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 26 Sep 2023 15:46:08 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230926224608.GQ2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
 <20230915132346.1845909-11-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230915132346.1845909-11-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-xe] [PATCH i-g-t 10/14] lib/intel_mocs: Remove
 unused lefotver defines
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

On Fri, Sep 15, 2023 at 06:23:42AM -0700, Lucas De Marchi wrote:
> Leftover from previous refactors. Remove since they are unused.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  lib/intel_mocs.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/lib/intel_mocs.c b/lib/intel_mocs.c
> index d9de16932..aafe27692 100644
> --- a/lib/intel_mocs.c
> +++ b/lib/intel_mocs.c
> @@ -16,8 +16,6 @@
>  #define GEN12_MOCS_WB_IDX			2
>  #define XE2_MOCS_UC_IDX				3
>  #define XE2_MOCS_WB_IDX				1
> -#define XY_BLOCK_COPY_BLT_MOCS_SHIFT		21
> -#define XY_CTRL_SURF_COPY_BLT_MOCS_SHIFT	25
>  
>  struct drm_intel_mocs_index {
>  	uint8_t uc_index;
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
