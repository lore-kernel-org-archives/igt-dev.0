Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51BC10E4DD
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Aug 2023 08:38:54 +0000 (UTC)
Message-ID: <af4834c6-05dc-4295-fb90-199caebef523@intel.com>
Date: Thu, 24 Aug 2023 14:08:32 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230824081256.1164530-1-swati2.sharma@intel.com>
 <20230824081256.1164530-2-swati2.sharma@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230824081256.1164530-2-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [v3 1/4] lib/igt_kms: add helper to check if output
 is mst
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


On Thu-24-08-2023 01:42 pm, Swati Sharma wrote:
> Helper is added to check if output is mst or not.
> 
> v2: -use output->config.connector_path to know if
>       output is dpmst (Bhanu)
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> ---
>   lib/igt_kms.c | 11 +++++++++++
>   lib/igt_kms.h |  1 +
>   2 files changed, 12 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index e0959ccff..3af10946c 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6039,3 +6039,14 @@ bool i915_pipe_output_combo_valid(igt_display_t *display)
>   	 */
>   	return igt_check_bigjoiner_support(display);
>   }
> +
> +/**
> + * igt_check_output_is_dp_mst
> + * @output: Target output
> + *
> + * Returns: true if output is dp-mst, else false.
> + */
> +bool igt_check_output_is_dp_mst(igt_output_t *output)
> +{
> +	return !!output->config.connector_path;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 91355c910..35826d4bd 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1013,5 +1013,6 @@ bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
>   bool igt_check_bigjoiner_support(igt_display_t *display);
>   bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
>   bool i915_pipe_output_combo_valid(igt_display_t *display);
> +bool igt_check_output_is_dp_mst(igt_output_t *output);
>   
>   #endif /* __IGT_KMS_H__ */
