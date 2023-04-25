Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 428FB10E650
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Apr 2023 03:36:58 +0000 (UTC)
Date: Tue, 25 Apr 2023 05:36:54 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: sai.gowtham.ch@intel.com
Message-ID: <20230425033654.zw4pw32bdqwohvsy@zkempczy-mobl2>
References: <20230424115423.28726-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230424115423.28726-1-sai.gowtham.ch@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/xe/xe_spin: Integrate igt_spin_new
 with Xe.
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

On Mon, Apr 24, 2023 at 05:24:23PM +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Extending the spin_create implementation and allocator handle support in xe,
> where it submits dummy work loads to engine. This Implementation is wrapped
> around vm_bind and unbind as we are supposed to do it manually for xe.
> 
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  lib/xe/xe_spin.c | 39 +++++++++++++++++++++++++++++++++++++++
>  lib/xe/xe_spin.h |  9 +++++++++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index 856d0ba2..e0629419 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -82,6 +82,45 @@ void xe_spin_end(struct xe_spin *spin)
>  	spin->end = 0;
>  }
>  
> +void xe_spin_new(int fd, struct xe_spin *spin, struct drm_xe_engine_class_instance *eci)
> +{
> +	size_t bo_size = xe_get_default_alignment(fd);
> +	uint32_t syncobj;
> +	uint64_t ahnd = spin->ahnd, addr;
> +	struct drm_xe_sync sync = {
> +		.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 1,
> +		.syncs = to_user_pointer(&sync),
> +	};
> +
> +	spin->vm = xe_vm_create(fd, 0, 0);
> +	spin->bo = xe_bo_create(fd, eci->gt_id, spin->vm, bo_size);
> +	spin->engine = xe_engine_create(fd, spin->vm, eci, 0);
> +	syncobj = syncobj_create(fd, 0);
> +
> +	if (ahnd)
> +		addr = intel_allocator_alloc_with_strategy(ahnd, spin->bo, bo_size, 0, ALLOC_STRATEGY_LOW_TO_HIGH);
> +
> +	xe_vm_bind_sync(fd, spin->vm, spin->bo, 0, addr, bo_size);
> +
> +	xe_spin_init(spin, addr, true);
> +	exec.engine_id = spin->engine;
> +	exec.address = addr;
> +	sync.handle = syncobj;
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec), 0);
> +
> +}
> +
> +void xe_spin_free(struct xe_spin *spin)
> +{
> +	xe_engine_destroy(spin->fd, spin->engine);
> +	xe_vm_destroy(spin->fd, spin->vm);
> +	gem_close(spin->fd, spin->bo);
> +}

You need to embed this into igt_spin_new(). Take a look to kms_cursor_legacy.c.
We want to have this syntax intact:

	spin = igt_spin_new(display->drm_fd,
			    .ahnd = ahnd,
			    .dependency = fb_info.gem_handle);

--
Zbigniew

>  void xe_cork_init(int fd, struct drm_xe_engine_class_instance *hwe,
>  		  struct xe_cork *cork)
>  {
> diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
> index 73f9a026..12116445 100644
> --- a/lib/xe/xe_spin.h
> +++ b/lib/xe/xe_spin.h
> @@ -17,15 +17,24 @@
>  /* Mapped GPU object */
>  struct xe_spin {
>  	uint32_t batch[16];
> +	int fd;
>  	uint64_t pad;
>  	uint32_t start;
>  	uint32_t end;
> +	uint64_t ahnd;
> +	uint32_t engine;
> +	uint32_t vm;
> +	uint32_t bo;
> +
>  };
>  
>  void xe_spin_init(struct xe_spin *spin, uint64_t addr, bool preempt);
>  bool xe_spin_started(struct xe_spin *spin);
>  void xe_spin_wait_started(struct xe_spin *spin);
>  void xe_spin_end(struct xe_spin *spin);
> +void xe_spin_new(int fd, struct xe_spin *spin,
> +		struct drm_xe_engine_class_instance *hwe);
> +void xe_spin_free(struct xe_spin *spin);
>  
>  struct xe_cork {
>  	struct xe_spin *spin;
> -- 
> 2.39.1
> 
