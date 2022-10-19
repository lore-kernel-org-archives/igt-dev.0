Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC73910F1BD
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Oct 2022 09:27:58 +0000 (UTC)
From: Vikas Srivastava <vikas.srivastava@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 19 Oct 2022 14:56:30 +0530
Message-Id: <20221019092630.2882303-1-vikas.srivastava@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] Check caching ioctl before forking
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: jonathan.cavitt@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

    Several subtests for gem_exec_flush require the SET_CACHING
    ioctl to run.  However, the function that calls it is
    wrapped by an igt_require and thus causes a skip when the
    ioctl fails.  Unfortunately, MTL currently fails this check
    with -EOPNOTSUPP.

    While the ioctl failing and resulting in a skip wouldn't
    normally be a problem, the failing call is made within a
    forked child process, which causes an error.  By checking
    whether or not caching is supported before forking, this
    error can be downgraded to a graceful skip.

    v2: Fix formatting

    References: VLK-34086
    Signed-off-by: vikas srivastava <vikas.srivastava@intel.com>
    Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    CC: Fei Yang <fei.yang@intel.com>

---
 tests/i915/gem_exec_flush.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_flush.c b/tests/i915/gem_exec_flush.c
index 40c58db2..50cabcbe 100644
--- a/tests/i915/gem_exec_flush.c
+++ b/tests/i915/gem_exec_flush.c
@@ -81,6 +81,8 @@ static void run(int fd, unsigned ring, int nchild, int timeout,
 		unsigned flags)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	if (!(flags & WC))
+		 gem_require_caching(fd);
 
 	/* The crux of this testing is whether writes by the GPU are coherent
 	 * from the CPU.
@@ -371,7 +373,8 @@ static void batch(int fd, unsigned ring, int nchild, int timeout,
 		  enum batch_mode mode, unsigned flags)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
-
+	gem_require_caching(fd);
+	
 	if (mode == BATCH_GTT)
 		gem_require_mappable_ggtt(fd);
 
-- 
2.25.1
