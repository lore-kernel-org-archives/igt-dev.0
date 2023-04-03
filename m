Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 230B210E121
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Apr 2023 05:58:51 +0000 (UTC)
Date: Mon, 3 Apr 2023 07:58:47 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <20230403055847.rjquu5n77of3bwid@zkempczy-mobl2>
References: <20230328124044.268766-1-maarten.lankhorst@linux.intel.com>
 <20230328124044.268766-2-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230328124044.268766-2-maarten.lankhorst@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/xe: Prepare for widening
 drm_xe_sync.handle to 64-bits
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

On Tue, Mar 28, 2023 at 02:40:44PM +0200, Maarten Lankhorst wrote:
> By not using a pointer to drm_xe_sync.handle, but taking the value, it
> becomes safer when we change the word size to 64-bits. This is required
> to make drm_xe_sync.handle safe on big-endian, and to explicitly set
> the high 32-bits to 0.
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  lib/igt_syncobj.c           | 14 +++++++
>  lib/igt_syncobj.h           |  4 ++
>  lib/xe/xe_ioctl.c           |  4 +-
>  tests/xe/xe_compute.c       |  4 +-
>  tests/xe/xe_dma_buf_sync.c  |  7 ++--
>  tests/xe/xe_evict.c         |  4 +-
>  tests/xe/xe_exec_balancer.c |  8 ++--
>  tests/xe/xe_exec_basic.c    |  6 +--
>  tests/xe/xe_exec_reset.c    | 19 +++++----
>  tests/xe/xe_exec_threads.c  | 20 ++++-----
>  tests/xe/xe_guc_pc.c        |  4 +-
>  tests/xe/xe_huc_copy.c      |  4 +-
>  tests/xe/xe_pm.c            |  8 ++--
>  tests/xe/xe_vm.c            | 81 +++++++++++++++++--------------------
>  14 files changed, 96 insertions(+), 91 deletions(-)
> 
> diff --git a/lib/igt_syncobj.c b/lib/igt_syncobj.c
> index a24ed10b7..95cad585e 100644
> --- a/lib/igt_syncobj.c
> +++ b/lib/igt_syncobj.c
> @@ -248,6 +248,14 @@ syncobj_wait(int fd, uint32_t *handles, uint32_t count,
>  	return true;
>  }
>  
> +bool
> +syncobj_wait1(int fd, uint32_t handle,
> +	     uint64_t abs_timeout_nsec, uint32_t flags,
> +	     uint32_t *first_signaled)

Invalid indent. Also lacks of documentation for public function.
I'm not sure wait1 is lucky suffix, reminds me dupX() history.
Maybe syncobj_wait_handle() or syncobj_wait_single()?

> +{
> +	return syncobj_wait(fd, &handle, 1, abs_timeout_nsec, flags, first_signaled);
> +}

How this (&handle) relates to passing the value mentioned in commit message?
I still see pointer here which points to handle on the stack. So if I'm
not wrong code still points to handle - where's that passing by a value then?

> +
>  static int
>  __syncobj_reset(int fd, uint32_t *handles, uint32_t count)
>  {
> @@ -278,6 +286,12 @@ syncobj_reset(int fd, uint32_t *handles, uint32_t count)
>  	igt_assert_eq(__syncobj_reset(fd, handles, count), 0);
>  }
>  
> +void
> +syncobj_reset1(int fd, uint32_t handle)
> +{
> +	syncobj_reset(fd, &handle, 1);
> +}
> +

Similar issue with suffix.

--
Zbigniew

