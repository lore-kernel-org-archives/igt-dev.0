Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83CB010E14D
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Dec 2023 04:49:04 +0000 (UTC)
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Wed, 6 Dec 2023 04:49:00 +0000
Message-ID: <BYAPR11MB341348673819A01CBC2192ADD084A@BYAPR11MB3413.namprd11.prod.outlook.com>
References: <20231205204217.322849-1-matthew.brost@intel.com>
 <20231205204217.322849-3-matthew.brost@intel.com>
In-Reply-To: <20231205204217.322849-3-matthew.brost@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 2/2] xe_exec_basic: Add section to test zero
 number of BB in exec IOCTL
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



>-----Original Message-----
>From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Matthew
>Brost
>Sent: Wednesday, December 6, 2023 2:12 AM
>To: igt-dev@lists.freedesktop.org
>Subject: [igt-dev] [PATCH 2/2] xe_exec_basic: Add section to test zero num=
ber of
>BB in exec IOCTL
>
>Verify the exec queue ordering works wrt out-sync signaling when zero numb=
er of
>BB passed to exec IOCTL.
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> tests/intel/xe_exec_basic.c | 108 ++++++++++++++++++++++++++++++++++++
> 1 file changed, 108 insertions(+)
>
>diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c ind=
ex
>2defd1e358..b20581382c 100644
>--- a/tests/intel/xe_exec_basic.c
>+++ b/tests/intel/xe_exec_basic.c
>@@ -17,6 +17,7 @@
>
> #include "xe/xe_ioctl.h"
> #include "xe/xe_query.h"
>+#include "xe/xe_spin.h"
> #include <string.h>
>
> #define MAX_N_EXEC_QUEUES 16
>@@ -300,6 +301,109 @@ test_exec(int fd, struct drm_xe_engine_class_instanc=
e
>*eci,
> 	}
> }
>
>+/**
>+ * SUBTEST: zero-execs
>+ * Description: Test zero execs in IOCTL
>+ * Functionality: exec IOCTL
>+ * Run type: BAT
>+ */
>+
>+static void test_zero_execs(int fd, struct drm_xe_engine_class_instance *=
eci,
>+			    int n_execs)
>+{
>+	uint32_t vm;
>+	uint64_t addr =3D 0x1a0000;
>+	struct drm_xe_sync sync[2] =3D {
>+		{ .flags =3D DRM_XE_SYNC_TYPE_SYNCOBJ |
>DRM_XE_SYNC_FLAG_SIGNAL, },
>+		{ .flags =3D DRM_XE_SYNC_TYPE_SYNCOBJ |
>DRM_XE_SYNC_FLAG_SIGNAL, },
>+	};
>+	struct drm_xe_exec exec =3D {
>+		.num_batch_buffer =3D 1,
>+		.num_syncs =3D 1,
>+		.syncs =3D to_user_pointer(sync),
>+	};
>+	size_t bo_size;
>+	uint32_t bo =3D 0;
>+	uint32_t syncobj;
>+	uint32_t exec_queue;
>+	struct xe_cork cork;
>+	struct {
>+		uint32_t batch[16];
>+		uint64_t pad;
>+		uint32_t data;
>+	} *data;
>+	int i, b;
>+
>+	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
>+	bo_size =3D sizeof(*data) * n_execs;
>+	bo_size =3D ALIGN(bo_size + xe_cs_prefetch_size(fd),
>+			xe_get_default_alignment(fd));
>+	bo =3D xe_bo_create(fd, vm, bo_size,
>+			  vram_if_possible(fd, eci->gt_id),
>+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>+	data =3D xe_bo_map(fd, bo, bo_size);
>+	exec_queue =3D xe_exec_queue_create(fd, vm, eci, 0);
>+
>+	xe_cork_init(fd, eci, &cork);
>+	xe_cork_wait_started(&cork);
>+
>+	/* Initial bind behind cork */
>+	sync[0].handle =3D syncobj =3D syncobj_create(fd, 0);
>+	sync[0].flags |=3D DRM_XE_SYNC_FLAG_SIGNAL;
>+	sync[1].handle =3D cork.syncobj;
>+	sync[1].flags &=3D ~DRM_XE_SYNC_FLAG_SIGNAL;
>+	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 2);
>+
>+	/* Exec behind bind */
>+	for (i =3D 0; i < n_execs; i++) {
>+		uint64_t batch_offset =3D (char *)&data[i].batch - (char *)data;
>+		uint64_t batch_addr =3D addr + batch_offset;
>+		uint64_t sdi_offset =3D (char *)&data[i].data - (char *)data;
>+		uint64_t sdi_addr =3D addr + sdi_offset;
>+
>+		b =3D 0;
>+		data[i].batch[b++] =3D MI_STORE_DWORD_IMM_GEN4;
>+		data[i].batch[b++] =3D sdi_addr;
>+		data[i].batch[b++] =3D sdi_addr >> 32;
>+		data[i].batch[b++] =3D 0xc0ffee;
>+		data[i].batch[b++] =3D MI_BATCH_BUFFER_END;
>+		igt_assert(b <=3D ARRAY_SIZE(data[i].batch));
>+
>+		sync[0].flags &=3D ~DRM_XE_SYNC_FLAG_SIGNAL;
>+
>+		exec.exec_queue_id =3D exec_queue;
>+		exec.address =3D batch_addr;
>+		xe_exec(fd, &exec);
Why are you submitting jobs first ? when the intension is to just check exe=
c IOCTL with zero number of bb,
I could be a simple test with num_batch_buffer =3D 0 with a dummy workload =
just submitting  MI_BATCH_BUFFER_END.=20

>+	}
>+
>+	/* Exec with no batch buffer */
>+	sync[0].handle =3D syncobj_create(fd, 0);
>+	sync[0].flags |=3D DRM_XE_SYNC_FLAG_SIGNAL;
>+	exec.num_batch_buffer =3D 0;
What happens if we give valid exec.address with zero number of BB ?

--
Sai Gowtham Ch
>+	exec.address =3D 0;
>+	xe_exec(fd, &exec);
>+
>+	/* Let jobs runs for a bit */
>+	usleep(100000);
>+
>+	/* both bind and execs are waiting */
>+	igt_assert(!syncobj_wait(fd, &syncobj, 1, 0, 0, NULL));
>+	igt_assert(!syncobj_wait(fd, &sync[0].handle, 1, 0, 0, NULL));
>+
>+	/* Release cork */
>+	xe_cork_end(&cork);
>+	xe_cork_wait_done(&cork);
>+	xe_cork_fini(&cork);
>+
>+	/* both binds are done */
>+	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
>+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
>+
>+	syncobj_destroy(fd, sync[0].handle);
>+	gem_close(fd, bo);
>+	xe_vm_destroy(fd, vm);
>+}
>+
> igt_main
> {
> 	struct drm_xe_engine_class_instance *hwe; @@ -369,6 +473,10 @@
>igt_main
> 				test_exec(fd, hwe, 1, 0, 1, s->flags);
> 	}
>
>+	igt_subtest("zero-execs")
>+		xe_for_each_engine(fd, hwe)
>+			test_zero_execs(fd, hwe, 1);
>+
> 	igt_fixture
> 		drm_close_driver(fd);
> }
>--
>2.34.1
