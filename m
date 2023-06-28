Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7111310E0E0
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jun 2023 09:51:05 +0000 (UTC)
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ch, Sai
 Gowtham" <sai.gowtham.ch@intel.com>
Date: Wed, 28 Jun 2023 09:51:00 +0000
Message-ID: <MW3PR11MB4748FED37FA2A8C94224FC48AE24A@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20230627141107.22549-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20230627141107.22549-1-sai.gowtham.ch@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/xe/xe_store: Add xe_store test to
 check store dword functionality
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
> Sent: 27 June 2023 19:41
> To: igt-dev@lists.freedesktop.org; Ch, Sai Gowtham
> <sai.gowtham.ch@intel.com>
> Subject: [igt-dev] [PATCH i-g-t] tests/xe/xe_store: Add xe_store test to =
check
> store dword functionality
>=20
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>=20
> Adding xe_store test to valide store dword funtionality, this has basic t=
est and
> test which runs on all the available engines.
>=20
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/meson.build   |   1 +
>  tests/xe/xe_store.c | 197
> ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 198 insertions(+)
>  create mode 100644 tests/xe/xe_store.c
>=20
> diff --git a/tests/meson.build b/tests/meson.build index 85ea7e74..2874be=
77
> 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -267,6 +267,7 @@ xe_progs =3D [
>  	'xe_pm',
>  	'xe_prime_self_import',
>  	'xe_query',
> +	'xe_store',
>  	'xe_vm',
>  	'xe_waitfence',
>  	'xe_spin_batch',
> diff --git a/tests/xe/xe_store.c b/tests/xe/xe_store.c new file mode 1006=
44
> index 00000000..5765c3d8
> --- /dev/null
> +++ b/tests/xe/xe_store.c
Add Copyright information
> @@ -0,0 +1,197 @@
> +#include "igt.h"
> +#include "lib/igt_syncobj.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +#include "xe_drm.h"
> +
> +/**
> + * TEST: Tests to verify store dword functionality.
> + * Category: Software building block
> + * Sub-category: HW
> + * Functionality: intel-bb
> + * Test category: functionality test
> + */
> +
> +#define MAX_INSTANCE 9
> +
> +struct batch
Change name to batch_info/data
 {
> +	uint32_t batch[16];
> +	uint64_t pad;
> +	uint32_t data;
> +	uint64_t addr;
> +};
> +
> +static void batch(struct batch *data, uint64_t addr)
Change name to store_dword_batch/cmd(). If possible move this library as st=
ore is used in most of igt's.
 {
> +	int b;
> +	uint64_t batch_offset =3D (char *)&(data->batch) - (char *)data;
> +	uint64_t batch_addr =3D addr + batch_offset;
> +	uint64_t sdi_offset =3D (char *)&(data->data) - (char *)data;
> +	uint64_t sdi_addr =3D addr + sdi_offset;
> +
> +	b =3D 0;
> +	data->batch[b++] =3D MI_STORE_DWORD_IMM_GEN4;
> +	data->batch[b++] =3D sdi_addr;
> +	data->batch[b++] =3D sdi_addr >> 32;
> +	data->batch[b++] =3D 0x123456;
> +	data->batch[b++] =3D MI_BATCH_BUFFER_END;
> +	igt_assert(b <=3D ARRAY_SIZE(data->batch));
> +
> +	data->addr =3D batch_addr;
> +}
> +
> +/**
> + * SUBTEST: basic-store
> + * Description: Basic test to verify store dword.
> + * Run type: FULL
> + */
> +static void store(int fd)
> +{
> +	struct drm_xe_sync sync =3D {
> +		.flags =3D DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
> +	};
> +	struct drm_xe_exec exec =3D {
> +		.num_batch_buffer =3D 1,
> +		.num_syncs =3D 1,
> +		.syncs =3D to_user_pointer(&sync),
> +	};
> +	struct batch *data;
> +	struct drm_xe_engine_class_instance *hw_engine;
> +	uint32_t vm;
> +	uint32_t engine;
> +	uint32_t syncobj;
> +	size_t bo_size;
> +	uint64_t addr =3D 0x100000;
> +	uint32_t bo =3D 0;
> +
> +	syncobj =3D syncobj_create(fd, 0);
> +	sync.handle =3D syncobj;
> +
> +	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> +	bo_size =3D sizeof(*data);
> +	bo_size =3D ALIGN(bo_size + xe_cs_prefetch_size(fd),
> +			xe_get_default_alignment(fd));
> +
> +	hw_engine =3D xe_hw_engine(fd, 1);
> +	bo =3D xe_bo_create(fd, hw_engine->gt_id, vm, bo_size);
> +
> +	xe_vm_bind_async(fd, vm, hw_engine->gt_id, bo, 0, addr, bo_size,
> &sync, 1);
> +	data =3D xe_bo_map(fd, bo, bo_size);
> +	batch(data, addr);
> +
> +	engine =3D xe_engine_create(fd, vm, hw_engine, 0);
> +	exec.engine_id =3D engine;
> +	exec.address =3D data->addr;
> +	sync.flags &=3D DRM_XE_SYNC_SIGNAL;
> +	xe_exec(fd, &exec);
> +
> +	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
> +	igt_assert_eq(data->data, 0x123456);
> +
> +	syncobj_destroy(fd, syncobj);
> +	munmap(data, bo_size);
> +	gem_close(fd, bo);
> +
> +	xe_engine_destroy(fd, engine);
> +	xe_vm_destroy(fd, vm);
> +}
> +
> +/**
> + * SUBTEST: basic-all
> + * Description: Test to verify store dword on all available engine.
> + * Run type: BAT
> + */
> +static void store_all(int fd, int gt, int class) {
> +	struct drm_xe_sync sync =3D {
> +		.flags =3D DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
> +	};
> +	struct drm_xe_exec exec =3D {
> +		.num_batch_buffer =3D 1,
> +		.num_syncs =3D 1,
> +		.syncs =3D to_user_pointer(&sync),
> +	};
> +
> +	struct batch *data;
> +	uint32_t vm, syncobj;
> +	uint32_t engines[MAX_INSTANCE];
> +	size_t bo_size;
> +	uint64_t addr =3D 0x100000;
> +	uint32_t bo =3D 0;
> +	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
> +	struct drm_xe_engine_class_instance *hwe;
> +	int i, num_placements =3D 0;
> +
> +	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> +	bo_size =3D sizeof(*data);
> +	bo_size =3D ALIGN(bo_size + xe_cs_prefetch_size(fd),
> +			xe_get_default_alignment(fd));
> +
> +	syncobj =3D syncobj_create(fd, 0);
> +	sync.handle =3D syncobj;
> +
> +	bo =3D xe_bo_create(fd, 0, vm, bo_size);
> +	data =3D xe_bo_map(fd, bo, bo_size);
> +	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, &sync, 1);
> +
> +	xe_for_each_hw_engine(fd, hwe) {
> +		if (hwe->engine_class !=3D class || hwe->gt_id !=3D gt)
> +			continue;
> +		eci[num_placements++] =3D *hwe;
> +	}
> +	if (num_placements < 2)
> +		return;
> +	batch(data, addr);
> +
> +	for (i =3D 0; i < num_placements; i++) {
> +		struct drm_xe_engine_create create =3D {
> +			.vm_id =3D vm,
> +			.width =3D 1,
> +			.num_placements =3D num_placements,
> +			.instances =3D to_user_pointer(eci),
> +		};
> +
> +		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_ENGINE_CREATE,
> +					&create), 0);
> +		engines[i] =3D create.engine_id;
> +		exec.engine_id =3D engines[i];
> +		exec.address =3D data->addr;
> +		sync.flags &=3D DRM_XE_SYNC_SIGNAL;
> +		xe_exec(fd, &exec);
> +
> +		igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
> +		igt_assert_eq(data->data, 0x123456);
> +	}
> +
> +	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, &sync, 1);
> +	syncobj_destroy(fd, syncobj);
> +	munmap(data, bo_size);
> +	gem_close(fd, bo);
> +
> +	for (i =3D 0; i < num_placements; i++) {
> +		xe_engine_destroy(fd, engines[i]);
> +	}
> +	xe_vm_destroy(fd, vm);
> +}
> +
> +igt_main
> +{
> +	int fd, class, gt;
> +
> +	igt_fixture {
> +		fd =3D drm_open_driver(DRIVER_XE);
> +		xe_device_get(fd);
> +	}
> +
> +	igt_subtest("basic-store")
> +		store(fd);
> +
> +	igt_subtest("basic-all") {
> +		xe_for_each_gt(fd, gt)
> +			xe_for_each_hw_engine_class(class)
> +				store_all(fd, gt, class);
> +	}
> +
> +	igt_fixture
Add xe_device_put(fd);

Thanks,
Rahul
> +		close(fd);
> +}
> --
> 2.39.1
