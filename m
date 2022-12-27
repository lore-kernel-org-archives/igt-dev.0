Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A78E10E02D
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Dec 2022 06:25:24 +0000 (UTC)
Message-ID: <3785112b-64bf-7c98-fe6d-6973ed76a4cf@intel.com>
Date: Tue, 27 Dec 2022 11:54:54 +0530
To: <igt-dev@lists.freedesktop.org>
References: <20221115170855.196572-1-bhanuprakash.modem@intel.com>
 <20221115170855.196572-22-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20221115170855.196572-22-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t v5 21/52] tests/kms_pipe_crc_basic: Add
 support for Bigjoiner
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

On 11/15/2022 10:38 PM, Bhanuprakash Modem wrote:
> This patch will add a check to Skip the subtest if a selected pipe/output
> combo won't support Bigjoiner or 8K mode.
> 
> Example:
> * Pipe-D wont support a mode > 5K
> * To use 8K mode on a pipe then consecutive pipe must be available & free.
> 
> V2: - Use updated helper name
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
LGTM
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>

> ---
>   tests/kms_pipe_crc_basic.c | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
> index 91a1b8ab..ffc77eb3 100644
> --- a/tests/kms_pipe_crc_basic.c
> +++ b/tests/kms_pipe_crc_basic.c
> @@ -274,6 +274,21 @@ static void test_disable_crc_after_crtc(data_t *data, enum pipe pipe,
>   	igt_remove_fb(data->drm_fd, &data->fb);
>   }
>   
> +static bool pipe_output_combo_valid(igt_display_t *display,
> +				    enum pipe pipe, igt_output_t *output)
> +{
> +	bool ret = true;
> +
> +	igt_display_reset(display);
> +
> +	igt_output_set_pipe(output, pipe);
> +	if (!i915_pipe_output_combo_valid(display))
> +		ret = false;
> +	igt_output_set_pipe(output, PIPE_NONE);
> +
> +	return ret;
> +}
> +
>   data_t data = {0, };
>   
>   igt_main
> @@ -322,6 +337,9 @@ igt_main
>   		igt_describe(tests[i].desc);
>   		igt_subtest_with_dynamic(tests[i].name) {
>   			for_each_pipe_with_single_output(&data.display, pipe, output) {
> +				if(!pipe_output_combo_valid(&data.display, pipe, output))
> +					continue;
> +
>   				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
>   					if (tests[i].flags & TEST_SUSPEND) {
>   						test_read_crc(&data, pipe, output, 0);
> @@ -350,6 +368,9 @@ igt_main
>   		     "does not cause issues.");
>   	igt_subtest_with_dynamic("disable-crc-after-crtc") {
>   		for_each_pipe_with_single_output(&data.display, pipe, output) {
> +			if(!pipe_output_combo_valid(&data.display, pipe, output))
> +				continue;
> +
>   			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
>   				test_disable_crc_after_crtc(&data, pipe, output);
>   		}
> @@ -358,6 +379,9 @@ igt_main
>   	igt_describe("Basic sanity check for CRC mismatches");
>   	igt_subtest_with_dynamic("compare-crc-sanitycheck") {
>   		for_each_pipe_with_single_output(&data.display, pipe, output) {
> +			if(!pipe_output_combo_valid(&data.display, pipe, output))
> +				continue;
> +
>   			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
>   				test_compare_crc(&data, pipe, output);
>   		}
