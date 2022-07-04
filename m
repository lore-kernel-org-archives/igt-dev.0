Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA4B09EDAD
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Jul 2022 17:14:39 +0000 (UTC)
Message-ID: <c209ddaf-4acf-025c-f24e-d7c114b0564c@intel.com>
Date: Mon, 4 Jul 2022 22:44:05 +0530
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220630085523.291024-1-bhanuprakash.modem@intel.com>
 <20220630085523.291024-2-bhanuprakash.modem@intel.com>
 <YsMXrBugzMMS0Ao3@kamilkon-desk1>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <YsMXrBugzMMS0Ao3@kamilkon-desk1>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V7 1/2] tests/kms_color: Convert tests to
 dynamic
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

On Mon-04-07-2022 10:09 pm, Kamil Konieczny wrote:
> Hi Bhanuprakash,
> 
> On 2022-06-30 at 14:25:22 +0530, Bhanuprakash Modem wrote:
>> Convert the existing subtests to dynamic subtests at pipe level.
>>
>> V2:
>> * Fix nested igt_fixture in igt_subtest
>> V3:
>> * Fix to not dereferencing a NULL pointer
>> V4:
>> * Add output name to subtest
>> V5:
>> * Rebase
>> V6:
>> * Fix typos in test description
>> V7:
>> * Added comments back to ctm tets.
>>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>   tests/kms_color.c        | 556 +++++++++++++++++++++------------------
>>   tests/kms_color_helper.h |   1 +
>>   2 files changed, 298 insertions(+), 259 deletions(-)
>>
>> diff --git a/tests/kms_color.c b/tests/kms_color.c
>> index ba06947b..85f3b32d 100644
>> --- a/tests/kms_color.c
>> +++ b/tests/kms_color.c
>> @@ -203,7 +203,7 @@ static bool test_pipe_gamma(data_t *data,
>>    * gamma LUT and verify we have the same CRC as drawing solid color rectangles
>>    * with linear legacy gamma LUT.
>>    */
>> -static void test_pipe_legacy_gamma(data_t *data,
>> +static bool test_pipe_legacy_gamma(data_t *data,
>>   				   igt_plane_t *primary)
>>   {
>>   	igt_output_t *output;
>> @@ -220,6 +220,7 @@ static void test_pipe_legacy_gamma(data_t *data,
>>   	struct igt_fb fb_modeset, fb;
>>   	igt_crc_t crc_fullgamma, crc_fullcolors;
>>   	int fb_id, fb_modeset_id;
>> +	bool ret;
>>   
>>   	kms_crtc = drmModeGetCrtc(data->drm_fd, primary->pipe->crtc_id);
>>   	legacy_lut_size = kms_crtc->gamma_size;
>> @@ -285,7 +286,7 @@ static void test_pipe_legacy_gamma(data_t *data,
>>   	/* Verify that the CRC of the software computed output is
>>   	 * equal to the CRC of the gamma LUT transformation output.
>>   	 */
>> -	igt_assert_crc_equal(&crc_fullgamma, &crc_fullcolors);
>> +	ret = !igt_skip_crc_compare || igt_check_crc_equal(&crc_fullgamma, &crc_fullcolors);
>>   
>>   	/* Reset output. */
>>   	for (i = 1; i < legacy_lut_size; i++)
>> @@ -303,13 +304,15 @@ static void test_pipe_legacy_gamma(data_t *data,
>>   	free(red_lut);
>>   	free(green_lut);
>>   	free(blue_lut);
>> +
>> +	return ret;
>>   }
>>   
>>   /*
>>    * Verify that setting the legacy gamma LUT resets the gamma LUT set
>>    * through the GAMMA_LUT property.
>>    */
>> -static void test_pipe_legacy_gamma_reset(data_t *data,
>> +static bool test_pipe_legacy_gamma_reset(data_t *data,
>>   					 igt_plane_t *primary)
>>   {
>>   	const double ctm_identity[] = {
>> @@ -324,6 +327,7 @@ static void test_pipe_legacy_gamma_reset(data_t *data,
>>   	struct drm_color_lut *lut;
>>   	drmModePropertyBlobPtr blob;
>>   	igt_output_t *output;
>> +	bool ret = true;
>>   
>>   	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
>>   
>> @@ -373,10 +377,12 @@ static void test_pipe_legacy_gamma_reset(data_t *data,
>>   				    data->gamma_lut_size));
>>   	lut = (struct drm_color_lut *) blob->data;
>>   	for (i = 0; i < data->gamma_lut_size; i++)
>> -		igt_assert(lut[i].red == 0 &&
>> +		ret &=(lut[i].red == 0 &&
>>   			   lut[i].green == 0 &&
>>   			   lut[i].blue == 0);
>>   	drmModeFreePropertyBlob(blob);
>> +	if(!ret)
>> +		goto end;
>>   
>>   	/* Set a gamma LUT using the legacy ioctl and verify
>>   	 * the content of the GAMMA_LUT property is changed
>> @@ -411,7 +417,7 @@ static void test_pipe_legacy_gamma_reset(data_t *data,
>>   				    legacy_lut_size));
>>   	lut = (struct drm_color_lut *) blob->data;
>>   	for (i = 0; i < legacy_lut_size; i++)
>> -		igt_assert(lut[i].red == 0xffff &&
>> +		ret &= (lut[i].red == 0xffff &&
>>   			   lut[i].green == 0xffff &&
>>   			   lut[i].blue == 0xffff);
>>   	drmModeFreePropertyBlob(blob);
>> @@ -421,6 +427,8 @@ static void test_pipe_legacy_gamma_reset(data_t *data,
>>   
>>   	free_lut(degamma_linear);
>>   	free_lut(gamma_zero);
>> +end:
> 
> Should this be before free ?

Thanks Kamil,

It seems, Yes. You have great eyes :-)
I am fine if you want to submit a fix, else I'll do.

- Bhanu

> 
> Regards,
> Kamil
> 
>> +	return ret;
>>   }
>>   
>>   /*
>> @@ -677,130 +685,99 @@ prep_pipe(data_t *data, enum pipe p)
>>   	}
>>   }
>>   
>> -static void
>> -run_tests_for_pipe(data_t *data, enum pipe p)
>> +static void test_setup(data_t *data, enum pipe p)
>>   {
>>   	igt_pipe_t *pipe;
>> -	igt_plane_t *primary;
>> -	double delta;
>> -	int i;
>> -	color_t red_green_blue[] = {
>> -		{ 1.0, 0.0, 0.0 },
>> -		{ 0.0, 1.0, 0.0 },
>> -		{ 0.0, 0.0, 1.0 }
>> -	};
>>   
>> -	igt_fixture {
>> -		prep_pipe(data, p);
>> +	prep_pipe(data, p);
>> +	igt_require_pipe_crc(data->drm_fd);
>>   
>> -		igt_require_pipe_crc(data->drm_fd);
>> +	pipe = &data->display.pipes[p];
>> +	igt_require(pipe->n_planes >= 0);
>>   
>> -		pipe = &data->display.pipes[p];
>> -		igt_require(pipe->n_planes >= 0);
>> +	data->primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>> +	data->pipe_crc = igt_pipe_crc_new(data->drm_fd,
>> +					  data->primary->pipe->pipe,
>> +					  INTEL_PIPE_CRC_SOURCE_AUTO);
>>   
>> -		primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>> +	igt_display_require_output_on_pipe(&data->display, p);
>> +	data->output = igt_get_single_output_for_pipe(&data->display, p);
>> +	igt_require(data->output);
>> +}
>>   
>> -		data->pipe_crc = igt_pipe_crc_new(data->drm_fd,
>> -						  primary->pipe->pipe,
>> -						  INTEL_PIPE_CRC_SOURCE_AUTO);
>> +static void test_cleanup(data_t *data)
>> +{
>> +	igt_plane_t *primary = data->primary;
>>   
>> -		igt_display_require_output_on_pipe(&data->display, p);
>> -		data->output = igt_get_single_output_for_pipe(&data->display, p);
>> -		igt_require(data->output);
>> -	}
>> +	disable_degamma(primary->pipe);
>> +	disable_gamma(primary->pipe);
>> +	disable_ctm(primary->pipe);
>> +	igt_display_commit(&data->display);
>> +
>> +	igt_pipe_crc_free(data->pipe_crc);
>> +	data->pipe_crc = NULL;
>> +}
>> +
>> +static void
>> +run_gamma_degamma_tests_for_pipe(data_t *data, enum pipe p,
>> +				 bool (*test_t)(data_t*, igt_plane_t*))
>> +{
>> +	test_setup(data, p);
>>   
>>   	/* We assume an 8bits depth per color for degamma/gamma LUTs
>>   	 * for CRC checks with framebuffer references. */
>>   	data->color_depth = 8;
>> -	delta = 1.0 / (1 << data->color_depth);
>>   	data->drm_format = DRM_FORMAT_XRGB8888;
>>   
>> -	igt_describe("Check the color transformation from red to blue");
>> -	igt_subtest_f("pipe-%s-ctm-red-to-blue", kmstest_pipe_name(p)) {
>> -		color_t blue_green_blue[] = {
>> -			{ 0.0, 0.0, 1.0 },
>> -			{ 0.0, 1.0, 0.0 },
>> -			{ 0.0, 0.0, 1.0 }
>> -		};
>> -		double ctm[] = { 0.0, 0.0, 0.0,
>> -				0.0, 1.0, 0.0,
>> -				1.0, 0.0, 1.0 };
>> -		igt_assert(test_pipe_ctm(data, primary, red_green_blue,
>> -					 blue_green_blue, ctm));
>> -	}
>> +	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), data->output->name)
>> +		igt_assert(test_t(data, data->primary));
>>   
>> -	igt_describe("Check the color transformation from green to red");
>> -	igt_subtest_f("pipe-%s-ctm-green-to-red", kmstest_pipe_name(p)) {
>> -		color_t red_red_blue[] = {
>> -			{ 1.0, 0.0, 0.0 },
>> -			{ 1.0, 0.0, 0.0 },
>> -			{ 0.0, 0.0, 1.0 }
>> -		};
>> -		double ctm[] = { 1.0, 1.0, 0.0,
>> -				0.0, 0.0, 0.0,
>> -				0.0, 0.0, 1.0 };
>> -		igt_assert(test_pipe_ctm(data, primary, red_green_blue,
>> -					 red_red_blue, ctm));
>> -	}
>> +	test_cleanup(data);
>> +}
>>   
>> -	igt_describe("Check the color transformation from blue to red");
>> -	igt_subtest_f("pipe-%s-ctm-blue-to-red", kmstest_pipe_name(p)) {
>> -		color_t red_green_red[] = {
>> -			{ 1.0, 0.0, 0.0 },
>> -			{ 0.0, 1.0, 0.0 },
>> -			{ 1.0, 0.0, 0.0 }
>> -		};
>> -		double ctm[] = { 1.0, 0.0, 1.0,
>> -				0.0, 1.0, 0.0,
>> -				0.0, 0.0, 0.0 };
>> -		igt_assert(test_pipe_ctm(data, primary, red_green_blue,
>> -					 red_green_red, ctm));
>> -	}
>> +static void
>> +run_ctm_tests_for_pipe(data_t *data, enum pipe p,
>> +		       color_t *expected_colors,
>> +		       double *ctm,
>> +		       int iter)
>> +{
>> +	double delta;
>> +	color_t red_green_blue[] = {
>> +		{ 1.0, 0.0, 0.0 },
>> +		{ 0.0, 1.0, 0.0 },
>> +		{ 0.0, 0.0, 1.0 }
>> +	};
>>   
>> -	/* We tests a few values around the expected result because
>> -	 * the it depends on the hardware we're dealing with, we can
>> -	 * either get clamped or rounded values and we also need to
>> -	 * account for odd number of items in the LUTs. */
>> -	igt_describe("Check the color transformation for 0.25 transparency");
>> -	igt_subtest_f("pipe-%s-ctm-0-25", kmstest_pipe_name(p)) {
>> -		color_t expected_colors[] = {
>> -			{ 0.0, }, { 0.0, }, { 0.0, }
>> -		};
>> -		double ctm[] = { 0.25, 0.0,  0.0,
>> -				 0.0,  0.25, 0.0,
>> -				 0.0,  0.0,  0.25 };
>> -		bool success = false;
>> +	test_setup(data, p);
>>   
>> -		for (i = 0; i < 5; i++) {
>> -			expected_colors[0].r =
>> -				expected_colors[1].g =
>> -				expected_colors[2].b =
>> -				0.25 + delta * (i - 2);
>> -			if (test_pipe_ctm(data, primary, red_green_blue,
>> -					  expected_colors, ctm)) {
>> -				success = true;
>> -				break;
>> -			}
>> -		}
>> -		igt_assert(success);
>> -	}
>> +	/*
>> +	 * We assume an 8bits depth per color for degamma/gamma LUTs
>> +	 * for CRC checks with framebuffer references.
>> +	 */
>> +	data->color_depth = 8;
>> +	delta = 1.0 / (1 << data->color_depth);
>> +	data->drm_format = DRM_FORMAT_XRGB8888;
>>   
>> -	igt_describe("Check the color transformation for 0.5 transparency");
>> -	igt_subtest_f("pipe-%s-ctm-0-5", kmstest_pipe_name(p)) {
>> -		color_t expected_colors[] = {
>> -			{ 0.0, }, { 0.0, }, { 0.0, }
>> -		};
>> -		double ctm[] = { 0.5, 0.0, 0.0,
>> -				 0.0, 0.5, 0.0,
>> -				 0.0, 0.0, 0.5 };
>> +	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), data->output->name) {
>>   		bool success = false;
>> +		int i;
>>   
>> -		for (i = 0; i < 5; i++) {
>> +		if (!iter)
>> +			success = test_pipe_ctm(data, data->primary, red_green_blue,
>> +						expected_colors, ctm);
>> +
>> +		/*
>> +		 * We tests a few values around the expected result because
>> +		 * it depends on the hardware we're dealing with, we can either
>> +		 * get clamped or rounded values and we also need to account
>> +		 * for odd number of items in the LUTs.
>> +		 */
>> +		for (i = 0; i < iter; i++) {
>>   			expected_colors[0].r =
>>   				expected_colors[1].g =
>>   				expected_colors[2].b =
>>   				0.5 + delta * (i - 2);
>> -			if (test_pipe_ctm(data, primary, red_green_blue,
>> +			if (test_pipe_ctm(data, data->primary, red_green_blue,
>>   					  expected_colors, ctm)) {
>>   				success = true;
>>   				break;
>> @@ -809,186 +786,249 @@ run_tests_for_pipe(data_t *data, enum pipe p)
>>   		igt_assert(success);
>>   	}
>>   
>> -	igt_describe("Check the color transformation for 0.75 transparency");
>> -	igt_subtest_f("pipe-%s-ctm-0-75", kmstest_pipe_name(p)) {
>> -		color_t expected_colors[] = {
>> -			{ 0.0, }, { 0.0, }, { 0.0, }
>> -		};
>> -		double ctm[] = { 0.75, 0.0,  0.0,
>> -				 0.0,  0.75, 0.0,
>> -				 0.0,  0.0,  0.75 };
>> -		bool success = false;
>> -
>> -		for (i = 0; i < 7; i++) {
>> -			expected_colors[0].r =
>> -				expected_colors[1].g =
>> -				expected_colors[2].b =
>> -				0.75 + delta * (i - 3);
>> -			if (test_pipe_ctm(data, primary, red_green_blue,
>> -						expected_colors, ctm)) {
>> -				success = true;
>> -				break;
>> -			}
>> -		}
>> -		igt_assert(success);
>> -	}
>> +	test_cleanup(data);
>> +}
>>   
>> -	igt_describe("Check the color transformation for maximum transparency");
>> -	igt_subtest_f("pipe-%s-ctm-max", kmstest_pipe_name(p)) {
>> -		color_t full_rgb[] = {
>> -			{ 1.0, 0.0, 0.0 },
>> -			{ 0.0, 1.0, 0.0 },
>> -			{ 0.0, 0.0, 1.0 }
>> -		};
>> -		double ctm[] = { 100.0,   0.0,   0.0,
>> -				 0.0,   100.0,   0.0,
>> -				 0.0,     0.0, 100.0 };
>> -
>> -		/* CherryView generates values on 10bits that we
>> -		 * produce with an 8 bits per color framebuffer. */
>> -		igt_require(!IS_CHERRYVIEW(data->devid));
>> -
>> -		igt_assert(test_pipe_ctm(data, primary, red_green_blue,
>> -					 full_rgb, ctm));
>> -	}
>> +static void
>> +run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
>> +{
>> +	igt_output_t *output;
>> +	color_t blue_green_blue[] = {
>> +		{ 0.0, 0.0, 1.0 },
>> +		{ 0.0, 1.0, 0.0 },
>> +		{ 0.0, 0.0, 1.0 }
>> +	};
>> +	color_t red_green_blue[] = {
>> +		{ 1.0, 0.0, 0.0 },
>> +		{ 0.0, 1.0, 0.0 },
>> +		{ 0.0, 0.0, 1.0 }
>> +	};
>> +	double ctm[] = { 0.0, 0.0, 0.0,
>> +			 0.0, 1.0, 0.0,
>> +			 1.0, 0.0, 1.0 };
>>   
>> -	igt_describe("Check the color transformation for negative transparency");
>> -	igt_subtest_f("pipe-%s-ctm-negative", kmstest_pipe_name(p)) {
>> -		color_t all_black[] = {
>> -			{ 0.0, 0.0, 0.0 },
>> -			{ 0.0, 0.0, 0.0 },
>> -			{ 0.0, 0.0, 0.0 }
>> -		};
>> -		double ctm[] = { -1.0,  0.0,  0.0,
>> -				 0.0, -1.0,  0.0,
>> -				 0.0,  0.0, -1.0 };
>> -		igt_assert(test_pipe_ctm(data, primary, red_green_blue,
>> -					 all_black, ctm));
>> -	}
>> +	if (is_i915_device(data->drm_fd))
>> +		igt_require_f((intel_display_ver(data->devid) >= 11),
>> +				"At least GEN 11 is required to validate Deep-color.\n");
>>   
>> -#if 0
>> -	igt_subtest_f("pipe-%s-ctm-limited-range", kmstest_pipe_name(p))
>> -		test_pipe_limited_range_ctm(data, primary);
>> -#endif
>> +	test_setup(data, p);
>>   
>> -	igt_describe("Verify that degamma LUT transformation works correctly");
>> -	igt_subtest_f("pipe-%s-degamma", kmstest_pipe_name(p))
>> -		igt_assert(test_pipe_degamma(data, primary));
>> +	for_each_valid_output_on_pipe(&data->display, p, output) {
>> +		uint64_t max_bpc = get_max_bpc(output);
>> +		bool ret;
>>   
>> -	igt_describe("Verify that gamma LUT transformation works correctly");
>> -	igt_subtest_f("pipe-%s-gamma", kmstest_pipe_name(p))
>> -		igt_assert(test_pipe_gamma(data, primary));
>> +		if (!max_bpc)
>> +			continue;
>>   
>> -	igt_describe("Verify that legacy gamma LUT transformation works correctly");
>> -	igt_subtest_f("pipe-%s-legacy-gamma", kmstest_pipe_name(p))
>> -		test_pipe_legacy_gamma(data, primary);
>> +		if (!panel_supports_deep_color(data->drm_fd, output->name))
>> +			continue;
>>   
>> -	igt_describe("Verify that setting the legacy gamma LUT resets the gamma LUT set through "
>> -			"GAMMA_LUT property");
>> -	igt_subtest_f("pipe-%s-legacy-gamma-reset", kmstest_pipe_name(p))
>> -		test_pipe_legacy_gamma_reset(data, primary);
>> +		data->color_depth = 10;
>> +		data->drm_format = DRM_FORMAT_XRGB2101010;
>> +		data->output = output;
>> +		igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
>> +		igt_output_set_pipe(output, p);
>> +		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>>   
>> -	igt_fixture
>> -		igt_require(data->display.is_atomic);
>> +		if (is_i915_device(data->drm_fd) &&
>> +		    !i915_clock_constraint(data, p, 10))
>> +			continue;
>>   
>> -	igt_describe("Verify that deep color works correctly");
>> -	igt_subtest_with_dynamic_f("pipe-%s-deep-color", kmstest_pipe_name(p)) {
>> -		igt_output_t *output;
>> -		color_t blue_green_blue[] = {
>> -			{ 0.0, 0.0, 1.0 },
>> -			{ 0.0, 1.0, 0.0 },
>> -			{ 0.0, 0.0, 1.0 }
>> -		};
>> -		double ctm[] = { 0.0, 0.0, 0.0,
>> -				0.0, 1.0, 0.0,
>> -				1.0, 0.0, 1.0 };
>> -
>> -		if (is_i915_device(data->drm_fd))
>> -			igt_require_f((intel_display_ver(data->devid) >= 11),
>> -					"At least GEN 11 is required to validate Deep-color.\n");
>> -
>> -		for_each_valid_output_on_pipe(&data->display, p, output) {
>> -			uint64_t max_bpc = get_max_bpc(output);
>> -			bool ret;
>> -
>> -			if (!max_bpc)
>> -				continue;
>> -
>> -			if (!panel_supports_deep_color(data->drm_fd, output->name))
>> -				continue;
>> -
>> -			data->color_depth = 10;
>> -			data->drm_format = DRM_FORMAT_XRGB2101010;
>> -			data->output = output;
>> -			igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
>> -			igt_output_set_pipe(output, p);
>> -			igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>> -
>> -			if (is_i915_device(data->drm_fd) &&
>> -			    !i915_clock_constraint(data, p, 10))
>> -				continue;
>> -
>> -			igt_dynamic_f("gamma-%s", output->name) {
>> -				ret = test_pipe_gamma(data, primary);
>> -
>> -				igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, max_bpc);
>> -				igt_assert(ret);
>> -			}
>> +		igt_dynamic_f("pipe-%s-%s-gamma", kmstest_pipe_name(p), output->name) {
>> +			ret = test_pipe_gamma(data, data->primary);
>>   
>> -			igt_dynamic_f("degamma-%s", output->name) {
>> -				ret = test_pipe_degamma(data, primary);
>> +			igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, max_bpc);
>> +			igt_assert(ret);
>> +		}
>>   
>> -				igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, max_bpc);
>> -				igt_assert(ret);
>> -			}
>> +		igt_dynamic_f("pipe-%s-%s-degamma", kmstest_pipe_name(p), output->name) {
>> +			ret = test_pipe_degamma(data, data->primary);
>>   
>> -			igt_dynamic_f("ctm-%s", output->name) {
>> -				ret = test_pipe_ctm(data, primary,
>> -						    red_green_blue,
>> -						    blue_green_blue, ctm);
>> +			igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, max_bpc);
>> +			igt_assert(ret);
>> +		}
>>   
>> -				igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, max_bpc);
>> -				igt_assert(ret);
>> -			}
>> +		igt_dynamic_f("pipe-%s-%s-ctm", kmstest_pipe_name(p), output->name) {
>> +			ret = test_pipe_ctm(data, data->primary,
>> +					    red_green_blue,
>> +					    blue_green_blue, ctm);
>>   
>> -			break;
>> +			igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, max_bpc);
>> +			igt_assert(ret);
>>   		}
>> +
>> +		break;
>>   	}
>>   
>> -	igt_fixture {
>> -		disable_degamma(primary->pipe);
>> -		disable_gamma(primary->pipe);
>> -		disable_ctm(primary->pipe);
>> -		igt_display_commit(&data->display);
>> +	test_cleanup(data);
>> +}
>> +
>> +static void
>> +run_invalid_tests_for_pipe(data_t *data)
>> +{
>> +	enum pipe pipe;
>> +	struct {
>> +		const char *name;
>> +		void (*test_t) (data_t *data, enum pipe pipe);
>> +		const char *desc;
>> +	} tests[] = {
>> +		{ "invalid-gamma-lut-sizes", invalid_gamma_lut_sizes,
>> +			"Negative check for invalid gamma lut sizes" },
>> +
>> +		{ "invalid-degamma-lut-sizes", invalid_degamma_lut_sizes,
>> +			"Negative check for invalid degamma lut sizes" },
>> +
>> +		{ "invalid-ctm-matrix-sizes", invalid_ctm_matrix_sizes,
>> +			"Negative check for color tranformation matrix sizes" },
>> +	};
>> +	int i;
>>   
>> -		igt_pipe_crc_free(data->pipe_crc);
>> -		data->pipe_crc = NULL;
>> +	for (i = 0; i < ARRAY_SIZE(tests); i++) {
>> +		igt_describe_f("%s", tests[i].desc);
>> +		igt_subtest_with_dynamic_f("%s", tests[i].name) {
>> +			for_each_pipe(&data->display, pipe) {
>> +				prep_pipe(data, pipe);
>> +
>> +				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
>> +					tests[i].test_t(data, pipe);
>> +			}
>> +		}
>>   	}
>>   }
>>   
>>   static void
>> -run_invalid_tests_for_pipe(data_t *data, enum pipe p)
>> +run_tests_for_pipe(data_t *data)
>>   {
>> -	igt_fixture
>> -		prep_pipe(data, p);
>> +	enum pipe pipe;
>> +	struct {
>> +		const char *name;
>> +		bool (*test_t)(data_t*, igt_plane_t*);
>> +		const char *desc;
>> +	} gamma_degamma_tests[] = {
>> +		{ "degamma", test_pipe_degamma,
>> +		  "Verify that degamma LUT transformation works correctly" },
>> +
>> +		{ "gamma", test_pipe_gamma,
>> +		  "Verify that gamma LUT transformation works correctly" },
>> +
>> +		{ "legacy-gamma", test_pipe_legacy_gamma,
>> +		  "Verify that legacy gamma LUT transformation works correctly" },
>> +
>> +		{ "legacy-gamma-reset", test_pipe_legacy_gamma_reset,
>> +		  "Verify that setting the legacy gamma LUT resets the gamma LUT set through GAMMA_LUT property" },
>> +	};
>> +	struct {
>> +		const char *name;
>> +		int iter;
>> +		color_t colors[3];
>> +		double ctm[9];
>> +		const char *desc;
>> +	} ctm_tests[] = {
>> +		{ "ctm-red-to-blue", 0,
>> +			{{ 0.0, 0.0, 1.0 },
>> +			 { 0.0, 1.0, 0.0 },
>> +			 { 0.0, 0.0, 1.0 }},
>> +		  { 0.0, 0.0, 0.0,
>> +		    0.0, 1.0, 0.0,
>> +		    1.0, 0.0, 1.0 },
>> +		  "Check the color transformation from red to blue"
>> +		},
>> +		{ "ctm-green-to-red", 0,
>> +			{{ 1.0, 0.0, 0.0 },
>> +			 { 1.0, 0.0, 0.0 },
>> +			 { 0.0, 0.0, 1.0 }},
>> +		  { 1.0, 1.0, 0.0,
>> +		    0.0, 0.0, 0.0,
>> +		    0.0, 0.0, 1.0 },
>> +		  "Check the color transformation from green to red"
>> +		},
>> +		{ "ctm-blue-to-red", 0,
>> +			{{ 1.0, 0.0, 0.0 },
>> +			 { 0.0, 1.0, 0.0 },
>> +			 { 1.0, 0.0, 0.0 }},
>> +		  { 1.0, 0.0, 1.0,
>> +		    0.0, 1.0, 0.0,
>> +		    0.0, 0.0, 0.0 },
>> +		  "Check the color transformation from blue to red"
>> +		},
>> +		{ "ctm-max", 0,
>> +			{{ 1.0, 0.0, 0.0 },
>> +			 { 0.0, 1.0, 0.0 },
>> +			 { 0.0, 0.0, 1.0 }},
>> +		  { 100.0, 0.0, 0.0,
>> +		    0.0, 100.0, 0.0,
>> +		    0.0, 0.0, 100.0 },
>> +		  "Check the color transformation for maximum transparency"
>> +		},
>> +		{ "ctm-negative", 0,
>> +			{{ 0.0, 0.0, 0.0 },
>> +			 { 0.0, 0.0, 0.0 },
>> +			 { 0.0, 0.0, 0.0 }},
>> +		  { -1.0, 0.0, 0.0,
>> +		    0.0, -1.0, 0.0,
>> +		    0.0, 0.0, -1.0 },
>> +		  "Check the color transformation for negative transparency"
>> +		},
>> +		{ "ctm-0-25", 5,
>> +			{{ 0.0, }, { 0.0, }, { 0.0, }},
>> +		  { 0.25, 0.0,  0.0,
>> +		    0.0,  0.25, 0.0,
>> +		    0.0,  0.0,  0.25 },
>> +		  "Check the color transformation for 0.25 transparency"
>> +		},
>> +		{ "ctm-0-50", 5,
>> +			{{ 0.0, }, { 0.0, }, { 0.0, }},
>> +		  { 0.5,  0.0,  0.0,
>> +		    0.0,  0.5,  0.0,
>> +		    0.0,  0.0,  0.5 },
>> +		  "Check the color transformation for 0.5 transparency"
>> +		},
>> +		{ "ctm-0-75", 7,
>> +			{{ 0.0, }, { 0.0, }, { 0.0, }},
>> +		  { 0.75, 0.0,  0.0,
>> +		    0.0,  0.75, 0.0,
>> +		    0.0,  0.0,  0.75 },
>> +		  "Check the color transformation for 0.75 transparency"
>> +		},
>> +	};
>> +	int i;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(gamma_degamma_tests); i++) {
>> +		igt_describe_f("%s", gamma_degamma_tests[i].desc);
>> +		igt_subtest_with_dynamic_f("%s", gamma_degamma_tests[i].name) {
>> +			for_each_pipe(&data->display, pipe) {
>> +				run_gamma_degamma_tests_for_pipe(data, pipe,
>> +								 gamma_degamma_tests[i].test_t);
>> +			}
>> +		}
>> +	}
>>   
>> -	igt_describe("Negative check for invalid gamma lut sizes");
>> -	igt_subtest_f("pipe-%s-invalid-gamma-lut-sizes", kmstest_pipe_name(p))
>> -		invalid_gamma_lut_sizes(data, p);
>> +	for (i = 0; i < ARRAY_SIZE(ctm_tests); i++) {
>> +		igt_describe_f("%s", ctm_tests[i].desc);
>> +		igt_subtest_with_dynamic_f("%s", ctm_tests[i].name) {
>> +			for_each_pipe(&data->display, pipe) {
>> +				run_ctm_tests_for_pipe(data, pipe,
>> +						       ctm_tests[i].colors,
>> +						       ctm_tests[i].ctm,
>> +						       ctm_tests[i].iter);
>> +			}
>> +		}
>> +	}
>>   
>> -	igt_describe("Negative check for invalid degamma lut sizes");
>> -	igt_subtest_f("pipe-%s-invalid-degamma-lut-sizes", kmstest_pipe_name(p))
>> -		invalid_degamma_lut_sizes(data, p);
>> +	igt_fixture
>> +		igt_require(data->display.is_atomic);
>>   
>> -	igt_describe("Negative check for color tranformation matrix sizes");
>> -	igt_subtest_f("pipe-%s-invalid-ctm-matrix-sizes", kmstest_pipe_name(p))
>> -		invalid_ctm_matrix_sizes(data, p);
>> +	igt_describe("Verify that deep color works correctly");
>> +	igt_subtest_with_dynamic("deep-color") {
>> +		for_each_pipe(&data->display, pipe) {
>> +			run_deep_color_tests_for_pipe(data, pipe);
>> +		}
>> +	}
>>   }
>>   
>>   igt_main
>>   {
>>   	data_t data = {};
>> -	enum pipe pipe;
>>   
>>   	igt_fixture {
>>   		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>> @@ -999,13 +1039,11 @@ igt_main
>>   		igt_display_require(&data.display, data.drm_fd);
>>   	}
>>   
>> -	for_each_pipe_static(pipe) {
>> -		igt_subtest_group
>> -			run_tests_for_pipe(&data, pipe);
>> +	igt_subtest_group
>> +		run_tests_for_pipe(&data);
>>   
>> -		igt_subtest_group
>> -			run_invalid_tests_for_pipe(&data, pipe);
>> -	}
>> +	igt_subtest_group
>> +		run_invalid_tests_for_pipe(&data);
>>   
>>   	igt_fixture {
>>   		igt_display_fini(&data.display);
>> diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
>> index cc07f5ee..2ea15bcd 100644
>> --- a/tests/kms_color_helper.h
>> +++ b/tests/kms_color_helper.h
>> @@ -50,6 +50,7 @@ typedef struct {
>>   	igt_display_t display;
>>   	igt_pipe_crc_t *pipe_crc;
>>   	igt_output_t *output;
>> +	igt_plane_t *primary;
>>   
>>   	uint32_t drm_format;
>>   	uint32_t color_depth;
>> -- 
>> 2.35.1
>>
