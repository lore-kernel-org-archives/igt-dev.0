Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B04B1ECE582
	for <igt-dev@archiver.kernel.org>; Tue, 10 Sep 2024 07:06:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6766910E70D;
	Tue, 10 Sep 2024 07:06:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h9vwv1vs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5745F10E70D
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Sep 2024 07:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725951978; x=1757487978;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=am7yDcXS8Hokk7H2GB2hL5iFAFYkL8oY2ibpHwUaxM8=;
 b=h9vwv1vsLaHXm/HsaXvK9OsAsTFQrEpK4ANDBX1HJG3ZeygT4E0l/zkh
 RC62tGr1O0OGwcFYX53dIaTnY39I1Jqjjdi5ZAGO1ouws7lP691OiA0Z+
 bHKNlYuN8ReDDQ9svn3eXhu8kd/+6N9P7x2qgsvwUNh+VOE0vee3syVJz
 PkGnKTQIey4TuXMr+iKN3GFEhg+XEIZ7sH9Fli3jNoLyqhS88j8aRseSI
 1M5S+rCB21U1ZS7Eg7Y84GIF6qLhLnZnnSf7h8Txt8euL2wSpPR820WLg
 MiI1DYYm1yMbTwBB+CP4EyednfVmPU0qRflvavkl1Kt86Vl5bXRCBZFwx w==;
X-CSE-ConnectionGUID: LQNaeuEEQxud12LyZcMllg==
X-CSE-MsgGUID: ukZaL8ryTRyAU8RPwAj3mA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="36061616"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="36061616"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 00:06:18 -0700
X-CSE-ConnectionGUID: 7uWGpk3NR8GAW7yxh2AXjQ==
X-CSE-MsgGUID: 66Z43Kz8TaKsabK/GACcZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="71713892"
Received: from swatish2-mobl2.gar.corp.intel.com (HELO [10.213.87.71])
 ([10.213.87.71])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 00:06:16 -0700
Message-ID: <5e6be7cd-85e9-43b9-a025-662854df1458@intel.com>
Date: Tue, 10 Sep 2024 12:36:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 1/5] tests/kms_plane_scaling: Update scaling
 functions to return error codes
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240905145038.1569226-1-ramanaidu.naladala@intel.com>
 <20240905145038.1569226-2-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20240905145038.1569226-2-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Ramanaidu,


