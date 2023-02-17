Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7600110E4A6
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Feb 2023 08:29:24 +0000 (UTC)
Message-ID: <7c1688b3-26ef-be64-17ff-e088bfe014c6@intel.com>
Date: Fri, 17 Feb 2023 13:59:16 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
References: <20230215165947.15421-1-swati2.sharma@intel.com>
 <20230215165947.15421-4-swati2.sharma@intel.com>
 <20230216192914.vkji7lrmr2i5qawx@kamilkon-desk1>
From: Swati Sharma <swati2.sharma@intel.com>
In-Reply-To: <20230216192914.vkji7lrmr2i5qawx@kamilkon-desk1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] tests/kms_plane_scaling: Add test
 to validate max source size
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

Hi Kamil,

I have floated next rev https://patchwork.freedesktop.org/series/114059/
addressing review comments from JP.

igt_require() inside dynamic_subtest() is not recommended.
All these conditions should be checked before executing the
test. In the past, we have seen CRASHES if such conditions
are put inside the subtest.

On 17-Feb-23 12:59 AM, Kamil Konieczny wrote:
> Hi Swati,
> 
> On 2023-02-15 at 22:29:47 +0530, Swati Sharma wrote:
>> i915 specific test is added to validate max source size. This
>> test is expected to return -EINVAL for platforms where we have
>> max source width 4096 whereas it will pass on platforms having
>> max source width 5120. We have created fb of size 5120x4320
>> (=size of source) and downscaled to 3840x2400(=size of dest).
>>
>> On MTL(disp_ver=14), in dmesg we can see
>> "[drm:skl_update_scaler [i915]] scaler_user index 0.0: src
>> 5120x4320 dst 3840x2400 size is out of scaler range."
>> since max source width supported is 4096.
>> whereas same test will pass on ADLP(display_ver=13) since max
>> source width  supported is 5120.
>>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> 
> +cc Juha-Pekka
> 
>> ---
>>   tests/kms_plane_scaling.c | 94 +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 94 insertions(+)
>>
>> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
>> index 9737d8645..ae917b202 100644
>> --- a/tests/kms_plane_scaling.c
>> +++ b/tests/kms_plane_scaling.c
>> @@ -890,6 +890,95 @@ static void invalid_parameter_tests(data_t *d)
>>   	}
>>   }
>>   
>> +/*
>> + *	Max source/destination width/height
>> + *	for i915 driver.
>> + *
>> + *	DISPLAY_VER < 11
>> + *		max_src_w = 4096
>> + *		max_src_h = 4096
>> + *		max_dst_w = 4096
>> + *		max_dst_h = 4096
>> + *
>> + *	DISPLAY_VER = 11
>> + *		max_src_w = 5120
>> + *		max_src_h = 4096
>> + *		max_dst_w = 5120
>> + *		max_dst_h = 4096
>> + *
>> + *	DISPLAY_VER = 12-13
>> + *		max_src_w = 5120
>> + *		max_src_h = 8192
>> + *		max_dst_w = 8192
>> + *		max_dst_h = 8192
>> + *
>> + *	DISPLAY_VER = 14
>> + *		max_src_w = 4096
>> + *		max_src_h = 8192
>> + *		max_dst_w = 8192
>> + *		max_dst_h = 8192
>> + */
>> +
>> +static void i915_max_source_size_test(data_t *d)
>> +{
>> +	enum pipe pipe = PIPE_A;
>> +	igt_output_t *output;
>> +	igt_fb_t fb;
>> +	igt_plane_t *plane;
>> +	int rval;
>> +
>> +	static const struct invalid_paramtests paramtests[1] = {
>> +		{
>> +			.testname = "max-src-size",
>> +			.planesize = {3840, 2400},
>> +			.params = {{~0}}
>> +		},
>> +	};
>> +
>> +	igt_fixture {
>> +		output = igt_get_single_output_for_pipe(&d->display, pipe);
>> +		igt_require(output);
> --------------- ^
> You are not in subtest.
> 
>> +
>> +		igt_output_set_pipe(output, pipe);
>> +		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>> +
>> +		igt_create_fb(d->drm_fd, 5120, 4320,
>> +			DRM_FORMAT_XRGB8888,
>> +			DRM_FORMAT_MOD_NONE,
>> +			&fb);
>> +	}
> 
> Is this fixture only for i915 ? It looks generic, even if
> igt_create_fb will fail (but you need to remember fb_id here).
> 
>> +
>> +	igt_describe("test for validating max source size.");
>> +	igt_subtest_with_dynamic("i915-max-source-size") {
> 
> Here you can put igt_require for i915 driver and also
> require for fb_id != 0.
> 
>> +		for (uint32_t i = 0; i < ARRAY_SIZE(paramtests); i++) {
>> +			igt_dynamic(paramtests[i].testname) {
>> +				igt_plane_set_position(plane, 0, 0);
>> +				igt_plane_set_fb(plane, &fb);
>> +				igt_plane_set_size(plane,
>> +							paramtests[i].planesize[0],
>> +							paramtests[i].planesize[1]);
>> +
>> +				for (uint32_t j = 0; paramtests[i].params[j].prop != ~0; j++)
>> +					igt_plane_set_prop_value(plane,
>> +								 paramtests[i].params[j].prop,
>> +								 paramtests[i].params[j].value);
>> +
>> +				rval = igt_display_try_commit2(&d->display, COMMIT_ATOMIC);
>> +
>> +				if (intel_display_ver(d->devid) < 11 || intel_display_ver(d->devid) >= 14)
>> +					igt_assert(rval == -EINVAL || rval == -ERANGE);
>> +				else
>> +					igt_assert_eq(rval, 0);
>> +			}
>> +		}
>> +	}
>> +
>> +	igt_fixture {
>> +		igt_remove_fb(d->drm_fd, &fb);
>> +		igt_output_set_pipe(output, PIPE_NONE);
>> +	}
>> +}
>> +
>>   static int opt_handler(int opt, int opt_index, void *_data)
>>   {
>>   	data_t *data = _data;
>> @@ -1055,6 +1144,11 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>>   
>>   	invalid_parameter_tests(&data);
>>   
>> +	igt_fixture
>> +		igt_require_f(data.devid, "This test is valid only for i915 devices.\n");
> 
> Do not do this, use igt_require_f inside (dynamic_)subtest.
> 
> Regards,
> Kamil
> 
>> +
>> +	i915_max_source_size_test(&data);
>> +
>>   	igt_fixture {
>>   		igt_display_fini(&data.display);
>>   		close(data.drm_fd);
>> -- 
>> 2.25.1
>>

-- 
~Swati Sharma
