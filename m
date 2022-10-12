Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9007710E2CB
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Oct 2022 12:54:08 +0000 (UTC)
Date: Wed, 12 Oct 2022 14:54:04 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y0a47MXOrAfo0oyf@kamilkon-desk1>
References: <20221011053418.1684877-1-riana.tauro@intel.com>
 <20221011053418.1684877-2-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221011053418.1684877-2-riana.tauro@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/1] lib/igt_device_scan: clear
 igt_devs.devs_scanned in igt_devices_free
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

Hi Riana,

I have few nits for this patch. First is subject, it should be
avoided to write your code in C, so better title for patch is:

lib/igt_device_scan: fix igt_devices_free

On 2022-10-11 at 11:04:18 +0530, Riana Tauro wrote:
> 1) igt_devices_scan returns with empty list if devs_scanned
- ^
No need for numbering your changes, it is better to send two
patches.

>    is true and function is called after igt_devices_free
>    clear igt_devs.devs_scanned in igt_devices_free.

This is hard to read at first, maybe some re-wording like:

igt_devices_scan returns with empty list if it is called after
anyone calls igt_devices_free. Fixed this with clearing
igt_devs.devs_scanned inside igt_devices_free.

btw you did second fix inside that function, e.g. free list
so imho it should be described:

Also while at this, fix memory leak in it.

> 
> 2) remove redudant code from igt_devices_scan and replace it with
>    igt_devices_free
> 

As Janusz pointed out, it will be better to send second patch
with refactoring so please in future split fixes and other
changes.

I will merge this patch with these fixups to subject and commit
message.

Please also read CONTRIBUTING.md from igt project and see
some other helpfull notes:

https://www.ozlabs.org/~akpm/stuff/tpp.txt

https://kernelnewbies.org/PatchPhilosophy

https://elixir.bootlin.com/linux/latest/source/Documentation/process/submitting-patches.rst

Regards,
Kamil

> v2: optimize code in igt_devices_scan (Zbigniew)
> v3: update commit message (Janusz)
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
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
> -- 
> 2.25.1
> 
