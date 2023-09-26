Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539B510E3AF
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 11:49:02 +0000 (UTC)
Message-ID: <48980d78-ef4a-65a6-f9f0-39f377ddf625@linux.intel.com>
Date: Tue, 26 Sep 2023 13:48:56 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230926084451.1732748-1-marcin.bernatowicz@linux.intel.com>
 <20230926084451.1732748-11-marcin.bernatowicz@linux.intel.com>
 <348811fd-2725-0620-d5da-d808edf507a0@linux.intel.com>
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <348811fd-2725-0620-d5da-d808edf507a0@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 10/14] benchmarks/gem_wsim: allow
 comments in workload description files
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: chris.p.wilson@linux.intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi

On 9/26/2023 1:33 PM, Tvrtko Ursulin wrote:
> 
> On 26/09/2023 09:44, Marcin Bernatowicz wrote:
>> Lines starting with '#' are skipped.
>> If command line step separator (',') is encountered after '#'
>> it is replaced with ';' to not break parsing.
>>
>> v2: SKIP step type is not needed (Tvrtko)
>>
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> ---
>>   benchmarks/gem_wsim.c  | 19 ++++++++++++++++++-
>>   benchmarks/wsim/README |  2 ++
>>   2 files changed, 20 insertions(+), 1 deletion(-)
>>
>> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
>> index a3339e1b2..0222c6c71 100644
>> --- a/benchmarks/gem_wsim.c
>> +++ b/benchmarks/gem_wsim.c
>> @@ -43,6 +43,7 @@
>>   #include <limits.h>
>>   #include <pthread.h>
>>   #include <math.h>
>> +#include <ctype.h>
>>   #include "drm.h"
>>   #include "drmtest.h"
>> @@ -809,6 +810,14 @@ parse_workload(struct w_arg *arg, unsigned int 
>> flags, double scale_dur,
>>           if (field) {
>>               fstart = NULL;
>> +            /* line starting with # is a comment */
>> +            if (field[0] == '#') {
>> +                if (verbose > 3)
>> +                    printf("skipped line: %s\n", _token);
>> +                free(token);
>> +                continue;
>> +            }
>> +
>>               if (!strcmp(field, "d")) {
>>                   int_field(DELAY, delay, tmp <= 0,
>>                         "Invalid delay at step %u!\n");
>> @@ -1073,7 +1082,8 @@ parse_workload(struct w_arg *arg, unsigned int 
>> flags, double scale_dur,
>>           if (field) {
>>               fstart = NULL;
>> -            check_arg(strlen(field) != 1 ||
>> +            check_arg(!strlen(field) ||
>> +                  (strlen(field) > 1 && !isspace(field[1]) && 
>> field[1] != '#') ||
> 
> Help me out here please - why is this needed for this specific field?

I loosened the condition a bit to allow a comment on the same line as 
BATCH step, maybe looks a bit weird but allows to have:

1.RCS.100.0.1 # a comment
1.RCS.100.0.1# a comment
1.RCS.100.0.1 this is also acceppted but didn't want to add more loops:/


> 
>>                     (field[0] != '0' && field[0] != '1'),
>>                     "Invalid wait boolean at step %u!\n",
>>                     nr_steps);
>> @@ -2422,6 +2432,13 @@ static char *load_workload_descriptor(char 
>> *filename)
>>       close(infd);
>>       for (i = 0; i < len; i++) {
>> +        /* '#' starts comment till end of line */
>> +        if (buf[i] == '#')
>> +            /* replace ',' in comments to not break parsing */
>> +            while (++i < len && buf[i] != '\n')
>> +                if (buf[i] == ',')
>> +                    buf[i] = ';';
>> +
>>           if (buf[i] == '\n')
>>               buf[i] = ',';
>>       }
>> diff --git a/benchmarks/wsim/README b/benchmarks/wsim/README
>> index 8c71f2fe6..e4fd61645 100644
>> --- a/benchmarks/wsim/README
>> +++ b/benchmarks/wsim/README
>> @@ -1,6 +1,8 @@
>>   Workload descriptor format
>>   ==========================
>> +Lines starting with '#' are treated as comments (do not create work 
>> step).
> 
> Maybe reads better as "..as comments and will not create a work step."
> 
> Regards,
> 
> Tvrtko
> 
>> +
>>   ctx.engine.duration_us.dependency.wait,...
>>   <uint>.<str>.<uint>[-<uint>]|*.<int <= 0>[/<int <= 0>][...].<0|1>,...
>>   B.<uint>
