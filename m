Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F01410E42A
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jan 2024 13:16:28 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t V2] tests/intel/i915_suspend: Fix WARN of invalid fd
Date: Tue,  9 Jan 2024 18:40:46 +0530
Message-Id: <20240109131046.2616465-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240109102703.2529736-1-bhanuprakash.modem@intel.com>
References: <20240109102703.2529736-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Skip if fd < 0, else drm_close_driver() will throw WARN:

(i915_suspend:7563) drmtest-WARNING: Don't attempt to close standard/invalid file descriptor: -1

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel/i915_suspend.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/i915_suspend.c b/tests/intel/i915_suspend.c
index c25805584..0d216741d 100644
--- a/tests/intel/i915_suspend.c
+++ b/tests/intel/i915_suspend.c
@@ -287,6 +287,7 @@ test_suspend_without_i915(int state)
 	int fd;
 
 	fd = __drm_open_driver(DRIVER_INTEL);
+	igt_skip_on_f(fd < 0, "No known gpu found.\n");
 	igt_devices_scan(false);
 
 	/*
-- 
2.40.0
