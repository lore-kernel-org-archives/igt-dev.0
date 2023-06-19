Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DBAF10E09C
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jun 2023 06:01:05 +0000 (UTC)
Message-ID: <7df7520e-6ddb-b3c7-3007-73faac75b4fe@intel.com>
Date: Mon, 19 Jun 2023 11:30:42 +0530
To: Nidhi Gupta <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230615052438.15220-1-nidhi1.gupta@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230615052438.15220-1-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_cursor: Pipe-D is
 invalid in big joiner
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

On Thu-15-06-2023 10:54 am, Nidhi Gupta wrote:
> Pipe D is invalid in big joiner and because of that currently
> test throws as skip for all the pipes as it is within the
> dynamic subtest block.
> Fixed in IGT by not executing the subtest if valid combo of pipe
> and output not found for big joiner and go on to check for the
> next pipe.

Please drop Pipe-D from commit subject & message, and write as a generic.

Also, please maintain the rev information.

Example:
V2: - Changes made from Initial version

> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/kms_plane_cursor.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
> index 59b105c6..b1f3cecc 100644
> --- a/tests/kms_plane_cursor.c
> +++ b/tests/kms_plane_cursor.c
> @@ -86,7 +86,6 @@ static void test_init(data_t *data, enum pipe pipe_id, igt_output_t *output)
>   	data->cursor = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_CURSOR);
>   
>   	igt_output_set_pipe(data->output, data->pipe_id);
> -	igt_require(i915_pipe_output_combo_valid(display));
>   
>   	igt_info("Using (pipe %s + %s) to run the subtest.\n",
>   		 kmstest_pipe_name(data->pipe_id), igt_output_name(data->output));
> @@ -268,6 +267,7 @@ igt_main
>   	static const int cursor_sizes[] = { 64, 128, 256 };
>   	data_t data = { .max_curw = 64, .max_curh = 64 };
>   	enum pipe pipe;
> +	bool result;
>   	igt_output_t *output;
>   	int i, j;
>   	struct {
> @@ -312,6 +312,13 @@ igt_main
>   
>   				test_init(&data, pipe, output);

Test initialization is not required, if it is an invalid config.

>   
> +				result = i915_pipe_output_combo_valid(&data.display);
> +				if (result == false) {

No need of new variable 'result', instead you can use
if (!i915_pipe_output_combo_valid(&data.display))
	continue;

> +					igt_info("pipe %s + %s is not a valid combo for big joiner\n",
----------------------------------------^
Use igt_debug() if you really need this print, else please drop it.

- Bhanu

> +						kmstest_pipe_name(data.pipe_id), igt_output_name(data.output));
> +					continue;
> +				}
> +
>   				for (j = 0; j < ARRAY_SIZE(cursor_sizes); j++) {
>   					int size = cursor_sizes[j];
>   
