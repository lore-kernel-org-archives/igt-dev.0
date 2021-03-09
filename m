Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BBD36E924
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Mar 2021 18:48:53 +0000 (UTC)
From: "Khajapasha, Mohammed" <mohammed.khajapasha@intel.com>
Date: Tue, 9 Mar 2021 18:48:43 +0000
Message-ID: <DM6PR11MB29386B8B04E00B504044C5A2E9929@DM6PR11MB2938.namprd11.prod.outlook.com>
References: <20210309112943.1398325-1-arundhati.hagaragi@intel.com>
In-Reply-To: <20210309112943.1398325-1-arundhati.hagaragi@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v8] tests/kms_plane_scaling: Add plane
 scaling test descriptions for subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Hagaragi, Arundhati" <arundhati.hagaragi@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Gupta, Nidhi1" <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Hagaragi, Arundhati <arundhati.hagaragi@intel.com>
> Sent: Tuesday, March 9, 2021 5:00 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Gupta, Nidhi1 <nidhi1.gupta@intel.com>; Khajapasha, Mohammed
> <mohammed.khajapasha@intel.com>
> Subject: [PATCH i-g-t v8] tests/kms_plane_scaling: Add plane scaling test
> descriptions for subtests
> 
> From: Nidhi Gupta <nidhi1.gupta@intel.com>
> 
> Add plane scaling test descriptions for subtests.
> Plane scaling with tiling rotation, pixel formats, overlay planes and with
> clipping and clamping
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> Cc: Khajapasha Mohammed <mohammed.khajapasha@intel.com>
> 
> v1-v8 : Review Comments (Khaja)
> ---
>  tests/kms_plane_scaling.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c index
> c63eb428..b0d4dcf6 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -695,32 +695,38 @@ igt_main_args("", long_opts, help_str,
> opt_handler, &data)
>  		igt_output_t *output;
> 
>  		igt_subtest_with_dynamic("plane-scaling") {
> +			igt_describe("Test plane scaling with overlay
> planes");
>  			for_each_pipe_with_single_output(&data.display,
> pipe, output)
>  				igt_dynamic_f("pipe-%s-plane-scaling",
> kmstest_pipe_name(pipe))
>  					test_plane_scaling_on_pipe(&data,
> pipe, output);
>  		}
> 
>  		igt_subtest_with_dynamic("scaler-with-pixel-format") {
> +			igt_describe("Test plane scaling with pixel formats");
>  			for_each_pipe_with_single_output(&data.display,
> pipe, output)
>  				igt_dynamic_f("pipe-%s-scaler-with-pixel-
> format", kmstest_pipe_name(pipe))
> 
> 	test_scaler_with_pixel_format_pipe(&data, pipe, output);
>  		}
> 
>  		igt_subtest_with_dynamic("scaler-with-rotation") {
> +			igt_describe("Test plane scaling with rotation");
>  			for_each_pipe_with_single_output(&data.display,
> pipe, output)
>  				igt_dynamic_f("pipe-%s-scaler-with-
> rotation", kmstest_pipe_name(pipe))
> 
> 	test_scaler_with_rotation_pipe(&data, pipe, output);
>  		}
> 
>  		igt_subtest_with_dynamic("scaler-with-clipping-clamping") {
> +			igt_describe("Test plane scaling with  clipping-
> clamping");
>  			for_each_pipe_with_single_output(&data.display,
> pipe, output)
>  				igt_dynamic_f("pipe-%s-scaler-with-clipping-
> clamping", kmstest_pipe_name(pipe))
> 
> 	test_scaler_with_clipping_clamping_scenario(&data, pipe, output);
>  		}
>  	}
> 
> -	igt_subtest_f("2x-scaler-multi-pipe")
> +	igt_subtest_f("2x-scaler-multi-pipe") {
> +		igt_describe("Test to display planes on connected pipes and
> runs
> +scaling test on it");

"Test multi plane scaling with connected outputs for pipes"
test_scaler_with_multi_pipe_plane() runs the plane scaling for pipes which are connected with an output,
and creates the framebuffers for each plane of pipe and runs scaling with connector mode.

With said: Reviewed-by: Khajapasha, Mohammed <mohammed.khajapasha@intel.com>

>  		test_scaler_with_multi_pipe_plane(&data);
> +	}
> 
>  	igt_fixture
>  		igt_display_fini(&data.display);


> --
> 2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
