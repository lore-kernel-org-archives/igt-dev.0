Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C54910E670
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Sep 2023 18:19:09 +0000 (UTC)
Date: Fri, 15 Sep 2023 20:19:04 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230915181904.f5jfcjcisbvhdenn@kamilkon-desk.igk.intel.com>
References: <20230915132647.476532-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230915132647.476532-1-janga.rahul.kumar@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel/xe_debugfs : Check
 tile_count info
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: sai.gowtham.ch@intel.com, ramadevi.gandi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Janga,

small nit in subject:

[PATCH i-g-t] tests/intel/xe_debugfs : Check tile_count info
------------------------------------^

Remove space before ':', it should be:

[PATCH i-g-t] tests/intel/xe_debugfs: Check tile_count info

On 2023-09-15 at 18:56:47 +0530, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 
> Check correctness of tile_count info.
> 
> Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  tests/intel/xe_debugfs.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
> index 88b51dbd4..2e752267c 100644
> --- a/tests/intel/xe_debugfs.c
> +++ b/tests/intel/xe_debugfs.c
> @@ -13,7 +13,7 @@
>   */
>  
>  #include "igt.h"
> -
> +#include "igt_sysfs.h"
>  #include "xe_drm.h"
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
> @@ -117,6 +117,9 @@ test_base(int fd, struct drm_xe_query_config *config)
>  		igt_assert(igt_debugfs_search(fd, "info", reference));
>  	}
>  
> +	sprintf(reference, "tile_count %d", xe_sysfs_get_num_tiles(fd));
    ^
Use snprintf?

Regards,
Kamil

> +	igt_assert(igt_debugfs_search(fd, "info", reference));
> +
>  	igt_assert(igt_debugfs_exists(fd, "gt0", O_RDONLY));
>  	if (config->info[XE_QUERY_CONFIG_GT_COUNT] > 1)
>  		igt_assert(igt_debugfs_exists(fd, "gt1", O_RDONLY));
> -- 
> 2.25.1
> 
