Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF76C10E130
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Apr 2023 10:17:42 +0000 (UTC)
Message-ID: <4738852c-ee7a-3bb8-6498-f0ba7d80010f@intel.com>
Date: Fri, 21 Apr 2023 15:47:31 +0530
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230418164501.1687266-1-bhanuprakash.modem@intel.com>
 <20230418164501.1687266-37-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20230418164501.1687266-37-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 36/45] tests/kms_panel_fitting: Add XE support
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

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

On 4/18/2023 10:14 PM, Bhanuprakash Modem wrote:
> Add XE driver support for kms tests.
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_panel_fitting.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
> index 2d0590da2..97ef1ae48 100644
> --- a/tests/kms_panel_fitting.c
> +++ b/tests/kms_panel_fitting.c
> @@ -23,6 +23,7 @@
>    */
>   
>   #include "igt.h"
> +#include <limits.h>
>   #include <math.h>
>   #include <sys/stat.h>
>   
> @@ -133,7 +134,7 @@ test_panel_fitting_legacy(data_t *d, igt_display_t *display,
>   	igt_fb_set_size(&d->fb2, d->plane2, d->fb2.width-200, d->fb2.height-200);
>   	igt_plane_set_position(d->plane2, 100, 100);
>   
> -	if (is_i915_device(display->drm_fd)) {
> +	if (is_intel_device(display->drm_fd)) {
>   		uint32_t devid = intel_get_drm_devid(display->drm_fd);
>   		/*
>   		 * Most of gen7 and all of gen8 doesn't support plane scaling
> @@ -233,10 +234,15 @@ static void test_panel_fitting(data_t *data, enum test_type type)
>   	struct stat sb;
>   
>   	if (type == TEST_ATOMIC) {
> -		igt_require_f(is_i915_device(display->drm_fd), "not valid for non-i915 devices\n");
> +		char path[PATH_MAX];
> +
> +		igt_require_f(is_intel_device(display->drm_fd), "not valid for non-intel devices\n");
>   
>   		/* Until this is force enabled, force modeset evasion. */
> -		if (stat("/sys/module/i915/parameters/fastboot", &sb) == 0)
> +		snprintf(path, PATH_MAX, "/sys/module/%s/parameters/fastboot",
> +					 is_i915_device(data->drm_fd) ? "i915" : "xe");
> +
> +		if (stat(path, &sb) == 0)
>   			igt_set_module_param_int(data->drm_fd, "fastboot", 1);
>   
>   		igt_require(intel_display_ver(intel_get_drm_devid(display->drm_fd)) >= 5);
