Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C0C6E145
 for <igt-dev@lists.freedesktop.org>; Thu, 28 May 2020 10:49:59 +0000 (UTC)
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
In-Reply-To: <20200526122417.779145-1-arkadiusz.hiler@intel.com>
References: <20200526122417.779145-1-arkadiusz.hiler@intel.com>
Date: Thu, 28 May 2020 13:47:33 +0300
Message-ID: <871rn4tjy2.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] lib/igt_device_scan: Add missing
 Check for return value in scan_drm_devices
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>, Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Arkadiusz Hiler <arkadiusz.hiler@intel.com> writes:

> From: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
>
> Return value of udev_enumerate_add_match_property() was not being checked
> in scan_drm_devices().
>
> Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
> Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>

Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

> ---
>  lib/igt_device_scan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index 601d6fb0..7b0fc00e 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -532,7 +532,7 @@ static void scan_drm_devices(void)
>  	ret = udev_enumerate_add_match_subsystem(enumerate, "drm");
>  	igt_assert(!ret);
>  
> -	udev_enumerate_add_match_property(enumerate, "DEVNAME", "/dev/dri/*");
> +	ret = udev_enumerate_add_match_property(enumerate, "DEVNAME", "/dev/dri/*");
>  	igt_assert(!ret);
>  
>  	ret = udev_enumerate_scan_devices(enumerate);
> -- 
> 2.25.4
>
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
