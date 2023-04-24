Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E30CC10E500
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Apr 2023 13:31:00 +0000 (UTC)
From: Hersen Wu <hersenxs.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>, <rodrigo.siqueira@amd.com>,
 <aurabindo.pillai@amd.com>, <alex.hung@amd.com>, <hamza.mahfooz@amd.com>
Date: Mon, 24 Apr 2023 09:30:54 -0400
Message-ID: <20230424133054.59629-1-hersenxs.wu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH] [i-g-t] tests/amdgpu/amd_mem_leak: add delay
 after igt_system_suspend_autoresume
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Hersen Wu <hersenxs.wu@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

at call back of igt_system_suspend_autoresume, linux kernel resume
finish and in d0 state. but user mode components may not be fully
out of sleep mode. add delay wait for system stable before checking
memory leak.

Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
---
 tests/amdgpu/amd_mem_leak.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/amdgpu/amd_mem_leak.c b/tests/amdgpu/amd_mem_leak.c
index dee563cb..7d920c11 100644
--- a/tests/amdgpu/amd_mem_leak.c
+++ b/tests/amdgpu/amd_mem_leak.c
@@ -173,6 +173,7 @@ static void test_suspend_resume(data_t *data)
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
 	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+	sleep(30);
 
 	igt_assert_f(check_memleak(data), "memory leak detected\n");
 
-- 
2.25.1
