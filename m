Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD4810E8E9
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Nov 2023 15:36:42 +0000 (UTC)
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ch, Sai
 Gowtham" <sai.gowtham.ch@intel.com>
Date: Thu, 2 Nov 2023 15:36:37 +0000
Message-ID: <MW3PR11MB474834149FA157F24DDBB765AEA6A@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20231102120600.28704-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20231102120600.28704-1-sai.gowtham.ch@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel/xe_exec_store: Add
 cachelines and page-sized subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> sai.gowtham.ch@intel.com
> Sent: Thursday, November 2, 2023 5:36 PM
> To: igt-dev@lists.freedesktop.org; Ch, Sai Gowtham
> <sai.gowtham.ch@intel.com>
> Subject: [igt-dev] [PATCH i-g-t] tests/intel/xe_exec_store: Add cacheline=
s and
> page-sized subtests
>=20
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>=20
> Intension of these subtests is to verify that each capable engine can sto=
re a
> dword to different cachelines/pages of a buffer object.
>=20
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/xe_exec_store.c | 107 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 107 insertions(+)
>=20
> diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c in=
dex
> 90684b8cb..4ca76b43a 100644
> --- a/tests/intel/xe_exec_store.c
> +++ b/tests/intel/xe_exec_store.c
> @@ -105,6 +105,104 @@ static void store(int fd)
>  	xe_vm_destroy(fd, vm);
>  }
>=20
> +#define PAGES 1
> +#define NCACHELINES (4096/64)
> +/**
> + * SUBTEST: %s
> + * Description: Verify that each engine can store a dword to different
> %arg[1] of a object.
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @cachelines: cachelines
> + * @page-sized: page-sized
> + */
> +static void store_cachelines(int fd, struct drm_xe_engine_class_instance
> *eci,
> +			     unsigned int flags)
> +{
> +	struct drm_xe_sync sync[2] =3D {
> +		{ .flags =3D DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
> +		{ .flags =3D DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, }
> +	};
> +
> +	struct drm_xe_exec exec =3D {
> +		.num_batch_buffer =3D 1,
> +		.num_syncs =3D 2,
> +		.syncs =3D to_user_pointer(&sync),
> +	};
> +
> +	int count =3D flags & PAGES ? NCACHELINES + 1 : 2;
> +	int i, object_index, b =3D 0;
> +	uint64_t dst_offset[count];
> +	uint32_t exec_queues, vm, syncobjs;
> +	uint32_t bo[count], *bo_map[count];
> +	uint32_t value[NCACHELINES], *ptr[NCACHELINES], delta;
> +	uint64_t offset[NCACHELINES];
> +	uint64_t ahnd;
> +	uint32_t *batch_map;
> +	size_t bo_size =3D 4096;
> +
> +	bo_size =3D ALIGN(bo_size, xe_get_default_alignment(fd));
> +	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
> +	ahnd =3D intel_allocator_open(fd, 0, INTEL_ALLOCATOR_SIMPLE);
> +	exec_queues =3D xe_exec_queue_create(fd, vm, eci, 0);
> +	syncobjs =3D syncobj_create(fd, 0);
> +	sync[0].handle =3D syncobj_create(fd, 0);
> +
> +	for (i =3D 0; i < count; i++) {
> +		bo[i] =3D xe_bo_create_flags(fd, vm, bo_size,
> +					       visible_vram_if_possible(fd, eci-
> >gt_id));
> +		bo_map[i] =3D xe_bo_map(fd, bo[i], bo_size);
> +		dst_offset[i] =3D intel_allocator_alloc_with_strategy(ahnd,
> bo[i],
> +								    bo_size, 0,
> +
> ALLOC_STRATEGY_LOW_TO_HIGH);
> +		xe_vm_bind_async(fd, vm, eci->gt_id, bo[i], 0, dst_offset[i],
> bo_size, sync, 1);
> +	}
> +
> +	batch_map =3D xe_bo_map(fd, bo[i-1], bo_size);
> +	exec.address =3D dst_offset[i-1];
> +
> +	for (unsigned int n =3D 0; n < NCACHELINES; n++) {
> +		delta =3D 4 * (n * 16 + n % 16);
> +		value[n] =3D n | ~n << 16;
> +		offset[n] =3D dst_offset[n % (count - 1)] + delta;
> +
> +		batch_map[b++] =3D MI_STORE_DWORD_IMM_GEN4;
> +		batch_map[b++] =3D offset[n];
> +		batch_map[b++] =3D offset[n] >> 32;
> +		batch_map[b++] =3D value[n];
> +	}
> +	batch_map[b++] =3D MI_BATCH_BUFFER_END;
> +	sync[0].flags &=3D DRM_XE_SYNC_SIGNAL;
> +	sync[1].flags |=3D DRM_XE_SYNC_SIGNAL;
> +	sync[1].handle =3D syncobjs;
> +	exec.exec_queue_id =3D exec_queues;
> +	xe_exec(fd, &exec);
> +	igt_assert(syncobj_wait(fd, &syncobjs, 1, INT64_MAX, 0, NULL));
> +
> +	for (unsigned int n =3D 0; n < NCACHELINES; n++) {
> +		delta =3D 4 * (n * 16 + n % 16);
> +		value[n] =3D n | ~n << 16;
> +		object_index =3D n % (count - 1);
> +		ptr[n]  =3D bo_map[object_index] + delta / 4;
> +
> +		igt_assert(*ptr[n] =3D=3D value[n]);
> +	}
> +
> +	for (i =3D 0; i < count; i++) {
> +		munmap(bo_map[i], bo_size);
> +		xe_vm_unbind_async(fd, vm, 0, 0, dst_offset[i], bo_size, sync,
> 1);
> +		gem_close(fd, bo[i]);
> +	}
> +
> +	munmap(batch_map, bo_size);
> +	put_ahnd(ahnd);
> +	syncobj_destroy(fd, sync[0].handle);
> +	syncobj_destroy(fd, syncobjs);
> +	xe_exec_queue_destroy(fd, exec_queues);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>  /**
>   * SUBTEST: basic-all
>   * Description: Test to verify store dword on all available engines.
> @@ -195,6 +293,7 @@ static void store_all(int fd, int gt, int class)
>=20
>  igt_main
>  {
> +	struct drm_xe_engine_class_instance *hwe;
>  	int fd, class, gt;
>=20
>  	igt_fixture {
> @@ -211,6 +310,14 @@ igt_main
>  				store_all(fd, gt, class);
>  	}
>=20
> +	igt_subtest("cachelines")
> +		xe_for_each_hw_engine(fd, hwe)
> +			store_cachelines(fd, hwe, 0);
> +
> +	igt_subtest("page-sized")
> +		xe_for_each_hw_engine(fd, hwe)
> +			store_cachelines(fd, hwe, PAGES);
> +
>  	igt_fixture {
>  		xe_device_put(fd);
>  		close(fd);
> --
> 2.39.1

LGTM,
Reviewed-by: Janga Rahul Kumar<janga.rahul.kumar@intel.com>
