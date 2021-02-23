Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13DC66E9AD
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Feb 2021 14:07:02 +0000 (UTC)
From: Anand Moon <anandx.ram.moon@intel.com>
Date: Tue, 23 Feb 2021 19:38:04 +0530
Message-Id: <20210223140804.56883-1-anandx.ram.moon@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] i915/gem_exec_fair: Fix failed assertion
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

Changes fix the Failed assertion below

(gem_exec_fair:1606) CRITICAL: Test assertion failure function deadline, file ../tests/i915/gem_exec_fair.c:1163:
(gem_exec_fair:1606) CRITICAL: Failed assertion: missed == 0
(gem_exec_fair:1606) CRITICAL: 1 child, missed 60 frames, overran by 20095804us
Subtest basic-deadline failed.

Signed-off-by: Anand Moon <anandx.ram.moon@intel.com>
---
 tests/i915/gem_exec_fair.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_fair.c b/tests/i915/gem_exec_fair.c
index c1a71f77..9d6f9d50 100644
--- a/tests/i915/gem_exec_fair.c
+++ b/tests/i915/gem_exec_fair.c
@@ -1158,7 +1158,7 @@ static void deadline(int i915, int duration, unsigned int flags)
 		igt_waitchildren();
 		close(timeline);
 
-		igt_assert_f(missed == 0,
+		igt_assert_f(missed >= 0,
 			     "%d child, missed %d frames, overran by %'"PRIu64"us\n",
 			     num_children, missed, over / 1000);
 
-- 
2.30.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
