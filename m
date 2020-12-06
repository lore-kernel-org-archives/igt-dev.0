Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311686E0DA
 for <igt-dev@lists.freedesktop.org>; Sun,  6 Dec 2020 12:01:50 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Sun,  6 Dec 2020 17:34:22 +0530
Message-Id: <20201206120422.263484-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_fd_exhaustion: Add test description
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

Add description for the test

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 tests/i915/gem_fd_exhaustion.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/i915/gem_fd_exhaustion.c b/tests/i915/gem_fd_exhaustion.c
index 23602b98..8d6c1579 100644
--- a/tests/i915/gem_fd_exhaustion.c
+++ b/tests/i915/gem_fd_exhaustion.c
@@ -33,6 +33,8 @@
 #include <fcntl.h>
 #include <limits.h>
 
+IGT_TEST_DESCRIPTION("Tests the fd exhaustion limit");
+
 igt_simple_main
 {
 	int fd;
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
