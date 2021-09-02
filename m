Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F6A6E5BB
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Sep 2021 15:25:05 +0000 (UTC)
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Thu,  2 Sep 2021 20:43:34 +0530
Message-Id: <20210902151334.15818-1-vidya.srinivas@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] tests/kms_psr2_sf: Skip tests if selected fetch
 is not available
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
Cc: Vidya Srinivas <vidya.srinivas@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Currently the tests are failing on systems where selected
fetch feature is not availble. Kernel returns -EINVAL when
the test executes reporting "Invalid debug mask 4".
Patch skips if selected fetch feature is not available
in the kernel.

Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
Change-Id: I031b4f58866a45f98b1c7e6c5181f8731f5ba4b2
---
 lib/igt_psr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 68240f9a33b4..6f9fb8eea0ed 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -167,6 +167,8 @@ static bool psr_set(int device, int debugfs_fd, int mode)
 		}
 
 		ret = psr_write(debugfs_fd, debug_val);
+		if (ret == -EINVAL)
+			igt_skip("PSR2 SF not available\n");
 		igt_assert(ret > 0);
 	}
 
-- 
2.26.2
