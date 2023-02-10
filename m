Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C6E10E12D
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Feb 2023 08:19:12 +0000 (UTC)
Message-ID: <c10f5522-64e4-b4b8-6fbe-72fac1b33f9e@intel.com>
Date: Fri, 10 Feb 2023 13:48:58 +0530
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230210042419.1744563-1-bhanuprakash.modem@intel.com>
 <20230210042419.1744563-2-bhanuprakash.modem@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230210042419.1744563-2-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 2/2] tests/kms_cursor_edge_walk: Limit the
 execution to two pipes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 2/10/2023 9:54 AM, Bhanuprakash Modem wrote:
> To optimize the test execution time, limit the execution to
> two (first & last) pipes. This patch will also provide an
> option (command line flag '--extended') to execute on all
> pipes.
>
> Example:
> ./kms_cursor_edge_walk --extended --run-subtest 64x64-left-edge
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_cursor_edge_walk.c | 22 +++++++++++++++++++++-
>   1 file changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
> index 96812776c..304c0ea8f 100644
> --- a/tests/kms_cursor_edge_walk.c
> +++ b/tests/kms_cursor_edge_walk.c
> @@ -60,6 +60,10 @@ enum {
>   	EDGE_BOTTOM = 0x8,
>   };
>   
> +static bool extended;
> +static enum pipe active_pipes[IGT_MAX_PIPES];
> +static uint32_t last_pipe;
> +
>   static void create_cursor_fb(data_t *data, int cur_w, int cur_h)
>   {
>   	cairo_t *cr;
> @@ -284,6 +288,9 @@ static int opt_handler(int opt, int opt_index, void *_data)
>   	case 'd':
>   		data->disable = true;
>   		break;
> +	case 'e':
> +		extended = true;
> +		break;
>   	case 'j':
>   		data->jump = true;
>   		break;
> @@ -300,12 +307,14 @@ static const struct option long_opts[] = {
>   	{ .name = "colored", .val = 'c' },
>   	{ .name = "disable", .val = 'd'},
>   	{ .name = "jump", .val = 'j' },
> +	{ .name = "extended", .val = 'e'},
>   	{}
>   };
>   static const char *help_str =
>   	"  --colored\t\tUse a colored cursor (disables CRC checks)\n"
>   	"  --disable\t\tDisable the cursor between each step\n"
> -	"  --jump\t\tJump the cursor to middle of the screen between each step)\n";
> +	"  --jump\t\tJump the cursor to middle of the screen between each step)\n"
> +	"  --extended\t\tRun on all pipes.(Default it will Run only two pipes)\n";
>   
>   igt_main_args("", long_opts, help_str, opt_handler, &data)
>   {
> @@ -322,6 +331,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   	igt_fixture {
>   		int ret;
> +		enum pipe pipe;
>   
>   		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>   
> @@ -340,6 +350,12 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   		igt_display_require(&data.display, data.drm_fd);
>   		igt_display_require_output(&data.display);
> +
> +		/* Get active pipes. */
> +		last_pipe = 0;
> +		for_each_pipe(&data.display, pipe)
> +			active_pipes[last_pipe++] = pipe;
> +		last_pipe--;
>   	}
>   
>   	for (i = 0; i < ARRAY_SIZE(tests); i++) {
> @@ -353,6 +369,10 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   			igt_subtest_with_dynamic_f("%dx%d-%s", data.curw,
>   						   data.curh, tests[i].name) {
>   				for_each_pipe_with_single_output(&data.display, data.pipe, data.output) {
> +					if (!extended && data.pipe != active_pipes[0] &&
> +					    data.pipe != active_pipes[last_pipe])
> +						continue;
> +
>   					igt_dynamic_f("pipe-%s-%s",
>   						      kmstest_pipe_name(data.pipe),
>   						      data.output->name)
