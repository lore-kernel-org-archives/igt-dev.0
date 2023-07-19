Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <6772087b-d540-dcca-e6f4-c6ba048c969e@linux.intel.com>
Date: Wed, 19 Jul 2023 09:07:20 +0100
MIME-Version: 1.0
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230718084041.871888-1-tvrtko.ursulin@linux.intel.com>
 <87bkg9hxqa.wl-ashutosh.dixit@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <87bkg9hxqa.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915_pm_rps: Fix test after
 silent conflict harder
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Intel-gfx@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 18/07/2023 19:37, Dixit, Ashutosh wrote:
> On Tue, 18 Jul 2023 01:40:41 -0700, Tvrtko Ursulin wrote:
>>
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Feature test also needs adjusting after sysfs helper API changes...
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Fixes: d86ca7e17b58 ("tests/i915_pm_rps: Exercise sysfs thresholds")
>> Reference: 54dc25efaf10 ("lib/igt_sysfs: add asserting helpers for read/write operations")
>> Reference: 1dfa7a007a8e ("tests/i915_pm_rps: Fix test after silent conflict")
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> ---
>>   tests/i915/i915_pm_rps.c | 9 ++++++---
>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/tests/i915/i915_pm_rps.c b/tests/i915/i915_pm_rps.c
>> index 15c74cc703c2..3ef5842dd7f8 100644
>> --- a/tests/i915/i915_pm_rps.c
>> +++ b/tests/i915/i915_pm_rps.c
>> @@ -1015,20 +1015,23 @@ static void sysfs_set_u32(int dir, const char *attr, uint32_t set)
>>   static void test_thresholds(int i915, unsigned int gt, unsigned int flags)
>>   {
>> 	uint64_t ahnd = get_reloc_ahnd(i915, 0);
>> +	unsigned int def_up = 0, def_down = 0;
>> 	const unsigned int points = 10;
>> -	unsigned int def_up, def_down;
>> 	igt_spin_t *spin = NULL;
>> 	const intel_ctx_t *ctx;
>> 	unsigned int *ta, *tb;
>> 	unsigned int i;
>> 	int sysfs;
>> +	bool ret;
>>
>> 	sysfs = igt_sysfs_gt_open(i915, gt);
>> 	igt_require(sysfs >= 0);
>>
>> 	/* Feature test */
>> -	def_up = igt_sysfs_get_u32(sysfs, "rps_up_threshold_pct");
>> -	def_down = igt_sysfs_get_u32(sysfs, "rps_down_threshold_pct");
>> +	ret = __igt_sysfs_get_u32(sysfs, "rps_up_threshold_pct", &def_up);
>> +	igt_require(ret);
>> +	ret = __igt_sysfs_get_u32(sysfs, "rps_down_threshold_pct", &def_down);
>> +	igt_require(ret);
> 
> Could also use igt_sysfs_has_attr(). Ok as is too.

Getting hard to stay on top of the API richness! :)

> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Thanks for the reviews - pushed to fix the failures.

Regards,

Tvrtko

> 
>> 	igt_require(def_up && def_down);
>>
>> 	/* Check invalid percentages are rejected */
>> --
>> 2.39.2
>>
