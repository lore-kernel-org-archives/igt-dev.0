Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E3D10E335
 for <igt-dev@lists.freedesktop.org>; Tue,  9 May 2023 07:22:36 +0000 (UTC)
Message-ID: <f5d92f23-021f-e72f-da4d-e9d78ada2ea7@intel.com>
Date: Tue, 9 May 2023 12:51:48 +0530
Content-Language: en-US
References: <20230504045726.2954788-1-bhanuprakash.modem@intel.com>
 <20230504045726.2954788-3-bhanuprakash.modem@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230504045726.2954788-3-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 2/6] lib: Cache xe_device at driver open/close
 level
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, ankit.k.nautiyal@intel.com, mchehab@kernel.org, kamil.konieczny@linux.intel.com, zbigniew.kempczynski@intel.com, karthik.b.s@intel.com, swati2.sharma@intel.com
List-ID: <igt-dev@lists.freedesktop.org>



On Thu-04-05-2023 10:27 am, Bhanuprakash Modem wrote:
> Instead of caching the xe_device struct at subtest level, cache
> just after opening the driver. And remove from the cache just
> before closing the driver.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>   lib/drmtest.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 03b5239b2..f6cd8e500 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -63,6 +63,7 @@
>   #include "intel_reg.h"
>   #include "ioctl_wrappers.h"
>   #include "igt_dummyload.h"
> +#include "xe/xe_query.h"
>   
>   /**
>    * SECTION:drmtest
> @@ -601,6 +602,10 @@ int drm_open_driver(int chipset)
>   		}
>   	}
>   
> +	/* Cache xe_device struct. */
> +	if (is_xe_device(fd))
> +		xe_device_get(fd);
> +
>   	return fd;
>   }
>   
> @@ -618,6 +623,10 @@ int drm_close_driver(int fd)
>   	if (fd < 3)
>   		return -1;
>   
> +	/* Remove xe_device from cache. */
> +	if (is_xe_device(fd))
> +		xe_device_put(fd);
> +
>   	return close(fd);
>   }
>   

