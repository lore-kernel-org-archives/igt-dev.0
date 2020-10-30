Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B20466E0CA
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Oct 2020 22:39:33 +0000 (UTC)
Date: Fri, 30 Oct 2020 15:39:32 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Message-ID: <20201030223932.GK70749@orsosgc001.ra.intel.com>
References: <20201030003911.27211-1-umesh.nerlige.ramappa@intel.com>
 <20201030101603.GI7444@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201030101603.GI7444@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/perf: Make sure i915 is loaded
 before reading proc
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Oct 30, 2020 at 12:16:03PM +0200, Petri Latvala wrote:
>On Thu, Oct 29, 2020 at 05:39:11PM -0700, Umesh Nerlige Ramappa wrote:
>> The previous test may have unloaded i915 or failed to load it back. To
>> combat such cases, each test fixture is supposed to ensure that i915 is
>> loaded prior to running the subtests. In most fixtures this happens
>> automatically when we try to get a handle to i915. In perf OA, we stat
>> some proc/sys files even before getting a handle to i915. Occassionally,
>> perf tests fail trying to stat these files. Fix perf OA by checking and
>> loading i915 if it's not loaded.
>>
>> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/405
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>
>I had a patch also fixing this back in August but I guess I didn't CC
>the correct people (in fact CCd none).
>
>https://patchwork.freedesktop.org/series/80805/
>
>Same comment as for that other patch by Chris, we might want to
>generalize this by exporting __try_modprobe to be callable from tests.

Thanks Petri,

Ashutosh suggested that there is no need to check igt_kmod_is_loaded.  
That happens within igt_i915_driver_load. I will remove the if and post 
v2.

Thanks,
Umesh

>
>Anyway,
>Reviewed-by: Petri Latvala <petri.latvala@intel.com>
>
>
>
>
>>  tests/i915/perf.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/tests/i915/perf.c b/tests/i915/perf.c
>> index a5c4adc3..a5bd63c2 100644
>> --- a/tests/i915/perf.c
>> +++ b/tests/i915/perf.c
>> @@ -41,6 +41,7 @@
>>  #include "i915/gem.h"
>>  #include "i915/perf.h"
>>  #include "igt.h"
>> +#include "igt_kmod.h"
>>  #include "igt_sysfs.h"
>>  #include "drm.h"
>>
>> @@ -4806,6 +4807,14 @@ igt_main
>>  	igt_fixture {
>>  		struct stat sb;
>>
>> +               /*
>> +		* Prior tests may have unloaded i915 or failed while
>> +		* loading/unloading i915. Load i915 here before we stat the
>> +		* files.
>> +                */
>> +               if (!igt_kmod_is_loaded("i915"))
>> +                       igt_assert(!igt_i915_driver_load(NULL));
>> +
>>  		igt_require(stat("/proc/sys/dev/i915/perf_stream_paranoid", &sb)
>>  			    == 0);
>>  		igt_require(stat("/proc/sys/dev/i915/oa_max_sample_rate", &sb)
>> --
>> 2.20.1
>>
>> _______________________________________________
>> igt-dev mailing list
>> igt-dev@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
