Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A909F483D7
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 17:37:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA57E10E011;
	Mon, 23 Mar 2026 17:37:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZUOZVOK7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 159C310E011
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 17:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774287429; x=1805823429;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=5jAJjvD2iZOLUT2xitRk1dSF4WwVri+F4e0LHzE5hPk=;
 b=ZUOZVOK7k8bdBHibjC0YkSaVhYHWOW9CA2pEoIigqujHkjsJGHI9MyqH
 RaFzRJsKtnct4jAWSuiITamOZyV5F4M2ZrpPhtFBHTn6LUe5Pi050WB79
 RUYuIJCFyBQ90HwfegTfA8aFjYT2PYubCXmi0dt4Scr7Aupn8atR96g9j
 7yrgRfb5Avzm0bcUBMdc7MdOREZNcSIDv3iO54AXgary5b32WwjvXSlZ2
 f4gLYEXjdD9ribJGJZ56HpSPKCHqIfavD/mMzs7pJ+hgh9CZFGK3mSq8f
 aQNrpDghdzN1c9qScft8sXnbc5v8CRjsx5Qp8TVy1cyalcX0gDSzcfLB3 w==;
X-CSE-ConnectionGUID: tYg1eyozQsukRWqIVuC9lg==
X-CSE-MsgGUID: bPdLZPL3ToalRpmU26CQZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="97913371"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="97913371"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 10:37:09 -0700
X-CSE-ConnectionGUID: 0yH3O6PYSbqTVG01YOC4bQ==
X-CSE-MsgGUID: BtK+oeO1TkCA5QZdpfcIvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="223283603"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.244.73])
 ([10.245.244.73])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 10:37:08 -0700
Message-ID: <5e48237f792717be2532bfe5a86b134bccc069bb.camel@linux.intel.com>
Subject: Re: [PATCH i-g-t 1/1] tests/xe_vm: Add oversubscribe concurrent
 bind stress test
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>, igt-dev@lists.freedesktop.org
Cc: nishit.sharma@intel.com
Date: Mon, 23 Mar 2026 18:37:04 +0100
In-Reply-To: <20260218164417.856114-2-sobin.thomas@intel.com>
References: <20260218164417.856114-1-sobin.thomas@intel.com>
 <20260218164417.856114-2-sobin.thomas@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Wed, 2026-02-18 at 16:44 +0000, Sobin Thomas wrote:
> Add an xe_vm subtest that oversubscribes VRAM and issues
> concurrent binds into a single VM (scratch-page mode) to
> reproduce the dma-resv/bind race found under memory pressure.
> Prior coverage lacked any case that combined multi-process bind
> pressure with VRAM oversubscription, so bind/submit could
> panic (NULL deref in xe_pt_stage_bind) instead of failing cleanly.
> The new test expects successful completion or ENOMEM/EDEADLK.
>=20
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
> =C2=A0tests/intel/xe_vm.c | 421
> ++++++++++++++++++++++++++++++++++++++++++++
> =C2=A01 file changed, 421 insertions(+)
>=20
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index ccff8f804..5c9d5ff0f 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -21,6 +21,176 @@
> =C2=A0#include "xe/xe_spin.h"
> =C2=A0#include <string.h>
> =C2=A0
> +#define MI_BB_END		(0 << 29 | 0x0A << 23 |=C2=A0 0)
> +#define MI_LOAD_REG_MEM		(0 << 29 | 0x29 << 23 | 0 <<
> 22 | 0 << 21 | 1 << 19 | 2)
> +#define MI_STORE_REG_MEM	(0 << 29 | 0x24 << 23 | 0 << 22 | 0
> << 21 | 1 << 19 | 2)
> +#define MI_MATH_R(length)		(0 << 29 | 0x1A << 23 |
> ((length) & 0xFF))
> +#define GPR_RX_ADDR(x)		(0x600 + (x) * 8)
> +#define ALU_LOAD(dst, src)	(0x080 << 20 | ((dst) << 10) |
> (src))
> +#define ALU_STORE(dst, src)	(0x180 << 20 | (dst) << 10 | (src))
> +#define ALU_ADD			(0x100 << 20)
> +#define ALU_RX(x)		(x)
> +#define ALU_SRCA		0x20
> +#define ALU_SRCB		0x21
> +#define ALU_ACCU		0x31
> +#define GB(x) (1024ULL * 1024ULL * 1024ULL * (x))

