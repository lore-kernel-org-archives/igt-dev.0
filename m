Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 589A46E9CE
 for <igt-dev@lists.freedesktop.org>; Mon,  3 May 2021 16:53:29 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Tue,  4 May 2021 06:13:03 +0530
Message-Id: <20210504004313.28804-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20210504004313.28804-1-bhanuprakash.modem@intel.com>
References: <20210504004313.28804-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [v4 i-g-t 04/14] tests/debugfs_test: Fix mode selection
 for MST
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

When two monitors connected through MST, the second monitor also
tries to use the same mode. So two such modes may not fit into the
link bandwidth.

This patch will find a combination of modes that fit into the BW.

Cc: Imre Deak <imre.deak@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/debugfs_test.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/debugfs_test.c b/tests/debugfs_test.c
index 46ba0a8be..83875fbce 100644
--- a/tests/debugfs_test.c
+++ b/tests/debugfs_test.c
@@ -104,6 +104,7 @@ static void kms_tests(int fd, int debugfs)
 
 	igt_subtest("read_all_entries_display_on") {
 		/* try to light all pipes */
+retry:
 		for_each_pipe(&display, pipe) {
 			igt_output_t *output;
 
@@ -128,6 +129,15 @@ static void kms_tests(int fd, int debugfs)
 			}
 		}
 
+		if (igt_display_try_commit_atomic(&display,
+					DRM_MODE_ATOMIC_TEST_ONLY |
+					DRM_MODE_ATOMIC_ALLOW_MODESET,
+					NULL) != 0) {
+			bool found = igt_override_all_active_output_modes_to_fit_link_bw(&display);
+			igt_require_f(found, "No valid mode combo found.\n");
+			goto retry;
+		}
+
 		igt_display_commit2(&display, display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
 		read_and_discard_sysfs_entries(debugfs, 0);
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
