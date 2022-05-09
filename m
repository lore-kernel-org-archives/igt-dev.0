Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D083610F699
 for <igt-dev@lists.freedesktop.org>; Mon,  9 May 2022 18:47:59 +0000 (UTC)
Message-ID: <cc00306d-4e91-3f6a-0d8c-228d4cf0eead@amd.com>
Date: Mon, 9 May 2022 14:47:54 -0400
Content-Language: en-US
To: David Zhang <dingchen.zhang@amd.com>, igt-dev@lists.freedesktop.org
References: <20220505213226.2614662-1-dingchen.zhang@amd.com>
 <20220505213226.2614662-2-dingchen.zhang@amd.com>
From: Leo <sunpeng.li@amd.com>
In-Reply-To: <20220505213226.2614662-2-dingchen.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 1/4] tests/amdgpu/amd_psr: some fix for PSR-SU
 MPO test case
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 2022-05-05 17:32, David Zhang wrote:
> [why]
> Analogous to usermode behavior, when there are primary plane and
> overlay plane committed, alpha region of overlay corresponding to
> the primary plane position/size should be set to zero to explicitly
> display the content of primary plane (emulated as video playback in
> this test case) in general.
> 
> The input arguments of width/height of the helper to paint the
> framebuffer should not exceed the size of the created framebuffer.
> 
> [how]
> - set the alpha region of overlay plane framebuffer to zero aligned
>   to the position/size of the primary plane
> - paint the primary plane framebuffer background/foreground w/ the
>   valid width/height.
> 
> Cc: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Jay Pillai <aurabindo.pillai@amd.com>
> Cc: Wayne Lin <wayne.lin@amd.com>
> 
> Signed-off-by: David Zhang <dingchen.zhang@amd.com>
> ---
>  tests/amdgpu/amd_psr.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
> index b930b20e..5d190720 100644
> --- a/tests/amdgpu/amd_psr.c
> +++ b/tests/amdgpu/amd_psr.c
> @@ -351,9 +351,9 @@ static void run_check_psr_su_mpo(data_t *data)
>  		cr = igt_get_cairo_ctx(data->fd, &rect_fb[i]);
>  		igt_assert_f(cr, "Failed to get cairo context\n");
>  		/* background in black */
> -		igt_paint_color(cr, 0, 0, data->w, data->h, .0, .0, .0);
> +		igt_paint_color(cr, 0, 0, data->w / 2, data->h / 2, .0, .0, .0);
>  		/* foreground (megenta strip) */
> -		igt_paint_color(cr, i * strip_w, 0, strip_w, data->h, 1.0, .0, 1.0);
> +		igt_paint_color(cr, i * strip_w, 0, strip_w, data->h / 2, 1.0, .0, 1.0);
>  
>  		igt_put_cairo_ctx(cr);
>  	}
> @@ -364,8 +364,18 @@ static void run_check_psr_su_mpo(data_t *data)
>  	igt_plane_set_position(data->primary, 0, 0);
>  	igt_plane_set_size(data->primary, data->w / 2, data->h / 2);
>  
> -	/* adjust alpha for vpb (primary plane) region in overlay */
> -	draw_color_alpha(&ov_fb, 0, 0, data->w / 2, data->h / 2, .5, .5, .5, .3);
> +	/**
> +	 * adjust alpha for vpb (primary plane) region in overlay
> +	 * given alpha, we have:
> +	 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +	 *    blended = alpha * toplay + (1 - alpha) * underlay
> +	 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +	 * since primary plane is underlay while overlay plane is toplay, to
> +	 * display the content of primary plane w/ blending, we'd set the alpha
> +	 * of each pixel in overlay corresponding to primary plane position/size
> +	 * to be zero.
> +	 */

nit: do you mean s/toplay/overlay/ ?
With that fixed,

Reviewed-by: Leo Li <sunpeng.li@amd.com>

> +	draw_color_alpha(&ov_fb, 0, 0, data->w / 2, data->h / 2, .5, .5, .5, .0);
>  
>  	igt_output_set_pipe(data->output, data->pipe_id);
>  	igt_display_commit_atomic(&data->display, 0, NULL);
