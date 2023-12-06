Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C5910E02C
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Dec 2023 17:36:28 +0000 (UTC)
Date: Wed, 6 Dec 2023 12:36:19 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>
Message-ID: <ZXCxE6GG51IvBYoW@intel.com>
References: <20231206144452.19745-1-krishnaiah.bommu@intel.com>
 <20231206144452.19745-2-krishnaiah.bommu@intel.com>
 <ZXCpmPTieKBeE387@intel.com>
 <DM4PR11MB5293BBD727FDF15428C92AA29D84A@DM4PR11MB5293.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DM4PR11MB5293BBD727FDF15428C92AA29D84A@DM4PR11MB5293.namprd11.prod.outlook.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v4 1/2] drm-uapi/xe: add exec_queue_id member
 to drm_xe_wait_user_fence structure
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Dec 06, 2023 at 05:23:43PM +0000, Bommu, Krishnaiah wrote:
> 
> 
> > -----Original Message-----
> > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Sent: Wednesday, December 6, 2023 10:34 PM
> > To: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>
> > Cc: igt-dev@lists.freedesktop.org
> > Subject: Re: [igt-dev] [PATCH v4 1/2] drm-uapi/xe: add exec_queue_id
> > member to drm_xe_wait_user_fence structure
> > 
> > On Wed, Dec 06, 2023 at 08:14:50PM +0530, Bommu Krishnaiah wrote:
> > > remove the num_engines/instances members from
> > drm_xe_wait_user_fence
> > > structure and add a exec_queue_id member
> > >
> > > Right now this is only checking if the engine list is sane and nothing
> > > else. In the end every operation with this IOCTL is a soft check.
> > > So, let's formalize that and only use this IOCTL to wait on the fence.
> > >
> > > exec_queue_id member will help to user space to get proper error code
> > > from kernel while in exec_queue reset
> > >
> > > Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > ---
> > >  include/drm-uapi/xe_drm.h          | 16 ++----
> > 
> > Since you are touching the header file it would be good if you could add a
> > mention to the commit message of which kernel patch you were when you
> > aligned this header.
> > 
> > Something like xe_drm.h aligns with kernel commit ("drm/xe/uapi: Return
> > correct error code for xe_wait_user_fence_ioctl")
> > 
> > (no need to add the commit hash since it is still volatile in drm-xe-next)
> > 
> > Also ensure that you do not copy the header directly, but always make it
> > from the kernel and then copy the 'built' one.
> > 
> > make headers_install  INSTALL_HDR_PATH=/tmp/blah cp
> > /tmp/blah/include/drm/xe_drm.h ./include/drm-uapi/xe_drm.h
> 
> I will update in next version
> 
> > 
> > 
> > >  lib/xe/xe_ioctl.c                  | 42 +-------------
> > >  lib/xe/xe_ioctl.h                  |  6 +-
> > >  tests/intel/xe_evict.c             |  4 +-
> > >  tests/intel/xe_exec_balancer.c     | 12 ++--
> > >  tests/intel/xe_exec_compute_mode.c | 12 ++--
> > >  tests/intel/xe_exec_fault_mode.c   | 14 ++---
> > >  tests/intel/xe_exec_reset.c        |  6 +-
> > >  tests/intel/xe_exec_threads.c      | 12 ++--
> > >  tests/intel/xe_waitfence.c         | 88 ++++++++++++++----------------
> > >  10 files changed, 82 insertions(+), 130 deletions(-)
> > >
> > > diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> > > index 590f7b7af..ceaca3991 100644
> > > --- a/include/drm-uapi/xe_drm.h
> > > +++ b/include/drm-uapi/xe_drm.h
> > > @@ -1024,8 +1024,7 @@ struct drm_xe_wait_user_fence {
> > >  	/** @op: wait operation (type of comparison) */
> > >  	__u16 op;
> > >
> > > -#define DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP	(1 << 0)	/* e.g. Wait
> > on VM bind */
> > > -#define DRM_XE_UFENCE_WAIT_FLAG_ABSTIME	(1 << 1)
> > > +#define DRM_XE_UFENCE_WAIT_FLAG_ABSTIME	(1 << 0)
> > >  	/** @flags: wait flags */
> > >  	__u16 flags;
> > >
> > > @@ -1059,16 +1058,13 @@ struct drm_xe_wait_user_fence {
> > >  	__s64 timeout;
> > >
> > >  	/**
> > > -	 * @num_engines: number of engine instances to wait on, must be
> > zero
> > > -	 * when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP set
> > > +	 * @exec_queue_id: exec_queue_id returned from
> > xe_exec_queue_create_ioctl
> > > +	 * exec_queue_id is help to find exec_queue reset status
> > >  	 */
> > > -	__u64 num_engines;
> > > +	__u32 exec_queue_id;
> > >
> > > -	/**
> > > -	 * @instances: user pointer to array of
> > drm_xe_engine_class_instance to
> > > -	 * wait on, must be NULL when
> > DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP set
> > > -	 */
> > > -	__u64 instances;
> > > +	/** @reserved: Reserved */
> > 
> > please fix the alignments and pad doc as Francois already pointed out and
> > then when that is finalized, import the result here as mentioned above.
> 
> I will update in next version
> 
> > 
> > > +	__u32 pad2;
> > >
> > >  	/** @reserved: Reserved */
> > >  	__u64 reserved[2];
> > > diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c index
> > > c91bf25c4..87e2db5b4 100644
> > > --- a/lib/xe/xe_ioctl.c
> > > +++ b/lib/xe/xe_ioctl.c
> > > @@ -458,18 +458,16 @@ void xe_exec_wait(int fd, uint32_t exec_queue,
> > > uint64_t addr)  }
> > >
> > >  int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
> > > -		       struct drm_xe_engine_class_instance *eci,
> > > -		       int64_t timeout)
> > > +		       uint32_t exec_queue, int64_t timeout)
> > >  {
> > >  	struct drm_xe_wait_user_fence wait = {
> > >  		.addr = to_user_pointer(addr),
> > >  		.op = DRM_XE_UFENCE_WAIT_OP_EQ,
> > > -		.flags = !eci ? DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP : 0,
> > > +		.flags = 0,
> > >  		.value = value,
> > >  		.mask = DRM_XE_UFENCE_WAIT_MASK_U64,
> > >  		.timeout = timeout,
> > > -		.num_engines = eci ? 1 :0,
> > > -		.instances = eci ? to_user_pointer(eci) : 0,
> > > +		.exec_queue_id = exec_queue,
> > >  	};
> > >
> > >  	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE,
> > &wait),
> > > 0); @@ -477,40 +475,6 @@ int64_t xe_wait_ufence(int fd, uint64_t *addr,
> > uint64_t value,
> > >  	return wait.timeout;
> > >  }
> > >
> > > -/**
> > > - * xe_wait_ufence_abstime:
> > > - * @fd: xe device fd
> > > - * @addr: address of value to compare
> > > - * @value: expected value (equal) in @address
> > > - * @eci: engine class instance
> > > - * @timeout: absolute time when wait expire
> > > - *
> > > - * Function compares @value with memory pointed by @addr until they
> > are equal.
> > > - *
> > > - * Returns elapsed time in nanoseconds if user fence was signalled.
> > > - */
> > > -int64_t xe_wait_ufence_abstime(int fd, uint64_t *addr, uint64_t value,
> > > -			       struct drm_xe_engine_class_instance *eci,
> > > -			       int64_t timeout)
> > > -{
> > > -	struct drm_xe_wait_user_fence wait = {
> > > -		.addr = to_user_pointer(addr),
> > > -		.op = DRM_XE_UFENCE_WAIT_OP_EQ,
> > > -		.flags = !eci ? DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP |
> > DRM_XE_UFENCE_WAIT_FLAG_ABSTIME : 0,
> > > -		.value = value,
> > > -		.mask = DRM_XE_UFENCE_WAIT_MASK_U64,
> > > -		.timeout = timeout,
> > > -		.num_engines = eci ? 1 : 0,
> > > -		.instances = eci ? to_user_pointer(eci) : 0,
> > > -	};
> > > -	struct timespec ts;
> > > -
> > > -	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE,
> > &wait), 0);
> > > -	igt_assert_eq(clock_gettime(CLOCK_MONOTONIC, &ts), 0);
> > > -
> > > -	return ts.tv_sec * 1e9 + ts.tv_nsec;
> > > -}
> > 
> > Well, I believe it would be better this movement in a separated patch.
> ok
> > 
> > > -
> > >  void xe_force_gt_reset(int fd, int gt)  {
> > >  	char reset_string[128];
> > > diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h index
> > > 32b34b15a..186544a34 100644
> > > --- a/lib/xe/xe_ioctl.h
> > > +++ b/lib/xe/xe_ioctl.h
> > > @@ -89,11 +89,9 @@ void xe_exec_sync(int fd, uint32_t exec_queue,
> > uint64_t addr,
> > >  		  struct drm_xe_sync *sync, uint32_t num_syncs);  void
> > > xe_exec_wait(int fd, uint32_t exec_queue, uint64_t addr);  int64_t
> > > xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
> > > -		       struct drm_xe_engine_class_instance *eci,
> > > -		       int64_t timeout);
> > > +		       uint32_t exec_queue,int64_t timeout);
> > >  int64_t xe_wait_ufence_abstime(int fd, uint64_t *addr, uint64_t value,
> > > -			       struct drm_xe_engine_class_instance *eci,
> > > -			       int64_t timeout);
> > > +			       uint32_t exec_queue, int64_t timeout);
> > >  void xe_force_gt_reset(int fd, int gt);
> > >
> > >  #endif /* XE_IOCTL_H */
> > > diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c index
> > > 89dc46fae..12fbaf586 100644
> > > --- a/tests/intel/xe_evict.c
> > > +++ b/tests/intel/xe_evict.c
> > > @@ -317,7 +317,7 @@ test_evict_cm(int fd, struct
> > drm_xe_engine_class_instance *eci,
> > >  			}
> > >  #define TWENTY_SEC	MS_TO_NS(20000)
> > >  			xe_wait_ufence(fd, &data[i].vm_sync,
> > USER_FENCE_VALUE,
> > > -				       NULL, TWENTY_SEC);
> > > +				       0, TWENTY_SEC);
> > >  		}
> > >  		sync[0].addr = addr + (char *)&data[i].exec_sync -
> > >  			(char *)data;
> > > @@ -352,7 +352,7 @@ test_evict_cm(int fd, struct
> > drm_xe_engine_class_instance *eci,
> > >  		data = xe_bo_map(fd, __bo,
> > >  				 ALIGN(sizeof(*data) * n_execs, 0x1000));
> > >  		xe_wait_ufence(fd, &data[i].exec_sync,
> > USER_FENCE_VALUE,
> > > -			       NULL, TWENTY_SEC);
> > > +			       exec_queues[i], TWENTY_SEC);
> > >  		igt_assert_eq(data[i].data, 0xc0ffee);
> > >  	}
> > >  	munmap(data, ALIGN(sizeof(*data) * n_execs, 0x1000)); diff --git
> > > a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
> > > index 79ff65e89..0a02c6767 100644
> > > --- a/tests/intel/xe_exec_balancer.c
> > > +++ b/tests/intel/xe_exec_balancer.c
> > > @@ -483,7 +483,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues,
> > int n_execs,
> > >  					 bo_size, sync, 1);
> > >
> > >  #define ONE_SEC	MS_TO_NS(1000)
> > > -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL,
> > ONE_SEC);
> > > +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0,
> > ONE_SEC);
> > >  	data[0].vm_sync = 0;
> > >
> > >  	for (i = 0; i < n_execs; i++) {
> > > @@ -514,7 +514,7 @@ test_cm(int fd, int gt, int class, int
> > > n_exec_queues, int n_execs,
> > >
> > >  		if (flags & REBIND && i + 1 != n_execs) {
> > >  			xe_wait_ufence(fd, &data[i].exec_sync,
> > USER_FENCE_VALUE,
> > > -				       NULL, ONE_SEC);
> > > +				        exec_queues[e], ONE_SEC);
> > >  			xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size,
> > NULL,
> > >  					   0);
> > >
> > > @@ -529,7 +529,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues,
> > int n_execs,
> > >  							 addr, bo_size, sync,
> > >  							 1);
> > >  			xe_wait_ufence(fd, &data[0].vm_sync,
> > USER_FENCE_VALUE,
> > > -				       NULL, ONE_SEC);
> > > +				       0, ONE_SEC);
> > >  			data[0].vm_sync = 0;
> > >  		}
> > >
> > > @@ -542,7 +542,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues,
> > int n_execs,
> > >  				 * an invalidate.
> > >  				 */
> > >  				xe_wait_ufence(fd, &data[i].exec_sync,
> > > -					       USER_FENCE_VALUE, NULL,
> > ONE_SEC);
> > > +					       USER_FENCE_VALUE,
> > exec_queues[e], ONE_SEC);
> > >  				igt_assert_eq(data[i].data, 0xc0ffee);
> > >  			} else if (i * 2 != n_execs) {
> > >  				/*
> > > @@ -571,7 +571,7 @@ test_cm(int fd, int gt, int class, int
> > > n_exec_queues, int n_execs,
> > >
> > >  	j = flags & INVALIDATE && n_execs ? n_execs - 1 : 0;
> > >  	for (i = j; i < n_execs; i++)
> > > -		xe_wait_ufence(fd, &data[i].exec_sync,
> > USER_FENCE_VALUE, NULL,
> > > +		xe_wait_ufence(fd, &data[i].exec_sync,
> > USER_FENCE_VALUE,
> > > +exec_queues[i],
> > >  			       ONE_SEC);
> > >
> > >  	/* Wait for all execs to complete */ @@ -580,7 +580,7 @@
> > test_cm(int
> > > fd, int gt, int class, int n_exec_queues, int n_execs,
> > >
> > >  	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> > >  	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> > > -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL,
> > ONE_SEC);
> > > +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0,
> > ONE_SEC);
> > >
> > >  	for (i = (flags & INVALIDATE && n_execs) ? n_execs - 1 : 0;
> > >  	     i < n_execs; i++)
> > > diff --git a/tests/intel/xe_exec_compute_mode.c
> > > b/tests/intel/xe_exec_compute_mode.c
> > > index 7d3004d65..e8497a520 100644
> > > --- a/tests/intel/xe_exec_compute_mode.c
> > > +++ b/tests/intel/xe_exec_compute_mode.c
> > > @@ -171,7 +171,7 @@ test_exec(int fd, struct
> > > drm_xe_engine_class_instance *eci,
> > >
> > >  	fence_timeout = igt_run_in_simulation() ? HUNDRED_SEC :
> > ONE_SEC;
> > >
> > > -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL,
> > > +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0,
> > >  		       fence_timeout);
> > >  	data[0].vm_sync = 0;
> > >
> > > @@ -198,7 +198,7 @@ test_exec(int fd, struct
> > > drm_xe_engine_class_instance *eci,
> > >
> > >  		if (flags & REBIND && i + 1 != n_execs) {
> > >  			xe_wait_ufence(fd, &data[i].exec_sync,
> > USER_FENCE_VALUE,
> > > -				       NULL, fence_timeout);
> > > +				       exec_queues[e], fence_timeout);
> > >  			xe_vm_unbind_async(fd, vm, bind_exec_queues[e],
> > 0,
> > >  					   addr, bo_size, NULL, 0);
> > >
> > > @@ -214,7 +214,7 @@ test_exec(int fd, struct
> > drm_xe_engine_class_instance *eci,
> > >  							 addr, bo_size, sync,
> > >  							 1);
> > >  			xe_wait_ufence(fd, &data[0].vm_sync,
> > USER_FENCE_VALUE,
> > > -				       NULL, fence_timeout);
> > > +				       0, fence_timeout);
> > >  			data[0].vm_sync = 0;
> > >  		}
> > >
> > > @@ -227,7 +227,7 @@ test_exec(int fd, struct
> > drm_xe_engine_class_instance *eci,
> > >  				 * an invalidate.
> > >  				 */
> > >  				xe_wait_ufence(fd, &data[i].exec_sync,
> > > -					       USER_FENCE_VALUE, NULL,
> > > +					       USER_FENCE_VALUE,
> > exec_queues[e],
> > >  					       fence_timeout);
> > >  				igt_assert_eq(data[i].data, 0xc0ffee);
> > >  			} else if (i * 2 != n_execs) {
> > > @@ -257,7 +257,7 @@ test_exec(int fd, struct
> > > drm_xe_engine_class_instance *eci,
> > >
> > >  	j = flags & INVALIDATE ? n_execs - 1 : 0;
> > >  	for (i = j; i < n_execs; i++)
> > > -		xe_wait_ufence(fd, &data[i].exec_sync,
> > USER_FENCE_VALUE, NULL,
> > > +		xe_wait_ufence(fd, &data[i].exec_sync,
> > USER_FENCE_VALUE,
> > > +exec_queues[i],
> > >  			       fence_timeout);
> > >
> > >  	/* Wait for all execs to complete */ @@ -267,7 +267,7 @@
> > > test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> > >  	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> > >  	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr,
> > bo_size,
> > >  			   sync, 1);
> > > -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL,
> > > +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0,
> > >  		       fence_timeout);
> > >
> > >  	for (i = j; i < n_execs; i++)
> > > diff --git a/tests/intel/xe_exec_fault_mode.c
> > > b/tests/intel/xe_exec_fault_mode.c
> > > index ee7cbb604..27921f47a 100644
> > > --- a/tests/intel/xe_exec_fault_mode.c
> > > +++ b/tests/intel/xe_exec_fault_mode.c
> > > @@ -195,14 +195,14 @@ test_exec(int fd, struct
> > drm_xe_engine_class_instance *eci,
> > >  	}
> > >
> > >  #define ONE_SEC	MS_TO_NS(1000)
> > > -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL,
> > ONE_SEC);
> > > +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0,
> > ONE_SEC);
> > >  	data[0].vm_sync = 0;
> > >
> > >  	if (flags & PREFETCH) {
> > >  		/* Should move to system memory */
> > >  		xe_vm_prefetch_async(fd, vm, bind_exec_queues[0], 0,
> > addr,
> > >  				     bo_size, sync, 1, 0);
> > > -		xe_wait_ufence(fd, &data[0].vm_sync,
> > USER_FENCE_VALUE, NULL,
> > > +		xe_wait_ufence(fd, &data[0].vm_sync,
> > USER_FENCE_VALUE, 0,
> > >  			       ONE_SEC);
> > >  		data[0].vm_sync = 0;
> > >  	}
> > > @@ -230,7 +230,7 @@ test_exec(int fd, struct
> > > drm_xe_engine_class_instance *eci,
> > >
> > >  		if (flags & REBIND && i + 1 != n_execs) {
> > >  			xe_wait_ufence(fd, &data[i].exec_sync,
> > USER_FENCE_VALUE,
> > > -				       NULL, ONE_SEC);
> > > +				       exec_queues[e], ONE_SEC);
> > >  			xe_vm_unbind_async(fd, vm, bind_exec_queues[e],
> > 0,
> > >  					   addr, bo_size, NULL, 0);
> > >
> > > @@ -246,7 +246,7 @@ test_exec(int fd, struct
> > drm_xe_engine_class_instance *eci,
> > >  							 addr, bo_size, sync,
> > >  							 1);
> > >  			xe_wait_ufence(fd, &data[0].vm_sync,
> > USER_FENCE_VALUE,
> > > -				       NULL, ONE_SEC);
> > > +				       0, ONE_SEC);
> > >  			data[0].vm_sync = 0;
> > >  		}
> > >
> > > @@ -259,7 +259,7 @@ test_exec(int fd, struct
> > drm_xe_engine_class_instance *eci,
> > >  				 * an invalidate.
> > >  				 */
> > >  				xe_wait_ufence(fd, &data[i].exec_sync,
> > > -					       USER_FENCE_VALUE, NULL,
> > ONE_SEC);
> > > +					       USER_FENCE_VALUE,
> > exec_queues[e], ONE_SEC);
> > >  				igt_assert_eq(data[i].data, 0xc0ffee);
> > >  			} else if (i * 2 != n_execs) {
> > >  				/*
> > > @@ -290,13 +290,13 @@ test_exec(int fd, struct
> > drm_xe_engine_class_instance *eci,
> > >  		j = flags & INVALIDATE ? n_execs - 1 : 0;
> > >  		for (i = j; i < n_execs; i++)
> > >  			xe_wait_ufence(fd, &data[i].exec_sync,
> > > -				       USER_FENCE_VALUE, NULL, ONE_SEC);
> > > +				       USER_FENCE_VALUE, exec_queues[i],
> > ONE_SEC);
> > >  	}
> > >
> > >  	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> > >  	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr,
> > bo_size,
> > >  			   sync, 1);
> > 
> > just to confirm... we don't need to get the bind_exec_queues there right?!
> Here I can use the bind_exec_queues for vm_bind instead of '0' below
> > 
> > > -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL,
> > ONE_SEC);
> > > +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0,
> > ONE_SEC);
> > >
> > >  	if (!(flags & INVALID_FAULT)) {
> > >  		for (i = j; i < n_execs; i++)
> > > diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> > > index edfd27fe0..e133706ee 100644
> > > --- a/tests/intel/xe_exec_reset.c
> > > +++ b/tests/intel/xe_exec_reset.c
> > > @@ -564,7 +564,7 @@ test_compute_mode(int fd, struct
> > drm_xe_engine_class_instance *eci,
> > >  	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
> > >
> > >  #define THREE_SEC	MS_TO_NS(3000)
> > > -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL,
> > THREE_SEC);
> > > +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0,
> > > +THREE_SEC);
> > >  	data[0].vm_sync = 0;
> > >
> > >  	for (i = 0; i < n_execs; i++) {
> > > @@ -618,11 +618,11 @@ test_compute_mode(int fd, struct
> > > drm_xe_engine_class_instance *eci,
> > >
> > >  	for (i = 1; i < n_execs; i++)
> > >  		xe_wait_ufence(fd, &data[i].exec_sync,
> > USER_FENCE_VALUE,
> > > -			       NULL, THREE_SEC);
> > > +			       exec_queues[i], THREE_SEC);
> > >
> > >  	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> > >  	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> > > -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL,
> > THREE_SEC);
> > > +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0,
> > > +THREE_SEC);
> > 
> > why do you pick '0' here and 'exec_queue' in other places in this same code?
> For vm_bind we didn't have any exec_queue, because of this I used "0"

But isn't 0 a valid exec_queue_id number?

> > 
> > >
> > >  	for (i = 1; i < n_execs; i++)
> > >  		igt_assert_eq(data[i].data, 0xc0ffee); diff --git
> > > a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c index
> > > fcb926698..f8450a844 100644
> > > --- a/tests/intel/xe_exec_threads.c
> > > +++ b/tests/intel/xe_exec_threads.c
> > > @@ -331,7 +331,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t
> > > addr, uint64_t userptr,
> > >
> > >  	fence_timeout = igt_run_in_simulation() ? THIRTY_SEC : THREE_SEC;
> > >
> > > -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL,
> > fence_timeout);
> > > +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0,
> > > +fence_timeout);
> > >  	data[0].vm_sync = 0;
> > >
> > >  	for (i = 0; i < n_execs; i++) {
> > > @@ -359,7 +359,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t
> > addr, uint64_t userptr,
> > >  			for (j = i - 0x20; j <= i; ++j)
> > >  				xe_wait_ufence(fd, &data[j].exec_sync,
> > >  					       USER_FENCE_VALUE,
> > > -					       NULL, fence_timeout);
> > > +					       exec_queues[e], fence_timeout);
> > >  			xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size,
> > >  					   NULL, 0);
> > >
> > > @@ -374,7 +374,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t
> > addr, uint64_t userptr,
> > >  							 addr, bo_size, sync,
> > >  							 1);
> > >  			xe_wait_ufence(fd, &data[0].vm_sync,
> > USER_FENCE_VALUE,
> > > -				       NULL, fence_timeout);
> > > +				       0, fence_timeout);
> > >  			data[0].vm_sync = 0;
> > >  		}
> > >
> > > @@ -389,7 +389,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t
> > addr, uint64_t userptr,
> > >  				for (j = i == 0x20 ? 0 : i - 0x1f; j <= i; ++j)
> > >  					xe_wait_ufence(fd,
> > &data[j].exec_sync,
> > >  						       USER_FENCE_VALUE,
> > > -						       NULL, fence_timeout);
> > > +						       exec_queues[e],
> > fence_timeout);
> > >  				igt_assert_eq(data[i].data, 0xc0ffee);
> > >  			} else if (i * 2 != n_execs) {
> > >  				/*
> > > @@ -421,7 +421,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t
> > addr, uint64_t userptr,
> > >  	j = flags & INVALIDATE ?
> > >  		(flags & RACE ? n_execs / 2 + 1 : n_execs - 1) : 0;
> > >  	for (i = j; i < n_execs; i++)
> > > -		xe_wait_ufence(fd, &data[i].exec_sync,
> > USER_FENCE_VALUE, NULL,
> > > +		xe_wait_ufence(fd, &data[i].exec_sync,
> > USER_FENCE_VALUE,
> > > +exec_queues[i],
> > >  			       fence_timeout);
> > >
> > >  	/* Wait for all execs to complete */ @@ -430,7 +430,7 @@
> > > test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t
> > > userptr,
> > >
> > >  	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> > >  	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> > > -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL,
> > fence_timeout);
> > > +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0,
> > > +fence_timeout);
> > >
> > >  	for (i = j; i < n_execs; i++)
> > >  		igt_assert_eq(data[i].data, 0xc0ffee); diff --git
> > > a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c index
> > > 3be987954..0bd7e5dce 100644
> > > --- a/tests/intel/xe_waitfence.c
> > > +++ b/tests/intel/xe_waitfence.c
> > > @@ -37,22 +37,51 @@ static void do_bind(int fd, uint32_t vm, uint32_t
> > > bo, uint64_t offset,  }
> > >
> > >  static int64_t wait_with_eci_abstime(int fd, uint64_t *addr, uint64_t value,
> > > -				     struct drm_xe_engine_class_instance *eci,
> > > -				     int64_t timeout)
> > > +				     uint32_t exec_queue, int64_t timeout)
> > >  {
> > >  	struct drm_xe_wait_user_fence wait = {
> > >  		.addr = to_user_pointer(addr),
> > >  		.op = DRM_XE_UFENCE_WAIT_OP_EQ,
> > > -		.flags = !eci ? 0 : DRM_XE_UFENCE_WAIT_FLAG_ABSTIME,
> > > +		.flags = !exec_queue ? 0 :
> > DRM_XE_UFENCE_WAIT_FLAG_ABSTIME,
> > >  		.value = value,
> > >  		.mask = DRM_XE_UFENCE_WAIT_MASK_U64,
> > >  		.timeout = timeout,
> > > -		.num_engines = eci ? 1 : 0,
> > > -		.instances = eci ? to_user_pointer(eci) : 0,
> > > +		.exec_queue_id = exec_queue,
> > > +	};
> > > +	struct timespec ts;
> > > +
> > > +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE,
> > &wait), 0);
> > > +	igt_assert_eq(clock_gettime(CLOCK_MONOTONIC, &ts), 0);
> > > +
> > > +	return ts.tv_sec * 1e9 + ts.tv_nsec; }
> > > +
> > > +/**
> > > + * xe_wait_ufence_abstime:
> > > + * @fd: xe device fd
> > > + * @addr: address of value to compare
> > > + * @value: expected value (equal) in @address
> > > + * @exec_queue: exec_queue id
> > > + * @timeout: absolute time when wait expire
> > > + *
> > > + * Function compares @value with memory pointed by @addr until they
> > are equal.
> > > + *
> > > + * Returns elapsed time in nanoseconds if user fence was signalled.
> > > + */
> > > +int64_t xe_wait_ufence_abstime(int fd, uint64_t *addr, uint64_t value,
> > > +			       uint32_t exec_queue, int64_t timeout) {
> > > +	struct drm_xe_wait_user_fence wait = {
> > > +		.addr = to_user_pointer(addr),
> > > +		.op = DRM_XE_UFENCE_WAIT_OP_EQ,
> > > +		.flags = !exec_queue ?
> > DRM_XE_UFENCE_WAIT_FLAG_ABSTIME : 0,
> > > +		.value = value,
> > > +		.mask = DRM_XE_UFENCE_WAIT_MASK_U64,
> > > +		.timeout = timeout,
> > > +		.exec_queue_id = exec_queue,
> > >  	};
> > >  	struct timespec ts;
> > >
> > > -	igt_assert(eci);
> > >  	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE,
> > &wait), 0);
> > >  	igt_assert_eq(clock_gettime(CLOCK_MONOTONIC, &ts), 0);
> > >
> > > @@ -82,7 +111,6 @@ enum waittype {
> > >  static void
> > >  waitfence(int fd, enum waittype wt)
> > >  {
> > > -	struct drm_xe_engine *engine = NULL;
> > >  	struct timespec ts;
> > >  	int64_t current, signalled;
> > >  	uint32_t bo_1;
> > > @@ -111,15 +139,15 @@ waitfence(int fd, enum waittype wt)
> > >  	do_bind(fd, vm, bo_7, 0, 0xeffff0000, 0x10000, 7);
> > >
> > >  	if (wt == RELTIME) {
> > > -		timeout = xe_wait_ufence(fd, &wait_fence, 7, NULL,
> > MS_TO_NS(10));
> > > +		timeout = xe_wait_ufence(fd, &wait_fence, 7, 0,
> > MS_TO_NS(10));
> > >  		igt_debug("wait type: RELTIME - timeout: %ld, timeout left:
> > %ld\n",
> > >  			  MS_TO_NS(10), timeout);
> > >  	} else if (wt == ENGINE) {
> > > -		engine = xe_engine(fd, 1);
> > > +		uint32_t exec_queue = xe_exec_queue_create_class(fd,
> > vm,
> > > +DRM_XE_ENGINE_CLASS_COPY);
> > >  		clock_gettime(CLOCK_MONOTONIC, &ts);
> > >  		current = ts.tv_sec * 1e9 + ts.tv_nsec;
> > >  		timeout = current + MS_TO_NS(10);
> > > -		signalled = wait_with_eci_abstime(fd, &wait_fence, 7,
> > &engine->instance, timeout);
> > > +		signalled = wait_with_eci_abstime(fd, &wait_fence, 7,
> > exec_queue,
> > > +timeout);
> > >  		igt_debug("wait type: ENGINE ABSTIME - timeout: %" PRId64
> > >  			  ", signalled: %" PRId64
> > >  			  ", elapsed: %" PRId64 "\n",
> > > @@ -128,7 +156,7 @@ waitfence(int fd, enum waittype wt)
> > >  		clock_gettime(CLOCK_MONOTONIC, &ts);
> > >  		current = ts.tv_sec * 1e9 + ts.tv_nsec;
> > >  		timeout = current + MS_TO_NS(10);
> > > -		signalled = xe_wait_ufence_abstime(fd, &wait_fence, 7,
> > NULL, timeout);
> > > +		signalled = xe_wait_ufence_abstime(fd, &wait_fence, 7, 0,
> > timeout);
> > >  		igt_debug("wait type: ABSTIME - timeout: %" PRId64
> > >  			  ", signalled: %" PRId64
> > >  			  ", elapsed: %" PRId64 "\n",
> > > @@ -149,9 +177,6 @@ waitfence(int fd, enum waittype wt)
> > >   *
> > >   * SUBTEST: invalid-ops
> > >   * Description: Check query with invalid ops returns expected error
> > > code
> > > - *
> > > - * SUBTEST: invalid-engine
> > > - * Description: Check query with invalid engine info returns expected error
> > code
> > >   */
> > >
> > >  static void
> > > @@ -166,8 +191,7 @@ invalid_flag(int fd)
> > >  		.value = 1,
> > >  		.mask = DRM_XE_UFENCE_WAIT_MASK_U64,
> > >  		.timeout = -1,
> > > -		.num_engines = 0,
> > > -		.instances = 0,
> > > +		.exec_queue_id = 0,
> > >  	};
> > >
> > >  	uint32_t vm = xe_vm_create(fd,
> > DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT,
> > > 0); @@ -191,8 +215,7 @@ invalid_ops(int fd)
> > >  		.value = 1,
> > >  		.mask = DRM_XE_UFENCE_WAIT_MASK_U64,
> > >  		.timeout = 1,
> > > -		.num_engines = 0,
> > > -		.instances = 0,
> > > +		.exec_queue_id = 0,
> > >  	};
> > >
> > >  	uint32_t vm = xe_vm_create(fd,
> > DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT,
> > > 0); @@ -204,32 +227,6 @@ invalid_ops(int fd)
> > >  	do_ioctl_err(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait,
> > EINVAL);  }
> > >
> > > -static void
> > > -invalid_engine(int fd)
> > > -{
> > > -	uint32_t bo;
> > > -
> > > -	struct drm_xe_wait_user_fence wait = {
> > > -		.addr = to_user_pointer(&wait_fence),
> > > -		.op = DRM_XE_UFENCE_WAIT_OP_EQ,
> > > -		.flags = 0,
> > > -		.value = 1,
> > > -		.mask = DRM_XE_UFENCE_WAIT_MASK_U64,
> > > -		.timeout = -1,
> > > -		.num_engines = 1,
> > > -		.instances = 0,
> > > -	};
> > > -
> > > -	uint32_t vm = xe_vm_create(fd,
> > DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> > > -
> > > -	bo = xe_bo_create(fd, vm, 0x40000, vram_if_possible(fd, 0), 0);
> > > -
> > > -	do_bind(fd, vm, bo, 0, 0x200000, 0x40000, 1);
> > > -
> > > -	do_ioctl_err(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait,
> > EFAULT);
> > > -}
> > > -
> > 
> > why are you removing this?
> > should be in a separate patch as well
> >
> I will keep this for now and remove later
>  Krishna
> > > -
> > >  igt_main
> > >  {
> > >  	int fd;
> > > @@ -252,9 +249,6 @@ igt_main
> > >  	igt_subtest("invalid-ops")
> > >  		invalid_ops(fd);
> > >
> > > -	igt_subtest("invalid-engine")
> > > -		invalid_engine(fd);
> > > -
> > >  	igt_fixture
> > >  		drm_close_driver(fd);
> > >  }
> > > --
> > > 2.25.1
> > >
