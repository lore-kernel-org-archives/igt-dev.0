Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F81110E177
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Oct 2022 21:30:36 +0000 (UTC)
Date: Mon, 31 Oct 2022 14:30:29 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <Y2A+dU1yd3ZY7V0+@nvishwa1-DESK>
References: <20221025065941.13397-1-niranjana.vishwanathapura@intel.com>
 <20221025065941.13397-10-niranjana.vishwanathapura@intel.com>
 <dda61893-16c9-a553-4b45-41d0bcfad47f@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <dda61893-16c9-a553-4b45-41d0bcfad47f@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v5 09/12] tests/i915/vm_bind: Add
 userptr subtest
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

On Mon, Oct 31, 2022 at 03:46:10PM +0000, Matthew Auld wrote:
>On 25/10/2022 07:59, Niranjana Vishwanathapura wrote:
>>Add userptr object type to vm_bind_basic test.
>>
>>v2: Run all tests for userptr type
>>v3: Change info to debug messages, remove igt_collection usage
>>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>
>>---
>>  tests/i915/i915_vm_bind_basic.c | 55 +++++++++++++++++++++++++++++----
>>  1 file changed, 49 insertions(+), 6 deletions(-)
>>
>>diff --git a/tests/i915/i915_vm_bind_basic.c b/tests/i915/i915_vm_bind_basic.c
>>index e794f0a845..f9cbb198e6 100644
>>--- a/tests/i915/i915_vm_bind_basic.c
>>+++ b/tests/i915/i915_vm_bind_basic.c
>>@@ -235,16 +235,24 @@ static uint32_t create_obj(int fd, struct gem_memory_region *mr, uint32_t size,
>>  {
>>  	uint32_t handle;
>>-	handle = gem_create_in_memory_region_list(fd, size, 0, &mr->ci, 1);
>>-	*addr = gem_mmap__cpu(fd, handle, 0, size, PROT_WRITE);
>>+	if (!mr) {
>>+		igt_assert(posix_memalign(addr, SZ_2M * MAX_CTXTS, size) == 0);
>>+		gem_userptr(fd, *addr, size, 0, 0, &handle);
>>+	} else {
>>+		handle = gem_create_in_memory_region_list(fd, size, 0, &mr->ci, 1);
>>+		*addr = gem_mmap__cpu(fd, handle, 0, size, PROT_WRITE);
>>+	}
>>  	return handle;
>>  }
>>-static void destroy_obj(int fd, uint32_t handle, uint32_t size, void *addr)
>>+static void destroy_obj(int fd, uint32_t handle, uint32_t size, void *addr, bool is_userptr)
>>  {
>>  	igt_assert(gem_munmap(addr, size) == 0);
>>  	gem_close(fd, handle);
>>+
>>+	if (is_userptr)
>>+		free(addr);
>>  }
>>  static void create_src_objs(int fd, struct gem_memory_region *mr, uint32_t src[],
>>@@ -255,6 +263,14 @@ static void create_src_objs(int fd, struct gem_memory_region *mr, uint32_t src[]
>>  	if (!num_cmds)
>>  		return;
>>+	if (!mr) {
>>+		for (i = 0; i < num_cmds; i++) {
>>+			src[i] = create_obj(fd, NULL, size, &src_addr[i]);
>>+			igt_debug("Src (userptr) obj 0x%x created\n", src[i]);
>>+		}
>>+		return;
>>+	}
>>+
>>  	/* Create first src object always in memory region 'mr' */
>>  	src[i] = create_obj(fd, mr, size, &src_addr[i]);
>>  	igt_debug("Src (%s) obj 0x%x created\n", mr->name, src[i]);
>>@@ -293,7 +309,7 @@ static void destroy_src_objs(int fd, struct gem_memory_region *mr, uint32_t src[
>>  	for (i = 0; i < num_cmds; i++) {
>>  		igt_debug("Closing src object 0x%x\n", src[i]);
>>-		destroy_obj(fd, src[i], size, src_addr[i]);
>>+		destroy_obj(fd, src[i], size, src_addr[i], !mr);
>>  	}
>>  }
>>@@ -301,7 +317,7 @@ static uint32_t create_dst_obj(int fd, struct gem_memory_region *mr, uint32_t si
>>  {
>>  	uint32_t dst = create_obj(fd, mr, size, dst_addr);
>>-	igt_debug("Dst (%s) obj 0x%x created\n", mr->name, dst);
>>+	igt_debug("Dst (%s) obj 0x%x created\n", mr ? mr->name : "userptr", dst);
>>  	return dst;
>>  }
>>@@ -309,7 +325,7 @@ static void destroy_dst_obj(int fd, struct gem_memory_region *mr, uint32_t dst,
>>  			    uint32_t size, void *dst_addr)
>>  {
>>  	igt_debug("Closing dst object 0x%x\n", dst);
>>-	destroy_obj(fd, dst, size, dst_addr);
>>+	destroy_obj(fd, dst, size, dst_addr, !mr);
>>  }
>>  static void pattern_fill_buf(void *src_addr[], uint32_t size, uint32_t num_cmds, uint32_t npages)
>>@@ -499,6 +515,25 @@ static void run_test(int fd, const intel_ctx_t *base_ctx, struct test_cfg *cfg,
>>  		gem_vm_destroy(fd, shared_vm_id);
>>  }
>>+static int has_userptr(int fd)
>>+{
>>+	uint32_t handle = 0;
>>+	void *ptr;
>>+	int ret;
>>+
>>+	assert(posix_memalign(&ptr, PAGE_SIZE, PAGE_SIZE) == 0);
>>+	ret = __gem_userptr(fd, ptr, PAGE_SIZE, 0, 0, &handle);
>>+	if (ret != 0) {
>>+		free(ptr);
>>+		return 0;
>>+	}
>>+
>>+	gem_close(fd, handle);
>>+	free(ptr);
>>+
>>+	return handle != 0;
>>+}
>>+
>>  igt_main
>>  {
>>  	struct test_cfg *t, tests[] = {
>>@@ -547,6 +582,14 @@ igt_main
>>  				igt_dynamic_f("%s", r->name)
>>  					run_test(fd, ctx, &cfg, r, alignment, e);
>>  			}
>>+
>>+			if (has_userptr(fd)) {
>
>It's probably fair to assume vm_bind support also means we have 
>userptr?  But I guess can't hurt to check.
>

Yah, I think so, but yah it doesn't hurt to check in case for somereason
we disable userptr.

>Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Thanks,
Niranjana

>
>>+				struct test_cfg cfg = *t;
>>+
>>+				/* Use NULL memory region for userptr */
>>+				igt_dynamic("userptr")
>>+					run_test(fd, ctx, &cfg, NULL, PAGE_SIZE, e);
>>+			}
>>  		}
>>  	}
