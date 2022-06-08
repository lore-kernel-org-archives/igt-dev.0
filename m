Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFAB810E541
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jun 2022 15:51:10 +0000 (UTC)
Message-ID: <8ddd567f-766d-6d68-e812-de1e568566da@intel.com>
Date: Wed, 8 Jun 2022 21:21:02 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20220517120245.3521494-1-bhanuprakash.modem@intel.com>
 <20220517120245.3521494-6-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20220517120245.3521494-6-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [V5 05/11] tests/kms_cursor_edge_walk: Convert tests
 to dynamic
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

Need clean CI.
Overall patch LGTM
Reviewed-by:  Swati Sharma <swati2.sharma@intel.com>

On 17-May-22 5:32 PM, Bhanuprakash Modem wrote:
> Convert the existing subtests to dynamic subtests at pipe level.
> 
> V2:
> * Fix nested igt_fixture in igt_subtest
> V3:
> * Add output name to subtest
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_cursor_edge_walk.c | 63 ++++++++++++++++--------------------
>   1 file changed, 28 insertions(+), 35 deletions(-)
> 
> diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
> index b775714f..526bc6b3 100644
> --- a/tests/kms_cursor_edge_walk.c
> +++ b/tests/kms_cursor_edge_walk.c
> @@ -309,6 +309,17 @@ static const char *help_str =
>   
>   igt_main_args("", long_opts, help_str, opt_handler, &data)
>   {
> +	struct {
> +		const char *name;
> +		unsigned flags;
> +	} tests[] = {
> +		{ "left-edge", EDGE_LEFT },
> +		{ "right-edge", EDGE_RIGHT },
> +		{ "top-edge", EDGE_TOP },
> +		{ "top-bottom", EDGE_BOTTOM },
> +	};
> +	int i;
> +
>   	igt_fixture {
>   		int ret;
>   
> @@ -328,44 +339,26 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   		igt_require_pipe_crc(data.drm_fd);
>   
>   		igt_display_require(&data.display, data.drm_fd);
> +		igt_display_require_output(&data.display);
>   	}
>   
> -	for_each_pipe_static(data.pipe) {
> -		igt_subtest_group {
> -			igt_fixture {
> -				igt_display_require_output_on_pipe(&data.display, data.pipe);
> -				data.output = igt_get_single_output_for_pipe(&data.display, data.pipe);
> -			}
> -
> -			for (data.curw = 64; data.curw <= 256; data.curw *= 2) {
> -				data.curh = data.curw;
> -
> -				igt_fixture
> +	igt_describe("Checking cursor by walking left/right/top/bottom edge of screen");
> +	igt_subtest_group {
> +		for (i = 0; i < ARRAY_SIZE(tests); i++) {
> +			igt_subtest_with_dynamic(tests[i].name) {
> +				for_each_pipe(&data.display, data.pipe) {
>   					igt_require(data.curw <= max_curw && data.curh <= max_curh);
> -
> -				igt_describe("Checking cursor by walking left edge of screen");
> -				igt_subtest_f("pipe-%s-%dx%d-left-edge",
> -					kmstest_pipe_name(data.pipe),
> -					data.curw, data.curh)
> -					test_crtc(&data, EDGE_LEFT);
> -
> -				igt_describe("Checking cursor by walking right edge of screen");
> -				igt_subtest_f("pipe-%s-%dx%d-right-edge",
> -					kmstest_pipe_name(data.pipe),
> -					data.curw, data.curh)
> -					test_crtc(&data, EDGE_RIGHT);
> -
> -				igt_describe("Checking cursor by walking top edge of screen");
> -				igt_subtest_f("pipe-%s-%dx%d-top-edge",
> -					kmstest_pipe_name(data.pipe),
> -					data.curw, data.curh)
> -					test_crtc(&data, EDGE_TOP);
> -
> -				igt_describe("Checking cursor by walking bottom edge of screen");
> -				igt_subtest_f("pipe-%s-%dx%d-bottom-edge",
> -					kmstest_pipe_name(data.pipe),
> -					data.curw, data.curh)
> -					test_crtc(&data, EDGE_BOTTOM);
> +					data.output = igt_get_single_output_for_pipe(&data.display, data.pipe);
> +
> +					for (data.curw = 64; data.curw <= 256; data.curw *= 2) {
> +						data.curh = data.curw;
> +						igt_dynamic_f("pipe-%s-%s-%dx%d",
> +							      kmstest_pipe_name(data.pipe),
> +							      data.output->name,
> +							      data.curw, data.curh)
> +							test_crtc(&data, tests[i].flags);
> +					}
> +				}
>   			}
>   		}
>   	}

-- 
~Swati Sharma
