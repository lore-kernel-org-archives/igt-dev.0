Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F46610E6D4
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Feb 2023 05:17:33 +0000 (UTC)
Message-ID: <ab927d7f-b5cd-aedc-c243-3a3a0945e579@intel.com>
Date: Wed, 8 Feb 2023 10:46:36 +0530
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230208015959.24015-1-nidhi1.gupta@intel.com>
 <20230208015959.24015-2-nidhi1.gupta@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230208015959.24015-2-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v2 1/4] tests/kms_cursor_edge_walk: Execute
 only on pipe c
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

Hi Nidhi,

On Wed-08-02-2023 07:29 am, Nidhi Gupta wrote:
> As the test execution is taking more time on simulation, limit the
> execution to single pipe c as test exercise CHV pipe C cursor fail.
> This optimization is for simulation only and hence there will be no
> impact on real hardware.

Please fix the commit message as this patch will impact the real 
hardware too.

> 
> This patch will also provide an option (command line flag '-e') to
> execute on all pipes.
> 
> Example: ./kms_cursor_edge_walk -e --run-subtest left-edge
> 
> v2: If no coverage is missing limit the execution for
>      real hardware aswell (Ankit)
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/kms_cursor_edge_walk.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
> index e653b9ab..4a5f34e9 100644
> --- a/tests/kms_cursor_edge_walk.c
> +++ b/tests/kms_cursor_edge_walk.c
> @@ -60,6 +60,8 @@ enum {
>   	EDGE_BOTTOM = 0x8,
>   };
>   
> +static bool extended;
> +
>   static void create_cursor_fb(data_t *data, int cur_w, int cur_h)
>   {
>   	cairo_t *cr;
> @@ -287,6 +289,9 @@ static int opt_handler(int opt, int opt_index, void *_data)
>   	case 'j':
>   		data->jump = true;
>   		break;
> +	case 'e':
> +		extended = true;
> +		break;
>   	default:
>   		return IGT_OPT_HANDLER_ERROR;
>   	}
> @@ -300,12 +305,14 @@ static const struct option long_opts[] = {
>   	{ .name = "colored", .val = 'c' },
>   	{ .name = "disable", .val = 'd'},
>   	{ .name = "jump", .val = 'j' },
> +	{ .name = "extended", .val = 'e' },

There is no opt present with the name "extended".

>   	{}
>   };
>   static const char *help_str =
>   	"  --colored\t\tUse a colored cursor (disables CRC checks)\n"
>   	"  --disable\t\tDisable the cursor between each step\n"
> -	"  --jump\t\tJump the cursor to middle of the screen between each step)\n";
> +	"  --jump\t\tJump the cursor to middle of the screen between each step)\n"
> +	"  -e \t\tExecute test on all pipes\n";

Please don't mix the short & long opts.

>   
>   igt_main_args("", long_opts, help_str, opt_handler, &data)
>   {
> @@ -347,6 +354,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   		for (i = 0; i < ARRAY_SIZE(tests); i++) {
>   			igt_subtest_with_dynamic(tests[i].name) {
>   				for_each_pipe_with_single_output(&data.display, data.pipe, data.output) {
> +					if (data.pipe != PIPE_C && !extended)

Why are you trying to run on Pipe-C only? If it is CHV specific, then 
you need to manage with CHV specific checks.

> +						continue;

Please put a new line here.

- Bhanu

>   					for (data.curw = 64; data.curw <= 256; data.curw *= 2) {
>   						data.curh = data.curw;
>   						igt_require(data.curw <= max_curw && data.curh <= max_curh);
