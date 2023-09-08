Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8659F10E8AF
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 13:22:48 +0000 (UTC)
Message-ID: <5aa0f52f-72e8-e02b-7ebb-d201bc3ae082@linux.intel.com>
Date: Fri, 8 Sep 2023 15:22:44 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 lukasz.laguna@intel.com
References: <20230905150225.2029554-1-marcin.bernatowicz@linux.intel.com>
 <20230905150225.2029554-3-marcin.bernatowicz@linux.intel.com>
 <20230908121451.a5ugqirxiu7zou2i@kamilkon-desk.igk.intel.com>
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20230908121451.a5ugqirxiu7zou2i@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v3 2/3] lib/xe_spin: fixed duration
 xe_spin capability
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 9/8/2023 2:14 PM, Kamil Konieczny wrote:
> Hi Marcin,
> 
> few nits from checkpatch.pl, see below.

Thanks, I'll send a next version with one additional patch for 
checkpatch error in xe_spin_wait_started.

--
marcin

> 
> On 2023-09-05 at 15:02:24 +0000, Marcin Bernatowicz wrote:
>> Extended spinner with fixed duration capability. It allows
>> to prepare fixed duration (ex. 10ms) workloads and take workloads/second
>> measurements, a handy utility for scheduling tests.
>>
>> v2: - added asserts in div64_u64_round_up, duration_to_ctx_ticks,
>>        simplified loop_addr (Zbyszek)
>>      - corrected patch title (Kamil)
>>
>> v3: - div64_u64_round_up assert on overflow (Kamil)
>>      - enum indentation cleanup in xe_spin.c (Kamil)
>>
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> ---
>>   lib/xe/xe_spin.c | 97 +++++++++++++++++++++++++++++++++++++++++++++++-
>>   lib/xe/xe_spin.h |  8 +++-
>>   2 files changed, 103 insertions(+), 2 deletions(-)
>>
>> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
>> index 27f837ef9..54ae2d3ac 100644
>> --- a/lib/xe/xe_spin.c
>> +++ b/lib/xe/xe_spin.c
>> @@ -16,6 +16,50 @@
>>   #include "xe_ioctl.h"
>>   #include "xe_spin.h"
>>   
>> +static uint32_t read_timestamp_frequency(int fd, int gt_id)
>> +{
>> +	struct xe_device *dev = xe_device_get(fd);
>> +
>> +	igt_assert(dev && dev->gts && dev->gts->num_gt);
>> +	igt_assert(gt_id >= 0 && gt_id <= dev->gts->num_gt);
>> +
>> +	return dev->gts->gts[gt_id].clock_freq;
>> +}
>> +
>> +static uint64_t div64_u64_round_up(const uint64_t x, const uint64_t y)
>> +{
>> +	igt_assert(y > 0);
>> +	igt_assert_lte_u64(x, UINT64_MAX - (y - 1));
>> +
>> +	return (x + y - 1) / y;
>> +}
>> +
>> +/**
>> + * duration_to_ctx_ticks:
>> + * @fd: opened device
>> + * @gt_id: tile id
>> + * @duration_ns: duration in nanoseconds to be converted to context timestamp ticks
>> + * @return: duration converted to context timestamp ticks.
>> + */
>> +uint32_t duration_to_ctx_ticks(int fd, int gt_id, uint64_t duration_ns)
>> +{
>> +	uint32_t f = read_timestamp_frequency(fd, gt_id);
>> +	uint64_t ctx_ticks = div64_u64_round_up(duration_ns * f, NSEC_PER_SEC);
>> +
>> +	igt_assert_lt_u64(ctx_ticks, XE_SPIN_MAX_CTX_TICKS);
>> +
>> +	return ctx_ticks;
>> +}
>> +
>> +#define MI_SRM_CS_MMIO				(1 << 19)
>> +#define MI_LRI_CS_MMIO				(1 << 19)
>> +#define MI_LRR_DST_CS_MMIO			(1 << 19)
>> +#define MI_LRR_SRC_CS_MMIO			(1 << 18)
>> +#define CTX_TIMESTAMP 0x3a8;
> ----------------------------- ^
> Remove it, s/;//
> 
>> +#define CS_GPR(x) (0x600 + 8 * (x))
>> +
>> +enum { START_TS, NOW_TS };
>> +
>>   /**
>>    * xe_spin_init:
>>    * @spin: pointer to mapped bo in which spinner code will be written
>> @@ -23,13 +67,28 @@
>>    */
>>   void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
>>   {
>> -	uint64_t loop_addr = opts->addr + offsetof(struct xe_spin, batch);
>> +	uint64_t loop_addr;
>>   	uint64_t start_addr = opts->addr + offsetof(struct xe_spin, start);
>>   	uint64_t end_addr = opts->addr + offsetof(struct xe_spin, end);
>> +	uint64_t ticks_delta_addr = opts->addr + offsetof(struct xe_spin, ticks_delta);
>> +	uint64_t pad_addr = opts->addr + offsetof(struct xe_spin, pad);
>>   	int b = 0;
>>   
>>   	spin->start = 0;
>>   	spin->end = 0xffffffff;
>> +	spin->ticks_delta = 0;
>> +
>> +	if (opts->ctx_ticks) {
>> +		/* store start timestamp */
>> +		spin->batch[b++] = MI_LOAD_REGISTER_IMM(1) | MI_LRI_CS_MMIO;
>> +		spin->batch[b++] = CS_GPR(START_TS) + 4;
>> +		spin->batch[b++] = 0;
>> +		spin->batch[b++] = MI_LOAD_REGISTER_REG | MI_LRR_DST_CS_MMIO | MI_LRR_SRC_CS_MMIO;
>> +		spin->batch[b++] = CTX_TIMESTAMP;
>> +		spin->batch[b++] = CS_GPR(START_TS);
>> +	}
>> +
>> +	loop_addr = opts->addr + b * sizeof(uint32_t);
>>   
>>   	spin->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>>   	spin->batch[b++] = start_addr;
>> @@ -39,6 +98,42 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
>>   	if (opts->preempt)
>>   		spin->batch[b++] = (0x5 << 23);
>>   
>> +	if (opts->ctx_ticks) {
>> +		spin->batch[b++] = MI_LOAD_REGISTER_IMM(1) | MI_LRI_CS_MMIO;
>> +		spin->batch[b++] = CS_GPR(NOW_TS) + 4;
>> +		spin->batch[b++] = 0;
>> +		spin->batch[b++] = MI_LOAD_REGISTER_REG | MI_LRR_DST_CS_MMIO | MI_LRR_SRC_CS_MMIO;
>> +		spin->batch[b++] = CTX_TIMESTAMP;
>> +		spin->batch[b++] = CS_GPR(NOW_TS);
>> +
>> +		/* delta = now - start; inverted to match COND_BBE */
>> +		spin->batch[b++] = MI_MATH(4);
>> +		spin->batch[b++] = MI_MATH_LOAD(MI_MATH_REG_SRCA, MI_MATH_REG(NOW_TS));
>> +		spin->batch[b++] = MI_MATH_LOAD(MI_MATH_REG_SRCB, MI_MATH_REG(START_TS));
>> +		spin->batch[b++] = MI_MATH_SUB;
>> +		spin->batch[b++] = MI_MATH_STOREINV(MI_MATH_REG(NOW_TS), MI_MATH_REG_ACCU);
>> +
>> +		/* Save delta for reading by COND_BBE */
>> +		spin->batch[b++] = MI_STORE_REGISTER_MEM | MI_SRM_CS_MMIO | 2;
>> +		spin->batch[b++] = CS_GPR(NOW_TS);
>> +		spin->batch[b++] = ticks_delta_addr;
>> +		spin->batch[b++] = ticks_delta_addr >> 32;
>> +
>> +		/* Delay between SRM and COND_BBE to post the writes */
>> +		for (int n = 0; n < 8; n++) {
>> +			spin->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>> +			spin->batch[b++] = pad_addr;
>> +			spin->batch[b++] = pad_addr >> 32;
>> +			spin->batch[b++] = 0xc0ffee;
>> +		}
>> +
>> +		/* Break if delta [time elapsed] > ns */
>> +		spin->batch[b++] = MI_COND_BATCH_BUFFER_END | MI_DO_COMPARE | 2;
>> +		spin->batch[b++] = ~(opts->ctx_ticks);
>> +		spin->batch[b++] = ticks_delta_addr;
>> +		spin->batch[b++] = ticks_delta_addr >> 32;
>> +	}
>> +
>>   	spin->batch[b++] = MI_COND_BATCH_BUFFER_END | MI_DO_COMPARE | 2;
>>   	spin->batch[b++] = 0;
>>   	spin->batch[b++] = end_addr;
>> diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
>> index 9f1d33294..f1abc1102 100644
>> --- a/lib/xe/xe_spin.h
>> +++ b/lib/xe/xe_spin.h
>> @@ -15,27 +15,33 @@
>>   #include "xe_query.h"
>>   #include "lib/igt_dummyload.h"
>>   
>> +#define XE_SPIN_MAX_CTX_TICKS UINT32_MAX - 1000
> -------------------------------- ^^^^^^^^^^^^^^^^^
> Put in braces:
> 
> #define XE_SPIN_MAX_CTX_TICKS (UINT32_MAX - 1000)
> 
> Regards,
> Kamil
> 
>> +
>>   /** struct xe_spin_opts
>>    *
>>    * @addr: offset of spinner within vm
>>    * @preempt: allow spinner to be preempted or not
>> + * @ctx_ticks: number of ticks after which spinner is stopped, applied if > 0
>>    *
>>    * Used to initialize struct xe_spin spinner behavior.
>>    */
>>   struct xe_spin_opts {
>>   	uint64_t addr;
>>   	bool preempt;
>> +	uint32_t ctx_ticks;
>>   };
>>   
>>   /* Mapped GPU object */
>>   struct xe_spin {
>> -	uint32_t batch[16];
>> +	uint32_t batch[128];
>>   	uint64_t pad;
>>   	uint32_t start;
>>   	uint32_t end;
>> +	uint32_t ticks_delta;
>>   };
>>   
>>   igt_spin_t *xe_spin_create(int fd, const struct igt_spin_factory *opt);
>> +uint32_t duration_to_ctx_ticks(int fd, int gt_id, uint64_t ns);
>>   void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts);
>>   
>>   #define xe_spin_init_opts(fd, ...) \
>> -- 
>> 2.30.2
>>
