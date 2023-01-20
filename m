Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A7210E064
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Jan 2023 14:51:08 +0000 (UTC)
Date: Fri, 20 Jan 2023 16:47:58 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Message-ID: <Y8qpngjAz2oYS76B@platvala-desk.ger.corp.intel.com>
References: <20230120144500.29821-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230120144500.29821-1-swati2.sharma@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] Revert VDSC lib changes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jan 20, 2023 at 08:15:00PM +0530, Swati Sharma wrote:
> This reverts
>     commit 2a611c37bd170763052bf6c17aa2d48cf09a63c1
>     commit 65202cbc6109f17cf786a95947f4ee9223aec6b8
>     commit b6984b946ba66f6bb0452b223fe188429ddeab34
>     commit bbc2a5ceadb656552c5bcf95a19ce2b292a78128
> 
> Series broke git pipeline, revert above commits.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

The ultimate root cause is gitlab CI using Debian buster and thus
libdrm 2.4.97. Until that's changed (soon) #include <stddef.h> and
maybe some others need to be liberally applied all around.

Thanks for the quick revert.

Acked-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  lib/igt.h                   |   1 -
>  lib/igt_dsc.c               | 133 ----------------------------------
>  lib/igt_dsc.h               |  19 -----
>  lib/igt_kms.c               | 127 +++++++++++++++++++++++++++++++++
>  lib/igt_kms.h               |  10 +++
>  lib/meson.build             |   1 -
>  tests/i915/kms_dsc.c        | 137 ++++++++++++++++++++++++++++++++----
>  tests/i915/kms_dsc_helper.c |  99 --------------------------
>  tests/i915/kms_dsc_helper.h |  35 ---------
>  tests/meson.build           |   9 +--
>  10 files changed, 263 insertions(+), 308 deletions(-)
>  delete mode 100644 lib/igt_dsc.c
>  delete mode 100644 lib/igt_dsc.h
>  delete mode 100644 tests/i915/kms_dsc_helper.c
>  delete mode 100644 tests/i915/kms_dsc_helper.h
> 
> diff --git a/lib/igt.h b/lib/igt.h
> index 73b6f7727..88938109e 100644
> --- a/lib/igt.h
> +++ b/lib/igt.h
> @@ -40,7 +40,6 @@
>  #include "igt_pipe_crc.h"
>  #include "igt_pm.h"
>  #include "igt_stats.h"
> -#include "igt_dsc.h"
>  #ifdef HAVE_CHAMELIUM
>  #include "igt_alsa.h"
>  #include "igt_audio.h"
> diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c
> deleted file mode 100644
> index 25dcb5840..000000000
> --- a/lib/igt_dsc.c
> +++ /dev/null
> @@ -1,133 +0,0 @@
> -/* SPDX-License-Identifier: MIT */
> -/*
> - * Copyright © 2023 Intel Corporation
> - */
> -
> -#include <unistd.h>
> -#include <fcntl.h>
> -#include <string.h>
> -#include "igt_dsc.h"
> -#include "igt_sysfs.h"
> -
> -static bool check_dsc_debugfs(int drmfd, char *connector_name, const char *check_str)
> -{
> -	char file_name[128] = {0};
> -	char buf[512];
> -
> -	sprintf(file_name, "%s/i915_dsc_fec_support", connector_name);
> -
> -	igt_debugfs_read(drmfd, file_name, buf);
> -
> -	return strstr(buf, check_str);
> -}
> -
> -static int write_dsc_debugfs(int drmfd, char *connector_name, const char *file_name,
> -			     const char *write_buf)
> -{
> -	int debugfs_fd = igt_debugfs_dir(drmfd);
> -	int len = strlen(write_buf);
> -	int ret;
> -	char file_path[128] = {0};
> -
> -	sprintf(file_path, "%s/%s", connector_name, file_name);
> -
> -	ret = igt_sysfs_write(debugfs_fd, file_path, write_buf, len);
> -
> -	close(debugfs_fd);
> -
> -	return ret;
> -}
> -
> -/*
> - * igt_is_dsc_supported:
> - * @drmfd: A drm file descriptor
> - * @connector_name: Name of the libdrm connector we're going to use
> - *
> - * Returns: True if DSC is supported for the given connector, false otherwise.
> - */
> -bool igt_is_dsc_supported(int drmfd, char *connector_name)
> -{
> -	return check_dsc_debugfs(drmfd, connector_name, "DSC_Sink_Support: yes");
> -}
> -
> -/*
> - * igt_is_fec_supported:
> - * @drmfd: A drm file descriptor
> - * @connector_name: Name of the libdrm connector we're going to use
> - *
> - * Returns: True if FEC is supported for the given connector, false otherwise.
> - */
> -bool igt_is_fec_supported(int drmfd, char *connector_name)
> -{
> -	return check_dsc_debugfs(drmfd, connector_name, "FEC_Sink_Support: yes");
> -}
> -
> -/*
> - * igt_is_dsc_enabled:
> - * @drmfd: A drm file descriptor
> - * @connector_name: Name of the libdrm connector we're going to use
> - *
> - * Returns: True if DSC is enabled for the given connector, false otherwise.
> - */
> -bool igt_is_dsc_enabled(int drmfd, char *connector_name)
> -{
> -	return check_dsc_debugfs(drmfd, connector_name, "DSC_Enabled: yes");
> -}
> -
> -/*
> - * igt_is_force_dsc_enabled:
> - * @drmfd: A drm file descriptor
> - * @connector_name: Name of the libdrm connector we're going to use
> - *
> - * Returns: True if DSC is force enabled (via debugfs) for the given connector,
> - * false otherwise.
> - */
> -bool igt_is_force_dsc_enabled(int drmfd, char *connector_name)
> -{
> -	return check_dsc_debugfs(drmfd, connector_name, "Force_DSC_Enable: yes");
> -}
> -
> -/*
> - * igt_force_dsc_enable:
> - * @drmfd: A drm file descriptor
> - * @connector_name: Name of the libdrm connector we're going to use
> - *
> - * Returns: 1 on success or negative error code, in case of failure.
> - */
> -int igt_force_dsc_enable(int drmfd, char *connector_name)
> -{
> -	return write_dsc_debugfs(drmfd, connector_name, "i915_dsc_fec_support", "1");
> -}
> -
> -/*
> - * igt_force_dsc_enable_bpc:
> - * @drmfd: A drm file descriptor
> - * @connector_name: Name of the libdrm connector we're going to use
> - * @bpc: Input BPC
> - *
> - * Returns: No. of bytes written or negative error code, in case of failure.
> - */
> -int igt_force_dsc_enable_bpc(int drmfd, char *connector_name, int bpc)
> -{
> -	char buf[20] = {0};
> -
> -	sprintf(buf, "%d", bpc);
> -
> -	return write_dsc_debugfs(drmfd, connector_name, "i915_dsc_bpc", buf);
> -}
> -
> -/*
> - * igt_get_dsc_debugfs_fd:
> - * @drmfd: A drm file descriptor
> - * @connector_name: Name of the libdrm connector we're going to use
> - *
> - * Returns: fd of the DSC debugfs for the given connector, else returns -1.
> - */
> -int igt_get_dsc_debugfs_fd(int drmfd, char *connector_name)
> -{
> -	char file_name[128] = {0};
> -
> -	sprintf(file_name, "%s/i915_dsc_fec_support", connector_name);
> -
> -	return openat(igt_debugfs_dir(drmfd), file_name, O_WRONLY);
> -}
> diff --git a/lib/igt_dsc.h b/lib/igt_dsc.h
> deleted file mode 100644
> index 291c2cdea..000000000
> --- a/lib/igt_dsc.h
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -/* SPDX-License-Identifier: MIT */
> -/*
> - * Copyright © 2023 Intel Corporation
> - */
> -
> -#ifndef IGT_DSC_H
> -#define IGT_DSC_H
> -
> -#include "igt_fb.h"
> -
> -bool igt_is_dsc_supported(int drmfd, char *connector_name);
> -bool igt_is_fec_supported(int drmfd, char *connector_name);
> -bool igt_is_dsc_enabled(int drmfd, char *connector_name);
> -bool igt_is_force_dsc_enabled(int drmfd, char *connector_name);
> -int igt_force_dsc_enable(int drmfd, char *connector_name);
> -int igt_force_dsc_enable_bpc(int drmfd, char *connector_name, int bpc);
> -int igt_get_dsc_debugfs_fd(int drmfd, char *connector_name);
> -
> -#endif
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 31e6dfda0..b4a98ae17 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -5564,6 +5564,133 @@ void igt_dump_crtcs_fd(int drmfd)
>  	drmModeFreeResources(mode_resources);
>  }
>  
> +static
> +bool check_dsc_debugfs(int drmfd, char *connector_name,
> +		       const char *check_str)
> +{
> +	char file_name[128] = {0};
> +	char buf[512];
> +
> +	sprintf(file_name, "%s/i915_dsc_fec_support", connector_name);
> +
> +	igt_debugfs_read(drmfd, file_name, buf);
> +
> +	return strstr(buf, check_str);
> +}
> +
> +static
> +int write_dsc_debugfs(int drmfd, char *connector_name,
> +		      const char *file_name,
> +		      const char *write_buf)
> +{
> +	int debugfs_fd = igt_debugfs_dir(drmfd);
> +	int len = strlen(write_buf);
> +	int ret;
> +	char file_path[128] = {0};
> +
> +	sprintf(file_path, "%s/%s", connector_name, file_name);
> +
> +	ret = igt_sysfs_write(debugfs_fd, file_path, write_buf, len);
> +
> +	close(debugfs_fd);
> +
> +	return ret;
> +}
> +
> +/*
> + * igt_is_dsc_supported:
> + * @drmfd: A drm file descriptor
> + * @connector_name: Name of the libdrm connector we're going to use
> + *
> + * Returns: True if DSC is supported for the given connector, false otherwise.
> + */
> +bool igt_is_dsc_supported(int drmfd, char *connector_name)
> +{
> +	return check_dsc_debugfs(drmfd, connector_name, "DSC_Sink_Support: yes");
> +}
> +
> +/*
> + * igt_is_fec_supported:
> + * @drmfd: A drm file descriptor
> + * @connector_name: Name of the libdrm connector we're going to use
> + *
> + * Returns: True if FEC is supported for the given connector, false otherwise.
> + */
> +bool igt_is_fec_supported(int drmfd, char *connector_name)
> +{
> +	return check_dsc_debugfs(drmfd, connector_name, "FEC_Sink_Support: yes");
> +}
> +
> +/*
> + * igt_is_dsc_enabled:
> + * @drmfd: A drm file descriptor
> + * @connector_name: Name of the libdrm connector we're going to use
> + *
> + * Returns: True if DSC is enabled for the given connector, false otherwise.
> + */
> +bool igt_is_dsc_enabled(int drmfd, char *connector_name)
> +{
> +	return check_dsc_debugfs(drmfd, connector_name, "DSC_Enabled: yes");
> +}
> +
> +/*
> + * igt_is_force_dsc_enabled:
> + * @drmfd: A drm file descriptor
> + * @connector_name: Name of the libdrm connector we're going to use
> + *
> + * Returns: True if DSC is force enabled (via debugfs) for the given connector,
> + * false otherwise.
> + */
> +bool igt_is_force_dsc_enabled(int drmfd, char *connector_name)
> +{
> +	return check_dsc_debugfs(drmfd, connector_name, "Force_DSC_Enable: yes");
> +}
> +
> +/*
> + * igt_force_dsc_enable:
> + * @drmfd: A drm file descriptor
> + * @connector_name: Name of the libdrm connector we're going to use
> + *
> + * Returns: 1 on success or negative error code, in case of failure.
> + */
> +int igt_force_dsc_enable(int drmfd, char *connector_name)
> +{
> +	return write_dsc_debugfs(drmfd, connector_name, "i915_dsc_fec_support", "1");
> +}
> +
> +/*
> + * igt_force_dsc_enable_bpc:
> + * @drmfd: A drm file descriptor
> + * @connector_name: Name of the libdrm connector we're going to use
> + * @bpc: Input BPC
> + *
> + * Returns: No. of bytes written or negative error code, in case of failure.
> + */
> +int igt_force_dsc_enable_bpc(int drmfd, char *connector_name, int bpc)
> +{
> +	char buf[20] = {0};
> +
> +	sprintf(buf, "%d", bpc);
> +
> +	return write_dsc_debugfs(drmfd, connector_name, "i915_dsc_bpc", buf);
> +}
> +
> +/*
> + * igt_get_dsc_debugfs_fd:
> + * @drmfd: A drm file descriptor
> + * @connector_name: Name of the libdrm connector we're going to use
> + *
> + * Returns: fd of the DSC debugfs for the given connector, else returns -1.
> + */
> +int igt_get_dsc_debugfs_fd(int drmfd, char *connector_name)
> +{
> +	char file_name[128] = {0};
> +
> +	sprintf(file_name, "%s/i915_dsc_fec_support", connector_name);
> +
> +	return openat(igt_debugfs_dir(drmfd), file_name, O_WRONLY);
> +}
> +
>  /*
>   * igt_get_output_max_bpc:
>   * @drmfd: A drm file descriptor
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index be5482e08..7a00d2045 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -974,6 +974,16 @@ void igt_require_pipe(igt_display_t *display,
>  void igt_dump_connectors_fd(int drmfd);
>  void igt_dump_crtcs_fd(int drmfd);
>  bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display);
> +
> +bool igt_is_dsc_supported(int drmfd, char *connector_name);
> +bool igt_is_fec_supported(int drmfd, char *connector_name);
> +bool igt_is_dsc_enabled(int drmfd, char *connector_name);
> +bool igt_is_force_dsc_enabled(int drmfd, char *connector_name);
> +int igt_force_dsc_enable(int drmfd, char *connector_name);
> +int igt_force_dsc_enable_bpc(int drmfd, char *connector_name,
> +			     int bpc);
> +int igt_get_dsc_debugfs_fd(int drmfd, char *connector_name);
> +
>  unsigned int igt_get_output_max_bpc(int drmfd, char *connector_name);
>  unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe);
>  void igt_assert_output_bpc_equal(int drmfd, enum pipe pipe,
> diff --git a/lib/meson.build b/lib/meson.build
> index 4e5b08bcd..cc7846869 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -96,7 +96,6 @@ lib_sources = [
>  	'igt_infoframe.c',
>  	'veboxcopy_gen12.c',
>  	'igt_msm.c',
> -	'igt_dsc.c',
>  ]
>  
>  lib_deps = [
> diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
> index 8f32ae950..330fc050b 100644
> --- a/tests/i915/kms_dsc.c
> +++ b/tests/i915/kms_dsc.c
> @@ -29,8 +29,22 @@
>   * Manasi Navare <manasi.d.navare@intel.com>
>   *
>   */
> -
> -#include "kms_dsc_helper.h"
> +#include "igt.h"
> +#include "igt_sysfs.h"
> +#include <errno.h>
> +#include <getopt.h>
> +#include <math.h>
> +#include <stdint.h>
> +#include <stdbool.h>
> +#include <strings.h>
> +#include <unistd.h>
> +#include <stdlib.h>
> +#include <signal.h>
> +#include <time.h>
> +#include <fcntl.h>
> +#include <termios.h>
> +
> +#define HDISPLAY_5K	5120
>  
>  IGT_TEST_DESCRIPTION("Test to validate display stream compression");
>  
> @@ -47,10 +61,12 @@ typedef struct {
>  	igt_output_t *output;
>  	int input_bpc;
>  	int n_pipes;
> -	int disp_ver;
>  	enum pipe pipe;
>  } data_t;
>  
> +bool force_dsc_en_orig;
> +int force_dsc_restore_fd = -1;
> +
>  const struct {
>  	const int format;
>  	const char format_str[20];
> @@ -68,6 +84,56 @@ static inline void manual(const char *expected)
>  	igt_debug_interactive_mode_check("all", expected);
>  }
>  
> +static void force_dsc_enable(data_t *data)
> +{
> +	int ret;
> +
> +	igt_debug("Forcing DSC enable on %s\n", data->output->name);
> +	ret = igt_force_dsc_enable(data->drm_fd,
> +				   data->output->name);
> +	igt_assert_f(ret > 0, "debugfs_write failed");
> +}
> +
> +static void force_dsc_enable_bpc(data_t *data)
> +{
> +	int ret;
> +
> +	igt_debug("Forcing input DSC BPC to %d on %s\n",
> +		  data->input_bpc, data->output->name);
> +	ret = igt_force_dsc_enable_bpc(data->drm_fd,
> +				       data->output->name,
> +				       data->input_bpc);
> +	igt_assert_f(ret > 0, "debugfs_write failed");
> +}
> +
> +static void save_force_dsc_en(data_t *data)
> +{
> +	force_dsc_en_orig =
> +		igt_is_force_dsc_enabled(data->drm_fd,
> +					 data->output->name);
> +	force_dsc_restore_fd =
> +		igt_get_dsc_debugfs_fd(data->drm_fd,
> +				       data->output->name);
> +	igt_assert(force_dsc_restore_fd >= 0);
> +}
> +
> +static void restore_force_dsc_en(void)
> +{
> +	if (force_dsc_restore_fd < 0)
> +		return;
> +
> +	igt_debug("Restoring DSC enable\n");
> +	igt_assert(write(force_dsc_restore_fd, force_dsc_en_orig ? "1" : "0", 1) == 1);
> +
> +	close(force_dsc_restore_fd);
> +	force_dsc_restore_fd = -1;
> +}
> +
> +static void kms_dsc_exit_handler(int sig)
> +{
> +	restore_force_dsc_en();
> +}
> +
>  static drmModeModeInfo *get_highres_mode(igt_output_t *output)
>  {
>  	drmModeConnector *connector = output->config.connector;
> @@ -80,6 +146,26 @@ static drmModeModeInfo *get_highres_mode(igt_output_t *output)
>  	return highest_mode;
>  }
>  
> +static bool check_dsc_on_connector(data_t *data)
> +{
> +	igt_output_t *output = data->output;
> +
> +	if (!igt_is_dsc_supported(data->drm_fd, output->name)) {
> +		igt_debug("DSC not supported on connector %s\n",
> +			  output->name);
> +		return false;
> +	}
> +
> +	if (!output_is_internal_panel(output) &&
> +	    !igt_is_fec_supported(data->drm_fd, output->name)) {
> +		igt_debug("DSC cannot be enabled without FEC on %s\n",
> +			  output->name);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>  static bool check_big_joiner_pipe_constraint(data_t *data)
>  {
>  	igt_output_t *output = data->output;
> @@ -95,6 +181,34 @@ static bool check_big_joiner_pipe_constraint(data_t *data)
>  	return true;
>  }
>  
> +static bool check_gen11_dp_constraint(data_t *data)
> +{
> +	igt_output_t *output = data->output;
> +	uint32_t devid = intel_get_drm_devid(data->drm_fd);
> +	drmModeConnector *connector = output->config.connector;
> +
> +	if ((connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) &&
> +	    (data->pipe == PIPE_A) && IS_GEN11(devid)) {
> +		igt_debug("DSC not supported on pipe A on external DP in gen11 platforms\n");
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +/* Max DSC Input BPC for ICL is 10 and for TGL+ is 12 */
> +static bool check_gen11_bpc_constraint(data_t *data)
> +{
> +	uint32_t devid = intel_get_drm_devid(data->drm_fd);
> +
> +	if (IS_GEN11(devid) && data->input_bpc == 12) {
> +		igt_debug("Input bpc 12 not supported on gen11 platforms\n");
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>  static void test_cleanup(data_t *data)
>  {
>  	igt_output_t *output = data->output;
> @@ -121,12 +235,12 @@ static void update_display(data_t *data, enum dsc_test_type test_type, unsigned
>  	igt_display_commit(display);
>  
>  	igt_debug("DSC is supported on %s\n", data->output->name);
> -	save_force_dsc_en(data->drm_fd, data->output);
> -	force_dsc_enable(data->drm_fd, data->output);
> +	save_force_dsc_en(data);
> +	force_dsc_enable(data);
>  
>  	if (test_type == TEST_DSC_BPC) {
>  		igt_debug("Trying to set input BPC to %d\n", data->input_bpc);
> -		force_dsc_enable_bpc(data->drm_fd, data->output, data->input_bpc);
> +		force_dsc_enable_bpc(data);
>  	}
>  
>  	igt_output_set_pipe(output, data->pipe);
> @@ -165,7 +279,7 @@ static void update_display(data_t *data, enum dsc_test_type test_type, unsigned
>  	restore_force_dsc_en();
>  	igt_debug("Reset compression BPC\n");
>  	data->input_bpc = 0;
> -	force_dsc_enable_bpc(data->drm_fd, data->output, data->input_bpc);
> +	force_dsc_enable_bpc(data);
>  
>  	igt_assert_f(enabled,
>  		     "Default DSC enable failed on connector: %s pipe: %s\n",
> @@ -188,13 +302,13 @@ static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpc,
>  		data->output = output;
>  		data->pipe = pipe;
>  
> -		if (!check_dsc_on_connector(data->drm_fd, data->output))
> +		if (!check_dsc_on_connector(data))
>  			continue;
>  
> -		if (!check_gen11_dp_constraint(data->drm_fd, data->output, data->pipe))
> +		if (!check_gen11_dp_constraint(data))
>  			continue;
>  
> -		if (!check_gen11_bpc_constraint(data->drm_fd, data->output, data->input_bpc))
> +		if (!check_gen11_bpc_constraint(data))
>  			continue;
>  
>  		if (!check_big_joiner_pipe_constraint(data))
> @@ -218,12 +332,11 @@ igt_main
>  	igt_fixture {
>  		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
>  		data.devid = intel_get_drm_devid(data.drm_fd);
> -		data.disp_ver = intel_display_ver(data.devid);
>  		kmstest_set_vt_graphics_mode();
>  		igt_install_exit_handler(kms_dsc_exit_handler);
>  		igt_display_require(&data.display, data.drm_fd);
>  		igt_display_require_output(&data.display);
> -		igt_require(data.disp_ver >= 11);
> +		igt_require(intel_display_ver(data.devid) >= 11);
>  		data.n_pipes = 0;
>  		for_each_pipe(&data.display, i)
>  			data.n_pipes++;
> diff --git a/tests/i915/kms_dsc_helper.c b/tests/i915/kms_dsc_helper.c
> deleted file mode 100644
> index a80f3d787..000000000
> --- a/tests/i915/kms_dsc_helper.c
> +++ /dev/null
> @@ -1,99 +0,0 @@
> -/* SPDX-License-Identifier: MIT */
> -/*
> - * Copyright © 2023 Intel Corporation
> - */
> -
> -#include "kms_dsc_helper.h"
> -
> -static bool force_dsc_en_orig;
> -static int force_dsc_restore_fd = -1;
> -
> -void force_dsc_enable(int drmfd, igt_output_t *output)
> -{
> -	int ret;
> -
> -	igt_debug("Forcing DSC enable on %s\n", output->name);
> -	ret = igt_force_dsc_enable(drmfd, output->name);
> -	igt_assert_f(ret > 0, "forcing dsc enable debugfs_write failed\n");
> -}
> -
> -void force_dsc_enable_bpc(int drmfd, igt_output_t *output, int input_bpc)
> -{
> -	int ret;
> -
> -	igt_debug("Forcing input DSC BPC to %d on %s\n",
> -		  input_bpc, output->name);
> -	ret = igt_force_dsc_enable_bpc(drmfd, output->name, input_bpc);
> -	igt_assert_f(ret > 0, "forcing input dsc bpc debugfs_write failed\n");
> -}
> -
> -void save_force_dsc_en(int drmfd, igt_output_t *output)
> -{
> -	force_dsc_en_orig =
> -		igt_is_force_dsc_enabled(drmfd, output->name);
> -	force_dsc_restore_fd =
> -		igt_get_dsc_debugfs_fd(drmfd, output->name);
> -	igt_assert(force_dsc_restore_fd >= 0);
> -}
> -
> -void restore_force_dsc_en(void)
> -{
> -	if (force_dsc_restore_fd < 0)
> -		return;
> -
> -	igt_debug("Restoring DSC enable\n");
> -	igt_assert(write(force_dsc_restore_fd, force_dsc_en_orig ? "1" : "0", 1) == 1);
> -
> -	close(force_dsc_restore_fd);
> -	force_dsc_restore_fd = -1;
> -}
> -
> -void kms_dsc_exit_handler(int sig)
> -{
> -	restore_force_dsc_en();
> -}
> -
> -bool check_dsc_on_connector(int drmfd, igt_output_t *output)
> -{
> -	if (!igt_is_dsc_supported(drmfd, output->name)) {
> -		igt_debug("DSC not supported on connector %s\n",
> -			  output->name);
> -		return false;
> -	}
> -
> -	if (!output_is_internal_panel(output) &&
> -	    !igt_is_fec_supported(drmfd, output->name)) {
> -		igt_debug("DSC cannot be enabled without FEC on %s\n",
> -			  output->name);
> -		return false;
> -	}
> -
> -	return true;
> -}
> -
> -bool check_gen11_dp_constraint(int drmfd, igt_output_t *output, enum pipe pipe)
> -{
> -	uint32_t devid = intel_get_drm_devid(drmfd);
> -	drmModeConnector *connector = output->config.connector;
> -
> -	if ((connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) &&
> -	    (pipe == PIPE_A) && IS_GEN11(devid)) {
> -		igt_debug("DSC not supported on pipe A on external DP in gen11 platforms\n");
> -		return false;
> -	}
> -
> -	return true;
> -}
> -
> -/* Max DSC Input BPC for ICL is 10 and for TGL+ is 12 */
> -bool check_gen11_bpc_constraint(int drmfd, igt_output_t *output, int input_bpc)
> -{
> -	uint32_t devid = intel_get_drm_devid(drmfd);
> -
> -	if (IS_GEN11(devid) && input_bpc == 12) {
> -		igt_debug("Input bpc 12 not supported on gen11 platforms\n");
> -		return false;
> -	}
> -
> -	return true;
> -}
> diff --git a/tests/i915/kms_dsc_helper.h b/tests/i915/kms_dsc_helper.h
> deleted file mode 100644
> index fe479dac4..000000000
> --- a/tests/i915/kms_dsc_helper.h
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -/* SPDX-License-Identifier: MIT */
> -/*
> - * Copyright © 2022 Intel Corporation
> - */
> -
> -#ifndef IGT_KMS_DSC_HELPER_H
> -#define IGT_KMS_DSC_HELPER_H
> -
> -#include "igt.h"
> -#include "igt_sysfs.h"
> -#include <errno.h>
> -#include <getopt.h>
> -#include <math.h>
> -#include <stdint.h>
> -#include <stdbool.h>
> -#include <strings.h>
> -#include <unistd.h>
> -#include <stdlib.h>
> -#include <signal.h>
> -#include <time.h>
> -#include <fcntl.h>
> -#include <termios.h>
> -
> -#define HDISPLAY_5K	5120
> -
> -void force_dsc_enable(int drmfd, igt_output_t *output);
> -void force_dsc_enable_bpc(int drmfd, igt_output_t *output, int input_bpc);
> -void save_force_dsc_en(int drmfd, igt_output_t *output);
> -void restore_force_dsc_en(void);
> -void kms_dsc_exit_handler(int sig);
> -bool check_dsc_on_connector(int drmfd, igt_output_t *output);
> -bool check_gen11_dp_constraint(int drmfd, igt_output_t *output, enum pipe pipe);
> -bool check_gen11_bpc_constraint(int drmfd, igt_output_t *output, int input_bpc);
> -
> -#endif
> diff --git a/tests/meson.build b/tests/meson.build
> index d41ed30fa..e20a86403 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -221,6 +221,7 @@ i915_progs = [
>  	'kms_ccs',
>  	'kms_cdclk',
>  	'kms_draw_crc',
> +	'kms_dsc',
>  	'kms_fbcon_fbt',
>  	'kms_fence_pin_leak',
>  	'kms_flip_scaled_crc',
> @@ -427,14 +428,6 @@ test_executables += executable('kms_color',
>  	   install : true)
>  test_list += 'kms_color'
>  
> -test_executables += executable('kms_dsc',
> -	   [ join_paths('i915', 'kms_dsc.c'), join_paths ('i915', 'kms_dsc_helper.c')],
> -	   dependencies : test_deps,
> -	   install_dir : libexecdir,
> -	   install_rpath : libexecdir_rpathdir,
> -	   install : true)
> -test_list += 'kms_dsc'
> -
>  if chamelium.found()
>         test_executables += executable('kms_chamelium_color',
>                               [ 'chamelium/kms_chamelium_color.c', 'kms_color_helper.c' ],
> -- 
> 2.25.1
> 
