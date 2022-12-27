Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A658310E091
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Dec 2022 06:32:04 +0000 (UTC)
Message-ID: <f6e35b42-019f-2f1d-b445-739d14494496@intel.com>
Date: Tue, 27 Dec 2022 12:01:52 +0530
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>
References: <20221115170855.196572-1-bhanuprakash.modem@intel.com>
 <20221115170855.196572-14-bhanuprakash.modem@intel.com>
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20221115170855.196572-14-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t v5 13/52] tests/kms_cursor_edge_walk: Add
 support for Bigjoiner
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

On 11/15/2022 10:38 PM, Bhanuprakash Modem wrote:
> This patch will add a check to Skip the subtest if a selected pipe/output
> combo won't support Bigjoiner or 8K mode.
> 
> Example:
> * Pipe-D wont support a mode > 5K
> * To use 8K mode on a pipe then consecutive pipe must be available & free.
> 
> V2: - Use updated helper name
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
LGTM
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>

> ---
>   tests/kms_cursor_edge_walk.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
> index e653b9ab..86b880d8 100644
> --- a/tests/kms_cursor_edge_walk.c
> +++ b/tests/kms_cursor_edge_walk.c
> @@ -351,6 +351,12 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   						data.curh = data.curw;
>   						igt_require(data.curw <= max_curw && data.curh <= max_curh);
>   
> +						igt_display_reset(&data.display);
> +						igt_output_set_pipe(data.output, data.pipe);
> +						if (!i915_pipe_output_combo_valid(&data.display))
> +							continue;
> +
> +						igt_output_set_pipe(data.output, PIPE_NONE);
>   						igt_dynamic_f("pipe-%s-%s-%dx%d",
>   							      kmstest_pipe_name(data.pipe),
>   							      data.output->name,
