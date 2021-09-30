Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB5A6E432
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Sep 2021 15:35:20 +0000 (UTC)
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Thu, 30 Sep 2021 20:52:53 +0530
Message-Id: <20210930152253.32192-1-vidya.srinivas@intel.com>
In-Reply-To: <20210916135955.17270-1-vidya.srinivas@intel.com>
References: <20210916135955.17270-1-vidya.srinivas@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_psr2_sf: Skip tests if selected
 fetch is not available
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
Cc: Bhanuprakash.Modem@intel.com, markyacoub@google.com, jeevan.b@intel.com, Vidya Srinivas <vidya.srinivas@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Currently the tests are failing on systems where selected
fetch feature is not availble. Kernel returns -EINVAL when
the test executes reporting "Invalid debug mask 4".
Patch skips if selected fetch feature is not available
in the kernel.

v2: Incorportated Mark Yacoub's comments.
Changed igt_skip to igt_require_f

v3: Changing to igt_require(ret > 0) which is equivalent to
original igt_assert(ret > 0)

Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 lib/igt_psr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 68240f9a33b4..857eb591c693 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -167,7 +167,7 @@ static bool psr_set(int device, int debugfs_fd, int mode)
 		}
 
 		ret = psr_write(debugfs_fd, debug_val);
-		igt_assert(ret > 0);
+		igt_require_f(ret > 0, "PSR2 SF feature not available\n");
 	}
 
 	/* Restore original value on exit */
-- 
2.33.0
