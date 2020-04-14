Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC52F6E04E
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2020 12:05:20 +0000 (UTC)
References: <20200410102046.6428-1-terrence.xu@intel.com>
 <158651467176.23161.12918926732310635191@build.alporthouse.com>
 <EE92950F97EE42469CA4F508D4691F5E3E6EE99F@SHSMSX104.ccr.corp.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <611b6151-2e63-56fe-87d1-3adb8f01239f@linux.intel.com>
Date: Tue, 14 Apr 2020 13:05:13 +0100
MIME-Version: 1.0
In-Reply-To: <EE92950F97EE42469CA4F508D4691F5E3E6EE99F@SHSMSX104.ccr.corp.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [i-g-t] i915/perf: Correct the logic of finding i915
 pmu event path
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Xu, Terrence" <terrence.xu@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>, "Xu, Colin" <colin.xu@intel.com>, "Wang, Zhenyu Z" <zhenyu.z.wang@intel.com>, "Jin,
 Gordon" <gordon.jin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>


+ Ayaz

On 10/04/2020 13:32, Xu, Terrence wrote:
> 
>> -----Original Message-----
>> From: Chris Wilson <chris@chris-wilson.co.uk>
>> Quoting Terrence Xu (2020-04-10 11:20:46)
>>> Hardcoded i915 PMU event path /sys/bus/event_source/devices/i915
>>> isn't always correct when vGPU isn't on BDF 0:2.0 in virtualization
>>> environment.
>>>
>>> e.g. It will show as sys/bus/event_source/devices/i915-0000:00:03.0
>>> when vGPU is on BDF 0:3.0.
>>>
>>> Refine the path name so that intel_gpu_top can find the correct adapter.
>>>
>>> Signed-off-by: Terrence Xu <terrence.xu@intel.com>
>>> ---
>>>   lib/igt_perf.c        | 15 ++++++++++++++-
>>>   tools/intel_gpu_top.c | 16 +++++++++++++++-
>>>   2 files changed, 29 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/lib/igt_perf.c b/lib/igt_perf.c index
>>> 418c1c188..3531209b3 100644
>>> --- a/lib/igt_perf.c
>>> +++ b/lib/igt_perf.c
>>> @@ -7,6 +7,7 @@
>>>   #include <sys/stat.h>
>>>   #include <sys/sysinfo.h>
>>>   #include <sys/sysmacros.h>
>>> +#include <dirent.h>
>>>
>>>   #include "igt_perf.h"
>>>
>>> @@ -75,11 +76,23 @@ uint64_t i915_perf_type_id(int i915)  uint64_t
>>> igt_perf_type_id(const char *device)  {
>>>          char buf[64];
>>> +       char dev[64];
>>>          ssize_t ret;
>>>          int fd;
>>> +       DIR *dir;
>>> +       struct dirent *dent;
>>> +
>>> +       dir = opendir("/sys/bus/event_source/devices/");
>>
>> Nak, this is passed the explicit device to use.
>>
>> i915_perf_type_id() takes the device fd and expands it to the pmu device name.
>> -Chris
> [Xu, Terrence] Thanks for your quick response!  Do you think we can use perf_i915_open_group() instead of perf_igfx_open_group() in intel_gpu_top when open pmu? Since i915_perf_type_id() can provide the right i915 pmu.

Ayaz has a patch series in progress which should fix this.

Apart that it would think of 0000:00:03.0 as a discrete GPU but perhaps 
that would be okay for now, since only difference would be omission or 
RAPL (power) data which is probably correct for virtualization.

Regards,

Tvrtko
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
