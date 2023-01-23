Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB4E10E33C
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jan 2023 10:54:47 +0000 (UTC)
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 23 Jan 2023 11:54:39 +0100
Message-Id: <20230123105439.11804-2-nirmoy.das@intel.com>
In-Reply-To: <20230123105439.11804-1-nirmoy.das@intel.com>
References: <20230123105439.11804-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] test/i915/gem_eio: Skip suspend test on
 smallbar machine
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Matthew Auld <matthew.auld@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Suspending machine requires backing up gem objects to
system memory. CPU non-visible lmem objects can only be
backed up with the help of GPU on a smallbar device and if
the gpu is wedged then such backup action will fail with -EIO.

This test sets the gpu to wedge state before suspending the
machine which will always fail on smallbar machine.

References: https://gitlab.freedesktop.org/drm/intel/-/issues/7896
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 tests/i915/gem_eio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
index 70e82b811..8dbaa7a75 100644
--- a/tests/i915/gem_eio.c
+++ b/tests/i915/gem_eio.c
@@ -500,6 +500,7 @@ static void test_wait(int fd, unsigned int flags, unsigned int wait)
 
 static void test_suspend(int fd, int state)
 {
+	igt_require(!gem_has_smallbar(fd));
 	/* Do a suspend first so that we don't skip inside the test */
 	igt_system_suspend_autoresume(state, SUSPEND_TEST_DEVICES);
 
-- 
2.39.0