Why are you open-coding these in the test instead of relying on
intel_gpu_commands.h


> +
> +struct gem_bo {
> +	uint32_t handle;
> +	uint64_t size;
> +	int *ptr;
> +	uint64_t addr;
> +};
> +
> +struct xe_test_ctx {
> +	int fd;
> +	uint32_t vm_id;
> +
> +	uint32_t exec_queue_id;
> +
> +	uint16_t sram_instance;
> +	uint16_t vram_instance;
> +	bool has_vram;
> +};
> +
> +static uint64_t align_to_page_size(uint64_t size)
> +{
> +	return (size + 4095UL) & ~4095UL;
> +}
> +
> +static void create_exec_queue(int fd, struct xe_test_ctx *ctx)
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +	struct drm_xe_engine_class_instance eci =3D {
> +		.engine_class =3D DRM_XE_ENGINE_CLASS_RENDER,
> +	};
> +
> +	/* Find first render engine */
> +	xe_for_each_engine(fd, hwe) {
> +		if (hwe->engine_class =3D=3D DRM_XE_ENGINE_CLASS_RENDER)
> {
> +			eci =3D *hwe;
> +			break;
> +		}
> +	}
> +	ctx->exec_queue_id =3D xe_exec_queue_create(fd, ctx->vm_id,
> &eci, 0);
> +}
> +
> +static void vm_bind_gem_bo(int fd, struct xe_test_ctx *ctx, uint32_t
> handle, uint64_t addr, uint64_t size)
> +{
> +	int rc;
> +	uint64_t timeline_val =3D 1;
> +	uint32_t syncobj_handle =3D syncobj_create(fd, 0);
> +
> +	struct drm_xe_sync bind_sync =3D {
> +		.extensions =3D 0,
> +		.type =3D DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
> +		.flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> +		.handle =3D syncobj_handle,
> +		.timeline_value =3D timeline_val,
> +	};
> +	struct drm_xe_vm_bind vm_bind =3D {
> +		.extensions =3D 0,
> +		.vm_id =3D ctx->vm_id,
> +		.exec_queue_id =3D 0,
> +		.num_binds =3D 1,
> +		.bind =3D {
> +			.obj =3D handle,
> +			.obj_offset =3D 0,
> +			.range =3D size,
> +			.addr =3D addr,
> +			.op =3D DRM_XE_VM_BIND_OP_MAP,
> +			.flags =3D 0,
> +		},
> +		.num_syncs =3D 1,
> +		.syncs =3D (uintptr_t)&bind_sync,
> +	};
> +	rc =3D igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &vm_bind);
> +
> +	igt_info("Bind returned %d\n", rc);
> +	igt_assert(rc =3D=3D 0);
> +
> +	/* The right way to do this in the real world is to not wait
> for the
> +	 * syncobj here - since it just makes everything synchronous
> -, but
> +	 * instead pass the syncobj as a 'wait'-type object to thie
> execbuf
> +	 * ioctl. We do it here just to make the example simpler.
> +	 */
> +	//wait_syncobj(fd,syncobj_handle, timeline_val);
> +	igt_assert(syncobj_timeline_wait(fd, &syncobj_handle,
> &timeline_val,
> +					 1, INT64_MAX, 0, NULL));
> +
> +	syncobj_destroy(fd, syncobj_handle);
> +}

Why not use xe_vm_bind_sync() or even better xe_vm_bind_lr_sync() so
you can make a variation of the test with LR mode vms.


