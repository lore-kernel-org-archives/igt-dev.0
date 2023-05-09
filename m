Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C081A10E32D
 for <igt-dev@lists.freedesktop.org>; Tue,  9 May 2023 06:36:45 +0000 (UTC)
Date: Tue, 9 May 2023 08:36:41 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: sai.gowtham.ch@intel.com
Message-ID: <20230509063641.lbetx4unxp22tq22@zkempczy-mobl2>
References: <20230505053528.25967-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230505053528.25967-1-sai.gowtham.ch@intel.com>
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

On Fri, May 05, 2023 at 11:05:28AM +0530, sai.gowtham.ch@intel.com wrote:
<cut>

> +igt_spin_t *
> +xe_spin_create(int fd, const struct igt_spin_factory *opt)
> +{
> +	struct drm_xe_engine_class_instance *eci;
> +	size_t bo_size = xe_get_default_alignment(fd);
> +	uint32_t vm, bo, engine, syncobj;
> +	uint64_t ahnd = opt->ahnd, addr;
> +	struct igt_spin *spin;
> +	struct xe_spin *xe_spin;
> +	struct drm_xe_sync sync = {
> +		.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 1,
> +		.syncs = to_user_pointer(&sync),
> +	};
> +
> +	igt_assert(ahnd);
> +	xe_spin = calloc(1, sizeof(struct xe_spin));
> +	igt_assert(xe_spin);
> +	spin = calloc(1, sizeof(struct igt_spin));
> +	igt_assert(spin);
> +
> +	bo = xe_bo_create(fd, eci->gt_id, vm, bo_size);
> +	spin = xe_bo_map(fd, bo, 0x1000);
> +	spin->handle = bo;
> +	spin->vm = xe_vm_create(fd, 0, 0);
> +	engine = xe_engine_create(fd, vm, eci, 0);
> +	spin->syncobj = syncobj_create(fd, 0);
> +
> +	if (ahnd)
> +		addr = intel_allocator_alloc_with_strategy(ahnd, bo, bo_size, 0, ALLOC_STRATEGY_LOW_TO_HIGH);

if not necessary as you've assert on the beginning.

That's all I've noticed without testcode.

--
Zbigniew

> +
> +	xe_vm_bind_sync(fd, vm, bo, 0, addr, bo_size);
> +
> +	xe_spin_init(xe_spin, addr, true);
> +	exec.engine_id = engine;
> +	exec.address = addr;
> +	sync.handle = syncobj;
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec), 0);
> +
> +	spin->batch = xe_spin->batch;
> +	spin->start = xe_spin->start;
> +	spin->end = xe_spin->end;
> +	return spin;
> +
> +}
