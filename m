Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F00B10E59D
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Oct 2023 05:07:05 +0000 (UTC)
Message-ID: <800db096-30f2-9030-089f-213d5a658166@intel.com>
Date: Fri, 13 Oct 2023 10:36:53 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20231011093735.66766-1-swati2.sharma@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20231011093735.66766-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_scaling_modes: use pipe_name
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


On 10/11/2023 3:07 PM, Swati Sharma wrote:
> Use pipe_name followed by output_name.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_scaling_modes.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/kms_scaling_modes.c b/tests/kms_scaling_modes.c
> index bd7ed7e56..c1a8f5c60 100644
> --- a/tests/kms_scaling_modes.c
> +++ b/tests/kms_scaling_modes.c
> @@ -121,7 +121,7 @@ static void test_scaling_mode(data_t *data, uint32_t flags)
>   		if (!i915_pipe_output_combo_valid(display))
>   			continue;
>   
> -		igt_dynamic_f("%s-pipe-%s", output->name, kmstest_pipe_name(pipe))
> +		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
>   			test_scaling_mode_on_output(display, pipe, output, flags);
>   	}
>   }
