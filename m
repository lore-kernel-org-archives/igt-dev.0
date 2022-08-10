Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF98AEABE
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Aug 2022 04:42:26 +0000 (UTC)
Message-ID: <6e03d826-b4d1-9c83-c110-05a24b55948e@intel.com>
Date: Wed, 10 Aug 2022 10:12:02 +0530
Content-Language: en-US
To: Ananya Sharma <ananya.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220805050815.820130-1-ananya.sharma@intel.com>
 <20220805050815.820130-3-ananya.sharma@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220805050815.820130-3-ananya.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/2] tests/kms_universal_plane:
 Convert test to dynamic
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

On Fri-05-08-2022 10:38 am, Ananya Sharma wrote:
> Modified kms_universal_plane to include dynamic test cases.
> 
> Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
> ---
>   tests/kms_universal_plane.c | 76 ++++++++++++++++++++-----------------
>   1 file changed, 41 insertions(+), 35 deletions(-)
> 
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index bd0900a2..9fddc9c5 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -767,35 +767,46 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
>   	}
>   
>   	igt_describe("Check the switching between different primary plane fbs with CRTC off");
> -	igt_subtest_f("universal-plane-pipe-%s-functional",
> -		      kmstest_pipe_name(pipe))
> -		for_each_valid_output_on_pipe(&data->display, pipe, output)
> -			functional_test_pipe(data, pipe, output);
> -
> -	igt_describe("Test for scale-up or scale-down using universal plane API without covering CRTC");
> -	igt_subtest_f("universal-plane-pipe-%s-sanity",
> -		      kmstest_pipe_name(pipe))
> -		for_each_valid_output_on_pipe(&data->display, pipe, output)
> -			sanity_test_pipe(data, pipe, output);
> -
> -	igt_describe("Check pageflips while primary plane is disabled before IOCTL or between IOCTL"
> -			" and pageflip execution");
> -	igt_subtest_f("disable-primary-vs-flip-pipe-%s",
> -		      kmstest_pipe_name(pipe))
> -		for_each_valid_output_on_pipe(&data->display, pipe, output)
> -			pageflip_test_pipe(data, pipe, output);
> -
> -	igt_describe("Check for cursor leaks after performing cursor operations");
> -	igt_subtest_f("cursor-fb-leak-pipe-%s",
> -		      kmstest_pipe_name(pipe))
> -		for_each_valid_output_on_pipe(&data->display, pipe, output)
> -			cursor_leak_test_pipe(data, pipe, output);
> -
> -	igt_describe("Check if pageflip succeeds in windowed setting");
> -	igt_subtest_f("universal-plane-gen9-features-pipe-%s",
> -		      kmstest_pipe_name(pipe))
> -		for_each_valid_output_on_pipe(&data->display, pipe, output)
> -			gen9_test_pipe(data, pipe, output);
> +        igt_subtest_with_dynamic("universal-plane-pipe-functional"){

Please remove "pipe-" from subtest name, since we have it in dynamic 
subtest name. This comment is applicable for all subtests.

> +                for_each_pipe_with_valid_output(&data->display, pipe, output){

As this IGT is dealing with planes, I guess it's ok to use any output. 
Hence we can use for_each_pipe_with_single_output()

> +                        igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),igt_output_name(output)){
> +                                functional_test_pipe(data, pipe, output);
> +                        }
> +                }
> +        }

Please follow some coding styles. Ex: add new line here.

> +        igt_describe("Test for scale-up or scale-down using universal plane API without covering CRTC");
> +        igt_subtest_with_dynamic("universal-plane-pipe-sanity"){
> +                for_each_pipe_with_valid_output(&data->display, pipe, output){
> +                        igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)){
> +                                sanity_test_pipe(data, pipe, output);
> +                        }
> +                }
> +        }
> +        igt_describe("Check pageflips while primary plane is disabled before IOCTL or between IOCTL"
> +                        " and pageflip execution");
> +        igt_subtest_with_dynamic("disable-primary-vs-flip"){
> +                for_each_pipe_with_valid_output(&data->display, pipe, output){
> +                        igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)){
> +                                pageflip_test_pipe(data, pipe, output);
> +                        }
> +                }
> +        }
> +        igt_describe("Check for cursor leaks after performing cursor operations");
> +        igt_subtest_with_dynamic("cursor-fb-leak"){
> +                for_each_pipe_with_valid_output(&data->display, pipe, output){
> +                        igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)){
> +                                cursor_leak_test_pipe(data, pipe, output);
> +                        }
> +		}
> +        }
> +        igt_describe("Check if pageflip succeeds in windowed setting");
> +        igt_subtest_with_dynamic("universal-plane-gen9-features"){
> +                for_each_pipe_with_valid_output(&data->display, pipe, output){

Please move all prerequisites before calling igt_dynamic().
Ex: data->display_ver >= 9 for gen9_test_pipe()

> +                        igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)){
> +                                gen9_test_pipe(data, pipe, output);
> +                        }
> +                }
> +        }

We can use array of structures (with callbacks/function pointers) to 
populate subtests to avoid code duplication.

Example: Please refer gamma_degamma_tests in tests/kms_color.c

>   }
>   
>   static data_t data;
> @@ -814,12 +825,7 @@ igt_main
>   		igt_require_pipe_crc(data.drm_fd);
>   		igt_display_require(&data.display, data.drm_fd);
>   	}
> -
> -	for_each_pipe_static(pipe) {
> -		igt_subtest_group
> -			run_tests_for_pipe(&data, pipe);
> -	}
> -
> +	run_tests_for_pipe(&data, pipe);

No need to send pipe as an argument, we are going to iterate all pipes 
in side run_tests_for_pipe() and you can declare a pipe there.

Also, we can keep igt_subtest_group to group these tests.

- Bhanu

>   	igt_fixture {
>   		igt_display_fini(&data.display);
>   	}
