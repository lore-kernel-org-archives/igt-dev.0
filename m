Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 26 Sep 2023 15:45:36 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230926224536.GP2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
 <20230915132346.1845909-10-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230915132346.1845909-10-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-xe] [PATCH i-g-t 09/14] lib/igt_draw: Add Xe2
 mocs to XY_FAST_COLOR_BLT
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

On Fri, Sep 15, 2023 at 06:23:41AM -0700, Lucas De Marchi wrote:
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  lib/igt_draw.c  | 6 +++++-
>  lib/intel_reg.h | 1 +
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_draw.c b/lib/igt_draw.c
> index d7c3ac64c..9a7664a37 100644
> --- a/lib/igt_draw.c
> +++ b/lib/igt_draw.c
> @@ -716,7 +716,11 @@ static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
>  		}
>  
>  		pitch = tiling ? buf->stride / 4 : buf->stride;
> -		mocs = intel_get_uc_mocs_index(fd) << XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT;
> +
> +		if (ver >= 20)
> +			mocs = intel_get_uc_mocs_index(fd) << XE2_XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT;
> +		else
> +			mocs = intel_get_uc_mocs_index(fd) << XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT;
>  
>  		intel_bb_out(ibb, XY_FAST_COLOR_BLT | blt_cmd_depth);
>  		intel_bb_out(ibb, blt_cmd_tiling | mocs | (pitch-1));
> diff --git a/lib/intel_reg.h b/lib/intel_reg.h
> index f97154d2b..ea463376b 100644
> --- a/lib/intel_reg.h
> +++ b/lib/intel_reg.h
> @@ -2564,6 +2564,7 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
>  
>  #define XY_FAST_COLOR_BLT				((0x2<<29)|(0x44<<22)|0xe)
>  #define   XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT		22
> +#define   XE2_XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT	24
>  
>  #define XY_FAST_COPY_BLT				((2<<29)|(0x42<<22)|0x8)
>  /* dword 0 */
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
