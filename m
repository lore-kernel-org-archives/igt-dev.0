Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB16C6E045
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jun 2020 23:24:27 +0000 (UTC)
From: ranjeet1.kumar@intel.com
Date: Wed,  1 Jul 2020 04:53:37 +0530
Message-Id: <20200630232337.20135-1-ranjeet1.kumar@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] [PATCH i-g-t] i915/gem_pipe_control_store_loop:
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

From: Ranjeet kumar <ranjeet1.kumar@intel.com>

Added test description for subtest.

Cc: Melkaveri, Arjun <Arjun.Melkaveri@intel.com>
Signed-off-by: Ranjeet kumar <ranjeet1.kumar@intel.com>
---
 tests/i915/gem_pipe_control_store_loop.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/i915/gem_pipe_control_store_loop.c b/tests/i915/gem_pipe_control_store_loop.c
index e44e9fb53..a9ff66895 100644
--- a/tests/i915/gem_pipe_control_store_loop.c
+++ b/tests/i915/gem_pipe_control_store_loop.c
@@ -181,9 +181,12 @@ igt_main
 		igt_assert(batch);
 	}
 
+	igt_describe("Creates new buffer each time, emit commands and send it to ring"
+		     " for execution.")
 	igt_subtest("fresh-buffer")
 		store_pipe_control_loop(false, 2);
 
+	igt_describe("Emit commands in reused buffer and send it to ring for execution.")
 	igt_subtest("reused-buffer")
 		store_pipe_control_loop(true, 2);
 
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
