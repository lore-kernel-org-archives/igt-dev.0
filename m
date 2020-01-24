Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20200124121759.22308-1-tvrtko.ursulin@linux.intel.com>
 <157986861487.2524.12141917333565358192@skylake-alporthouse-com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <9593ea49-ceb1-011a-bcd9-e194bf0eda9c@linux.intel.com>
Date: Fri, 24 Jan 2020 12:26:31 +0000
MIME-Version: 1.0
In-Reply-To: <157986861487.2524.12141917333565358192@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/i915: Add helper for copying
 engine maps from one context to another
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
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>


On 24/01/2020 12:23, Chris Wilson wrote:
> Quoting Tvrtko Ursulin (2020-01-24 12:17:58)
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> We also need to support copying across file descriptors.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Chris Wilson <chris@chris-wilson.co.uk>
>> Cc: Sreedhar Telukuntla <sreedhar.telukuntla@intel.com>
>> ---
>>   lib/i915/gem_context.c | 30 ++++++++++++++++++++++++++++++
>>   lib/i915/gem_context.h |  2 ++
>>   2 files changed, 32 insertions(+)
>>
>> diff --git a/lib/i915/gem_context.c b/lib/i915/gem_context.c
>> index 0b6a554dfe27..41957b66ca52 100644
>> --- a/lib/i915/gem_context.c
>> +++ b/lib/i915/gem_context.c
>> @@ -462,3 +462,33 @@ bool gem_context_has_engine(int fd, uint32_t ctx, uint64_t engine)
>>   
>>          return __gem_execbuf(fd, &execbuf) == -ENOENT;
>>   }
>> +
>> +/**
>> + * gem_context_copy_engines:
>> + * @src_fd: open i915 drm file descriptor where @src context belongs to
>> + * @src: source engine map context id
>> + * @dst_fd: open i915 drm file descriptor where @dst context belongs to
>> + * @dst: destination engine map context id
>> + *
>> + * Special purpose wrapper for copying engine map from one context to another.
>> + *
>> + * In can be called regardless of whether the kernel supports context engine
>> + * maps and is a no-op if not supported.
>> + */
>> +void
>> +gem_context_copy_engines(int src_fd, uint32_t src, int dst_fd, uint32_t dst)
>> +{
>> +       I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, I915_EXEC_RING_MASK + 1);
>> +       struct drm_i915_gem_context_param param = {
>> +               .param = I915_CONTEXT_PARAM_ENGINES,
>> +               .ctx_id = src,
>> +               .size = sizeof(engines),
>> +               .value = to_user_pointer(&engines),
>> +       };
>> +
>> +       if (__gem_context_get_param(src_fd, &param) || !param.size)
>> +               return;
>> +
>> +       param.ctx_id = dst;
>> +       gem_context_set_param(dst_fd, &param);
> 
> You don't want to copy across the use-default set? You presume dst is
> already using defaults?

Hm hm.. not sure. I guess it would be most in-line with what the helper 
say on the tin to copy as is. I'll respin.

Regards,

Tvrtko
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
