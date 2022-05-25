Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB87E10E731
 for <igt-dev@lists.freedesktop.org>; Wed, 25 May 2022 06:26:31 +0000 (UTC)
Message-ID: <7b1fd7ac-6f06-ba60-ce63-f645de402661@intel.com>
Date: Wed, 25 May 2022 11:56:11 +0530
Content-Language: en-US
To: Ananya Sharma <ananya.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220524120722.1756689-1-ananya.sharma@intel.com>
 <20220524120722.1756689-2-ananya.sharma@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220524120722.1756689-2-ananya.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/2]
 tests/kms_universal_plane:Convert tests to dynamic
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

On Tue-24-05-2022 05:37 pm, Ananya Sharma wrote:
> Modified kms_universal_plane to include dynamic test cases.
> 
> Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
> ---
>   tests/kms_universal_plane.c | 40 +++++++++++++++++++++++--------------
>   1 file changed, 25 insertions(+), 15 deletions(-)
> 
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index 3cb6d704..2bc722d2 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -762,35 +762,45 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
>   	}
>   
>   	igt_describe("Check the switching between different primary plane fbs with CRTC off");
> -	igt_subtest_f("universal-plane-pipe-%s-functional",
> -		      kmstest_pipe_name(pipe))
> +	igt_subtest_with_dynamic_f("universal-plane-pipe-%s-functional",
> +		      kmstest_pipe_name(pipe)){
>   		for_each_valid_output_on_pipe(&data->display, pipe, output)
> -			functional_test_pipe(data, pipe, output);
> +			igt_dynamic_f("%s", igt_output_name(output))
> +				functional_test_pipe(data, pipe, output);
> +	}

Still, there is no difference in test list.

universal-plane-pipe-A-functional
universal-plane-pipe-B-functional
universal-plane-pipe-C-functional
universal-plane-pipe-D-functional
universal-plane-pipe-E-functional
universal-plane-pipe-F-functional

Please try with below template:

igt_subtest_with_dynamic("test_name") {
	for_each_pipe_with_valid_output() {
		igt_dynamic(<pipe name>-<output name>) {
			<do your stuff>;
		}
	}
}

Note: this comment is applicable for all the places.

- Bhanu

>   
>   	igt_describe("Test for scale-up or scale-down using universal plane API without covering CRTC");
> -	igt_subtest_f("universal-plane-pipe-%s-sanity",
> -		      kmstest_pipe_name(pipe))
> +	igt_subtest_with_dynamic_f("universal-plane-pipe-%s-sanity",
> +		      kmstest_pipe_name(pipe)){
>   		for_each_valid_output_on_pipe(&data->display, pipe, output)
> -			sanity_test_pipe(data, pipe, output);
> +			igt_dynamic_f("%s" ,igt_output_name(output))
> +				sanity_test_pipe(data, pipe, output);
> +	}
>   
>   	igt_describe("Check pageflips while primary plane is disabled before IOCTL or between IOCTL"
>   			" and pageflip execution");
> -	igt_subtest_f("disable-primary-vs-flip-pipe-%s",
> -		      kmstest_pipe_name(pipe))
> +	igt_subtest_with_dynamic_f("disable-primary-vs-flip-pipe-%s",
> +		      kmstest_pipe_name(pipe)){
>   		for_each_valid_output_on_pipe(&data->display, pipe, output)
> -			pageflip_test_pipe(data, pipe, output);
> +			igt_dynamic_f("%s", igt_output_name(output))
> +				pageflip_test_pipe(data, pipe, output);
> +	}
>   
>   	igt_describe("Check for cursor leaks after performing cursor operations");
> -	igt_subtest_f("cursor-fb-leak-pipe-%s",
> -		      kmstest_pipe_name(pipe))
> +	igt_subtest_with_dynamic_f("cursor-fb-leak-pipe-%s",
> +		      kmstest_pipe_name(pipe)){
>   		for_each_valid_output_on_pipe(&data->display, pipe, output)
> -			cursor_leak_test_pipe(data, pipe, output);
> +			igt_dynamic_f("%s", igt_output_name(output))
> +				cursor_leak_test_pipe(data, pipe, output);
> +	}
>   
>   	igt_describe("Check if pageflip succeeds in windowed setting");
> -	igt_subtest_f("universal-plane-gen9-features-pipe-%s",
> -		      kmstest_pipe_name(pipe))
> +	igt_subtest_with_dynamic_f("universal-plane-gen9-features-pipe-%s",
> +		      kmstest_pipe_name(pipe)){
>   		for_each_valid_output_on_pipe(&data->display, pipe, output)
> -			gen9_test_pipe(data, pipe, output);
> +			igt_dynamic_f("%s", igt_output_name(output))
> +				gen9_test_pipe(data, pipe, output);
> +	}
>   }
>   
>   static data_t data;
