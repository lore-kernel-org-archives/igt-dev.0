Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CFE610E209
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Oct 2022 00:58:31 +0000 (UTC)
Message-ID: <20931897-e75c-c6fd-8782-d210b923e89e@quicinc.com>
Date: Wed, 19 Oct 2022 17:58:21 -0700
MIME-Version: 1.0
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>
References: <20221003073641.77220-1-nidhi1.gupta@intel.com>
 <20221003073641.77220-3-nidhi1.gupta@intel.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20221003073641.77220-3-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/kms_writeback: Convert tests
 to dynamic
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

On 10/3/2022 12:36 AM, Nidhi Gupta wrote:
> Convert the existing subtests to dynamic subtests.
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/kms_writeback.c | 55 ++++++++++++++++++++++++++++++-------------
>   1 file changed, 39 insertions(+), 16 deletions(-)
> 
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
> index 248c6acc..a993482c 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -193,32 +193,38 @@ static void test_invalid_parameters(igt_output_t *output, igt_fb_t *valid_fb, ig
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
> +			.name = "Writeback-out-fence-ptr-set",
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
> +			.name = "Invalid-writeback-out-fence-ptr",
>   		},
>   	};
>   
>   	for (i = 0; i < ARRAY_SIZE(invalid_tests); i++) {
> -		ret = do_writeback_test(output, invalid_tests[i].fb_id,
> -					invalid_tests[i].out_fence_ptr,
> -					invalid_tests[i].ptr_valid);
> -		igt_assert(ret != 0);
> +		igt_dynamic_f("%s", invalid_tests[i].name) {
> +			ret = do_writeback_test(output, invalid_tests[i].fb_id,
> +						invalid_tests[i].out_fence_ptr,
> +						invalid_tests[i].ptr_valid);
> +			igt_assert(ret != 0);
> +		}
>   	}
>   }
>   
> @@ -226,18 +232,35 @@ static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb, igt_fb_t *
>   {
>   
>   	int ret;
> +	struct {
> +		const char *name;
> +		uint32_t fb_id;
> +		int i, expected_ret;

I think I mentioned this earlier, but is there any reason why `i` is a 
member of the fb_id_tests struct?

I'm not seeing this member initialized in any of the elements in the 
array and I'm not seeing any references to it in the code... If it's not 
being used, I would rather we just drop it.

Thanks,

Jessica Zhang

> +	} fb_id_tests[] = {
>   
> -	/* Invalid object for WRITEBACK_FB_ID */
> -	ret = do_writeback_test(output, output->id, NULL, false);
> -	igt_assert(ret == -EINVAL);
> -
> -	/* Zero WRITEBACK_FB_ID */
> -	ret = do_writeback_test(output, 0, NULL, false);
> -	igt_assert(ret == 0);
> +		{
> +			.name = "Invalid-object",
> +			.fb_id = output->id,
> +			.expected_ret = -EINVAL,
> +		},
> +		{
> +			.name = "Zero-writeback-fb-id",
> +			.fb_id = 0,
> +			.expected_ret = 0,
> +		},
> +		{
> +			.name = "Valid-output-buffer",
> +			.fb_id = valid_fb->fb_id,
> +			.expected_ret = 0,
> +		},
> +	};
>   
> -	/* Valid output buffer */
> -	ret = do_writeback_test(output, valid_fb->fb_id, NULL, false);
> -	igt_assert(ret == 0);
> +	for (int i = 0; i < ARRAY_SIZE(fb_id_tests); i++) {
> +		igt_dynamic_f("%s", fb_id_tests[i].name) {
> +			ret = do_writeback_test(output, fb_id_tests[i].fb_id, NULL, false);
> +			igt_assert(ret == fb_id_tests[i].expected_ret);
> +		}
> +	}
>   }
>   
>   static void fill_fb(igt_fb_t *fb, uint32_t pixel)
> @@ -532,7 +555,7 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
>   	igt_describe("Writeback has a couple of parameters linked together"
>   		     "(output framebuffer and fence); this test goes through"
>   		     "the combination of possible bad options");
> -	igt_subtest("writeback-invalid-parameters") {
> +	igt_subtest_with_dynamic("writeback-invalid-parameters") {
>   		igt_fb_t invalid_output_fb;
>   
>   		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay / 2,
> @@ -548,7 +571,7 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
>   	}
>   
>   	igt_describe("Validate WRITEBACK_FB_ID with valid and invalid options");
> -	igt_subtest("writeback-fb-id") {
> +	igt_subtest_with_dynamic("writeback-fb-id") {
>   		igt_fb_t output_fb;
>   
>   		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
> -- 
> 2.25.1
> 
