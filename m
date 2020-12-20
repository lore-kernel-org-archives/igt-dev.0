Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 100D66E11F
 for <igt-dev@lists.freedesktop.org>; Sun, 20 Dec 2020 08:08:44 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Sun, 20 Dec 2020 13:41:08 +0530
Message-Id: <20201220081108.331051-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_exec_async: Add subtest description
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

Add description for subtest

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 tests/i915/gem_exec_async.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/i915/gem_exec_async.c b/tests/i915/gem_exec_async.c
index 9f2c80f0..c28a8320 100644
--- a/tests/i915/gem_exec_async.c
+++ b/tests/i915/gem_exec_async.c
@@ -144,6 +144,8 @@ igt_main
 		igt_fork_hang_detector(fd);
 	}
 
+	igt_describe("For each engine, verify that writing into the same bo "
+	       "concurrently with other engines works fine");
 	test_each_engine("concurrent-writes", fd, e)
 		one(fd, e->flags);
 
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
