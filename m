Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20200122101043.21347-1-tvrtko.ursulin@linux.intel.com>
 <20200122144028.27346-1-tvrtko.ursulin@linux.intel.com>
 <157970441989.7477.13168128747438871488@skylake-alporthouse-com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <dcadd92b-5f5b-ac99-d6c4-ed9beb19f6ca@linux.intel.com>
Date: Wed, 22 Jan 2020 14:53:24 +0000
MIME-Version: 1.0
In-Reply-To: <157970441989.7477.13168128747438871488@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v2] i915/gem_engine_topology: Generate
 engine names based on class
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
Cc: Intel-gfx@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>


On 22/01/2020 14:46, Chris Wilson wrote:
> Quoting Tvrtko Ursulin (2020-01-22 14:40:28)
>>   static void init_engine(struct intel_execution_engine2 *e2,
>>                          int class, int instance, uint64_t flags)
>>   {
>> -       const struct intel_execution_engine2 *__e2;
>> -       static const char *unknown_name = "unknown",
>> -                         *virtual_name = "virtual";
>> +       int ret;
>>   
>>          e2->class    = class;
>>          e2->instance = instance;
>> -       e2->flags    = flags;
>>   
>>          /* engine is a virtual engine */
>>          if (class == I915_ENGINE_CLASS_INVALID &&
>>              instance == I915_ENGINE_CLASS_INVALID_VIRTUAL) {
> 
> Can this ever match?  instance is 65534 and INVALID_VIRTUAL is -2.
> int class/instance should be u16?

Yeah, no it can't ever match. I'll have a look how easy to change it all 
to struct i915_engine_class_instance.

Regards,

Tvrtko


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
