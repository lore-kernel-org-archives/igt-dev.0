Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC546E838
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Nov 2021 15:33:39 +0000 (UTC)
References: <20211119150024.2701531-1-Rodrigo.Siqueira@amd.com>
From: Rodrigo Siqueira Jordao <rjordrigo@amd.com>
Message-ID: <f6341eaa-9815-6d49-9e69-d355581e8585@amd.com>
Date: Wed, 24 Nov 2021 10:33:33 -0500
In-Reply-To: <20211119150024.2701531-1-Rodrigo.Siqueira@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/amdgpu: Add test for AMD DP DSC
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Cc: Eryk Brol <eryk.brol@amd.com>, igt-dev@lists.freedesktop.org, Mikita Lipski <mikita.lipski@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Lakshmi,

I noticed a CI failure in this patch which is focused on AMD, except for 
the below change in the igt_kms.h:

diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index e9ecd21e..5c7d7481 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -125,6 +125,7 @@  enum igt_atomic_crtc_properties {
         IGT_CRTC_ACTIVE,
         IGT_CRTC_OUT_FENCE_PTR,
         IGT_CRTC_VRR_ENABLED,
+       IGT_CRTC_DSC_SLICE_HEIGHT,
         IGT_NUM_CRTC_PROPS
  };

 From the CI results, I'm not sure if this change caused the other 
failures, and since we saw some false positives in the AMD tests last 
week, is it possible to trigger the CI test for this patch again?

https://patchwork.freedesktop.org/patch/463655/?series=97108&rev=1

Thanks
Siqueira

