Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 518B610E363
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jul 2023 10:38:56 +0000 (UTC)
Message-ID: <3a65db76-ab0b-0a4d-1a5a-59d7f001967e@intel.com>
Date: Tue, 11 Jul 2023 12:38:35 +0200
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20230706060555.282757-1-zbigniew.kempczynski@intel.com>
 <20230706060555.282757-12-zbigniew.kempczynski@intel.com>
 <a97b8206-3b1f-a7df-a8c5-edac4d577e77@intel.com>
 <20230711090632.yrmouv5ajsjhdjrs@zkempczy-mobl2>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <20230711090632.yrmouv5ajsjhdjrs@zkempczy-mobl2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 11/16] lib/intel_ctx: Add xe context
 information
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 11.07.2023 11:06, Zbigniew Kempczyński wrote:
> On Fri, Jul 07, 2023 at 10:31:19AM +0200, Karolina Stolarek wrote:
>> On 6.07.2023 08:05, Zbigniew Kempczyński wrote:
>>> Most complicated part in adopting i915_blt to intel_blt - which should
>>> handle both drivers - is how to achieve pipelined execution. In term
>>> pipelined execution I mean all gpu workloads are executed without
>>> stalls.
>>>
>>> Comparing to i915 relocations and softpinning xe architecture migrates
>>> binding (this means also unbind operation) responsibility from the
>>> kernel to user via vm_bind ioctl(). To avoid stalls user has to
>>> provide in/out fences (syncobjs) between consecutive bindings/execs.
>>> Of course for many igt tests we don't need pipelined execution,
>>> just synchronous bind, then exec. But exercising the driver should
>>> also cover pipelining to verify it is possible to work without stalls.
>>>
>>> I decided to extend intel_ctx_t with all necessary for xe objects
>>> (vm, engine, syncobjs) to get flexibility in deciding how to bind,
>>> execute and wait for (synchronize) those operations. Context object
>>> along with i915 engine is already passed to blitter library so adding
>>> xe required fields doesn't break i915 but will allow xe path to get
>>> all necessary data to execute.
>>>
>>> Using intel_ctx with xe requires some code patterns caused by usage
>>> of an allocator. For xe the allocator started tracking alloc()/free()
>>> operations to do bind/unbind in one call just before execution.
>>> I've added two helpers in intel_ctx which - intel_ctx_xe_exec()
>>> and intel_ctx_xe_sync(). Depending how intel_ctx was created
>>> (with 0 or real syncobj handles as in/bind/out fences) bind and exec
>>> in intel_ctx_xe_exec() are pipelined but synchronize last operation
>>> (exec). For real syncobjs they are used to join bind + exec calls
>>> but there's no wait for exec (sync-out) completion. This allows
>>> building more cascaded bind + exec operations without stalls.
>>>
>>> To wait for a sync-out fence caller may use intel_ctx_xe_sync()
>>> which is synchronous wait on syncobj. It allows user to reset
>>> fences to prepare for next operation.
>>>
>>> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>>> ---
>>>    lib/intel_ctx.c | 110 +++++++++++++++++++++++++++++++++++++++++++++++-
>>>    lib/intel_ctx.h |  14 ++++++
>>>    2 files changed, 123 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/lib/intel_ctx.c b/lib/intel_ctx.c
>>> index ded9c0f1e4..f210907fac 100644
>>> --- a/lib/intel_ctx.c
>>> +++ b/lib/intel_ctx.c
>>> @@ -5,9 +5,12 @@
>>>    #include <stddef.h>
>>> +#include "i915/gem_engine_topology.h"
>>> +#include "igt_syncobj.h"
>>> +#include "intel_allocator.h"
>>>    #include "intel_ctx.h"
>>>    #include "ioctl_wrappers.h"
>>> -#include "i915/gem_engine_topology.h"
>>> +#include "xe/xe_ioctl.h"
>>>    /**
>>>     * SECTION:intel_ctx
>>> @@ -390,3 +393,108 @@ unsigned int intel_ctx_engine_class(const intel_ctx_t *ctx, unsigned int engine)
>>>    {
>>>    	return intel_ctx_cfg_engine_class(&ctx->cfg, engine);
>>>    }
>>> +
>>> +/**
>>> + * intel_ctx_xe:
>>> + * @fd: open i915 drm file descriptor
>>> + * @vm: vm
>>> + * @engine: engine
>>> + *
>>> + * Returns an intel_ctx_t representing the xe context.
>>> + */
>>> +intel_ctx_t *intel_ctx_xe(int fd, uint32_t vm, uint32_t engine,
>>> +			  uint32_t sync_in, uint32_t sync_bind, uint32_t sync_out)
>>> +{
>>> +	intel_ctx_t *ctx;
>>> +
>>> +	ctx = calloc(1, sizeof(*ctx));
>>> +	igt_assert(ctx);
>>> +
>>> +	ctx->fd = fd;
>>> +	ctx->vm = vm;
>>> +	ctx->engine = engine;
>>> +	ctx->sync_in = sync_in;
>>> +	ctx->sync_bind = sync_bind;
>>> +	ctx->sync_out = sync_out;
>>> +
>>> +	return ctx;
>>> +}
>>> +
>>> +static int __xe_exec(int fd, struct drm_xe_exec *exec)
>>> +{
>>> +	int err = 0;
>>> +
>>> +	if (igt_ioctl(fd, DRM_IOCTL_XE_EXEC, exec)) {
>>> +		err = -errno;
>>> +		igt_assume(err != 0);
>>
>> Wouldn't "igt_assume(err)" be enough?
>>
>>> +	}
>>> +	errno = 0;
>>> +	return err;
>>> +}
>>
>> I'm aware that it's a helper that you use in other execs, but it feels out
>> of place, it doesn't deal with intel_ctx_t. Maybe xe_util could be its new
>> home?
>>
> 
> I'm going to just export __xe_exec() from xe_ioctl.c.

