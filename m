Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44F76E0D9
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Apr 2020 10:31:16 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200410102046.6428-1-terrence.xu@intel.com>
References: <20200410102046.6428-1-terrence.xu@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158651467176.23161.12918926732310635191@build.alporthouse.com>
Date: Fri, 10 Apr 2020 11:31:11 +0100
Subject: Re: [igt-dev] [i-g-t] i915/perf: Correct the logic of finding i915
 pmu event path
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
To: Terrence Xu <terrence.xu@intel.com>, igt-dev@lists.freedesktop.org
Cc: colin.xu@intel.com, zhenyu.z.wang@intel.com, gordon.jin@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Terrence Xu (2020-04-10 11:20:46)
> Hardcoded i915 PMU event path /sys/bus/event_source/devices/i915
> isn't always correct when vGPU isn't on BDF 0:2.0 in virtualization
> environment.
> 
> e.g. It will show as sys/bus/event_source/devices/i915-0000:00:03.0
> when vGPU is on BDF 0:3.0.
> 
> Refine the path name so that intel_gpu_top can find the correct adapter.
> 
> Signed-off-by: Terrence Xu <terrence.xu@intel.com>
> ---
>  lib/igt_perf.c        | 15 ++++++++++++++-
>  tools/intel_gpu_top.c | 16 +++++++++++++++-
>  2 files changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_perf.c b/lib/igt_perf.c
> index 418c1c188..3531209b3 100644
> --- a/lib/igt_perf.c
> +++ b/lib/igt_perf.c
> @@ -7,6 +7,7 @@
>  #include <sys/stat.h>
>  #include <sys/sysinfo.h>
>  #include <sys/sysmacros.h>
> +#include <dirent.h>
>  
>  #include "igt_perf.h"
>  
> @@ -75,11 +76,23 @@ uint64_t i915_perf_type_id(int i915)
>  uint64_t igt_perf_type_id(const char *device)
>  {
>         char buf[64];
> +       char dev[64];
>         ssize_t ret;
>         int fd;
> +       DIR *dir;
> +       struct dirent *dent;
> +
> +       dir = opendir("/sys/bus/event_source/devices/");

Nak, this is passed the explicit device to use.

i915_perf_type_id() takes the device fd and expands it to the pmu device
name.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
