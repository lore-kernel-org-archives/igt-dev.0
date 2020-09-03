Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDFE76E029
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Sep 2020 11:54:14 +0000 (UTC)
Date: Thu, 3 Sep 2020 13:54:09 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20200903115409.GA3720@zkempczy-mobl2>
References: <20200903110110.2403699-1-ayaz.siddiqui@intel.com>
 <20200903110110.2403699-2-ayaz.siddiqui@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200903110110.2403699-2-ayaz.siddiqui@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_device_scan: Fix device
 selection filter
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Sep 03, 2020 at 04:31:09PM +0530, Ayaz A Siddiqui wrote:
> DRM subsystem filter in intel_gpu_top was not working due to missing
> PCI_SLOT_NAME property. Using the parent device in case of drm subsystem
> leads to fix this issue.
> 
> Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
> ---
>  lib/igt_device_scan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index 345bae76d..3583c69c7 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -1263,7 +1263,7 @@ bool igt_device_card_match(const char *filter, struct igt_device_card *card)
>  	/* We take first one if more than one card matches filter */
>  	dev = igt_list_first_entry(&igt_devs.filtered, dev, link);
>  
> -	__copy_dev_to_card(dev, card);
> +	__copy_dev_to_card(is_pci_subsystem(dev) ? dev : dev->parent, card);
>  
>  	return true;
>  }

The only doubt I got: - is that i915 driver behavior or all
drm cards do the same?

--
Zbigniew  
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
