Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 864EB10E2E7
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Feb 2023 06:03:52 +0000 (UTC)
Message-ID: <b17b7a75-2b86-b885-0dfe-838b60e189b6@intel.com>
Date: Tue, 7 Feb 2023 11:32:59 +0530
To: Nidhi Gupta <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230206233810.16696-1-nidhi1.gupta@intel.com>
 <20230206233810.16696-4-nidhi1.gupta@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20230206233810.16696-4-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/5] tests/kms_color: Limit the
 execution to two pipes
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

I have some reservations about this extended tests with simulation.

When I see -e option I understand that, with -e option, all the tests 
will run, and without that, only a subset of the tests will be run.

So to run only a subset of the tests, I just run the test without -e 
option, and this is consistent with other tests as well.

Now in some tests like this, we are having -e option only applicable for 
simulation.

When running on a real HW I would see  "-e Extended tests", but actually 
it doesn't matter if option e is passed, or not.

So IMHO, if we are sure we are not loosing any coverage with limiting 
the pipes, let us limit not only for simulation, but for general case too.

Or otherwise, show -e option only in case for simulation, if its meant 
only for simulation.

Regards,

Ankit


On 2/7/2023 5:08 AM, Nidhi Gupta wrote:
> As the test execution is taking more time on simulation, limit the
> execution to two (first & last) pipes. This optimization is for
> simulation only and hence there will be no impact on real hardware.
>
> This patch will also provide an option (command line flag '-e') to
> execute on all pipes.
>
> Example: ./kms_color -e --run-subtest ctm-0-50
>
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/kms_color.c | 43 ++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 42 insertions(+), 1 deletion(-)
>
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index e0c6a8bf..9b0dccff 100644
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
> +static bool simulation_constraint(enum pipe pipe)
> +{
> +	if (igt_run_in_simulation() && !extended &&
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
> @@ -900,6 +914,8 @@ run_invalid_tests_for_pipe(data_t *data)
>   		igt_describe_f("%s", tests[i].desc);
>   		igt_subtest_with_dynamic_f("%s", tests[i].name) {
>   			for_each_pipe(&data->display, pipe) {
> +				if (simulation_constraint(pipe))
> +					continue;
>   				prep_pipe(data, pipe);
>   
>   				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
> @@ -1020,6 +1036,8 @@ run_tests_for_pipe(data_t *data)
>   		igt_describe_f("%s", ctm_tests[i].desc);
>   		igt_subtest_with_dynamic_f("%s", ctm_tests[i].name) {
>   			for_each_pipe(&data->display, pipe) {
> +				if (simulation_constraint(pipe))
> +					continue;
>   				run_ctm_tests_for_pipe(data, pipe,
>   						       ctm_tests[i].colors,
>   						       ctm_tests[i].ctm,
> @@ -1039,9 +1057,28 @@ run_tests_for_pipe(data_t *data)
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
> @@ -1050,6 +1087,10 @@ igt_main
>   		kmstest_set_vt_graphics_mode();
>   
>   		igt_display_require(&data.display, data.drm_fd);
> +		/* Get active pipes. */
> +		for_each_pipe(&data.display, pipe)
> +			active_pipes[last_pipe++] = pipe;
> +		last_pipe--;
>   	}
>   
>   	igt_subtest_group
