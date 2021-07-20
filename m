Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B7B6E156
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jul 2021 03:19:50 +0000 (UTC)
References: <20210719131439.27284-1-bhanuprakash.modem@intel.com>
 <20210719131439.27284-2-bhanuprakash.modem@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <7f4e3153-0e6b-f6c3-c310-0ad40b53c905@intel.com>
Date: Tue, 20 Jul 2021 08:49:37 +0530
In-Reply-To: <20210719131439.27284-2-bhanuprakash.modem@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V2 1/3] lib/igt_kms: Rename dp_dsc to dsc
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 7/19/2021 6:44 PM, Bhanuprakash Modem wrote:
> As HDMI also supports DSC, rename *dp_dsc* to *dsc* since it is
> no longer DP specific.
>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
> Cc: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Navare Manasi D <manasi.d.navare@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   lib/igt_kms.c | 24 ++++++++++++------------
>   lib/igt_kms.h | 12 ++++++------
>   2 files changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 2c44361a..cc38f5a2 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -5223,38 +5223,38 @@ int write_dsc_debugfs(int drmfd, drmModeConnector *connector,
>   }
>   
>   /*
> - * igt_is_dp_dsc_supported:
> + * igt_is_dsc_supported:
>    * @drmfd: A drm file descriptor
>    * @connector: Pointer to libdrm connector
>    *
>    * Returns: True if DSC is supported for the given connector, false otherwise.
>    */
> -bool igt_is_dp_dsc_supported(int drmfd, drmModeConnector *connector)
> +bool igt_is_dsc_supported(int drmfd, drmModeConnector *connector)
>   {
>   	return check_dsc_debugfs(drmfd, connector, "DSC_Sink_Support: yes");
>   }
>   
>   /*
> - * igt_is_dp_fec_supported:
> + * igt_is_fec_supported:
>    * @drmfd: A drm file descriptor
>    * @connector: Pointer to libdrm connector
>    *
>    * Returns: True if FEC is supported for the given connector, false otherwise.
>    */
> -bool igt_is_dp_fec_supported(int drmfd, drmModeConnector *connector)
> +bool igt_is_fec_supported(int drmfd, drmModeConnector *connector)
>   {
>   
>   	return check_dsc_debugfs(drmfd, connector, "FEC_Sink_Support: yes");
>   }
>   
>   /*
> - * igt_is_dp_dsc_enabled:
> + * igt_is_dsc_enabled:
>    * @drmfd: A drm file descriptor
>    * @connector: Pointer to libdrm connector
>    *
>    * Returns: True if DSC is enabled for the given connector, false otherwise.
>    */
> -bool igt_is_dp_dsc_enabled(int drmfd, drmModeConnector *connector)
> +bool igt_is_dsc_enabled(int drmfd, drmModeConnector *connector)
>   {
>   	return check_dsc_debugfs(drmfd, connector, "DSC_Enabled: yes");
>   }
> @@ -5273,26 +5273,26 @@ bool igt_is_force_dsc_enabled(int drmfd, drmModeConnector *connector)
>   }
>   
>   /*
> - * igt_force_dp_dsc_enable:
> + * igt_force_dsc_enable:
>    * @drmfd: A drm file descriptor
>    * @connector: Pointer to libdrm connector
>    *
>    * Returns: 1 on success or negative error code, in case of failure.
>    */
> -int igt_force_dp_dsc_enable(int drmfd, drmModeConnector *connector)
> +int igt_force_dsc_enable(int drmfd, drmModeConnector *connector)
>   {
>   	return write_dsc_debugfs(drmfd, connector, "i915_dsc_fec_support", "1");
>   }
>   
>   /*
> - * igt_force_dp_dsc_enable:
> + * igt_force_dsc_enable_bpp:
>    * @drmfd: A drm file descriptor
>    * @connector: Pointer to libdrm connector
>    * @bpp: Compressed bpp to be used with DSC
>    *
>    * Returns: No. of bytes written or negative error code, in case of failure.
>    */
> -int igt_force_dp_dsc_enable_bpp(int drmfd, drmModeConnector *connector, int bpp)
> +int igt_force_dsc_enable_bpp(int drmfd, drmModeConnector *connector, int bpp)
>   {
>   	char buf[20] = {0};
>   
> @@ -5302,13 +5302,13 @@ int igt_force_dp_dsc_enable_bpp(int drmfd, drmModeConnector *connector, int bpp)
>   }
>   
>   /*
> - * igt_get_dp_dsc_debugfs_fd:
> + * igt_get_dsc_debugfs_fd:
>    * @drmfd: A drm file descriptor
>    * @connector: Pointer to libdrm connector
>    *
>    * Returns: fd of the DSC debugfs for the given connector, else returns -1.
>    */
> -int igt_get_dp_dsc_debugfs_fd(int drmfd, drmModeConnector *connector)
> +int igt_get_dsc_debugfs_fd(int drmfd, drmModeConnector *connector)
>   {
>   	char file_name[128] = {0};
>   
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index e87d1913..2b054dfc 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -917,13 +917,13 @@ void igt_dump_connectors_fd(int drmfd);
>   void igt_dump_crtcs_fd(int drmfd);
>   bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display);
>   
> -bool igt_is_dp_dsc_supported(int drmfd, drmModeConnector *connector);
> -bool igt_is_dp_fec_supported(int drmfd, drmModeConnector *connector);
> -bool igt_is_dp_dsc_enabled(int drmfd, drmModeConnector *connector);
> +bool igt_is_dsc_supported(int drmfd, drmModeConnector *connector);
> +bool igt_is_fec_supported(int drmfd, drmModeConnector *connector);
> +bool igt_is_dsc_enabled(int drmfd, drmModeConnector *connector);
>   bool igt_is_force_dsc_enabled(int drmfd, drmModeConnector *connector);
> -int igt_force_dp_dsc_enable(int drmfd, drmModeConnector *connector);
> -int igt_force_dp_dsc_enable_bpp(int drmfd, drmModeConnector *connector,
> +int igt_force_dsc_enable(int drmfd, drmModeConnector *connector);
> +int igt_force_dsc_enable_bpp(int drmfd, drmModeConnector *connector,
>   				int bpp);
> -int igt_get_dp_dsc_debugfs_fd(int drmfd, drmModeConnector *connector);
> +int igt_get_dsc_debugfs_fd(int drmfd, drmModeConnector *connector);
>   
>   #endif /* __IGT_KMS_H__ */


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