On 2021-11-19 10:00 a.m., Rodrigo Siqueira wrote:
> From: Eryk Brol <eryk.brol@amd.com>
> 
> This commit introduces a DP DSC test that checks:
> 
> * Forces DSC on/off and ensures it is reset properly
> * Check DSC slice height property
> * Verify various DSC slice dimensions
> * Tests various combinations of link_rate + lane_count and logs if DSC
>    enabled/disabled Tests different bpc settings and logs if DSC is
>    enabled/disabled
> 
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Nicholas Choi <Nicholas.Choi@amd.com>
> Cc: Mark Yacoub <markyacoub@chromium.org>
> Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>
> Signed-off-by: Eryk Brol <eryk.brol@amd.com>
> ---
>   lib/igt_amd.c             | 494 +++++++++++++++++++++++++--
>   lib/igt_amd.h             |  35 ++
>   lib/igt_kms.h             |   1 +
>   tests/amdgpu/amd_dp_dsc.c | 685 ++++++++++++++++++++++++++++++++++++++
>   tests/amdgpu/meson.build  |   1 +
>   5 files changed, 1194 insertions(+), 22 deletions(-)
>   create mode 100644 tests/amdgpu/amd_dp_dsc.c
> 
> diff --git a/lib/igt_amd.c b/lib/igt_amd.c
> index f1bfb421..4bcfd594 100644
> --- a/lib/igt_amd.c
> +++ b/lib/igt_amd.c
> @@ -251,11 +251,11 @@ bool igt_amd_is_tiled(uint64_t modifier)
>   }
>   
>   /**
> - * igt_amd_output_has_hpd: check if connector has HPD debugfs entry
> + * igt_amd_output_has_dsc: check if connector has dsc debugfs entry
>    * @drm_fd: DRM file descriptor
>    * @connector_name: The connector's name, on which we're reading the status
>    */
> -static bool igt_amd_output_has_hpd(int drm_fd, char *connector_name)
> +static bool igt_amd_output_has_dsc(int drm_fd, char *connector_name)
>   {
>   	int fd;
>   	int res;
> @@ -267,9 +267,9 @@ static bool igt_amd_output_has_hpd(int drm_fd, char *connector_name)
>   		return false;
>   	}
>   
> -	res = fstatat(fd, DEBUGFS_HPD_TRIGGER, &stat, 0);
> +	res = fstatat(fd, DEBUGFS_DSC_CLOCK_EN , &stat, 0);
>   	if (res != 0) {
> -		igt_info("%s debugfs not supported\n", DEBUGFS_HPD_TRIGGER);
> +		igt_info("%s debugfs not supported\n", DEBUGFS_DSC_CLOCK_EN);
>   		close(fd);
>   		return false;
>   	}
> @@ -279,49 +279,499 @@ static bool igt_amd_output_has_hpd(int drm_fd, char *connector_name)
>   }
>   
>   /**
> - * igt_amd_require_hpd: Checks if connectors have HPD debugfs
> + * is_dp_dsc_supported: Checks if connector is DSC capable
> + * @display: A pointer to an #igt_display_t structure
> + * @drm_fd: DRM file descriptor
> + */
> +bool is_dp_dsc_supported(int drm_fd, char *connector_name)
> +{
> +	char buf[512];
> +	int fd, ret;
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +
> +	if (fd < 0) {
> +		igt_info("Couldn't open connector %s debugfs directory\n",
> +			 connector_name);
> +		return false;
> +	}
> +
> +	ret = igt_debugfs_simple_read(fd, DEBUGFS_DSC_FEC_SUPPORT, buf, sizeof(buf));
> +	close(fd);
> +
> +	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
> +		     DEBUGFS_DSC_FEC_SUPPORT, connector_name);
> +
> +	return strstr(buf, "DSC_Sink_Support: yes");
> +}
> +
> +/**
> + * is_dp_fec_supported: Checks if connector is FEC capable
> + * @display: A pointer to an #igt_display_t structure
> + * @drm_fd: DRM file descriptor
> + */
> +bool is_dp_fec_supported(int drm_fd, char *connector_name)
> +{
> +	char buf[512];
> +	int fd, ret;
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +
> +	if (fd < 0) {
> +		igt_info("Couldn't open connector %s debugfs directory\n",
> +			 connector_name);
> +		return false;
> +	}
> +
> +	ret = igt_debugfs_simple_read(fd, DEBUGFS_DSC_FEC_SUPPORT, buf, sizeof(buf));
> +	close(fd);
> +
> +	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
> +		     DEBUGFS_DSC_FEC_SUPPORT, connector_name);
> +
> +	return strstr(buf, "FEC_Sink_Support: yes");
> +}
> +
> +/**
> + * igt_amd_require_dsc: Checks if connectors have DSC debugfs
>    * @display: A pointer to an #igt_display_t structure
>    * @drm_fd: DRM file descriptor
>    *
> - * Checks if the AMDGPU driver has support the 'trigger_hotplug'
> - * entry for HPD. Skip test if HPD is not supported.
> + * Checks if the AMDGPU driver has support of debugfs entries for
> + * DSC. Skip test if DSC is not supported.
>    */
> -void igt_amd_require_hpd(igt_display_t *display, int drm_fd)
> +void igt_amd_require_dsc(igt_display_t *display, int drm_fd)
>   {
>   	igt_output_t *output;
>   
>   	for_each_connected_output(display, output) {
> -		if (igt_amd_output_has_hpd(drm_fd, output->name))
> +		if (igt_amd_output_has_dsc(drm_fd, output->name))
>   			return;
>   	}
>   
> -	igt_skip("No HPD debugfs support.\n");
> +	igt_skip("No DSC debugfs support.\n");
>   }
>   
>   /**
> - * igt_amd_trigger_hotplut: Triggers a debugfs HPD
> + * igt_amd_read_dsc_clock_status: Read the DSC Clock Enable debugfs
>    * @drm_fd: DRM file descriptor
> - * @connector_name: The connector's name, which we trigger the hotplug on
> + * @connector_name: The connector's name, which we use to read status on
>    *
> - * igt_amd_require_hpd should be called before calling this.
>    */
> -int igt_amd_trigger_hotplug(int drm_fd, char *connector_name)
> +int igt_amd_read_dsc_clock_status(int drm_fd, char *connector_name)
> +{
> +	char buf[4];
> +	int fd, ret;
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +	if (fd < 0) {
> +		igt_info("Couldn't open connector %s debugfs directory\n",
> +			 connector_name);
> +		return false;
> +	}
> +	ret = igt_debugfs_simple_read(fd, DEBUGFS_DSC_CLOCK_EN, buf, sizeof(buf));
> +	close(fd);
> +
> +	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
> +		     DEBUGFS_DSC_CLOCK_EN, connector_name);
> +
> +	return strtol(buf, NULL, 0);
> +}
> +
> +
> +/**
> + * igt_amd_write_dsc_clock_en: Write the DSC Clock Enable debugfs
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, which we use to read status on
> + * @dsc_force: DSC force parameter, 0 - DSC automatic, 1 - DSC force on,
> + * 2 - DSC force off
> + *
> + */
> +void igt_amd_write_dsc_clock_en(int drm_fd, char *connector_name, int dsc_force)
> +{
> +	int fd, dsc_fd;
> +	char src[4];
> +	int wr_len;
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +	igt_assert(fd >= 0);
> +	dsc_fd = openat(fd, DEBUGFS_DSC_CLOCK_EN, O_WRONLY);
> +	close(fd);
> +	igt_assert(dsc_fd >= 0);
> +
> +	if (dsc_force == DSC_FORCE_ON)
> +		snprintf(src, sizeof(src), "%d", 1);
> +	else if (dsc_force == DSC_FORCE_OFF)
> +		snprintf(src, sizeof(src), "%d", 2);
> +	else
> +		snprintf(src, sizeof(src), "%d", 0);
> +
> +	igt_info("DSC Clock force, write %s > dsc_clock_en\n", src);
> +
> +	wr_len = write(dsc_fd, src, strlen(src));
> +	close(dsc_fd);
> +	igt_assert_eq(wr_len, strlen(src));
> +}
> +
> +/**
> + * igt_amd_write_dsc_param_slice_height: Write the DSC Slice Height debugfs
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, which we use to read status on
> + * @slice_height: DSC slice height parameter, accepts any positive integer,
> + * 		  if parameter is negative - it will not write to debugfs.
> + *
> + */
> +void igt_amd_write_dsc_param_slice_height(int drm_fd, char *connector_name, int slice_height)
> +{
> +	int fd, dsc_fd;
> +	char src[32];
> +	int wr_len;
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +	igt_assert(fd >= 0);
> +	dsc_fd = openat(fd, DEBUGFS_DSC_SLICE_HEIGHT, O_WRONLY);
> +	close(fd);
> +	igt_assert(dsc_fd >= 0);
> +
> +	if (slice_height >= 0) {
> +		snprintf(src, sizeof(src), "%#x", slice_height);
> +	} else {
> +		igt_warn("DSC SLICE HEIGHT, slice height parameter is invalid (%d)\n", slice_height);
> +		goto exit;
> +	}
> +
> +	igt_info("DSC SLICE HEIGHT, write %s > dsc_slice_height\n", src);
> +
> +	wr_len = write(dsc_fd, src, strlen(src));
> +	igt_assert_eq(wr_len, strlen(src));
> +exit:
> +	close(dsc_fd);
> +}
> +
> +/**
> + * igt_amd_read_dsc_param_slice_height: Read the DSC Slice Height debugfs
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, which we use to read status on
> + *
> + */
> +int igt_amd_read_dsc_param_slice_height(int drm_fd, char *connector_name)
> +{
> +	char buf[32];
> +	int fd, ret;
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +	if (fd < 0) {
> +		igt_info("Couldn't open connector %s debugfs directory\n",
> +			 connector_name);
> +		return false;
> +	}
> +	ret = igt_debugfs_simple_read(fd, DEBUGFS_DSC_SLICE_HEIGHT, buf, sizeof(buf));
> +	close(fd);
> +
> +	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
> +		     DEBUGFS_DSC_SLICE_HEIGHT, connector_name);
> +
> +	return strtol(buf, NULL, 0);
> +}
> +
> +/**
> + * igt_amd_write_dsc_param_slice_width: Write the DSC Slice Width debugfs
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, which we use to read status on
> + * @slice_width: DSC slice width parameter, accepts any positive integer,
> + * 		 if parameter is negative - it will not write to debugfs.
> + *
> + */
> +void igt_amd_write_dsc_param_slice_width(int drm_fd, char *connector_name, int slice_width)
>   {
> -	int fd, hpd_fd;
> +	int fd, dsc_fd;
> +	char src[32];
>   	int wr_len;
> -	const char *enable_hpd = "1";
>   
>   	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
>   	igt_assert(fd >= 0);
> -	hpd_fd = openat(fd, DEBUGFS_HPD_TRIGGER, O_WRONLY);
> +	dsc_fd = openat(fd, DEBUGFS_DSC_SLICE_WIDTH, O_WRONLY);
> +	close(fd);
> +	igt_assert(dsc_fd >= 0);
> +
> +	if (slice_width >= 0) {
> +		snprintf(src, sizeof(src), "%#x", slice_width);
> +	} else {
> +		igt_warn("DSC SLICE WIDTH, slice width parameter is invalid (%d)\n", slice_width);
> +		goto exit;
> +	}
> +
> +	igt_info("DSC SLICE WIDTH, write %s > dsc_slice_width\n", src);
> +
> +	wr_len = write(dsc_fd, src, strlen(src));
> +	igt_assert_eq(wr_len, strlen(src));
> +exit:
> +	close(dsc_fd);
> +}
> +
> +/**
> + * igt_amd_read_dsc_param_slice_width: Read the DSC Slice Width debugfs
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, which we use to read status on
> + *
> + */
> +int igt_amd_read_dsc_param_slice_width(int drm_fd, char *connector_name)
> +{
> +	char buf[32];
> +	int fd, ret;
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +	if (fd < 0) {
> +		igt_info("Couldn't open connector %s debugfs directory\n",
> +			 connector_name);
> +		return false;
> +	}
> +	ret = igt_debugfs_simple_read(fd, DEBUGFS_DSC_SLICE_WIDTH, buf, sizeof(buf));
>   	close(fd);
> -	igt_assert(hpd_fd >= 0);
>   
> -	wr_len = write(hpd_fd, enable_hpd, strlen(enable_hpd));
> -	close(hpd_fd);
> -	igt_assert_eq(wr_len, strlen(enable_hpd));
> +	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
> +		     DEBUGFS_DSC_SLICE_WIDTH, connector_name);
> +
> +	return strtol(buf, NULL, 0);
> +}
> +
> +/**
> + * igt_amd_write_dsc_param_bpp: Write the DSC Bits Per Pixel debugfs
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, which we use to read status on
> + * @bpp: DSC bits per pixel parameter, accepts any positive integer,
> + * 	 if parameter is negative - it will not write to debugfs.
> + *
> + */
> +void igt_amd_write_dsc_param_bpp(int drm_fd, char *connector_name, int bpp)
> +{
> +	int fd, dsc_fd;
> +	char src[32];
> +	int wr_len;
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +	igt_assert(fd >= 0);
> +	dsc_fd = openat(fd, DEBUGFS_DSC_BITS_PER_PIXEL, O_WRONLY);
> +	close(fd);
> +	igt_assert(dsc_fd >= 0);
> +
> +	if (bpp >= 0) {
> +		snprintf(src, sizeof(src), "%#x", bpp);
> +	} else {
> +		igt_warn("DSC BITS PER PIXEL, bits per pixel parameter is invalid (%d)\n", bpp);
> +		goto exit;
> +	}
> +
> +	igt_info("DSC BITS PER PIXEL, write %s > dsc_bits_per_pixel\n", src);
> +
> +	wr_len = write(dsc_fd, src, strlen(src));
> +	igt_assert_eq(wr_len, strlen(src));
> +exit:
> +	close(dsc_fd);
> +}
> +
> +/**
> + * igt_amd_read_dsc_param_bpp: Read the DSC Bits Per Pixel debugfs
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, which we use to read status on
> + *
> + */
> +int igt_amd_read_dsc_param_bpp(int drm_fd, char *connector_name)
> +{
> +	char buf[32];
> +	int fd, ret;
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +	if (fd < 0) {
> +		igt_info("Couldn't open connector %s debugfs directory\n",
> +			 connector_name);
> +		return false;
> +	}
> +	ret = igt_debugfs_simple_read(fd, DEBUGFS_DSC_BITS_PER_PIXEL, buf, sizeof(buf));
> +	close(fd);
> +
> +	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
> +		     DEBUGFS_DSC_BITS_PER_PIXEL, connector_name);
> +
> +	return strtol(buf, NULL, 0);
> +}
> +
> +/**
> + * igt_amd_read_dsc_param_pic_width: Read the DSC Picture Width debugfs
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, which we use to read status on
> + *
> + */
> +int igt_amd_read_dsc_param_pic_width(int drm_fd, char *connector_name)
> +{
> +	char buf[4];
> +	int fd, ret;
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +	if (fd < 0) {
> +		igt_info("Couldn't open connector %s debugfs directory\n",
> +			 connector_name);
> +		return false;
> +	}
> +	ret = igt_debugfs_simple_read(fd, DEBUGFS_DSC_PIC_WIDTH, buf, sizeof(buf));
> +	close(fd);
> +
> +	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
> +		     DEBUGFS_DSC_PIC_WIDTH, connector_name);
> +
> +	return strtol(buf, NULL, 0);
> +}
> +
> +/**
> + * igt_amd_read_dsc_param_pic_height: Read the DSC Picture Height debugfs
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, which we use to read status on
> + *
> + */
> +int igt_amd_read_dsc_param_pic_height(int drm_fd, char *connector_name)
> +{
> +	char buf[4];
> +	int fd, ret;
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +	if (fd < 0) {
> +		igt_info("Couldn't open connector %s debugfs directory\n",
> +			 connector_name);
> +		return false;
> +	}
> +	ret = igt_debugfs_simple_read(fd, DEBUGFS_DSC_PIC_HEIGHT, buf, sizeof(buf));
> +	close(fd);
> +
> +	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
> +		     DEBUGFS_DSC_PIC_HEIGHT, connector_name);
> +
> +	return strtol(buf, NULL, 0);
> +}
> +
> +/**
> + * igt_amd_read_dsc_param_chunk_size: Read the DSC Chunk Size debugfs
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, which we use to read status on
> + *
> + */
> +int igt_amd_read_dsc_param_chunk_size(int drm_fd, char *connector_name)
> +{
> +	char buf[4];
> +	int fd, ret;
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +	if (fd < 0) {
> +		igt_info("Couldn't open connector %s debugfs directory\n",
> +			 connector_name);
> +		return false;
> +	}
> +	ret = igt_debugfs_simple_read(fd, DEBUGFS_DSC_CHUNK_SIZE, buf, sizeof(buf));
> +	close(fd);
> +
> +	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
> +		     DEBUGFS_DSC_CHUNK_SIZE, connector_name);
> +
> +	return strtol(buf, NULL, 0);
> +}
> +
> +/**
> + * igt_amd_read_dsc_param_slice_bpg: Read the DSC Slice BPG Offset debugfs
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, which we use to read status on
> + *
> + */
> +int igt_amd_read_dsc_param_slice_bpg(int drm_fd, char *connector_name)
> +{
> +	char buf[4];
> +	int fd, ret;
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +	if (fd < 0) {
> +		igt_info("Couldn't open connector %s debugfs directory\n",
> +			 connector_name);
> +		return false;
> +	}
> +	ret = igt_debugfs_simple_read(fd, DEBUGFS_DSC_SLICE_BPG, buf, sizeof(buf));
> +	close(fd);
> +
> +	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
> +		     DEBUGFS_DSC_SLICE_BPG, connector_name);
> +
> +	return strtol(buf, NULL, 0);
> +}
> +
> +/**
> + * igt_amd_output_has_hpd: check if connector has HPD debugfs entry
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, on which we're reading the status
> + */
> +static bool igt_amd_output_has_hpd(int drm_fd, char *connector_name)
> +{
> +        int fd;
> +        int res;
> +        struct stat stat;
> +
> +        fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +        if (fd < 0) {
> +                igt_info("output %s: debugfs not found\n", connector_name);
> +                return false;
> +        }
> +
> +        res = fstatat(fd, DEBUGFS_HPD_TRIGGER, &stat, 0);
> +        if (res != 0) {
> +                igt_info("%s debugfs not supported\n", DEBUGFS_HPD_TRIGGER);
> +                close(fd);
> +                return false;
> +        }
> +
> +        close(fd);
> +        return true;
> +}
> +
> +/**
> + * igt_amd_require_hpd: Checks if connectors have HPD debugfs
> + * @display: A pointer to an #igt_display_t structure
> + * @drm_fd: DRM file descriptor
> + *
> + * Checks if the AMDGPU driver has support the 'trigger_hotplug'
> + * entry for HPD. Skip test if HPD is not supported.
> + */
> +void igt_amd_require_hpd(igt_display_t *display, int drm_fd)
> +{
> +        igt_output_t *output;
> +
> +        for_each_connected_output(display, output) {
> +                if (igt_amd_output_has_hpd(drm_fd, output->name))
> +                        return;
> +        }
> +
> +        igt_skip("No HPD debugfs support.\n");
> +}
> +
> +/**
> + * igt_amd_trigger_hotplut: Triggers a debugfs HPD
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, which we trigger the hotplug on
> + *
> + * igt_amd_require_hpd should be called before calling this.
> + */
> +int igt_amd_trigger_hotplug(int drm_fd, char *connector_name)
> +{
> +        int fd, hpd_fd;
> +        int wr_len;
> +        const char *enable_hpd = "1";
> +
> +        fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +        igt_assert(fd >= 0);
> +        hpd_fd = openat(fd, DEBUGFS_HPD_TRIGGER, O_WRONLY);
> +        close(fd);
> +        igt_assert(hpd_fd >= 0);
> +
> +        wr_len = write(hpd_fd, enable_hpd, strlen(enable_hpd));
> +        close(hpd_fd);
> +        igt_assert_eq(wr_len, strlen(enable_hpd));
>   
> -	return 0;
> +        return 0;
>   }
>   
>   /*
> diff --git a/lib/igt_amd.h b/lib/igt_amd.h
> index e5bdbf33..7a91cbff 100644
> --- a/lib/igt_amd.h
> +++ b/lib/igt_amd.h
> @@ -27,9 +27,27 @@
>   #include "igt.h"
>   #include "igt_fb.h"
>   
> +/* Read & Write DSC parameters */
> +#define DEBUGFS_DSC_CLOCK_EN "dsc_clock_en"
> +#define DEBUGFS_DSC_SLICE_WIDTH "dsc_slice_width"
> +#define DEBUGFS_DSC_SLICE_HEIGHT "dsc_slice_height"
> +#define DEBUGFS_DSC_BITS_PER_PIXEL "dsc_bits_per_pixel"
> +/* Read only DSC parameters */
> +#define DEBUGFS_DSC_PIC_WIDTH "dsc_pic_width"
> +#define DEBUGFS_DSC_PIC_HEIGHT "dsc_pic_height"
> +#define DEBUGFS_DSC_CHUNK_SIZE "dsc_chunk_size"
> +#define DEBUGFS_DSC_SLICE_BPG "dsc_slice_bpg"
> +#define DEBUGFS_DSC_FEC_SUPPORT "dp_dsc_fec_support"
> +
>   #define DEBUGFS_DP_LINK_SETTINGS "link_settings"
>   #define DEBUGFS_HPD_TRIGGER "trigger_hotplug"
>   
> +enum amd_dsc_clock_force {
> +	DSC_AUTOMATIC = 0,
> +	DSC_FORCE_ON,
> +	DSC_FORCE_OFF,
> +};
> +
>   enum dc_lane_count {
>   	LANE_COUNT_UNKNOWN = 0,
>   	LANE_COUNT_ONE = 1,
> @@ -80,6 +98,23 @@ void igt_amd_fb_convert_plane_to_tiled(struct igt_fb *dst, void *dst_buf,
>   				       struct igt_fb *src, void *src_buf);
>   bool igt_amd_is_tiled(uint64_t modifier);
>   
> +/* IGT DSC helper functions */
> +bool is_dp_dsc_supported(int drm_fd, char *connector_name);
> +bool is_dp_fec_supported(int drm_fd, char *connector_name);
> +void igt_amd_require_dsc(igt_display_t *display, int drm_fd);
> +int igt_amd_read_dsc_clock_status(int drm_fd, char *connector_name);
> +void igt_amd_write_dsc_clock_en(int drm_fd, char *connector_name, int dsc_force);
> +void igt_amd_write_dsc_param_slice_height(int drm_fd, char *connector_name, int slice_height);
> +int igt_amd_read_dsc_param_slice_height(int drm_fd, char *connector_name);
> +void igt_amd_write_dsc_param_slice_width(int drm_fd, char *connector_name, int slice_width);
> +int igt_amd_read_dsc_param_slice_width(int drm_fd, char *connector_name);
> +void igt_amd_write_dsc_param_bpp(int drm_fd, char *connector_name, int bpp);
> +int igt_amd_read_dsc_param_bpp(int drm_fd, char *connector_name);
> +int igt_amd_read_dsc_param_pic_width(int drm_fd, char *connector_name);
> +int igt_amd_read_dsc_param_pic_height(int drm_fd, char *connector_name);
> +int igt_amd_read_dsc_param_chunk_size(int drm_fd, char *connector_name);
> +int igt_amd_read_dsc_param_slice_bpg(int drm_fd, char *connector_name);
> +
>   /* IGT HPD helper functions */
>   void igt_amd_require_hpd(igt_display_t *display, int drm_fd);
>   int igt_amd_trigger_hotplug(int drm_fd, char *connector_name);
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index e9ecd21e..5c7d7481 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -125,6 +125,7 @@ enum igt_atomic_crtc_properties {
>          IGT_CRTC_ACTIVE,
>          IGT_CRTC_OUT_FENCE_PTR,
>          IGT_CRTC_VRR_ENABLED,
> +       IGT_CRTC_DSC_SLICE_HEIGHT,
>          IGT_NUM_CRTC_PROPS
>   };
>   
> diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
> new file mode 100644
> index 00000000..d73425e2
> --- /dev/null
> +++ b/tests/amdgpu/amd_dp_dsc.c
> @@ -0,0 +1,685 @@
> +/*
> + * Copyright 2021 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +#include "igt.h"
> +#include "igt_amd.h"
> +#include "sw_sync.h"
> +#include <fcntl.h>
> +#include <signal.h>
> +
> +#define NUM_SLICE_SLOTS 4
> +
> +/* Maximumm pipes on any AMD ASIC. */
> +#define MAX_PIPES 6
> +
> +/* Common test data. */
> +typedef struct data {
> +	igt_display_t display;
> +	igt_plane_t *primary[MAX_PIPES];
> +	igt_output_t *output[MAX_PIPES];
> +	igt_pipe_t *pipe[MAX_PIPES];
> +	igt_pipe_crc_t *pipe_crc[MAX_PIPES];
> +	drmModeModeInfo mode[MAX_PIPES];
> +	enum pipe pipe_id[MAX_PIPES];
> +	int fd;
> +} data_t;
> +
> +/* BPC connector state. */
> +typedef struct output_bpc {
> +	unsigned int current;
> +	unsigned int maximum;
> +} output_bpc_t;
> +
> +/* Common test cleanup. */
> +static void test_fini(data_t *data)
> +{
> +	igt_display_t *display = &data->display;
> +	int i;
> +
> +	for (i = 0; i < display->n_pipes; ++i) {
> +		igt_pipe_crc_free(data->pipe_crc[i]);
> +	}
> +
> +	igt_display_reset(display);
> +	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
> +}
> +
> +/* Common test setup. */
> +static void test_init(data_t *data)
> +{
> +	igt_display_t *display = &data->display;
> +	int i, n;
> +
> +	for (i = 0; i < display->n_pipes; ++i) {
> +		data->pipe_id[i] = PIPE_A + i;
> +		data->pipe[i] = &data->display.pipes[data->pipe_id[i]];
> +		data->primary[i] = igt_pipe_get_plane_type(
> +				data->pipe[i], DRM_PLANE_TYPE_PRIMARY);
> +		data->pipe_crc[i] =
> +				igt_pipe_crc_new(data->fd, data->pipe_id[i], "auto");
> +	}
> +
> +	for (i = 0, n = 0; i < display->n_outputs && n < display->n_pipes; ++i) {
> +		igt_output_t *output = &display->outputs[i];
> +		data->output[n] = output;
> +
> +		/* Only allow physically connected displays for the tests. */
> +		if (!igt_output_is_connected(output))
> +				continue;
> +
> +		/* Ensure that outpus are DP, DSC & FEC capable*/
> +		if (!(is_dp_fec_supported(data->fd, output->name) &&
> +			is_dp_dsc_supported(data->fd, output->name)))
> +			continue;
> +
> +		if (output->config.connector->connector_type !=
> +			DRM_MODE_CONNECTOR_DisplayPort)
> +			continue;
> +
> +		igt_assert(kmstest_get_connector_default_mode(
> +				data->fd, output->config.connector, &data->mode[n]));
> +
> +		n += 1;
> +	}
> +
> +	igt_display_reset(display);
> +}
> +
> +static void test_dsc_enable(data_t *data)
> +{
> +	bool dsc_on, dsc_after, dsc_before;
> +	igt_display_t *display = &data->display;
> +	igt_output_t *output;
> +	igt_fb_t ref_fb;
> +	int i, test_conn_cnt = 0;
> +
> +	test_init(data);
> +	igt_enable_connectors(data->fd);
> +
> +	for (i = 0; i < display->n_pipes; i++) {
> +		/* Setup the output */
> +		output = data->output[i];
> +		if (!output || !igt_output_is_connected(output))
> +			continue;
> +
> +		igt_create_pattern_fb(data->fd,
> +					data->mode[i].hdisplay,
> +					data->mode[i].vdisplay,
> +					DRM_FORMAT_XRGB8888,
> +					0,
> +					&ref_fb);
> +		igt_output_set_pipe(output, data->pipe_id[i]);
> +		igt_plane_set_fb(data->primary[i], &ref_fb);
> +		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
> +
> +		test_conn_cnt++;
> +
> +		/* Save pipe's initial DSC state */
> +		dsc_before = igt_amd_read_dsc_clock_status(data->fd, output->name);
> +
> +		/* Force enable DSC */
> +		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_FORCE_ON);
> +
> +		igt_plane_set_fb(data->primary[i], &ref_fb);
> +		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +		/* Check if DSC is enabled */
> +		dsc_on = igt_amd_read_dsc_clock_status(data->fd, output->name) == 1;
> +
> +		/* Revert DSC to automatic state */
> +		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_FORCE_OFF);
> +
> +		igt_plane_set_fb(data->primary[i], &ref_fb);
> +		igt_display_commit_atomic(display,DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +		dsc_after = igt_amd_read_dsc_clock_status(data->fd, output->name);
> +
> +		/* Revert DSC back to automatic mechanism by disabling state overwrites*/
> +		igt_plane_set_fb(data->primary[i], &ref_fb);
> +
> +		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_AUTOMATIC);
> +
> +		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +		igt_assert_f(dsc_on, "Enabling DSC on pipe failed.\n");
> +		igt_assert_f(dsc_after == dsc_before, "Reverting DSC to initial state failed.\n");
> +
> +		/* Cleanup fb */
> +		igt_remove_fb(data->fd, &ref_fb);
> +	}
> +
> +	test_fini(data);
> +	igt_skip_on(test_conn_cnt == 0);
> +}
> +
> +static void test_dsc_slice_height_property(data_t *data)
> +{
> +	bool dsc_on, dsc_after, dsc_before;
> +	int slice_height_on, slice_height_off;
> +	igt_display_t *display = &data->display;
> +	igt_output_t *output;
> +	igt_fb_t ref_fb;
> +	int i, test_conn_cnt = 0;
> +
> +	test_init(data);
> +	igt_enable_connectors(data->fd);
> +
> +	for (i = 0; i < display->n_pipes; i++) {
> +		/* Setup the output */
> +		output = data->output[i];
> +		if (!output || !igt_output_is_connected(output))
> +			continue;
> +
> +		igt_create_pattern_fb(data->fd,
> +					data->mode[i].hdisplay,
> +					data->mode[i].vdisplay,
> +					DRM_FORMAT_XRGB8888,
> +					0,
> +					&ref_fb);
> +		igt_output_set_pipe(output, data->pipe_id[i]);
> +		igt_plane_set_fb(data->primary[i], &ref_fb);
> +		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
> +
> +		test_conn_cnt++;
> +
> +		/* Save pipe's initial DSC state */
> +		dsc_before = igt_amd_read_dsc_clock_status(data->fd, output->name);
> +
> +		/* Force enable DSC */
> +		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_FORCE_ON);
> +
> +		igt_plane_set_fb(data->primary[i], &ref_fb);
> +		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +		/* Check if DSC is enabled */
> +		dsc_on = igt_amd_read_dsc_clock_status(data->fd, output->name) == 1;
> +
> +		slice_height_on = igt_pipe_get_prop(display, data->pipe_id[i], IGT_CRTC_DSC_SLICE_HEIGHT);
> +
> +		/* Revert DSC to automatic state */
> +		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_FORCE_OFF);
> +
> +		igt_plane_set_fb(data->primary[i], &ref_fb);
> +		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +		dsc_after = igt_amd_read_dsc_clock_status(data->fd, output->name);
> +
> +		slice_height_off = igt_pipe_get_prop(display, data->pipe_id[i], IGT_CRTC_DSC_SLICE_HEIGHT);
> +
> +		/* Revert DSC back to automatic mechanism by disabling state overwrites*/
> +		igt_plane_set_fb(data->primary[i], &ref_fb);
> +
> +		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_AUTOMATIC);
> +
> +		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +		igt_assert_f(dsc_on, "Enabling DSC on pipe failed.\n");
> +		igt_assert_f(slice_height_on > 0, "DSC Slice property was not set properly.\n");
> +		igt_assert_f(dsc_after == dsc_before, "Reverting DSC to initial state failed.\n");
> +		igt_assert_f(slice_height_off == 0, "DSC Slice property was not reset properly.\n");
> +
> +		/* Cleanup fb */
> +		igt_remove_fb(data->fd, &ref_fb);
> +	}
> +
> +	test_fini(data);
> +	igt_skip_on(test_conn_cnt == 0);
> +}
> +
> +static bool update_slice_height(data_t *data, int v_addressable,
> +					  int *num_slices, igt_output_t *output, int conn_idx, igt_fb_t ref_fb)
> +{
> +	int i;
> +	bool pass = true;
> +
> +	for(i = 0; i < NUM_SLICE_SLOTS; i++) {
> +		int act_slice_height;
> +		int slice_height = v_addressable / num_slices[i] + (v_addressable % num_slices[i]);
> +
> +		/* Overwrite DSC slice height */
> +		igt_amd_write_dsc_param_slice_height(data->fd, output->name, slice_height);
> +		igt_plane_set_fb(data->primary[conn_idx], &ref_fb);
> +		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +		igt_info("Forcing slice height: slice height %d num slices vertical %d\n", slice_height, num_slices[i]);
> +
> +		act_slice_height = igt_amd_read_dsc_param_slice_height(data->fd, output->name);
> +
> +		igt_info("Reading slice height: actual slice height %d VS assigned slice height %d\n", act_slice_height, slice_height);
> +
> +		pass = (slice_height == act_slice_height);
> +
> +		if (!pass)
> +			break;
> +	}
> +
> +	igt_amd_write_dsc_param_slice_height(data->fd, output->name, 0);
> +	igt_plane_set_fb(data->primary[conn_idx], &ref_fb);
> +	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +	return pass;
> +}
> +
> +static bool update_slice_width(data_t *data, int h_addressable,
> +					  int *num_slices, igt_output_t *output, int conn_idx, igt_fb_t ref_fb)
> +{
> +	int i;
> +	bool pass = true;
> +
> +	for(i = 0; i < NUM_SLICE_SLOTS; i++) {
> +		int act_slice_width;
> +		int slice_width = h_addressable / num_slices[i] + (h_addressable % num_slices[i]);
> +
> +		/* Overwrite DSC slice width */
> +		igt_amd_write_dsc_param_slice_width(data->fd, output->name, slice_width);
> +		igt_plane_set_fb(data->primary[conn_idx], &ref_fb);
> +		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +		igt_info("Forcing slice width: slice width %d num slices horisontal %d\n", slice_width, num_slices[i]);
> +
> +		act_slice_width = igt_amd_read_dsc_param_slice_width(data->fd, output->name);
> +
> +		igt_info("Reading slice width: actual slice width %d VS assigned slice width %d\n", act_slice_width, slice_width);
> +
> +		pass = (slice_width == act_slice_width);
> +
> +		if (!pass)
> +			break;
> +	}
> +
> +	igt_amd_write_dsc_param_slice_width(data->fd, output->name, 0);
> +	igt_plane_set_fb(data->primary[conn_idx], &ref_fb);
> +	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +	return pass;
> +}
> +
> +static void test_dsc_slice_dimensions_change(data_t *data)
> +{
> +	bool dsc_on, dsc_after, dsc_before;
> +	igt_output_t *output;
> +	igt_display_t *display = &data->display;
> +	igt_fb_t ref_fb;
> +	int num_slices [] = { 1, 2, 4, 8 };
> +	int h_addressable, v_addressable;
> +	bool ret_slice_height= false, ret_slice_width = false;
> +	int i, test_conn_cnt = 0;
> +
> +	test_init(data);
> +	igt_enable_connectors(data->fd);
> +
> +	for (i = 0; i < display->n_pipes; i++) {
> +		/* Setup the output */
> +		output = data->output[i];
> +		if (!output || !igt_output_is_connected(output))
> +			continue;
> +
> +		igt_create_pattern_fb(data->fd,
> +					data->mode[i].hdisplay,
> +					data->mode[i].vdisplay,
> +					DRM_FORMAT_XRGB8888,
> +					0,
> +					&ref_fb);
> +		igt_output_set_pipe(output, data->pipe_id[i]);
> +		igt_plane_set_fb(data->primary[i], &ref_fb);
> +		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
> +
> +		test_conn_cnt++;
> +
> +		h_addressable = data->mode->hdisplay;
> +		v_addressable = data->mode->vdisplay;
> +
> +		igt_info("Mode info: v_ative %d  h_active %d\n", v_addressable, h_addressable);
> +
> +		/* Save pipe's initial DSC state */
> +		dsc_before = igt_amd_read_dsc_clock_status(data->fd, output->name);
> +
> +		/* Force enable DSC */
> +		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_FORCE_ON);
> +
> +		igt_plane_set_fb(data->primary[i], &ref_fb);
> +		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +		/* Check if DSC is enabled */
> +		dsc_on = igt_amd_read_dsc_clock_status(data->fd, output->name) == 1;
> +
> +		if (dsc_on) {
> +			ret_slice_height = update_slice_height(data, v_addressable, num_slices, output, i, ref_fb);
> +			ret_slice_width = update_slice_width(data, h_addressable, num_slices, output, i, ref_fb);
> +		}
> +
> +		/* Force disable DSC */
> +		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_FORCE_OFF);
> +
> +		igt_plane_set_fb(data->primary[i], &ref_fb);
> +		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +		dsc_after = igt_amd_read_dsc_clock_status(data->fd, output->name);
> +
> +		/* Revert DSC back to automatic mechanism by disabling state overwrites*/
> +		igt_plane_set_fb(data->primary[i], &ref_fb);
> +
> +		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_AUTOMATIC);
> +
> +		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +		igt_assert_f(dsc_on, "Enabling DSC on pipe failed.\n");
> +		igt_assert_f(ret_slice_height, "Changing slice height failed.\n");
> +		igt_assert_f(ret_slice_width, "Changing slice width failed.\n");
> +		igt_assert_f(dsc_after == dsc_before, "Reverting DSC to initial state failed.\n");
> +
> +		/* Cleanup fb */
> +		igt_remove_fb(data->fd, &ref_fb);
> +	}
> +
> +	test_fini(data);
> +	igt_skip_on(test_conn_cnt == 0);
> +}
> +
> +static void test_dsc_link_settings(data_t *data)
> +{
> +	igt_output_t *output;
> +	igt_fb_t ref_fb[MAX_PIPES];
> +	igt_crc_t ref_crc[MAX_PIPES], new_crc[MAX_PIPES];
> +    int lane_count[4], link_rate[4], link_spread[4];
> +	igt_display_t *display = &data->display;
> +	int i, lc, lr;
> +    bool dsc_on;
> +	const enum dc_lane_count lane_count_vals[] =
> +	{
> +		LANE_COUNT_TWO,
> +		LANE_COUNT_FOUR
> +	};
> +	const enum dc_link_rate link_rate_vals[] =
> +	{
> +		LINK_RATE_LOW,
> +		LINK_RATE_HIGH,
> +		LINK_RATE_HIGH2,
> +		LINK_RATE_HIGH3
> +	};
> +
> +    test_init(data);
> +
> +    /* Setup all outputs */
> +	for (i = 0; i < display->n_pipes; i++) {
> +		output = data->output[i];
> +		if (!output || !igt_output_is_connected(output))
> +			continue;
> +
> +        igt_create_pattern_fb(data->fd,
> +                    data->mode[i].hdisplay,
> +                    data->mode[i].vdisplay,
> +                    DRM_FORMAT_XRGB8888,
> +                    0,
> +                    &ref_fb[i]);
> +		igt_output_set_pipe(output, data->pipe_id[i]);
> +		igt_plane_set_fb(data->primary[i], &ref_fb[i]);
> +	}
> +	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
> +
> +    /* Collect reference CRCs */
> +	for (i = 0; i < display->n_pipes; i++) {
> +		output = data->output[i];
> +		if (!output || !igt_output_is_connected(output))
> +			continue;
> +
> +		igt_pipe_crc_collect_crc(data->pipe_crc[i], &ref_crc[i]);
> +	}
> +
> +	for (lc = 0; lc < ARRAY_SIZE(lane_count_vals); lc++) {
> +		for (lr = 0; lr < ARRAY_SIZE(link_rate_vals); lr++) {
> +			/* Write new link_settings */
> +			for (i = 0; i < display->n_pipes; i++) {
> +				output = data->output[i];
> +				if (!output || !igt_output_is_connected(output))
> +					continue;
> +
> +				/* Write lower link settings */
> +				igt_info("Applying lane count: %d, link rate 0x%02x, on default training\n",
> +						lane_count_vals[lc], link_rate_vals[lr]);
> +				igt_amd_write_link_settings(data->fd, output->name,
> +							lane_count_vals[lc],
> +							link_rate_vals[lr],
> +							LINK_TRAINING_DEFAULT);
> +				usleep(500 * MSEC_PER_SEC);
> +			}
> +
> +			/* Trigger commit after writing new link settings */
> +			igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +			for (i = 0; i < display->n_pipes; i++) {
> +				output = data->output[i];
> +				if (!output || !igt_output_is_connected(output))
> +					continue;
> +
> +				/* Verify lower link settings */
> +				igt_amd_read_link_settings(data->fd, output->name,
> +							lane_count,
> +							link_rate,
> +							link_spread);
> +
> +				igt_assert_f(lane_count[0] == lane_count_vals[lc], "Lowering lane count settings failed\n");
> +				igt_assert_f(link_rate[0] == link_rate_vals[lr], "Lowering link rate settings failed\n");
> +
> +				/* Log current mode and DSC status */
> +				dsc_on = igt_amd_read_dsc_clock_status(data->fd, output->name) == 1;
> +				igt_info("Current mode is: %dx%d @%dHz -- DSC is: %s\n",
> +							data->mode[i].hdisplay,
> +							data->mode[i].vdisplay,
> +							data->mode[i].vrefresh,
> +							dsc_on ? "ON" : "OFF");
> +
> +				igt_pipe_crc_collect_crc(data->pipe_crc[i], &new_crc[i]);
> +				igt_assert_crc_equal(&ref_crc[i], &new_crc[i]);
> +			}
> +		}
> +	}
> +
> +	/* Cleanup all fbs */
> +	for (i = 0; i < display->n_pipes; i++) {
> +		output = data->output[i];
> +		if (!output || !igt_output_is_connected(output))
> +			continue;
> +		igt_remove_fb(data->fd, &ref_fb[i]);
> +	}
> +
> +    test_fini(data);
> +}
> +
> +/* Returns the current and maximum bpc from the connector debugfs. */
> +static output_bpc_t get_output_bpc(int data_fd, char *connector_name)
> +{
> +	char buf[256];
> +	char *start_loc;
> +	int fd, res;
> +	output_bpc_t info;
> +
> +	fd = igt_debugfs_connector_dir(data_fd, connector_name, O_RDONLY);
> +	igt_assert(fd >= 0);
> +
> +	res = igt_debugfs_simple_read(fd, "output_bpc", buf, sizeof(buf));
> +
> +	igt_require(res > 0);
> +
> +	close(fd);
> +
> +	igt_assert(start_loc = strstr(buf, "Current: "));
> +	igt_assert_eq(sscanf(start_loc, "Current: %u", &info.current), 1);
> +
> +	igt_assert(start_loc = strstr(buf, "Maximum: "));
> +	igt_assert_eq(sscanf(start_loc, "Maximum: %u", &info.maximum), 1);
> +
> +	return info;
> +}
> +
> +/* Verifies that connector has the correct output bpc */
> +static void assert_output_bpc(int data_fd, char *connector_name, unsigned int bpc)
> +{
> +	output_bpc_t info = get_output_bpc(data_fd, connector_name);
> +
> +	igt_require_f(info.maximum >= bpc,
> +		      "Monitor doesn't support %u bpc, max is %u\n", bpc,
> +		      info.maximum);
> +
> +	igt_assert_eq(info.current, bpc);
> +}
> +
> +/* Returns the highest bpc this dispaly supports */
> +static int get_max_supported_bpc(int data_fd, char *connector_name)
> +{
> +	output_bpc_t info = get_output_bpc(data_fd, connector_name);
> +	return info.maximum;
> +}
> +
> +static void test_dsc_bpc(data_t *data)
> +{
> +	igt_output_t *output;
> +	igt_fb_t ref_fb[MAX_PIPES];
> +	igt_crc_t test_crc;
> +	igt_display_t *display = &data->display;
> +	int i, bpc, max_supported_bpc[MAX_PIPES];
> +    bool dsc_on;
> +	const int bpc_vals[] = {12, 10, 8};
> +
> +    test_init(data);
> +
> +	/* Find max supported bpc */
> +	for (i = 0; i < display->n_pipes; i++) {
> +		output = data->output[i];
> +		if (!output || !igt_output_is_connected(output))
> +			continue;
> +		igt_info("Checking bpc support of conn %s\n", output->name);
> +		max_supported_bpc[i] = get_max_supported_bpc(data->fd, output->name);
> +	}
> +
> +    /* Setup all outputs */
> +	for (bpc = 0; bpc < ARRAY_SIZE(bpc_vals); bpc++) {
> +		igt_info("Testing bpc = %d\n", bpc_vals[bpc]);
> +
> +		for (i = 0; i < display->n_pipes; i++) {
> +			output = data->output[i];
> +			if (!output || !igt_output_is_connected(output))
> +				continue;
> +
> +			if (max_supported_bpc[i] < bpc_vals[bpc]) {
> +				igt_info("Display doesn't support bpc of %d, max is %d. Skipping to next bpc value.\n", bpc_vals[bpc], max_supported_bpc[i]);
> +				continue;
> +			}
> +			igt_info("Setting bpc = %d\n", bpc_vals[bpc]);
> +			igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, bpc_vals[bpc]);
> +			igt_create_pattern_fb(data->fd,
> +						data->mode[i].hdisplay,
> +						data->mode[i].vdisplay,
> +						DRM_FORMAT_XRGB8888,
> +						0,
> +						&ref_fb[i]);
> +			igt_output_set_pipe(output, data->pipe_id[i]);
> +			igt_plane_set_fb(data->primary[i], &ref_fb[i]);
> +		}
> +
> +		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
> +
> +		for (i = 0; i < display->n_pipes; i++) {
> +			output = data->output[i];
> +			if (!output || !igt_output_is_connected(output))
> +				continue;
> +
> +			if (max_supported_bpc[i] < bpc_vals[bpc])
> +				continue;
> +
> +			/* Check that crc is non-zero */
> +			igt_pipe_crc_collect_crc(data->pipe_crc[i], &test_crc);
> +			igt_assert(test_crc.crc[0] && test_crc.crc[1] && test_crc.crc[2]);
> +
> +			/* Check current bpc */
> +			igt_info("Verifying display %s has correct bpc\n", output->name);
> +			assert_output_bpc(data->fd, output->name, bpc_vals[bpc]);
> +
> +			/* Log current mode and DSC status */
> +			dsc_on = igt_amd_read_dsc_clock_status(data->fd, output->name) == 1;
> +			igt_info("Current mode is: %dx%d @%dHz -- DSC is: %s\n",
> +						data->mode[i].hdisplay,
> +						data->mode[i].vdisplay,
> +						data->mode[i].vrefresh,
> +						dsc_on ? "ON" : "OFF");
> +		}
> +
> +		/* Cleanup all fbs */
> +		for (i = 0; i < display->n_pipes; i++) {
> +			output = data->output[i];
> +			if (!output || !igt_output_is_connected(output))
> +				continue;
> +
> +			if (max_supported_bpc[i] < bpc_vals[bpc])
> +				continue;
> +
> +			igt_remove_fb(data->fd, &ref_fb[i]);
> +		}
> +	}
> +
> +    test_fini(data);
> +}
> +
> +igt_main
> +{
> +	data_t data = { 0 };
> +
> +	igt_skip_on_simulation();
> +
> +	igt_fixture
> +	{
> +		data.fd = drm_open_driver_master(DRIVER_ANY);
> +
> +		igt_display_require(&data.display, data.fd);
> +		igt_require(data.display.is_atomic);
> +		igt_display_require_output(&data.display);
> +
> +		igt_amd_require_dsc(&data.display, data.fd);
> +		kmstest_set_vt_graphics_mode();
> +	}
> +
> +	igt_describe("Forces DSC on/off & ensures it is reset properly");
> +	igt_subtest("dsc-enable-basic")
> +		    test_dsc_enable(&data);
> +
> +	igt_describe("Tests DSC slice height property & ensures it is reset properly on DSC enable/disable");
> +	igt_subtest("dsc-slice-height-property")
> +		    test_dsc_slice_height_property(&data);
> +
> +	igt_describe("Tests various DSC slice dimensions");
> +	igt_subtest("dsc-slice-dimensions-change")
> +		    test_dsc_slice_dimensions_change(&data);
> +
> +	igt_describe("Tests various combinations of link_rate + lane_count and logs if DSC enabled/disabled");
> +	igt_subtest("dsc-link-settings")
> +		    test_dsc_link_settings(&data);
> +
> +	igt_describe("Tests different bpc settings and logs if DSC is enabled/disabled");
> +	igt_subtest("dsc-bpc")
> +			test_dsc_bpc(&data);
> +
> +	igt_fixture
> +	{
> +		igt_reset_connectors();
> +		igt_display_fini(&data.display);
> +	}
> +}
> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
> index b736c456..001e37ef 100644
> --- a/tests/amdgpu/meson.build
> +++ b/tests/amdgpu/meson.build
> @@ -16,6 +16,7 @@ if libdrm_amdgpu.found()
>   			  'amd_mem_leak',
>   			  'amd_link_settings',
>   			  'amd_vrr_range',
> +			  'amd_dp_dsc',
>   			]
>   	amdgpu_deps += libdrm_amdgpu
>   endif
> 
