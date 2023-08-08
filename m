Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B016410E136
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 12:31:39 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fe4cdb724cso34809625e9.1
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Aug 2023 05:31:39 -0700 (PDT)
Message-ID: <065c3d59-e554-8e6c-401f-858c35a7e33c@gmail.com>
Date: Tue, 8 Aug 2023 15:31:32 +0300
MIME-Version: 1.0
Content-Language: en-US
To: =?UTF-8?Q?Jouni_H=c3=b6gander?= <jouni.hogander@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230808122759.978258-1-jouni.hogander@intel.com>
 <20230808122759.978258-3-jouni.hogander@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20230808122759.978258-3-jouni.hogander@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] Revert
 "tests/i915/kms_frontbuffer_tracking: Split fbc into library"
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Acked-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 8.8.2023 15.27, Jouni Högander wrote:
> This reverts commit 784af2df476fc63504c61919b6eba759c9972be1.
> 
> This patch is missing added intel_fbc.c and intel_fbc.h files.
> 
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
> ---
>   lib/meson.build                       |  1 -
>   tests/i915/kms_frontbuffer_tracking.c | 57 ++++++++++++++++++++++-----
>   2 files changed, 47 insertions(+), 11 deletions(-)
> 
> diff --git a/lib/meson.build b/lib/meson.build
> index 4b5c2f276..ce11c0715 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -12,7 +12,6 @@ lib_sources = [
>   	'i915/gem_mman.c',
>   	'i915/gem_vm.c',
>   	'i915/intel_decode.c',
> -	'i915/intel_fbc.c',
>   	'i915/intel_memory_region.c',
>   	'i915/i915_crc.c',
>   	'igt_collection.c',
> diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
> index ca1aa0515..b2183b08e 100644
> --- a/tests/i915/kms_frontbuffer_tracking.c
> +++ b/tests/i915/kms_frontbuffer_tracking.c
> @@ -32,7 +32,6 @@
>   
>   #include "i915/gem.h"
>   #include "i915/gem_create.h"
> -#include "i915/intel_fbc.h"
>   #include "igt.h"
>   #include "igt_sysfs.h"
>   #include "igt_psr.h"
> @@ -776,6 +775,27 @@ static void __debugfs_read_connector(const char *param, char *buf, int len)
>   #define debugfs_write_crtc(p, arr) __debugfs_write_crtc(p, arr, sizeof(arr))
>   #define debugfs_read_connector(p, arr) __debugfs_read_connector(p, arr, sizeof(arr))
>   
> +static char last_fbc_buf[128];
> +
> +static bool fbc_is_enabled(int lvl)
> +{
> +	char buf[128];
> +	bool print = true;
> +
> +	debugfs_read_crtc("i915_fbc_status", buf);
> +	if (lvl != IGT_LOG_DEBUG)
> +		last_fbc_buf[0] = '\0';
> +	else if (strcmp(last_fbc_buf, buf))
> +		strcpy(last_fbc_buf, buf);
> +	else
> +		print = false;
> +
> +	if (print)
> +		igt_log(IGT_LOG_DOMAIN, lvl, "fbc_is_enabled()?\n%s", buf);
> +
> +	return strstr(buf, "FBC enabled\n");
> +}
> +
>   static void drrs_set(unsigned int val)
>   {
>   	char buf[2];
> @@ -950,11 +970,20 @@ static bool fbc_mode_too_large(void)
>   	return strstr(buf, "FBC disabled: mode too large for compression\n");
>   }
>   
> +static bool fbc_wait_until_enabled(void)
> +{
> +	last_fbc_buf[0] = '\0';
> +
> +	return igt_wait(fbc_is_enabled(IGT_LOG_DEBUG), 2000, 1);
> +}
> +
>   static bool drrs_wait_until_rr_switch_to_low(void)
>   {
>   	return igt_wait(is_drrs_low(), 5000, 1);
>   }
>   
> +#define fbc_enable() igt_set_module_param_int(drm.fd, "enable_fbc", 1)
> +#define fbc_disable() igt_set_module_param_int(drm.fd, "enable_fbc", 0)
>   #define drrs_enable()	drrs_set(1)
>   #define drrs_disable()	drrs_set(0)
>   
> @@ -1159,8 +1188,8 @@ static bool disable_features(const struct test_mode *t)
>   	if (t->feature == FEATURE_DEFAULT)
>   		return false;
>   
> +	fbc_disable();
>   	drrs_disable();
> -	intel_fbc_disable(drm.fd);
>   	return psr.can_test ? psr_disable(drm.fd, drm.debugfs) : false;
>   }
>   
> @@ -1402,9 +1431,20 @@ static void teardown_crcs(void)
>   	igt_pipe_crc_free(pipe_crc);
>   }
>   
> +static bool fbc_supported_on_chipset(void)
> +{
> +	char buf[128];
> +
> +	debugfs_read_crtc("i915_fbc_status", buf);
> +	if (*buf == '\0')
> +		return false;
> +
> +	return !strstr(buf, "FBC unsupported on this chipset\n");
> +}
> +
>   static void setup_fbc(void)
>   {
> -	if (!intel_fbc_supported_on_chipset(drm.fd, prim_mode_params.pipe)) {
> +	if (!fbc_supported_on_chipset()) {
>   		igt_info("Can't test FBC: not supported on this chipset\n");
>   		return;
>   	}
> @@ -1612,18 +1652,15 @@ static void do_status_assertions(int flags)
>   		igt_require(!fbc_not_enough_stolen());
>   		igt_require(!fbc_stride_not_supported());
>   		igt_require(!fbc_mode_too_large());
> -		if (!intel_fbc_wait_until_enabled(drm.fd, prim_mode_params.pipe)) {
> -			igt_assert_f(intel_fbc_is_enabled(drm.fd,
> -						    prim_mode_params.pipe,
> -						    IGT_LOG_WARN),
> +		if (!fbc_wait_until_enabled()) {
> +			igt_assert_f(fbc_is_enabled(IGT_LOG_WARN),
>   				     "FBC disabled\n");
>   		}
>   
>   		if (opt.fbc_check_compression)
>   			igt_assert(fbc_wait_for_compression());
>   	} else if (flags & ASSERT_FBC_DISABLED) {
> -		igt_assert(!intel_fbc_wait_until_enabled(drm.fd,
> -						   prim_mode_params.pipe));
> +		igt_assert(!fbc_wait_until_enabled());
>   	}
>   
>   	if (flags & ASSERT_PSR_ENABLED)
> @@ -1763,7 +1800,7 @@ static bool enable_features_for_test(const struct test_mode *t)
>   		return false;
>   
>   	if (t->feature & FEATURE_FBC)
> -		intel_fbc_enable(drm.fd);
> +		fbc_enable();
>   	if (t->feature & FEATURE_PSR)
>   		ret = psr_enable(drm.fd, drm.debugfs, PSR_MODE_1);
>   	if (t->feature & FEATURE_DRRS)
