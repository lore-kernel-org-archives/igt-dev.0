Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D0D510E34D
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 05:57:35 +0000 (UTC)
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Tue, 26 Sep 2023 05:57:32 +0000
Message-ID: <DM4PR12MB5152811EC17A15559B39EC1EE3C3A@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20230926055512.3953898-1-jesse.zhang@amd.com>
In-Reply-To: <20230926055512.3953898-1-jesse.zhang@amd.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/amd_dispatch: add reset subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

[AMD Official Use Only - General]

Please ignore,  will send a wrong version.

-----Original Message-----
From: Jesse Zhang <jesse.zhang@amd.com>
Sent: Tuesday, September 26, 2023 1:55 PM
To: igt-dev@lists.freedesktop.org
Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Deucher, Alexander <Alexander=
.Deucher@amd.com>; Tuikov, Luben <Luben.Tuikov@amd.com>; Koenig, Christian =
<Christian.Koenig@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>; Zhang,=
 Jesse(Jie) <Jesse.Zhang@amd.com>
Subject: [PATCH] tests/amd_dispatch: add reset subtest

V2:
   - improve subject and description  (Kamil,Luben)
   - sort the include alphabetically (Kamil)
   - Optimize some code (Luben)

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
Signed-off-by: Tim Huang <tim.huang@amd.com
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_dispatch.c | 45 +++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/tests/amdgpu/amd_dispatch.c b/tests/amdgpu/amd_dispatch.c inde=
x 77d63f7ad..b79b80578 100644
--- a/tests/amdgpu/amd_dispatch.c
+++ b/tests/amdgpu/amd_dispatch.c
@@ -5,6 +5,9 @@
  * Copyright 2023 Advanced Micro Devices, Inc.
  */

+#include <fcntl.h>
+#include <sys/stat.h>
+#include <sys/sysmacros.h>
 #include "lib/amdgpu/amd_memory.h"
 #include "lib/amdgpu/amd_command_submission.h"
 #include "lib/amdgpu/amd_dispatch.h"
@@ -21,6 +24,40 @@ amdgpu_dispatch_hang_slow_compute(amdgpu_device_handle d=
evice_handle)
        amdgpu_dispatch_hang_slow_helper(device_handle, AMDGPU_HW_IP_COMPUT=
E);  }

+static void
+amdgpu_gpu_reset_test(amdgpu_device_handle device_handle, int
+drm_amdgpu) {
+       amdgpu_context_handle context_handle;
+       char debugfs_path[256], tmp[10];
+       uint32_t hang_state, hangs;
+       struct stat sbuf;
+       int r, fd;
+
+       r =3D amdgpu_cs_ctx_create(device_handle, &context_handle);
+       igt_assert_eq(r, 0);
+
+       r =3D fstat(drm_amdgpu, &sbuf);
+       igt_assert_eq(r, 0);
+
+       sprintf(debugfs_path, "/sys/kernel/debug/dri/%d/amdgpu_gpu_recover"=
, minor(sbuf.st_rdev));
+       fd =3D open(debugfs_path, O_RDONLY);
+       igt_assert_fd(fd);
+
+       r =3D read(fd, tmp, ARRAY_SIZE(tmp));
+       igt_assert_lt(0,r);
+
+       r =3D amdgpu_cs_query_reset_state(context_handle, &hang_state, &han=
gs);
+       igt_assert_eq(r, 0);
+       igt_assert_eq(hang_state, AMDGPU_CTX_UNKNOWN_RESET);
+
+       close(fd);
+       r =3D amdgpu_cs_ctx_free(context_handle);
+       igt_assert_eq(r, 0);
+
+       amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_GFX);
+       amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE); }
+
 igt_main
 {
        amdgpu_device_handle device;
@@ -64,6 +101,14 @@ igt_main
                }
        }

+       igt_describe("Test-GPU-reset-using-amdgpu-debugfs-to-hang-the-job-o=
n-gfx-ring");
+       igt_subtest_with_dynamic("amdgpu-reset-test-gfx-with-IP-GFX") {
+               if (arr_cap[AMD_IP_GFX]) {
+                       igt_dynamic_f("amdgpu-reset-gfx")
+                       amdgpu_gpu_reset_test(device,fd);
+               }
+       }
+
        igt_fixture {
                amdgpu_device_deinitialize(device);
                drm_close_driver(fd);
--
2.25.1
