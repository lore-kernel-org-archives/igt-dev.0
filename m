Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C536610E307
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Apr 2023 14:52:34 +0000 (UTC)
Message-ID: <d41c97d9-c6c8-e1d6-5763-c23e30739c15@linux.intel.com>
Date: Thu, 27 Apr 2023 15:52:29 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20230330003656.1294873-1-umesh.nerlige.ramappa@intel.com>
 <20230330003656.1294873-8-umesh.nerlige.ramappa@intel.com>
 <b814b211-c882-7b46-7afe-506418bc5b0c@linux.intel.com>
 <ZEmUFyCXnaz0rQbh@orsosgc001.jf.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <ZEmUFyCXnaz0rQbh@orsosgc001.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 7/7] tools/intel_gpu_top: Add support
 for gt specific counters
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, badal.nilawar@intel.com,
 arjun.melkaveri@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 26/04/2023 22:13, Umesh Nerlige Ramappa wrote:
> On Thu, Mar 30, 2023 at 10:25:47AM +0100, Tvrtko Ursulin wrote:
>>
>> On 30/03/2023 01:36, Umesh Nerlige Ramappa wrote:
>>> With MTL frequency and rc6 counters are gt specific. Add support for
>>> intel_gpu_top to show these counters separately.
>>>
>>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>> ---
>>>  include/drm-uapi/i915_drm.h | 14 ++++++----
>>>  tools/intel_gpu_top.c       | 56 ++++++++++++++++++++++++++-----------
>>>  2 files changed, 49 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
>>> index 3b5e3b51..1a0c43e7 100644
>>> --- a/include/drm-uapi/i915_drm.h
>>> +++ b/include/drm-uapi/i915_drm.h
>>> @@ -290,6 +290,7 @@ enum drm_i915_pmu_engine_sample {
>>>      (((__u64)__I915_PMU_ENGINE(0xff, 0xff, 0xf) + 1 + (x)) | \
>>>      ((__u64)(gt) << __I915_PMU_GT_SHIFT))
>>> +/* Aggregate from all gts */
>>>  #define __I915_PMU_OTHER(x) ___I915_PMU_OTHER(0, x)
>>>  #define I915_PMU_ACTUAL_FREQUENCY    __I915_PMU_OTHER(0)
>>> @@ -300,11 +301,14 @@ enum drm_i915_pmu_engine_sample {
>>>  #define I915_PMU_LAST /* Deprecated - do not use */ 
>>> I915_PMU_RC6_RESIDENCY
>>> -#define __I915_PMU_ACTUAL_FREQUENCY(gt)        ___I915_PMU_OTHER(gt, 0)
>>> -#define __I915_PMU_REQUESTED_FREQUENCY(gt)    ___I915_PMU_OTHER(gt, 1)
>>> -#define __I915_PMU_INTERRUPTS(gt)        ___I915_PMU_OTHER(gt, 2)
>>> -#define __I915_PMU_RC6_RESIDENCY(gt)        ___I915_PMU_OTHER(gt, 3)
>>> -#define __I915_PMU_SOFTWARE_GT_AWAKE_TIME(gt)    
>>> ___I915_PMU_OTHER(gt, 4)
>>> +/* GT specific counters */
>>> +#define ____I915_PMU_OTHER(gt, x) ___I915_PMU_OTHER(((gt) + 1), x)
>>> +
>>> +#define __I915_PMU_ACTUAL_FREQUENCY(gt)        
>>> ____I915_PMU_OTHER(gt, 0)
>>> +#define __I915_PMU_REQUESTED_FREQUENCY(gt)    ____I915_PMU_OTHER(gt, 1)
>>> +#define __I915_PMU_INTERRUPTS(gt)        ____I915_PMU_OTHER(gt, 2)
>>> +#define __I915_PMU_RC6_RESIDENCY(gt)        ____I915_PMU_OTHER(gt, 3)
>>> +#define __I915_PMU_SOFTWARE_GT_AWAKE_TIME(gt)    
>>> ____I915_PMU_OTHER(gt, 4)
>>>  /* Each region is a minimum of 16k, and there are at most 255 of them.
>>>   */
>>> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
>>> index a4302aa3..9fc8b996 100644
>>> --- a/tools/intel_gpu_top.c
>>> +++ b/tools/intel_gpu_top.c
>>> @@ -87,6 +87,7 @@ struct engine_class {
>>>      unsigned int num_engines;
>>>  };
>>> +#define MAX_GTS 4
>>>  struct engines {
>>>      unsigned int num_engines;
>>>      unsigned int num_classes;
>>> @@ -105,14 +106,16 @@ struct engines {
>>>      struct pmu_counter imc_writes;
>>>      unsigned int num_imc;
>>> -    struct pmu_counter freq_req;
>>> -    struct pmu_counter freq_act;
>>> +    struct pmu_counter freq_req[MAX_GTS];
>>> +    struct pmu_counter freq_act[MAX_GTS];
>>>      struct pmu_counter irq;
>>> -    struct pmu_counter rc6;
>>> +    struct pmu_counter rc6[MAX_GTS];
>>>      bool discrete;
>>>      char *device;
>>> +    int num_gts;
>>> +
>>>      /* Do not edit below this line.
>>>       * This structure is reallocated every time a new engine is
>>>       * found and size is increased by sizeof (engine).
>>> @@ -532,7 +535,7 @@ static void imc_reads_open(struct pmu_counter 
>>> *pmu, struct engines *engines)
>>>  static int pmu_init(struct engines *engines)
>>>  {
>>>      unsigned int i;
>>> -    int fd;
>>> +    int fd, ret;
>>>      uint64_t type = igt_perf_type_id(engines->device);
>>>      engines->fd = -1;
>>> @@ -543,14 +546,30 @@ static int pmu_init(struct engines *engines)
>>>      if (fd < 0)
>>>          return -1;
>>> -    engines->freq_req.config = I915_PMU_REQUESTED_FREQUENCY;
>>> -    _open_pmu(type, engines->num_counters, &engines->freq_req, 
>>> engines->fd);
>>> +    engines->num_gts = 1;
>>> +    for (i = 0; i < MAX_GTS; i++) {
>>> +        engines->freq_req[i].config = 
>>> __I915_PMU_REQUESTED_FREQUENCY(i);
>>> -    engines->freq_act.config = I915_PMU_ACTUAL_FREQUENCY;
>>> -    _open_pmu(type, engines->num_counters, &engines->freq_act, 
>>> engines->fd);
>>> +        errno = 0;
>>> +        ret = _open_pmu(type, engines->num_counters, 
>>> &engines->freq_req[i], engines->fd);
>>> +        if (ret >= 0)
>>> +            continue;
>>> -    engines->rc6.config = I915_PMU_RC6_RESIDENCY;
>>> -    _open_pmu(type, engines->num_counters, &engines->rc6, engines->fd);
>>> +        if (errno != ENOENT)
>>> +            return ret;
>>> +
>>> +        engines->num_gts = i;
>>> +        errno = 0;
>>> +        break;
>>> +    }
>>> +
>>> +    for (i = 0; i < engines->num_gts; i++) {
>>> +        engines->freq_act[i].config = __I915_PMU_ACTUAL_FREQUENCY(i);
>>> +        _open_pmu(type, engines->num_counters, 
>>> &engines->freq_act[i], engines->fd);
>>> +
>>> +        engines->rc6[i].config = __I915_PMU_RC6_RESIDENCY(i);
>>> +        _open_pmu(type, engines->num_counters, &engines->rc6[i], 
>>> engines->fd);
>>> +    }
>>>      for (i = 0; i < engines->num_engines; i++) {
>>>          struct engine *engine = engine_ptr(engines, i);
>>> @@ -653,10 +672,12 @@ static void pmu_sample(struct engines *engines)
>>>      engines->ts.prev = engines->ts.cur;
>>>      engines->ts.cur = pmu_read_multi(engines->fd, num_val, val);
>>> -    update_sample(&engines->freq_req, val);
>>> -    update_sample(&engines->freq_act, val);
>>> +    for (i = 0; i < engines->num_gts; i++) {
>>> +        update_sample(&engines->freq_req[i], val);
>>> +        update_sample(&engines->freq_act[i], val);
>>> +        update_sample(&engines->rc6[i], val);
>>> +    }
>>>      update_sample(&engines->irq, val);
>>> -    update_sample(&engines->rc6, val);
>>>      for (i = 0; i < engines->num_engines; i++) {
>>>          struct engine *engine = engine_ptr(engines, i);
>>> @@ -1727,8 +1748,10 @@ print_header(const struct igt_device_card *card,
>>>          .items = period_items,
>>>      };
>>>      struct cnt_item freq_items[] = {
>>> -        { &engines->freq_req, 4, 0, 1.0, t, 1, "requested", "req" },
>>> -        { &engines->freq_act, 4, 0, 1.0, t, 1, "actual", "act" },
>>> +        { &engines->freq_req[0], 8, 0, 1.0, t, 1, "requested-gt0", 
>>> "req-gt0" },
>>> +        { &engines->freq_act[0], 8, 0, 1.0, t, 1, "actual-gt0", 
>>> "act-gt0" },
>>> +        { &engines->freq_req[1], 8, 0, 1.0, t, 1, "requested-gt1", 
>>> "req-gt1" },
>>> +        { &engines->freq_act[1], 8, 0, 1.0, t, 1, "actual-gt1", 
>>> "act-gt1" },
>>
>> Why is width going to 8? 9999 MHz is not enough? ;)
>>
>> [Comes back later..]
>>
>> Ah for the header label.. hm.. maybe we should try putting the GT 
>> information into the parent. It would looks nicer, be more logical, 
>> even for JSON output we now have:
>>
>> Terminal:
>>
>> Freq MHz      ...
>> req  act      ...
>>
>> JSON:
>>
>>        "rc6": {
>>                "value": 29.309568,
>>                "unit": "%"
>>        },
>> You propose something like:
>>
>> Freq MHz              Freq MHz        ...
>> req-gt0  act-gt0    req-gt0  act-gt0    ...
>>
>>        "rc6": {
>>                "value-gt0": 29.309568,
>>                "value-gt1": 29.309568,
>>                "unit": "%"
>>        },
>>
>> Which is not very nice UI wise. How about something like:
>>
>> Freq GT0 MHz   Freq GT1 MHz    ...
>> req  act    req  act    ...
>>
>> JSON should potentially be an array:
>>
>>        "rc6": [{
>>         "gt": 0,
>>                "value": 29.309568,
>>                "unit": "%"
>>        },
>>         "gt": 0,
>>                "value": 29.309568,
>>                "unit": "%"
>>        }],
>>
>> Or at least:
>>
>>        "rc6": {
>>                "value": 29.309568,
>>                "unit": "%"
>>        },
>>        "rc6-gt1": {
>>                "value": 29.309568,
>>                "unit": "%"
>>        },
>>
>> Which also brings the point if maybe we shouldn't change the output 
>> for pre-MTL platforms. The approach is not IMHO even consistent with 
>> the proposed kernel change to have the aggregated counters, which I 
>> don't think I agree with at all.
>>
>> Let me mull it all over.
> 
> Any further thoughts?

This completely slipped from my radar.

What I definitely think is that as proposed in this patch is a bit 
unsightly and that we really need something nicer.

Maybe we should add tile aggregation to intel_gpu_top, unless user has 
run it with -p, in which case we expand to per tile view (and per engine 
obviously, since that is what we already have)?

That would kind of look nicer on screen, probably, although open would 
be how to aggregate. Probably for frequency and RC6 just normalize by 
number of tiles?

And it would partly solve the problem of the JSON format. In aggregated 
mode we could stick with:

         "rc6": {
                 "value": 29.309568,
                 "unit": "%"
         },

And if "-p" was specified either emit an array or rc6-$tile. Latter is I 
guess more backward compatible but I am not sure if that matters much. 
There could easily be no users of -p in scripts.

If you will be attempting all this probably see if it can be split into 
multiple patches so its easier to review.

I don't have a good idea on how to approach this right now, would need 
to spend a little bit of time to try some things out. Here I am thinking 
if there will be easy ways to toggle aggregation at runtime, by maybe 
some similar tricks as I have for engines, where an aggregated fake list 
of engines is created at the presentation time only, while everything 
internally works of the physical view.

Regards,

Tvrtko

> 
> Thanks,
> Umesh
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>>          { NULL, 0, 0, 0.0, 0.0, 0.0, "unit", "MHz" },
>>>          { },
>>>      };
>>> @@ -1748,7 +1771,8 @@ print_header(const struct igt_device_card *card,
>>>          .items = irq_items,
>>>      };
>>>      struct cnt_item rc6_items[] = {
>>> -        { &engines->rc6, 3, 0, 1e9, t, 100, "value", "%" },
>>> +        { &engines->rc6[0], 6, 0, 1e9, t, 100, "value-gt0", "%-gt0" },
>>> +        { &engines->rc6[1], 6, 0, 1e9, t, 100, "value-gt1", "%-gt1" },
>>>          { NULL, 0, 0, 0.0, 0.0, 0.0, "unit", "%" },
>>>          { },
>>>      };
