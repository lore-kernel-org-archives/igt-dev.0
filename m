Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D1110E115
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Sep 2022 02:51:08 +0000 (UTC)
Message-ID: <2b761c44-85ce-1118-a22c-db054fdd839c@intel.com>
Date: Wed, 14 Sep 2022 08:20:49 +0530
Content-Language: en-US
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220909071401.4938-1-jeevan.b@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220909071401.4938-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] kms_flip_event_leak: Create dynamic
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

On Fri-09-09-2022 12:44 pm, Jeevan B wrote:
> Converting the existing subtests to dynamic subtests.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/kms_flip_event_leak.c | 27 ++++++++++++++++++---------
>   1 file changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/kms_flip_event_leak.c b/tests/kms_flip_event_leak.c
> index ac201293..33aa6ab3 100644
> --- a/tests/kms_flip_event_leak.c
> +++ b/tests/kms_flip_event_leak.c
> @@ -89,24 +89,33 @@ static void test(data_t *data, enum pipe pipe, igt_output_t *output)
>   	igt_remove_fb(data->drm_fd, &fb[0]);
>   }
>   
> -igt_simple_main
> +igt_main
>   {
>   	data_t data = {};
>   	igt_output_t *output;
>   	int valid_tests = 0;
>   	enum pipe pipe;
>   
> -	data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> -	kmstest_set_vt_graphics_mode();
> +	igt_fixture {
> +		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> +		kmstest_set_vt_graphics_mode();
> +
> +		igt_display_require(&data.display, data.drm_fd);

Please add igt_disply_require_output() in igt_fixture.

> +	}
>   
> -	igt_display_require(&data.display, data.drm_fd);
>   
> -	for_each_pipe_with_valid_output(&data.display, pipe, output) {
> -		test(&data, pipe, output);
> -		valid_tests++;
> +	igt_subtest_with_dynamic("kms_flip_event_leak") {

Binary name as subtest name? Please update it "basic" or something useful.

> +		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> +			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {

Please append output name to dynamic subtest.
Ex: pipe-A-DP-1

> +				test(&data, pipe, output);

Please add igt_display_reset() just before calling test() or inside the 
test() just before calling igt_output_set_pipe()

> +				valid_tests++;
> +			}
> +		}
>   	}
>   
> -	igt_require_f(valid_tests, "no valid crtc/connector combinations found\n");
> +	igt_fixture {
> +		igt_require_f(valid_tests, "no valid crtc/connector combinations found\n");

This check is not required, igt will throw SKIP if igt_dynamic*() is not 
executed.

- Bhanu

>   
> -	igt_display_fini(&data.display);
> +		igt_display_fini(&data.display);
> +	}
>   }
