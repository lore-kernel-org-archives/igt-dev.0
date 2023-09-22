Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2081.outbound.protection.outlook.com [40.107.237.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D24DD10E0C4
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Sep 2023 01:24:58 +0000 (UTC)
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Fri, 22 Sep 2023 01:24:54 +0000
Message-ID: <DM4PR12MB51522E91FD16557D9221C3ADE3FFA@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20230920223905.268940-1-vitaly.prosyak@amd.com>
In-Reply-To: <20230920223905.268940-1-vitaly.prosyak@amd.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/amdgpu: add GFX11 to tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

[AMD Official Use Only - General]

Reviewed-by: Jesse Zhang <Jesse.Zhang@amd.com>

Regards,
Jesse

-----Original Message-----
From: vitaly.prosyak@amd.com <vitaly.prosyak@amd.com>
Sent: Thursday, September 21, 2023 6:39 AM
To: igt-dev@lists.freedesktop.org
Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhan=
g@amd.com>; Tuikov, Luben <Luben.Tuikov@amd.com>; Deucher, Alexander <Alexa=
nder.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>
Subject: [PATCH] tests/amdgpu: add GFX11 to tests

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Add GFX11 to basic and GPU reset tests.
Improve GPU reset tests by validating flags, if no reset or reset is still =
in progress then avoid asserting the status.

Cc: Jesse Zhang <Jesse.Zhang@amd.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 include/drm-uapi/amdgpu_drm.h |  2 ++
 lib/amdgpu/amd_dispatch.c     | 21 +++++++++++++++++----
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h =
index 0cbd1540a..323137f42 100644
--- a/include/drm-uapi/amdgpu_drm.h
+++ b/include/drm-uapi/amdgpu_drm.h
@@ -225,6 +225,8 @@ union drm_amdgpu_bo_list {
 /* indicate some errors are detected by RAS */
 #define AMDGPU_CTX_QUERY2_FLAGS_RAS_CE   (1<<3)
 #define AMDGPU_CTX_QUERY2_FLAGS_RAS_UE   (1<<4)
+/* indicate that the reset hasn't completed yet */ #define
+AMDGPU_CTX_QUERY2_FLAGS_RESET_IN_PROGRESS (1<<5)

 /* Context priority level */
 #define AMDGPU_CTX_PRIORITY_UNSET       -2048
diff --git a/lib/amdgpu/amd_dispatch.c b/lib/amdgpu/amd_dispatch.c index f1=
7240f5c..b337646d3 100644
--- a/lib/amdgpu/amd_dispatch.c
+++ b/lib/amdgpu/amd_dispatch.c
@@ -103,6 +103,8 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device=
_handle,
                base_cmd->emit(base_cmd, 0x74fac);
        else if (version =3D=3D 10)
                base_cmd->emit(base_cmd, 0x1104bfac);
+       else if (version =3D=3D 11)
+               base_cmd->emit(base_cmd, 0x1003dfac);

        /* Sets a range of pixel shader constants */
        base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 4)); @@ -=
351,9 +353,9 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle =
device_handle,
        void *ptr_shader;
        unsigned char *ptr_src;
        uint32_t *ptr_cmd;
-       uint64_t mc_address_src, mc_address_dst, mc_address_shader, mc_addr=
ess_cmd;
+       uint64_t mc_address_src, mc_address_dst, mc_address_shader,
+mc_address_cmd, reset_flags;
        amdgpu_va_handle va_src, va_dst, va_shader, va_cmd;
-       int r;
+       int r, r2;

        int bo_dst_size =3D 0x4000000;
        int bo_shader_size =3D 0x400000;
@@ -425,6 +427,8 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_han=
dle device_handle,
                base_cmd->emit(base_cmd, 0x74fac);
        else if (version =3D=3D 10)
                base_cmd->emit(base_cmd, 0x1104bfac);
+       else if (version =3D=3D 11)
+               base_cmd->emit(base_cmd, 0x1003dfac);


        /* Writes the UAV constant data to the SGPRs. */ @@ -485,7 +489,16 =
@@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle=
,

        r =3D amdgpu_cs_query_reset_state(context_handle, &hang_state, &han=
gs);
        igt_assert_eq(r, 0);
-       igt_assert_eq(hang_state, gpu_reset_status_equel);
+       r2 =3D amdgpu_cs_query_reset_state2(context_handle, &reset_flags);
+       igt_assert_eq(r2, 0);
+
+       if (!(reset_flags =3D=3D 0 ||
+                 reset_flags & AMDGPU_CTX_QUERY2_FLAGS_RESET_IN_PROGRESS))=
 {
+               /*
+                *  Check reset_state only when reset is occured and not in=
 progress
+                */
+               igt_assert_eq(hang_state, gpu_reset_status_equel);
+       }

        r =3D amdgpu_bo_list_destroy(bo_list);
        igt_assert_eq(r, 0);
@@ -513,7 +526,7 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle d=
evice_handle,
                igt_info("SKIP ... as there's no ring for ip %d\n", ip_type=
);

        version =3D info.hw_ip_version_major;
-       if (version !=3D 9 && version !=3D 10 /*&& version !=3D 11*/) {
+       if (version !=3D 9 && version !=3D 10 && version !=3D 11) {
                igt_info("SKIP ... unsupported gfx version %d\n", version);
                return;
        }
--
2.25.1
