Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2EA96E420
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Nov 2021 11:24:03 +0000 (UTC)
Date: Wed, 17 Nov 2021 13:22:57 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YZTmEcxYmgZJaFJX@platvala-desk.ger.corp.intel.com>
References: <20211116173131.240657-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211116173131.240657-1-markyacoub@chromium.org>
Subject: Re: [igt-dev] [PATCH] tests: Skip tests using LUTs when the driver
 doesn't support it.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mark Yacoub <markyacoub@chromium.org>
Cc: robdclark@chromium.org, igt-dev@lists.freedesktop.org, seanpaul@chromium.org, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Nov 16, 2021 at 12:31:31PM -0500, Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@google.com>
> 
> [Why]
> Some drivers such as msm do not support CTM and their CRTC doesn't have
> LUT props. Tests should skip relevant tests when it's not supported.
> 
> [How]
> Check for the LUT pipe prop before starting relevant subtest.
> 
> Tested on Trogdor (msm)
> 
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  tests/kms_color.c |  8 ++++++++
>  tests/kms_plane.c | 52 ++++++++++++++++++++++++++++-------------------
>  2 files changed, 39 insertions(+), 21 deletions(-)
> 
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index 775f3596..99a59cd8 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -905,6 +905,14 @@ igt_main
>  	}
>  
>  	for_each_pipe_static(pipe) {
> +		igt_fixture {
> +			igt_require_f(igt_pipe_has_prop(&data.display, pipe,
> +											IGT_CRTC_GAMMA_LUT) &&
> +								igt_pipe_has_prop(&data.display, pipe,
> +												IGT_CRTC_DEGAMMA_LUT),
> +							"Driver doesn't support CTM.\n");
> +		}

I went through the subtests and they mostly do this already for all
the props they're using. The only exception is *-legacy-gamma, in
test_pipe_legacy_gamma(). (notably, the legacy_gamma_reset() function
does check that the prop exists)



> +
>  		igt_subtest_group
>  			run_tests_for_pipe(&data, pipe);
>  
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 405d4c21..d82214ed 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -1090,28 +1090,38 @@ run_tests_for_pipe_plane(data_t *data)
>  		igt_require(data->display.pipes[pipe].n_planes > 0);
>  	}
>  
> -	igt_describe("verify the pixel formats for given plane and pipe");
> -	igt_subtest_with_dynamic_f("pixel-format") {
> -		count = 0;
> -		for_each_pipe(&data->display, pipe) {
> -			igt_dynamic_f("pipe-%s-planes", kmstest_pipe_name(pipe))
> -				test_pixel_formats(data, pipe);
> -			if (is_pipe_limit_reached(++count))
> -				break;
> -		}
> -	}
> -	igt_describe("verify the pixel formats for given plane and pipe with source clamping");
> -	igt_subtest_with_dynamic_f("pixel-format-source-clamping") {
> -		count = 0;
> -		for_each_pipe(&data->display, pipe) {
> -			igt_dynamic_f("pipe-%s-planes", kmstest_pipe_name(pipe)) {
> -				data->crop = 4;
> -				test_pixel_formats(data, pipe);
> +		igt_describe("Verify the pixel formats for given plane and pipe");
> +		igt_subtest_group {
> +			igt_fixture {
> +				igt_require_f(igt_pipe_has_prop(&data->display, pipe,
> +												IGT_CRTC_GAMMA_LUT) &&
> +								  igt_pipe_has_prop(&data->display, pipe,
> +													IGT_CRTC_DEGAMMA_LUT),
> +							  "Driver doesn't support CTM.\n");

These tests don't use these props, they use the SETGAMMA ioctl.


-- 
Petri Latvala


>  			}
> -			if (is_pipe_limit_reached(++count))
> -				break;
> -		}
> -	}
> +
> +			igt_subtest_with_dynamic_f("pixel-format") {
> +				count = 0;
> +				for_each_pipe(&data->display, pipe) {
> +					igt_dynamic_f("pipe-%s-planes", kmstest_pipe_name(pipe))
> +						test_pixel_formats(data, pipe);
> +					if (is_pipe_limit_reached(++count))
> +						break;
> +				}
> +			}
> +		    igt_subtest_with_dynamic_f("pixel-format-source-clamping") {
> +				count = 0;
> +				for_each_pipe(&data->display, pipe) {
> +				    igt_dynamic_f("pipe-%s-planes", kmstest_pipe_name(pipe)) {
> +						data->crop = 4;
> +						test_pixel_formats(data, pipe);
> +				    }
> +				    if (is_pipe_limit_reached(++count))
> +						break;
> +				}
> +		    }
> +        }
> +
>  
>  	data->crop = 0;
>  	igt_describe("verify plane position using two planes to create a fully covered screen");
> -- 
> 2.34.0.rc1.387.gb447b232ab-goog
> 
