Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E93210E5C5
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Oct 2023 08:48:50 +0000 (UTC)
From: Lee Shawn C <shawn.c.lee@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 11 Oct 2023 16:42:22 +0800
Message-Id: <20231011084222.226352-1-shawn.c.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] tests: read engine name again before restore
 timeout value
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lee Shawn C <shawn.c.lee@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

We encounter a unexpected error on chrome book device while
running this test. The tool will restore GPU engine's timeout
value but open incorrect file name (XR24 in below). This is
a workaround patch to avoid this problem before we got the
root cause.

openat(AT_FDCWD, "/sys/dev/char/226:0", O_RDONLY) = 12
openat(12, "dev", O_RDONLY)             = 13
read(13, "226:0\n", 1023)               = 6
close(13)                               = 0
openat(12, "engine", O_RDONLY)          = 13
close(12)                               = 0
openat(13, "XR24", O_RDONLY)            = -1 ENOENT (No such file or directory)

Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
Issue: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/147
---
 tests/intel/kms_busy.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_busy.c b/tests/intel/kms_busy.c
index 5b620658fb18..119e6f1652ce 100644
--- a/tests/intel/kms_busy.c
+++ b/tests/intel/kms_busy.c
@@ -414,9 +414,15 @@ static void gpu_engines_init_timeouts(int fd, int max_engines,
 	}
 }
 
-static void gpu_engines_restore_timeouts(int fd, int num_engines, const struct gem_engine_properties *props)
+static void gpu_engines_restore_timeouts(int fd, int num_engines, struct gem_engine_properties *props)
 {
-	int i;
+	const struct intel_execution_engine2 *e;
+	int i = 0;
+
+	for_each_physical_engine(fd, e) {
+		props[i].engine = e;
+		i++;
+	}
 
 	for (i = 0; i < num_engines; i++)
 		gem_engine_properties_restore(fd, &props[i]);
-- 
2.34.1
