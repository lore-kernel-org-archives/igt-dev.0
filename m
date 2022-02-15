Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D07891BB
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Feb 2022 05:12:39 +0000 (UTC)
From: sai.gowtham.ch@intel.com
Date: Tue, 15 Feb 2022 10:42:36 +0530
Message-Id: <20220215051236.21202-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_linear_blits: Added
 description to the subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Ch Sai Gowtham <sai.gowtham.ch@intel.com>

Added description to subtests.

Cc: Melkaveri Arjun <arjun.melkaveri@intel.com>
Signed-off-by: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
---
 tests/i915/gem_linear_blits.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/i915/gem_linear_blits.c b/tests/i915/gem_linear_blits.c
index 6504c9f2..b570aa76 100644
--- a/tests/i915/gem_linear_blits.c
+++ b/tests/i915/gem_linear_blits.c
@@ -258,9 +258,13 @@ igt_main
 		count = (count + ncpus - 1) / ncpus;
 	}
 
+	igt_describe("Excercise 2 buffer objects check if driver will"
+			"rearrange the buffers");
 	igt_subtest("basic")
 		run_test(fd, 2, do_relocs);
 
+	igt_describe("The intent is to push beyond the GTT size to force the driver"
+			"to have to rearrange the buffers");
 	igt_subtest("normal") {
 		intel_allocator_multiprocess_start();
 		igt_fork(child, ncpus)
@@ -269,6 +273,8 @@ igt_main
 		intel_allocator_multiprocess_stop();
 	}
 
+	igt_describe("Pushes beyond the GTT size checks if driver will rearrange the"
+			"buffers, with interrupts in between the parent process");
 	igt_subtest("interruptible") {
 		intel_allocator_multiprocess_start();
 		igt_fork_signal_helper();
-- 
2.35.0
