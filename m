Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A018110EB9A
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Sep 2022 07:00:28 +0000 (UTC)
Message-ID: <0867b316-e845-bad9-4e4a-84101c020d40@intel.com>
Date: Fri, 30 Sep 2022 12:30:15 +0530
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220922160004.2041598-1-bhanuprakash.modem@intel.com>
 <20220922160004.2041598-53-bhanuprakash.modem@intel.com>
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20220922160004.2041598-53-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V4 52/52] tests/i915/kms_pwrite_crc: Add
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

On 9/22/2022 9:30 PM, Bhanuprakash Modem wrote:
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
>   tests/i915/kms_pwrite_crc.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/tests/i915/kms_pwrite_crc.c b/tests/i915/kms_pwrite_crc.c
> index 584e6a19..cbdb7d84 100644
> --- a/tests/i915/kms_pwrite_crc.c
> +++ b/tests/i915/kms_pwrite_crc.c
> @@ -110,6 +110,7 @@ static void prepare_crtc(data_t *data)
>   	igt_output_t *output = data->output;
>   	drmModeModeInfo *mode;
>   
> +	igt_display_reset(display);
>   	/* select the pipe we want to use */
>   	igt_output_set_pipe(output, data->pipe);
>   
> @@ -160,6 +161,12 @@ static void run_test(data_t *data)
>   	enum pipe pipe;
>   
>   	for_each_pipe_with_valid_output(display, pipe, output) {
> +		igt_display_reset(display);
> +
> +		igt_output_set_pipe(output, data->pipe);
Use pipe instead data->pipe.
> +		if (!i915_pipe_output_combo_valid(display))
> +			continue;
> +
>   		data->output = output;
>   		data->pipe = pipe;
>   
With above fix:
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
