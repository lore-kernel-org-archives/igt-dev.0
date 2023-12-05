Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF6210E53F
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Dec 2023 14:05:46 +0000 (UTC)
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Das, Nirmoy" <nirmoy.das@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Tue, 5 Dec 2023 14:05:41 +0000
Message-ID: <MW3PR11MB4748E817801205BDB60C569EAE85A@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20231205134927.19409-1-nirmoy.das@intel.com>
In-Reply-To: <20231205134927.19409-1-nirmoy.das@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] Revert "test/xe_spin_batch: Add
 spin-fixed-duration-with-preempter"
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Das, Nirmoy" <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Nirmoy
> Das
> Sent: Tuesday, December 5, 2023 7:19 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Das, Nirmoy <nirmoy.das@intel.com>
> Subject: [igt-dev] [PATCH i-g-t] Revert "test/xe_spin_batch: Add spin-fix=
ed-
> duration-with-preempter"
>=20
> This reverts commit cf47431af14903a71d77283fe74e71ed29f2a17e
> which is causing build failures.
>=20
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  tests/intel/xe_spin_batch.c | 126 ++----------------------------------
>  1 file changed, 4 insertions(+), 122 deletions(-)
>=20
> diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c in=
dex
> 87e1a86a2..c75709c4e 100644
> --- a/tests/intel/xe_spin_batch.c
> +++ b/tests/intel/xe_spin_batch.c
> @@ -136,102 +136,12 @@ static void spin_all(int fd, int gt, int class)
>  	xe_vm_destroy(fd, vm);
>  }
>=20
> -struct data {
> -	uint32_t batch[16];
> -	uint64_t pad;
> -	uint32_t data;
> -	uint64_t addr;
> -};
> -
> -static void store_dword_batch(struct data *data, uint64_t addr, int valu=
e) -{
> -	int b;
> -	uint64_t batch_offset =3D (char *)&(data->batch) - (char *)data;
> -	uint64_t batch_addr =3D addr + batch_offset;
> -	uint64_t sdi_offset =3D (char *)&(data->data) - (char *)data;
> -	uint64_t sdi_addr =3D addr + sdi_offset;
> -
> -	b =3D 0;
> -	data->batch[b++] =3D MI_STORE_DWORD_IMM_GEN4;
> -	data->batch[b++] =3D sdi_addr;
> -	data->batch[b++] =3D sdi_addr >> 32;
> -	data->batch[b++] =3D value;
> -	data->batch[b++] =3D MI_BATCH_BUFFER_END;
> -	igt_assert(b <=3D ARRAY_SIZE(data->batch));
> -
> -	data->addr =3D batch_addr;
> -}
> -
> -static void preempter(int fd, struct drm_xe_engine_class_instance *hwe) =
-{
> -	struct drm_xe_sync sync =3D {
> -		.flags =3D DRM_XE_SYNC_FLAG_SYNCOBJ |
> DRM_XE_SYNC_FLAG_SIGNAL
> -	};
> -	struct drm_xe_exec exec =3D {
> -		.num_batch_buffer =3D 1,
> -		.num_syncs =3D 1,
> -		.syncs =3D to_user_pointer(&sync),
> -	};
> -	struct drm_xe_ext_set_property ext =3D {
> -		.base.next_extension =3D 0,
> -		.base.name =3D
> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> -		.property =3D DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY,
> -		.value =3D 2, /* High priority */
> -	};
> -	struct data *data;
> -	uint32_t vm;
> -	uint32_t exec_queue;
> -	uint32_t syncobj;
> -	size_t bo_size;
> -	int value =3D 0x123456;
> -	uint64_t addr =3D 0x100000;
> -	uint32_t bo =3D 0;
> -
> -	syncobj =3D syncobj_create(fd, 0);
> -	sync.handle =3D syncobj;
> -
> -	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT,
> 0);
> -	bo_size =3D sizeof(*data);
> -	bo_size =3D ALIGN(bo_size + xe_cs_prefetch_size(fd),
> -			xe_get_default_alignment(fd));
> -
> -	bo =3D xe_bo_create_flags(fd, vm, bo_size,
> -				visible_vram_if_possible(fd, hwe->gt_id));
> -
> -	xe_vm_bind_async(fd, vm, hwe->gt_id, bo, 0, addr, bo_size, &sync, 1);
> -	data =3D xe_bo_map(fd, bo, bo_size);
> -	store_dword_batch(data, addr, value);
> -
> -	exec_queue =3D xe_exec_queue_create(fd, vm, hwe,
> to_user_pointer(&ext));
> -	exec.exec_queue_id =3D exec_queue;
> -	exec.address =3D data->addr;
> -	sync.flags &=3D DRM_XE_SYNC_FLAG_SIGNAL;
> -	xe_exec(fd, &exec);
> -
> -	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
> -	igt_assert_eq(data->data, value);
> -
> -	syncobj_destroy(fd, syncobj);
> -	munmap(data, bo_size);
> -	gem_close(fd, bo);
> -
> -	xe_exec_queue_destroy(fd, exec_queue);
> -	xe_vm_destroy(fd, vm);
> -}
> -
> -#define SPIN_FIX_DURATION_NORMAL		0
> -#define SPIN_FIX_DURATION_PREEMPT		1
>  /**
>   * SUBTEST: spin-fixed-duration
>   * Description: Basic test which validates the functionality of xe_spin =
with fixed
> duration.
>   * Run type: FULL
>   */
> -/**
> - * SUBTEST: spin-fixed-duration-with-preempter
> - * Description: Basic test which validates the functionality of xe_spin
> preemption which gets preempted with a short duration high-priority task.
> - * Run type: FULL
> - */
> -static void xe_spin_fixed_duration(int fd, int gt, int class, int flags)
> +static void xe_spin_fixed_duration(int fd)
>  {
>  	struct drm_xe_sync sync =3D {
>  		.handle =3D syncobj_create(fd, 0),
> @@ -243,20 +153,12 @@ static void xe_spin_fixed_duration(int fd, int gt, =
int
> class, int flags)
>  		.num_syncs =3D 1,
>  		.syncs =3D to_user_pointer(&sync),
>  	};
> -	struct drm_xe_ext_set_property ext_prio =3D {
> -		.base.next_extension =3D 0,
> -		.base.name =3D
> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> -		.property =3D DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY,
> -		.value =3D 0, /* Low priority */
> -	};
> -	struct drm_xe_engine_class_instance *hwe =3D NULL, *_hwe;
>  	const uint64_t duration_ns =3D NSEC_PER_SEC / 10; /* 100ms */
>  	uint64_t spin_addr;
>  	uint64_t ahnd;
>  	uint32_t exec_queue;
>  	uint32_t vm;
>  	uint32_t bo;
> -	uint64_t ext =3D 0;
>  	size_t bo_size;
>  	struct xe_spin *spin;
>  	struct timespec tv;
> @@ -264,18 +166,8 @@ static void xe_spin_fixed_duration(int fd, int gt, i=
nt
> class, int flags)
>  	igt_stats_t stats;
>  	int i;
>=20
> -	if (flags & SPIN_FIX_DURATION_PREEMPT)
> -		ext =3D to_user_pointer(&ext_prio);
> -
> -	xe_for_each_hw_engine(fd, _hwe)
> -		if (_hwe->engine_class =3D=3D class && _hwe->gt_id =3D=3D gt)
> -			hwe =3D _hwe;
> -
> -	if (!hwe)
> -		return;
> -
>  	vm =3D xe_vm_create(fd, 0, 0);
> -	exec_queue =3D xe_exec_queue_create(fd, vm, hwe, ext);
> +	exec_queue =3D xe_exec_queue_create_class(fd, vm,
> +DRM_XE_ENGINE_CLASS_COPY);
>  	ahnd =3D intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>  	bo_size =3D ALIGN(sizeof(*spin) + xe_cs_prefetch_size(fd),
> xe_get_default_alignment(fd));
>  	bo =3D xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0), 0); @@ -
> 295,17 +187,13 @@ static void xe_spin_fixed_duration(int fd, int gt, int =
class, int
> flags)
>  		igt_gettime(&tv);
>  		xe_exec(fd, &exec);
>  		xe_spin_wait_started(spin);
> -		if (flags & SPIN_FIX_DURATION_PREEMPT)
> -			preempter(fd, hwe);
> -
>  		igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0,
> NULL));
>  		igt_stats_push_float(&stats, igt_nsec_elapsed(&tv) * 1e-6);
>  		syncobj_reset(fd, &sync.handle, 1);
>  		igt_debug("i=3D%d %.2fms\n", i, stats.values_f[i]);
>  	}
>  	elapsed_ms =3D igt_stats_get_median(&stats);
> -	igt_info("%s: %.0fms spin took %.2fms (median)\n",
> xe_engine_class_string(hwe->engine_class),
> -		 duration_ns * 1e-6, elapsed_ms);
> +	igt_info("%.0fms spin took %.2fms (median)\n", duration_ns * 1e-6,
> +elapsed_ms);
>  	igt_assert(elapsed_ms < duration_ns * 1.5e-6 && elapsed_ms >
> duration_ns * 0.5e-6);
>=20
>  	xe_vm_unbind_sync(fd, vm, 0, spin_addr, bo_size); @@ -343,13 +231,7
> @@ igt_main
>  	}
>=20
>  	igt_subtest("spin-fixed-duration")
> -		xe_spin_fixed_duration(fd, 0, DRM_XE_ENGINE_CLASS_COPY,
> SPIN_FIX_DURATION_NORMAL);
> -
> -
> -	igt_subtest("spin-fixed-duration-with-preempter")
> -		xe_for_each_gt(fd, gt)
> -			xe_for_each_hw_engine_class(class)
> -				xe_spin_fixed_duration(fd, gt, class,
> SPIN_FIX_DURATION_PREEMPT);
> +		xe_spin_fixed_duration(fd);
>=20
>  	igt_fixture
>  		drm_close_driver(fd);
> --
> 2.42.0
