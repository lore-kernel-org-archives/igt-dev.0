Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD8D10E098
 for <igt-dev@lists.freedesktop.org>; Wed, 24 May 2023 18:29:48 +0000 (UTC)
Message-ID: <636a0963-44fd-f4d6-c98e-93377d6a42da@intel.com>
Date: Wed, 24 May 2023 20:29:42 +0200
MIME-Version: 1.0
Content-Language: en-US
To: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20230524113836.1029582-1-christoph.manszewski@intel.com>
 <c8a9fadb65810a77bd572c7850ad945a1a9cb372.camel@intel.com>
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
In-Reply-To: <c8a9fadb65810a77bd572c7850ad945a1a9cb372.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t v2] lib/intel_bb: Enable custom engine
 support for xe
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

Hi Dominik,

On 24.05.2023 17:32, Grzegorzek, Dominik wrote:
> On Wed, 2023-05-24 at 13:38 +0200, Christoph Manszewski wrote:
>> Currently the 'ctx' field in batch buffer creation is interpreted as
>> a vm id for xe. In i915 it is interpreted as a context id. Since a xe
>> engine more closely resembles an i915 context, change the current
>> behaviour and interpret the 'ctx' fied as an xe engine id. This also
>> allows us to use the compute engine on xe, which currently is not
>> possible, due to reliance on legacy i915 flags.
>>
>> v2:
>>   - don't destroy user provided engine in 'intel_bb_destroy' (Zbigniew)
>>   - destroy internally created engine before creating a new one
>>
>> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
>> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>> ---
>>   lib/intel_batchbuffer.c | 27 +++++++++++++++++++--------
>>   tests/xe/xe_intel_bb.c  |  7 +++++--
>>   2 files changed, 24 insertions(+), 10 deletions(-)
>>
>> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
>> index dfccc4f4..d6a44d7e 100644
>> --- a/lib/intel_batchbuffer.c
>> +++ b/lib/intel_batchbuffer.c
>> @@ -946,15 +946,13 @@ __intel_bb_create(int fd, uint32_t ctx, const intel_ctx_cfg_t *cfg,
>>   		ibb->gtt_size = 1ull << min_t(uint32_t, xe_va_bits(fd), 48);
>>   		end = ibb->gtt_size;
>>   
>> -		if (!ctx)
>> -			ctx = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
>> +		ibb->vm_id = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> 
> As I see ibb->vm_id is used for vm_bind. So we pass xe_engine, which has it own vm under the hood,
> and we use it in execbuf. At the same time we are binding objects to new, completly different vm.
> Do I miss sth here?

Nope, looks like I did :$


> 
> In i915, an intel_bb could live without knowledge which vm hides behind the context,
> as it was not using vm_bind. Here I think we would need to have both passed by the caller.

You're right, unless there is a way to get the vm id for a specific xe 
engine, we need to pass it too, maybe through the means of the "cfg" 
parameter.

Thanks,
Christoph


> 
> Regards,
> Dominik
> 
> 
> 
>>   
>>   		ibb->uses_full_ppgtt = true;
>>   		ibb->allocator_handle =
>> -			intel_allocator_open_full(fd, ctx, start, end,
>> +			intel_allocator_open_full(fd, ibb->vm_id, start, end,
>>   						  allocator_type, strategy,
>>   						  ibb->alignment);
>> -		ibb->vm_id = ctx;
>>   		ibb->last_engine = ~0U;
>>   	}
>>   
>> @@ -1228,6 +1226,14 @@ static void __intel_bb_remove_intel_bufs(struct intel_bb *ibb)
>>   		intel_bb_remove_intel_buf(ibb, entry);
>>   }
>>   
>> +static void __xe_bb_destroy(struct intel_bb *ibb)
>> +{
>> +	if (ibb->engine_id)
>> +		xe_engine_destroy(ibb->fd, ibb->engine_id);
>> +	if (ibb->vm_id)
>> +		xe_vm_destroy(ibb->fd, ibb->vm_id);
>> +}
>> +
>>   /**
>>    * intel_bb_destroy:
>>    * @ibb: pointer to intel_bb
>> @@ -1262,8 +1268,8 @@ void intel_bb_destroy(struct intel_bb *ibb)
>>   		close(ibb->fence);
>>   	if (ibb->engine_syncobj)
>>   		syncobj_destroy(ibb->fd, ibb->engine_syncobj);
>> -	if (ibb->vm_id && !ibb->ctx)
>> -		xe_vm_destroy(ibb->fd, ibb->vm_id);
>> +	if (ibb->driver == INTEL_DRIVER_XE)
>> +		__xe_bb_destroy(ibb);
>>   
>>   	free(ibb->batch);
>>   	free(ibb->cfg);
>> @@ -2298,7 +2304,9 @@ __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
>>   	igt_assert_eq(ibb->num_relocs, 0);
>>   	igt_assert_eq(ibb->xe_bound, false);
>>   
>> -	if (ibb->last_engine != engine) {
>> +	if (ibb->ctx) {
>> +		engine_id = ibb->ctx;
>> +	} else if (ibb->last_engine != engine) {
>>   		struct drm_xe_engine_class_instance inst = { };
>>   
>>   		inst.engine_instance =
>> @@ -2323,12 +2331,15 @@ __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
>>   		}
>>   		igt_debug("Run on %s\n", xe_engine_class_string(inst.engine_class));
>>   
>> +		if (ibb->engine_id)
>> +			xe_engine_destroy(ibb->fd, ibb->engine_id);
>> +
>>   		ibb->engine_id = engine_id =
>>   			xe_engine_create(ibb->fd, ibb->vm_id, &inst, 0);
>> +		ibb->last_engine = engine;
>>   	} else {
>>   		engine_id = ibb->engine_id;
>>   	}
>> -	ibb->last_engine = engine;
>>   
>>   	map = xe_bo_map(ibb->fd, ibb->handle, ibb->size);
>>   	memcpy(map, ibb->batch, ibb->size);
>> diff --git a/tests/xe/xe_intel_bb.c b/tests/xe/xe_intel_bb.c
>> index 35d61608..4fcc3144 100644
>> --- a/tests/xe/xe_intel_bb.c
>> +++ b/tests/xe/xe_intel_bb.c
>> @@ -177,6 +177,7 @@ static void simple_bb(struct buf_ops *bops, bool new_context)
>>   	int xe = buf_ops_get_fd(bops);
>>   	struct intel_bb *ibb;
>>   	uint32_t ctx = 0;
>> +	uint32_t vm = 0;
>>   
>>   	ibb = intel_bb_create_with_allocator(xe, ctx, NULL, PAGE_SIZE,
>>   					     INTEL_ALLOCATOR_SIMPLE);
>> @@ -195,7 +196,8 @@ static void simple_bb(struct buf_ops *bops, bool new_context)
>>   	intel_bb_reset(ibb, true);
>>   
>>   	if (new_context) {
>> -		ctx = xe_vm_create(xe, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
>> +		vm = xe_vm_create(xe, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
>> +		ctx = xe_engine_create(xe, vm, xe_hw_engine(xe, 0), 0);
>>   		intel_bb_destroy(ibb);
>>   		ibb = intel_bb_create_with_context(xe, ctx, NULL, PAGE_SIZE);
>>   		intel_bb_out(ibb, MI_BATCH_BUFFER_END);
>> @@ -203,7 +205,8 @@ static void simple_bb(struct buf_ops *bops, bool new_context)
>>   		intel_bb_exec(ibb, intel_bb_offset(ibb),
>>   			      I915_EXEC_DEFAULT | I915_EXEC_NO_RELOC,
>>   			      true);
>> -		xe_vm_destroy(xe, ctx);
>> +		xe_engine_destroy(xe, ctx);
>> +		xe_vm_destroy(xe, vm);
>>   	}
>>   
>>   	intel_bb_destroy(ibb);
> 
