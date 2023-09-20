Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3A310E284
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Sep 2023 03:42:25 +0000 (UTC)
Date: Tue, 19 Sep 2023 20:42:18 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZQpqGi/jUtg5AfzS@nvishwa1-DESK>
References: <20230915233304.2241426-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230915233304.2241426-1-matthew.brost@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 1/3] xe_exec_balancer: Enable parallel
 submission and compute mode
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

On Fri, Sep 15, 2023 at 04:33:02PM -0700, Matthew Brost wrote:
>This is now supported. Test it.
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
> tests/intel/xe_exec_balancer.c | 21 +++++++++++++++------
> 1 file changed, 15 insertions(+), 6 deletions(-)
>
>diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
>index 3fb535988c..75b25ddd19 100644
>--- a/tests/intel/xe_exec_balancer.c
>+++ b/tests/intel/xe_exec_balancer.c
>@@ -384,6 +384,12 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  * @virtual-userptr-rebind:		virtual userptr rebind
>  * @virtual-userptr-invalidate:		virtual userptr invalidate
>  * @virtual-userptr-invalidate-race:	virtual userptr invalidate racy
>+ * @parallel-basic:			parallel basic
>+ * @parallel-userptr:			parallel userptr
>+ * @parallel-rebind:			parallel rebind
>+ * @parallel-userptr-rebind:		parallel userptr rebind
>+ * @parallel-userptr-invalidate:	parallel userptr invalidate
>+ * @parallel-userptr-invalidate-race:	parallel userptr invalidate racy
>  */
>
> static void
>@@ -461,8 +467,8 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
> 		};
> 		struct drm_xe_exec_queue_create create = {
> 			.vm_id = vm,
>-			.width = 1,
>-			.num_placements = num_placements,
>+			.width = flags & PARALLEL ? num_placements : 1,
>+			.num_placements = flags & PARALLEL ? 1 : num_placements,
> 			.instances = to_user_pointer(eci),
> 			.extensions = to_user_pointer(&ext),
> 		};
>@@ -471,6 +477,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
> 					&create), 0);
> 		exec_queues[i] = create.exec_queue_id;
> 	}
>+	exec.num_batch_buffer = flags & PARALLEL ? num_placements : 1;
>
> 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> 	if (bo)
>@@ -488,8 +495,12 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
> 		uint64_t batch_addr = addr + batch_offset;
> 		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
> 		uint64_t sdi_addr = addr + sdi_offset;
>+		uint64_t batches[MAX_INSTANCE];
> 		int e = i % n_exec_queues;
>
>+		for (j = 0; j < num_placements && flags & PARALLEL; ++j)
>+			batches[j] = batch_addr;
>+
> 		b = 0;
> 		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> 		data[i].batch[b++] = sdi_addr;
>@@ -501,7 +512,8 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
> 		sync[0].addr = addr + (char *)&data[i].exec_sync - (char *)data;
>
> 		exec.exec_queue_id = exec_queues[e];
>-		exec.address = batch_addr;
>+		exec.address = flags & PARALLEL ?
>+			to_user_pointer(batches) : batch_addr;
> 		xe_exec(fd, &exec);
>
> 		if (flags & REBIND && i + 1 != n_execs) {
>@@ -662,9 +674,6 @@ igt_main
> 					test_exec(fd, gt, class, 1, 0,
> 						  s->flags);
>
>-		if (s->flags & PARALLEL)
>-			continue;
>-
> 		igt_subtest_f("once-cm-%s", s->name)
> 			xe_for_each_gt(fd, gt)
> 				xe_for_each_hw_engine_class(class)
>-- 
>2.34.1
>
