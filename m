Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC08C10E32E
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Feb 2023 08:55:05 +0000 (UTC)
Message-ID: <14f24e64-da17-9f76-9bfe-8d735b7885df@intel.com>
Date: Mon, 6 Feb 2023 14:24:57 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>, igt-dev@lists.freedesktop.org
References: <20230203084252.2417-1-nidhi1.gupta@intel.com>
From: Swati Sharma <swati2.sharma@intel.com>
In-Reply-To: <20230203084252.2417-1-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_pipe_crc_basic: Limit the
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

Checkpatch is throwing following errors. Please fix.

ERROR: do not initialise statics to false
#42: FILE: tests/kms_pipe_crc_basic.c:33:
+static bool extended = false;

ERROR: do not initialise statics to 0
#44: FILE: tests/kms_pipe_crc_basic.c:35:
+static uint32_t last_pipe = 0;

ERROR: switch and case should be at the same indent
#72: FILE: tests/kms_pipe_crc_basic.c:294:
+       switch (opt) {
+               case 'e':
[...]
+               default:

total: 3 errors, 0 warnings, 87 lines checked

On 03-Feb-23 2:12 PM, Nidhi Gupta wrote:
> From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> 
> As the test execution is taking more time on simulation, limit the
> execution to two (first & last) pipes. This optimization is for
> simulation only and hence there will be no impact on real hardware.
> 
> This patch will also provide an option (command line flag '-e') to
> execute on all pipes.
> 
> Example: ./kms_pipe_crc_basic -e --run-subtest read-crc
> 
> V2: - Edited commit message (Bhanu)
> V3: - New function for simulation constraints (Kamil)
>      - Update commit message (Bhanu)
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/kms_pipe_crc_basic.c | 45 +++++++++++++++++++++++++++++++++++++-
>   1 file changed, 44 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
> index 91a1b8ab..376b9498 100644
> --- a/tests/kms_pipe_crc_basic.c
> +++ b/tests/kms_pipe_crc_basic.c
> @@ -30,6 +30,9 @@
>   #include <string.h>
>   #include <fcntl.h>
>   
> +static bool extended = false;
> +static enum pipe active_pipes[IGT_MAX_PIPES];
> +static uint32_t last_pipe = 0;
>   
>   typedef struct {
>   	int drm_fd;
> @@ -46,6 +49,16 @@ static struct {
>   	{ .r = 0.0, .g = 1.0, .b = 1.0 },
>   };
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
>   static void test_bad_source(data_t *data)
>   {
>   	errno = 0;
> @@ -276,7 +289,23 @@ static void test_disable_crc_after_crtc(data_t *data, enum pipe pipe,
>   
>   data_t data = {0, };
>   
> -igt_main
> +static int opt_handler(int opt, int opt_index, void *_data)
> +{
> +	switch (opt) {
> +		case 'e':
> +			extended = true;
> +			break;
> +		default:
> +			return IGT_OPT_HANDLER_ERROR;
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
>   	enum pipe pipe;
>   	igt_output_t *output;
> @@ -312,6 +341,11 @@ igt_main
>   		igt_require_pipe_crc(data.drm_fd);
>   
>   		data.debugfs = igt_debugfs_dir(data.drm_fd);
> +
> +		/* Get active pipes. */
> +		for_each_pipe(&data.display, pipe)
> +			active_pipes[last_pipe++] = pipe;
> +		last_pipe--;
>   	}
>   
>   	igt_describe("Tests error handling when the bad source is set.");
> @@ -322,6 +356,9 @@ igt_main
>   		igt_describe(tests[i].desc);
>   		igt_subtest_with_dynamic(tests[i].name) {
>   			for_each_pipe_with_single_output(&data.display, pipe, output) {
> +				if (simulation_constraint(pipe))
> +					continue;
> +
>   				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
>   					if (tests[i].flags & TEST_SUSPEND) {
>   						test_read_crc(&data, pipe, output, 0);
> @@ -350,6 +387,9 @@ igt_main
>   		     "does not cause issues.");
>   	igt_subtest_with_dynamic("disable-crc-after-crtc") {
>   		for_each_pipe_with_single_output(&data.display, pipe, output) {
> +			if (simulation_constraint(pipe))
> +				continue;
> +
>   			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
>   				test_disable_crc_after_crtc(&data, pipe, output);
>   		}
> @@ -358,6 +398,9 @@ igt_main
>   	igt_describe("Basic sanity check for CRC mismatches");
>   	igt_subtest_with_dynamic("compare-crc-sanitycheck") {
>   		for_each_pipe_with_single_output(&data.display, pipe, output) {
> +			if (simulation_constraint(pipe))
> +				continue;
> +
>   			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
>   				test_compare_crc(&data, pipe, output);
>   		}

-- 
~Swati Sharma
