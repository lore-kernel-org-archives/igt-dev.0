Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C026E094
 for <igt-dev@lists.freedesktop.org>; Sat, 18 Jan 2020 13:56:44 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Sat, 18 Jan 2020 13:56:38 +0000
Message-Id: <20200118135638.3497021-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] intel-ci: Reduce variety of gem_sync in BAT
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

Historically, we've had many problems with missed interrupt/seqno
syndrome and so have focus on testing with gem_sync. However, these
tests rely on the kernel itself reporting the issue which it no longer
does. So why the extra variety may impose different timing of execution
on the HW (and so different interrupt timings which may or may not help
uncover issues), they do not have any variety in driver coverage. Reduce
the variety (halving the associated runtime) as they are no more likely
to spot an issue than multiple runs through BAT.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/intel-ci/fast-feedback.testlist | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index f697eb0cf..8c574d910 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -45,9 +45,6 @@ igt@gem_ringfill@basic-default-forked
 igt@gem_ringfill@basic-default-fd
 igt@gem_sync@basic-all
 igt@gem_sync@basic-each
-igt@gem_sync@basic-many-each
-igt@gem_sync@basic-store-all
-igt@gem_sync@basic-store-each
 igt@gem_tiled_blits@basic
 igt@gem_tiled_fence_blits@basic
 igt@gem_tiled_pread_basic
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
