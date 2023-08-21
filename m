Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2049.outbound.protection.outlook.com [40.107.243.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBE810E0EF
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Aug 2023 15:38:34 +0000 (UTC)
Message-ID: <ee6de4c4-266d-b4bc-ba33-2c6ac058d3c8@amd.com>
Date: Mon, 21 Aug 2023 09:38:04 -0600
To: Aurabindo Pillai <aurabindo.pillai@amd.com>, igt-dev@lists.freedesktop.org
References: <20230821140712.1034591-1-aurabindo.pillai@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20230821140712.1034591-1-aurabindo.pillai@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v4 1/2] lib/amdgpu: Add check for ODM combine
 segments debugfs endpoint
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

On 2023-08-21 08:07, Aurabindo Pillai wrote:
> Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
> ---
>   lib/igt_amd.c | 10 ++++++++++
>   lib/igt_amd.h |  4 ++++
>   2 files changed, 14 insertions(+)
> 
> diff --git a/lib/igt_amd.c b/lib/igt_amd.c
> index 83011e8ca..1a720ff56 100644
> --- a/lib/igt_amd.c
> +++ b/lib/igt_amd.c
> @@ -325,6 +325,16 @@ static bool igt_amd_output_has_dsc(int drm_fd, char *connector_name)
>   	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_DSC_CLOCK_EN);
>   }
>   
> +/**
> + * igt_amd_output_has_odm_combine_segments: check if connector has dsc debugfs entry
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, on which we're reading the status
> + */
> +bool igt_amd_output_has_odm_combine_segments(int drm_fd, char *connector_name)
> +{
> +	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_ODM_COMBINE_SEG);
> +}
> +
>   /**
>    * is_dp_dsc_supported: Checks if connector is DSC capable
>    * @display: A pointer to an #igt_display_t structure
> diff --git a/lib/igt_amd.h b/lib/igt_amd.h
> index 6f538a195..c05b4b730 100644
> --- a/lib/igt_amd.h
> +++ b/lib/igt_amd.h
> @@ -54,6 +54,9 @@
>   #define DEBUGFS_DM_VISUAL_CONFIRM "amdgpu_dm_visual_confirm"
>   #define DEBUGFS_DM_CAPABILITIES "amdgpu_dm_capabilities"
>   
> +/* ODM Combine */
> +#define DEBUGFS_ODM_COMBINE_SEG "odm_combine_segments"
> +
>   enum amd_dsc_clock_force {
>   	DSC_AUTOMATIC = 0,
>   	DSC_FORCE_ON,
> @@ -197,4 +200,5 @@ int  igt_amd_get_visual_confirm(int drm_fd);
>   bool igt_amd_set_visual_confirm(int drm_fd, enum amdgpu_debug_visual_confirm option);
>   
>   bool igt_amd_is_mall_capable(int drm_fd);
> +bool igt_amd_output_has_odm_combine_segments(int drm_fd, char *connector_name);
>   #endif /* IGT_AMD_H */
