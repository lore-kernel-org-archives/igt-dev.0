Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4CD26E441
 for <igt-dev@lists.freedesktop.org>; Wed,  5 May 2021 08:38:51 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed,  5 May 2021 11:39:58 +0300
Message-Id: <20210505083958.25105-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] prime_udl: Add test description
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Add a test description line, and remove the misleading comment
entirely. The comment has been copied from prime_nv_test.c and
mistakenly says the test is using nouveau.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
---

The test is also out of date in various ways and should probably
rather be removed in favor of more general prime tests...


 tests/prime_udl.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/tests/prime_udl.c b/tests/prime_udl.c
index 9b600659..582e31f5 100644
--- a/tests/prime_udl.c
+++ b/tests/prime_udl.c
@@ -1,19 +1,3 @@
-/* basic set of prime tests between intel and nouveau */
-
-/* test list - 
-   1. share buffer from intel -> nouveau.
-   2. share buffer from nouveau -> intel
-   3. share intel->nouveau, map on both, write intel, read nouveau
-   4. share intel->nouveau, blit intel fill, readback on nouveau
-   test 1 + map buffer, read/write, map other size.
-   do some hw actions on the buffer
-   some illegal operations -
-       close prime fd try and map
-
-   TODO add some nouveau rendering tests
-*/
-
-   
 #include "igt.h"
 #include <stdio.h>
 #include <stdlib.h>
@@ -29,6 +13,8 @@
 
 #include "intel_bufmgr.h"
 
+IGT_TEST_DESCRIPTION("Basic set of prime tests between Intel and DisplayLink");
+
 int intel_fd = -1, udl_fd = -1;
 drm_intel_bufmgr *bufmgr;
 uint32_t devid;
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
