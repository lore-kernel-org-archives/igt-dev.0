Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F9D10E53B
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Aug 2023 18:30:01 +0000 (UTC)
Message-ID: <9aa74228-8825-61f8-d393-4dced1851ff8@intel.com>
Date: Thu, 17 Aug 2023 23:59:23 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230810081743.1065566-1-swati2.sharma@intel.com>
 <20230810081743.1065566-3-swati2.sharma@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230810081743.1065566-3-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [v2 2/4] lib/igt_kms: add helper for dp-mst connector
 id
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

Hi Swati,

On Thu-10-08-2023 01:47 pm, Swati Sharma wrote:
> Helper is added which returns dp-mst connector id.
> 
> v2: -use connector_path instead of blob (Bhanu)
>      -rewrite helper (Bhanu/Ankit)
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   lib/igt_kms.c | 34 ++++++++++++++++++++++++++++++++++
>   lib/igt_kms.h |  1 +
>   2 files changed, 35 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index b3a9375ee..e6c26bf0b 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6060,3 +6060,37 @@ bool igt_check_output_is_dp_mst(int drm_fd, igt_output_t *output)
>   
>   	return true;
>   }
> +
> +static int parse_path_connector(char *connector_path)
> +{
> +	int connector_id;
> +	char *encoder;
> +
> +	encoder = strtok(connector_path, ":");
> +	igt_assert_f(!strcmp(encoder, "mst"), "PATH connector property expected to have 'mst'\n");
> +
> +	connector_id = atoi(strtok(NULL, "-"));
> +
> +	return connector_id;
> +}
> +
> +/**
> + * igt_get_dp_mst_connector_id
> + * @drmfd: Handle to open drm device
> + * @output: Target output
> + *
> + * Returns: connector id if output is dp-mst, else -EINVAL.
> + */
> +int igt_get_dp_mst_connector_id(int drm_fd, igt_output_t *output)
> +{
> +	int connector_id;
> +	char *connector_path;
> +
> +	if (!igt_check_output_is_dp_mst(drm_fd, output))
> +		return -EINVAL;
> +
> +	connector_path = output->config.connector_path;
> +	connector_id = parse_path_connector(connector_path);

If my comment in patch 1/4 is true, then no need to parse the path 
property. We can directly get the connector_id from the 
output->config.connector->connector_id

- Bhanu

> +
> +	return connector_id;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index d8d6ccfe5..d83186613 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1014,5 +1014,6 @@ bool igt_check_bigjoiner_support(igt_display_t *display);
>   bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
>   bool i915_pipe_output_combo_valid(igt_display_t *display);
>   bool igt_check_output_is_dp_mst(int drmfd, igt_output_t *output);
> +int igt_get_dp_mst_connector_id(int drmfd, igt_output_t *output);
>   
>   #endif /* __IGT_KMS_H__ */
