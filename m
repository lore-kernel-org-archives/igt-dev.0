Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0091C6E083
 for <igt-dev@lists.freedesktop.org>; Mon, 31 May 2021 20:03:31 +0000 (UTC)
References: <20210524184252.1320366-1-markyacoub@chromium.org>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
Message-ID: <016acc5c-c171-28eb-2e88-e735ca1647d7@amd.com>
Date: Mon, 31 May 2021 16:03:28 -0400
In-Reply-To: <20210524184252.1320366-1-markyacoub@chromium.org>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/kms_atomic: Match overlay size with
 primary plane on amdgpu
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
To: Mark Yacoub <markyacoub@chromium.org>, igt-dev@lists.freedesktop.org
Cc: seanpaul@chromium.org, petri.latvala@intel.com, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>



On 2021-05-24 2:42 p.m., Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@google.com>
> 
> [Why]
> AMDGPU has a restriction of not allowing overlay planes that do
> not fully cover the primary plane when the cursor is enabled.
> Testing with an overlay smaller than primary fails the commit.
> 
> [How]
> On amdgpu, force the overlay size and src to match the primary plane, but
> test with a smaller size on all other platforms.

Hi Mark,

That's a nice patch, and I understand the background behind it. However, 
I don't think we need to change kms_atomic, mainly because we are not 
enabling cursor in this test. Also, I recently applied a patch for 
dealing with cursors in this situation; this test does not fail in the 
latest amd-staging-drm-next.

Thanks
Siqueira

> Signed-off-by: markyacoub@chromium.org
> ---
>   tests/kms_atomic.c | 26 ++++++++++++++++++++------
>   1 file changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> index df9c9df7..d5bfd38c 100644
> --- a/tests/kms_atomic.c
> +++ b/tests/kms_atomic.c
> @@ -491,13 +491,27 @@ plane_immutable_zpos(igt_display_t *display, igt_pipe_t *pipe,
>   	igt_remove_fb(display->drm_fd, &fb_upper);
>   }
>   
> -static void plane_overlay(igt_pipe_t *pipe, igt_output_t *output, igt_plane_t *plane)
> +static void plane_overlay(igt_pipe_t* pipe, igt_output_t* output, igt_plane_t* plane, int drm_fd)
>   {
>   	drmModeModeInfo *mode = igt_output_get_mode(output);
>   	uint32_t format = plane_get_igt_format(plane);
>   	struct igt_fb fb;
> -	uint32_t w = mode->hdisplay / 2;
> -	uint32_t h = mode->vdisplay / 2;
> +	uint32_t w, h, x, y;
> +
> +	/* On AMD, with hardware cursor, overlay plane must fully cover the primary plane.
> +	 * Test with smaller overlays on all other platforms. */
> +	if (is_amdgpu_device(drm_fd)) {
> +		w = mode->hdisplay;
> +		h = mode->vdisplay;
> +		x = 0;
> +		y = 0;
> +	}
> +	else {
> +		w = mode->hdisplay / 2;
> +		h = mode->vdisplay / 2;
> +		x = w / 2;
> +		y = h / 2;
> +	}
>   
>   	igt_require(format != 0);
>   
> @@ -505,7 +519,7 @@ static void plane_overlay(igt_pipe_t *pipe, igt_output_t *output, igt_plane_t *p
>   			      format, I915_TILING_NONE, &fb);
>   
>   	igt_plane_set_fb(plane, &fb);
> -	igt_plane_set_position(plane, w/2, h/2);
> +	igt_plane_set_position(plane, x, y);
>   
>   	/* Enable the overlay plane using the atomic API, and double-check
>   	 * state is what we think it should be. */
> @@ -519,7 +533,7 @@ static void plane_overlay(igt_pipe_t *pipe, igt_output_t *output, igt_plane_t *p
>   	/* Re-enable the plane through the legacy plane API, and verify through
>   	 * atomic. */
>   	igt_plane_set_fb(plane, &fb);
> -	igt_plane_set_position(plane, w/2, h/2);
> +	igt_plane_set_position(plane, x, y);
>   	plane_commit(plane, COMMIT_LEGACY, ATOMIC_RELAX_NONE);
>   
>   	/* Restore the plane to its original settings through the legacy plane
> @@ -1113,7 +1127,7 @@ igt_main
>   		igt_require(overlay);
>   
>   		atomic_setup(&display, pipe, output, primary, &fb);
> -		plane_overlay(pipe_obj, output, overlay);
> +		plane_overlay(pipe_obj, output, overlay, display.drm_fd);
>   	}
>   
>   	igt_describe("Test for KMS atomic modesetting on primary plane and ensure coherency between "
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
