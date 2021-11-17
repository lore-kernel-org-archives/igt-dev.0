Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF6B6E0EF
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Nov 2021 01:09:57 +0000 (UTC)
Message-ID: <6aca8bf2-3f0b-b4ae-9c80-1b0354731f72@quicinc.com>
Date: Tue, 16 Nov 2021 17:03:49 -0800
MIME-Version: 1.0
Content-Language: en-US
References: <20211116173131.240657-1-markyacoub@chromium.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20211116173131.240657-1-markyacoub@chromium.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
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
To: Mark Yacoub <markyacoub@chromium.org>, igt-dev@lists.freedesktop.org
Cc: robdclark@chromium.org, petri.latvala@intel.com, seanpaul@chromium.org, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mark,

On 11/16/2021 9:31 AM, Mark Yacoub wrote:
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
>   tests/kms_color.c |  8 ++++++++
>   tests/kms_plane.c | 52 ++++++++++++++++++++++++++++-------------------
>   2 files changed, 39 insertions(+), 21 deletions(-)
>
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index 775f3596..99a59cd8 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -905,6 +905,14 @@ igt_main
>   	}
>   
>   	for_each_pipe_static(pipe) {
> +		igt_fixture {
> +			igt_require_f(igt_pipe_has_prop(&data.display, pipe,
> +											IGT_CRTC_GAMMA_LUT) &&
> +								igt_pipe_has_prop(&data.display, pipe,
> +												IGT_CRTC_DEGAMMA_LUT),
> +							"Driver doesn't support CTM.\n");
> +		}
> +
Spacing looks a little messy and makes the code hard to read. Please 
reformat to something more legible.
>   		igt_subtest_group
>   			run_tests_for_pipe(&data, pipe);
>   
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 405d4c21..d82214ed 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -1090,28 +1090,38 @@ run_tests_for_pipe_plane(data_t *data)
>   		igt_require(data->display.pipes[pipe].n_planes > 0);
>   	}
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

Same here.

Thanks,

Jessica Zhang

>   			}
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
>   	data->crop = 0;
>   	igt_describe("verify plane position using two planes to create a fully covered screen");
