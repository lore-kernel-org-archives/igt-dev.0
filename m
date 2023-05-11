Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539D910E5A0
 for <igt-dev@lists.freedesktop.org>; Thu, 11 May 2023 05:30:12 +0000 (UTC)
Date: Thu, 11 May 2023 07:30:06 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <20230511053006.glmndozicu2zpdf5@zkempczy-mobl2>
References: <20230504045726.2954788-1-bhanuprakash.modem@intel.com>
 <20230504045726.2954788-3-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504045726.2954788-3-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t 2/6] lib: Cache xe_device at driver open/close
 level
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

On Thu, May 04, 2023 at 10:27:22AM +0530, Bhanuprakash Modem wrote:
> Instead of caching the xe_device struct at subtest level, cache
> just after opening the driver. And remove from the cache just
> before closing the driver.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  lib/drmtest.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 03b5239b2..f6cd8e500 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -63,6 +63,7 @@
>  #include "intel_reg.h"
>  #include "ioctl_wrappers.h"
>  #include "igt_dummyload.h"
> +#include "xe/xe_query.h"
>  
>  /**
>   * SECTION:drmtest
> @@ -601,6 +602,10 @@ int drm_open_driver(int chipset)
>  		}
>  	}
>  
> +	/* Cache xe_device struct. */
> +	if (is_xe_device(fd))
> +		xe_device_get(fd);
> +
>  	return fd;
>  }
>  

Imo this should land to __drm_open_driver_another() and
__drm_open_driver_render().

gem_reopen_driver() still requires explicit device get for xe.

--
Zbigniew


> @@ -618,6 +623,10 @@ int drm_close_driver(int fd)
>  	if (fd < 3)
>  		return -1;
>  
> +	/* Remove xe_device from cache. */
> +	if (is_xe_device(fd))
> +		xe_device_put(fd);
> +
>  	return close(fd);
>  }
>  
> -- 
> 2.40.0
> 
