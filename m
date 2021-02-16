Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20210216105050.309803-1-tvrtko.ursulin@linux.intel.com>
 <161347977326.8311.2289376711332554853@build.alporthouse.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <5a07f0c2-48c1-1605-e1f5-91d61a213f67@linux.intel.com>
Date: Tue, 16 Feb 2021 15:59:33 +0000
MIME-Version: 1.0
In-Reply-To: <161347977326.8311.2289376711332554853@build.alporthouse.com>
Content-Language: en-US
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] tests/i915/perf_pmu:
 Subtest to measure sampling error for 100% busy
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


On 16/02/2021 12:49, Chris Wilson wrote:
> Quoting Tvrtko Ursulin (2021-02-16 10:50:50)
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Test that periodic reads of engine busyness against a constant 100% load
>> are within the 5000ppm tolerance when comparing perf timestamp versus
>> counter values.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> ---
>>   tests/i915/perf_pmu.c | 46 ++++++++++++++++++++++++++++++++++++++-----
>>   1 file changed, 41 insertions(+), 5 deletions(-)
>>
>> diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
>> index 50b5c82bc472..728312be5293 100644
>> --- a/tests/i915/perf_pmu.c
>> +++ b/tests/i915/perf_pmu.c
>> @@ -26,6 +26,7 @@
>>   #include <stdio.h>
>>   #include <string.h>
>>   #include <fcntl.h>
>> +#include <float.h>
>>   #include <inttypes.h>
>>   #include <errno.h>
>>   #include <signal.h>
>> @@ -46,6 +47,7 @@
>>   #include "igt_perf.h"
>>   #include "igt_sysfs.h"
>>   #include "igt_pm.h"
>> +#include "igt_stats.h"
>>   #include "sw_sync.h"
>>   
>>   IGT_TEST_DESCRIPTION("Test the i915 pmu perf interface");
>> @@ -278,8 +280,11 @@ static void end_spin(int fd, igt_spin_t *spin, unsigned int flags)
>>   static void
>>   single(int gem_fd, const struct intel_execution_engine2 *e, unsigned int flags)
>>   {
>> +       unsigned int loops = flags & FLAG_LONG ? 20 : 1;
>> +       double err_min = DBL_MAX, err_max = -DBL_MAX;
>>          unsigned long slept;
>>          igt_spin_t *spin;
>> +       igt_stats_t s;
>>          uint64_t val;
>>          int fd;
>>   
>> @@ -290,11 +295,40 @@ single(int gem_fd, const struct intel_execution_engine2 *e, unsigned int flags)
>>          else
>>                  spin = NULL;
>>   
>> -       val = pmu_read_single(fd);
>> -       slept = measured_usleep(batch_duration_ns / 1000);
>> -       if (flags & TEST_TRAILING_IDLE)
>> -               end_spin(gem_fd, spin, flags);
>> -       val = pmu_read_single(fd) - val;
>> +       igt_stats_init_with_size(&s, loops);
>> +
>> +       while (--loops) {
> 
> while (loops--)
> 
> /o\

Yeah.. At least I know the oddity is related to sampling. Since even on 
Haswell:

(perf_pmu:1591) DEBUG: time=500207720 busy=500037022 error=-341.25ppm
(perf_pmu:1591) DEBUG: time=500252520 busy=500033517 error=-437.78ppm
(perf_pmu:1591) DEBUG: time=500187490 busy=499999817 error=-375.21ppm
(perf_pmu:1591) DEBUG: time=500244871 busy=499999837 error=-489.83ppm
(perf_pmu:1591) DEBUG: time=500268670 busy=499999477 error=-538.10ppm
(perf_pmu:1591) DEBUG: time=500245246 busy=500000432 error=-489.39ppm
(perf_pmu:1591) DEBUG: time=500245735 busy=499999306 error=-492.62ppm
(perf_pmu:1591) DEBUG: time=500270045 busy=500001747 error=-536.31ppm
(perf_pmu:1591) DEBUG: time=500254286 busy=499998162 error=-511.99ppm
(perf_pmu:1591) DEBUG: time=500247790 busy=500000347 error=-494.64ppm
(perf_pmu:1591) DEBUG: time=500250261 busy=500000257 error=-499.76ppm
(perf_pmu:1591) DEBUG: time=500250005 busy=500008177 error=-483.41ppm
(perf_pmu:1591) DEBUG: time=500249065 busy=499991867 error=-514.14ppm
(perf_pmu:1591) DEBUG: time=500249725 busy=500000371 error=-498.46ppm
(perf_pmu:1591) DEBUG: time=500250335 busy=499999772 error=-500.88ppm
(perf_pmu:1591) DEBUG: time=500258691 busy=499999937 error=-517.24ppm
(perf_pmu:1591) DEBUG: time=500239980 busy=500001037 error=-477.66ppm
(perf_pmu:1591) DEBUG: time=500240791 busy=504999361 error=9512.56ppm

And this last one is way more than one sampling period. I'll be thinking 
about this in the background.

Regards,

Tvrtko
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
