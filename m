Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <6f83991b-e4d6-b573-9e1c-074f2c612ff7@linux.intel.com>
Date: Wed, 15 Mar 2023 09:20:49 +0000
MIME-Version: 1.0
Content-Language: en-US
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20230314121740.1195358-1-tvrtko.ursulin@linux.intel.com>
 <ZBC8GxZjeR5+bHOm@orsosgc001.jf.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <ZBC8GxZjeR5+bHOm@orsosgc001.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] intel_gpu_top: Use actual
 period when calculating client busyness
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


Hi Umesh,

On 14/03/2023 18:25, Umesh Nerlige Ramappa wrote:
> lgtm,
> 
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks - I had one second thought though. See below please.

> On Tue, Mar 14, 2023 at 12:17:40PM +0000, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> On a slow machine, or with many processes and/or file descriptors to
>> parse, the period of the scanning loop can drift significantly from the
>> assumed value. This results in artificially inflated client busyness
>> percentages.
>>
>> To alleviate the issue take some real timestamps and use actual elapsed
>> time when calculating relative busyness.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> ---
>> tools/intel_gpu_top.c | 39 ++++++++++++++++++++++++++++++++++++++-
>> 1 file changed, 38 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
>> index e13e35b71f4b..af4b350da8e4 100644
>> --- a/tools/intel_gpu_top.c
>> +++ b/tools/intel_gpu_top.c
>> @@ -43,6 +43,7 @@
>> #include <sys/types.h>
>> #include <unistd.h>
>> #include <termios.h>
>> +#include <time.h>
>> #include <sys/sysmacros.h>
>>
>> #include "igt_perf.h"
>> @@ -2524,6 +2525,38 @@ static void show_help_screen(void)
>> "\n");
>> }
>>
>> +static int gettime(struct timespec *ts)
>> +{
>> +    memset(ts, 0, sizeof(*ts));
>> +
>> +#ifdef CLOCK_MONOTONIC_RAW
>> +    if (!clock_gettime(CLOCK_MONOTONIC_RAW, ts))
>> +        return 0;
>> +#endif
>> +#ifdef CLOCK_MONOTONIC_COARSE
>> +    if (!clock_gettime(CLOCK_MONOTONIC_COARSE, ts))
>> +        return 0;
>> +#endif

So I copied this (with some edits) from igt_core.c but I think I should 
actually remove the CLOCK_MONOTONIC_COARSE option. The usage in 
intel_gpu_top is not performance sensitive and tick granularity actually 
defeats to point of this patch.

Okay to keep the r-b if I remove it?

Regards,

Tvrtko

>> +
>> +    return clock_gettime(CLOCK_MONOTONIC, ts);
>> +}
>> +
>> +static unsigned long elapsed_us(struct timespec *prev, unsigned int 
>> period_us)
>> +{
>> +    unsigned long elapsed;
>> +    struct timespec now;
>> +
>> +    if (gettime(&now))
>> +        return period_us;
>> +
>> +    elapsed = ((now.tv_nsec - prev->tv_nsec) / 1000 +
>> +               (unsigned long)USEC_PER_SEC * (now.tv_sec - 
>> prev->tv_sec));
>> +
>> +    *prev = now;
>> +
>> +    return elapsed;
>> +}
>> +
>> int main(int argc, char **argv)
>> {
>>     unsigned int period_us = DEFAULT_PERIOD_MS * 1000;
>> @@ -2537,6 +2570,7 @@ int main(int argc, char **argv)
>>     char *pmu_device, *opt_device = NULL;
>>     struct igt_device_card card;
>>     char *codename = NULL;
>> +    struct timespec ts;
>>
>>     /* Parse options */
>>     while ((ch = getopt(argc, argv, "o:s:d:pcJLlh")) != -1) {
>> @@ -2690,6 +2724,7 @@ int main(int argc, char **argv)
>>
>>     pmu_sample(engines);
>>     scan_clients(clients, false);
>> +    gettime(&ts);
>>     codename = igt_device_get_pretty_name(&card, false);
>>
>>     if (output_mode == JSON)
>> @@ -2698,6 +2733,7 @@ int main(int argc, char **argv)
>>     while (!stop_top) {
>>         struct clients *disp_clients;
>>         bool consumed = false;
>> +        unsigned int scan_us;
>>         int j, lines = 0;
>>         struct winsize ws;
>>         struct client *c;
>> @@ -2720,6 +2756,7 @@ int main(int argc, char **argv)
>>         t = (double)(engines->ts.cur - engines->ts.prev) / 1e9;
>>
>>         disp_clients = scan_clients(clients, true);
>> +        scan_us = elapsed_us(&ts, period_us);
>>
>>         if (stop_top)
>>             break;
>> @@ -2757,7 +2794,7 @@ int main(int argc, char **argv)
>>
>>                     lines = print_client(c, engines, t,
>>                                  lines, con_w,
>> -                                 con_h, period_us,
>> +                                 con_h, scan_us,
>>                                  &class_w);
>>                 }
>>
>> -- 
>> 2.37.2
>>
