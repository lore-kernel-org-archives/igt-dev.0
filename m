Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB9111295D
 for <igt-dev@lists.freedesktop.org>; Wed, 25 May 2022 06:04:56 +0000 (UTC)
Message-ID: <774be48b-e5a2-32a1-a514-3b591c686d9f@intel.com>
Date: Wed, 25 May 2022 11:34:24 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220524164038.15500-1-swati2.sharma@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220524164038.15500-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib/kms: Replace libdrm connector
 name with output
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

On Tue-24-05-2022 10:10 pm, Swati Sharma wrote:
> Use libdrm connector name from output->name, instead of
> constructing it from drm resources.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   lib/igt_kms.c | 62 ++++++++++++++++++++++-----------------------------
>   lib/igt_kms.h | 17 +++++++-------
>   2 files changed, 36 insertions(+), 43 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 014401f6..84e798b5 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2731,7 +2731,7 @@ igt_plane_t *igt_pipe_get_plane_type_index(igt_pipe_t *pipe, int plane_type,
>   	return NULL;
>   }
>   
> -static bool output_is_internal_panel(igt_output_t *output)
> +bool output_is_internal_panel(igt_output_t *output)
>   {
>   	switch (output->config.connector->connector_type) {
>   	case DRM_MODE_CONNECTOR_LVDS:
> @@ -5246,15 +5246,13 @@ void igt_dump_crtcs_fd(int drmfd)
>   }
>   
>   static
> -bool check_dsc_debugfs(int drmfd, drmModeConnector *connector,
> +bool check_dsc_debugfs(int drmfd, char *connector_name,
>   		       const char *check_str)
>   {
>   	char file_name[128] = {0};
>   	char buf[512];
>   
> -	sprintf(file_name, "%s-%d/i915_dsc_fec_support",
> -		kmstest_connector_type_str(connector->connector_type),
> -		connector->connector_type_id);
> +	sprintf(file_name, "%s/i915_dsc_fec_support", connector_name);
>   
>   	igt_debugfs_read(drmfd, file_name, buf);
>   
> @@ -5262,7 +5260,7 @@ bool check_dsc_debugfs(int drmfd, drmModeConnector *connector,
>   }
>   
>   static
> -int write_dsc_debugfs(int drmfd, drmModeConnector *connector,
> +int write_dsc_debugfs(int drmfd, char *connector_name,
>   		      const char *file_name,
>   		      const char *write_buf)
>   {
> @@ -5271,10 +5269,7 @@ int write_dsc_debugfs(int drmfd, drmModeConnector *connector,
>   	int ret;
>   	char file_path[128] = {0};
>   
> -	sprintf(file_path, "%s-%d/%s",
> -		kmstest_connector_type_str(connector->connector_type),
> -		connector->connector_type_id,
> -		file_name);
> +	sprintf(file_path, "%s/%s", connector_name, file_name);
>   
>   	ret = igt_sysfs_write(debugfs_fd, file_path, write_buf, len);
>   
> @@ -5286,96 +5281,93 @@ int write_dsc_debugfs(int drmfd, drmModeConnector *connector,
>   /*
>    * igt_is_dsc_supported:
>    * @drmfd: A drm file descriptor
> - * @connector: Pointer to libdrm connector
> + * @connector_name: Name of the libdrm connector we're going to use
>    *
>    * Returns: True if DSC is supported for the given connector, false otherwise.
>    */
> -bool igt_is_dsc_supported(int drmfd, drmModeConnector *connector)
> +bool igt_is_dsc_supported(int drmfd, char *connector_name)
>   {
> -	return check_dsc_debugfs(drmfd, connector, "DSC_Sink_Support: yes");
> +	return check_dsc_debugfs(drmfd, connector_name, "DSC_Sink_Support: yes");
>   }
>   
>   /*
>    * igt_is_fec_supported:
>    * @drmfd: A drm file descriptor
> - * @connector: Pointer to libdrm connector
> + * @connector_name: Name of the libdrm connector we're going to use
>    *
>    * Returns: True if FEC is supported for the given connector, false otherwise.
>    */
> -bool igt_is_fec_supported(int drmfd, drmModeConnector *connector)
> +bool igt_is_fec_supported(int drmfd, char *connector_name)
>   {
> -
> -	return check_dsc_debugfs(drmfd, connector, "FEC_Sink_Support: yes");
> +	return check_dsc_debugfs(drmfd, connector_name, "FEC_Sink_Support: yes");
>   }
>   
>   /*
>    * igt_is_dsc_enabled:
>    * @drmfd: A drm file descriptor
> - * @connector: Pointer to libdrm connector
> + * @connector_name: Name of the libdrm connector we're going to use
>    *
>    * Returns: True if DSC is enabled for the given connector, false otherwise.
>    */
> -bool igt_is_dsc_enabled(int drmfd, drmModeConnector *connector)
> +bool igt_is_dsc_enabled(int drmfd, char *connector_name)
>   {
> -	return check_dsc_debugfs(drmfd, connector, "DSC_Enabled: yes");
> +	return check_dsc_debugfs(drmfd, connector_name, "DSC_Enabled: yes");
>   }
>   
>   /*
>    * igt_is_force_dsc_enabled:
>    * @drmfd: A drm file descriptor
> - * @connector: Pointer to libdrm connector
> + * @connector_name: Name of the libdrm connector we're going to use
>    *
>    * Returns: True if DSC is force enabled (via debugfs) for the given connector,
>    * false otherwise.
>    */
> -bool igt_is_force_dsc_enabled(int drmfd, drmModeConnector *connector)
> +bool igt_is_force_dsc_enabled(int drmfd, char *connector_name)
>   {
> -	return check_dsc_debugfs(drmfd, connector, "Force_DSC_Enable: yes");
> +	return check_dsc_debugfs(drmfd, connector_name, "Force_DSC_Enable: yes");
>   }
>   
>   /*
>    * igt_force_dsc_enable:
>    * @drmfd: A drm file descriptor
> - * @connector: Pointer to libdrm connector
> + * @connector_name: Name of the libdrm connector we're going to use
>    *
>    * Returns: 1 on success or negative error code, in case of failure.
>    */
> -int igt_force_dsc_enable(int drmfd, drmModeConnector *connector)
> +int igt_force_dsc_enable(int drmfd, char *connector_name)
>   {
> -	return write_dsc_debugfs(drmfd, connector, "i915_dsc_fec_support", "1");
> +	return write_dsc_debugfs(drmfd, connector_name, "i915_dsc_fec_support", "1");
>   }
>   
>   /*
>    * igt_force_dsc_enable_bpp:
>    * @drmfd: A drm file descriptor
> - * @connector: Pointer to libdrm connector
> + * @connector_name: Name of the libdrm connector we're going to use
>    * @bpp: Compressed bpp to be used with DSC
>    *
>    * Returns: No. of bytes written or negative error code, in case of failure.
>    */
> -int igt_force_dsc_enable_bpp(int drmfd, drmModeConnector *connector, int bpp)
> +int igt_force_dsc_enable_bpp(int drmfd, char *connector_name, int bpp)
>   {
>   	char buf[20] = {0};
>   
>   	sprintf(buf, "%d", bpp);
>   
> -	return write_dsc_debugfs(drmfd, connector, "i915_dsc_bpp", buf);
> +	return write_dsc_debugfs(drmfd, connector_name, "i915_dsc_bpp", buf);
>   }
>   
>   /*
>    * igt_get_dsc_debugfs_fd:
>    * @drmfd: A drm file descriptor
> - * @connector: Pointer to libdrm connector
> + * @connector_name: Name of the libdrm connector we're going to use
>    *
>    * Returns: fd of the DSC debugfs for the given connector, else returns -1.
>    */
> -int igt_get_dsc_debugfs_fd(int drmfd, drmModeConnector *connector)
> +int igt_get_dsc_debugfs_fd(int drmfd, char *connector_name)
>   {
>   	char file_name[128] = {0};
>   
> -	sprintf(file_name, "%s-%d/i915_dsc_fec_support",
> -		kmstest_connector_type_str(connector->connector_type),
> -		connector->connector_type_id);
> +	sprintf(file_name, "%s/i915_dsc_fec_support", connector_name);
>   
>   	return openat(igt_debugfs_dir(drmfd), file_name, O_WRONLY);
>   }
> @@ -5383,7 +5375,7 @@ int igt_get_dsc_debugfs_fd(int drmfd, drmModeConnector *connector)
>   /*
>    * igt_get_output_max_bpc:
>    * @drmfd: A drm file descriptor
> - * @output_name: Name of the libdrm connector we're going to use
> + * @connector_name: Name of the libdrm connector we're going to use
>    *
>    * Returns: The maximum bpc from the connector debugfs.
>    */
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 26922095..1f33e4f1 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -479,6 +479,7 @@ igt_plane_t *igt_pipe_get_plane_type(igt_pipe_t *pipe, int plane_type);
>   int igt_pipe_count_plane_type(igt_pipe_t *pipe, int plane_type);
>   igt_plane_t *igt_pipe_get_plane_type_index(igt_pipe_t *pipe, int plane_type,
>   					   int index);
> +bool output_is_internal_panel(igt_output_t *output);
>   igt_output_t *igt_get_single_output_for_pipe(igt_display_t *display, enum pipe pipe);
>   
>   void igt_pipe_request_out_fence(igt_pipe_t *pipe);
> @@ -939,14 +940,14 @@ void igt_dump_connectors_fd(int drmfd);
>   void igt_dump_crtcs_fd(int drmfd);
>   bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display);
>   
> -bool igt_is_dsc_supported(int drmfd, drmModeConnector *connector);
> -bool igt_is_fec_supported(int drmfd, drmModeConnector *connector);
> -bool igt_is_dsc_enabled(int drmfd, drmModeConnector *connector);
> -bool igt_is_force_dsc_enabled(int drmfd, drmModeConnector *connector);
> -int igt_force_dsc_enable(int drmfd, drmModeConnector *connector);
> -int igt_force_dsc_enable_bpp(int drmfd, drmModeConnector *connector,
> -				int bpp);
> -int igt_get_dsc_debugfs_fd(int drmfd, drmModeConnector *connector);
> +bool igt_is_dsc_supported(int drmfd, char *connector_name);
> +bool igt_is_fec_supported(int drmfd, char *connector_name);
> +bool igt_is_dsc_enabled(int drmfd, char *connector_name);
> +bool igt_is_force_dsc_enabled(int drmfd, char *connector_name);
> +int igt_force_dsc_enable(int drmfd, char *connector_name);
> +int igt_force_dsc_enable_bpp(int drmfd, char *connector_name,
> +			     int bpp);
> +int igt_get_dsc_debugfs_fd(int drmfd, char *connector_name);

LGTM
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

- Bhanu

>   
>   unsigned int igt_get_output_max_bpc(int drmfd, char *connector_name);
>   unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe);
