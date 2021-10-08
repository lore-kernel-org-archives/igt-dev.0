Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2087.outbound.protection.outlook.com [40.107.96.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39206E0EE
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Oct 2021 13:13:18 +0000 (UTC)
Message-ID: <0e625d08-85c3-71bd-8a4d-696f5368e4aa@amd.com>
Date: Fri, 8 Oct 2021 09:13:13 -0400
Content-Language: en-US
References: <20211008085917.393839-1-stylon.wang@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20211008085917.393839-1-stylon.wang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_hdr: Fix failure to read
 output_bpc
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Stylon Wang <stylon.wang@amd.com>, igt-dev@lists.freedesktop.org
Cc: nicholas.choi@amd.com, nicholas.kazlauskas@amd.com, rodrigo.siqueira@amd.com, contact@emersion.fr
List-ID: <igt-dev@lists.freedesktop.org>



On 2021-10-08 04:59, Stylon Wang wrote:
> The first commit with TEST_ONLY flag in bpc-switch subtests
> could fail the test, because previous state can be with any bpc
> or even wth no crtc assigned to the connector.
> 
> v2:
> - Keep the test commit for its original purpose of checking
>   if 512x512 plane size works for the hardware.
> - Add new atomic commit so the setting of 8 bpc really takes effect.
> 
> Signed-off-by: Stylon Wang <stylon.wang@amd.com>

Acked-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  tests/kms_hdr.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index 5b8529c8..273263db 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -213,16 +213,27 @@ static void test_bpc_switch_on_output(data_t *data, igt_output_t *output,
>  
>  		draw_hdr_pattern(&afb);
>  
> -		/* Start in 8bpc. */
> +		/* Plane may be required to fit fullscreen. Check it here and allow
> +		 * smaller plane size in following tests.
> +		 */
>  		igt_plane_set_fb(data->primary, &afb);
>  		igt_plane_set_size(data->primary, data->w, data->h);
> -		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
>  		ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
>  		if (!ret) {
>  			data->w = afb.width;
>  			data->h = afb.height;
>  		}
>  
> +		/* Start in 8bpc. */
> +		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
> +		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +		/*
> +		 * i915 driver doesn't expose max bpc as debugfs entry,
> +		 * so limiting assert only for amd driver.
> +		 */
> +		if (is_amdgpu_device(data->fd))
> +			assert_output_bpc(data, 8);
> +
>  		/*
>  		 * amdgpu requires a primary plane when the CRTC is enabled.
>  		 * However, some older Intel hardware (hsw) have scaling
> @@ -232,13 +243,6 @@ static void test_bpc_switch_on_output(data_t *data, igt_output_t *output,
>  		if (!is_amdgpu_device(data->fd))
>  			igt_plane_set_fb(data->primary, NULL);
>  
> -		/*
> -		 * i915 driver doesn't expose max bpc as debugfs entry,
> -		 * so limiting assert only for amd driver.
> -		 */
> -		if (is_amdgpu_device(data->fd))
> -			assert_output_bpc(data, 8);
> -
>  		/* Switch to 10bpc. */
>  		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
>  		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> 
