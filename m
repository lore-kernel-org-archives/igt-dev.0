Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95A310E416
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Sep 2023 05:53:21 +0000 (UTC)
From: Jesse Zhang <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 22 Sep 2023 13:52:42 +0800
Message-ID: <20230922055242.3422999-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH] tests/amdgpu: add stable pstate test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tim Huang <tim.huang@amd.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Christian
 Koenig <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
Signed-off-by: Tim Huang <tim.huang@amd.com>
---
 tests/amdgpu/amd_basic.c | 43 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 24c70a9f7..f23a13343 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -612,6 +612,39 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle)
 	free_cmd_base(base);
 }
 
+#ifdef AMDGPU_CTX_OP_GET_STABLE_PSTATE
+static void
+amdgpu_stable_pstate_test(amdgpu_device_handle device_handle)
+{
+	int r;
+	amdgpu_context_handle context_handle;
+	uint32_t current_pstate = 0, new_pstate = 0;
+
+	r = amdgpu_cs_ctx_create(device_handle, &context_handle);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_cs_ctx_stable_pstate(context_handle,
+					AMDGPU_CTX_OP_GET_STABLE_PSTATE,
+					0, &current_pstate);
+	igt_assert_eq(r, 0);
+	igt_assert_eq(new_pstate, AMDGPU_CTX_STABLE_PSTATE_NONE);
+	r = amdgpu_cs_ctx_stable_pstate(context_handle,
+					AMDGPU_CTX_OP_SET_STABLE_PSTATE,
+					AMDGPU_CTX_STABLE_PSTATE_PEAK, NULL);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_cs_ctx_stable_pstate(context_handle,
+					AMDGPU_CTX_OP_GET_STABLE_PSTATE,
+					0, &new_pstate);
+	igt_assert_eq(r, 0);
+	igt_assert_eq(new_pstate, AMDGPU_CTX_STABLE_PSTATE_PEAK);
+
+	r = amdgpu_cs_ctx_free(context_handle);
+	igt_assert_eq(r, 0);
+
+}
+#endif
+
 static void
 amdgpu_gfx_dispatch_test_gfx(amdgpu_device_handle device_handle)
 {
@@ -739,6 +772,16 @@ igt_main
 		}
 	}
 
+#ifdef AMDGPU_CTX_OP_GET_STABLE_PSTATE
+	igt_describe("Check-pstate-for-gfx-power-and-clock");
+	igt_subtest_with_dynamic("stable-pstate-test-with-IP-SMU") {
+		if (arr_cap[AMD_IP_GFX]) {
+			igt_dynamic_f("stable-pstate-test")
+			amdgpu_stable_pstate_test(device);
+		}
+	}
+#endif
+
 	igt_fixture {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
-- 
2.25.1
