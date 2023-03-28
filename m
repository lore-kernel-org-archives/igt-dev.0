Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E204E10E17C
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Mar 2023 11:42:03 +0000 (UTC)
Message-ID: <98d4c936-908a-e411-2c84-434948ebca9b@intel.com>
Date: Tue, 28 Mar 2023 17:11:44 +0530
To: Nidhi Gupta <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230302224356.28771-1-nidhi1.gupta@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230302224356.28771-1-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_cursor_crc: Reduce the
 execution time on simulation
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


On Fri-03-03-2023 04:13 am, Nidhi Gupta wrote:
> As the test execution is taking more time on simulation, limit the
> execution to two (first & last) pipes. This optimization is for
> simulation and hardware.
> 
> This patch will also provide an option (command line flag '-e') to
> execute on all pipes.
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_cursor_crc.c | 60 +++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 59 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index 0b5aac30..a69c0444 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -83,6 +83,11 @@ typedef struct {
>   	cursorarea oldcursorarea[MAXCURSORBUFFER];
>   } data_t;
>   
> +static bool extended;
> +static enum pipe active_pipes[IGT_MAX_PIPES];
> +static uint32_t last_pipe;
> +
> +
>   #define TEST_DPMS (1<<0)
>   #define TEST_SUSPEND (1<<1)
>   
> @@ -700,6 +705,17 @@ static void test_rapid_movement(data_t *data)
>   	igt_assert_lt(usec, 0.9 * 400 * 1000000 / data->refresh);
>   }
>   
> +static bool execution_constraint(enum pipe pipe)
> +{
> +	if (!extended &&
> +	    pipe != active_pipes[0] &&
> +	    pipe != active_pipes[last_pipe])
> +		return true;
> +
> +	return false;
> +}
> +
> +
>   static void run_size_tests(data_t *data, int w, int h)
>   {
>   	enum pipe pipe;
> @@ -750,6 +766,9 @@ static void run_size_tests(data_t *data, int w, int h)
>   			}
>   
>   			for_each_pipe_with_single_output(&data->display, pipe, data->output) {
> +				if (execution_constraint(pipe))
> +					continue;
> +
>   				data->pipe = pipe;
>   
>   				if (require_cursor_size(data, w, h)) {
> @@ -783,6 +802,9 @@ static void run_tests_on_pipe(data_t *data)
>   		     "correctly.");
>   	igt_subtest_with_dynamic("cursor-size-change") {
>   		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
> +			if (execution_constraint(pipe))
> +				continue;
> +
>   			data->pipe = pipe;
>   
>   			igt_dynamic_f("pipe-%s-%s",
> @@ -797,6 +819,9 @@ static void run_tests_on_pipe(data_t *data)
>   		     "plane, i.e., alpha channel equal to 1.0.");
>   	igt_subtest_with_dynamic("cursor-alpha-opaque") {
>   		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
> +			if (execution_constraint(pipe))
> +				continue;
> +
>   			data->pipe = pipe;
>   
>   			igt_dynamic_f("pipe-%s-%s",
> @@ -811,6 +836,9 @@ static void run_tests_on_pipe(data_t *data)
>   		     "plane, i.e., alpha channel equal to 0.0.");
>   	igt_subtest_with_dynamic("cursor-alpha-transparent") {
>   		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
> +			if (execution_constraint(pipe))
> +				continue;
> +
>   			data->pipe = pipe;
>   
>   			igt_dynamic_f("pipe-%s-%s",
> @@ -828,6 +856,9 @@ static void run_tests_on_pipe(data_t *data)
>   	igt_describe("Check random placement of a cursor with DPMS.");
>   	igt_subtest_with_dynamic("cursor-dpms") {
>   		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
> +			if (execution_constraint(pipe))
> +				continue;
> +
>   			data->pipe = pipe;
>   			data->flags = TEST_DPMS;
>   
> @@ -843,6 +874,9 @@ static void run_tests_on_pipe(data_t *data)
>   	igt_describe("Check random placement of a cursor with suspend.");
>   	igt_subtest_with_dynamic("cursor-suspend") {
>   		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
> +			if (execution_constraint(pipe))
> +				continue;
> +
>   			data->pipe = pipe;
>   			data->flags = TEST_SUSPEND;
>   
> @@ -881,16 +915,40 @@ static void run_tests_on_pipe(data_t *data)
>   
>   static data_t data;
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
>   	uint64_t cursor_width = 64, cursor_height = 64;
>   	int ret;
>   
>   	igt_fixture {
> +		enum pipe pipe;
> +
> +		last_pipe = 0;
> +
>   		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>   
>   		igt_display_require(&data.display, data.drm_fd);
>   		igt_display_require_output(&data.display);
> +		/* Get active pipes. */
> +		for_each_pipe(&data.display, pipe)
> +			active_pipes[last_pipe++] = pipe;
> +		last_pipe--;
>   
>   		ret = drmGetCap(data.drm_fd, DRM_CAP_CURSOR_WIDTH, &cursor_width);
>   		igt_assert(ret == 0 || errno == EINVAL);
