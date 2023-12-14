Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E2B10E2B1
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Dec 2023 07:00:24 +0000 (UTC)
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ch, Sai
 Gowtham" <sai.gowtham.ch@intel.com>
Subject: RE: [PATCH i-g-t] intel/xe_exec_store: Add Persistent subtest
Date: Thu, 14 Dec 2023 07:00:18 +0000
Message-ID: <MW3PR11MB47484EF7ECB613EFF1861E98AE8CA@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20231213125914.10821-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20231213125914.10821-1-sai.gowtham.ch@intel.com>
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
> Sent: Wednesday, December 13, 2023 6:29 PM
> To: igt-dev@lists.freedesktop.org; Ch, Sai Gowtham
> <sai.gowtham.ch@intel.com>
> Subject: [PATCH i-g-t] intel/xe_exec_store: Add Persistent subtest
>=20
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>=20
> Add persistent subtest to validate MI_PRT_BATCH_BUFFER_START.
>=20
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/xe_exec_store.c | 87
> +++++++++++++++++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
>=20
> diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c in=
dex
> 7a66d744c..ea7ecb01f 100644
> --- a/tests/intel/xe_exec_store.c
> +++ b/tests/intel/xe_exec_store.c
> @@ -23,6 +23,7 @@
>  #define MAX_INSTANCE 9
>  #define STORE 0
>  #define COND_BATCH 1
> +#define MI_PRT_BATCH_BUFFER_START (0x39 << 23)
Move this command to a library

>=20
>  struct data {
>  	uint32_t batch[16];
> @@ -74,6 +75,24 @@ static void cond_batch(struct data *data, uint64_t
> addr, int value)
>  	data->addr =3D batch_addr;
>  }
>=20
> +static void persistance_batch(struct data *data, uint64_t addr) {
> +	int b;
> +	uint64_t batch_offset =3D (char *)&(data->batch) - (char *)data;
> +	uint64_t batch_addr =3D addr + batch_offset;
> +	uint64_t sdi_offset =3D (char *)&(data->data) - (char *)data;
> +	uint64_t sdi_addr =3D addr + sdi_offset;
Rename sdi_offset/addr as they no longer represent store dword addr but a p=
ersistent batch buffer addr.
> +
> +	b =3D 0;
> +	data->batch[b++] =3D MI_BATCH_BUFFER_START;
> +	data->batch[b++] =3D MI_PRT_BATCH_BUFFER_START;
> +	data->batch[b++] =3D sdi_addr;
> +	data->batch[b++] =3D sdi_addr >> 32;
> +	data->batch[b++] =3D MI_BATCH_BUFFER_END;
> +
> +	data->addr =3D batch_addr;
> +
> +}
>  /**
>   * SUBTEST: basic-store
>   * Description: Basic test to verify store dword.
> @@ -246,6 +265,71 @@ static void store_cachelines(int fd, struct
> drm_xe_engine_class_instance *eci,
>  	xe_vm_destroy(fd, vm);
>  }
>=20
> +/**
> + * SUBTEST: persistent
> + * DESCRIPTION: Validate MI_PRT_BATCH_BUFFER_START functionality  */
> +static void persistent(int fd) {
> +	struct drm_xe_sync sync =3D {
> +		.type =3D DRM_XE_SYNC_TYPE_SYNCOBJ,
> +		.flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> +	};
> +	struct drm_xe_exec exec =3D {
> +		.num_batch_buffer =3D 1,
> +		.num_syncs =3D 1,
> +		.syncs =3D to_user_pointer(&sync),
> +	};
> +	struct data *data1;
> +	struct data *data2;
> +	struct drm_xe_engine *engine;
> +	uint32_t vm, exec_queue,syncobj;
> +	uint32_t batch1, batch2;
Rename data1, data2, batch1 and batch2 to represent what are they intended =
for ?

Thanks,
Rahul
> +	uint64_t addr =3D 0x100000;
> +	int value =3D 0x123456;
> +	size_t batch_size =3D 4096;
> +
> +	syncobj =3D syncobj_create(fd, 0);
> +	sync.handle =3D syncobj;
> +
> +	vm =3D xe_vm_create(fd,
> DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> +	batch_size =3D ALIGN(batch_size + xe_cs_prefetch_size(fd),
> +					xe_get_default_alignment(fd));
> +
> +	engine =3D xe_engine(fd, 1);
> +	batch1 =3D xe_bo_create(fd, vm, batch_size,
> +			      vram_if_possible(fd, engine->instance.gt_id),
> +
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	batch2 =3D xe_bo_create(fd, vm, batch_size,
> +			      vram_if_possible(fd, engine->instance.gt_id),
> +
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +
> +	xe_vm_bind_async(fd, vm, engine->instance.gt_id, batch1, 0, addr,
> batch_size, &sync, 1);
> +	data1 =3D xe_bo_map(fd, batch1, batch_size);
> +	data2 =3D xe_bo_map(fd, batch2, batch_size);
> +
> +	store_dword_batch(data1, addr, value);
Persistent batch buffer should not contain MI_BATCH_BUFFER_START , you migh=
t have to rewrite a new helper to create store dword batch without MI_BATCH=
_BUFFER_START.

Thanks,
Rahul
> +	persistance_batch(data2, addr);
> +
> +	exec_queue =3D xe_exec_queue_create(fd, vm, &engine->instance,
> 0);
> +	exec.exec_queue_id =3D exec_queue;
> +	exec.address =3D data2->addr;
> +	sync.flags &=3D DRM_XE_SYNC_FLAG_SIGNAL;
> +	xe_exec(fd, &exec);
> +
> +	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
> +	igt_assert_eq(data1->data, value);
> +
> +	syncobj_destroy(fd, syncobj);
> +	munmap(data1, batch_size);
> +	munmap(data2, batch_size);
> +	gem_close(fd, batch1);
> +	gem_close(fd, batch2);
> +
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>  igt_main
>  {
>  	struct drm_xe_engine_class_instance *hwe; @@ -285,6 +369,9 @@
> igt_main
>  		xe_for_each_engine(fd, hwe)
>  			store_cachelines(fd, hwe, PAGES);
>=20
> +	igt_subtest("persistent")
> +		persistent(fd);
> +
>  	igt_fixture {
>  		xe_device_put(fd);
>  		close(fd);
> --
> 2.39.1
