Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A859110E5DD
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Sep 2022 09:01:50 +0000 (UTC)
Message-ID: <984ec78f-f081-c70a-cadd-497e86e01f50@intel.com>
Date: Mon, 19 Sep 2022 14:31:26 +0530
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220914064211.27625-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220914064211.27625-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] kms_flip_event_leak: Create dynamic
 subtests
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

On Wed-14-09-2022 12:12 pm, Jeevan B wrote:
> Converting the existing subtests to dynamic subtests.
> 
> v2: Add igt_dispaly_require_output and igt_display_reset and update the
> test name. (Bhanu)
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/kms_flip_event_leak.c | 29 ++++++++++++++++++-----------
>   1 file changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/kms_flip_event_leak.c b/tests/kms_flip_event_leak.c
> index ac201293..d5a40c24 100644
> --- a/tests/kms_flip_event_leak.c
> +++ b/tests/kms_flip_event_leak.c
> @@ -48,6 +48,7 @@ static void test(data_t *data, enum pipe pipe, igt_output_t *output)
>   	struct igt_fb fb[2];
>   	int fd, ret;
>   
> +	igt_display_reset(&data->display);
>   	/* select the pipe we want to use */
>   	igt_output_set_pipe(output, pipe);
>   
> @@ -89,24 +90,30 @@ static void test(data_t *data, enum pipe pipe, igt_output_t *output)
>   	igt_remove_fb(data->drm_fd, &fb[0]);
>   }
>   
> -igt_simple_main
> +igt_main
>   {
>   	data_t data = {};
>   	igt_output_t *output;
> -	int valid_tests = 0;
>   	enum pipe pipe;
>   
> -	data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> -	kmstest_set_vt_graphics_mode();
> +	igt_fixture {
> +		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> +		kmstest_set_vt_graphics_mode();
>   
> -	igt_display_require(&data.display, data.drm_fd);
> -
> -	for_each_pipe_with_valid_output(&data.display, pipe, output) {
> -		test(&data, pipe, output);
> -		valid_tests++;
> +		igt_display_require(&data.display, data.drm_fd);
> +		igt_display_require_output(&data.display);
>   	}
>   
> -	igt_require_f(valid_tests, "no valid crtc/connector combinations found\n");
>   
> -	igt_display_fini(&data.display);
> +	igt_subtest_with_dynamic("kms_flip_event_leak_basic") {

s/kms_flip_event_leak_basic/basic/

> +		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> +			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe)) {

Please update the test name as <pipe name>-<output name> instead of 
<output name>-<pipe name>.

With above comments addressed, this patch is
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

- Bhanu

> +				test(&data, pipe, output);
> +			}
> +		}
> +	}
> +
> +	igt_fixture {
> +		igt_display_fini(&data.display);
> +	}
>   }
