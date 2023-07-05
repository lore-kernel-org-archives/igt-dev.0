Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F30C895EE
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jul 2023 15:12:47 +0000 (UTC)
Message-ID: <cd5c70da-ca38-a158-5911-bd9e8bb11710@intel.com>
Date: Wed, 5 Jul 2023 17:12:23 +0200
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20230704090104.120219-1-zbigniew.kempczynski@intel.com>
 <20230704090104.120219-6-zbigniew.kempczynski@intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <20230704090104.120219-6-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 05/12] lib/xe_util: Add vm bind/unbind
 helper for Xe
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

On 4.07.2023 11:00, Zbigniew Kempczyński wrote:
> Before calling exec we need to prepare vm to contain valid entries.
> Bind/unbind in xe expects single bind_op or vector of bind_ops what
> makes preparation of it a little bit inconvinient. Add function
> which iterates over list of xe_object (auxiliary structure which
> describes bind information for object) and performs the bind/unbind
> in one step. It also supports passing syncobj in/out to work in
> pipelined executions.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>   lib/xe/xe_util.c | 133 +++++++++++++++++++++++++++++++++++++++++++++++
>   lib/xe/xe_util.h |  21 ++++++--
>   2 files changed, 151 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
> index 448b3a3d27..8552db47d5 100644
> --- a/lib/xe/xe_util.c
> +++ b/lib/xe/xe_util.c
> @@ -102,3 +102,136 @@ char *xe_memregion_dynamic_subtest_name(int xe, struct igt_collection *set)
>   	return name;
>   }
>   
> +#ifdef XEBINDDBG
> +#define bind_info igt_info
> +#define bind_debug igt_debug
> +#else
> +#define bind_info(...) {}
> +#define bind_debug(...) {}
> +#endif
> +
> +static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(struct igt_list_head *obj_list,
> +						   uint32_t *num_ops)
> +{
> +	struct drm_xe_vm_bind_op *bind_ops, *ops;
> +	struct xe_object *obj;
> +	uint32_t num_objects = 0, i = 0, op;
> +
> +	num_objects = 0;

It is already set to 0, you can remove that line

> +	igt_list_for_each_entry(obj, obj_list, link)
> +		num_objects++;
> +
> +	*num_ops = num_objects;
> +	if (!num_objects) {
> +		bind_info(" [nothing to bind]\n");
> +		return NULL;
> +	}
> +
> +	bind_ops = calloc(num_objects, sizeof(*bind_ops));
> +	igt_assert(bind_ops);
> +
> +	igt_list_for_each_entry(obj, obj_list, link) {
> +		ops = &bind_ops[i];
> +
> +		if (obj->bind_op == XE_OBJECT_BIND) {
> +			op = XE_VM_BIND_OP_MAP | XE_VM_BIND_FLAG_ASYNC;
> +			ops->obj = obj->handle;
> +		} else {
> +			op = XE_VM_BIND_OP_UNMAP | XE_VM_BIND_FLAG_ASYNC;
> +		}
> +
> +		ops->op = op;
> +		ops->obj_offset = 0;
> +		ops->addr = obj->offset;
> +		ops->range = obj->size;
> +		ops->region = 0;

Shouldn't we pass an actual region instance here?

> +
> +		bind_info("  [%d]: [%6s] handle: %u, offset: %llx, size: %llx\n",
> +			  i, obj->bind_op == XE_OBJECT_BIND ? "BIND" : "UNBIND",
> +			  ops->obj, (long long)ops->addr, (long long)ops->range);
> +		i++;
> +	}
> +
> +	return bind_ops;
> +}
> +
> +static void __xe_op_bind_async(int xe, uint32_t vm, uint32_t bind_engine,
> +			       struct igt_list_head *obj_list,
> +			       uint32_t sync_in, uint32_t sync_out)
> +{
> +	struct drm_xe_vm_bind_op *bind_ops;
> +	struct drm_xe_sync tabsyncs[2] = {
> +		{ .flags = DRM_XE_SYNC_SYNCOBJ, .handle = sync_in },
> +		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, .handle = sync_out },
> +	};
> +	struct drm_xe_sync *syncs;
> +	uint32_t num_binds = 0;
> +	int num_syncs;
> +
> +	bind_info("[Binding to vm: %u]\n", vm);
> +	bind_ops = xe_alloc_bind_ops(obj_list, &num_binds);
> +
> +	if (!num_binds) {
> +		if (sync_out)
> +			syncobj_signal(xe, &sync_out, 1);
> +		return;
> +	}
> +
> +	if (sync_in) {
> +		syncs = tabsyncs;
> +		num_syncs = 2;
> +	} else {
> +		syncs = &tabsyncs[1];
> +		num_syncs = 1;
> +	}
> +
> +	/* User didn't pass sync out, create it and wait for completion */
> +	if (!sync_out)
> +		tabsyncs[1].handle = syncobj_create(xe, 0);
> +
> +	bind_info("[Binding syncobjs: (in: %u, out: %u)]\n",
> +		  tabsyncs[0].handle, tabsyncs[1].handle);
> +
> +	if (num_binds == 1) {
> +		if ((bind_ops[0].op & 0xffff) == XE_VM_BIND_OP_MAP)
> +			xe_vm_bind_async(xe, vm, bind_engine, bind_ops[0].obj, 0,
> +					bind_ops[0].addr, bind_ops[0].range,
> +					syncs, num_syncs);
> +		else
> +			xe_vm_unbind_async(xe, vm, bind_engine, 0,
> +					   bind_ops[0].addr, bind_ops[0].range,
> +					   syncs, num_syncs);
> +	} else {
> +		xe_vm_bind_array(xe, vm, bind_engine, bind_ops,
> +				 num_binds, syncs, num_syncs);
> +	}
> +
> +	if (!sync_out) {
> +		igt_assert_eq(syncobj_wait_err(xe, &tabsyncs[1].handle, 1, INT64_MAX, 0), 0);

That timeout is quite long, but I see that in syncobj_wait.c test we 
have an even higher value... Should factor the CI timeout in when 
picking the fence timeout?

Apart from that one line thingy, the patch looks good, I think.

All the best,
Karolina

> +		syncobj_destroy(xe, tabsyncs[1].handle);
> +	}
> +
> +	free(bind_ops);
> +}
> +
> +/**
> +  * xe_bind_unbind_async:
> +  * @xe: drm fd of Xe device
> +  * @vm: vm to bind/unbind objects to/from
> +  * @bind_engine: bind engine, 0 if default
> +  * @obj_list: list of xe_object
> +  * @sync_in: sync object (fence-in), 0 if there's no input dependency
> +  * @sync_out: sync object (fence-out) to signal on bind/unbind completion,
> +  *            if 0 wait for bind/unbind completion.
> +  *
> +  * Function iterates over xe_object @obj_list, prepares binding operation
> +  * and does bind/unbind in one step. Providing sync_in / sync_out allows
> +  * working in pipelined mode. With sync_in and sync_out set to 0 function
> +  * waits until binding operation is complete.
> +  */
> +void xe_bind_unbind_async(int fd, uint32_t vm, uint32_t bind_engine,
> +			  struct igt_list_head *obj_list,
> +			  uint32_t sync_in, uint32_t sync_out)
> +{
> +	return __xe_op_bind_async(fd, vm, bind_engine, obj_list, sync_in, sync_out);
> +}
> diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
> index 46b7e0d46b..32f309923e 100644
> --- a/lib/xe/xe_util.h
> +++ b/lib/xe/xe_util.h
> @@ -12,9 +12,6 @@
>   #include <stdint.h>
>   #include <xe_drm.h>
>   
> -#define XE_REGION_SMEM XE_MEM_REGION_CLASS_SYSMEM
> -#define XE_REGION_LMEM XE_MEM_REGION_CLASS_VRAM
> -
>   #define XE_IS_SYSMEM_MEMORY_REGION(fd, region) \
>   	(xe_region_class(fd, region) == XE_MEM_REGION_CLASS_SYSMEM)
>   #define XE_IS_VRAM_MEMORY_REGION(fd, region) \
> @@ -30,4 +27,22 @@ __xe_get_memory_region_set(int xe, uint32_t *mem_regions_type, int num_regions);
>   
>   char *xe_memregion_dynamic_subtest_name(int xe, struct igt_collection *set);
>   
> +enum xe_bind_op {
> +	XE_OBJECT_BIND,
> +	XE_OBJECT_UNBIND,
> +};
> +
> +struct xe_object {
> +	uint32_t handle;
> +	uint64_t offset;
> +	uint64_t size;
> +	enum xe_bind_op bind_op;
> +	void *priv;
> +	struct igt_list_head link;
> +};
> +
> +void xe_bind_unbind_async(int fd, uint32_t vm, uint32_t bind_engine,
> +			  struct igt_list_head *obj_list,
> +			  uint32_t sync_in, uint32_t sync_out);
> +
>   #endif /* XE_UTIL_H */