>  static int
>  __syncobj_signal(int fd, uint32_t *handles, uint32_t count)
>  {
> diff --git a/lib/igt_syncobj.h b/lib/igt_syncobj.h
> index e6725671d..6d6d08cbd 100644
> --- a/lib/igt_syncobj.h
> +++ b/lib/igt_syncobj.h
> @@ -41,6 +41,9 @@ int syncobj_wait_err(int fd, uint32_t *handles, uint32_t count,
>  bool syncobj_wait(int fd, uint32_t *handles, uint32_t count,
>  		  uint64_t abs_timeout_nsec, uint32_t flags,
>  		  uint32_t *first_signaled);
> +bool syncobj_wait1(int fd, __u32 handle,
> +		   uint64_t abs_timeout_nsec, uint32_t flags,
> +		   uint32_t *first_signaled);
>  int __syncobj_timeline_wait_ioctl(int fd,
>  				  struct drm_syncobj_timeline_wait *args);
>  bool syncobj_timeline_wait(int fd, uint32_t *handles, uint64_t *points,
> @@ -51,6 +54,7 @@ int syncobj_timeline_wait_err(int fd, uint32_t *handles, uint64_t *points,
>  			      unsigned num_handles,
>  			      int64_t timeout_nsec, unsigned flags);
>  void syncobj_reset(int fd, uint32_t *handles, uint32_t count);
> +void syncobj_reset1(int fd, uint32_t handle);
>  void syncobj_signal(int fd, uint32_t *handles, uint32_t count);
>  void syncobj_timeline_query(int fd, uint32_t *handles, uint64_t *points,
>  			    uint32_t count);
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index 9d5793dff..62da03c7d 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -207,7 +207,7 @@ static void __xe_vm_bind_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
>  	__xe_vm_bind_assert(fd, vm, 0, bo, offset, addr, size, op, &sync, 1, 0,
>  			    0);
>  
> -	igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait1(fd, sync.handle, INT64_MAX, 0, NULL));
>  	syncobj_destroy(fd, sync.handle);
>  }
>  
> @@ -386,7 +386,7 @@ void xe_exec_wait(int fd, uint32_t engine, uint64_t addr)
>  
>  	xe_exec_sync(fd, engine, addr, &sync, 1);
>  
> -	igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait1(fd, sync.handle, INT64_MAX, 0, NULL));
>  	syncobj_destroy(fd, sync.handle);
>  }
>  
> diff --git a/tests/xe/xe_compute.c b/tests/xe/xe_compute.c
> index 138d80671..d72391a6e 100644
> --- a/tests/xe/xe_compute.c
> +++ b/tests/xe/xe_compute.c
> @@ -75,7 +75,7 @@ test_compute_square(int fd)
>  	for(int i = 0; i < BO_DICT_ENTRIES; i++) {
>  		bo_dict[i].data = aligned_alloc(xe_get_default_alignment(fd), bo_dict[i].size);
>  		xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(bo_dict[i].data), bo_dict[i].addr, bo_dict[i].size, &sync, 1);
> -		syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL);
> +		syncobj_wait1(fd, sync.handle, INT64_MAX, 0, NULL);
>  		memset(bo_dict[i].data, 0, bo_dict[i].size);
>  	}
>  	memcpy(bo_dict[0].data, tgllp_kernel_square_bin, tgllp_kernel_square_length);
> @@ -96,7 +96,7 @@ test_compute_square(int fd)
>  
>  	for(int i = 0; i < BO_DICT_ENTRIES; i++) {
>  		xe_vm_unbind_async(fd, vm, 0, 0, bo_dict[i].addr, bo_dict[i].size, &sync, 1);
> -		syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL);
> +		syncobj_wait1(fd, sync.handle, INT64_MAX, 0, NULL);
>  		free(bo_dict[i].data);
>  	}
>  
> diff --git a/tests/xe/xe_dma_buf_sync.c b/tests/xe/xe_dma_buf_sync.c
> index 8b97480a7..91fc54adb 100644
> --- a/tests/xe/xe_dma_buf_sync.c
> +++ b/tests/xe/xe_dma_buf_sync.c
> @@ -195,14 +195,13 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
>  
>  		/* Verify exec blocked on spinner / prime BO */
>  		usleep(5000);
> -		igt_assert(!syncobj_wait(fd[1], &sync[1].handle, 1, 1, 0,
> -					 NULL));
> +		igt_assert(!syncobj_wait1(fd[1], sync[1].handle, 1, 0, NULL));
>  		igt_assert_eq(data[i]->data, 0x0);
>  
>  		/* End spinner and verify exec complete */
>  		xe_spin_end(&data[i]->spin);
> -		igt_assert(syncobj_wait(fd[1], &sync[1].handle, 1, INT64_MAX,
> -					0, NULL));
> +		igt_assert(syncobj_wait1(fd[1], sync[1].handle, INT64_MAX, 0,
> +					 NULL));
>  		igt_assert_eq(data[i]->data, 0xc0ffee);
>  
>  		/* Clean up */
> diff --git a/tests/xe/xe_evict.c b/tests/xe/xe_evict.c
> index eddbbd6f4..79d018c30 100644
> --- a/tests/xe/xe_evict.c
> +++ b/tests/xe/xe_evict.c
> @@ -124,7 +124,7 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
>  				xe_vm_bind_async(fd, vm3, bind_engines[2], __bo,
>  						 0, addr,
>  						 bo_size, sync, 1);
> -				igt_assert(syncobj_wait(fd, &sync[0].handle, 1,
> +				igt_assert(syncobj_wait1(fd, sync[0].handle,
>  							INT64_MAX, 0, NULL));
>  				xe_vm_bind_async(fd, i & 1 ? vm2 : vm,
>  						 i & 1 ? bind_engines[1] :
> @@ -168,7 +168,7 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
>  	for (i = 0; i < n_engines; i++)
>  		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
>  					NULL));
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait1(fd, sync[0].handle, INT64_MAX, 0, NULL));
>  
>  	for (i = 0; i < n_execs; i++) {
>  		uint32_t __bo;
> diff --git a/tests/xe/xe_exec_balancer.c b/tests/xe/xe_exec_balancer.c
> index f3341a99e..03ab83330 100644
> --- a/tests/xe/xe_exec_balancer.c
> +++ b/tests/xe/xe_exec_balancer.c
> @@ -110,11 +110,11 @@ static void test_all_active(int fd, int gt, int class)
>  		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
>  					NULL));
>  	}
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait1(fd, sync[0].handle, INT64_MAX, 0, NULL));
>  
>  	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
>  	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait1(fd, sync[0].handle, INT64_MAX, 0, NULL));
>  
>  	syncobj_destroy(fd, sync[0].handle);
>  	for (i = 0; i < num_placements; i++) {
> @@ -332,11 +332,11 @@ test_exec(int fd, int gt, int class, int n_engines, int n_execs,
>  	for (i = 0; i < n_engines && n_execs; i++)
>  		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
>  					NULL));
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait1(fd, sync[0].handle, INT64_MAX, 0, NULL));
>  
>  	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
>  	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait1(fd, sync[0].handle, INT64_MAX, 0, NULL));
>  
>  	for (i = (flags & INVALIDATE && n_execs) ? n_execs - 1 : 0;
>  	     i < n_execs; i++)
> diff --git a/tests/xe/xe_exec_basic.c b/tests/xe/xe_exec_basic.c
> index 2a3cebd36..3a4ca55b7 100644
> --- a/tests/xe/xe_exec_basic.c
> +++ b/tests/xe/xe_exec_basic.c
> @@ -254,11 +254,11 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  
>  	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
>  	for (i = 0; i < n_vm; ++i) {
> -		syncobj_reset(fd, &sync[0].handle, 1);
> +		syncobj_reset1(fd, sync[0].handle);
>  		xe_vm_unbind_async(fd, vm[i], bind_engines[i], 0, addr[i],
>  				   bo_size, sync, 1);
> -		igt_assert(syncobj_wait(fd, &sync[0].handle, 1,
> -					INT64_MAX, 0, NULL));
> +		igt_assert(syncobj_wait1(fd, sync[0].handle, INT64_MAX, 0,
> +					 NULL));
>  	}
>  
>  	for (i = (flags & INVALIDATE && n_execs) ? n_execs - 1 : 0;
> diff --git a/tests/xe/xe_exec_reset.c b/tests/xe/xe_exec_reset.c
> index 57dc90dd0..2ae1a51ad 100644
> --- a/tests/xe/xe_exec_reset.c
> +++ b/tests/xe/xe_exec_reset.c
> @@ -72,15 +72,15 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
>  
>  	xe_spin_wait_started(spin);
>  	usleep(50000);
> -	igt_assert(!syncobj_wait(fd, &syncobj, 1, 1, 0, NULL));
> +	igt_assert(!syncobj_wait1(fd, syncobj, 1, 0, NULL));
>  	xe_spin_end(spin);
>  
> -	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait1(fd, syncobj, INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait1(fd, sync[0].handle, INT64_MAX, 0, NULL));
>  
>  	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
>  	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait1(fd, sync[0].handle, INT64_MAX, 0, NULL));
>  
>  	syncobj_destroy(fd, sync[0].handle);
>  	syncobj_destroy(fd, syncobj);
> @@ -301,13 +301,12 @@ test_balancer(int fd, int gt, int class, int n_engines, int n_execs,
>  	}
>  
>  	for (i = 0; i < n_engines && n_execs; i++)
> -		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
> -					NULL));
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +		igt_assert(syncobj_wait1(fd, syncobjs[i], INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait1(fd, sync[0].handle, INT64_MAX, 0, NULL));
>  
>  	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
>  	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait1(fd, sync[0].handle, INT64_MAX, 0, NULL));
>  
>  	for (i = bad_batches; i < n_execs; i++)
>  		igt_assert_eq(data[i].data, 0xc0ffee);
> @@ -484,11 +483,11 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  	for (i = 0; i < n_engines && n_execs; i++)
>  		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
>  					NULL));
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait1(fd, sync[0].handle, INT64_MAX, 0, NULL));
>  
>  	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
>  	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait1(fd, sync[0].handle, INT64_MAX, 0, NULL));
>  
>  	for (i = 1; i < n_execs; i++)
>  		igt_assert_eq(data[i].data, 0xc0ffee);
> diff --git a/tests/xe/xe_exec_threads.c b/tests/xe/xe_exec_threads.c
> index c34d8aec6..9b3ca51aa 100644
> --- a/tests/xe/xe_exec_threads.c
> +++ b/tests/xe/xe_exec_threads.c
> @@ -194,8 +194,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
>  				 * an invalidate.
>  				 */
>  				for (j = 0; j < n_engines; ++j)
> -					igt_assert(syncobj_wait(fd,
> -								&syncobjs[j], 1,
> +					igt_assert(syncobj_wait1(fd, syncobjs[j],
>  								INT64_MAX, 0,
>  								NULL));
>  				igt_assert_eq(data[i].data, 0xc0ffee);
> @@ -217,13 +216,12 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
>  	}
>  
>  	for (i = 0; i < n_engines; i++)
> -		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
> -					NULL));
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +		igt_assert(syncobj_wait1(fd, syncobjs[i], INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait1(fd, sync[0].handle, INT64_MAX, 0, NULL));
>  
>  	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
>  	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait1(fd, sync[0].handle, INT64_MAX, 0, NULL));
>  
>  	for (i = (flags & INVALIDATE && n_execs) ? n_execs - 1 : 0;
>  	     i < n_execs; i++)
> @@ -637,8 +635,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  				 * an invalidate.
>  				 */
>  				for (j = 0; j < n_engines; ++j)
> -					igt_assert(syncobj_wait(fd,
> -								&syncobjs[j], 1,
> +					igt_assert(syncobj_wait1(fd, syncobjs[j],
>  								INT64_MAX, 0,
>  								NULL));
>  				if (!(flags & HANG && e == hang_engine))
> @@ -661,14 +658,13 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  	}
>  
>  	for (i = 0; i < n_engines; i++)
> -		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
> -					NULL));
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +		igt_assert(syncobj_wait1(fd, syncobjs[i], INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait1(fd, sync[0].handle, INT64_MAX, 0, NULL));
>  
>  	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
>  	xe_vm_unbind_async(fd, vm, bind_engines[0], 0, addr,
>  			   bo_size, sync, 1);
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait1(fd, sync[0].handle, INT64_MAX, 0, NULL));
>  
>  	for (i = flags & INVALIDATE ? n_execs - 1 : 0;
>  	     i < n_execs; i++) {
> diff --git a/tests/xe/xe_guc_pc.c b/tests/xe/xe_guc_pc.c
> index 60c93288b..e87f996cc 100644
> --- a/tests/xe/xe_guc_pc.c
> +++ b/tests/xe/xe_guc_pc.c
> @@ -110,12 +110,12 @@ static void exec_basic(int fd, struct drm_xe_engine_class_instance *eci,
>  		igt_assert_eq(data[i].data, 0xc0ffee);
>  	}
>  
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait1(fd, sync[0].handle, INT64_MAX, 0, NULL));
>  
>  	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
>  	xe_vm_unbind_async(fd, vm, bind_engines[0], 0, addr,
>  			   bo_size, sync, 1);
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait1(fd, sync[0].handle, INT64_MAX, 0, NULL));
>  
>  	for (i = 0; i < n_execs; i++)
>  		igt_assert_eq(data[i].data, 0xc0ffee);
> diff --git a/tests/xe/xe_huc_copy.c b/tests/xe/xe_huc_copy.c
> index ee3896cef..0292e7c64 100644
> --- a/tests/xe/xe_huc_copy.c
> +++ b/tests/xe/xe_huc_copy.c
> @@ -126,7 +126,7 @@ test_huc_copy(int fd)
>  	for(int i = 0; i < BO_DICT_ENTRIES; i++) {
>  		bo_dict[i].data = aligned_alloc(xe_get_default_alignment(fd), bo_dict[i].size);
>  		xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(bo_dict[i].data), bo_dict[i].addr, bo_dict[i].size, &sync, 1);
> -		syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL);
> +		syncobj_wait1(fd, sync.handle, INT64_MAX, 0, NULL);
>  		memset(bo_dict[i].data, 0, bo_dict[i].size);
>  	}
>  	dinput = (char *)bo_dict[0].data;
> @@ -143,7 +143,7 @@ test_huc_copy(int fd)
>  
>  	for(int i = 0; i < BO_DICT_ENTRIES; i++) {
>  		xe_vm_unbind_async(fd, vm, 0, 0, bo_dict[i].addr, bo_dict[i].size, &sync, 1);
> -		syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL);
> +		syncobj_wait1(fd, sync.handle, INT64_MAX, 0, NULL);
>  		free(bo_dict[i].data);
>  	}
>  
> diff --git a/tests/xe/xe_pm.c b/tests/xe/xe_pm.c
> index 861f6b915..1af453212 100644
> --- a/tests/xe/xe_pm.c
> +++ b/tests/xe/xe_pm.c
> @@ -303,8 +303,8 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  						      SUSPEND_TEST_NONE);
>  	}
>  
> -	igt_assert(syncobj_wait(device.fd_xe, &sync[0].handle, 1, INT64_MAX, 0,
> -				NULL));
> +	igt_assert(syncobj_wait1(device.fd_xe, sync[0].handle, INT64_MAX, 0,
> +				 NULL));
>  
>  	if (check_rpm && runtime_usage_available(device.pci_xe))
>  		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
> @@ -312,8 +312,8 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
>  	xe_vm_unbind_async(device.fd_xe, vm, bind_engines[0], 0, addr,
>  			   bo_size, sync, 1);
> -	igt_assert(syncobj_wait(device.fd_xe, &sync[0].handle, 1, INT64_MAX, 0,
> -NULL));
> +	igt_assert(syncobj_wait1(device.fd_xe, sync[0].handle, INT64_MAX, 0,
> +				 NULL));
>  
>  	for (i = 0; i < n_execs; i++)
>  		igt_assert_eq(data[i].data, 0xc0ffee);
> diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
> index 15356c704..a427014a5 100644
> --- a/tests/xe/xe_vm.c
> +++ b/tests/xe/xe_vm.c
> @@ -285,7 +285,7 @@ static void unbind_all(int fd, int n_vmas)
>  	sync[0].handle = syncobj_create(fd, 0);
>  	xe_vm_unbind_all_async(fd, vm, 0, bo, sync, 1);
>  
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait1(fd, sync[0].handle, INT64_MAX, 0, NULL));
>  	syncobj_destroy(fd, sync[0].handle);
>  
>  	gem_close(fd, bo);
> @@ -485,8 +485,7 @@ static void vm_async_ops_err(int fd, bool destroy)
>  	}
>  
>  	for (i = 0; i < N_BINDS; i++)
> -		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
> -					NULL));
> +		igt_assert(syncobj_wait1(fd, syncobjs[i], INT64_MAX, 0, NULL));
>  
>  	if (!destroy)
>  		xe_vm_destroy(fd, vm);
> @@ -599,14 +598,12 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
>  		sync_all[n_execs].handle = sync[0].handle;
>  		xe_vm_unbind_async(fd, vm, 0, 0, addr + i * addr_stride,
>  				   bo_size, sync_all, n_execs + 1);
> -		igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0,
> -					NULL));
> +		igt_assert(syncobj_wait1(fd, sync[0].handle, INT64_MAX, 0, NULL));
>  	}
>  
>  	for (i = 0; i < n_execs; i++)
> -		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
> -					NULL));
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +		igt_assert(syncobj_wait1(fd, syncobjs[i], INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait1(fd, sync[0].handle, INT64_MAX, 0, NULL));
>  
>  	for (i = 0; i < n_execs; i++)
>  		igt_assert_eq(data[i]->data, 0xc0ffee);
> @@ -637,7 +634,7 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
>  
>  		exec.engine_id = engines[e];
>  		exec.address = batch_addr;
> -		syncobj_reset(fd, &syncobjs[e], 1);
> +		syncobj_reset1(fd, syncobjs[e]);
>  		xe_exec(fd, &exec);
>  	}
>  
> @@ -649,17 +646,15 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
>  		sync_all[n_execs].handle = sync[0].handle;
>  		xe_vm_unbind_async(fd, vm, 0, 0, addr + i * addr_stride,
>  				   bo_size, sync_all, n_execs + 1);
> -		igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0,
> -					NULL));
> +		igt_assert(syncobj_wait1(fd, sync[0].handle, INT64_MAX, 0, NULL));
>  	}
>  
>  	for (i = 0; i < n_execs; i++) {
>  		if (!(i % 2))
>  			continue;
> -		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
> -					NULL));
> +		igt_assert(syncobj_wait1(fd, syncobjs[i], INT64_MAX, 0, NULL));
>  	}
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait1(fd, sync[0].handle, INT64_MAX, 0, NULL));
>  
>  	for (i = 0; i < n_execs; i++)
>  		igt_assert_eq(data[i]->data, 0xc0ffee);
> @@ -790,19 +785,18 @@ test_bind_engines_independent(int fd, struct drm_xe_engine_class_instance *eci)
>  	}
>  
>  	/* Verify initial bind, bind + write to 2nd engine done */
> -	igt_assert(syncobj_wait(fd, &syncobjs[1], 1, INT64_MAX, 0, NULL));
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait1(fd, syncobjs[1], INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait1(fd, sync[0].handle, INT64_MAX, 0, NULL));
>  	igt_assert_eq(data[1].data, 0xc0ffee);
>  
>  	/* Verify bind + write to 1st engine still inflight */
> -	igt_assert(!syncobj_wait(fd, &syncobjs[0], 1, 1, 0, NULL));
> -	igt_assert(!syncobj_wait(fd, &syncobjs[N_ENGINES], 1, 1, 0, NULL));
> +	igt_assert(!syncobj_wait1(fd, syncobjs[0], 1, 0, NULL));
> +	igt_assert(!syncobj_wait1(fd, syncobjs[N_ENGINES], 1, 0, NULL));
>  
>  	/* Verify bind + write to 1st engine done after ending spinner */
>  	xe_spin_end(&data[0].spin);
> -	igt_assert(syncobj_wait(fd, &syncobjs[0], 1, INT64_MAX, 0, NULL));
> -	igt_assert(syncobj_wait(fd, &syncobjs[N_ENGINES], 1, INT64_MAX, 0,
> -				NULL));
> +	igt_assert(syncobj_wait1(fd, syncobjs[0], INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait1(fd, syncobjs[N_ENGINES], INT64_MAX, 0, NULL));
>  	igt_assert_eq(data[0].data, 0xc0ffee);
>  
>  	syncobj_destroy(fd, sync[0].handle);
> @@ -934,13 +928,13 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
>  		bind_ops[i].op = XE_VM_BIND_OP_UNMAP | XE_VM_BIND_FLAG_ASYNC;
>  	}
>  
> -	syncobj_reset(fd, &sync[0].handle, 1);
> +	syncobj_reset1(fd, sync[0].handle);
>  	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
>  	sync[1].flags &= ~DRM_XE_SYNC_SIGNAL;
>  	xe_vm_bind_array(fd, vm, bind_engine, bind_ops, n_execs, sync, 2);
>  
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> -	igt_assert(syncobj_wait(fd, &sync[1].handle, 1, INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait1(fd, sync[0].handle, INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait1(fd, sync[1].handle, INT64_MAX, 0, NULL));
>  
>  	for (i = 0; i < n_execs; i++)
>  		igt_assert_eq(data[i].data, 0xc0ffee);
> @@ -1104,7 +1098,7 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
>  		sync[1].handle = syncobjs[e];
>  
>  		if (i != e)
> -			syncobj_reset(fd, &sync[1].handle, 1);
> +			syncobj_reset1(fd, sync[1].handle);
>  
>  		exec.engine_id = engines[e];
>  		exec.address = batch_addr;
> @@ -1117,11 +1111,10 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
>  	}
>  
>  	for (i = 0; i < n_engines; i++)
> -		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
> -					NULL));
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +		igt_assert(syncobj_wait1(fd, syncobjs[i], INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait1(fd, sync[0].handle, INT64_MAX, 0, NULL));
>  
> -	syncobj_reset(fd, &sync[0].handle, 1);
> +	syncobj_reset1(fd, sync[0].handle);
>  	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
>  	if (flags & LARGE_BIND_FLAG_SPLIT) {
>  		xe_vm_unbind_async(fd, vm, 0, 0, base_addr,
> @@ -1132,7 +1125,7 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
>  		xe_vm_unbind_async(fd, vm, 0, 0, base_addr, bo_size,
>  				   sync, 1);
>  	}
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait1(fd, sync[0].handle, INT64_MAX, 0, NULL));
>  
>  	addr = base_addr;
>  	for (i = 0; i < n_execs; i++) {
> @@ -1216,9 +1209,9 @@ static void *hammer_thread(void *tdata)
>  		} else {
>  			exec.num_syncs = 1;
>  			xe_exec(t->fd, &exec);
> -			igt_assert(syncobj_wait(t->fd, &sync[0].handle, 1,
> -						INT64_MAX, 0, NULL));
> -			syncobj_reset(t->fd, &sync[0].handle, 1);
> +			igt_assert(syncobj_wait1(t->fd, sync[0].handle,
> +						 INT64_MAX, 0, NULL));
> +			syncobj_reset1(t->fd, sync[0].handle);
>  		}
>  		++i;
>  	}
> @@ -1389,7 +1382,7 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
>  
>  		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
>  		if (i)
> -			syncobj_reset(fd, &sync[1].handle, 1);
> +			syncobj_reset1(fd, sync[1].handle);
>  		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
>  
>  		exec.engine_id = engine;
> @@ -1401,15 +1394,15 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
>  	addr = base_addr;
>  
>  	/* Unbind some of the pages */
> -	syncobj_reset(fd, &sync[0].handle, 1);
> +	syncobj_reset1(fd, sync[0].handle);
>  	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
>  	sync[1].flags &= ~DRM_XE_SYNC_SIGNAL;
>  	xe_vm_unbind_async(fd, vm, 0, 0,
>  			   addr + unbind_n_page_offfset * page_size,
>  			   unbind_n_pages * page_size, sync, 2);
>  
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> -	igt_assert(syncobj_wait(fd, &sync[1].handle, 1, INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait1(fd, sync[0].handle, INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait1(fd, sync[1].handle, INT64_MAX, 0, NULL));
>  
>  	/* Verify all pages written */
>  	for (i = 0; i < n_binds; ++i) {
> @@ -1445,7 +1438,7 @@ try_again_after_invalidate:
>  			igt_assert(b <= ARRAY_SIZE(data[i].batch));
>  
>  			sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
> -			syncobj_reset(fd, &sync[1].handle, 1);
> +			syncobj_reset1(fd, sync[1].handle);
>  			sync[1].flags |= DRM_XE_SYNC_SIGNAL;
>  
>  			exec.engine_id = engine;
> @@ -1455,8 +1448,8 @@ try_again_after_invalidate:
>  	}
>  	addr = base_addr;
>  
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> -	igt_assert(syncobj_wait(fd, &sync[1].handle, 1, INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait1(fd, sync[0].handle, INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait1(fd, sync[1].handle, INT64_MAX, 0, NULL));
>  
>  	/* Verify all pages still bound written */
>  	for (i = 0; i < n_binds; ++i) {
> @@ -1486,7 +1479,7 @@ try_again_after_invalidate:
>  	}
>  
>  	/* Confirm unbound region can be rebound */
> -	syncobj_reset(fd, &sync[0].handle, 1);
> +	syncobj_reset1(fd, sync[0].handle);
>  	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
>  	if (flags & MUNMAP_FLAG_USERPTR)
>  		xe_vm_bind_userptr_async(fd, vm, 0,
> @@ -1516,7 +1509,7 @@ try_again_after_invalidate:
>  		igt_assert(b <= ARRAY_SIZE(data[i].batch));
>  
>  		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
> -		syncobj_reset(fd, &sync[1].handle, 1);
> +		syncobj_reset1(fd, sync[1].handle);
>  		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
>  
>  		exec.engine_id = engine;
> @@ -1527,8 +1520,8 @@ try_again_after_invalidate:
>  	}
>  	addr = base_addr;
>  
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> -	igt_assert(syncobj_wait(fd, &sync[1].handle, 1, INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait1(fd, sync[0].handle, INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait1(fd, sync[1].handle, INT64_MAX, 0, NULL));
>  
>  	/* Verify all pages written */
>  	for (i = 0; i < n_binds; ++i) {
> -- 
> 2.34.1
> 
