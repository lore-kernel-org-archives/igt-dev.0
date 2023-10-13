Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E2F710E07C
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Oct 2023 05:04:38 +0000 (UTC)
Message-ID: <8e58de31-dc8f-2de8-77ff-187c54c6330d@intel.com>
Date: Fri, 13 Oct 2023 10:34:25 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20231011090937.65903-1-swati2.sharma@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20231011090937.65903-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_invalid_mode: use pipe_name
 followed by output_name
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


On 10/11/2023 2:39 PM, Swati Sharma wrote:
> Use pipe_name followed by output_name.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_invalid_mode.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
> index 017c2c195..db7b703c0 100644
> --- a/tests/kms_invalid_mode.c
> +++ b/tests/kms_invalid_mode.c
> @@ -317,7 +317,7 @@ igt_main
>   				if (!i915_pipe_output_combo_valid(&data.display))
>   					continue;
>   
> -				igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe)) {
> +				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
>   					data.output = output;
>   					data.pipe = pipe;
>   					data.adjust_mode = subtests[i].adjust_mode;
