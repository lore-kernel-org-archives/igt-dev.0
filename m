Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CFE710E3E0
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Apr 2023 13:41:45 +0000 (UTC)
Date: Tue, 18 Apr 2023 15:41:41 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230418134141.lwhoce77zj3ct2jg@kamilkon-desk1>
References: <20230414210328.1153659-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230414210328.1153659-1-alex.hung@amd.com>
Subject: Re: [igt-dev] [PATCH] tests/kms_universal_plane: Enable
 sanity_test_pipe for all devices
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Alex,

On 2023-04-14 at 15:03:28 -0600, Alex Hung wrote:
> This subtest can run on non-i915 devices.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>  tests/kms_universal_plane.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index 114918d9..369e5665 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -377,7 +377,7 @@ sanity_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>  	igt_plane_t *primary;
>  	drmModeModeInfo *mode;
>  	int i;
> -	int expect;
> +	int expect = 0;
>  
>  	igt_require_pipe(&data->display, pipe);
>  
> @@ -400,9 +400,9 @@ sanity_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>  	 * doesn't cover CRTC (should fail on pre-gen9 and succeed on
>  	 * gen9+).
>  	 */
> -	igt_require_intel(data->drm_fd);
------- ^ --------- ^
>  	igt_plane_set_fb(primary, &test.undersized_fb);
> -	expect = (data->display_ver < 9) ? -EINVAL : 0;
> +	if (is_i915_device(data->drm_fd))
-------------- ^
Please use here is_intel_device()

> +		expect = (data->display_ver < 9) ? -EINVAL : 0;
>  	igt_assert(igt_display_try_commit2(&data->display, COMMIT_UNIVERSAL) == expect);
>  
>  	/* Same as above, but different plane positioning. */
> @@ -412,7 +412,8 @@ sanity_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>  	igt_plane_set_position(primary, 0, 0);
>  
>  	/* Try to use universal plane API to scale down (should fail on pre-gen9) */
> -	expect = (data->display_ver < 9) ? -ERANGE : 0;
> +	if (is_i915_device(data->drm_fd))
-------------- ^^^^
Same here.

Regards,
Kamil

> +		expect = (data->display_ver < 9) ? -ERANGE : 0;
>  	igt_assert(drmModeSetPlane(data->drm_fd, primary->drm_plane->plane_id,
>  				   output->config.crtc->crtc_id,
>  				   test.oversized_fb.fb_id, 0,
> -- 
> 2.40.0
> 