> +
> +static uint32_t
> +vm_bind_gem_bos(int fd, struct xe_test_ctx *ctx, struct gem_bo *bos,
> int size)
> +{
> +	int rc;
> +	uint32_t syncobj_handle =3D syncobj_create(fd, 0);
> +	uint64_t timeline_val =3D 1;
> +	struct drm_xe_sync bind_sync =3D {
> +		.extensions =3D 0,
> +		.type =3D DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
> +		.flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> +		.handle =3D syncobj_handle,
> +		.timeline_value =3D timeline_val,
> +	};

Use a user-fence so that it can be reused in LR-mode?

> +	struct drm_xe_vm_bind_op binds[size];
> +	struct drm_xe_vm_bind vm_bind =3D {
> +		.extensions =3D 0,
> +		.vm_id =3D ctx->vm_id,
> +		.exec_queue_id =3D 0,
> +		.num_binds =3D size,
> +		.vector_of_binds =3D (uintptr_t)binds,
> +		.num_syncs =3D 1,
> +		.syncs =3D (uintptr_t)&bind_sync,
> +	};
> +
> +	/* Need to call the ioctl differently when size is 1. */
> +	igt_assert(size !=3D 1);
> +
> +	for (int i =3D 0; i < size; i++) {
> +		binds[i] =3D (struct drm_xe_vm_bind_op) {
> +			.extensions =3D 0,
> +			.obj =3D bos[i].handle,
> +			.pat_index =3D 0,
> +			.pad =3D 0,
> +			.obj_offset =3D 0,
> +			.range =3D bos[i].size,
> +			.addr =3D bos[i].addr,
> +			.op =3D DRM_XE_VM_BIND_OP_MAP,
> +			.flags =3D 0,
> +			.prefetch_mem_region_instance =3D 0,
> +			.pad2 =3D 0,
> +		};
> +	}
> +	rc =3D igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &vm_bind);

Use xe_vm_bind_array()


> +	igt_assert(rc =3D=3D 0);
> +
> +	return syncobj_handle;




> +}
> +
> +static void query_mem_info(int fd, struct xe_test_ctx *ctx)
> +{
> +	uint64_t vram_reg, sys_reg;
> +	struct drm_xe_mem_region *region;
> +
> +	ctx->has_vram =3D xe_has_vram(fd);
> +	if (ctx->has_vram) {
> +		/* Get VRAM instance - vram_memory returns a
> bitmask,
> +		 * so we extract the instance from it
> +		 */
> +		vram_reg =3D vram_memory(fd, 0);
> +		region =3D xe_mem_region(fd, vram_reg);
> +		ctx->vram_instance =3D region->instance;
> +	}
> +
> +	/* Get SRAM instance */
> +	sys_reg =3D system_memory(fd);
> +	region =3D xe_mem_region(fd, sys_reg);
> +	ctx->sram_instance =3D region->instance;
> +	igt_debug("has_vram: %d\n", ctx->has_vram);
> +}

Where is the information obtained by the above function used?

