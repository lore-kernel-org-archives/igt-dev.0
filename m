Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76F56E233
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2020 20:41:25 +0000 (UTC)
References: <20200210193908.1754-1-antonio.argenziano@intel.com>
 <158136652484.5235.15265352592478927262@skylake-alporthouse-com>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <d0f50a44-de04-6a6a-1618-8503b9332e48@intel.com>
Date: Mon, 10 Feb 2020 12:41:25 -0800
MIME-Version: 1.0
In-Reply-To: <158136652484.5235.15265352592478927262@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_exec_balancer: Skip the
 test if no engines are available
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
List-ID: <igt-dev@lists.freedesktop.org>



On 10/02/20 12:28, Chris Wilson wrote:
> Quoting Antonio Argenziano (2020-02-10 19:39:08)
>> The test needs to have at least some engines to run, if no engines are
>> present flag it as a skip rather than have a pass. This patch also fixes
>> the error check for perf_i915_open().
>>
>> Signed-off-by: Antonio Argenziano <antonio.argenziano@intel.com>
>>
>> Cc: Chris Wilson <chris@chris-wilson.co.uk>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> ---
>>   tests/i915/gem_exec_balancer.c | 20 +++++++++++++++++++-
>>   1 file changed, 19 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
>> index 150eba0d..df816feb 100644
>> --- a/tests/i915/gem_exec_balancer.c
>> +++ b/tests/i915/gem_exec_balancer.c
>> @@ -61,7 +61,7 @@ static bool has_class_instance(int i915, uint16_t class, uint16_t instance)
>>          int fd;
>>   
>>          fd = perf_i915_open(i915, I915_PMU_ENGINE_BUSY(class, instance));
>> -       if (fd != -1) {
>> +       if (fd >= 0) {
>>                  close(fd);
>>                  return true;
>>          }
>> @@ -113,6 +113,23 @@ list_engines(int i915, uint32_t class_mask, unsigned int *out)
>>          return engines;
>>   }
>>   
>> +static bool has_engines(int i915)
>> +{
> 
> igt_require(igt_i915_perf_type(i915)); /* or whatever it was called */ ?

Keep it in the fixture?

Antonio

> -Chris
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
