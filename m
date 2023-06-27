Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 798FC10E305
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jun 2023 14:41:58 +0000 (UTC)
Message-ID: <d4872f00-07a8-29d9-2144-2d2da77279db@intel.com>
Date: Tue, 27 Jun 2023 20:11:35 +0530
To: Nidhi Gupta <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230626213148.2242-1-nidhi1.gupta@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230626213148.2242-1-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_plane_cursor: Handle
 invalid pipe in big joiner
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

On Tue-27-06-2023 03:01 am, Nidhi Gupta wrote:
> If any pipe is invalid in big joiner currently test throws
> as skip for all the pipes as it is within the dynamic subtest
> block.
> Fixed in IGT by not executing the subtest if valid combo of pipe
> and output not found for big joiner and go on to check for the
> next pipe.
> 
> v2: Fix commit subject and message (Bhanu)
>      Fix nitpicks (Bhanu)
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/kms_plane_cursor.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
> index 59b105c6..2e45c07c 100644
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
> @@ -310,6 +309,9 @@ igt_main
>   							     DRM_PLANE_TYPE_OVERLAY))
>   					continue;
>   
> +				if (!i915_pipe_output_combo_valid(&data.display))

This check will throw an error, since you are not using any pipe/output 
before calling this check.

- Bhanu

> +					continue;
> +
>   				test_init(&data, pipe, output);
>   
>   				for (j = 0; j < ARRAY_SIZE(cursor_sizes); j++) {