That's even a better idea, thanks

> 
>>> +
>>> +int __intel_ctx_xe_exec(const intel_ctx_t *ctx, uint64_t ahnd, uint64_t bb_offset)
>>> +{
>>> +	struct drm_xe_sync syncs[2] = {
>>> +		{ .flags = DRM_XE_SYNC_SYNCOBJ, },
>>> +		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
>>> +	};
>>> +	struct drm_xe_exec exec = {
>>> +		.engine_id = ctx->engine,
>>> +		.syncs = (uintptr_t)syncs,
>>> +		.num_syncs = 2,
>>> +		.address = bb_offset,
>>> +		.num_batch_buffer = 1,
>>> +	};
>>> +	uint32_t sync_in = ctx->sync_in;
>>> +	uint32_t sync_bind = ctx->sync_bind ?: syncobj_create(ctx->fd, 0);
>>> +	uint32_t sync_out = ctx->sync_out ?: syncobj_create(ctx->fd, 0);
>>> +	int ret;
>>> +
>>> +	/* Synchronize allocator state -> vm */
>>> +	intel_allocator_bind(ahnd, sync_in, sync_bind);
>>> +
>>> +	/* Pipelined exec */
>>> +	syncs[0].handle = sync_bind;
>>> +	syncs[1].handle = sync_out;
>>> +
>>> +	ret = __xe_exec(ctx->fd, &exec);
>>> +	if (ret)
>>> +		goto err;
>>> +
>>> +	if (!ctx->sync_bind || !ctx->sync_out)
>>> +		syncobj_wait_err(ctx->fd, &sync_out, 1, INT64_MAX, 0);
>>
>> This whole flow is so nice and tidy, I like it
>>
>>> +
>>> +err:
>>> +	if (!ctx->sync_bind)
>>> +		syncobj_destroy(ctx->fd, sync_bind);
>>> +
>>> +	if (!ctx->sync_out)
>>> +		syncobj_destroy(ctx->fd, sync_out);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +void intel_ctx_xe_exec(const intel_ctx_t *ctx, uint64_t ahnd, uint64_t bb_offset)
>>> +{
>>> +	igt_assert_eq(__intel_ctx_xe_exec(ctx, ahnd, bb_offset), 0);
>>> +}
>>> +
>>> +#define RESET_SYNCOBJ(__fd, __sync) do { \
>>> +	if (__sync) \
>>> +		syncobj_reset((__fd), &(__sync), 1); \
>>> +} while (0)
>>> +
>>> +int intel_ctx_xe_sync(intel_ctx_t *ctx, bool reset_syncs)
>>> +{
>>> +	int ret;
>>> +
>>> +	ret = syncobj_wait_err(ctx->fd, &ctx->sync_out, 1, INT64_MAX, 0);
>>> +
>>> +	if (reset_syncs) {
>>> +		RESET_SYNCOBJ(ctx->fd, ctx->sync_in);
>>> +		RESET_SYNCOBJ(ctx->fd, ctx->sync_bind);
>>> +		RESET_SYNCOBJ(ctx->fd, ctx->sync_out);
>>> +	}
>>
>> Is there a usecase where we want to do a synced execution without resetting
>> syncobjs?
>>
> 
> I don't know - that's I left decision to the user.

:) If there won't be a client for this functionality, we could drop it 
in the future