On 05-Sep-24 8:20 PM, Naladala Ramanaidu wrote:
> This will ensures that the system can automatically find a suitable
> configuration, improving the robustness and flexibility of the
> testing process. Introduce a `ret` variable to capture the return
> value of scaling operations. Modify `check_scaling_pipe_plane_rot`
> to return an integer error code instead of void. Update
> `test_scaler_with_modifier_pipe`, `test_scaler_with_rotation_pipe`,
> and `test_scaler_with_pixel_format_pipe` to handle the returned
> error code.
> 
> v1: fix crash issues.  (Swati)
> 
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   tests/kms_plane_scaling.c | 263 +++++++++++++++++++++-----------------
>   1 file changed, 148 insertions(+), 115 deletions(-)
> 
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 42eb67409..5c5837a51 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -566,15 +566,16 @@ static void cleanup_crtc(data_t *data)
>   	cleanup_fbs(data);
>   }
>   
> -static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
> -					 uint32_t pixel_format,
> -					 uint64_t modifier,
> -					 double sf_plane,
> -					 bool is_clip_clamp,
> -					 bool is_upscale,
> -					 enum pipe pipe,
> -					 igt_output_t *output,
> -					 igt_rotation_t rot)
> +static uint32_t
> +check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
> +			     uint32_t pixel_format,
> +			     uint64_t modifier,
> +			     double sf_plane,
> +			     bool is_clip_clamp,
> +			     bool is_upscale,
> +			     enum pipe pipe,
> +			     igt_output_t *output,
> +			     igt_rotation_t rot)
>   {
>   	igt_display_t *display = &d->display;
>   	drmModeModeInfo *mode;
> @@ -634,11 +635,7 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
>   		if (commit_ret == 0)
>   			break;
>   	}
> -
> -	igt_skip_on_f(commit_ret == -ERANGE || commit_ret == -EINVAL,
> -		      "Unsupported scaling operation in driver with return value %s\n",
> -		      (commit_ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
> -	igt_assert_eq(commit_ret, 0);
> +	return commit_ret;
>   }
>   
>   static const igt_rotation_t rotations[] = {
> @@ -710,16 +707,18 @@ static const uint64_t modifiers[] = {
>   	I915_FORMAT_MOD_4_TILED
>   };
>   
> -static void test_scaler_with_modifier_pipe(data_t *d,
> -					   double sf_plane,
> -					   bool is_clip_clamp,
> -					   bool is_upscale,
> -					   enum pipe pipe,
> -					   igt_output_t *output)
> +static uint32_t
> +test_scaler_with_modifier_pipe(data_t *d,
> +			       double sf_plane,
> +			       bool is_clip_clamp,
> +			       bool is_upscale,
> +			       enum pipe pipe,
> +			       igt_output_t *output)
>   {
>   	igt_display_t *display = &d->display;
>   	unsigned format = DRM_FORMAT_XRGB8888;
>   	igt_plane_t *plane;
> +	uint32_t ret;
>   
>   	cleanup_crtc(d);
>   
> @@ -733,28 +732,33 @@ static void test_scaler_with_modifier_pipe(data_t *d,
>   			uint64_t modifier = modifiers[i];
>   
>   			if (igt_plane_has_format_mod(plane, format, modifier))
> -				check_scaling_pipe_plane_rot(d, plane,
> -							     format, modifier,
> -							     sf_plane,
> -							     is_clip_clamp,
> -							     is_upscale,
> -							     pipe, output,
> -							     IGT_ROTATION_0);
> +				ret = check_scaling_pipe_plane_rot(d, plane,
> +								   format, modifier,
> +								   sf_plane,
> +								   is_clip_clamp,
> +								   is_upscale,
> +								   pipe, output,
> +								   IGT_ROTATION_0);
> +			if (ret != 0)
> +				return ret;
>   		}
>   	}
> +	return ret;
>   }
>   
> -static void test_scaler_with_rotation_pipe(data_t *d,
> -					   double sf_plane,
> -					   bool is_clip_clamp,
> -					   bool is_upscale,
> -					   enum pipe pipe,
> -					   igt_output_t *output)
> +static uint32_t
> +test_scaler_with_rotation_pipe(data_t *d,
> +			       double sf_plane,
> +			       bool is_clip_clamp,
> +			       bool is_upscale,
> +			       enum pipe pipe,
> +			       igt_output_t *output)
>   {
>   	igt_display_t *display = &d->display;
>   	unsigned format = DRM_FORMAT_XRGB8888;
>   	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
>   	igt_plane_t *plane;
> +	uint32_t ret;
>   
>   	cleanup_crtc(d);
>   
> @@ -768,26 +772,31 @@ static void test_scaler_with_rotation_pipe(data_t *d,
>   			igt_rotation_t rot = rotations[i];
>   
>   			if (igt_plane_has_rotation(plane, rot))
> -				check_scaling_pipe_plane_rot(d, plane,
> -							     format, modifier,
> -							     sf_plane,
> -							     is_clip_clamp,
> -							     is_upscale,
> -							     pipe, output,
> -							     rot);
> +				ret = check_scaling_pipe_plane_rot(d, plane,
> +								   format, modifier,
> +								   sf_plane,
> +								   is_clip_clamp,
> +								   is_upscale,
> +								   pipe, output,
> +								   rot);
> +			if (ret != 0)
> +				return ret;
>   		}
>   	}
> +	return ret;
>   }
>   
> -static void test_scaler_with_pixel_format_pipe(data_t *d, double sf_plane,
> -					       bool is_clip_clamp,
> -					       bool is_upscale,
> -					       enum pipe pipe,
> -					       igt_output_t *output)
> +static uint32_t
> +test_scaler_with_pixel_format_pipe(data_t *d, double sf_plane,
> +				   bool is_clip_clamp,
> +				   bool is_upscale,
> +				   enum pipe pipe,
> +				   igt_output_t *output)
>   {
>   	igt_display_t *display = &d->display;
>   	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
>   	igt_plane_t *plane;
> +	uint32_t ret;
>   
>   	cleanup_crtc(d);
>   
> @@ -810,17 +819,21 @@ static void test_scaler_with_pixel_format_pipe(data_t *d, double sf_plane,
>   			if (test_format(d, &tested_formats, format) &&
>   			    igt_plane_has_format_mod(plane, format, modifier) &&
>   			    can_scale(d, format))
> -			    check_scaling_pipe_plane_rot(d, plane,
> -							 format, modifier,
> -							 sf_plane,
> -							 is_clip_clamp,
> -							 is_upscale,
> -							 pipe, output,
> -							 IGT_ROTATION_0);
> +				ret = check_scaling_pipe_plane_rot(d, plane,
> +								   format, modifier,
> +								   sf_plane,
> +								   is_clip_clamp,
> +								   is_upscale,
> +								   pipe, output,
> +								   IGT_ROTATION_0);
> +			if (ret != 0) {
> +				igt_vec_fini(&tested_formats);
> +				return ret;
> +			}
>   		}
> -
>   		igt_vec_fini(&tested_formats);
>   	}
> +	return ret;
>   }
>   
>   static enum pipe
> @@ -1327,6 +1340,7 @@ static data_t data;
>   igt_main_args("", long_opts, help_str, opt_handler, &data)
>   {
>   	enum pipe pipe;
> +	uint32_t ret = -EINVAL;
>   
>   	igt_fixture {
>   		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> @@ -1343,21 +1357,23 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   			igt_describe(scaler_with_pixel_format_tests[index].describe);
>   			igt_subtest_with_dynamic(scaler_with_pixel_format_tests[index].name) {
>   				for_each_pipe(&data.display, pipe) {
> -					for_each_valid_output_on_pipe(&data.display, pipe, output) {
> -						if (!pipe_output_combo_valid(&data.display, pipe, output))
> -							continue;
> -						if (get_num_scalers(&data.display, pipe) < 1)
> -							continue;
> -
> -						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> -
> -							test_scaler_with_pixel_format_pipe(&data,
> +					igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
> +						for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +							if (!pipe_output_combo_valid(&data.display, pipe, output))
> +								continue;
> +							if (get_num_scalers(&data.display, pipe) < 1)
> +								continue;

Add a new line here.

With this fixed.
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

> +							ret = test_scaler_with_pixel_format_pipe(&data,
>   									scaler_with_pixel_format_tests[index].sf,
>   									false,
>   									scaler_with_pixel_format_tests[index].is_upscale,
>   									pipe, output);
> +							if (ret == 0)
> +								break;
>   						}
> -						break;
> +						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
> +							      "Unsupported scaling operation in driver with return value %s\n",
> +							      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
>   					}
>   				}
>   			}
> @@ -1367,21 +1383,24 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   			igt_describe(scaler_with_rotation_tests[index].describe);
>   			igt_subtest_with_dynamic(scaler_with_rotation_tests[index].name) {
>   				for_each_pipe(&data.display, pipe) {
> -					for_each_valid_output_on_pipe(&data.display, pipe, output) {
> -						if (!pipe_output_combo_valid(&data.display, pipe, output))
> -							continue;
> -						if (get_num_scalers(&data.display, pipe) < 1)
> -							continue;
> -
> -						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> -
> -							test_scaler_with_rotation_pipe(&data,
> +					igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
> +						for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +							if (!pipe_output_combo_valid(&data.display, pipe, output))
> +								continue;
> +							if (get_num_scalers(&data.display, pipe) < 1)
> +								continue;
> +
> +							ret = test_scaler_with_rotation_pipe(&data,
>   									scaler_with_rotation_tests[index].sf,
>   									false,
>   									scaler_with_rotation_tests[index].is_upscale,
>   									pipe, output);
> +							if (ret == 0)
> +								break;
>   						}
> -						break;
> +						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
> +							      "Unsupported scaling operation in driver with return value %s\n",
> +							      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
>   					}
>   				}
>   			}
> @@ -1391,21 +1410,24 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   			igt_describe(scaler_with_modifiers_tests[index].describe);
>   			igt_subtest_with_dynamic(scaler_with_modifiers_tests[index].name) {
>   				for_each_pipe(&data.display, pipe) {
> -					for_each_valid_output_on_pipe(&data.display, pipe, output) {
> -						if (!pipe_output_combo_valid(&data.display, pipe, output))
> -							continue;
> -						if (get_num_scalers(&data.display, pipe) < 1)
> -							continue;
> -
> -						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> -
> -							test_scaler_with_modifier_pipe(&data,
> +					igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
> +						for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +							if (!pipe_output_combo_valid(&data.display, pipe, output))
> +								continue;
> +							if (get_num_scalers(&data.display, pipe) < 1)
> +								continue;
> +
> +							ret = test_scaler_with_modifier_pipe(&data,
>   									scaler_with_modifiers_tests[index].sf,
>   									false,
>   									scaler_with_modifiers_tests[index].is_upscale,
>   									pipe, output);
> +							if (ret == 0)
> +								break;
>   						}
> -						break;
> +						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
> +							      "Unsupported scaling operation in driver with return value %s\n",
> +							      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
>   					}
>   				}
>   			}
> @@ -1414,39 +1436,46 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   		igt_describe("Tests scaling with clipping and clamping, pixel formats.");
>   		igt_subtest_with_dynamic("plane-scaler-with-clipping-clamping-pixel-formats") {
>   			for_each_pipe(&data.display, pipe) {
> -				for_each_valid_output_on_pipe(&data.display, pipe, output) {
> -					if (!pipe_output_combo_valid(&data.display, pipe, output))
> -						continue;
> -					if (get_num_scalers(&data.display, pipe) < 1)
> -						continue;
> -
> -					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> +				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
> +					for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +						if (!pipe_output_combo_valid(&data.display, pipe, output))
> +							continue;
> +						if (get_num_scalers(&data.display, pipe) < 1)
> +							continue;
>   
> -						test_scaler_with_pixel_format_pipe(&data, 0.0, true,
> -										   false, pipe,
> -										   output);
> +						ret = test_scaler_with_pixel_format_pipe(&data, 0.0, true,
> +											 false, pipe,
> +											 output);
> +						if (ret == 0)
> +							break;
>   					}
> -					break;
> +					igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
> +						      "Unsupported scaling operation in driver with return value %s\n",
> +						      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
>   				}
>   			}
>   		}
>   
> +
>   		igt_describe("Tests scaling with clipping and clamping, rotation.");
>   		igt_subtest_with_dynamic("plane-scaler-with-clipping-clamping-rotation") {
>   			for_each_pipe(&data.display, pipe) {
> -				for_each_valid_output_on_pipe(&data.display, pipe, output) {
> -					if (!pipe_output_combo_valid(&data.display, pipe, output))
> -						continue;
> -					if (get_num_scalers(&data.display, pipe) < 1)
> -						continue;
> -
> -					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> +				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
> +					for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +						if (!pipe_output_combo_valid(&data.display, pipe, output))
> +							continue;
> +						if (get_num_scalers(&data.display, pipe) < 1)
> +							continue;
>   
> -						test_scaler_with_rotation_pipe(&data, 0.0, true,
> -										false, pipe,
> -										output);
> +						ret = test_scaler_with_rotation_pipe(&data, 0.0, true,
> +										     false, pipe,
> +										     output);
> +						if (ret == 0)
> +							break;
>   					}
> -					break;
> +					igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
> +						      "Unsupported scaling operation in driver with return value %s\n",
> +						      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
>   				}
>   			}
>   		}
> @@ -1454,18 +1483,22 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   		igt_describe("Tests scaling with clipping and clamping, modifiers.");
>   		igt_subtest_with_dynamic("plane-scaler-with-clipping-clamping-modifiers") {
>   			for_each_pipe(&data.display, pipe) {
> -				for_each_valid_output_on_pipe(&data.display, pipe, output) {
> -					if (!pipe_output_combo_valid(&data.display, pipe, output))
> -						continue;
> -					if (get_num_scalers(&data.display, pipe) < 1)
> -						continue;
> +				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
> +					for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +						if (!pipe_output_combo_valid(&data.display, pipe, output))
> +							continue;
> +						if (get_num_scalers(&data.display, pipe) < 1)
> +							continue;
>   
> -					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> -						test_scaler_with_modifier_pipe(&data, 0.0, true,
> -										false, pipe,
> -										output);
> +						ret = test_scaler_with_modifier_pipe(&data, 0.0, true,
> +										     false, pipe,
> +										     output);
> +						if (ret == 0)
> +							break;
>   					}
> -					break;
> +					igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
> +						      "Unsupported scaling operation in driver with return value %s\n",
> +						      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
>   				}
>   			}
>   		}
