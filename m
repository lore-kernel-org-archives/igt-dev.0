Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2084.outbound.protection.outlook.com [40.107.95.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5FD310E192
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Sep 2023 01:37:03 +0000 (UTC)
From: Jesse Zhang <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 22 Sep 2023 09:36:41 +0800
Message-ID: <20230922013641.3413262-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH] tests/amdgpu: add stable pstate tet
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
 include/drm-uapi/amdgpu_drm.h | 10 +++++++++
 tests/amdgpu/amd_basic.c      | 38 +++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
index 0cbd1540a..f921cd021 100644
--- a/include/drm-uapi/amdgpu_drm.h
+++ b/include/drm-uapi/amdgpu_drm.h
@@ -206,6 +206,8 @@ union drm_amdgpu_bo_list {
 #define AMDGPU_CTX_OP_FREE_CTX	2
 #define AMDGPU_CTX_OP_QUERY_STATE	3
 #define AMDGPU_CTX_OP_QUERY_STATE2	4
+#define AMDGPU_CTX_OP_GET_STABLE_PSTATE	5
+#define AMDGPU_CTX_OP_SET_STABLE_PSTATE	6
 
 /* GPU reset status */
 #define AMDGPU_CTX_NO_RESET		0
@@ -238,6 +240,14 @@ union drm_amdgpu_bo_list {
 #define AMDGPU_CTX_PRIORITY_HIGH        512
 #define AMDGPU_CTX_PRIORITY_VERY_HIGH   1023
 
+/* select a stable profiling pstate for perfmon tools */
+#define AMDGPU_CTX_STABLE_PSTATE_FLAGS_MASK  0xf
+#define AMDGPU_CTX_STABLE_PSTATE_NONE  0
+#define AMDGPU_CTX_STABLE_PSTATE_STANDARD  1
+#define AMDGPU_CTX_STABLE_PSTATE_MIN_SCLK  2
+#define AMDGPU_CTX_STABLE_PSTATE_MIN_MCLK  3
+#define AMDGPU_CTX_STABLE_PSTATE_PEAK  4
+
 struct drm_amdgpu_ctx_in {
 	/** AMDGPU_CTX_OP_* */
 	__u32	op;
diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 24c70a9f7..b276c2107 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -612,6 +612,36 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle)
 	free_cmd_base(base);
 }
 
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
 static void
 amdgpu_gfx_dispatch_test_gfx(amdgpu_device_handle device_handle)
 {
@@ -739,6 +769,14 @@ igt_main
 		}
 	}
 
+	igt_describe("Check-pstate-for-gfx-power-and-clock");
+	igt_subtest_with_dynamic("stable-pstate-test-with-IP-SMU") {
+		if (arr_cap[AMD_IP_GFX]) {
+			igt_dynamic_f("stable-pstate-test")
+			amdgpu_stable_pstate_test(device);
+		}
+	}
+
 	igt_fixture {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
-- 
2.25.1