> +
> =C2=A0static uint32_t
> =C2=A0addr_low(uint64_t addr)
> =C2=A0{
> @@ -2450,6 +2620,252 @@ static void test_oom(int fd)
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +/**
> + * SUBTEST: oversubscribe-concurrent-bind
> + * Description: Test for oversubscribing the VM with multiple
> processes
> + * doing binds at the same time, and ensure they all complete
> successfully.
> + * Functionality: This check is for a specific bug where if multiple
> processes
> + * oversubscribe the VM, some of the binds may fail with=C2=A0 ENOMEM du=
e
> to
> + * deadlock in the bind code.
> + * Test category: stress test
> + */
> +static void test_vm_oversubscribe_concurrent_bind(int fd, int
> n_vram_bufs,
> +						=C2=A0 int n_sram_bufs,
> int n_proc)
> +{
> +	igt_fork(child, n_proc) {
> +		struct xe_test_ctx ctx =3D {0};
> +		int rc;
> +		uint64_t addr =3D GB(1);
> +		struct timespec start, end;
> +		uint32_t vram_binds_syncobj, sram_binds_syncobj;
> +		struct gem_bo vram_bufs[n_vram_bufs];
> +		struct gem_bo sram_bufs[n_sram_bufs];
> +		int expected_result =3D 0;
> +		int ints_to_add =3D 4;
> +		int gpu_result;
> +		int retries;
> +		int max_retries =3D 1024;
> +		uint32_t batch_syncobj;
> +		/* integers_bo contains the integers we're going to
> add. */
> +		struct gem_bo integers_bo, result_bo, batch_bo;
> +		uint64_t tmp_addr;
> +		struct drm_xe_sync batch_syncs[3];
> +		int n_batch_syncs =3D 0;
> +		int pos =3D 0;
> +		uint64_t timeline_val =3D 1;
> +		struct drm_xe_exec exec;
> +
> +		rc =3D clock_gettime(CLOCK_MONOTONIC, &start);
> +		igt_assert(rc =3D=3D 0);
> +		ctx.vm_id =3D xe_vm_create(fd,
> DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0);
> +		query_mem_info(fd, &ctx);
> +		create_exec_queue(fd, &ctx);
> +		for (int i =3D 0; i < n_vram_bufs; i++) {
> +			struct gem_bo *bo =3D &vram_bufs[i];
> +
> +			bo->size =3D GB(1);
> +			bo->handle =3D xe_bo_create_caching(fd,
> ctx.vm_id, vram_bufs[i].size,
> +							=C2=A0
> vram_memory(fd, 0), 0,
> +							=C2=A0
> DRM_XE_GEM_CPU_CACHING_WC);
> +			bo->ptr =3D NULL;
> +			bo->addr =3D addr;
> +			addr +=3D bo->size;
> +			igt_info("vram buffer %d created at
> 0x%016lx\n",
> +				 i, bo->addr);
> +		}
> +		for (int i =3D 0; i < n_sram_bufs; i++) {
> +			struct gem_bo *bo =3D &sram_bufs[i];
> +
> +			bo->size =3D GB(1);
> +			bo->handle =3D xe_bo_create_caching(fd,
> ctx.vm_id, sram_bufs[i].size,
> +							=C2=A0
> system_memory(fd), 0,
> +							=C2=A0
> DRM_XE_GEM_CPU_CACHING_WC);
> +			bo->ptr =3D NULL;
> +			bo->addr =3D addr;
> +			addr +=3D bo->size;
> +			igt_info("sram buffer %d created at
> 0x%016lx\n",
> +				 i, bo->addr);

Isn't igt_debug a better choice here and in the rest of the function?
Typically when the tests are run, people are mostly interested in
whether they fail or pass, and if they have an additional interest
beyond that, they can enable debugging.


> +		}
> +		igt_info("\n Binding the buffers to the vm");
> +
> +		if (n_vram_bufs) {
> +			igt_info("binding vram buffers");
> +			vram_binds_syncobj =3D vm_bind_gem_bos(fd,
> &ctx, vram_bufs, n_vram_bufs);
> +		}
> +		if (n_sram_bufs) {
> +			igt_info("binding sram buffers");
> +			sram_binds_syncobj =3D vm_bind_gem_bos(fd,
> &ctx, sram_bufs, n_sram_bufs);
> +		}
> +		integers_bo.size =3D align_to_page_size(sizeof(int) *
> ints_to_add);
> +		integers_bo.handle =3D xe_bo_create_caching(fd,
> ctx.vm_id, integers_bo.size,
> +							=C2=A0
> system_memory(fd), 0,
> +							=C2=A0
> DRM_XE_GEM_CPU_CACHING_WC);
> +		integers_bo.ptr =3D (int *)xe_bo_map(fd,
> integers_bo.handle, integers_bo.size);
> +
> +		integers_bo.addr =3D 0x100000;
> +
> +		for (int i =3D 0; i < ints_to_add; i++) {
> +			int random_int =3D rand() % 8;
> +
> +			integers_bo.ptr[i] =3D random_int;
> +			expected_result +=3D random_int;
> +
> +			igt_info("%d", random_int);
> +			if (i + 1 !=3D ints_to_add)
> +				igt_info(" + ");
> +			else
> +				igt_info(" =3D ");
> +		}
> +		igt_assert_eq(munmap(integers_bo.ptr,
> integers_bo.size), 0);
> +		integers_bo.ptr =3D NULL;
> +
> +		igt_info("Creating the result buffer object");
> +
> +		result_bo.size =3D align_to_page_size(sizeof(int));
> +		result_bo.handle=C2=A0 =3D xe_bo_create_caching(fd,
> ctx.vm_id, result_bo.size,
> +						=09
> system_memory(fd), 0,
> +						=09
> DRM_XE_GEM_CPU_CACHING_WC);
> +		result_bo.ptr =3D NULL;
> +		result_bo.addr =3D 0x200000;
> +		/* batch_bo contains the commands the GPU will run.
> */
> +
> +		igt_info("Creating the batch buffer object");
> +		batch_bo.size =3D 4096;
> +		//batch_bo.handle =3D create_gem_bo_sram(fd,
> batch_bo.size);
> +		batch_bo.handle =3D xe_bo_create_caching(fd,
> ctx.vm_id, batch_bo.size,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> system_memory(fd), 0,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> DRM_XE_GEM_CPU_CACHING_WC);
> +
> +		batch_bo.ptr =3D (int *)xe_bo_map(fd, batch_bo.handle,
> batch_bo.size);
> +		batch_bo.addr =3D 0x300000;
> +
> +		/* r0 =3D integers_bo[0] */
> +		batch_bo.ptr[pos++] =3D MI_LOAD_REG_MEM;
> +		batch_bo.ptr[pos++] =3D GPR_RX_ADDR(0);
> +		tmp_addr =3D integers_bo.addr + 0 * sizeof(uint32_t);
> +		batch_bo.ptr[pos++] =3D tmp_addr & 0xFFFFFFFF;
> +		batch_bo.ptr[pos++] =3D (tmp_addr >> 32) & 0xFFFFFFFF;
> +		for (int i =3D 1; i < ints_to_add; i++) {
> +			/* r1 =3D integers_bo[i] */
> +			batch_bo.ptr[pos++] =3D MI_LOAD_REG_MEM;
> +			batch_bo.ptr[pos++] =3D GPR_RX_ADDR(1);
> +			tmp_addr =3D integers_bo.addr + i *
> sizeof(uint32_t);
> +			batch_bo.ptr[pos++] =3D tmp_addr & 0xFFFFFFFF;
> +			batch_bo.ptr[pos++] =3D (tmp_addr >> 32) &
> 0xFFFFFFFF;
> +			/* r0 =3D r0 + r1 */
> +			batch_bo.ptr[pos++] =3D MI_MATH_R(3);
> +			batch_bo.ptr[pos++] =3D ALU_LOAD(ALU_SRCA,
> ALU_RX(0));
> +			batch_bo.ptr[pos++] =3D ALU_LOAD(ALU_SRCB,
> ALU_RX(1));
> +			batch_bo.ptr[pos++] =3D ALU_ADD;
> +			batch_bo.ptr[pos++] =3D ALU_STORE(ALU_RX(0),
> ALU_ACCU);
> +		}
> +		/* result_bo[0] =3D r0 */
> +		batch_bo.ptr[pos++] =3D MI_STORE_REG_MEM;
> +		batch_bo.ptr[pos++] =3D GPR_RX_ADDR(0);
> +		tmp_addr =3D result_bo.addr + 0 * sizeof(uint32_t);
> +		batch_bo.ptr[pos++] =3D tmp_addr & 0xFFFFFFFF;
> +		batch_bo.ptr[pos++] =3D (tmp_addr >> 32) & 0xFFFFFFFF;
> +
> +		batch_bo.ptr[pos++] =3D MI_BB_END;
> +		while (pos % 4 !=3D 0)
> +			batch_bo.ptr[pos++] =3D MI_NOOP;
> +
> +		igt_assert(pos * sizeof(int) <=3D batch_bo.size);
> +
> +		vm_bind_gem_bo(fd, &ctx, integers_bo.handle,
> integers_bo.addr, integers_bo.size);
> +		vm_bind_gem_bo(fd, &ctx, result_bo.handle,
> result_bo.addr, result_bo.size);
> +		vm_bind_gem_bo(fd, &ctx, batch_bo.handle,
> batch_bo.addr, batch_bo.size);
> +
> +		/* Now we do the actual batch submission to the GPU.
> */
> +		batch_syncobj =3D syncobj_create(fd, 0);
> +
> +		/* Wait for the other threads to create their stuff
> too. */
> +
> +		end =3D start;
> +		end.tv_sec +=3D 5;
> +		rc =3D clock_nanosleep(CLOCK_MONOTONIC, TIMER_ABSTIME,
> &end, NULL);
> +		igt_assert_eq(rc, 0);
> +
> +		batch_syncs[n_batch_syncs++] =3D (struct drm_xe_sync)
> {
> +			.extensions =3D 0,
> +			.type =3D DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
> +			.flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> +			.handle =3D batch_syncobj,
> +			.timeline_value =3D timeline_val,
> +		};
> +		if (n_vram_bufs) {
> +			batch_syncs[n_batch_syncs++] =3D (struct
> drm_xe_sync) {
> +				.extensions =3D 0,
> +				.type =3D
> DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
> +				.flags =3D 0, /* wait */
> +				.handle =3D vram_binds_syncobj,
> +				.timeline_value =3D 1,
> +			};
> +		}
> +		if (n_sram_bufs) {
> +			batch_syncs[n_batch_syncs++] =3D (struct
> drm_xe_sync) {
> +				.extensions =3D 0,
> +				.type =3D
> DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
> +				.flags =3D 0, /* wait */
> +				.handle =3D sram_binds_syncobj,
> +				.timeline_value =3D 1,
> +			};
> +		}
> +		exec =3D (struct drm_xe_exec) {
> +			.exec_queue_id =3D ctx.exec_queue_id,
> +			.num_syncs =3D n_batch_syncs,
> +			.syncs =3D (uintptr_t)batch_syncs,
> +			.address =3D batch_bo.addr,
> +			.num_batch_buffer =3D 1,
> +		};
> +		for (retries =3D 0; retries < max_retries; retries++)
> {
> +			rc =3D igt_ioctl(fd, DRM_IOCTL_XE_EXEC,
> &exec);
> +
> +			if (!(rc && errno =3D=3D ENOMEM))
> +				break;
> +
> +			usleep(100 * retries);
> +			if (retries =3D=3D 0)
> +				igt_warn("got ENOMEM\n");
> +		}
> +		if (retries =3D=3D max_retries)
> +			igt_warn("gave up after %d retries\n",
> retries);
> +
> +		if (rc) {
> +			igt_warn("errno: %d (%s)\n", errno,
> strerror(errno));
> +			perror(__func__);
> +		}
> +		igt_assert_eq(rc, 0);
> +
> +		if (retries)
> +			igt_info("!!!!!! succeeded after %d retries
> !!!!!!\n",
> +				 retries);
> +
> +		/* We need to wait for the GPU to finish. */
> +		igt_assert(syncobj_timeline_wait(fd, &batch_syncobj,
> +						 &timeline_val, 1,
> INT64_MAX, 0, NULL));
> +		result_bo.ptr =3D (int *)xe_bo_map(fd,
> result_bo.handle, result_bo.size);
> +		gpu_result =3D result_bo.ptr[0];
> +		igt_info("gpu_result =3D %d\n", gpu_result);
> +		igt_info("expected_result =3D %d\n", expected_result);
> +
> +		igt_assert_eq(gpu_result, expected_result);
> +		igt_assert_eq(munmap(result_bo.ptr, result_bo.size),
> 0);
> +		result_bo.ptr =3D NULL;
> +
> +		end.tv_sec +=3D 10;
> +		rc =3D clock_nanosleep(CLOCK_MONOTONIC, TIMER_ABSTIME,
> &end, NULL);
> +		assert(rc =3D=3D 0);
> +		gem_close(fd, batch_bo.handle);
> +		gem_close(fd, result_bo.handle);
> +		gem_close(fd, integers_bo.handle);
> +
> +		xe_vm_destroy(fd, ctx.vm_id);
> +		close(fd);
> +	}
> +	igt_waitchildren();
> +}
> +
> =C2=A0int igt_main()
> =C2=A0{
> =C2=A0	struct drm_xe_engine_class_instance *hwe, *hwe_non_copy =3D
> NULL;
> @@ -2850,6 +3266,11 @@ int igt_main()
> =C2=A0		test_oom(fd);
> =C2=A0	}
> =C2=A0
> +	igt_subtest("oversubscribe-concurrent-bind") {
> +		igt_require(xe_has_vram(fd));
> +		test_vm_oversubscribe_concurrent_bind(fd, 2, 4, 4);

AFAIK there are multiple tests in xe_evict() that does more or less the
same as this test. What is this test doing different compared to those
tests? Is it the array bind?

Also those hard-coded numbers need some explanation? Shouldn't they
relate to the amount of VRAM on the system and to the system memory and
possibly also swap-space available?

Thanks,
Thomas


> +	}
> +
> =C2=A0	igt_fixture()
> =C2=A0		drm_close_driver(fd);
> =C2=A0}
