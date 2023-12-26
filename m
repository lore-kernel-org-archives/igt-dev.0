Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED78E10E00B
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Dec 2023 08:47:30 +0000 (UTC)
Message-ID: <f7962bc5-e5cf-490e-bc01-7064816b2b3b@intel.com>
Date: Tue, 26 Dec 2023 14:17:20 +0530
Subject: Re: [PATCH i-g-t v2] tests/kms_lease: Cache xe_device info for lease
 fd
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20231212100712.3301571-1-mohammed.thasleem@intel.com>
 <20231226080930.32272-1-mohammed.thasleem@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20231226080930.32272-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
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


On 12/26/2023 1:39 PM, Mohammed Thasleem wrote:
> In case of xe device for lessor fd, the xe_device struct gets
> created and cached during drm_open. But for the lessee fd,
> the xe_device info struct is not created and cached.
>
> This causes problem in prepare_crtc() for lessee with xe, which
> needs the xe_device info struct. So, create and cache the xe_device
> struct info for lease fd, when we make lease and remove it from
> cache while terminating the lease.
>
> v2: -Update description and move logic to make_lease call. (Ankit)
>      -Add xe_device_put, while terminating the lease. (Ankit)
>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


Regards,

Ankit

> ---
>   tests/kms_lease.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/tests/kms_lease.c b/tests/kms_lease.c
> index 8ac58af38..f7531c803 100644
> --- a/tests/kms_lease.c
> +++ b/tests/kms_lease.c
> @@ -48,6 +48,8 @@
>   
>   #include <drm.h>
>   #include "igt_device.h"
> +#include "xe_drm.h"
> +#include "xe/xe_query.h"
>   
>   /**
>    * SUBTEST: atomic-implicit-crtc
> @@ -267,12 +269,20 @@ static int make_lease(data_t *data)
>   	if (ret)
>   		return ret;
>   
> +	/* Cache xe_device struct */
> +	if (is_xe_device(data->lease.fd))
> +		xe_device_get(data->lease.fd);
> +
>   	data->lease.lessee_id = mcl.lessee_id;
>   	return 0;
>   }
>   
>   static void terminate_lease(int lease_fd)
>   {
> +	/* Remove xe_device from cache. */
> +	if (is_xe_device(lease_fd))
> +		xe_device_put(lease_fd);
> +
>   	close(lease_fd);
>   }
>   
