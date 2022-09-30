Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAEAD10EB9A
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Sep 2022 06:57:30 +0000 (UTC)
Message-ID: <ffbbb164-18de-f64d-9302-6734bad5d335@intel.com>
Date: Fri, 30 Sep 2022 12:26:53 +0530
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220922160004.2041598-1-bhanuprakash.modem@intel.com>
 <20220922160004.2041598-37-bhanuprakash.modem@intel.com>
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20220922160004.2041598-37-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V4 36/52] tests/kms_vrr: Add support for
 Bigjoiner
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

On 9/22/2022 9:29 PM, Bhanuprakash Modem wrote:
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
>   tests/kms_vrr.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 8976d4a6..619b3789 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -444,6 +444,12 @@ run_vrr_test(data_t *data, test_t test, uint32_t flags)
>   
>   		for_each_pipe(&data->display, pipe) {
>   			if (igt_pipe_connector_valid(pipe, output)) {
> +				igt_display_reset(&data->display);
> +
> +				igt_output_set_pipe(output, pipe);
> +				if (!i915_pipe_output_combo_valid(&data->display))
> +					continue;
> +
>   				igt_dynamic_f("pipe-%s-%s",
>   					      kmstest_pipe_name(pipe), output->name)
>   					test(data, pipe, output, flags);
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
