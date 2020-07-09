Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687886E3C4
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2020 01:24:32 +0000 (UTC)
From: ranjeet1.kumar@intel.com
Date: Thu,  9 Jul 2020 06:53:26 +0530
Message-Id: <20200709012326.17928-1-ranjeet1.kumar@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] [PATCH i-g-t]i915/gem_pipe_control_store_loop:
 added description for test case
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
To: igt-dev@lists.freedesktop.org, ranjeet1.kumar@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: ranjeet kumar <ranjeet1.kumar@intel.com>

Added test description for subtest.

Cc: Melkaveri, Arjun <Arjun.Melkaveri@intel.com>
Signed-off-by: ranjeet kumar <ranjeet1.kumar@intel.com>
---
 tests/i915/gem_pipe_control_store_loop.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/i915/gem_pipe_control_store_loop.c b/tests/i915/gem_pipe_control_store_loop.c
index 863a4871..f3057666 100644
--- a/tests/i915/gem_pipe_control_store_loop.c
+++ b/tests/i915/gem_pipe_control_store_loop.c
@@ -183,9 +183,13 @@ igt_main
 		igt_assert(batch);
 	}
 
+	igt_describe("checks tlb consistency of the pipe_control target so creates new buffer"
+		     " each time, emit commands and send it to ring for execution and target"
+		     " buffer won't get reused.");
 	igt_subtest("fresh-buffer")
 		store_pipe_control_loop(false, 2);
 
+	igt_describe("Emit commands in reused buffer and send it to ring for execution.");
 	igt_subtest("reused-buffer")
 		store_pipe_control_loop(true, 2);
 
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
