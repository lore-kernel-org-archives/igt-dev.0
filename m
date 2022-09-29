Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C6E10E3C5
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Sep 2022 09:02:12 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org, Riana Tauro <riana.tauro@intel.com>
Date: Thu, 29 Sep 2022 11:01:56 +0200
Message-ID: <1716522.X513TT2pbd@jkrzyszt-mobl1.ger.corp.intel.com>
In-Reply-To: <20220929045058.1163003-2-riana.tauro@intel.com>
References: <20220929045058.1163003-1-riana.tauro@intel.com>
 <20220929045058.1163003-2-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/1] lib/igt_device_scan: clear
 igt_devs.devs_scanned in igt_devices_free
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thursday, 29 September 2022 06:50:58 CEST Riana Tauro wrote:
> igt_devices_scan returns with empty list if devs_scanned
> is true and function is called after igt_devices_free
> 
> clear igt_devs.devs_scanned in igt_devices_free.
> 
> v2: optimize code in igt_devices_scan (Zbigniew)
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  lib/igt_device_scan.c | 20 ++++----------------
>  1 file changed, 4 insertions(+), 16 deletions(-)
> 
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index eb6b45b8..8b70e375 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -1027,9 +1027,11 @@ void igt_devices_free(void)
>  	}
>  
>  	igt_list_for_each_entry_safe(dev, tmp, &igt_devs.all, link) {
> +		igt_list_del(&dev->link);
>  		igt_device_free(dev);
>  		free(dev);
>  	}
> +	igt_devs.devs_scanned = false;
>  }
>  
>  /**
> @@ -1043,22 +1045,8 @@ void igt_devices_free(void)
>   */
>  void igt_devices_scan(bool force)
>  {
> -	if (force && igt_devs.devs_scanned) {
> -		struct igt_device *dev, *tmp;
> -
> -		igt_list_for_each_entry_safe(dev, tmp, &igt_devs.filtered,
> -					     link) {
> -			igt_list_del(&dev->link);
> -			free(dev);
> -		}

Why don't we need to clean the igt_devs.filtered list up any longer?

Thanks,
Janusz

> -		igt_list_for_each_entry_safe(dev, tmp, &igt_devs.all, link) {
> -			igt_list_del(&dev->link);
> -			igt_device_free(dev);
> -			free(dev);
> -		}
> -
> -		igt_devs.devs_scanned = false;
> -	}
> +	if (force && igt_devs.devs_scanned)
> +		igt_devices_free();
>  
>  	if (igt_devs.devs_scanned)
>  		return;
> 



