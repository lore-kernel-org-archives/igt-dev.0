Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A976E071
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Oct 2020 04:15:33 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Tue,  6 Oct 2020 09:33:41 +0530
Message-Id: <20201006040341.23170-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/vgem_slow: Added test description for
 test case
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

Added test description to the available subtest.

Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/vgem_slow.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/vgem_slow.c b/tests/vgem_slow.c
index 58b09e42..7f5e0af2 100644
--- a/tests/vgem_slow.c
+++ b/tests/vgem_slow.c
@@ -80,7 +80,8 @@ igt_main
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_VGEM);
 	}
-
+	igt_describe("Test tries to check if fence is signalled automatically after"
+		     " certain time in order to avoid driver hangs.");
 	igt_subtest_f("nohang")
 		test_nohang(fd);
 
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
