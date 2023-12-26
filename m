Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67AD010E00D
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Dec 2023 06:54:06 +0000 (UTC)
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ch, Sai
 Gowtham" <sai.gowtham.ch@intel.com>
Subject: RE: [PATCH i-g-t 2/2] intel/xe_exec_store: Add Persistent subtest
Date: Tue, 26 Dec 2023 06:53:46 +0000
Message-ID: <MW3PR11MB4748823E61F27B39A77699A2AE98A@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20231222105353.23355-1-sai.gowtham.ch@intel.com>
 <20231222105353.23355-3-sai.gowtham.ch@intel.com>
In-Reply-To: <20231222105353.23355-3-sai.gowtham.ch@intel.com>
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
> Sent: Friday, December 22, 2023 4:24 PM
> To: igt-dev@lists.freedesktop.org; Ch, Sai Gowtham
> <sai.gowtham.ch@intel.com>
> Subject: [PATCH i-g-t 2/2] intel/xe_exec_store: Add Persistent subtest
>=20
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>=20
> Add persistent subtest to validate MI_PRT_BATCH_BUFFER_START.
>=20
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/xe_exec_store.c | 86 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
>=20
> diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c in=
dex
> ec875cffc..75bd65bb5 100644
> --- a/tests/intel/xe_exec_store.c
> +++ b/tests/intel/xe_exec_store.c
> @@ -74,6 +74,24 @@ static void cond_batch(struct data *data, uint64_t add=
r,
> int value)
>  	data->addr =3D batch_addr;
>  }
>=20
> +static void persistance_batch(struct data *data, uint64_t addr) {
> +	int b;
> +	uint64_t batch_offset =3D (char *)&(data->batch) - (char *)data;
> +	uint64_t batch_addr =3D addr + batch_offset;
> +	uint64_t prt_offset =3D (char *)&(data->data) - (char *)data;
> +	uint64_t prt_addr =3D addr + prt_offset;
> +
> +	b =3D 0;
> +	data->batch[b++] =3D MI_BATCH_BUFFER_START;
> +	data->batch[b++] =3D MI_PRT_BATCH_BUFFER_START;
> +	data->batch[b++] =3D prt_addr;
> +	data->batch[b++] =3D prt_addr >> 32;
> +	data->batch[b++] =3D MI_BATCH_BUFFER_END;
> +
> +	data->addr =3D batch_addr;
> +
> +}
>  /**
>   * SUBTEST: basic-store
>   * Description: Basic test to verify store dword.
> @@ -246,6 +264,71 @@ static void store_cachelines(int fd, struct
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
> +	struct data *sd_data;
> +	struct data *prt_data;
> +	struct drm_xe_engine *engine;
> +	uint32_t vm, exec_queue,syncobj;
				^
space required after that ','

Thanks,
Rahul
> +	uint32_t sd_batch, prt_batch;
> +	uint64_t addr =3D 0x100000;
> +	int value =3D 0x123456;
> +	size_t batch_size =3D 4096;
> +
> +	syncobj =3D syncobj_create(fd, 0);
> +	sync.handle =3D syncobj;
> +
> +	vm =3D xe_vm_create(fd, 0, 0);
> +	batch_size =3D ALIGN(batch_size + xe_cs_prefetch_size(fd),
> +					xe_get_default_alignment(fd));
> +
> +	engine =3D xe_engine(fd, 1);
> +	sd_batch =3D xe_bo_create(fd, vm, batch_size,
> +			      vram_if_possible(fd, engine->instance.gt_id),
> +
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	prt_batch =3D xe_bo_create(fd, vm, batch_size,
> +			      vram_if_possible(fd, engine->instance.gt_id),
> +
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +
> +	xe_vm_bind_async(fd, vm, engine->instance.gt_id, sd_batch, 0, addr,
> batch_size, &sync, 1);
> +	sd_data =3D xe_bo_map(fd, sd_batch, batch_size);
> +	prt_data =3D xe_bo_map(fd, prt_batch, batch_size);
> +
> +	store_dword_batch(sd_data, addr, value);
> +	persistance_batch(prt_data, addr);
> +
> +	exec_queue =3D xe_exec_queue_create(fd, vm, &engine->instance, 0);
> +	exec.exec_queue_id =3D exec_queue;
> +	exec.address =3D prt_data->addr;
> +	sync.flags &=3D DRM_XE_SYNC_FLAG_SIGNAL;
> +	xe_exec(fd, &exec);
> +
> +	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
> +	igt_assert_eq(sd_data->data, value);
> +
> +	syncobj_destroy(fd, syncobj);
> +	munmap(sd_data, batch_size);
> +	munmap(prt_data, batch_size);
> +	gem_close(fd, sd_batch);
> +	gem_close(fd, prt_batch);
> +
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>  igt_main
>  {
>  	struct drm_xe_engine_class_instance *hwe; @@ -285,6 +368,9 @@
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
