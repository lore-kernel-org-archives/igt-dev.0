Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2086.outbound.protection.outlook.com [40.107.95.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48E110E2FE
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Apr 2022 00:36:55 +0000 (UTC)
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 14 Apr 2022 18:33:28 -0600
Message-ID: <20220415003328.514267-2-alex.hung@amd.com>
In-Reply-To: <20220415003328.514267-1-alex.hung@amd.com>
References: <20220415003328.514267-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 2/2] tests/kms_panel_fitting: Skip atomic-fastset
 for non-i915
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

In kernel function drm_atomic_check_only checks allow_modeset,
and it can return -EINVAL (-22) for non-i915 devices.

Therefore, let's skip atomic-fastset subtest for non-i915 until
specific implementation is added for each gpu driver.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_panel_fitting.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
index 7ed0d196..9f607376 100644
--- a/tests/kms_panel_fitting.c
+++ b/tests/kms_panel_fitting.c
@@ -242,6 +242,7 @@ static void test_atomic_fastset(data_t *data)
 	int valid_tests = 0;
 	struct stat sb;
 
+	igt_require_f(is_i915_device(display->drm_fd), "not valid for non-i915 devices\n");
 
 	if (is_i915_device(display->drm_fd)) {
 		/* Until this is force enabled, force modeset evasion. */
-- 
2.35.1
