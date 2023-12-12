Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C152210E571
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Dec 2023 07:10:04 +0000 (UTC)
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ch, Sai
 Gowtham" <sai.gowtham.ch@intel.com>
Subject: RE: [PATCH i-g-t] intel/xe_exec_store.c: Fix the execution of
 basic-all test.
Date: Tue, 12 Dec 2023 07:09:48 +0000
Message-ID: <MW3PR11MB47487E25AB3CF2C871561EA9AE8EA@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20231211130735.10497-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20231211130735.10497-1-sai.gowtham.ch@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
> Sent: Monday, December 11, 2023 6:38 PM
> To: igt-dev@lists.freedesktop.org; Ch, Sai Gowtham
> <sai.gowtham.ch@intel.com>
> Subject: [PATCH i-g-t] intel/xe_exec_store.c: Fix the execution of basic-=
all test.
>=20
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>=20
> implement xe_for_each_engine in basic-all test so that, it queries all th=
e
> supported classes and instances for a gt and submits workload to it. whic=
h fixes
> the num_placements issue.
>=20
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/xe_exec_store.c | 131 ++++++++----------------------------
>  1 file changed, 27 insertions(+), 104 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c in=
dex
> 6d5a1bbac..7a66d744c 100644
> --- a/tests/intel/xe_exec_store.c
> +++ b/tests/intel/xe_exec_store.c
> @@ -79,8 +79,10 @@ static void cond_batch(struct data *data, uint64_t add=
r,
> int value)
>   * Description: Basic test to verify store dword.
>   * SUBTEST: basic-cond-batch
>   * Description: Basic test to verify cond batch end instruction.
> + * SUBTEST: basic-all
> + * Description: Test to verify store dword on all available engines.
>   */
> -static void basic_inst(int fd, int inst_type)
> +static void basic_inst(int fd, int inst_type, struct
> +drm_xe_engine_class_instance *eci)
>  {
>  	struct drm_xe_sync sync =3D {
>  		.type =3D DRM_XE_SYNC_TYPE_SYNCOBJ,
> @@ -92,9 +94,9 @@ static void basic_inst(int fd, int inst_type)
>  		.syncs =3D to_user_pointer(&sync),
>  	};
>  	struct data *data;
> -	struct drm_xe_engine *engine;
>  	uint32_t vm;
>  	uint32_t exec_queue;
> +	uint32_t bind_engine;
>  	uint32_t syncobj;
>  	size_t bo_size;
>  	int value =3D 0x123456;
> @@ -109,12 +111,13 @@ static void basic_inst(int fd, int inst_type)
>  	bo_size =3D ALIGN(bo_size + xe_cs_prefetch_size(fd),
>  			xe_get_default_alignment(fd));
>=20
> -	engine =3D xe_engine(fd, 1);
>  	bo =3D xe_bo_create(fd, vm, bo_size,
> -			  vram_if_possible(fd, engine->instance.gt_id),
> +			  vram_if_possible(fd, eci->gt_id),
>=20
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>=20
> -	xe_vm_bind_async(fd, vm, engine->instance.gt_id, bo, 0, addr, bo_size,
> &sync, 1);
> +	exec_queue =3D xe_exec_queue_create(fd, vm, eci, 0);
> +	bind_engine =3D xe_bind_exec_queue_create(fd, vm, 0, true);
> +	xe_vm_bind_async(fd, vm, bind_engine, bo, 0, addr, bo_size, &sync, 1);
>  	data =3D xe_bo_map(fd, bo, bo_size);
>=20
>  	if (inst_type =3D=3D STORE)
> @@ -127,7 +130,7 @@ static void basic_inst(int fd, int inst_type)
>  	else
>  		igt_assert_f(inst_type < 2, "Entered wrong inst_type.\n");
>=20
> -	exec_queue =3D xe_exec_queue_create(fd, vm, &engine->instance, 0);
> +	exec_queue =3D xe_exec_queue_create(fd, vm, eci, 0);
>  	exec.exec_queue_id =3D exec_queue;
>  	exec.address =3D data->addr;
>  	sync.flags &=3D DRM_XE_SYNC_FLAG_SIGNAL; @@ -243,115 +246,35
> @@ static void store_cachelines(int fd, struct drm_xe_engine_class_instan=
ce
> *eci,
>  	xe_vm_destroy(fd, vm);
>  }
>=20
> -/**
> - * SUBTEST: basic-all
> - * Description: Test to verify store dword on all available engines.
> - */
> -static void store_all(int fd, int gt, int class) -{
> -	struct drm_xe_sync sync[2] =3D {
> -		{ .type =3D DRM_XE_SYNC_TYPE_SYNCOBJ, .flags =3D
> DRM_XE_SYNC_FLAG_SIGNAL, },
> -		{ .type =3D DRM_XE_SYNC_TYPE_SYNCOBJ, .flags =3D
> DRM_XE_SYNC_FLAG_SIGNAL, }
> -	};
> -	struct drm_xe_exec exec =3D {
> -		.num_batch_buffer =3D 1,
> -		.num_syncs =3D 2,
> -		.syncs =3D to_user_pointer(&sync),
> -	};
> -
> -	struct data *data;
> -	uint32_t syncobjs[MAX_INSTANCE];
> -	uint32_t exec_queues[MAX_INSTANCE];
> -	uint32_t vm;
> -	size_t bo_size;
> -	uint64_t addr =3D 0x100000;
> -	uint32_t bo =3D 0;
> -	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
> -	struct drm_xe_engine_class_instance *hwe;
> -	int i, num_placements =3D 0;
> -
> -	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT,
> 0);
> -	bo_size =3D sizeof(*data);
> -	bo_size =3D ALIGN(bo_size + xe_cs_prefetch_size(fd),
> -			xe_get_default_alignment(fd));
> -
> -	bo =3D xe_bo_create(fd, vm, bo_size,
> -			  vram_if_possible(fd, 0),
> -
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> -	data =3D xe_bo_map(fd, bo, bo_size);
> -
> -	xe_for_each_engine(fd, hwe) {
> -		if (hwe->engine_class !=3D class || hwe->gt_id !=3D gt)
> -			continue;
> -		eci[num_placements++] =3D *hwe;
> -	}
> -
> -	igt_require(num_placements);
> -
> -	for (i =3D 0; i < num_placements; i++) {
> -		struct drm_xe_exec_queue_create create =3D {
> -			.vm_id =3D vm,
> -			.width =3D 1,
> -			.num_placements =3D num_placements,
> -			.instances =3D to_user_pointer(eci),
> -		};
> -
> -		igt_assert_eq(igt_ioctl(fd,
> DRM_IOCTL_XE_EXEC_QUEUE_CREATE,
> -					&create), 0);
> -		exec_queues[i] =3D create.exec_queue_id;
> -		syncobjs[i] =3D syncobj_create(fd, 0);
> -	};
> -
> -	sync[0].handle =3D syncobj_create(fd, 0);
> -	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
> -
> -	for (i =3D 0; i < num_placements; i++) {
> -
> -		store_dword_batch(data, addr, i);
> -		sync[0].flags &=3D ~DRM_XE_SYNC_FLAG_SIGNAL;
> -		sync[1].flags |=3D DRM_XE_SYNC_FLAG_SIGNAL;
> -		sync[1].handle =3D syncobjs[i];
> -
> -		exec.exec_queue_id =3D exec_queues[i];
> -		exec.address =3D data->addr;
> -		xe_exec(fd, &exec);
> -
> -		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
> NULL));
> -		igt_assert_eq(data->data, i);
> -	}
> -
> -	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> -	syncobj_destroy(fd, sync[0].handle);
> -	munmap(data, bo_size);
> -	gem_close(fd, bo);
> -
> -	for (i =3D 0; i < num_placements; i++) {
> -		syncobj_destroy(fd, syncobjs[i]);
> -		xe_exec_queue_destroy(fd, exec_queues[i]);
> -	}
> -	xe_vm_destroy(fd, vm);
> -}
> -
>  igt_main
>  {
>  	struct drm_xe_engine_class_instance *hwe;
> -	int fd, class, gt;
> +	int fd;
> +	struct drm_xe_engine *engine;
>=20
>  	igt_fixture {
>  		fd =3D drm_open_driver(DRIVER_XE);
>  		xe_device_get(fd);
>  	}
>=20
> -	igt_subtest("basic-store")
> -		basic_inst(fd, STORE);
> +	igt_subtest("basic-store") {
> +		engine =3D xe_engine(fd, 1);
> +		basic_inst(fd, STORE, &engine->instance);
> +	}
>=20
> -	igt_subtest("basic-cond-batch")
> -		basic_inst(fd, COND_BATCH);
> +	igt_subtest("basic-cond-batch") {
> +		engine =3D xe_engine(fd, 1);
> +		basic_inst(fd, COND_BATCH, &engine->instance);
> +	}
>=20
> -	igt_subtest("basic-all") {
> -		xe_for_each_gt(fd, gt)
> -			xe_for_each_engine_class(class)
> -				store_all(fd, gt, class);
> +	igt_subtest_with_dynamic("basic-all") {
> +		xe_for_each_engine(fd, hwe) {
> +			igt_dynamic_f("Engine-%s-Instance-%d-Tile-%d",
> +				      xe_engine_class_string(hwe->engine_class),
> +				      hwe->engine_instance,
> +				      hwe->gt_id);
> +			basic_inst(fd, STORE, hwe);
> +		}
>  	}
>=20
>  	igt_subtest("cachelines")
> --

LGTM,
Reviewed-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 2.39.1
