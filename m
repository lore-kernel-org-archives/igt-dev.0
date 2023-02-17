Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C6510E3C7
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Feb 2023 06:13:27 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id j20so1920090edw.0
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Feb 2023 22:13:27 -0800 (PST)
Message-ID: <8995103c-0e5a-59e5-1255-836d43139b39@gmail.com>
Date: Fri, 17 Feb 2023 08:13:19 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Swati Sharma <swati2.sharma@intel.com>
References: <20230215165947.15421-1-swati2.sharma@intel.com>
 <20230215165947.15421-4-swati2.sharma@intel.com>
 <20230216192914.vkji7lrmr2i5qawx@kamilkon-desk1>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
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
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 16.2.2023 21.29, Kamil Konieczny wrote:
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

just quickly drive by commenting.. these tests on this patch are for 
i915, hence above fixture is for tests below.

> 
>> +
>> +	igt_describe("test for validating max source size.");
>> +	igt_subtest_with_dynamic("i915-max-source-size") {
> 
> Here you can put igt_require for i915 driver and also
> require for fb_id != 0.
> 

If igt_create_fb will fail it will assert out at 
igt_create_fb_with_bo_size and there's no point in checking for fb_id 
being zero.

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

Imo igt_subtest_group is what's needed to be put around these, fixture 
is meant for this checking when anything inside will depend on 
something. Putting igt_require_f inside subtest will just waste test 
execution time when on platform where required conditions are not met. 
You can see same pattern used on other tests, simplest example coming to 
my mind at kms_addfb_basic.

/Juha-Pekka

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
