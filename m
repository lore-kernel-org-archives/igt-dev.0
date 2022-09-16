Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBF310EC96
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Sep 2022 05:22:58 +0000 (UTC)
Message-ID: <692be5bd-5545-dddd-d2a6-e2036a2cf600@intel.com>
Date: Fri, 16 Sep 2022 10:52:46 +0530
Content-Language: en-US
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20220915135739.3542117-1-riana.tauro@intel.com>
 <20220915135739.3542117-2-riana.tauro@intel.com>
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20220915135739.3542117-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] lib/igt_device_scan: clear
 igt_devs.devs_scanned in igt_devices_free
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Latvala, Petri" <petri.latvala@intel.com>, tvrtko.ursulin@intel.com,
 ayaz.siddiqui@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 9/15/2022 7:27 PM, Tauro, Riana wrote:
> igt_devices_scan returns with empty list if devs_scanned
> is true and function is called after igt_devices_free
> 
> clear igt_devs.devs_scanned in igt_devices_free.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   lib/igt_device_scan.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index eb6b45b8..e7c05d5c 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -1030,6 +1030,7 @@ void igt_devices_free(void)
>   		igt_device_free(dev);
>   		free(dev);
>   	}
> +	igt_devs.devs_scanned = false;
>   }
>   
>   /**
