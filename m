Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D356E31C
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2020 12:07:20 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id v16so6049350ljk.13
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2020 05:07:20 -0700 (PDT)
References: <20200326105918.7557-1-mika.kahola@intel.com>
 <aced2da0-f23f-b0d7-d5b8-235f647e68fb@gmail.com>
 <7d7aa61588824e93a911dad0170ab002@intel.com>
From: =?UTF-8?Q?Juha-Pekka_Heikkil=c3=a4?= <juhapekka.heikkila@gmail.com>
Message-ID: <217e29f0-fbaf-b3a8-da25-be763e7978bc@gmail.com>
Date: Thu, 26 Mar 2020 14:07:17 +0200
MIME-Version: 1.0
In-Reply-To: <7d7aa61588824e93a911dad0170ab002@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_concurrent: Test maximum
 number of planes supported by the platform
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Kahola, Mika" <mika.kahola@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



Kahola, Mika kirjoitti 26.3.2020 klo 13.42:
> -----Original Message-----
> From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Sent: Thursday, March 26, 2020 1:22 PM
> To: Kahola, Mika <mika.kahola@intel.com>; igt-dev@lists.freedesktop
> Cc: Lisovskiy, Stanislav <stanislav.lisovskiy@intel.com>
> Subject: Re: [PATCH i-g-t v2] tests/kms_concurrent: Test maximum number of planes supported by the platform
> 
> On 26.3.2020 12.59, Mika Kahola wrote:
>> There was an error in commit 0ab05a51a059 on computing number of
>> maximum supported planes. This patch proposes a fix to this commit by
>> first computing the number of planes that are within platform's
>> bandwidth requirements, resets the display and then executes the actual testing.
>>
>> v2: Remove uninitialized variable (Stan)
>>
>> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
>> ---
>>    tests/kms_concurrent.c | 102 ++++++++++++++++++-----------------------
>>    1 file changed, 45 insertions(+), 57 deletions(-)
>>
>> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c index
>> 61137139..1a7c12fc 100644
>> --- a/tests/kms_concurrent.c
>> +++ b/tests/kms_concurrent.c
>> @@ -195,6 +195,25 @@ prepare_planes(data_t *data, enum pipe pipe, int max_planes,
>>    	igt_plane_set_fb(data->plane[primary->index], &data->fb[primary->index]);
>>    }
>>    
>> +static int test_bandwidth(data_t *data, enum pipe pipe, igt_output_t
>> +*output) {
>> +
>> +	int n_planes = data->display.pipes[pipe].n_planes;
>> +	int i;
>> +	int ret;
>> +
>> +	igt_pipe_refresh(&data->display, pipe, true);
>> +
>> +	for (i = 1; i <= n_planes; i++) {
>> +		prepare_planes(data, pipe, i, output);
> 
> Does this leak memory prepare_planes() successfully allocated?
> 
> You mean, we should free the dynamically allocated memory inside prepare_planes?

yes.

> 
>> +		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC | DRM_MODE_ATOMIC_TEST_ONLY);
>> +		if (ret != 0)
>> +			break;
>> +	}
>> +
>> +	return i - 1;
>> +}
>> +
>>    static void
>>    test_plane_position_with_output(data_t *data, enum pipe pipe, int max_planes,
>>    				igt_output_t *output)
>> @@ -208,7 +227,7 @@ test_plane_position_with_output(data_t *data, enum pipe pipe, int max_planes,
>>    	i = 0;
>>    	while (i < iterations || loop_forever) {
>>    		prepare_planes(data, pipe, max_planes, output);
>> -		igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> 
> Also here probably is leaked memory as well as FBs for each iteration?
> 
> That is propably true. Maybe I prepare a separate memory leakage patch as these are somewhat out of the context regarding this proposal.
> 

There's similar code in kms_plane_multiple which you probably can quite 
directly cut'n'paste here.

>>    		i++;
>>    	}
>>    }
>> @@ -241,44 +260,17 @@ get_lowres_mode(data_t *data, const drmModeModeInfo *mode_default,
>>    	return mode;
>>    }
>>    
>> -static int
>> +static void
>>    test_resolution_with_output(data_t *data, enum pipe pipe, igt_output_t *output)
>>    {
>>    	const drmModeModeInfo *mode_hi, *mode_lo;
>>    	int iterations = opt.iterations < 1 ? 1 : opt.iterations;
>>    	bool loop_forever = opt.iterations == LOOP_FOREVER ? true : false;
>> -	int i, c, ret;
>> -	int max_planes = data->display.pipes[pipe].n_planes;
>> -	igt_plane_t *primary;
>> -	drmModeModeInfo *mode;
>> +	int i;
>>    
>>    	i = 0;
>>    	while (i < iterations || loop_forever) {
>>    		igt_output_set_pipe(output, pipe);
>> -		for (c = 0; c < max_planes; c++) {
>> -			igt_plane_t *plane = igt_output_get_plane(output, c);
>> -
>> -			if (plane->type != DRM_PLANE_TYPE_PRIMARY)
>> -				continue;
>> -			primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>> -			data->plane[primary->index] = primary;
>> -			mode = igt_output_get_mode(output);
>> -			igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
>> -						DRM_FORMAT_XRGB8888,
>> -						LOCAL_I915_FORMAT_MOD_X_TILED,
>> -						0.0f, 0.0f, 1.0f,
>> -						&data->fb[primary->index]);
>> -			igt_plane_set_fb(data->plane[primary->index], &data->fb[primary->index]);
>> -			ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>> -			if (ret) {
>> -				igt_plane_set_fb(data->plane[i], NULL);
>> -				igt_remove_fb(data->drm_fd, &data->fb[i]);
>> -				data->plane[i] = NULL;
>> -				break;
>> -			}
>> -		}
>> -		max_planes = c;
>> -		igt_assert_lt(0, max_planes);
>>    
>>    		mode_hi = igt_output_get_mode(output);
>>    		mode_lo = get_lowres_mode(data, mode_hi, output); @@ -293,48
>> +285,35 @@ test_resolution_with_output(data_t *data, enum pipe pipe,
>> igt_output_t *output)
>>    
>>    		i++;
>>    	}
>> -
>> -	return max_planes;
>>    }
>>    
>>    static void
>> -run_test(data_t *data, enum pipe pipe, igt_output_t *output)
>> +run_test(data_t *data, enum pipe pipe, int max_planes, igt_output_t
>> +*output)
>>    {
>> -	int connected_outs;
>> -	int n_planes = data->display.pipes[pipe].n_planes;
>> -	int max_planes = n_planes;
>> -
>>    	if (!opt.user_seed)
>>    		opt.seed = time(NULL);
>>    
>> -	connected_outs = 0;
>> -	for_each_valid_output_on_pipe(&data->display, pipe, output) {
>> -		igt_info("Testing resolution with connector %s using pipe %s with seed %d\n",
>> -			 igt_output_name(output), kmstest_pipe_name(pipe), opt.seed);
>> -
>> -		test_init(data, pipe, n_planes, output);
>> -		max_planes = test_resolution_with_output(data, pipe, output);
>> -
>> -		igt_fork(child, 1) {
>> -			test_plane_position_with_output(data, pipe, max_planes, output);
>> -		}
>> +	igt_info("Testing resolution with connector %s using pipe %s with seed %d\n",
>> +		 igt_output_name(output), kmstest_pipe_name(pipe), opt.seed);
>>    
>> -		test_resolution_with_output(data, pipe, output);
>> +	test_init(data, pipe, max_planes, output);
>> +	igt_fork(child, 1) {
>> +		test_plane_position_with_output(data, pipe, max_planes, output);
>> +	}
>>    
>> -		igt_waitchildren();
>> +	test_resolution_with_output(data, pipe, output);
>>    
>> -		test_fini(data, pipe, n_planes, output);
>> +	igt_waitchildren();
>>    
>> -		connected_outs++;
>> -	}
>> +	test_fini(data, pipe, max_planes, output);
>>    
>> -	igt_skip_on(connected_outs == 0);
>>    }
>>    
>>    static void
>>    run_tests_for_pipe(data_t *data, enum pipe pipe)
>>    {
>>    	igt_output_t *output;
>> +	int max_planes;
>>    
>>    	igt_fixture {
>>    		int valid_tests = 0;
>> @@ -348,9 +327,18 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
>>    		igt_require_f(valid_tests, "no valid crtc/connector combinations found\n");
>>    	}
>>    
>> -	igt_subtest_f("pipe-%s", kmstest_pipe_name(pipe))
>> -		for_each_valid_output_on_pipe(&data->display, pipe, output)
>> -			run_test(data, pipe, output);
>> +	igt_subtest_f("pipe-%s", kmstest_pipe_name(pipe)) {
>> +		for_each_valid_output_on_pipe(&data->display, pipe, output) {
>> +			int n_planes = data->display.pipes[pipe].n_planes;
>> +
>> +			test_init(data, pipe, n_planes, output);
>> +			max_planes = test_bandwidth(data, pipe, output);
>> +			test_fini(data, pipe, n_planes, output);
>> +
>> +			igt_display_reset(&data->display);
>> +			run_test(data, pipe, max_planes, output);
>> +		}
>> +	}
>>    }
>>    
>>    static int opt_handler(int option, int option_index, void *input)
>>
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
