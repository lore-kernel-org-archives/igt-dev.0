Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB9F10E227
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Nov 2022 18:25:47 +0000 (UTC)
Message-ID: <fe879709-46a2-a875-99a4-cb929ec87e87@intel.com>
Date: Fri, 18 Nov 2022 10:25:40 -0800
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Vikas Srivastava
 <vikas.srivastava@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, Priyanka Dandamudi
 <priyanka.dandamudi@intel.com>
References: <20221116103706.1492876-1-vikas.srivastava@intel.com>
 <Y3ZYphN7f2BMYhdY@kamilkon-desk1>
Content-Language: en-US
From: "Ye, Tony" <tony.ye@intel.com>
In-Reply-To: <Y3ZYphN7f2BMYhdY@kamilkon-desk1>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] lib: Remove deprecated interfaces
 from huc_copy for Gen12+ platforms.
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


On 11/17/2022 7:52 AM, Kamil Konieczny wrote:
> Hi,
>
> please change subject of this commit, there are no changes
> in old huc_copy in this patch. Also remove dot from end of
> the Subject: line, s/platforms./platforms/
>
> On 2022-11-16 at 16:07:06 +0530, Vikas Srivastava wrote:
>> From: "Ye, Tony" <tony.ye@intel.com>
>>
>> Stop using relocs and the legacy execbuf flags.
> You should put here a little more explanation, as I see this it
> is rather
>
> Add new huc_copy for gen12+ with no-relocs and no legacy flags
>
> and there are no changes in old code (except for adding that
> AT_LEAST_GEN(12)).

The patch is to switch to softpin from relocations in the huc_copy test 
on Gen12+. The old platforms stay with relocations. See the change in 
the igt_get_huc_copyfunc function.


