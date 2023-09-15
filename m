Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 15 Sep 2023 13:01:31 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230915200131.GI2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
 <20230915132346.1845909-6-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230915132346.1845909-6-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-xe] [PATCH i-g-t 05/14] lib/gpu_cmds: Reduce
 scope of xehp_fill_surface_state()
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

On Fri, Sep 15, 2023 at 06:23:37AM -0700, Lucas De Marchi wrote:
> gpu_cmds.h is the interface to other igt components: don't use it
> to declare functions not supposed to be used from outside.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  lib/gpu_cmds.c | 8 +++++++-
>  lib/gpu_cmds.h | 6 ------
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
> index 83d2302f9..e53580e65 100644
> --- a/lib/gpu_cmds.c
> +++ b/lib/gpu_cmds.c
> @@ -25,6 +25,12 @@
>  #include "gpu_cmds.h"
>  #include "intel_mocs.h"
>  
> +static uint32_t
> +xehp_fill_surface_state(struct intel_bb *ibb,
> +			struct intel_buf *buf,
> +			uint32_t format,
> +			int is_dst);
> +
>  uint32_t
>  gen7_fill_curbe_buffer_data(struct intel_bb *ibb, uint8_t color)
>  {
> @@ -873,7 +879,7 @@ xehp_fill_interface_descriptor(struct intel_bb *ibb,
>  	idd->desc5.num_threads_in_tg = 1;
>  }
>  
> -uint32_t
> +static uint32_t
>  xehp_fill_surface_state(struct intel_bb *ibb,
>  			struct intel_buf *buf,
>  			uint32_t format,
> diff --git a/lib/gpu_cmds.h b/lib/gpu_cmds.h
> index b7ed64f84..5ac007cc4 100644
> --- a/lib/gpu_cmds.h
> +++ b/lib/gpu_cmds.h
> @@ -116,12 +116,6 @@ xehp_fill_interface_descriptor(struct intel_bb *ibb,
>  			       size_t size,
>  			       struct xehp_interface_descriptor_data *idd);
>  
> -uint32_t
> -xehp_fill_surface_state(struct intel_bb *ibb,
> -			struct intel_buf *buf,
> -			uint32_t format,
> -			int is_dst);
> -
>  void
>  xehp_emit_state_compute_mode(struct intel_bb *ibb);
>  
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
