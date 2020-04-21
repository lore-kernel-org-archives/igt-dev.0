Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B220A6E8B4
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Apr 2020 11:16:15 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 21 Apr 2020 12:15:37 +0100
Message-Id: <20200421111537.3403622-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] intel-ci/blacklists: Lift premerge ban for
 gem_exec_alignment
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

In all but a few stray cases, the issues with the excess timeouts has
been resolved by capping the amount of work and setup we do. There is
still currently quadratic behaviour in the kernel that we are trying to
resolve, and so this test is under current scrutiny and *useful*!

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Martin Peres <martin.peres@linux.intel.com>
---
 tests/intel-ci/blacklist-pre-merge.txt | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/tests/intel-ci/blacklist-pre-merge.txt b/tests/intel-ci/blacklist-pre-merge.txt
index cddb77c1f..070f3b32c 100644
--- a/tests/intel-ci/blacklist-pre-merge.txt
+++ b/tests/intel-ci/blacklist-pre-merge.txt
@@ -62,15 +62,6 @@ igt@i915_pm_rpm@universal-planes(-dpms)?
 igt@gem_pwrite@big-.*
 
 
-###############################################################################
-# This test checks some edge cases of the execbuf API, which is quite time
-# consuming and rarely changes. Very unlikely to be affected by any code
-# outside of drm_mm and i915_gem_execbuffer, for which the authors assure us
-# that they are making deliberate and well tested changes.
-###############################################################################
-igt@gem_exec_alignment@.*
-
-
 ###############################################################################
 # These 4 tests are covering an edge case which should never be hit by users
 # unless we already are in a bad situation, yet they are responsible for a
-- 
2.26.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
