Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC57D6E1E0
 for <igt-dev@lists.freedesktop.org>; Wed, 19 May 2021 05:40:59 +0000 (UTC)
References: <20210512170536.4778-1-bhanuprakash.modem@intel.com>
 <20210512170536.4778-9-bhanuprakash.modem@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Message-ID: <a15846fc-7b17-941e-dfce-2ace2ff751bc@intel.com>
Date: Wed, 19 May 2021 11:10:49 +0530
MIME-Version: 1.0
In-Reply-To: <20210512170536.4778-9-bhanuprakash.modem@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [v6 i-g-t 08/14] tests/kms_plane: Reset the state
 before exiting the test
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
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

These changes for resetting states make sense and are in line with other 
subtests of this IGT.

Looks good to me.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

On 5/12/2021 10:35 PM, Bhanuprakash Modem wrote:
> Before starting the next subtest, clean up the states to default
> values, those are assumed by other tests. This patch will also fix
> few typos & depricated macros.
>
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_plane.c | 15 +++++++++++----
>   1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 9fe253a8c..8ed168647 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -251,7 +251,11 @@ test_plane_position_with_output(data_t *data,
>   	igt_plane_set_fb(sprite, NULL);
>   
>   	/* reset the constraint on the pipe */
> -	igt_output_set_pipe(output, PIPE_ANY);
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> +
> +	igt_remove_fb(data->drm_fd, &primary_fb);
> +	igt_remove_fb(data->drm_fd, &sprite_fb);
>   }
>   
>   static void
> @@ -288,7 +292,7 @@ test_plane_position(data_t *data, enum pipe pipe, unsigned int flags)
>    *     (vdisplay, hdisplay) we do get the same CRC than the full blue fb.
>    */
>   static void
> -create_fb_for_mode__panning(data_t *data, drmModeModeInfo *mode,
> +create_fb_for_mode_panning(data_t *data, drmModeModeInfo *mode,
>   			    struct igt_fb *fb /* out */)
>   {
>   	unsigned int fb_id;
> @@ -334,7 +338,7 @@ test_plane_panning_with_output(data_t *data,
>   	mode = igt_output_get_mode(output);
>   	primary = igt_output_get_plane(output, 0);
>   
> -	create_fb_for_mode__panning(data, mode, &primary_fb);
> +	create_fb_for_mode_panning(data, mode, &primary_fb);
>   	igt_plane_set_fb(primary, &primary_fb);
>   
>   	if (flags & TEST_PANNING_TOP_LEFT)
> @@ -355,8 +359,11 @@ test_plane_panning_with_output(data_t *data,
>   	igt_plane_set_fb(primary, NULL);
>   
>   	/* reset states to neutral values, assumed by other tests */
> -	igt_output_set_pipe(output, PIPE_ANY);
> +	igt_output_set_pipe(output, PIPE_NONE);
>   	igt_fb_set_position(&primary_fb, primary, 0, 0);
> +	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> +
> +	igt_remove_fb(data->drm_fd, &primary_fb);
>   }
>   
>   static void
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
