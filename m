Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8973910E6E6
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Apr 2023 09:23:13 +0000 (UTC)
Message-ID: <cc556d84-b6ac-5d31-458d-e957c1cdfeb2@intel.com>
Date: Tue, 25 Apr 2023 14:53:01 +0530
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230425064953.2121947-1-bhanuprakash.modem@intel.com>
 <20230425064953.2121947-23-bhanuprakash.modem@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230425064953.2121947-23-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V2 22/40] tests/kms_3d: Add XE support
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


On 4/25/2023 12:19 PM, Bhanuprakash Modem wrote:
> Add XE driver support for kms tests.
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_3d.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/tests/kms_3d.c b/tests/kms_3d.c
> index c6bef67c1..437c8a481 100644
> --- a/tests/kms_3d.c
> +++ b/tests/kms_3d.c
> @@ -23,6 +23,7 @@
>    */
>   
>   #include "igt.h"
> +#include "xe/xe_query.h"
>   
>   IGT_TEST_DESCRIPTION("Tests 3D mode setting.");
>   
> @@ -36,6 +37,9 @@ igt_simple_main
>   
>   	drm_fd = drm_open_driver_master(DRIVER_ANY);
>   
> +	if (is_xe_device(drm_fd))
> +		xe_device_get(drm_fd);
> +
>   	res = drmModeGetResources(drm_fd);
>   	igt_require(res);
>   
> @@ -111,5 +115,9 @@ igt_simple_main
>   	kmstest_force_edid(drm_fd, connector, NULL);
>   
>   	drmModeFreeConnector(connector);
> +
> +	if (is_xe_device(drm_fd))
> +		xe_device_put(drm_fd);
> +
>   	close(drm_fd);
>   }
