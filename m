Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E9E10E469
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Aug 2022 15:50:03 +0000 (UTC)
Message-ID: <cb814df8-f076-03e9-0238-e0ce9a7eb88d@quicinc.com>
Date: Wed, 31 Aug 2022 08:50:00 -0700
MIME-Version: 1.0
To: Rob Clark <robdclark@gmail.com>, <igt-dev@lists.freedesktop.org>
References: <20220828180525.887070-1-robdclark@gmail.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20220828180525.887070-1-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH igt] tests/kms_plane_multiple: Fix assumption
 about single primary plane
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 8/28/2022 11:05 AM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> When there are multiple primary planes (ie. a primary plane that can be
> moved to a different CRTC, we end up with a NULL entry in data->planes[]
> leading to a crash:
> 
>    #0  create_fb_for_mode_position (data=0x4203e0 <data>, output=0x4340a0, mode=0x4340c8, color=0x7fffffe2f0, rect_x=0x43ac60,
>        rect_y=0x43ab10, rect_w=0x42eca0, rect_h=0x42eca0, modifier=0, max_planes=3) at ../tests/kms_plane_multiple.c:158
>    #1  0x0000000000402790 in prepare_planes (data=0x4203e0 <data>, pipe_id=PIPE_A, color=0x7fffffe2f0, modifier=0, max_planes=3,
>        output=0x4340a0) at ../tests/kms_plane_multiple.c:265
>    #2  0x0000000000402930 in test_plane_position_with_output (data=0x4203e0 <data>, pipe=PIPE_A, output=0x4340a0, n_planes=3, modifier=0)
>        at ../tests/kms_plane_multiple.c:315
>    #3  0x0000000000402e74 in test_plane_position (data=0x4203e0 <data>, pipe=PIPE_A, modifier=0) at ../tests/kms_plane_multiple.c:380
>    #4  0x00000000004031b8 in run_tests_for_pipe (data=0x4203e0 <data>, pipe=PIPE_A) at ../tests/kms_plane_multiple.c:405
>    #5  0x0000000000403528 in __igt_unique____real_main448 () at ../tests/kms_plane_multiple.c:466
>    #6  0x00000000004033c0 in main (argc=1, argv=0x7fffffea68) at ../tests/kms_plane_multiple.c:448
> 
> But create_fb_for_mode_position() already checks and skips primary
> planes.  So just move where we initialize data->primary[i] to before we
> bail on the rest of the loop body.
> 
> (Plus bonus indentation fix)
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   tests/kms_plane_multiple.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
> index 1679f7ce..b43a4c27 100644
> --- a/tests/kms_plane_multiple.c
> +++ b/tests/kms_plane_multiple.c
> @@ -159,7 +159,7 @@ create_fb_for_mode_position(data_t *data, igt_output_t *output, drmModeModeInfo
>   			continue;
>   		igt_paint_color(cr, rect_x[i], rect_y[i],
>   				rect_w[i], rect_h[i], 0.0, 0.0, 0.0);
> -		}
> +	}
>   
>   	igt_put_cairo_ctx(cr);
>   }
> @@ -231,6 +231,8 @@ prepare_planes(data_t *data, enum pipe pipe_id, color_t *color,
>   		uint32_t plane_format;
>   		uint64_t plane_modifier;
>   
> +		data->plane[i] = plane;
> +
>   		if (plane->type == DRM_PLANE_TYPE_PRIMARY)
>   			continue;
>   		else if (plane->type == DRM_PLANE_TYPE_CURSOR)
> @@ -241,8 +243,6 @@ prepare_planes(data_t *data, enum pipe pipe_id, color_t *color,
>   		x[i] = rand() % (mode->hdisplay - size[i]);
>   		y[i] = rand() % (mode->vdisplay - size[i]);
>   
> -		data->plane[i] = plane;
> -
>   		plane_format = data->plane[i]->type == DRM_PLANE_TYPE_CURSOR ? DRM_FORMAT_ARGB8888 : DRM_FORMAT_XRGB8888;
>   		plane_modifier = data->plane[i]->type == DRM_PLANE_TYPE_CURSOR ? DRM_FORMAT_MOD_LINEAR : modifier;
>   
> -- 
> 2.37.2
> 
