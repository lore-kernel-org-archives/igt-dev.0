Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D8310E9EF
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Jan 2023 11:30:42 +0000 (UTC)
Date: Fri, 13 Jan 2023 12:30:38 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jeevan B <jeevan.b@intel.com>
Message-ID: <20230113113038.w45bo3s2gg333l6g@zkempczy-mobl2>
References: <20230113091041.27032-1-jeevan.b@intel.com>
 <20230113091041.27032-3-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113091041.27032-3-jeevan.b@intel.com>
Subject: Re: [igt-dev] [PATCH 2/2] lib/igt_draw: Add MOCS values for MTL
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jan 13, 2023 at 02:40:41PM +0530, Jeevan B wrote:
> On MTL, we want the table entry labelled "UC (GO:Mem)"
> which has index 5.  This means that the MOCS value is 10.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  lib/i915/intel_mocs.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/i915/intel_mocs.c b/lib/i915/intel_mocs.c
> index df541ab0..95f0fbde 100644
> --- a/lib/i915/intel_mocs.c
> +++ b/lib/i915/intel_mocs.c
> @@ -11,6 +11,8 @@
>  #define DG1_MOCS_WB_IDX				5
>  #define DG2_MOCS_UC_IDX				1
>  #define DG2_MOCS_WB_IDX				3
> +#define MTL_MOCS_UC_IDX				5
> +#define MTL_MOCS_WB_IDX				10
>  #define GEN12_MOCS_UC_IDX			3
>  #define GEN12_MOCS_WB_IDX			2
>  #define XY_BLOCK_COPY_BLT_MOCS_SHIFT		21
> @@ -32,13 +34,15 @@ static void get_mocs_index(int fd, struct drm_i915_mocs_index *mocs)
>  	 * This helper function is providing current UC as well
>  	 * as WB MOCS index based on platform.
>  	 */
> -	if (IS_DG1(devid)) {
> -		mocs->uc_index = DG1_MOCS_UC_IDX;
> -		mocs->wb_index = DG1_MOCS_WB_IDX;

Is this reorder necessary? I would just add MTL else if condition
(unless you'll convince me it makes sense).

--
Zbigniew

> +	if (IS_METEORLAKE(devid)) {
> +		mocs->uc_index = MTL_MOCS_UC_IDX;
> +		mocs->wb_index = MTL_MOCS_WB_IDX;
>  	} else if (IS_DG2(devid)) {
>  		mocs->uc_index = DG2_MOCS_UC_IDX;
>  		mocs->wb_index = DG2_MOCS_WB_IDX;
> -
> +	} else if (IS_DG1(devid)) {
> +		mocs->uc_index = DG1_MOCS_UC_IDX;
> +		mocs->wb_index = DG1_MOCS_WB_IDX;
>  	} else if (IS_GEN12(devid)) {
>  		mocs->uc_index = GEN12_MOCS_UC_IDX;
>  		mocs->wb_index = GEN12_MOCS_WB_IDX;
> -- 
> 2.19.1
> 
