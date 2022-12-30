Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9789110E06F
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Dec 2022 17:49:01 +0000 (UTC)
Message-ID: <5abe7f6d-c549-19fd-388c-69446f31b453@intel.com>
Date: Fri, 30 Dec 2022 23:18:55 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20221115170855.196572-1-bhanuprakash.modem@intel.com>
 <20221115170855.196572-33-bhanuprakash.modem@intel.com>
From: Swati Sharma <swati2.sharma@intel.com>
In-Reply-To: <20221115170855.196572-33-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t v5 32/52] tests/kms_scaling_modes: Add support
 for Bigjoiner
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

LGTM
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 15-Nov-22 10:38 PM, Bhanuprakash Modem wrote:
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
> ---
>   tests/kms_scaling_modes.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_scaling_modes.c b/tests/kms_scaling_modes.c
> index 039e4a8d..cf637712 100644
> --- a/tests/kms_scaling_modes.c
> +++ b/tests/kms_scaling_modes.c
> @@ -93,13 +93,17 @@ static void test_scaling_mode(data_t *data, uint32_t flags)
>   	enum pipe pipe;
>   
>   	for_each_pipe_with_valid_output(display, pipe, output) {
> +		igt_display_reset(display);
> +
>   		if (!has_scaling_mode(output))
>   			continue;
>   
> +		igt_output_set_pipe(output, pipe);
> +		if (!i915_pipe_output_combo_valid(display))
> +			continue;
> +
>   		igt_dynamic_f("%s-pipe-%s", output->name, kmstest_pipe_name(pipe))
>   			test_scaling_mode_on_output(display, pipe, output, flags);
> -
> -		igt_display_reset(display);
>   	}
>   }
>   

-- 
~Swati Sharma
