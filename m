Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4198110E099
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Nov 2022 16:02:54 +0000 (UTC)
Date: Wed, 9 Nov 2022 08:02:37 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <Y2vPHZJJN7xPZqcH@nvishwa1-DESK>
References: <20221107085256.17293-1-niranjana.vishwanathapura@intel.com>
 <20221107085256.17293-14-niranjana.vishwanathapura@intel.com>
 <e4a001f8-2e00-7116-90b6-7c10dbe0e29e@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <e4a001f8-2e00-7116-90b6-7c10dbe0e29e@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v6 13/13] tests/i915/vm_bind: Add
 gem_shrink@vm_bind* subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tvrtko.ursulin@intel.com, igt-dev@lists.freedesktop.org,
 thomas.hellstrom@intel.com, daniel.vetter@intel.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Nov 09, 2022 at 12:38:35PM +0000, Matthew Auld wrote:
>On 07/11/2022 08:52, Niranjana Vishwanathapura wrote:
>>Add VM_BIND shrinker subtests.
>>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>---
>>  tests/i915/gem_shrink.c | 60 +++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 60 insertions(+)
>>
>>diff --git a/tests/i915/gem_shrink.c b/tests/i915/gem_shrink.c
>>index e3e20dfc9..b97a77e8f 100644
>>--- a/tests/i915/gem_shrink.c
>>+++ b/tests/i915/gem_shrink.c
>>@@ -29,10 +29,13 @@
>>  #include "i915/gem.h"
>>  #include "i915/gem_create.h"
>>+#include "i915/gem_vm.h"
>>+#include "i915/i915_vm_bind.h"
>>  #include "igt.h"
>>  #include "igt_gt.h"
>>  #include "igt_debugfs.h"
>>  #include "igt_sysfs.h"
>>+#include "igt_syncobj.h"
>>  #ifndef MADV_FREE
>>  #define MADV_FREE 8
>>@@ -229,6 +232,62 @@ static void hang(int fd, uint64_t alloc)
>>  	munmap(obj, obj_size);
>>  }
>>+static uint64_t gettime_ns(void)
>>+{
>>+	struct timespec current;
>>+	clock_gettime(CLOCK_MONOTONIC, &current);
>>+	return (uint64_t)current.tv_sec * NSEC_PER_SEC + current.tv_nsec;
>>+}
>>+
>>+#define BATCH_VA	0xc0000000
>>+static void vm_bind(int fd, uint64_t alloc)
>>+{
>>+	struct drm_i915_gem_timeline_fence exec_fence = { };
>>+	struct drm_i915_gem_context_param param = {
>>+		.param = I915_CONTEXT_PARAM_RECOVERABLE,
>>+		.value = 0,
>>+	};
>>+	const uint32_t bbe = MI_BATCH_BUFFER_END;
>>+	struct drm_i915_gem_execbuffer3 execbuf3;
>>+	uint32_t vm_id, handle, exec_syncobj;
>>+	struct intel_engine_data engines;
>>+	const intel_ctx_t *ctx;
>>+	uint64_t fence_value = 0;
>>+
>>+	vm_id = gem_vm_create_in_vm_bind_mode(fd);
>
>Some kind of igt_require() to check we have vm_bind support somewhere?
>

Ok, will add.

>Also do we need to unblacklist this particular test?
>

I am not sure the reason behind blacklisting of subtests here.
Probably because these tests require swap space setup which may not
have been configured. 
Also all *-oom tests are failing even before calling the subtest
functions (runs into crash while calling leak()).
May be we can leave it as is for now and try to enable all subtests
in a subsequent work?

>Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Thanks,
Niranjana

>
>>+	ctx = intel_ctx_create_all_physical(fd);
>>+	param.ctx_id = ctx->id;
>>+	gem_context_set_param(fd, &param);
>>+	gem_context_set_vm(fd, ctx->id, vm_id);
>>+	(void)gem_context_get_vm(fd, ctx->id);
>>+	engines = intel_engine_list_for_ctx_cfg(fd, &ctx->cfg);
>>+
>>+	handle = gem_create(fd, alloc);
>>+	gem_write(fd, handle, 0, &bbe, sizeof(bbe));
>>+	i915_vm_bind(fd, vm_id, BATCH_VA, handle, 0, alloc, 0, 0);
>>+
>>+	exec_syncobj = syncobj_create(fd, 0);
>>+	exec_fence.handle = exec_syncobj;
>>+	exec_fence.flags = I915_TIMELINE_FENCE_SIGNAL;
>>+
>>+	memset(&execbuf3, 0, sizeof(execbuf3));
>>+	execbuf3.ctx_id = ctx->id;
>>+	execbuf3.engine_idx = engines.engines[0].flags;
>>+	execbuf3.batch_address = BATCH_VA;
>>+	execbuf3.fence_count = 1;
>>+	execbuf3.timeline_fences = to_user_pointer(&exec_fence);
>>+
>>+	gem_execbuf3(fd, &execbuf3);
>>+
>>+	igt_assert(syncobj_timeline_wait(fd, &exec_syncobj, &fence_value, 1,
>>+					 gettime_ns() + (2 * NSEC_PER_SEC),
>>+					 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT, NULL));
>>+	gem_madvise(fd, handle, I915_MADV_DONTNEED);
>>+
>>+	syncobj_destroy(fd, exec_syncobj);
>>+	intel_ctx_destroy(fd, ctx);
>>+}
>>+
>>  static void userptr(int fd, uint64_t alloc, unsigned int flags)
>>  #define UDIRTY (1 << 0)
>>  {
>>@@ -418,6 +477,7 @@ igt_main
>>  		{ "execbufN", execbufN },
>>  		{ "execbufX", execbufX },
>>  		{ "hang", hang },
>>+		{ "vm_bind", vm_bind },
>>  		{ NULL },
>>  	};
>>  	const struct mode {
