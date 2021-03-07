Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E696E152
 for <igt-dev@lists.freedesktop.org>; Sun,  7 Mar 2021 15:41:21 +0000 (UTC)
From: "Khajapasha, Mohammed" <mohammed.khajapasha@intel.com>
Date: Sun, 7 Mar 2021 15:41:17 +0000
Message-ID: <SN6PR11MB29432B8776FC2855FD4D0600E9949@SN6PR11MB2943.namprd11.prod.outlook.com>
References: <20210218191552.555624-1-arundhati.hagaragi@intel.com>
In-Reply-To: <20210218191552.555624-1-arundhati.hagaragi@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v5] tests/kms_plane_scaling:added test
 description
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
> Sent: Friday, February 19, 2021 12:46 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Gupta, Nidhi1 <nidhi1.gupta@intel.com>; Khajapasha; Khajapasha,
> Mohammed <mohammed.khajapasha@intel.com>
> Subject: [PATCH i-g-t v5] tests/kms_plane_scaling:added test description

Probably "Add plane scaling test descriptions for subtests"
> 
> From: Nidhi Gupta <nidhi1.gupta@intel.com>
> 
> Added description for all subtests
Same as above
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> Cc: Khajapasha, Mohammed <Mohammed.Khajapasha@intel.com>
> 
> v2: Modified description for subtests. (Khajapasha)
> v3: Removed "the" from each subtest description (Khajapasha) v4, v5:
> modified description to be generic. (Khajapasha)
> ---
>  tests/kms_plane_scaling.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c index
> c63eb428..6702f768 100644
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
> +			igt_describe("Test plane scaling with clipping-
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
