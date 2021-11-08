Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C3AA6E11A
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Nov 2021 13:57:54 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Date: Mon,  8 Nov 2021 13:47:46 +0000
Message-Id: <20211108134746.595247-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/device_reset: remove artificial
 timeout
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: lucas.demarchi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Do not use artificial timeout. Let the test fail or finish.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/device_reset.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tests/device_reset.c b/tests/device_reset.c
index 982ba5ef2a..e60d4c7fde 100644
--- a/tests/device_reset.c
+++ b/tests/device_reset.c
@@ -301,8 +301,6 @@ igt_main
 		set_device_filter(dev_path);
 
 		igt_skip_on(!is_sysfs_reset_supported(dev.fds.dev));
-
-		igt_set_timeout(60, "device reset tests timed out after 60s");
 	}
 
 	igt_describe("Unbinds driver from device, initiates reset"
@@ -319,7 +317,6 @@ igt_main
 	}
 
 	igt_fixture {
-		igt_reset_timeout();
 		cleanup_device_fds(&dev);
 	}
 }
-- 
2.30.2
