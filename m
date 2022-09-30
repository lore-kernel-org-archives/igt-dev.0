Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D991F10EB9A
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Sep 2022 06:56:18 +0000 (UTC)
Message-ID: <fe1c164b-8adc-4e02-814e-cff16222bd36@intel.com>
Date: Fri, 30 Sep 2022 12:25:52 +0530
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220922160004.2041598-1-bhanuprakash.modem@intel.com>
 <20220922160004.2041598-30-bhanuprakash.modem@intel.com>
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20220922160004.2041598-30-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V4 29/52] tests/kms_properties: Add support
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
>   tests/kms_properties.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
> index dd5a93aa..953fb3fb 100644
> --- a/tests/kms_properties.c
> +++ b/tests/kms_properties.c
> @@ -241,6 +241,12 @@ static void plane_properties(igt_display_t *display, bool atomic)
>   		found = false;
>   
>   		for_each_valid_output_on_pipe(display, pipe, output) {
> +			igt_display_reset(display);
> +
> +			igt_output_set_pipe(output, pipe);
> +			if (!i915_pipe_output_combo_valid(display))
> +				continue;
> +
>   			found_any = found = true;
>   
>   			run_plane_property_tests(display, pipe, output, atomic);
> @@ -264,6 +270,12 @@ static void crtc_properties(igt_display_t *display, bool atomic)
>   		found = false;
>   
>   		for_each_valid_output_on_pipe(display, pipe, output) {
> +			igt_display_reset(display);
> +
> +			igt_output_set_pipe(output, pipe);
> +			if (!i915_pipe_output_combo_valid(display))
> +				continue;
> +
>   			found_any_valid_pipe = found = true;
>   
>   			run_crtc_property_tests(display, pipe, output, atomic);
> @@ -290,6 +302,12 @@ static void connector_properties(igt_display_t *display, bool atomic)
>   			if (!igt_pipe_connector_valid(pipe, output))
>   				continue;
>   
> +			igt_display_reset(display);
> +
> +			igt_output_set_pipe(output, pipe);
> +			if (!i915_pipe_output_combo_valid(display))
> +				continue;
> +
>   			found = true;
>   			run_connector_property_tests(display, pipe, output, atomic);
>   			break;
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
