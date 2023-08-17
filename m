Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C351110E53B
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Aug 2023 18:01:21 +0000 (UTC)
Message-ID: <8976235d-8621-cc5d-5f31-76feabb7fcca@intel.com>
Date: Thu, 17 Aug 2023 23:29:56 +0530
Content-Language: en-US
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230718215950.2557-1-mohammed.thasleem@intel.com>
 <20230817165432.12942-1-mohammed.thasleem@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230817165432.12942-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v4] tests/kms_atomic_transition: Lower
 drm log level to avoid exceeding disk usage limit
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

Hi Thasleem,

On Thu-17-08-2023 10:24 pm, Mohammed Thasleem wrote:
> Set drm debug log level for DP messages and DRIVER messages to fix
> exceeding disk usage limit in modeset-transition test cases.
> 
> v2: -Rename DEBUG_LEVEL to DRM_DEBUG_LEVEL.
>      -Declared log level globally.
>      -Added check for checking default log level before update.
> v3: -Close sysfs_fd.
> v4: -Close sysfs_fd with close() call.
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   tests/kms_atomic_transition.c | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index a470eb88c..a83449e5c 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -27,9 +27,11 @@
>    */
>   #include "igt.h"
>   #include "igt_rand.h"
> +#include "igt_sysfs.h"
>   #include "drmtest.h"
>   #include "sw_sync.h"
>   #include <errno.h>
> +#include <fcntl.h>
>   #include <pthread.h>
>   #include <stdbool.h>
>   #include <stdio.h>
> @@ -44,13 +46,17 @@
>   #define DRM_CAP_CURSOR_HEIGHT 0x9
>   #endif
>   
> +#define DRM_DEBUG_LEVEL "/sys/module/drm/parameters/"

This could be drm_debug_root/dir or something to opt, not a level.

> +#define LOG_LEVEL 0xa

This might be the DRM_DEBUG_LEVEL

> +
>   struct plane_parms {
>   	struct igt_fb *fb;
>   	uint32_t width, height, mask;
>   };
>   
>   typedef struct {
> -	int drm_fd;
> +	int drm_fd, sysfs_fd;
> +	uint32_t old_drm_log_level;
>   	struct igt_fb fbs[2], argb_fb, sprite_fb;
>   	igt_display_t display;
>   	bool extended;
> @@ -1065,6 +1071,9 @@ static void run_modeset_transition(data_t *data, int requested_outputs, bool non
>   	int num_outputs = 0;
>   	enum pipe pipe;
>   
> +	if (data->old_drm_log_level > LOG_LEVEL)
> +		igt_sysfs_set_u32(data->sysfs_fd, "debug", LOG_LEVEL);
> +
>   	for_each_pipe(&data->display, pipe) {
>   		igt_output_t *output;
>   
> @@ -1207,6 +1216,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   		igt_display_require_output(&data.display);
>   
> +		igt_require((data.sysfs_fd = open(DRM_DEBUG_LEVEL, O_RDONLY)) >= 0);

Why open system call? we have enough helpers available in IGT library to 
read the sysfs. No need to re-invent the wheel.

> +		data.old_drm_log_level = igt_sysfs_get_u32(data.sysfs_fd, "debug");
> +
>   		for_each_connected_output(&data.display, output)
>   			count++;
>   	}
> @@ -1281,7 +1293,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   	}
>   
>   	igt_fixture {
> +		igt_sysfs_set_u32(data.sysfs_fd, "debug", data.old_drm_log_level);

What happens if test skips without initializing old_drm_log_level?

Ex:
On Headless configs, igt_display_require_output() will send the skip.

>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.drm_fd);
> +		close(data.sysfs_fd);

Please close the sysfs before closing the driver.

- Bhanu

>   	}
>   }
