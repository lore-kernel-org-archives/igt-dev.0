Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Date: Fri, 24 Mar 2023 17:34:42 -0700
Message-Id: <20230325003442.1767568-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/xe_guc_pc: Restore max freq first
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

When min/max are both at RPn, restoring min back to 300
will not work. Max needs to be increased first. Also, add
igt_assert() here, which would have caught the issue.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 tests/xe/xe_guc_pc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/xe/xe_guc_pc.c b/tests/xe/xe_guc_pc.c
index 60c93288..43bf6f48 100644
--- a/tests/xe/xe_guc_pc.c
+++ b/tests/xe/xe_guc_pc.c
@@ -489,8 +489,8 @@ igt_main
 
 	igt_fixture {
 		xe_for_each_gt(fd, gt) {
-			set_freq(sysfs, gt, "min", stash_min);
-			set_freq(sysfs, gt, "max", stash_max);
+			igt_assert(set_freq(sysfs, gt, "max", stash_max) > 0);
+			igt_assert(set_freq(sysfs, gt, "min", stash_min) > 0);
 		}
 		close(sysfs);
 		xe_device_put(fd);
-- 
2.38.1
