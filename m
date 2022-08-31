Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6984810E3AF
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Aug 2022 12:59:03 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id s7so3265216wro.2
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Aug 2022 05:59:03 -0700 (PDT)
Message-ID: <556a9e56-6a0f-1748-be30-1c8f01276868@gmail.com>
Date: Wed, 31 Aug 2022 15:58:54 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org, swati2.sharma@intel.com
References: <20220809165832.1717990-1-bhanuprakash.modem@intel.com>
 <20220825095503.61189-1-bhanuprakash.modem@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20220825095503.61189-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t V2] tests/kms_cursor_crc: Add max-size test
 back
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

Look ok to me. There are failures on ci but on quick look they don't 
seem to relate to these changes.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 25.8.2022 12.55, Bhanuprakash Modem wrote:
> This patch reverts the max-size test but keeps the clean-up
> part of the original commit.
> 
> This reverts commit 5a8fa05a824032aab4c8980727a075f71065e27c.
> 
> V2:
> - Separate test for max-size
> 
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_cursor_crc.c | 58 +++++++++++++++++++++++++-----------------
>   1 file changed, 35 insertions(+), 23 deletions(-)
> 
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index 14d4c4ca..53f18f4f 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -690,14 +690,26 @@ static void test_rapid_movement(data_t *data)
>   static void run_size_tests(data_t *data, void (*testfunc)(data_t *),
>   			   int w, int h)
>   {
> -	char name[32];
>   	enum pipe pipe;
>   
> -	snprintf(name, sizeof(name), "%dx%d", w, h);
> +	if (w == 0 && h == 0) {
> +		w = data->cursor_max_w;
> +		h = data->cursor_max_h;
> +
> +		/*
> +		 * No point in doing the "max-size" test if
> +		 * it was already covered by the other tests.
> +		 */
> +		if ((w == h) && (w <= 512) && (h <= 512) &&
> +		    is_power_of_two(w) && is_power_of_two(h)) {
> +			igt_info("Cursor max size %dx%d already covered by other tests\n", w, h);
> +			return;
> +		}
> +	}
>   
>   	create_cursor_fb(data, w, h);
>   	if (require_cursor_size(data, w, h)) {
> -		igt_debug("Cursor size %dx%d not supported by driver\n", w, h);
> +		igt_info("Cursor size %dx%d not supported by driver\n", w, h);
>   
>   		igt_remove_fb(data->drm_fd, &data->fb);
>   		return;
> @@ -705,8 +717,8 @@ static void run_size_tests(data_t *data, void (*testfunc)(data_t *),
>   
>   	for_each_pipe(&data->display, pipe) {
>   		data->pipe = pipe;
> -		igt_dynamic_f("pipe-%s-%s-%s",
> -			      kmstest_pipe_name(pipe), data->output->name, name)
> +		igt_dynamic_f("pipe-%s-%s",
> +			      kmstest_pipe_name(pipe), igt_output_name(data->output))
>   			run_test(data, testfunc, w, h);
>   	}
>   
> @@ -837,25 +849,25 @@ static void run_tests_on_pipe(data_t *data)
>   	for (i = 0; i < ARRAY_SIZE(size_tests); i++) {
>   		igt_describe(size_tests[i].desc);
>   		igt_subtest_group {
> -			igt_subtest_with_dynamic_f("%s", size_tests[i].name) {
> -				for (cursor_size = 32; cursor_size <= 512; cursor_size *= 2) {
> -					int w = cursor_size;
> -					int h = cursor_size;
> -
> -					igt_subtest_group
> -						run_size_tests(data, size_tests[i].testfunc, w, h);
> -
> -					/*
> -					 * Test non-square cursors a bit on the platforms
> -					 * that support such things. And make it a bit more
> -					 * interesting by using a non-pot height.
> -					 */
> -					h /= 3;
> -
> -					igt_subtest_group
> -						run_size_tests(data, size_tests[i].testfunc, w, h);
> -				}
> +			for (cursor_size = 32; cursor_size <= 512; cursor_size *= 2) {
> +				int w = cursor_size;
> +				int h = cursor_size;
> +
> +				igt_subtest_with_dynamic_f("%s-%dx%d", size_tests[i].name, w, h)
> +					run_size_tests(data, size_tests[i].testfunc, w, h);
> +
> +				/*
> +				 * Test non-square cursors a bit on the platforms
> +				 * that support such things. And make it a bit more
> +				 * interesting by using a non-pot height.
> +				 */
> +				h /= 3;
> +				igt_subtest_with_dynamic_f("%s-%dx%d", size_tests[i].name, w, h)
> +					run_size_tests(data, size_tests[i].testfunc, w, h);
>   			}
> +
> +			igt_subtest_with_dynamic_f("%s-max-size", size_tests[i].name)
> +				run_size_tests(data, size_tests[i].testfunc, 0, 0);
>   		}
>   	}
>   }
