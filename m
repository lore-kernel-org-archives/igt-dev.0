Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 463E0CA0EE1
	for <igt-dev@archiver.kernel.org>; Fri, 30 Aug 2024 07:09:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED79810E81E;
	Fri, 30 Aug 2024 07:09:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BqWXBCvf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C1D10E81E
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Aug 2024 07:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725001750; x=1756537750;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4n6183a8DQFeopXAjUmyZdsyWaGOQx9oHad6Yef8Lng=;
 b=BqWXBCvfsWSbppE64wruqTb3XtC1D75kkqZbvikvVe2fEqjysdDUoKkJ
 qDFAjcz2WY04Zwlh6f82LRzD7hrH95imQ2qUjXKC6vLgPQOr1SppSy4pB
 bqGfFVxndcRFb4UhyL6wV/sPuT9vVYiEwjeudN60lmIunkgi5f3UIRJTh
 XFkcvQvzn3lszrlS6hiLGg40vBgcxVwYMcbiOT0oA21R13BuvEkV7r2Fw
 xqaRylOz4lRgDIju6Ir37WwHJZqyR9gd5Hny32s90gLg5VsxX7zml30OT
 JXAMcyavpsOORWiQ2MIdzrgDyYxsD+hwZQPi6Ju68bJbahNIuwRnWJkDa w==;
X-CSE-ConnectionGUID: wQpwxiwIQ/Gxt0dAseuhxQ==
X-CSE-MsgGUID: P+MAQOkkQyi70cYg134Gbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="27509829"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="27509829"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 00:09:10 -0700
X-CSE-ConnectionGUID: XG7xELPKSuCQln6lis112w==
X-CSE-MsgGUID: wmYi5zAQTHORwGxlXCNA7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="68651704"
Received: from swatish2-mobl2.gar.corp.intel.com (HELO [10.215.119.92])
 ([10.215.119.92])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 00:09:07 -0700
Message-ID: <68c65065-7cdc-41ab-bf3c-cafc1774d195@intel.com>
Date: Fri, 30 Aug 2024 12:39:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3] tests/kms_plane_scaling: Update scaling
 functions to return error codes
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, kunal1.joshi@intel.com, karthik.b.s@intel.com
References: <20240826045630.1340226-1-ramanaidu.naladala@intel.com>
 <20240826045630.1340226-2-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20240826045630.1340226-2-ramanaidu.naladala@intel.com>
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



