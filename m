Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E643110E15C
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jul 2023 16:20:31 +0000 (UTC)
Date: Tue, 25 Jul 2023 18:20:27 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
Message-ID: <20230725162027.mgyy2mey5svoxdob@kamilkon-desk1>
References: <20230718215950.2557-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230718215950.2557-1-mohammed.thasleem@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_atomic_transition: Lower drm
 log level to avoid exceeding disk usage limit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Thasleem@freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mohammed,

On 2023-07-19 at 03:29:50 +0530, Thasleem, Mohammed wrote:
> Set drm debug log level for DP messages and DRIVER messages to fix exceeding disk
> usage limit in modeset-transition test cases.

I am reluctant to see such changes in tests.
Btw how much it reduces logs? Twice or more?
Maybe there should be an option to not change it?

> 
> Signed-off-by: Thasleem, Mohammed <mohammed.thasleem@intel.com>
---------------- ^ ------- ^
This should be as in your e-mail:

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>

> ---
>  tests/kms_atomic_transition.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index 6ab5267ca..fb719c8c9 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -25,6 +25,7 @@
>  #include "igt_rand.h"
>  #include "drmtest.h"
>  #include "sw_sync.h"
> +#include "igt_sysfs.h"

Keep this alphabetically, put it after "igt_rand.h" include.

>  #include <errno.h>
>  #include <pthread.h>
>  #include <stdbool.h>
> @@ -39,6 +40,7 @@
>  #ifndef DRM_CAP_CURSOR_HEIGHT
>  #define DRM_CAP_CURSOR_HEIGHT 0x9
>  #endif

Add newline here.

> +#define DEBUG_LEVEL "/sys/module/drm/parameters/"
---------- ^
better: DRM_DEBUG_LEVEL

>  
>  struct plane_parms {
>  	struct igt_fb *fb;
> @@ -46,7 +48,8 @@ struct plane_parms {
>  };
>  
>  typedef struct {
> -	int drm_fd;
> +	int drm_fd, sysfs_fd;
> +	uint32_t log_level;
>  	struct igt_fb fbs[2], argb_fb, sprite_fb;
>  	igt_display_t display;
>  	bool extended;
> @@ -965,6 +968,8 @@ static void run_modeset_transition(data_t *data, int requested_outputs, bool non
>  	int num_outputs = 0;
>  	enum pipe pipe;
>  
> +	igt_sysfs_set_u32(data->sysfs_fd, "debug", 0xa);
-------------------------------------------------- ^^^
Maybe this also needs to be define or global const.
Also do not do this if log level is already lower.

Regards,
Kamil

> +
>  	for_each_pipe(&data->display, pipe) {
>  		igt_output_t *output;
>  
> @@ -1107,6 +1112,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  
>  		igt_display_require_output(&data.display);
>  
> +		igt_require((data.sysfs_fd = open(DEBUG_LEVEL, O_RDONLY)) >= 0);
> +		data.log_level = igt_sysfs_get_u32(data.sysfs_fd, "debug");
> +
>  		for_each_connected_output(&data.display, output)
>  			count++;
>  	}
> @@ -1181,6 +1189,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  	}
>  
>  	igt_fixture {
> +		igt_sysfs_set_u32(data.sysfs_fd, "debug", data.log_level);
>  		igt_display_fini(&data.display);
>  		drm_close_driver(data.drm_fd);
>  	}
> -- 
> 2.34.1
> 
