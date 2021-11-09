Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B20289F85
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Nov 2021 18:14:16 +0000 (UTC)
Message-ID: <5abc06ee-c974-d924-3687-59a02427b77f@amd.com>
Date: Tue, 9 Nov 2021 13:14:10 -0500
Content-Language: en-US
References: <20211104162742.174363-1-contact@emersion.fr>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20211104162742.174363-1-contact@emersion.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/kms_plane_alpha_blend: skip coverage
 tests on missing enum
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Simon Ser <contact@emersion.fr>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 2021-11-04 12:27, Simon Ser wrote:
> Some KMS drivers support the KMS "pixel blend mode" plane property,
> but don't support the "Coverage" mode. This enum entry is missing
> to indicate lack of support as seen in this drm_info exerpt:
> 
>     "pixel blend mode": enum {None, Pre-multiplied} = Pre-multiplied
> 
> Skip the coverage tests in this case.

Is "coverage" interesting for compositors? We have the ability to do
pre-multiplied or coverage in HW but it's not hooked up currently.

Harry

> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> ---
>  tests/kms_plane_alpha_blend.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
> index 9e4ee22b43af..d061262da196 100644
> --- a/tests/kms_plane_alpha_blend.c
> +++ b/tests/kms_plane_alpha_blend.c
> @@ -419,7 +419,7 @@ static void coverage_7efc(data_t *data, enum pipe pipe, igt_plane_t *plane)
>  	igt_crc_t ref_crc = {}, crc = {};
>  	int i;
>  
> -	igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "Coverage");
> +	igt_require(igt_plane_try_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "Coverage"));
>  	igt_display_commit2(display, COMMIT_ATOMIC);
>  	igt_pipe_crc_start(data->pipe_crc);
>  
> @@ -451,7 +451,7 @@ static void coverage_premult_constant(data_t *data, enum pipe pipe, igt_plane_t
>  	if (plane->type != DRM_PLANE_TYPE_PRIMARY)
>  		igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[pipe], DRM_PLANE_TYPE_PRIMARY), &data->gray_fb);
>  
> -	igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "Coverage");
> +	igt_require(igt_plane_try_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "Coverage"));
>  	igt_plane_set_fb(plane, &data->argb_fb_cov_7e);
>  	igt_display_commit2(display, COMMIT_ATOMIC);
>  	igt_pipe_crc_start(data->pipe_crc);
> 
