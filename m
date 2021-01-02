Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 629408926F
 for <igt-dev@lists.freedesktop.org>; Sun,  3 Jan 2021 09:25:01 +0000 (UTC)
From: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Date: Sun,  3 Jan 2021 03:42:36 +0530
Message-Id: <20210102221236.3391596-1-arundhati.hagaragi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_cursor:added subtest
 description
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
Cc: B@freedesktop.org, Gupta@freedesktop.org, nidhi1.gupta@intel.com, S@freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Added description for all subtests

Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Cc: Gupta, Nidhi1 <nidhi1.gupta@intel.com>
Cc: B S, Karthik <Karthik.B.S@intel.com>
---
 tests/kms_plane_cursor.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index f6766d36..bc9d4294 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -320,14 +320,18 @@ igt_main
 		for (i = 0; i < ARRAY_SIZE(cursor_sizes); ++i) {
 			int size = cursor_sizes[i];
 
+			igt_describe("Tests atomic cursor positioning on primary plane and overlay plane");
 			igt_subtest_f("pipe-%s-overlay-size-%d",
 				      kmstest_pipe_name(pipe), size)
 				test_cursor_overlay(&data, size, pipe);
 
+			igt_describe("Tests atomic cursor positioning on primary plane");
 			igt_subtest_f("pipe-%s-primary-size-%d",
 				      kmstest_pipe_name(pipe), size)
 				test_cursor_primary(&data, size, pipe);
 
+			igt_describe("Tests atomic cursor positioning on primary plane and overlay plane"
+				"with buffer larger than viewport used for display");
 			igt_subtest_f("pipe-%s-viewport-size-%d",
 				      kmstest_pipe_name(pipe), size)
 				test_cursor_viewport(&data, size, pipe);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
