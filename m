Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF7B810E0A1
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Aug 2023 09:48:53 +0000 (UTC)
Message-ID: <1fba5505-d81c-20ed-5e49-0229db086811@intel.com>
Date: Wed, 2 Aug 2023 15:18:41 +0530
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230801133811.975849-1-swati2.sharma@intel.com>
 <20230801133811.975849-5-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20230801133811.975849-5-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [v6 04/10] tests/i915/kms_dsc: update if conditions
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

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

On 8/1/2023 7:08 PM, Swati Sharma wrote:
> Check is_dsc_output_format_supported() iff test flag is set to
> OUTPUT_FORMAT. Also, combine is_dsc_supported_by_sink () and
> gen11_dp_constraint() conditions together.
> Move, bpc_constraint() out of loop since its independent of output.
>
> v2: -fixed if() (CI)
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/i915/kms_dsc.c        | 16 +++++++---------
>   tests/i915/kms_dsc_helper.c |  2 +-
>   tests/i915/kms_dsc_helper.h |  2 +-
>   3 files changed, 9 insertions(+), 11 deletions(-)
>
> diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
> index 7b9bae91a..635fef1cd 100644
> --- a/tests/i915/kms_dsc.c
> +++ b/tests/i915/kms_dsc.c
> @@ -228,6 +228,8 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>   				{0},
>   			    };
>   
> +	igt_require(check_gen11_bpc_constraint(data->drm_fd, data->input_bpc));
> +
>   	for_each_pipe_with_valid_output(display, pipe, output) {
>   		data->output_format = output_format;
>   		data->plane_format = plane_format;
> @@ -235,17 +237,13 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>   		data->output = output;
>   		data->pipe = pipe;
>   
> -		if (!is_dsc_supported_by_sink(data->drm_fd, data->output))
> -			continue;
> -
> -		if (!is_dsc_output_format_supported(data->drm_fd, data->disp_ver,
> -						    data->output, data->output_format))
> -			continue;
> -
> -		if (!check_gen11_dp_constraint(data->drm_fd, data->output, data->pipe))
> +		if (!(is_dsc_supported_by_sink(data->drm_fd, data->output) &&
> +		      check_gen11_dp_constraint(data->drm_fd, data->output, data->pipe)))
>   			continue;
>   
> -		if (!check_gen11_bpc_constraint(data->drm_fd, data->output, data->input_bpc))
> +		if ((test_type & TEST_DSC_OUTPUT_FORMAT) &&
> +		    (!is_dsc_output_format_supported(data->drm_fd, data->disp_ver,
> +						     data->output, data->output_format)))
>   			continue;
>   
>   		if (test_type & TEST_DSC_OUTPUT_FORMAT)
> diff --git a/tests/i915/kms_dsc_helper.c b/tests/i915/kms_dsc_helper.c
> index 61f76ddee..ae59edb6b 100644
> --- a/tests/i915/kms_dsc_helper.c
> +++ b/tests/i915/kms_dsc_helper.c
> @@ -96,7 +96,7 @@ bool check_gen11_dp_constraint(int drmfd, igt_output_t *output, enum pipe pipe)
>   }
>   
>   /* Max DSC Input BPC for ICL is 10 and for TGL+ is 12 */
> -bool check_gen11_bpc_constraint(int drmfd, igt_output_t *output, int input_bpc)
> +bool check_gen11_bpc_constraint(int drmfd, int input_bpc)
>   {
>   	uint32_t devid = intel_get_drm_devid(drmfd);
>   
> diff --git a/tests/i915/kms_dsc_helper.h b/tests/i915/kms_dsc_helper.h
> index 2109bd767..28ed56d83 100644
> --- a/tests/i915/kms_dsc_helper.h
> +++ b/tests/i915/kms_dsc_helper.h
> @@ -29,7 +29,7 @@ void kms_dsc_exit_handler(int sig);
>   bool is_dsc_supported_by_sink(int drmfd, igt_output_t *output);
>   bool is_dsc_supported_by_source(int drmfd);
>   bool check_gen11_dp_constraint(int drmfd, igt_output_t *output, enum pipe pipe);
> -bool check_gen11_bpc_constraint(int drmfd, igt_output_t *output, int input_bpc);
> +bool check_gen11_bpc_constraint(int drmfd, int input_bpc);
>   void force_dsc_output_format(int drmfd, igt_output_t *output,
>   			     enum dsc_output_format output_format);
>   bool is_dsc_output_format_supported(int disp_ver, int drmfd, igt_output_t *output,
