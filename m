Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A805F112696
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Jul 2022 04:36:29 +0000 (UTC)
Message-ID: <c8af98f4-43f0-0ab4-e7a4-3bbe9e67831b@intel.com>
Date: Thu, 7 Jul 2022 10:06:11 +0530
Content-Language: en-US
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220628133554.37768-1-mohammed.thasleem@intel.com>
 <20220628133554.37768-2-mohammed.thasleem@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220628133554.37768-2-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v3 1/2] tests/i915/kms_mmap_write_crc: Create
 dynamic subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: nidhi1.gupta@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue-28-06-2022 07:05 pm, Mohammed Thasleem wrote:
> Modified kms_mmap_write_crc to include dynamic test cases.
> 
> v2: moved for loop to after igt_subtest_with_dynamic.
> v3: added break and moved for loop back in igt_dynamic_f.
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   tests/i915/kms_mmap_write_crc.c | 40 ++++++++++++++++-----------------
>   1 file changed, 19 insertions(+), 21 deletions(-)
> 
> diff --git a/tests/i915/kms_mmap_write_crc.c b/tests/i915/kms_mmap_write_crc.c
> index b17e5fdb..50aa434d 100644
> --- a/tests/i915/kms_mmap_write_crc.c
> +++ b/tests/i915/kms_mmap_write_crc.c
> @@ -213,23 +213,9 @@ static void cleanup_crtc(data_t *data)
>   
>   static void run_test(data_t *data)
>   {
> -	igt_display_t *display = &data->display;
> -	igt_output_t *output;
> -	enum pipe pipe;
> -
> -	for_each_pipe_with_valid_output(display, pipe, output) {
> -		data->output = output;
> -		data->pipe = pipe;
> -
> -		prepare_crtc(data);
> -		test(data);
> -		cleanup_crtc(data);
> -
> -		/* once is enough */
> -		return;
> -	}
> -
> -	igt_skip("no valid crtc/connector combinations found\n");
> +	prepare_crtc(data);
> +	test(data);
> +	cleanup_crtc(data);
>   }
>   
>   struct igt_helper_process hog;
> @@ -270,6 +256,8 @@ static data_t data;
>   igt_main_args("n", NULL, NULL, opt_handler, NULL)
>   {
>   	int i;
> +	igt_output_t *output;
> +	enum pipe pipe;
>   
>   	igt_fixture {
>   		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
> @@ -286,10 +274,20 @@ igt_main_args("n", NULL, NULL, opt_handler, NULL)
>   	}
>   
>   	igt_describe("Tests that caching mode has become UC/WT and flushed using mmap write");
> -	igt_subtest("main") {
> -		igt_info("Using %d rounds for the test\n", ROUNDS);
> -		for (i = 0; i < ROUNDS; i++)
> -			run_test(&data);
> +	igt_info("Using %d rounds for each pipe in the test\n", ROUNDS);

Please move this print inside igt_dynamic() block.

> +
> +	igt_subtest_with_dynamic("main") {
> +		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> +			igt_dynamic_f("%s-pipe-%s", igt_output_name(output),
> +				      kmstest_pipe_name(pipe)) {

Update the subtest name as <pipe_name>-<output name>

- Bhanu

> +				data.output = output;
> +				data.pipe = pipe;
> +				for (i = 0; i < ROUNDS; i++)
> +					run_test(&data);
> +			}
> +			/* once is enough */
> +			break;
> +		}
>   	}
>   
>   	igt_fixture {
