Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF2BD6E196
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Dec 2019 16:34:41 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191227162312.19920-1-robert.m.fosha@intel.com>
References: <20191227162312.19920-1-robert.m.fosha@intel.com>
Message-ID: <157746446684.14652.13693579566769751538@skylake-alporthouse-com>
Date: Fri, 27 Dec 2019 16:34:26 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_perf: Support multiple GPUs
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
To: "Robert M. Fosha" <robert.m.fosha@intel.com>, igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Robert M. Fosha (2019-12-27 16:23:12)
> With discrete graphics system can have both integrated and discrete GPU
> handled by i915.
> 
> Update path to PMU for non-integrated devices to include PCI device name
> string to match driver implementation. Integrated devices keep legacy
> path.
> 
> Signed-off-by: Robert M. Fosha <robert.m.fosha@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  lib/igt_perf.c    | 53 ++++++++++++++++++++++++++++++++++++++++++++---
>  tools/meson.build |  2 +-
>  2 files changed, 51 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/igt_perf.c b/lib/igt_perf.c
> index e3dec2cc..f4a0036f 100644
> --- a/lib/igt_perf.c
> +++ b/lib/igt_perf.c
> @@ -5,27 +5,74 @@
>  #include <string.h>
>  #include <errno.h>
>  #include <sys/sysinfo.h>
> +#include <sys/stat.h>
>  
>  #include "igt_perf.h"
>  
> +#include "drmtest.h"
> +#include "igt_debugfs.h"
> +
> +static char *perf_event_sysfs_path(void)
> +{
> +       int drm_fd;
> +       static const char unique[] = "unique=";
> +       static const char prefix[] = "/sys/bus/event_source/devices/i915";
> +       char path[100];
> +       char buf[100];
> +       char *busid;
> +       struct stat st;
> +
> +       drm_fd = drm_open_driver(DRIVER_INTEL);

Just stop there. How does this relate to the device we want?
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
