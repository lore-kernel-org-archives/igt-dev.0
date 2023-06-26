Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969D310E1F8
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jun 2023 13:13:55 +0000 (UTC)
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Mon, 26 Jun 2023 13:12:39 +0000
Message-ID: <BYAPR11MB3413798E1D16FBC7F106B8F1D026A@BYAPR11MB3413.namprd11.prod.outlook.com>
References: <20230626105112.15705-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20230626105112.15705-1-sai.gowtham.ch@intel.com>
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

Resending the patch series again,  Please ignore the patch.

--
Gowtham

> -----Original Message-----
> From: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>
> Sent: Monday, June 26, 2023 4:21 PM
> To: igt-dev@lists.freedesktop.org; Ch, Sai Gowtham
> <sai.gowtham.ch@intel.com>
> Subject: [PATCH i-g-t] tests/xe/xe_store: Add xe_store test to check stor=
e dword
> functionality
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
>  tests/xe/xe_store.c | 173
> ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 174 insertions(+)
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
> index 00000000..bb2e5319
> --- /dev/null
> +++ b/tests/xe/xe_store.c
> @@ -0,0 +1,173 @@
> +#include "igt.h"
> +#include "lib/igt_syncobj.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +#include "xe_drm.h"
> +
> +/**
> + * TEST: Tests to verify store dword functionality.
> + * Category: Software building block
> + * Sub-category: spin
> + * Functionality: intel-bb
> + * Test category: functionality test
> + */
> +
> +#define MAX_INSTANCE 9
> +
> +/**
> + * SUBTEST: basic-store
> + * Description: Basic test to verify store dword.
> + * Run type: FULL
> + */
> +static void store(int fd, struct drm_xe_engine_class_instance *hwe) {
> +	struct {
> +		uint32_t batch[16];
> +		uint64_t pad;
> +		uint32_t data;
> +	} *data;
> +	uint32_t vm;
> +	uint32_t engine;
> +	size_t bo_size;
> +	uint64_t addr =3D 0x100000;
> +	uint32_t bo =3D 0;
> +	int b;
> +
> +	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> +
> +	bo_size =3D sizeof(*data);
> +	bo_size =3D ALIGN(bo_size + xe_cs_prefetch_size(fd),
> +				xe_get_default_alignment(fd));
> +
> +	bo =3D xe_bo_create(fd, 0, vm, bo_size);
> +	data =3D xe_bo_map(fd, bo, bo_size);
> +
> +	xe_vm_bind_sync(fd, vm, bo, 0, addr, bo_size);
> +
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
> +	engine =3D xe_engine_create(fd, vm, hwe, 0);
> +	xe_exec_wait(fd, engine, batch_addr);
> +
> +	igt_assert_eq(data->data, 0x123456);
> +
> +	xe_vm_unbind_sync(fd, vm, 0, addr, bo_size);
> +	munmap(data, bo_size);
> +	gem_close(fd, bo);
> +
> +	xe_engine_destroy(fd, engine);
> +	xe_vm_destroy(fd, vm);
> +}
> +
> +/**
> + * SUBTEST: spin-basic
> + * Description: Test to verify store dword on all available engine.
> + * Run type: BAT
> + */
> +static void store_all(int fd, int gt, int class) {
> +	struct {
> +		uint32_t batch[16];
> +		uint64_t pad;
> +		uint32_t data;
> +	} *data;
> +	uint32_t vm;
> +	uint32_t engines[MAX_INSTANCE];
> +	size_t bo_size;
> +	uint64_t addr =3D 0x100000;
> +	uint32_t bo =3D 0;
> +	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
> +	struct drm_xe_engine_class_instance *hwe;
> +	int b, i, num_placements =3D 0;
> +
> +	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> +
> +	bo_size =3D sizeof(*data);
> +	bo_size =3D ALIGN(bo_size + xe_cs_prefetch_size(fd),
> +				xe_get_default_alignment(fd));
> +
> +	bo =3D xe_bo_create(fd, 0, vm, bo_size);
> +	data =3D xe_bo_map(fd, bo, bo_size);
> +
> +	xe_vm_bind_sync(fd, vm, bo, 0, addr, bo_size);
> +
> +	uint64_t batch_offset =3D (char *)&(data->batch) - (char *)data;
> +	uint64_t batch_addr =3D addr + batch_offset;
> +	uint64_t sdi_offset =3D (char *)&(data->data) - (char *)data;
> +	uint64_t sdi_addr =3D addr + sdi_offset;
> +
> +	b =3D 0;
> +	data->batch[b++] =3D MI_STORE_DWORD_IMM_GEN4;
> +	data->batch[b++] =3D sdi_addr;
> +	data->batch[b++] =3D sdi_addr >> 32;
> +	data->batch[b++] =3D 0xc0ffee;
> +	data->batch[b++] =3D MI_BATCH_BUFFER_END;
> +	igt_assert(b <=3D ARRAY_SIZE(data->batch));
> +
> +	xe_for_each_hw_engine(fd, hwe) {
> +		if (hwe->engine_class !=3D class || hwe->gt_id !=3D gt)
> +			continue;
> +		eci[num_placements++] =3D *hwe;
> +	}
> +	if (num_placements < 2)
> +		return;
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
> +		xe_exec_wait(fd, engine[i], batch_addr);
> +		igt_assert_eq(data[i]->data, 0xc0ffee);
> +	}
> +
> +	xe_vm_unbind_sync(fd, vm, 0, addr, bo_size);
> +	munmap(data, bo_size);
> +	gem_close(fd, bo);
> +
> +	for (i =3D 0; i < num_placements; i++) {
> +		xe_engine_destroy(fd, engine[i]);
> +	}
> +	xe_vm_destroy(fd, vm);
> +}
> +
> +igt_main
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +	int fd;
> +
> +	igt_fixture {
> +		fd =3D drm_open_driver(DRIVER_XE);
> +		xe_device_get(fd);
> +	}
> +
> +	igt_subtest("basic-store")
> +		xe_for_each_hw_engine(fd, hwe)
> +			store(fd, hwe);
> +
> +	igt_subtest("basic-all") {
> +		xe_for_each_gt(fd, gt)
> +			xe_for_each_hw_engine_class(class)
> +				store_all(fd, gt, class);
> +	}
> +
> +	igt_fixture
> +		close(fd);
> +}
> --
> 2.39.1
