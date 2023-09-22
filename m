Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E760610E193
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Sep 2023 02:31:00 +0000 (UTC)
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Fri, 22 Sep 2023 02:30:57 +0000
Message-ID: <DM4PR12MB51524696EB2C259DD9B59578E3FFA@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20230922013641.3413262-1-jesse.zhang@amd.com>
In-Reply-To: <20230922013641.3413262-1-jesse.zhang@amd.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/amdgpu: add stable pstate tet
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Huang,
 Tim" <Tim.Huang@amd.com>, "Tuikov, Luben" <Luben.Tuikov@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

[AMD Official Use Only - General]

Please Ignore the patch, Since the pipeline build error  because of the low=
er version libdrm.
" https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/991632/fail=
ures"
I will send another patch later.

-----Original Message-----
From: Jesse Zhang <jesse.zhang@amd.com>
Sent: Friday, September 22, 2023 9:37 AM
To: igt-dev@lists.freedesktop.org
Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Deucher, Alexander <Alexander=
.Deucher@amd.com>; Tuikov, Luben <Luben.Tuikov@amd.com>; Koenig, Christian =
<Christian.Koenig@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>; Zhang,=
 Jesse(Jie) <Jesse.Zhang@amd.com>; Huang, Tim <Tim.Huang@amd.com>
Subject: [PATCH] tests/amdgpu: add stable pstate tet

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
Signed-off-by: Tim Huang <tim.huang@amd.com>
---
 include/drm-uapi/amdgpu_drm.h | 10 +++++++++
 tests/amdgpu/amd_basic.c      | 38 +++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h =
index 0cbd1540a..f921cd021 100644
--- a/include/drm-uapi/amdgpu_drm.h
+++ b/include/drm-uapi/amdgpu_drm.h
@@ -206,6 +206,8 @@ union drm_amdgpu_bo_list {
 #define AMDGPU_CTX_OP_FREE_CTX 2
 #define AMDGPU_CTX_OP_QUERY_STATE      3
 #define AMDGPU_CTX_OP_QUERY_STATE2     4
+#define AMDGPU_CTX_OP_GET_STABLE_PSTATE        5
+#define AMDGPU_CTX_OP_SET_STABLE_PSTATE        6

 /* GPU reset status */
 #define AMDGPU_CTX_NO_RESET            0
@@ -238,6 +240,14 @@ union drm_amdgpu_bo_list {
 #define AMDGPU_CTX_PRIORITY_HIGH        512
 #define AMDGPU_CTX_PRIORITY_VERY_HIGH   1023

+/* select a stable profiling pstate for perfmon tools */ #define
+AMDGPU_CTX_STABLE_PSTATE_FLAGS_MASK  0xf #define
+AMDGPU_CTX_STABLE_PSTATE_NONE  0 #define
+AMDGPU_CTX_STABLE_PSTATE_STANDARD  1 #define
+AMDGPU_CTX_STABLE_PSTATE_MIN_SCLK  2 #define
+AMDGPU_CTX_STABLE_PSTATE_MIN_MCLK  3 #define
+AMDGPU_CTX_STABLE_PSTATE_PEAK  4
+
 struct drm_amdgpu_ctx_in {
        /** AMDGPU_CTX_OP_* */
        __u32   op;
diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c index 24c7=
0a9f7..b276c2107 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -612,6 +612,36 @@ amdgpu_sync_dependency_test(amdgpu_device_handle devic=
e_handle)
        free_cmd_base(base);
 }

+static void
+amdgpu_stable_pstate_test(amdgpu_device_handle device_handle) {
+       int r;
+       amdgpu_context_handle context_handle;
+       uint32_t current_pstate =3D 0, new_pstate =3D 0;
+
+       r =3D amdgpu_cs_ctx_create(device_handle, &context_handle);
+       igt_assert_eq(r, 0);
+
+       r =3D amdgpu_cs_ctx_stable_pstate(context_handle,
+                                       AMDGPU_CTX_OP_GET_STABLE_PSTATE,
+                                       0, &current_pstate);
+       igt_assert_eq(r, 0);
+       igt_assert_eq(new_pstate, AMDGPU_CTX_STABLE_PSTATE_NONE);
+       r =3D amdgpu_cs_ctx_stable_pstate(context_handle,
+                                       AMDGPU_CTX_OP_SET_STABLE_PSTATE,
+                                       AMDGPU_CTX_STABLE_PSTATE_PEAK, NULL=
);
+       igt_assert_eq(r, 0);
+
+       r =3D amdgpu_cs_ctx_stable_pstate(context_handle,
+                                       AMDGPU_CTX_OP_GET_STABLE_PSTATE,
+                                       0, &new_pstate);
+       igt_assert_eq(r, 0);
+       igt_assert_eq(new_pstate, AMDGPU_CTX_STABLE_PSTATE_PEAK);
+
+       r =3D amdgpu_cs_ctx_free(context_handle);
+       igt_assert_eq(r, 0);
+
+}
 static void
 amdgpu_gfx_dispatch_test_gfx(amdgpu_device_handle device_handle)  { @@ -73=
9,6 +769,14 @@ igt_main
                }
        }

+       igt_describe("Check-pstate-for-gfx-power-and-clock");
+       igt_subtest_with_dynamic("stable-pstate-test-with-IP-SMU") {
+               if (arr_cap[AMD_IP_GFX]) {
+                       igt_dynamic_f("stable-pstate-test")
+                       amdgpu_stable_pstate_test(device);
+               }
+       }
+
        igt_fixture {
                amdgpu_device_deinitialize(device);
                drm_close_driver(fd);
--
2.25.1