>
>> Signed-off-by: "Ye, Tony" <tony.ye@intel.com>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Acked-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>>
>> ---
>>   lib/huc_copy.c          | 77 +++++++++++++++++++++++++++++++++++++++++
>>   lib/huc_copy.h          |  4 +++
>>   lib/intel_batchbuffer.c |  8 +++--
>>   3 files changed, 87 insertions(+), 2 deletions(-)
>>
>> diff --git a/lib/huc_copy.c b/lib/huc_copy.c
>> index 6ec68864b..3b011a305 100644
>> --- a/lib/huc_copy.c
>> +++ b/lib/huc_copy.c
>> @@ -26,6 +26,8 @@
>>   #include "drmtest.h"
>>   #include "huc_copy.h"
>>   #include "intel_allocator.h"
>> +#include "intel_ctx.h"
>> +#include "i915/gem_engine_topology.h"
>>   
>>   static void
>>   gen9_emit_huc_virtual_addr_state(struct drm_i915_gem_exec_object2 *src,
>> @@ -123,3 +125,78 @@ gen9_huc_copyfunc(int fd, uint64_t ahnd,
>>   
>>   	gem_execbuf(fd, &execbuf);
>>   }
>> +
>> +static void
>> +gen12_emit_huc_virtual_addr_state(struct drm_i915_gem_exec_object2 *src,
>> +		struct drm_i915_gem_exec_object2 *dst,
>> +		uint32_t *buf,
>> +		int *i)
>> +{
>> +	buf[(*i)++] = HUC_VIRTUAL_ADDR_STATE;
>> +
>> +	for (int j = 0; j < HUC_VIRTUAL_ADDR_REGION_NUM; j++) {
>> +		if (j == HUC_VIRTUAL_ADDR_REGION_SRC) {
>> +			buf[(*i)++] = src->offset;
> Addr is 48-bit and here we copy only lower 32-bit,
> this may work with relocs but not with pinned addresses.


The test only uses 3 addresses: 2M, 4M, 6M. So 48b flag is not set and 
we only copy the lower 32 bits.


>
>> +		} else if (j == HUC_VIRTUAL_ADDR_REGION_DST) {
>> +			buf[(*i)++] = dst->offset;
> Same here.
>
>> +		} else {
>> +			buf[(*i)++] = 0;
>> +		}
>> +		buf[(*i)++] = 0;
>> +		buf[(*i)++] = 0;
>> +	}
>> +}
>> +
>> +void
>> +gen12_huc_copyfunc(int fd, uint64_t ahnd,
>> +		  struct drm_i915_gem_exec_object2 *obj, uint64_t *objsize)
>> +{
>> +	struct drm_i915_gem_execbuffer2 execbuf;
>> +	int i = 0;
>> +	uint32_t buf[63];
>> +	const intel_ctx_t *ctx;
>> +
>> +	/* load huc kernel */
>> +	buf[i++] = HUC_IMEM_STATE;
>> +	buf[i++] = 0;
>> +	buf[i++] = 0;
>> +	buf[i++] = 0;
>> +	buf[i++] = 0x3;
>> +
>> +	buf[i++] = MFX_WAIT;
>> +	buf[i++] = MFX_WAIT;
>> +
>> +	buf[i++] = HUC_PIPE_MODE_SELECT;
>> +	buf[i++] = 0;
>> +	buf[i++] = 0;
>> +
>> +	buf[i++] = MFX_WAIT;
>> +
>> +	obj[0].offset = 0x200000;
> ----------------------- ^
> Use ahnd as in gen9_huc_copy (without reloc code).


The code here is simply assigning a graphics virtual address to the 
source buffer object.


>> +	obj[0].flags |= EXEC_OBJECT_PINNED;
> Add also:
> 			| EXEC_OBJECT_SUPPORTS_48B_ADDRESS

As explained above,  we don't need 48b address.


>
>> +	obj[1].offset = 0x400000;
> Same here.
>
>> +	obj[1].flags |= EXEC_OBJECT_PINNED;
>> +	obj[1].flags |= EXEC_OBJECT_WRITE;
> Add also
> 			| EXEC_OBJECT_SUPPORTS_48B_ADDRESS
>
> and maybe make it one bit-or like:
> 	obj[1].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE |
> 			EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
>
>> +	obj[2].offset = 0x600000;
> Same here.
>
>> +	obj[2].flags |= EXEC_OBJECT_PINNED;
> Same here (48-bit).
>
> Regards,
> Kamil
>
>> +	gen12_emit_huc_virtual_addr_state(&obj[0], &obj[1], buf, &i);
>> +
>> +	buf[i++] = HUC_START;
>> +	buf[i++] = 1;
>> +
>> +	buf[i++] = MI_BATCH_BUFFER_END;
>> +
>> +	gem_write(fd, obj[2].handle, 0, buf, sizeof(buf));
>> +
>> +	memset(&execbuf, 0, sizeof(execbuf));
>> +	execbuf.buffers_ptr = to_user_pointer(obj);
>> +	execbuf.buffer_count = 3;
>> +	execbuf.flags = I915_EXEC_DEFAULT;
>> +
>> +	ctx = intel_ctx_create_for_engine(fd, I915_ENGINE_CLASS_VIDEO, 0);
>> +	execbuf.rsvd1 = ctx->id;
>> +
>> +	gem_execbuf(fd, &execbuf);
>> +
>> +	intel_ctx_destroy(fd, ctx);
>> +}
>> diff --git a/lib/huc_copy.h b/lib/huc_copy.h
>> index 69d140933..e87e62c9c 100644
>> --- a/lib/huc_copy.h
>> +++ b/lib/huc_copy.h
>> @@ -46,4 +46,8 @@ void
>>   gen9_huc_copyfunc(int fd, uint64_t ahnd,
>>   		  struct drm_i915_gem_exec_object2 *obj, uint64_t *objsize);
>>   
>> +void
>> +gen12_huc_copyfunc(int fd, uint64_t ahnd,
>> +		   struct drm_i915_gem_exec_object2 *obj, uint64_t *objsize);
>> +
>>   #endif /* HUC_COPY_H */
>> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
>> index 19a1fbe4d..9a855a7f0 100644
>> --- a/lib/intel_batchbuffer.c
>> +++ b/lib/intel_batchbuffer.c
>> @@ -3066,14 +3066,18 @@ void intel_bb_copy_intel_buf(struct intel_bb *ibb,
>>    * Returns:
>>    *
>>    * The platform-specific huc copy function pointer for the device specified
>> - * with @devid. Will return NULL when no media spin function is implemented.
>> + * with @devid. Will return NULL when no huc copy function is implemented.
>>    */
>>   igt_huc_copyfunc_t igt_get_huc_copyfunc(int devid)
>>   {
>>   	igt_huc_copyfunc_t copy = NULL;
>>   
>> -	if (IS_GEN12(devid) || IS_GEN11(devid) || IS_GEN9(devid))
>> +	if (AT_LEAST_GEN(devid, 12))
>> +		copy = gen12_huc_copyfunc;

As mentioned above, we switch to softpin on Gen12+ and stay with old 
func on earlier platforms.

Thanks,
Tony


>> +	else if (IS_GEN11(devid) || IS_GEN9(devid))
>>   		copy = gen9_huc_copyfunc;
>> +	else
>> +		copy = NULL;
>>   
>>   	return copy;
>>   }
>> -- 
>> 2.25.1
>>
