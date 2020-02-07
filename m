Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F27E76E86D
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2020 05:26:52 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Thu,  6 Feb 2020 21:26:52 -0800
Message-Id: <7278cd464aa928fdefb9b4b89df73d3c52fefc42.1581053156.git.ashutosh.dixit@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] kms_fence_pin_leak: check for availabile
 fences
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Need fences to leak fences.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/kms_fence_pin_leak.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_fence_pin_leak.c b/tests/kms_fence_pin_leak.c
index 8c9e10a56..1ac65e8a1 100644
--- a/tests/kms_fence_pin_leak.c
+++ b/tests/kms_fence_pin_leak.c
@@ -200,6 +200,7 @@ igt_simple_main
 
 	data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
 	igt_require_gem(data.drm_fd);
+	igt_require(gem_available_fences(data.drm_fd) > 0);
 
 	data.devid = intel_get_drm_devid(data.drm_fd);
 
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
