Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EEC96E0AC
 for <igt-dev@lists.freedesktop.org>; Sat, 18 Jan 2020 13:53:06 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Sat, 18 Jan 2020 13:53:00 +0000
Message-Id: <20200118135300.3496908-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] intel-ci: Drop gem_ctx_switch from fast
 feedback
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

Only a couple of tests from gem_ctx_switch are run in BAT, to check we
have multiple contexts on RCS. It doesn't actually verify the switch,
just that the execbuf API accepts the context argument.

This test is redundant as actual context switching (and more) is verified by
live_gem_contexts and live_gt_contexts selftests.

Instead of using the mediocre gem_ctx_switch stress test in BAT, use
gem_exec_parallel/contexs and gem_exec_parallel/fds as both ensure
multiple contexts are supported for simultaneous use, in a fraction of
the time.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/intel-ci/fast-feedback.testlist | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index 37a92b4e7..f697eb0cf 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -14,8 +14,6 @@ igt@gem_ctx_create@basic-files
 igt@gem_ctx_exec@basic
 igt@gem_ctx_param@basic
 igt@gem_ctx_param@basic-default
-igt@gem_ctx_switch@legacy-render
-igt@gem_ctx_switch@rcs0
 igt@gem_exec_basic@basic
 igt@gem_exec_create@basic
 igt@gem_exec_fence@basic-busy-default
@@ -24,6 +22,8 @@ igt@gem_exec_fence@basic-await-default
 igt@gem_exec_fence@nb-await-default
 igt@gem_exec_gttfill@basic
 igt@gem_exec_parallel@basic
+igt@gem_exec_parallel@contexts
+igt@gem_exec_parallel@fds
 igt@gem_exec_store@basic-all
 igt@gem_exec_suspend@basic
 igt@gem_exec_suspend@basic-s0
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
