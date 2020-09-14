Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27ED56E0C1
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Sep 2020 04:57:26 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Mon, 14 Sep 2020 10:27:07 +0530
Message-Id: <20200914045707.23803-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_flink_race: Added test description
 for testcase
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
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Added test description to all the available subtests.

Cc: Melkaveri, Arjun <Arjun.Melkaveri@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/i915/gem_flink_race.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/i915/gem_flink_race.c b/tests/i915/gem_flink_race.c
index c1f5d5d5..82c3c737 100644
--- a/tests/i915/gem_flink_race.c
+++ b/tests/i915/gem_flink_race.c
@@ -197,9 +197,13 @@ static void test_flink_close(void)
 
 igt_main
 {
+	igt_describe("The gem flink open ioctl will have a little race with gem close"
+		     " and tests if the flink name and corresponding reference is getting leaked.");
 	igt_subtest("flink_name")
 		test_flink_name(5);
 
+	igt_describe("The gem flink ioctl will have a little race against "
+		     "gem close ioctl on a handle and checks the number of leaked objects.");
 	igt_subtest("flink_close")
 		test_flink_close();
 }
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
