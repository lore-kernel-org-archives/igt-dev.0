Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63AB910EA17
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Aug 2022 18:15:40 +0000 (UTC)
Message-ID: <e9edccae-a9d2-3c6b-004d-3b75a0a015de@quicinc.com>
Date: Fri, 26 Aug 2022 11:15:21 -0700
MIME-Version: 1.0
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>
References: <20220825210611.19636-1-nidhi1.gupta@intel.com>
 <20220825210611.19636-2-nidhi1.gupta@intel.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20220825210611.19636-2-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH 1/2] tests/kms_writeback: Convert tests to
 dynamic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Nidhi,

On 8/25/2022 2:06 PM, Nidhi Gupta wrote:
> Convert the existing subtests to dynamic subtests.
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/kms_writeback.c | 57 +++++++++++++++++++++++++++++++------------
>   1 file changed, 41 insertions(+), 16 deletions(-)
> 
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
> index 9d134585..2508b1e1 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -214,32 +214,38 @@ static void test_invalid_parameters(igt_output_t *output, igt_fb_t *valid_fb, ig
>   		uint32_t fb_id;
>   		bool ptr_valid;
>   		int32_t *out_fence_ptr;
> +		const char *name;
>   	} invalid_tests[] = {
>   		{
>   			/* No output buffer, but the WRITEBACK_OUT_FENCE_PTR set. */
>   			.fb_id = 0,
>   			.ptr_valid = true,
>   			.out_fence_ptr = &out_fence,
> +			.name = "WRITEBACK_OUT_FENCE_PTR-set",
>   		},
>   		{
>   			/* Invalid output buffer. */
>   			.fb_id = invalid_fb->fb_id,
>   			.ptr_valid = true,
>   			.out_fence_ptr = &out_fence,
> +			.name = "Invalid-output-buffer",
>   		},
>   		{
>   			/* Invalid WRITEBACK_OUT_FENCE_PTR. */
>   			.fb_id = valid_fb->fb_id,
>   			.ptr_valid = false,
>   			.out_fence_ptr = (int32_t *)0x8,
> +			.name = "Invalid-WRITEBACK_OUT_FENCE_PTR",
>   		},
>   	};
>   
>   	for (i = 0; i < ARRAY_SIZE(invalid_tests); i++) {
> -		ret = do_writeback_test(output, invalid_tests[i].fb_id,
> -					invalid_tests[i].out_fence_ptr,
> -					invalid_tests[i].ptr_valid);
> -		igt_assert(ret != 0);
> +		igt_dynamic_f("%s\n", invalid_tests[i].name) {

 From `valid_name_for_subtest()`: "check the subtest name only contains 
a-z, A-Z, 0-9, '-' and '_'"[1].

Please remove the newline character from dynamic subtest name.

[1] 
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/lib/igt_core.c#L1276

> +			ret = do_writeback_test(output, invalid_tests[i].fb_id,
> +						invalid_tests[i].out_fence_ptr,
> +						invalid_tests[i].ptr_valid);
> +			igt_assert(ret != 0);
> +		}
>   	}
>   }
>   
> @@ -247,18 +253,37 @@ static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb, igt_fb_t *
>   {
>   
>   	int ret;
> +	struct {
> +                const char *name;

Please fix whitespace inconsistency.

> +		uint32_t fb_id;
> +		int i,ret1;

`ret1` is a little vague for a variable name. Renaming it to something 
like `expected_ret` would improve readability.

In addition, please move the `int i` declaration to outside of the struct.

> +        } fb_id_tests[] = {
> +		{
> +			.name = "Invalid-object",
> +			.fb_id = output->id,
> +			.ret1 = -EINVAL, > +		},
>   
> -	/* Invalid object for WRITEBACK_FB_ID */
> -	ret = do_writeback_test(output, output->id, NULL, false);
> -	igt_assert(ret == -EINVAL);
> +		{
> +			.name = "Zero-WRITEBACK_FB_ID",
> +			.fb_id = 0,
> +			.ret1 = 0,
> +		},
> +
> +		{
> +			.name = "Valid-output-buffer",
> +			.fb_id = valid_fb->fb_id,
> +			.ret1 = 0,
> +		},
> +	}

Missing semicolon.

> +	for (i = 0; i < ARRAY_SIZE(fb_id_tests); i++) {
> +		igt_dynamic_f("%s\n", fb_id_tests[i].name) {

Same as above -- please remove newline character.

> +			do_writeback_test(output, fb_id_tests[i].fb_id, NULL, false);
> +			igt_assert(ret == fb_id_tests[i].ret1);

Please initialize `ret` before comparing it.

Thanks,

Jessica Zhang

> +		}
> +	}
>   
> -	/* Zero WRITEBACK_FB_ID */
> -	ret = do_writeback_test(output, 0, NULL, false);
> -	igt_assert(ret == 0);
>   
> -	/* Valid output buffer */
> -	ret = do_writeback_test(output, valid_fb->fb_id, NULL, false);
> -	igt_assert(ret == 0);
>   }
>   
>   static void fill_fb(igt_fb_t *fb, uint32_t pixel)
> @@ -553,7 +578,7 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
>   	igt_describe("Writeback has a couple of parameters linked together"
>   		     "(output framebuffer and fence); this test goes through"
>   		     "the combination of possible bad options");
> -	igt_subtest("writeback-invalid-parameters") {
> +	igt_subtest_with_dynamic("writeback-invalid-parameters") {
>   		igt_fb_t invalid_output_fb;
>   
>   		igt_skip_on(data.dump_check || data.list_modes);
> @@ -570,7 +595,7 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
>   	}
>   
>   	igt_describe("Validate WRITEBACK_FB_ID with valid and invalid options");
> -	igt_subtest("writeback-fb-id") {
> +	igt_subtest_with_dynamic("writeback-fb-id") {
>   		igt_fb_t output_fb;
>   
>   		igt_skip_on(data.dump_check || data.list_modes);
> @@ -586,7 +611,7 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
>   	}
>   
>   	igt_describe("Check writeback output with CRC validation");
> -	igt_subtest("writeback-check-output") {
> +	igt_subtest_with_dynamic("writeback-check-output") {
>   		igt_fb_t output_fb;
>   
>   		igt_skip_on(data.dump_check || data.list_modes);
> -- 
> 2.36.0
> 
