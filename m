Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3006E0E1
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2020 05:01:41 +0000 (UTC)
From: sai.gowtham.ch@intel.com
Date: Thu, 12 Nov 2020 10:30:44 +0530
Message-Id: <20201112050044.28416-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_tiled_pread_basic: Add test
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
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, sai.gowtham.ch@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: sai gowtham <sai.gowtham.ch@intel.com>

Add more test description to the test.

Cc: Melkaveri Arjun <arjun.melkaveri@intel.com>
Signed-off-by: sai gowtham <sai.gowtham.ch@intel.com>
---
 tests/i915/gem_tiled_pread_basic.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_tiled_pread_basic.c b/tests/i915/gem_tiled_pread_basic.c
index 7cb64410..6b16feb5 100644
--- a/tests/i915/gem_tiled_pread_basic.c
+++ b/tests/i915/gem_tiled_pread_basic.c
@@ -49,7 +49,9 @@
 
 
 IGT_TEST_DESCRIPTION("Test pread behavior on tiled objects with respect to the"
-		     " reported swizzling value.");
+		     " reported swizzling value. The goal is to exercise the"
+		     " slow_bit17_copy path for reading on bit17 machines,"
+		     " but will also be useful for catching swizzling value bugs on");
 
 #define WIDTH 512
 #define HEIGHT 512
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
