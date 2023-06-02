Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C335E10E673
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Jun 2023 11:57:55 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-97460240863so97222566b.0
 for <igt-dev@lists.freedesktop.org>; Fri, 02 Jun 2023 04:57:55 -0700 (PDT)
Message-ID: <9c2a833e-2846-237b-3da2-45f6e807b969@gmail.com>
Date: Fri, 2 Jun 2023 14:57:48 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
References: <20230531074530.367036-1-swati2.sharma@intel.com>
 <20230531074530.367036-3-swati2.sharma@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20230531074530.367036-3-swati2.sharma@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v3 2/3] tests/kms_pipe_crc_basic: add
 nv12 crc sanity check
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 31.5.2023 10.45, Swati Sharma wrote:
> New CRC sanitycheck test case is added with NV12 format.
> kms_plane@pixel-format test is validating all formats.
> To improve BAT coverage we can have one planar format crc
> sanity test.
> 
> v2: -improved documentation (Bhanu)
> v3: -added check to skip format if not supported (CI)
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/kms_pipe_crc_basic.c | 50 ++++++++++++++++++++++++++------------
>   1 file changed, 35 insertions(+), 15 deletions(-)
> 
> diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
> index 84c73fd7..9ce9f5e5 100644
> --- a/tests/kms_pipe_crc_basic.c
> +++ b/tests/kms_pipe_crc_basic.c
> @@ -227,25 +227,31 @@ static void test_read_crc(data_t *data, enum pipe pipe,
>   }
>   
>   /**
> - * SUBTEST: compare-crc-sanitycheck
> - * Description: Basic sanity check for CRC mismatches
> + * SUBTEST: compare-crc-sanitycheck-%s
> + * Description: Basic sanity check for CRC mismatches with %arg[1]
>    * Test category: functionality test
>    * Run type: BAT
>    * Functionality: crc
>    * Mega feature: General Display Features
> + *
> + * arg[1]:
> + *
> + * @xr24:	XR24 format
> + * @nv12:	NV12 format
>    */
>   
>   /*
>    * CRC-sanity test, to make sure there would be no CRC mismatches
>    *
> - * - Create two framebuffers (FB0 & FB1) with same color info
> - * - Flip FB0 with the Primary plane & collect the CRC as ref CRC.
> - * - Flip FB1 with the Primary plane, collect the CRC & compare with
> + * - Create two framebuffers (FB0 & FB1).
> + * - Flip FB0 with the primary plane & collect the CRC as ref CRC.
> + * - Flip FB1 with the primary plane, collect the CRC & compare with
>    *   the ref CRC.
>    *
>    *   No CRC mismatch should happen
>    */
> -static void test_compare_crc(data_t *data, enum pipe pipe, igt_output_t *output)
> +static void test_compare_crc(data_t *data, enum pipe pipe, igt_output_t *output,
> +			     uint32_t plane_format)
>   {
>   	igt_display_t *display = &data->display;
>   	igt_plane_t *primary;
> @@ -259,7 +265,9 @@ static void test_compare_crc(data_t *data, enum pipe pipe, igt_output_t *output)
>   
>   	mode = igt_output_get_mode(output);
>   
> -	/* Create two framebuffers with the same color info. */
> +	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +	igt_skip_on(!igt_plane_has_format_mod(primary, plane_format, DRM_FORMAT_MOD_LINEAR));
> +
>   	igt_create_color_fb(data->drm_fd,
>   			mode->hdisplay, mode->vdisplay,
>   			DRM_FORMAT_XRGB8888,
> @@ -267,14 +275,12 @@ static void test_compare_crc(data_t *data, enum pipe pipe, igt_output_t *output)
>   			1.0, 1.0, 1.0,
>   			&fb0);
>   	igt_create_color_fb(data->drm_fd,
> -			mode->hdisplay, mode->vdisplay,
> -			DRM_FORMAT_XRGB8888,
> +			mode->hdisplay, mode->vdisplay, plane_format,
>   			DRM_FORMAT_MOD_LINEAR,
>   			1.0, 1.0, 1.0,
>   			&fb1);
>   
> -	/* Flip FB0 with the Primary plane & collect the CRC as ref CRC. */
> -	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +	/* Flip FB0 with the primary plane & collect the CRC as ref CRC. */
>   	igt_plane_set_fb(primary, &fb0);
>   	igt_display_commit(display);
>   
> @@ -282,7 +288,7 @@ static void test_compare_crc(data_t *data, enum pipe pipe, igt_output_t *output)
>   				    IGT_PIPE_CRC_SOURCE_AUTO);
>   	igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
>   
> -	/* Flip FB1 with the Primary plane & compare the CRC with ref CRC. */
> +	/* Flip FB1 with the primary plane & compare the CRC with ref CRC. */
>   	igt_plane_set_fb(primary, &fb1);
>   	igt_display_commit(display);
>   
> @@ -475,8 +481,22 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>   		}
>   	}
>   
> -	igt_describe("Basic sanity check for CRC mismatches");
> -	igt_subtest_with_dynamic("compare-crc-sanitycheck") {
> +	igt_describe("Basic sanity check for CRC mismatches with XR24 format");
> +	igt_subtest_with_dynamic("compare-crc-sanitycheck-xr24") {
> +		for_each_pipe_with_single_output(&data.display, pipe, output) {
> +			if (simulation_constraint(pipe))
> +				continue;
> +
> +			if(!pipe_output_combo_valid(&data.display, pipe, output))
> +				continue;
> +
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
> +				test_compare_crc(&data, pipe, output, DRM_FORMAT_XRGB8888);
> +		}
> +	}
> +
> +	igt_describe("Basic sanity check for CRC mismatches with NV12 format");
> +	igt_subtest_with_dynamic("compare-crc-sanitycheck-nv12") {
>   		for_each_pipe_with_single_output(&data.display, pipe, output) {
>   			if (simulation_constraint(pipe))
>   				continue;
> @@ -485,7 +505,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>   				continue;
>   
>   			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
> -				test_compare_crc(&data, pipe, output);
> +				test_compare_crc(&data, pipe, output, DRM_FORMAT_NV12);
>   		}
>   	}
>   
