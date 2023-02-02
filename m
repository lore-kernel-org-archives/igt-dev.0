Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F3910E4D2
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Feb 2023 10:33:44 +0000 (UTC)
Message-ID: <4abf2cc2-ad97-bb46-4880-196cf6cf7eb1@intel.com>
Date: Thu, 2 Feb 2023 16:03:28 +0530
To: Nidhi Gupta <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230202051509.28983-1-nidhi1.gupta@intel.com>
 <20230202051509.28983-4-nidhi1.gupta@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230202051509.28983-4-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v4 3/7] tests/kms_pipe_crc_basic: Limit the
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

On Thu-02-02-2023 10:45 am, Nidhi Gupta wrote:
> From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> 
> As the execution is taking more time, limit the execution to two (first
> & last) pipes.

Please mention about this optimization is for simulation only and no 
impact on real hardware.

> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/kms_pipe_crc_basic.c | 41 +++++++++++++++++++++++++++++++++++++-
>   1 file changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
> index 91a1b8ab..97b97863 100644
> --- a/tests/kms_pipe_crc_basic.c
> +++ b/tests/kms_pipe_crc_basic.c
> @@ -30,6 +30,7 @@
>   #include <string.h>
>   #include <fcntl.h>
>   
> +static bool extended = false;
>   
>   typedef struct {
>   	int drm_fd;
> @@ -276,7 +277,23 @@ static void test_disable_crc_after_crtc(data_t *data, enum pipe pipe,
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

Please mention about this flag in commit message.

These comments are applicable for all patches in this series.

- Bhanu

> +
> +igt_main_args("e", NULL, help_str, opt_handler, NULL)
>   {
>   	enum pipe pipe;
>   	igt_output_t *output;
> @@ -298,6 +315,8 @@ igt_main
>   		{ "hang-read-crc", TEST_HANG,
>   			"Hang test for pipe CRC read." },
>   	};
> +	enum pipe active_pipes[IGT_MAX_PIPES];
> +	uint32_t last_pipe = 0;
>   	int i;
>   
>   	igt_fixture {
> @@ -312,6 +331,11 @@ igt_main
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
> @@ -322,6 +346,11 @@ igt_main
>   		igt_describe(tests[i].desc);
>   		igt_subtest_with_dynamic(tests[i].name) {
>   			for_each_pipe_with_single_output(&data.display, pipe, output) {
> +				if (igt_run_in_simulation() && !extended &&
> +				    pipe != active_pipes[0] &&
> +				    pipe != active_pipes[last_pipe])
> +					continue;
> +
>   				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
>   					if (tests[i].flags & TEST_SUSPEND) {
>   						test_read_crc(&data, pipe, output, 0);
> @@ -350,6 +379,11 @@ igt_main
>   		     "does not cause issues.");
>   	igt_subtest_with_dynamic("disable-crc-after-crtc") {
>   		for_each_pipe_with_single_output(&data.display, pipe, output) {
> +			if (igt_run_in_simulation() && !extended &&
> +			    pipe != active_pipes[0] &&
> +			    pipe != active_pipes[last_pipe])
> +				continue;
> +
>   			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
>   				test_disable_crc_after_crtc(&data, pipe, output);
>   		}
> @@ -358,6 +392,11 @@ igt_main
>   	igt_describe("Basic sanity check for CRC mismatches");
>   	igt_subtest_with_dynamic("compare-crc-sanitycheck") {
>   		for_each_pipe_with_single_output(&data.display, pipe, output) {
> +			if (igt_run_in_simulation() && !extended &&
> +			    pipe != active_pipes[0] &&
> +			    pipe != active_pipes[last_pipe])
> +				continue;
> +
>   			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
>   				test_compare_crc(&data, pipe, output);
>   		}
