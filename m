Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 240D910E186
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jan 2024 07:41:53 +0000 (UTC)
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Ch, Sai Gowtham"
 <sai.gowtham.ch@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_exec_compute_mode: Add non-blocking
 subtest
Date: Mon, 8 Jan 2024 07:41:44 +0000
Message-ID: <CH3PR11MB843422A9E1E25E944B9ACFB98D6B2@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20240105204206.25865-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20240105204206.25865-1-sai.gowtham.ch@intel.com>
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
> Sent: Saturday, January 6, 2024 2:12 AM
> To: igt-dev@lists.freedesktop.org; Brost, Matthew
> <matthew.brost@intel.com>; Ch, Sai Gowtham <sai.gowtham.ch@intel.com>
> Subject: [PATCH i-g-t] tests/intel/xe_exec_compute_mode: Add non-blocking
> subtest
>=20
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>=20
> Fill the ring with maximum workload and expecte kernel to return -
> EWOULDBLOCK error.
>=20
> v2: Fixing batch buffer submission, updating sync mapping addresses
>     of VM, SPIN & EXEC for better readability. (Matthew Brost)
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/xe_exec_compute_mode.c | 111
> +++++++++++++++++++++++++++++
>  1 file changed, 111 insertions(+)
>=20
> diff --git a/tests/intel/xe_exec_compute_mode.c
> b/tests/intel/xe_exec_compute_mode.c
> index b935ee0bc..6ebfa1a86 100644
> --- a/tests/intel/xe_exec_compute_mode.c
> +++ b/tests/intel/xe_exec_compute_mode.c
> @@ -19,6 +19,7 @@
>=20
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
> +#include "xe/xe_spin.h"
>  #include <string.h>
>=20
>  #define MAX_N_EXECQUEUES 	16
> @@ -289,6 +290,112 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  		close(map_fd);
>  }
>=20
> +/**
> + * SUBTEST: non-blocking
> + * Description: Fill the ring and check we get expected errors.
> + * Test category: functionality test
> + */
> +#define ONE_SEC	MS_TO_NS(1000)
> +#define VM_DATA		0
> +#define SPIN_DATA	1
> +#define EXEC_DATA	2
> +#define DATA_COUNT	3
> +static void non_block(int fd, int expect) {
> +	uint64_t addr =3D 0x1a0000;
> +	struct drm_xe_sync sync[1] =3D {
> +		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE,
> +		  .flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> +		  .timeline_value =3D USER_FENCE_VALUE},
> +	};
> +	struct drm_xe_exec exec =3D {
> +		.num_batch_buffer =3D 1,
> +		.num_syncs =3D 1,
> +		.syncs =3D to_user_pointer(&sync),
> +	};
> +	struct {
> +		struct xe_spin spin;
> +		uint32_t batch[16];
> +		uint64_t vm_sync;
> +		uint32_t data;
> +		uint64_t exec_sync;
> +	} *data =3D NULL;
> +	struct xe_spin_opts spin_opts =3D { .addr =3D addr, .preempt =3D false =
};
> +	struct drm_xe_engine *engine;
> +	uint64_t batch_offset =3D (char *)&data[EXEC_DATA].batch - (char
> *)data;
> +	uint64_t batch_addr =3D addr + batch_offset;
> +	uint64_t sdi_offset =3D (char *)&data[EXEC_DATA].data - (char *)data;
> +	uint64_t sdi_addr =3D addr + sdi_offset;
> +	size_t bo_size;
> +	uint32_t vm;
> +	uint32_t exec_queue;
> +	int value =3D 0x123456;
> +	uint32_t bo =3D 0;
> +	int b, err;
> +
> +	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> +	bo_size =3D sizeof(*data) * DATA_COUNT;
> +	bo_size =3D ALIGN(bo_size + xe_cs_prefetch_size(fd),
> +xe_get_default_alignment(fd));
> +
> +	engine =3D xe_engine(fd, 1);
> +	bo =3D xe_bo_create(fd, vm, bo_size, vram_if_possible(fd,
> +engine->instance.gt_id), 0);
> +
> +	data =3D xe_bo_map(fd, bo, bo_size);
> +	memset(data, 0, bo_size);
> +	exec_queue =3D xe_exec_queue_create(fd, vm, &engine->instance, 0);
> +
> +	sync[0].addr =3D to_user_pointer(&data[VM_DATA].vm_sync);
> +	xe_vm_bind_async(fd, vm, engine->instance.gt_id, bo, 0,
> +			       addr, bo_size, sync, 1);
> +	xe_wait_ufence(fd, &data[VM_DATA].vm_sync, USER_FENCE_VALUE,
> 0, ONE_SEC);
> +	data[VM_DATA].vm_sync =3D 0;
> +
> +	xe_spin_init(&data[SPIN_DATA].spin, &spin_opts);
> +	sync[0].addr =3D addr + (char *)&data[SPIN_DATA].exec_sync - (char
> *)data;
> +	exec.exec_queue_id =3D exec_queue;
> +	exec.address =3D spin_opts.addr;
> +	xe_exec(fd, &exec);
> +	xe_spin_wait_started(&data[SPIN_DATA].spin);
> +
> +	b =3D 0;
> +	data[0].batch[b++] =3D MI_STORE_DWORD_IMM_GEN4;
> +	data[0].batch[b++] =3D sdi_addr;
> +	data[0].batch[b++] =3D sdi_addr >> 32;
> +	data[0].batch[b++] =3D value;
> +	data[0].batch[b++] =3D MI_BATCH_BUFFER_END;
> +	igt_assert(b <=3D ARRAY_SIZE(data->batch));
> +
> +	sync[0].addr =3D addr + (char *)&data[EXEC_DATA].exec_sync - (char
> *)data;
> +	exec.num_syncs =3D 0;
> +	exec.exec_queue_id =3D exec_queue;
> +	exec.address =3D batch_addr;
> +
> +	while (1) {
> +		err =3D __xe_exec(fd, &exec);
> +
> +		if (err =3D=3D -EWOULDBLOCK)
> +			break;
> +	}
> +	igt_assert_eq(err, expect);
> +
> +	xe_spin_end(&data[SPIN_DATA].spin);
> +	xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync,
> USER_FENCE_VALUE, 0, ONE_SEC);
> +	usleep(50000);
> +
> +	exec.num_syncs =3D 1;
> +	xe_exec(fd, &exec);
> +	xe_wait_ufence(fd, &data[EXEC_DATA].exec_sync,
> USER_FENCE_VALUE, 0,
> +ONE_SEC);
> +
> +	sync[0].addr =3D to_user_pointer(&data[VM_DATA].vm_sync);
> +	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> +	xe_wait_ufence(fd, &data[VM_DATA].vm_sync, USER_FENCE_VALUE,
> 0, ONE_SEC);
> +	munmap(data, bo_size);
> +	gem_close(fd, bo);
> +
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>  igt_main
>  {
>  	struct drm_xe_engine_class_instance *hwe; @@ -346,6 +453,10 @@
> igt_main
>  					  s->flags);
>  	}
>=20
> +	igt_subtest("non-blocking")
> +		non_block(fd, -EWOULDBLOCK);
> +
LGTM.
Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> +
>  	igt_fixture
>  		drm_close_driver(fd);
>  }
> --
> 2.39.1
