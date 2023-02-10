Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B167910E1AB
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Feb 2023 14:08:00 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id h16so5151103wrz.12
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Feb 2023 06:08:00 -0800 (PST)
Message-ID: <9b4e4265-0e4d-9706-e176-20ff13c0245b@gmail.com>
Date: Fri, 10 Feb 2023 16:07:52 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Luca Coelho <luca@coelho.fi>
References: <20230209115151.8681-1-juhapekka.heikkila@gmail.com>
 <20230210132242.4flmtkxe7weiifoh@kamilkon-desk1>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20230210132242.4flmtkxe7weiifoh@kamilkon-desk1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: add invalid
 parameter tests
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

Hi Kamil,

I had just pushed this after which I saw your email. :/ While pushing I 
did fixed most of those you had pointed, that alignment thing did look 
different in my editor hence missed it.

/Juha-Pekka

On 10.2.2023 15.22, Kamil Konieczny wrote:
> Hi Juha-Pekka,
> 
> I have few nits, see below.
> 
> On 2023-02-09 at 13:51:51 +0200, Juha-Pekka Heikkila wrote:
>> Add skeleton for adding invalid parameter tests and add
>> two tests which are expected to return -EINVAL or -ERANGE
>>
>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> ---
>>   tests/kms_plane_scaling.c | 71 +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 71 insertions(+)
>>
>> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
>> index 887a55e63..30a839f15 100644
>> --- a/tests/kms_plane_scaling.c
>> +++ b/tests/kms_plane_scaling.c
>> @@ -819,6 +819,75 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
>>   	igt_assert_eq(ret1 && ret2, 0);
>>   }
>>   
>> +static void invalid_parameter_tests(data_t *d) {
> ------------------------------------------------- ^
> This brace should be at new line.
> 
>> +	enum pipe pipe = PIPE_A;
>> +	igt_output_t *output;
>> +	igt_fb_t fb;
>> +	igt_plane_t* plane;
> ------------------ ^
> This should be:
> 	igt_plane_t *plane;
> 
>> +	int rval;
>> +
>> +	const struct {
>> +		const char* testname;
> ------------------------- ^
> Same here.
> 
>> +		uint32_t planesize[2];
>> +		struct {
>> +			enum igt_atomic_plane_properties prop;
>> +			uint32_t value;
>> +		} params[8];
>> +	} paramtests[] = {
>> +		{
>> +			.testname = "less-than-1-height-src",
>> +			.planesize = {256, 8},
>> +			.params = {{IGT_PLANE_SRC_H, IGT_FIXED(0, 30) }, {~0}}
>> +		},
>> +		{
>> +			.testname = "less-than-1-width-src",
>> +			.planesize = {8, 256},
>> +			.params = {{IGT_PLANE_SRC_W, IGT_FIXED(0, 30) }, {~0}}
>> +		},
>> +	};
>> +
>> +	igt_fixture {
>> +		output = igt_get_single_output_for_pipe(&d->display, pipe);
>> +		igt_require(output);
>> +
>> +		igt_output_set_pipe(output, pipe);
>> +		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>> +
>> +		igt_create_fb(d->drm_fd, 256, 256,
>> +			DRM_FORMAT_XRGB8888,
>> +			DRM_FORMAT_MOD_NONE,
>> +			&fb);
>> +	}
>> +
>> +	igt_describe("test parameters which should not be accepted");
>> +	igt_subtest_with_dynamic("invalid-parameters") {
>> +		for (uint32_t i = 0; i < ARRAY_SIZE(paramtests); i++) {
>> +			igt_dynamic(paramtests[i].testname) {
>> +				igt_plane_set_position(plane, 0, 0);
>> +				igt_plane_set_fb(plane, &fb);
>> +				igt_plane_set_size(plane,
> -------------------------------------------------- ^
> If you break line you should align it here.
> 
>> +							paramtests[i].planesize[0],
> -------------------------------------------------- ^
> Align it.
> 
>> +							paramtests[i].planesize[1]);
> -------------------------------------------------- ^
> This is correct align.
> 
>> +
>> +
>> +				for (uint32_t j = 0; paramtests[i].params[j].prop != ~0; j++)
>> +					igt_plane_set_prop_value(plane,
> ---------------------------------------------------------------- ^
> 
>> +									paramtests[i].params[j].prop,
> ---------------------------------------------------------------- ^
> Align here.
> 
>> +									paramtests[i].params[j].value);
> ---------------------------------------------------------------- ^
> Align here.
> 
>> +
>> +				rval = 	igt_display_try_commit2(&d->display, COMMIT_ATOMIC);
> -- ^
> Use tabs, no spaces.
> 
> Please use checkpatch.pl from Linux kernel source to check
> your patches before sending. It may change in future and
> maybe we will have it in our GitLab CI and in patchwork but
> for now please do it yourself.
> 
> Regards,
> Kamil
> 
>> +
>> +				igt_assert(rval == -EINVAL || rval == -ERANGE);
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
>> @@ -982,6 +1051,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>>   	igt_subtest_f("2x-scaler-multi-pipe")
>>   		test_scaler_with_multi_pipe_plane(&data);
>>   
>> +	invalid_parameter_tests(&data);
>> +
>>   	igt_fixture {
>>   		igt_display_fini(&data.display);
>>   		close(data.drm_fd);
>> -- 
>> 2.39.0
>>
