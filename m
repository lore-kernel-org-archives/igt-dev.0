Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE70895B5
 for <igt-dev@lists.freedesktop.org>; Sat, 26 Dec 2020 12:41:03 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Sat, 26 Dec 2020 18:13:20 +0530
Message-Id: <20201226124320.363750-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_render_copy_redux: Add subtests
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
To: igt-dev@lists.freedesktop.org, katarzyna.dec@intel.com, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

Add description for subtests

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
Cc: Dec, Katarzyna <katarzyna.dec@intel.com>
---
 tests/i915/gem_render_copy_redux.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/i915/gem_render_copy_redux.c b/tests/i915/gem_render_copy_redux.c
index 8e633567..d30ff82b 100644
--- a/tests/i915/gem_render_copy_redux.c
+++ b/tests/i915/gem_render_copy_redux.c
@@ -203,12 +203,15 @@ igt_main
 		igt_require_gem(data.fd);
 	}
 
+	igt_describe("Test render_copy() from one bo to another");
 	igt_subtest("normal") {
 		int loop = 100;
 		while (loop--)
 			copy(&data);
 	}
 
+	igt_describe("Test render_copy() from one bo to another in an "
+	       "iterrupting environment");
 	igt_subtest("interruptible") {
 		int loop = 100;
 		igt_fork_signal_helper();
@@ -217,12 +220,15 @@ igt_main
 		igt_stop_signal_helper();
 	}
 
+	igt_describe("Test render_copy() from a flinked bo to a normal bo");
 	igt_subtest("flink") {
 		int loop = 100;
 		while (loop--)
 			copy_flink(&data);
 	}
 
+	igt_describe("Test render_copy() from a flinked bo to a normal bo "
+	       "in an iterrupting environment");
 	igt_subtest("flink-interruptible") {
 		int loop = 100;
 		igt_fork_signal_helper();
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
