Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B04276E21A
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2020 16:06:59 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id u26so315011wmn.1
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2020 09:06:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200526122417.779145-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20200526122417.779145-1-arkadiusz.hiler@intel.com>
From: Lucas De Marchi <lucas.de.marchi@gmail.com>
Date: Tue, 26 May 2020 09:06:46 -0700
Message-ID: <CAKi4VAK0O_zq2A0ey1n11z3ECo_VNb0qX4rGMBssz=ppxQdF0A@mail.gmail.com>
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>, Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, May 26, 2020 at 5:24 AM Arkadiusz Hiler
<arkadiusz.hiler@intel.com> wrote:
>
> From: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
>
> Return value of udev_enumerate_add_match_property() was not being checked
> in scan_drm_devices().
>
> Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
> Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

> ---
>  lib/igt_device_scan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index 601d6fb0..7b0fc00e 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -532,7 +532,7 @@ static void scan_drm_devices(void)
>         ret = udev_enumerate_add_match_subsystem(enumerate, "drm");
>         igt_assert(!ret);
>
> -       udev_enumerate_add_match_property(enumerate, "DEVNAME", "/dev/dri/*");
> +       ret = udev_enumerate_add_match_property(enumerate, "DEVNAME", "/dev/dri/*");
>         igt_assert(!ret);
>
>         ret = udev_enumerate_scan_devices(enumerate);
> --
> 2.25.4
>
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev



-- 
Lucas De Marchi
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