On 26-Aug-24 10:26 AM, Naladala Ramanaidu wrote:
> This will ensures that the system can automatically find a suitable
> configuration, improving the robustness and flexibility of the
> testing process. Introduce a `ret` variable to capture the return
> value of scaling operations. Modify `check_scaling_pipe_plane_rot`
> to return an integer error code instead of void. Update
> `test_scaler_with_modifier_pipe`, `test_scaler_with_rotation_pipe`,
> and `test_scaler_with_pixel_format_pipe` to handle the returned
> error code. Add informative logs to indicate when a scaling operation
> is not supported on a specific output.
> 
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   tests/kms_plane_scaling.c | 250 +++++++++++++++++++++++---------------
>   1 file changed, 150 insertions(+), 100 deletions(-)
> 
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 42eb67409..588a9c5f0 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -566,7 +566,7 @@ static void cleanup_crtc(data_t *data)
>   	cleanup_fbs(data);
>   }
>   
> -static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
> +static int check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
>   					 uint32_t pixel_format,
>   					 uint64_t modifier,
>   					 double sf_plane,
> @@ -634,11 +634,7 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
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
> @@ -710,16 +706,17 @@ static const uint64_t modifiers[] = {
>   	I915_FORMAT_MOD_4_TILED
>   };
>   
> -static void test_scaler_with_modifier_pipe(data_t *d,
> -					   double sf_plane,
> -					   bool is_clip_clamp,
> -					   bool is_upscale,
> -					   enum pipe pipe,
> -					   igt_output_t *output)
> +static int test_scaler_with_modifier_pipe(data_t *d,
> +					  double sf_plane,
> +					  bool is_clip_clamp,
> +					  bool is_upscale,
> +					  enum pipe pipe,
> +					  igt_output_t *output)
>   {
>   	igt_display_t *display = &d->display;
>   	unsigned format = DRM_FORMAT_XRGB8888;
>   	igt_plane_t *plane;
> +	uint32_t ret;
>   
>   	cleanup_crtc(d);
>   
> @@ -733,18 +730,22 @@ static void test_scaler_with_modifier_pipe(data_t *d,
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
> +
>   	}
> +	return ret;
>   }
>   
> -static void test_scaler_with_rotation_pipe(data_t *d,
> +static int test_scaler_with_rotation_pipe(data_t *d,
>   					   double sf_plane,
>   					   bool is_clip_clamp,
>   					   bool is_upscale,
> @@ -755,6 +756,7 @@ static void test_scaler_with_rotation_pipe(data_t *d,
>   	unsigned format = DRM_FORMAT_XRGB8888;
>   	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
>   	igt_plane_t *plane;
> +	uint32_t ret;
>   
>   	cleanup_crtc(d);
>   
> @@ -768,18 +770,21 @@ static void test_scaler_with_rotation_pipe(data_t *d,
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
> +static int test_scaler_with_pixel_format_pipe(data_t *d, double sf_plane,
>   					       bool is_clip_clamp,
>   					       bool is_upscale,
>   					       enum pipe pipe,
> @@ -788,6 +793,7 @@ static void test_scaler_with_pixel_format_pipe(data_t *d, double sf_plane,
>   	igt_display_t *display = &d->display;
>   	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
>   	igt_plane_t *plane;
> +	uint32_t ret;
>   
>   	cleanup_crtc(d);
>   
> @@ -810,17 +816,21 @@ static void test_scaler_with_pixel_format_pipe(data_t *d, double sf_plane,
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
> @@ -1327,6 +1337,7 @@ static data_t data;
>   igt_main_args("", long_opts, help_str, opt_handler, &data)
>   {
>   	enum pipe pipe;
> +	uint32_t ret;
>   
>   	igt_fixture {
>   		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> @@ -1343,21 +1354,28 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
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
> +					igt_dynamic_f("pipe-%s",  kmstest_pipe_name(pipe)) {
> +						for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +							igt_info(" Trying on %s\n",
> +								   igt_output_name(output));
> +							if (!pipe_output_combo_valid(&data.display, pipe, output))
> +								continue;
> +							if (get_num_scalers(&data.display, pipe) < 1)
> +								continue;
> +							ret = test_scaler_with_pixel_format_pipe(&data,
>   									scaler_with_pixel_format_tests[index].sf,
>   									false,
>   									scaler_with_pixel_format_tests[index].is_upscale,
>   									pipe, output);
> +							if (ret == 0)
> +								break;
> +							igt_info("Required Scaling operation not supported on %s trying on next output\n",
> +								  igt_output_name(output));
>   						}
> -						break;
> +						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
> +							      "Unsupported scaling operation in driver with return value %s\n",
> +							      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
> +						igt_assert_eq(ret, 0);
>   					}
>   				}
>   			}
> @@ -1367,21 +1385,27 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
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
> +					igt_dynamic_f("pipe-%s",  kmstest_pipe_name(pipe)) {
> +						igt_info(" Trying on %s\n", igt_output_name(output));
> +						for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +							if (!pipe_output_combo_valid(&data.display, pipe, output))
> +								continue;
> +							if (get_num_scalers(&data.display, pipe) < 1)
> +								continue;
> +							ret = test_scaler_with_rotation_pipe(&data,
>   									scaler_with_rotation_tests[index].sf,
>   									false,
>   									scaler_with_rotation_tests[index].is_upscale,
>   									pipe, output);
> +							if (ret == 0)
> +								break;
> +							igt_info("Required Scaling operation not supported on %s trying on next output\n",
> +								  igt_output_name(output));

Add separate patch for additional debug prints. This patch should be 
restricted to error codes.

Same feedback implies to next patch.
>   						}
> -						break;
> +						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
> +							      "Unsupported scaling operation in driver with return value %s\n",
> +							      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
> +						igt_assert_eq(ret, 0);
>   					}
>   				}
>   			}
> @@ -1391,21 +1415,27 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
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
> +							igt_info(" Trying on %s\n", igt_output_name(output));
> +							if (!pipe_output_combo_valid(&data.display, pipe, output))
> +								continue;
> +							if (get_num_scalers(&data.display, pipe) < 1)
> +								continue;
> +							ret = test_scaler_with_modifier_pipe(&data,
>   									scaler_with_modifiers_tests[index].sf,
>   									false,
>   									scaler_with_modifiers_tests[index].is_upscale,
>   									pipe, output);
> +							if (ret == 0)
> +								break;
> +							igt_info("Required Scaling operation not supported on %s trying on next valid output\n",
> +								  igt_output_name(output));
>   						}
> -						break;
> +						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
> +							      "Unsupported scaling operation in driver with return value %s\n",
> +							      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
> +						igt_assert_eq(ret, 0);
>   					}
>   				}
>   			}
> @@ -1414,19 +1444,25 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
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
> -
> -						test_scaler_with_pixel_format_pipe(&data, 0.0, true,
> -										   false, pipe,
> -										   output);
> +				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
> +					for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +						igt_info(" Trying on %s\n", igt_output_name(output));
> +						if (!pipe_output_combo_valid(&data.display, pipe, output))
> +							continue;
> +						if (get_num_scalers(&data.display, pipe) < 1)
> +							continue;
> +						ret = test_scaler_with_pixel_format_pipe(&data, 0.0, true,
> +											 false, pipe,
> +											 output);
> +						if (ret == 0)
> +							break;
> +						igt_info("Required Scaling operation not supported on %s trying on next valid output\n",
> +							  igt_output_name(output));
>   					}
> -					break;
> +					igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
> +						      "Unsupported scaling operation in driver with return value %s\n",
> +						      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
> +					igt_assert_eq(ret, 0);
>   				}
>   			}
>   		}
> @@ -1434,19 +1470,26 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
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
> +						igt_info(" Trying on %s\n", igt_output_name(output));
> +						if (!pipe_output_combo_valid(&data.display, pipe, output))
> +							continue;
> +						if (get_num_scalers(&data.display, pipe) < 1)
> +							continue;
> +						ret = test_scaler_with_rotation_pipe(&data, 0.0, true,
> +										     false, pipe,
> +										     output);
> +						if (ret == 0)
> +							break;
> +						igt_info("Required Scaling operation not supported on %s trying on next valid output\n",
> +							  igt_output_name(output));
>   
> -						test_scaler_with_rotation_pipe(&data, 0.0, true,
> -										false, pipe,
> -										output);
>   					}
> -					break;
> +					igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
> +						      "Unsupported scaling operation in driver with return value %s\n",
> +						      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
> +					igt_assert_eq(ret, 0);
>   				}
>   			}
>   		}
> @@ -1454,18 +1497,25 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   		igt_describe("Tests scaling with clipping and clamping, modifiers.");
>   		igt_subtest_with_dynamic("plane-scaler-with-clipping-clamping-modifiers") {
>   			for_each_pipe(&data.display, pipe) {
> -				for_each_valid_output_on_pipe(&data.display, pipe, output) {
> -					if (!pipe_output_combo_valid(&data.display, pipe, output))
> -						continue;
> -					if (get_num_scalers(&data.display, pipe) < 1)
> -						continue;
> -
> -					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> -						test_scaler_with_modifier_pipe(&data, 0.0, true,
> -										false, pipe,
> -										output);
> +				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
> +					for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +						igt_info(" Trying on %s\n", igt_output_name(output));
> +						if (!pipe_output_combo_valid(&data.display, pipe, output))
> +							continue;
> +						if (get_num_scalers(&data.display, pipe) < 1)
> +							continue;
> +						ret = test_scaler_with_modifier_pipe(&data, 0.0, true,
> +										     false, pipe,
> +										     output);
> +						if (ret == 0)
> +							break;
> +						igt_info("Required Scaling operation not supported on %s trying on next valid output\n",
> +							  igt_output_name(output));
>   					}
> -					break;
> +					igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
> +						      "Unsupported scaling operation in driver with return value %s\n",
> +						      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
> +					igt_assert_eq(ret, 0);
>   				}
>   			}
>   		}
