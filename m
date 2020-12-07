Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 834826E829
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Dec 2020 13:25:57 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Mon,  7 Dec 2020 18:58:30 +0530
Message-Id: <20201207132830.269253-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_read_read_speed: Add subtests
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
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

Add description for all subtests

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 tests/i915/gem_read_read_speed.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/i915/gem_read_read_speed.c b/tests/i915/gem_read_read_speed.c
index 7c5c90f7..5f68bec1 100644
--- a/tests/i915/gem_read_read_speed.c
+++ b/tests/i915/gem_read_read_speed.c
@@ -202,12 +202,23 @@ igt_main
 	}
 
 	for (i = 0; sizes[i] != 0; i++) {
+		igt_describe_f("Check the performance when blitter and render engine read from a same "
+		       "%dx%d sized bo concurrently", sizes[i], sizes[i]);
 		igt_subtest_f("read-read-%dx%d", sizes[i], sizes[i])
 			run(bops, sizes[i], sizes[i], false, false);
+
+		igt_describe_f("Check the performance when blitter engine reads from while render engine "
+		       "writes into a same %dx%d sized bo concurrently", sizes[i], sizes[i]);
 		igt_subtest_f("read-write-%dx%d", sizes[i], sizes[i])
 			run(bops, sizes[i], sizes[i], false, true);
+
+		igt_describe_f("Check the performance when blitter engine writes into while render engine "
+		       "reads from a same %dx%d sized bo concurrently", sizes[i], sizes[i]);
 		igt_subtest_f("write-read-%dx%d", sizes[i], sizes[i])
 			run(bops, sizes[i], sizes[i], true, false);
+
+		igt_describe_f("Check the performance when blitter and render engine write into a same "
+		       "%dx%d sized bo concurrently", sizes[i], sizes[i]);
 		igt_subtest_f("write-write-%dx%d", sizes[i], sizes[i])
 			run(bops, sizes[i], sizes[i], true, true);
 	}
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
