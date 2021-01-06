Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E4A89D30
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Jan 2021 03:56:40 +0000 (UTC)
References: <20210105111343.14332-1-juhapekka.heikkila@gmail.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <c6b76991-3a97-0732-d0c1-9949d4768142@intel.com>
Date: Wed, 6 Jan 2021 09:26:34 +0530
MIME-Version: 1.0
In-Reply-To: <20210105111343.14332-1-juhapekka.heikkila@gmail.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: reduce
 repetitive work per round
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 1/5/2021 4:43 PM, Juha-Pekka Heikkila wrote:
> create needed planes only when needed and not destroying them in between.
>
> This reduces execution time for clipping clamping dynamic tests on my ICL
> from 75s to 29s
>
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

LGTM.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

> ---
>   tests/kms_plane_scaling.c | 26 +++++++++++++-------------
>   1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 89b82416d..c63eb428f 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -483,19 +483,8 @@ test_plane_scaling_on_pipe(data_t *d, enum pipe pipe, igt_output_t *output)
>   }
>   
>   static void
> -__test_scaler_with_clipping_clamping_scenario(data_t *d, drmModeModeInfo *mode,
> -					      uint32_t f1, uint32_t f2)
> +__test_scaler_with_clipping_clamping_scenario(data_t *d, drmModeModeInfo *mode)
>   {
> -	cleanup_fbs(d);
> -
> -	igt_create_pattern_fb(d->drm_fd,
> -			      mode->hdisplay, mode->vdisplay, f1,
> -			      LOCAL_I915_FORMAT_MOD_X_TILED, &d->fb[1]);
> -
> -	igt_create_pattern_fb(d->drm_fd,
> -			      mode->hdisplay, mode->vdisplay, f2,
> -			      LOCAL_I915_FORMAT_MOD_Y_TILED, &d->fb[2]);
> -
>   	igt_plane_set_fb(d->plane1, &d->fb[1]);
>   	igt_plane_set_fb(d->plane2, &d->fb[2]);
>   
> @@ -549,6 +538,10 @@ test_scaler_with_clipping_clamping_scenario(data_t *d, enum pipe pipe, igt_outpu
>   
>   		igt_vec_init(&tested_formats2, sizeof(uint32_t));
>   
> +		igt_create_pattern_fb(d->drm_fd,
> +				      mode->hdisplay, mode->vdisplay, f1,
> +				      LOCAL_I915_FORMAT_MOD_X_TILED, &d->fb[1]);
> +
>   		for (int j = 0; j < d->plane2->drm_plane->count_formats; j++) {
>   			unsigned f2 = d->plane2->drm_plane->formats[j];
>   
> @@ -556,8 +549,15 @@ test_scaler_with_clipping_clamping_scenario(data_t *d, enum pipe pipe, igt_outpu
>   			    !can_scale(d, f2))
>   				continue;
>   
> -			__test_scaler_with_clipping_clamping_scenario(d, mode, f1, f2);
> +			igt_create_pattern_fb(d->drm_fd,
> +					      mode->hdisplay, mode->vdisplay, f2,
> +					      LOCAL_I915_FORMAT_MOD_Y_TILED,
> +					      &d->fb[2]);
> +
> +			__test_scaler_with_clipping_clamping_scenario(d, mode);
> +			igt_remove_fb(d->drm_fd, &d->fb[2]);
>   		}
> +		igt_remove_fb(d->drm_fd, &d->fb[1]);
>   
>   		igt_vec_fini(&tested_formats2);
>   	}


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
