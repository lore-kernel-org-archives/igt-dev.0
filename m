Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F4636E067
 for <igt-dev@lists.freedesktop.org>; Wed, 12 May 2021 09:16:09 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Wed, 12 May 2021 22:35:26 +0530
Message-Id: <20210512170536.4778-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20210512170536.4778-1-bhanuprakash.modem@intel.com>
References: <20210512170536.4778-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [v6 i-g-t 04/14] tests/debugfs_test: Fix mode selection
 for 2x tests
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

This patch will find the connector/mode combination that fits
into the bandwidth when more than one monitor is connected.

Example:
  When two monitors connected through MST, the second monitor
  also tries to use the same mode. So two such modes may not
  fit into the link bandwidth. So, iterate through connected
  outputs & modes and find a combination of modes those fit
  into the link BW.

V2:
* Add support for legacy commit (Ankit)
V3:
* Fix commit message (Ankit)

Cc: Imre Deak <imre.deak@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/debugfs_test.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/debugfs_test.c b/tests/debugfs_test.c
index 46ba0a8be..e50f213ae 100644
--- a/tests/debugfs_test.c
+++ b/tests/debugfs_test.c
@@ -98,12 +98,14 @@ static void kms_tests(int fd, int debugfs)
 	igt_display_t display;
 	struct igt_fb fb[IGT_MAX_PIPES];
 	enum pipe pipe;
+	int ret;
 
 	igt_fixture
 		igt_display_require(&display, fd);
 
 	igt_subtest("read_all_entries_display_on") {
 		/* try to light all pipes */
+retry:
 		for_each_pipe(&display, pipe) {
 			igt_output_t *output;
 
@@ -128,6 +130,25 @@ static void kms_tests(int fd, int debugfs)
 			}
 		}
 
+		if (display.is_atomic)
+			ret = igt_display_try_commit_atomic(&display,
+					DRM_MODE_ATOMIC_TEST_ONLY |
+					DRM_MODE_ATOMIC_ALLOW_MODESET,
+					NULL);
+		else
+			ret = igt_display_try_commit2(&display, COMMIT_LEGACY);
+
+		if (ret) {
+			igt_output_t *output;
+			bool found = igt_override_all_active_output_modes_to_fit_bw(&display);
+			igt_require_f(found, "No valid mode combo found.\n");
+
+			for_each_connected_output(&display, output)
+				igt_output_set_pipe(output, PIPE_NONE);
+
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
