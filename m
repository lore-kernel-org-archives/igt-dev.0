Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A01EC11AC73
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jun 2022 04:28:34 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 10 Jun 2022 10:01:31 +0530
Message-Id: <20220610043131.3452-3-nidhi1.gupta@intel.com>
In-Reply-To: <20220610043131.3452-1-nidhi1.gupta@intel.com>
References: <20220610043131.3452-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 2/2] tests/i915/kms_draw_crc: Test Cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Sanitize the system state before starting the subtest.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/i915/kms_draw_crc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
index 3e68479e..1c87e523 100644
--- a/tests/i915/kms_draw_crc.c
+++ b/tests/i915/kms_draw_crc.c
@@ -265,6 +265,7 @@ static void setup_environment(void)
 	drm_fd = drm_open_driver_master(DRIVER_INTEL);
 	igt_require(drm_fd >= 0);
 
+	igt_display_reset(display);
 	drm_res = drmModeGetResources(drm_fd);
 	igt_require(drm_res);
 	igt_assert(drm_res->count_connectors <= MAX_CONNECTORS);
-- 
2.26.2
