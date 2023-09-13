Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC6110E26D
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Sep 2023 15:15:15 +0000 (UTC)
Date: Wed, 13 Sep 2023 18:15:04 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <ZQHR+IwkP6dVqY1b@intel.com>
References: <20230913142417.584184-1-zbigniew.kempczynski@intel.com>
 <20230913142417.584184-3-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230913142417.584184-3-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/i915_pipe_stress: Remove
 stack variables
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Sep 13, 2023 at 04:24:17PM +0200, Zbigniew Kempczyński wrote:
> They are unused and what's worse unassigned. Get rid of them keeping
> x/y_rand only.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> ---
>  tests/intel/i915_pipe_stress.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/i915_pipe_stress.c b/tests/intel/i915_pipe_stress.c
> index 9ceb056a09..f9da5f0232 100644
> --- a/tests/intel/i915_pipe_stress.c
> +++ b/tests/intel/i915_pipe_stress.c
> @@ -241,7 +241,6 @@ static void *gpu_load(void *ptr)
>  	int frame_height;
>  	drmModeModeInfo *mode;
>  	int frame = 0;
> -	int x, y;
>  	int rect = 0, total_rects = 0;
>  	int pixels = 0;
>  
> @@ -273,8 +272,8 @@ static void *gpu_load(void *ptr)
>  			x_rand = hars_petruska_f54_1_random_unsafe_max(frame_width - rect_width);
>  			y_rand = hars_petruska_f54_1_random_unsafe_max(frame_height/2 - rect_height);
>  
> -			context->blt_rect.x = x + x_rand;
> -			context->blt_rect.y = y + y_rand;
> +			context->blt_rect.x = x_rand;
> +			context->blt_rect.y = y_rand;

Thanks for spotting,

Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

>  
>  			/* Fill randomly sized and positioned rectangles */
>  			fill_gpu(context, context->blt_rect.x, context->blt_rect.y,
> -- 
> 2.34.1
> 
