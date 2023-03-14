Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22C8F10E776
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Mar 2023 11:15:16 +0000 (UTC)
Date: Tue, 14 Mar 2023 12:15:11 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <20230314111511.qh5ddjfy7ous5k5w@zkempczy-mobl2>
References: <20230314105452.2169208-1-bhanuprakash.modem@intel.com>
 <20230314105452.2169208-3-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230314105452.2169208-3-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t 2/5] i915: s/igt_require_intel/igt_require_i915
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

On Tue, Mar 14, 2023 at 04:24:49PM +0530, Bhanuprakash Modem wrote:
> Update to use the i915 specific helper.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Looks good too:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  lib/i915/gem.c    | 2 +-
>  lib/igt_fb.c      | 6 +++---
>  lib/igt_kms.c     | 2 +-
>  tests/i915/perf.c | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/i915/gem.c b/lib/i915/gem.c
> index 27b872c28..ed45a9ed5 100644
> --- a/lib/i915/gem.c
> +++ b/lib/i915/gem.c
> @@ -140,7 +140,7 @@ void igt_require_gem(int i915)
>  {
>  	int err;
>  
> -	igt_require_intel(i915);
> +	igt_require_i915(i915);
>  
>  	/*
>  	 * We only want to use the throttle-ioctl for its -EIO reporting
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index ed4623139..ba89e1f60 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -442,7 +442,7 @@ void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
>  		*height_ret = 1;
>  		break;
>  	case I915_FORMAT_MOD_X_TILED:
> -		igt_require_intel(fd);
> +		igt_require_i915(fd);
>  		if (intel_display_ver(intel_get_drm_devid(fd)) == 2) {
>  			*width_ret = 128;
>  			*height_ret = 16;
> @@ -460,7 +460,7 @@ void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
>  	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
>  	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
>  	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
> -		igt_require_intel(fd);
> +		igt_require_i915(fd);
>  		if (intel_display_ver(intel_get_drm_devid(fd)) == 2) {
>  			*width_ret = 128;
>  			*height_ret = 16;
> @@ -474,7 +474,7 @@ void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
>  		break;
>  	case I915_FORMAT_MOD_Yf_TILED:
>  	case I915_FORMAT_MOD_Yf_TILED_CCS:
> -		igt_require_intel(fd);
> +		igt_require_i915(fd);
>  		switch (fb_bpp) {
>  		case 8:
>  			*width_ret = 64;
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 8c7dd85b8..84091d5ce 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -1458,7 +1458,7 @@ bool kmstest_force_connector(int drm_fd, drmModeConnector *connector,
>  	 * Forcing DP connectors doesn't currently work, so
>  	 * fail early to allow the test to skip if required.
>  	 */
> -	if (is_i915_device(drm_fd) &&
> +	if (is_intel_device(drm_fd) &&
>  	    connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
>  		return false;
>  
> diff --git a/tests/i915/perf.c b/tests/i915/perf.c
> index 6453354cf..edb922c75 100644
> --- a/tests/i915/perf.c
> +++ b/tests/i915/perf.c
> @@ -4946,7 +4946,7 @@ test_i915_ref_count(void)
>  	igt_debug("baseline ref count (drm fd closed) = %u\n", baseline);
>  
>  	drm_fd = __drm_open_driver(DRIVER_INTEL);
> -	igt_require_intel(drm_fd);
> +	igt_require_i915(drm_fd);
>  	devid = intel_get_drm_devid(drm_fd);
>  	sysfs = perf_sysfs_open(drm_fd);
>  
> -- 
> 2.39.1
> 
