Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E6B110E13F
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Feb 2022 16:43:17 +0000 (UTC)
Message-ID: <2a31c6b9-a960-318a-025e-31d07a490d9c@intel.com>
Date: Mon, 14 Feb 2022 22:12:53 +0530
MIME-Version: 1.0
Content-Language: en-US
References: <20220208055039.31306-1-swati2.sharma@intel.com>
 <20220208055039.31306-6-swati2.sharma@intel.com> <YgN9FpynUEiywoeL@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <YgN9FpynUEiywoeL@intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [v3 5/9] tests/kms_plane_scaling: Upscaling on 2
 planes
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



On 09-Feb-22 2:06 PM, Ville Syrjälä wrote:
> On Tue, Feb 08, 2022 at 11:20:35AM +0530, Swati Sharma wrote:
>> i915 driver supports 2 scalers per pipe. Added test case
>> to upscale 2 overlay planes simultaneously on single pipe.
>>
>> v2: -add check for min 2 scalers
>>      -add igt_require() for overlay planes, fixes CRASH on KBL
>>
>> v3: -test modified for n planes (Ville)
>>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   tests/kms_plane_scaling.c | 74 +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 74 insertions(+)
>>
>> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
>> index 22563fac..f813c5b4 100644
>> --- a/tests/kms_plane_scaling.c
>> +++ b/tests/kms_plane_scaling.c
>> @@ -29,6 +29,11 @@
>>   
>>   IGT_TEST_DESCRIPTION("Test display plane scaling");
>>   
>> +/* Test flags. */
>> +enum {
>> +        TEST_UP_UP_SCALING = 1 << 0,
>> +};
>> +
>>   typedef struct {
>>   	uint32_t devid;
>>   	int drm_fd;
>> @@ -358,6 +363,67 @@ test_plane_downscaling(data_t *d, enum pipe pipe, igt_output_t *output)
>>   	}
>>   }
>>   
>> +static void
>> +__test_plane_up_up_scaling(data_t *d, enum pipe pipe, igt_output_t *output)
>> +{
>> +	drmModeModeInfo *mode;
>> +	int width, height;
>> +	igt_display_t *display = &d->display;
>> +
>> +	cleanup_crtc(d);
>> +
>> +	igt_output_set_pipe(output, pipe);
>> +	mode = igt_output_get_mode(output);
>> +	width = height = 20;
>> +
>> +	for (int k = 0; k < display->pipes[pipe].n_planes; k++) {
>> +		igt_plane_t *plane1, *plane2;
>> +
>> +		plane1 = &display->pipes[pipe].planes[k];
>> +		igt_require(plane1);
>> +		plane2 = &display->pipes[pipe].planes[k+1];
>> +		igt_require(plane2);
>> +
>> +		if (plane1->type == DRM_PLANE_TYPE_PRIMARY  || plane1->type == DRM_PLANE_TYPE_CURSOR ||
>> +		    plane2->type == DRM_PLANE_TYPE_PRIMARY || plane2->type ==DRM_PLANE_TYPE_CURSOR)
>> +				continue;
>> +
>> +		igt_create_color_pattern_fb(display->drm_fd,
>> +					    width, height,
>> +					    DRM_FORMAT_XRGB8888,
>> +					    I915_TILING_NONE,
>> +					    1.0, 0.0, 0.0, &d->fb[1]);
>> +		igt_create_color_pattern_fb(display->drm_fd,
>> +					    width, height,
>> +					    DRM_FORMAT_XRGB8888,
>> +					    I915_TILING_NONE,
>> +					    0.0, 1.0, 0.0, &d->fb[2]);
> 
> Recreating the same fbs every iteration seems pointless/expensive.

Fixed in v4.

> 
>> +
>> +		igt_plane_set_fb(plane1, &d->fb[1]);
>> +		igt_plane_set_fb(plane2, &d->fb[2]);
>> +
>> +		/* 1st overlay plane upscaling */
>> +		igt_plane_set_size(plane1, mode->hdisplay, mode->vdisplay);
>> +		/* 2nd overlay plane upscaling */
>> +		igt_plane_set_size(plane2, mode->hdisplay - 20, mode->vdisplay - 20);
>> +		igt_display_commit2(display, COMMIT_ATOMIC);
>> +
>> +		igt_plane_set_fb(plane1, NULL);
>> +		igt_plane_set_fb(plane2, NULL);
>> +		igt_remove_fb(display->drm_fd, &d->fb[1]);
>> +		igt_remove_fb(display->drm_fd, &d->fb[2]);
>> +	}
>> +}
>> +
>> +static void
>> +test_plane_scaling_combo(data_t *d, enum pipe pipe, igt_output_t *output, uint32_t flags)
>> +{
>> +	igt_require(get_num_scalers(d, pipe) >= 2);
>> +
>> +	if (flags & TEST_UP_UP_SCALING)
> 
> What's the point of this flag based dispatcher thing? Just call the
> right function directly?

okay.

> 
>> +		__test_plane_up_up_scaling(d, pipe, output);
>> +}
>> +
>>   static bool test_pipe_iteration(data_t *data, enum pipe pipe, int iteration)
>>   {
>>   	if (!is_i915_device(data->drm_fd) ||
>> @@ -689,6 +755,14 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>>   					test_plane_downscaling(&data, pipe, output);
>>   		}
>>   
>> +		igt_describe("Tests upscaling of 2 overlay planes.");
>> +		igt_subtest_with_dynamic("plane-up-up-scaling") {
> 
> Bit of a funny name that, but don't really have a great idea
> how to make it any better.

Any suggestions now? Already tried many names, did find any less funny :p
Can we go with plane-upscaling-upscaling ?
> 
>> +			for_each_pipe_with_single_output(&data.display, pipe, output)
>> +				igt_dynamic_f("pipe-%s-%s-plane-up-up-scaling",
>> +					      kmstest_pipe_name(pipe), igt_output_name(output))
>> +					test_plane_scaling_combo(&data, pipe, output, TEST_UP_UP_SCALING);
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
