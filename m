Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 743EA10E030
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jan 2024 07:33:15 +0000 (UTC)
Message-ID: <24f8f54e-978c-4a5a-9a67-5efc53107bce@intel.com>
Date: Fri, 12 Jan 2024 13:02:54 +0530
Subject: Re: [PATCH] lib/igt_kms: add support for choosing big joiner mode
Content-Language: en-US
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20240112053932.570651-1-kunal1.joshi@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240112053932.570651-1-kunal1.joshi@intel.com>
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

Hi Kunal,

On 12-01-2024 11:09 am, Kunal Joshi wrote:
> add support to choose big joiner mode with environment
> variable, use mode with highest clock if no mode with big joiner
> found.
> 
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   lib/igt_kms.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index e4dea1a60..3d0fe635c 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -1783,15 +1783,30 @@ bool kmstest_get_connector_default_mode(int drm_fd, drmModeConnector *connector,
>   	env = getenv("IGT_KMS_RESOLUTION");
>   	if (env) {
>   		/*
> -		 * Only (0 or 1) and (lowest or highest) are allowed.
> +		 * Only (0 or 1 or 2) and (lowest or highest or joiner) are allowed.
>   		 *
>   		 * 0/lowest: Choose connector mode with lowest possible resolution.
>   		 * 1/highest: Choose connector mode with highest possible resolution.
> +		 * 2/joiner: Choose connector mode with big joiner output or output
> +		 *           with max clock requirement

Please re-write this to choose bigjoiner mode if found any.
>   		 */
>   		if (!strcmp(env, "highest") || !strcmp(env, "1"))
>   			igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
>   		else if (!strcmp(env, "lowest") || !strcmp(env, "0"))
>   			igt_sort_connector_modes(connector, sort_drm_modes_by_res_asc);
> +		else if (!strcmp(env, "joiner") || !strcmp(env, "2")) {

Let's sort the if-else ladder as "0->1->2" or "2->1->0".

> +			igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
> +			if (igt_bigjoiner_possible(&connector->modes[0], igt_get_max_dotclock(drm_fd))) {
> +				*mode = connector->modes[0];
> +				return true;
> +			}
> +			igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
------------------------------------------------------------^
typo: s/sort_drm_modes_by_res_dsc/sort_modes_by_clk_dsc/

> +			if(igt_bigjoiner_possible(&connector->modes[0], igt_get_max_dotclock(drm_fd))) {
> +				*mode = connector->modes[0];
> +				return true;
> +			}
> +			igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);

Please drop this sorting.

IMHO, Instead of returning from multiple places, try to adopt this [*] 
cleaner way.

[*]: 
https://cgit.freedesktop.org/drm/igt-gpu-tools/tree/tests/intel/kms_big_joiner.c#n235

- Bhanu

> +		}
>   		else
>   			goto default_mode;
>   
