Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 762AE10EA7C
 for <igt-dev@lists.freedesktop.org>; Mon,  9 May 2022 12:39:25 +0000 (UTC)
Date: Mon, 9 May 2022 14:39:20 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YnkLeGuBSSuekZUC@kamilkon-DESK1>
References: <20220509072637.3291112-1-bhanuprakash.modem@intel.com>
 <20220509072637.3291112-4-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220509072637.3291112-4-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [PATCH 3/6] tests/kms_cursor_edge_walk: Create
 dynamic subtests
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

Hi Bhanuprakash,

On 2022-05-09 at 12:56:34 +0530, Bhanuprakash Modem wrote:
> Covert the existing subtests to dynamic subtests at pipe level.
----^
s/Covert/Convert/

> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_cursor_edge_walk.c | 66 ++++++++++++++++--------------------
>  1 file changed, 30 insertions(+), 36 deletions(-)
> 
> diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
> index b775714f..01ac9790 100644
> --- a/tests/kms_cursor_edge_walk.c
> +++ b/tests/kms_cursor_edge_walk.c
> @@ -309,6 +309,17 @@ static const char *help_str =
>  
>  igt_main_args("", long_opts, help_str, opt_handler, &data)
>  {
> +	struct {
> +		const char *name;
> +		unsigned flags;

Add description field here.

> +	} tests[] = {
> +		{ "left-edge", EDGE_LEFT },

Put descriptions here.

> +		{ "right-edge", EDGE_RIGHT },
> +		{ "top-edge", EDGE_TOP },
> +		{ "top-bottom", EDGE_BOTTOM },
> +	};
> +	int i;
> +
>  	igt_fixture {
>  		int ret;
>  
> @@ -328,44 +339,27 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  		igt_require_pipe_crc(data.drm_fd);
>  
>  		igt_display_require(&data.display, data.drm_fd);
> +		igt_display_require_output(&data.display);
>  	}
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
> -					igt_require(data.curw <= max_curw && data.curh <= max_curh);
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
> +	igt_describe("Checking cursor by walking left/right/top/bottom edge of screen");
> +	igt_subtest_group {
> +		for (i = 0; i < ARRAY_SIZE(tests); i++) {

Please add description here.

Regards,
Kamil

> +			igt_subtest_with_dynamic(tests[i].name) {
> +				for_each_pipe(&data.display, data.pipe) {
> +					igt_fixture {
> +						igt_require(data.curw <= max_curw && data.curh <= max_curh);
> +						data.output = igt_get_single_output_for_pipe(&data.display, data.pipe);
> +					}
> +
> +					for (data.curw = 64; data.curw <= 256; data.curw *= 2) {
> +						data.curh = data.curw;
> +						igt_dynamic_f("pipe-%s-%dx%d",
> +							      kmstest_pipe_name(data.pipe),
> +							      data.curw, data.curh)
> +							test_crtc(&data, tests[i].flags);
> +					}
> +				}
>  			}
>  		}
>  	}
> -- 
> 2.35.1
> 