> 
>>> +
>>> +	return ret;
>>> +}
>>> diff --git a/lib/intel_ctx.h b/lib/intel_ctx.h
>>> index 3cfeaae81e..59d0360ada 100644
>>> --- a/lib/intel_ctx.h
>>> +++ b/lib/intel_ctx.h
>>> @@ -67,6 +67,14 @@ int intel_ctx_cfg_engine_class(const intel_ctx_cfg_t *cfg, unsigned int engine);
>>>    typedef struct intel_ctx {
>>>    	uint32_t id;
>>>    	intel_ctx_cfg_t cfg;
>>> +
>>> +	/* Xe */
>>> +	int fd;
>>> +	uint32_t vm;
>>> +	uint32_t engine;
>>> +	uint32_t sync_in;
>>> +	uint32_t sync_bind;
>>> +	uint32_t sync_out;
>>
>> Hmm, I wonder if we could wrap it in a struct. Yes, it would be painful to
>> unpack, but now it feels like we've just added a bunch of fields that are
>> irrelevant 80% of the time. Instead, we could have one additional field that
>> could be NULL, and use it if it's initialized.
>> But maybe I'm just being too nit-picky.
> 
> I wondered to introduce union of i915 and xe structs, but I would need
> to rewrite almost all igt's which are using this struct so I dropped
> this idea. At the moment I need to handle both drivers so mixing
> fields is not a big pain imo.

Oh my, that would be painful indeed. I mean, I won't nack the mixed 
fields, but I just find it strange to leave them in the open when we're 
testing i915 stuff.

All the best,
Karolina

> 
> --
> Zbigniew
> 
>>
>> All the best,
>> Karolina
>>
>>>    } intel_ctx_t;
>>>    int __intel_ctx_create(int fd, const intel_ctx_cfg_t *cfg,
>>> @@ -81,4 +89,10 @@ void intel_ctx_destroy(int fd, const intel_ctx_t *ctx);
>>>    unsigned int intel_ctx_engine_class(const intel_ctx_t *ctx, unsigned int engine);
>>> +intel_ctx_t *intel_ctx_xe(int fd, uint32_t vm, uint32_t engine,
>>> +			  uint32_t sync_in, uint32_t sync_bind, uint32_t sync_out);
>>> +int __intel_ctx_xe_exec(const intel_ctx_t *ctx, uint64_t ahnd, uint64_t bb_offset);
>>> +void intel_ctx_xe_exec(const intel_ctx_t *ctx, uint64_t ahnd, uint64_t bb_offset);
>>> +int intel_ctx_xe_sync(intel_ctx_t *ctx, bool reset_syncs);
>>> +
>>>    #endif
