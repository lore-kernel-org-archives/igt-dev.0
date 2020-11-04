Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B63A6E994
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2020 10:40:17 +0000 (UTC)
Date: Wed, 4 Nov 2020 12:40:14 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201104104014.GR7444@platvala-desk.ger.corp.intel.com>
References: <20201102101349.25019-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201102101349.25019-1-nidhi1.gupta@intel.com>
Subject: Re: [igt-dev] [RFC,
 i-g-t v2] Added dynamic subtests for accurate reporting
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
To: Nidhi Gupta <nidhi1.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Nov 02, 2020 at 03:43:49PM +0530, Nidhi Gupta wrote:
> For Multipipe scenario added dynamic subtests
> for accurate reporting of the results.
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---


All subtests remain with the same name, no change in behaviour apart
from reporting which output/pipe combo was tested... Seems
straightforward enough. If you want to drop the RFC and get this in,

Reviewed-by: Petri Latvala <petri.latvala@intel.com>



>  tests/kms_atomic_interruptible.c | 56 +++++++++++++++---------
>  tests/kms_flip_tiling.c          | 73 ++++++++++++++++++++------------
>  2 files changed, 81 insertions(+), 48 deletions(-)
> 
> diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interruptible.c
> index e5ccdf5b..27bb6a2b 100644
> --- a/tests/kms_atomic_interruptible.c
> +++ b/tests/kms_atomic_interruptible.c
> @@ -284,47 +284,61 @@ igt_main
>  		igt_require_sw_sync();
>  	}
>  
> -	igt_subtest("legacy-setmode")
> +	igt_subtest_with_dynamic("legacy-setmode") {
>  		for_each_pipe_with_valid_output(&display, pipe, output) {
> -			run_plane_test(&display, pipe, output, test_legacy_modeset, DRM_PLANE_TYPE_PRIMARY);
> -			break;
> +			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
> +				run_plane_test(&display, pipe, output, test_legacy_modeset, DRM_PLANE_TYPE_PRIMARY);
> +				break;
>  		}
> +	}
>  
> -	igt_subtest("atomic-setmode")
> +	igt_subtest_with_dynamic("atomic-setmode") {
>  		for_each_pipe_with_valid_output(&display, pipe, output) {
> -			run_plane_test(&display, pipe, output, test_atomic_modeset, DRM_PLANE_TYPE_PRIMARY);
> -			break;
> +			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
> +				run_plane_test(&display, pipe, output, test_atomic_modeset, DRM_PLANE_TYPE_PRIMARY);
> +				break;
>  		}
> +	}
>  
> -	igt_subtest("legacy-dpms")
> +	igt_subtest_with_dynamic("legacy-dpms") {
>  		for_each_pipe_with_valid_output(&display, pipe, output) {
> -			run_plane_test(&display, pipe, output, test_legacy_dpms, DRM_PLANE_TYPE_PRIMARY);
> -			break;
> +			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
> +				run_plane_test(&display, pipe, output, test_legacy_dpms, DRM_PLANE_TYPE_PRIMARY);
> +				break;
>  		}
> +	}
>  
> -	igt_subtest("legacy-pageflip")
> +	igt_subtest_with_dynamic("legacy-pageflip") {
>  		for_each_pipe_with_valid_output(&display, pipe, output) {
> -			run_plane_test(&display, pipe, output, test_pageflip, DRM_PLANE_TYPE_PRIMARY);
> -			break;
> +			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
> +				run_plane_test(&display, pipe, output, test_pageflip, DRM_PLANE_TYPE_PRIMARY);
> +				break;
>  		}
> +	}
>  
> -	igt_subtest("legacy-cursor")
> +	igt_subtest_with_dynamic("legacy-cursor") {
>  		for_each_pipe_with_valid_output(&display, pipe, output) {
> -			run_plane_test(&display, pipe, output, test_setcursor, DRM_PLANE_TYPE_CURSOR);
> -			break;
> +			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
> +				run_plane_test(&display, pipe, output, test_setcursor, DRM_PLANE_TYPE_CURSOR);
> +				break;
>  		}
> +	}
>  
> -	igt_subtest("universal-setplane-primary")
> +	igt_subtest_with_dynamic("universal-setplane-primary") {
>  		for_each_pipe_with_valid_output(&display, pipe, output) {
> -			run_plane_test(&display, pipe, output, test_setplane, DRM_PLANE_TYPE_PRIMARY);
> -			break;
> +			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
> +				run_plane_test(&display, pipe, output, test_setplane, DRM_PLANE_TYPE_PRIMARY);
> +				break;
>  		}
> +	}
>  
> -	igt_subtest("universal-setplane-cursor")
> +	igt_subtest_with_dynamic("universal-setplane-cursor") {
>  		for_each_pipe_with_valid_output(&display, pipe, output) {
> -			run_plane_test(&display, pipe, output, test_setplane, DRM_PLANE_TYPE_CURSOR);
> -			break;
> +			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
> +				run_plane_test(&display, pipe, output, test_setplane, DRM_PLANE_TYPE_CURSOR);
> +				break;
>  		}
> +	}
>  
>  	/* TODO: legacy gamma_set/get, object set/getprop, getcrtc, getconnector */
>  	igt_fixture {
> diff --git a/tests/kms_flip_tiling.c b/tests/kms_flip_tiling.c
> index fb79de15..7a736fba 100644
> --- a/tests/kms_flip_tiling.c
> +++ b/tests/kms_flip_tiling.c
> @@ -173,7 +173,7 @@ igt_main
>  	 * generated and compared to the reference one.
>  	 */
>  
> -	igt_subtest_f("flip-changes-tiling") {
> +	igt_subtest_with_dynamic("flip-changes-tiling") {
>  		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_X_TILED,
>  				       LOCAL_DRM_FORMAT_MOD_NONE };
>  		enum pipe pipe;
> @@ -181,11 +181,13 @@ igt_main
>  		for (int i = 0; i < ARRAY_SIZE(tiling); i++)
>  			igt_require(igt_display_has_format_mod(&data.display, data.testformat, tiling[i]));
>  
> -		for_each_pipe_with_valid_output(&data.display, pipe, output)
> -			test_flip_tiling(&data, pipe, output, tiling);
> +		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> +			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
> +				test_flip_tiling(&data, pipe, output, tiling);
> +		}
>  	}
>  
> -	igt_subtest_f("flip-changes-tiling-Y") {
> +	igt_subtest_with_dynamic("flip-changes-tiling-Y") {
>  		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_Y_TILED,
>  				       LOCAL_DRM_FORMAT_MOD_NONE };
>  		enum pipe pipe;
> @@ -197,11 +199,14 @@ igt_main
>  
>  		igt_require(data.gen >= 9);
>  
> -		for_each_pipe_with_valid_output(&data.display, pipe, output)
> -			test_flip_tiling(&data, pipe, output, tiling);
> +		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> +			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
> +				test_flip_tiling(&data, pipe, output, tiling);
> +		}
>  	}
>  
> -	igt_subtest_f("flip-changes-tiling-Yf") {
> +
> +	igt_subtest_with_dynamic("flip-changes-tiling-Yf") {
>  		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_Yf_TILED,
>  				       LOCAL_DRM_FORMAT_MOD_NONE };
>  		enum pipe pipe;
> @@ -213,8 +218,10 @@ igt_main
>  
>  		igt_require(data.gen >= 9);
>  
> -		for_each_pipe_with_valid_output(&data.display, pipe, output)
> -			test_flip_tiling(&data, pipe, output, tiling);
> +		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> +			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
> +				test_flip_tiling(&data, pipe, output, tiling);
> +		}
>  	}
>  
>  	/*
> @@ -225,7 +232,7 @@ igt_main
>  	 * reference one.
>  	 */
>  
> -	igt_subtest_f("flip-X-tiled") {
> +	igt_subtest_with_dynamic("flip-X-tiled") {
>  		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_X_TILED,
>  				       LOCAL_I915_FORMAT_MOD_X_TILED };
>  		enum pipe pipe;
> @@ -233,11 +240,13 @@ igt_main
>  		for (int i = 0; i < ARRAY_SIZE(tiling); i++)
>  			igt_require(igt_display_has_format_mod(&data.display, data.testformat, tiling[i]));
>  
> -		for_each_pipe_with_valid_output(&data.display, pipe, output)
> -			test_flip_tiling(&data, pipe, output, tiling);
> +		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> +			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
> +				test_flip_tiling(&data, pipe, output, tiling);
> +		}
>  	}
>  
> -	igt_subtest_f("flip-Y-tiled") {
> +	igt_subtest_with_dynamic("flip-Y-tiled") {
>  		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_Y_TILED,
>  				       LOCAL_I915_FORMAT_MOD_Y_TILED };
>  		enum pipe pipe;
> @@ -249,11 +258,13 @@ igt_main
>  
>  		igt_require(data.gen >= 9);
>  
> -		for_each_pipe_with_valid_output(&data.display, pipe, output)
> -			test_flip_tiling(&data, pipe, output, tiling);
> +		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> +			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
> +				test_flip_tiling(&data, pipe, output, tiling);
> +		}
>  	}
>  
> -	igt_subtest_f("flip-Yf-tiled") {
> +	igt_subtest_with_dynamic("flip-Yf-tiled") {
>  		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_Yf_TILED,
>  				       LOCAL_I915_FORMAT_MOD_Yf_TILED };
>  		enum pipe pipe;
> @@ -265,8 +276,10 @@ igt_main
>  
>  		igt_require(data.gen >= 9);
>  
> -		for_each_pipe_with_valid_output(&data.display, pipe, output)
> -			test_flip_tiling(&data, pipe, output, tiling);
> +		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> +			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
> +				test_flip_tiling(&data, pipe, output, tiling);
> +		}
>  	}
>  
>  	/*
> @@ -277,7 +290,7 @@ igt_main
>  	 * reference one.
>  	 */
>  
> -	igt_subtest_f("flip-to-X-tiled") {
> +	igt_subtest_with_dynamic("flip-to-X-tiled") {
>  		uint64_t tiling[2] = { LOCAL_DRM_FORMAT_MOD_NONE,
>  				       LOCAL_I915_FORMAT_MOD_X_TILED };
>  		enum pipe pipe;
> @@ -285,11 +298,13 @@ igt_main
>  		for (int i = 0; i < ARRAY_SIZE(tiling); i++)
>  			igt_require(igt_display_has_format_mod(&data.display, data.testformat, tiling[i]));
>  
> -		for_each_pipe_with_valid_output(&data.display, pipe, output)
> -			test_flip_tiling(&data, pipe, output, tiling);
> +		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> +			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
> +				test_flip_tiling(&data, pipe, output, tiling);
> +		}
>  	}
>  
> -	igt_subtest_f("flip-to-Y-tiled") {
> +	igt_subtest_with_dynamic("flip-to-Y-tiled") {
>  		uint64_t tiling[2] = { LOCAL_DRM_FORMAT_MOD_NONE,
>  				       LOCAL_I915_FORMAT_MOD_Y_TILED };
>  		enum pipe pipe;
> @@ -301,11 +316,13 @@ igt_main
>  
>  		igt_require(data.gen >= 9);
>  
> -		for_each_pipe_with_valid_output(&data.display, pipe, output)
> -			test_flip_tiling(&data, pipe, output, tiling);
> +		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> +			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
> +				test_flip_tiling(&data, pipe, output, tiling);
> +		}
>  	}
>  
> -	igt_subtest_f("flip-to-Yf-tiled") {
> +	igt_subtest_with_dynamic("flip-to-Yf-tiled") {
>  		uint64_t tiling[2] = { LOCAL_DRM_FORMAT_MOD_NONE,
>  				       LOCAL_I915_FORMAT_MOD_Yf_TILED };
>  		enum pipe pipe;
> @@ -317,8 +334,10 @@ igt_main
>  
>  		igt_require(data.gen >= 9);
>  
> -		for_each_pipe_with_valid_output(&data.display, pipe, output)
> -			test_flip_tiling(&data, pipe, output, tiling);
> +		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> +			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
> +				test_flip_tiling(&data, pipe, output, tiling);
> +		}
>  	}
>  
>  	igt_fixture {
> -- 
> 2.26.2
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
