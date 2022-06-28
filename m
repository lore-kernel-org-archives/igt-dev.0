Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C958410EFF0
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jun 2022 12:28:58 +0000 (UTC)
Message-ID: <6c8145cc-b705-5a69-559a-51bdeef8288e@intel.com>
Date: Tue, 28 Jun 2022 17:58:53 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20220624043525.86679-1-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20220624043525.86679-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t] tests/kms_cursor_edge_walk: Fix test
 requirement to avoid SKIPs
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

Reviewed-by:  Swati Sharma <swati2.sharma@intel.com>

On 24-Jun-22 10:05 AM, Bhanuprakash Modem wrote:
> As (54ff3199) introduced dynamic subtets, tests are getting Skipped
> on all pipes except pipe-A.
> 
> This patch will fix the test requirement condition to avoid such skips.
> 
> Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/6250
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_cursor_edge_walk.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
> index 526bc6b3..af3769db 100644
> --- a/tests/kms_cursor_edge_walk.c
> +++ b/tests/kms_cursor_edge_walk.c
> @@ -347,11 +347,12 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   		for (i = 0; i < ARRAY_SIZE(tests); i++) {
>   			igt_subtest_with_dynamic(tests[i].name) {
>   				for_each_pipe(&data.display, data.pipe) {
> -					igt_require(data.curw <= max_curw && data.curh <= max_curh);
>   					data.output = igt_get_single_output_for_pipe(&data.display, data.pipe);
>   
>   					for (data.curw = 64; data.curw <= 256; data.curw *= 2) {
>   						data.curh = data.curw;
> +						igt_require(data.curw <= max_curw && data.curh <= max_curh);
> +
>   						igt_dynamic_f("pipe-%s-%s-%dx%d",
>   							      kmstest_pipe_name(data.pipe),
>   							      data.output->name,

-- 
~Swati Sharma
