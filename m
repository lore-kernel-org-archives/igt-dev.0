Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A1186E3F5
 for <igt-dev@lists.freedesktop.org>; Sun, 12 Apr 2020 11:21:40 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Sun, 12 Apr 2020 12:21:31 +0100
Message-Id: <20200412112131.2752212-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] intel-ci: Restore premerge testing of heavy
 reloc testing
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

Kernel fixes are planned to bring these down to respectively duration.
Validation of those fixes is required.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/intel-ci/blacklist-pre-merge.txt | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/tests/intel-ci/blacklist-pre-merge.txt b/tests/intel-ci/blacklist-pre-merge.txt
index cddb77c1f..79db2798b 100644
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
@@ -148,8 +139,6 @@ igt@i915_pm_rpm@debugfs-read
 ###############################################################################
 igt@gem_fence_thrash@bo-write-verify-threaded-[xy]
 igt@gem_tiled_blits@interruptible
-igt@gem_tiled_fence_blits@normal
-igt@gem_tiled_blits@normal
 igt@gem_tiled_wc
 
 
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
