Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB316E03F
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Sep 2021 00:25:51 +0000 (UTC)
From: Mastan Katragadda <mastanx.katragadda@intel.com>
Date: Wed,  1 Sep 2021 05:56:00 +0530
Message-Id: <20210901002600.655869-1-mastanx.katragadda@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] i915/gem_exec_alignment: remove pi-shared
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, tejaskumarx.surendrakumar.upadhyay@intel.com
Cc: mastanx.katragadda@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

pi-shared is expected to fail due to locking contention of a shared resource in kernel.
there is no way to make this reliably work with the dma_resv locking.

https://cgit.freedesktop.org/drm-tip/commit/?id=5cd57f676bb946a00275408f0dd0d75dbc466d25

Signed-off-by: Mastan Katragadda <mastanx.katragadda@intel.com>
---
 tests/i915/gem_exec_alignment.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/i915/gem_exec_alignment.c b/tests/i915/gem_exec_alignment.c
index c4611bd1..60d2c96a 100644
--- a/tests/i915/gem_exec_alignment.c
+++ b/tests/i915/gem_exec_alignment.c
@@ -540,8 +540,6 @@ igt_main
 		forked(fd, 20);
 	igt_subtest("pi")
 		prio_inversion(fd, 0);
-	igt_subtest("pi-shared")
-		prio_inversion(fd, SHARED);
 	igt_subtest("pi-isolated")
 		prio_inversion(fd, ISOLATED);
 }
-- 
2.25.1
