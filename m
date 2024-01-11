Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2069.outbound.protection.outlook.com [40.107.100.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BF0310E07A
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jan 2024 01:13:19 +0000 (UTC)
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] tests/amd_security: fix secure bounce test
Date: Thu, 11 Jan 2024 01:13:16 +0000
Message-ID: <DM4PR12MB5152D50F6889E6C3853517EDE3682@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20240111003156.375379-1-vitaly.prosyak@amd.com>
 <20240111003156.375379-2-vitaly.prosyak@amd.com>
In-Reply-To: <20240111003156.375379-2-vitaly.prosyak@amd.com>
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

[AMD Official Use Only - General]

This patch is good for me.
So it is Reviewed-by: Jesse Zhang <Jesse.Zhang@amd.com>.

Thanks
Jesse

-----Original Message-----
From: vitaly.prosyak@amd.com <vitaly.prosyak@amd.com>
Sent: Thursday, January 11, 2024 8:32 AM
To: igt-dev@lists.freedesktop.org
Cc: Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>; Deucher, Alexander <Alexander.=
Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Kamil Konie=
czny <kamil.konieczny@linux.intel.com>; Prosyak, Vitaly <Vitaly.Prosyak@amd=
.com>
Subject: [PATCH 2/2] tests/amd_security: fix secure bounce test

From: Jesse Zhang <jesse.zhang@amd.com>

When it copy from scr (bo) to destination (bo2), and move bo2 from vram to =
gtt. Then it need to copy from bo2(src) to bo (destination) for verificatio=
n.

v2:
  - The typo was hidden in the fact that the same pattern was used for
    both buffers and even when the second copy did not occur due to an
    incorrect address, the problem did not pop up. To address the issue
    we use the second pattern for the second copy.(Vitaly)

  - Use ASIC-dependent linear copy function vs hardcoded earlier.(Vitaly)

  - Remove obsolete amdgpu_sdma_lcopy.(Vitaly)

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_security.c | 45 ++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 23 deletions(-)

diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c inde=
x d1146a7ce..ec6883d3d 100644
--- a/tests/amdgpu/amd_security.c
+++ b/tests/amdgpu/amd_security.c
@@ -58,22 +58,6 @@ get_handle(struct amdgpu_bo *bo)
        return handle;
 }

-static void
-amdgpu_sdma_lcopy(uint32_t *packet, uint64_t dst, uint64_t src, uint32_t s=
ize,
-                               uint32_t secure)
-{
-       /* Set the packet to Linear copy with TMZ set.
-        */
-       packet[0] =3D htole32(secure << 18 | 1);
-       packet[1] =3D htole32(size-1);
-       packet[2] =3D htole32(0);
-       packet[3] =3D htole32((uint32_t)(src & 0xFFFFFFFFU));
-       packet[4] =3D htole32((uint32_t)(src >> 32));
-       packet[5] =3D htole32((uint32_t)(dst & 0xFFFFFFFFU));
-       packet[6] =3D htole32((uint32_t)(dst >> 32));
-       packet[7] =3D htole32(0);
-}
-
 static void
 amdgpu_sdma_nop(uint32_t *packet, uint32_t nop_count)  { @@ -106,10 +90,10=
 @@ amdgpu_bo_lcopy(amdgpu_device_handle device,
        ring_context->pm4_size =3D PACKET_LCOPY_SIZE;
        ring_context->pm4_dw =3D PACKET_LCOPY_SIZE;
        ring_context->res_cnt =3D 2;
+       ring_context->write_length =3D  size;
        igt_assert(ring_context->pm4);
-
-       amdgpu_sdma_lcopy(ring_context->pm4, ring_context->bo_mc2,
-                       ring_context->bo_mc, size, secure);
+       ip_block->funcs->copy_linear(ip_block->funcs, ring_context,
+                       &ring_context->pm4_dw);
        amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context, 0)=
;
        free(ring_context->pm4);
 }
@@ -163,7 +147,7 @@ amdgpu_bo_move(amdgpu_device_handle device, int fd,
  */
 static const uint8_t secure_pattern[] =3D { 0x5A, 0xFE, 0x05, 0xEC };

-
+static const uint8_t secure_pattern2[] =3D { 0xDE, 0xAD, 0xBE, 0xEF };

 static void
 amdgpu_secure_bounce(amdgpu_device_handle device_handle, int fd, @@ -175,6=
 +159,7 @@ amdgpu_secure_bounce(amdgpu_device_handle device_handle, int fd,
        long page_size;
        uint8_t *pp;
        int r;
+       uint64_t tmp_mc;

        ring_context =3D calloc(1, sizeof(*ring_context));
        igt_assert(ring_context);
@@ -235,6 +220,11 @@ amdgpu_secure_bounce(amdgpu_device_handle device_handl=
e, int fd,
                        break;
                }
        }
+       /* Fill Bob with a pattern2 */
+       for (pp =3D (__typeof__(pp))ring_context->bo2_cpu;
+               pp < (__typeof__(pp)) ring_context->bo2_cpu + SECURE_BUFFER=
_SIZE;
+               pp +=3D sizeof(secure_pattern2))
+               memcpy(pp, secure_pattern2, sizeof(secure_pattern2));

        /* Move Bob to the GTT domain. */
        amdgpu_bo_move(device_handle, fd, ring_context, ip_block, @@ -247,1=
5 +237,24 @@ amdgpu_secure_bounce(amdgpu_device_handle device_handle, int f=
d,
        ring_context->resources[0] =3D ring_context->bo; // Alice
        ring_context->resources[1] =3D ring_context->bo2; // Bob

+       /*
+        * Swap mc addresses between Bob(bo_mc2) and Alice(bo_mc) since we =
copy now
+        * from Bob to Alice and using ASIC dependant implementation sdma_r=
ing_copy_linear
+        * which uses context->bo_mc as source and context->bo_mc2 as desti=
nation
+        */
+       tmp_mc =3D ring_context->bo_mc2;
+       ring_context->bo_mc2 =3D ring_context->bo_mc;
+       ring_context->bo_mc =3D tmp_mc;
+
        /* sDMA TMZ copy from Bob to Alice. */
        amdgpu_bo_lcopy(device_handle, ring_context, ip_block, SECURE_BUFFE=
R_SIZE,
                        secure =3D=3D true ? 1 : 0);

-       /* Verify the contents of Alice */
+       /* Verify the content of Alice if it matches to pattern2*/
        for (pp =3D (__typeof__(pp))ring_context->bo_cpu;
             pp < (__typeof__(pp)) ring_context->bo_cpu + SECURE_BUFFER_SIZ=
E;
-            pp +=3D sizeof(secure_pattern)) {
-               r =3D memcmp(pp, secure_pattern, sizeof(secure_pattern));
+            pp +=3D sizeof(secure_pattern2)) {
+               r =3D memcmp(pp, secure_pattern2, sizeof(secure_pattern2));
                if (r) {
                        // test failure
                        igt_assert(false);
--
2.25.1
