Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Date: Thu,  9 Mar 2023 11:48:41 -0800
Message-Id: <20230309194841.241213-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] gem_ctx_freq: Remove reference to
 non-existent sysfs entry
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

The entry for gt_idle_freq_mhz does not exist.

Fixes: d1ea62b3f759 (igt: Add gem_ctx_freq to exercise requesting freq via sysfs)

Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 tests/i915/gem_ctx_freq.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tests/i915/gem_ctx_freq.c b/tests/i915/gem_ctx_freq.c
index a29fe68b..18e736c7 100644
--- a/tests/i915/gem_ctx_freq.c
+++ b/tests/i915/gem_ctx_freq.c
@@ -174,10 +174,8 @@ static void restore_sysfs_freq(int sig)
 {
 	char buf[256];
 
-	if (igt_sysfs_read(sysfs, "gt_RPn_freq_mhz", buf, sizeof(buf)) > 0) {
-		igt_sysfs_set(sysfs, "gt_idle_freq_mhz", buf);
+	if (igt_sysfs_read(sysfs, "gt_RPn_freq_mhz", buf, sizeof(buf)) > 0)
 		igt_sysfs_set(sysfs, "gt_min_freq_mhz", buf);
-	}
 
 	if (igt_sysfs_read(sysfs, "gt_RP0_freq_mhz", buf, sizeof(buf)) > 0) {
 		igt_sysfs_set(sysfs, "gt_max_freq_mhz", buf);
-- 
2.38.1
