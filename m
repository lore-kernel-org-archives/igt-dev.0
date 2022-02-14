Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94C410E13F
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Feb 2022 16:40:15 +0000 (UTC)
Message-ID: <d2c5e365-1873-2f67-98ea-b45ee83452b2@intel.com>
Date: Mon, 14 Feb 2022 22:10:10 +0530
MIME-Version: 1.0
Content-Language: en-US
References: <20220208055039.31306-1-swati2.sharma@intel.com>
 <20220208055039.31306-5-swati2.sharma@intel.com> <YgN7xEYyqGP8ldLr@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <YgN7xEYyqGP8ldLr@intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [v3 4/9] tests/kms_plane_scaling: Downscaling each
 plane
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>



On 09-Feb-22 2:01 PM, Ville Syrjälä wrote:
> On Tue, Feb 08, 2022 at 11:20:34AM +0530, Swati Sharma wrote:
>> Subtest for testing downscaling for each plane
>> individually (checked 1 plane per "class" like
>> we do in other tests).
>>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   tests/kms_plane_scaling.c | 77 +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 77 insertions(+)
>>
>> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
>> index 25e91659..22563fac 100644
>> --- a/tests/kms_plane_scaling.c
>> +++ b/tests/kms_plane_scaling.c
>> @@ -288,6 +288,76 @@ test_plane_upscaling(data_t *d, enum pipe pipe, igt_output_t *output)
>>   	}
>>   }
>>   
>> +static void
>> +__test_plane_downscaling(data_t *d, igt_plane_t *plane,
>> +		         enum pipe pipe, igt_output_t *output)
>> +{
>> +	igt_display_t *display = &d->display;
>> +	int width, height;
>> +	drmModeModeInfo *mode;
>> +	bool test_complete = false;
>> +	int scaling = 50;
>> +	int ret;
>> +
>> +	cleanup_crtc(d);
>> +
>> +	igt_output_set_pipe(output, pipe);
>> +	mode = igt_output_get_mode(output);
>> +	width = mode->hdisplay;
>> +	height = mode->vdisplay;
>> +
>> +	while(!test_complete) {
>> +
>> +		igt_create_color_pattern_fb(display->drm_fd,
>> +					    width, height,
>> +					    DRM_FORMAT_XRGB8888,
>> +					    I915_TILING_NONE,
>> +					    1.0, 0.0, 0.0, &d->fb[0]);
>> +
>> +		igt_plane_set_fb(plane, &d->fb[0]);
>> +		igt_plane_set_size(plane, (width * scaling) / 100, (height * scaling) / 100);
>> +		ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>> +
>> +		if (ret != -EINVAL)
>> +			test_complete = true;
>> +
>> +		scaling += 5;
>> +
>> +		igt_plane_set_fb(plane, NULL);
>> +		igt_remove_fb(display->drm_fd, &d->fb[0]);
>> +	}
>> +}
>> +
>> +static void
>> +test_plane_downscaling(data_t *d, enum pipe pipe, igt_output_t *output)
>> +{
>> +	igt_display_t *display = &d->display;
>> +	igt_plane_t *plane;
>> +	uint64_t modifier = is_i915_device(d->drm_fd) ?
>> +		I915_FORMAT_MOD_Y_TILED : DRM_FORMAT_MOD_LINEAR;
> 
> Same Y-tile thing a sin the upscale test.

Done in v4. Set modifier as LINEAR.

> 
>> +
>> +	igt_require(get_num_scalers(d, pipe) > 0);
> 
> That i915ism shouldn't be required given you use try_commit().
> 

Done in v4

>> +
>> +	for_each_plane_on_pipe(display, pipe, plane) {
>> +		struct igt_vec tested_formats;
>> +
>> +		if (plane->type == DRM_PLANE_TYPE_CURSOR)
>> +			continue;
>> +
>> +		igt_vec_init(&tested_formats, sizeof(uint32_t));
>> +
>> +		for (int j = 0; j < plane->drm_plane->count_formats; j++) {
>> +			uint32_t format = plane->drm_plane->formats[j];
>> +			if (test_format(d, &tested_formats, format) &&
>> +			    igt_plane_has_format_mod(plane, format, modifier) &&
>> +			    can_scale(d, format))
>> +					__test_plane_downscaling(d, plane, pipe, output);
>> +		}
>> +
>> +		igt_vec_fini(&tested_formats);
>> +	}
>> +}
> 
> This whole function seems identical to the upscaling test.
> Could be all shared code pretty easily.

Done in v4.

> 
> 
>> +
>>   static bool test_pipe_iteration(data_t *data, enum pipe pipe, int iteration)
>>   {
>>   	if (!is_i915_device(data->drm_fd) ||
>> @@ -612,6 +682,13 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>>   					test_plane_upscaling(&data, pipe, output);
>>   		}
>>   
>> +		igt_describe("Tests plane downscaling.");
>> +		igt_subtest_with_dynamic("plane-downscaling") {
>> +			for_each_pipe_with_single_output(&data.display, pipe, output)
>> +				igt_dynamic_f("pipe-%s-%s-downscaling", kmstest_pipe_name(pipe), igt_output_name(output))
>> +					test_plane_downscaling(&data, pipe, output);
>> +		}
>> +
>>   		igt_describe("Tests scaling with pixel formats.");
>>   		igt_subtest_with_dynamic("scaler-with-pixel-format") {
>>   			for_each_pipe_with_single_output(&data.display, pipe, output)
>> -- 
>> 2.25.1
> 

-- 
~Swati Sharma
