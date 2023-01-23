Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3A810E4E9
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jan 2023 16:04:53 +0000 (UTC)
Message-ID: <1d4508e3-a5ed-e748-7d1c-da5d481e1229@intel.com>
Date: Mon, 23 Jan 2023 21:34:40 +0530
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230112105702.19502-1-dnyaneshwar.bhadane@intel.com>
 <20230123153050.113763-1-dnyaneshwar.bhadane@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230123153050.113763-1-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t,
 v3] tests/kms_cursor_crc: skip pipe on invalid connector in cursor
 size test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: juha-pekka.heikkila@intel.com, suresh.kumar.kurmi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On Mon-23-01-2023 09:00 pm, Dnyaneshwar Bhadane wrote:
> Only the valid pipe connector combination reach to the igt commit.
> Cursor max-size test will not affect existing flow as only skip
> for invalid connector.
> For cursor-dpms and cursor-suspend not require to check require_cursor_size
> becuase the cursor height and width used from drm capablities.
> 
> --v3
> - Added for_each_pipe_valid_connector() to check for valid connection.
> - initialize pipe with default 0/PIPE_A suggestion from Petri.
> 
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> 
> ---
>   lib/igt_kms.h          | 15 +++++++++++++++
>   tests/kms_cursor_crc.c | 18 ++++--------------
>   2 files changed, 19 insertions(+), 14 deletions(-)
> 
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index be5482e0..5daa751a 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -534,6 +534,21 @@ static inline bool igt_output_is_connected(igt_output_t *output)
>   
>   	return false;
>   }
> +/**
> + * for_each_pipe_valid_connector:
> + * @display: a pointer to an #igt_display_t structure
> + * @pipe: from pipe to iterate.
> + * @output: #igt_output_t to check.
> + *
> + * It loop over the all the pipe and check for the given
> + * @output/@pipe can be used together.
> + *
> + */
> +#define for_each_pipe_valid_connector(display, pipe, output) \
> +	for_each_pipe_static(pipe) \
> +		for_each_if ((((display)->pipes[(pipe)].enabled) && \
> +				igt_pipe_connector_valid((pipe), (output))))
> +
>   
>   /**
>    * igt_pipe_connector_valid:
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index d5a4b30b..0394768b 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -749,7 +749,7 @@ static void run_size_tests(data_t *data, int w, int h)
>   				}
>   			}
>   
> -			for_each_pipe(&data->display, pipe) {
> +			for_each_pipe_valid_connector(&data->display, pipe, data->output) {
>   				data->pipe = pipe;
>   
>   				if (require_cursor_size(data, w, h)) {
> @@ -772,7 +772,7 @@ static void run_tests_on_pipe(data_t *data)
>   {
>   	enum pipe pipe;
>   	int cursor_size;
> -
> +	pipe = PIPE_A;

This looks ugly to me.

>   	igt_fixture {
>   		data->output = igt_get_single_output_for_pipe(&data->display, pipe);

Probably, this might be the bug in existing code. Perhaps, you can drop 
data->output from igt_fixture and update each subtest to check for the 
valid output. Please check my engg patch for BJ [1].

s/for_each_pipe/for_each_pipe_with_single_output/

[1]: https://patchwork.freedesktop.org/patch/519058/

- Bhanu

>   		igt_require(data->output);
> @@ -850,15 +850,10 @@ static void run_tests_on_pipe(data_t *data)
>   
>   	igt_describe("Check random placement of a cursor with DPMS.");
>   	igt_subtest_with_dynamic("cursor-dpms") {
> -		for_each_pipe(&data->display, pipe) {
> +		for_each_pipe_valid_connector(&data->display, pipe, data->output) {
>   			data->pipe = pipe;
>   			data->flags = TEST_DPMS;
>   
> -			if (require_cursor_size(data, data->cursor_max_w, data->cursor_max_h)) {
> -				igt_debug("Cursor size %dx%d not supported by driver\n",
> -					  data->cursor_max_w, data->cursor_max_h);
> -				continue;
> -			}
>   
>   			igt_dynamic_f("pipe-%s-%s",
>   				      kmstest_pipe_name(pipe),
> @@ -871,15 +866,10 @@ static void run_tests_on_pipe(data_t *data)
>   
>   	igt_describe("Check random placement of a cursor with suspend.");
>   	igt_subtest_with_dynamic("cursor-suspend") {
> -		for_each_pipe(&data->display, pipe) {
> +		for_each_pipe_valid_connector(&data->display, pipe, data->output) {
>   			data->pipe = pipe;
>   			data->flags = TEST_SUSPEND;
>   
> -			if (require_cursor_size(data, data->cursor_max_w, data->cursor_max_h)) {
> -				igt_debug("Cursor size %dx%d not supported by driver\n",
> -					  data->cursor_max_w, data->cursor_max_h);
> -				continue;
> -			}
>   
>   			igt_dynamic_f("pipe-%s-%s",
>   				      kmstest_pipe_name(pipe),
