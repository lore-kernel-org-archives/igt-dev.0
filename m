Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAFA510E132
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jan 2022 02:52:03 +0000 (UTC)
From: Chuansheng Liu <chuansheng.liu@intel.com>
Date: Mon, 24 Jan 2022 10:38:33 +0800
Message-Id: <20220124023833.13535-1-chuansheng.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] i915/gem_busy: Prevent context ban with
 right ctx id
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: chuansheng.liu@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

When running multiple hang tests, the code is intended to
disallow context ban at first, but it is always with fix
ctx id 0. It will cause below test failures when running
the test gem_busy:

--
tarting dynamic subtest: vcs0
(gem_busy:18571) ioctl_wrappers-CRITICAL: Test assertion failure
function gem_execbuf_wr, file ../lib/ioctl_wrappers.c:706:
(gem_busy:18571) ioctl_wrappers-CRITICAL: Failed assertion:
__gem_execbuf_wr(fd, execbuf) == 0
(gem_busy:18571) ioctl_wrappers-CRITICAL: error: -5 != 0
--

-5 (EIO) means the context is banned and can not be used for
execution.

This patch corrects the ctx id accordindly. Furthermore,
there are other code places with similar mistakes, will
try to send out the fixes further.

Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
---
 tests/i915/gem_busy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/gem_busy.c b/tests/i915/gem_busy.c
index b4757736..b8a61084 100644
--- a/tests/i915/gem_busy.c
+++ b/tests/i915/gem_busy.c
@@ -517,7 +517,7 @@ igt_main
 		igt_hang_t hang;
 
 		igt_fixture {
-			hang = igt_allow_hang(fd, 0, 0);
+			hang = igt_allow_hang(fd, ctx->id, 0);
 		}
 
 		test_each_engine("hang", fd, ctx, e) {
-- 
2.25.0.rc2
