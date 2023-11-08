Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13DA610E072
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Nov 2023 06:40:42 +0000 (UTC)
Message-ID: <75e6ca56-8c68-40d4-b67f-1e969f1b6940@amd.com>
Date: Tue, 7 Nov 2023 23:40:38 -0700
Content-Language: en-US
To: Aurabindo Pillai <aurabindo.pillai@amd.com>, igt-dev@lists.freedesktop.org
References: <20231103182230.1039191-1-aurabindo.pillai@amd.com>
 <20231103182230.1039191-5-aurabindo.pillai@amd.com>
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20231103182230.1039191-5-aurabindo.pillai@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 4/5] lib/amd: Add check for SubVP
 feature status
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: hersenxs.wu@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 2023-11-03 12:22, Aurabindo Pillai wrote:
> Add an API to check whether Subviewport feature is supported and enabled
> 
> Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
> ---
>   lib/igt_amd.c | 29 +++++++++++++++++++++++++++++
>   lib/igt_amd.h |  1 +
>   2 files changed, 30 insertions(+)
> 
> diff --git a/lib/igt_amd.c b/lib/igt_amd.c
> index 177a1094d..247a42f37 100644
> --- a/lib/igt_amd.c
> +++ b/lib/igt_amd.c
> @@ -45,6 +45,8 @@
>   #define Y6 64
>   #define Y7 128
>   
> +#define subvp_supported "sub-viewport supported: yes"
> +#define subvp_enabled "sub-viewport supported: yes, enabled: yes"
>   #define mall_supported "mall supported: yes"
>   #define mall_enabled "mall supported: yes, enabled: yes"
>   
> @@ -1203,6 +1205,33 @@ void igt_amd_get_mall_status(int drm_fd, bool *supported, bool *enabled)
>   		*enabled = true;
>   }
>   
> +/**
> + * @brief check if AMDGPU sub-viewport support exists
> + *
> + * @param drm_fd DRM file descriptor
> + * @param supported set to true if harwdare supports subviewport
> + * @param enabled set tot true if subviewport is currently in use
> + */
> +void igt_amd_get_subvp_status(int drm_fd, bool *supported, bool *enabled)
> +{
> +	char buf[1024];
> +	char *subvp_loc;
> +
> +	*supported = false;
> +	*enabled = false;
> +
> +	if (!get_dm_capabilities(drm_fd, buf, 1024))
> +		return;
> +
> +	subvp_loc = strstr(buf, subvp_supported);
> +	if (subvp_loc)
> +		*supported = true;
> +
> +	subvp_loc = strstr(buf, subvp_enabled);
> +	if (subvp_loc && *supported)
> +		*enabled = true;
> +}
> +
>   /**
>    * @brief check if AMDGPU DM visual confirm debugfs interface entry exist and defined
>    *
> diff --git a/lib/igt_amd.h b/lib/igt_amd.h
> index de992ac4f..1e66348ad 100644
> --- a/lib/igt_amd.h
> +++ b/lib/igt_amd.h
> @@ -200,5 +200,6 @@ int  igt_amd_get_visual_confirm(int drm_fd);
>   bool igt_amd_set_visual_confirm(int drm_fd, enum amdgpu_debug_visual_confirm option);
>   
>   void igt_amd_get_mall_status(int drm_fd, bool *supported, bool *enabled);
> +void igt_amd_get_subvp_status(int drm_fd, bool *supported, bool *enabled);
>   bool igt_amd_output_has_odm_combine_segments(int drm_fd, char *connector_name);
>   #endif /* IGT_AMD_H */
