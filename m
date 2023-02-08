Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED85E10E6D0
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Feb 2023 05:07:25 +0000 (UTC)
Message-ID: <97c20fc0-1703-34ce-0f8f-a83a8493ec83@intel.com>
Date: Wed, 8 Feb 2023 10:37:13 +0530
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230208015959.24015-1-nidhi1.gupta@intel.com>
 <20230208015959.24015-4-nidhi1.gupta@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230208015959.24015-4-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v2 3/4] tests/kms_color: Limit the execution
 to two pipes
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
> execution to two (first & last) pipes. This optimization is for
> simulation only and hence there will be no impact on real hardware.

Please fix the commit message, we are limiting the execution on real 
hardware too.

> 
> This patch will also provide an option (command line flag '-e') to
> execute on all pipes.
> 
> Example: ./kms_color -e --run-subtest ctm-0-50
> 
> v2: Restrict the execution only on 2 pipes for
>      real hardware aswell (Ankit)
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/kms_color.c | 41 ++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index e0c6a8bf..ccb1c2c3 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -26,6 +26,10 @@
>   
>   IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
>   
> +static bool extended;
> +static enum pipe active_pipes[IGT_MAX_PIPES];
> +static uint32_t last_pipe;
> +
>   static bool test_pipe_degamma(data_t *data,
>   			      igt_plane_t *primary)
>   {
> @@ -876,6 +880,16 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
>   	test_cleanup(data);
>   }
>   
> +static bool pipe_constraint(enum pipe pipe)

Function name looks bit odd to me, how about execution_constraint()?

> +{
> +	if (!extended &&
> +	    pipe != active_pipes[0] &&
> +	    pipe != active_pipes[last_pipe])
> +		return true;
> +
> +	return false;
> +}
> +
>   static void
>   run_invalid_tests_for_pipe(data_t *data)
>   {
> @@ -1020,6 +1034,8 @@ run_tests_for_pipe(data_t *data)
>   		igt_describe_f("%s", ctm_tests[i].desc);
>   		igt_subtest_with_dynamic_f("%s", ctm_tests[i].name) {
>   			for_each_pipe(&data->display, pipe) {
> +				if (pipe_constraint(pipe))
> +					continue;

Please put a new line here.

>   				run_ctm_tests_for_pipe(data, pipe,
>   						       ctm_tests[i].colors,
>   						       ctm_tests[i].ctm,
> @@ -1039,9 +1055,28 @@ run_tests_for_pipe(data_t *data)
>   	}
>   }
>   
> -igt_main
> +static int opt_handler(int opt, int opt_index, void *_data)
> +{
> +	switch (opt) {
> +	case 'e':
> +		extended = true;
> +		break;
> +	default:
> +		return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +const char *help_str =
> +	"  -e \tExtended tests.\n";
> +
> +igt_main_args("e", NULL, help_str, opt_handler, NULL)
>   {
>   	data_t data = {};
> +	enum pipe pipe;
> +
> +	last_pipe = 0;
>   
>   	igt_fixture {
>   		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> @@ -1050,6 +1085,10 @@ igt_main
>   		kmstest_set_vt_graphics_mode();
>   
>   		igt_display_require(&data.display, data.drm_fd);

Please put a new line here.

> +		/* Get active pipes. */
> +		for_each_pipe(&data.display, pipe)
> +			active_pipes[last_pipe++] = pipe;
> +		last_pipe--;
>   	}
>   
>   	igt_subtest_group
