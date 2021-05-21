Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Fri, 21 May 2021 09:48:44 +0530
Message-Id: <1621570724-24132-1-git-send-email-vidya.srinivas@intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests/drm_read: drm_read fails for subtest
 invalid-buffer on chrome
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, igt-dev@lists.freedesktop.org
Cc: Charlton.Lin@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Chrome platforms is unable to handle reading from -1.
It terminates the test after reporting buffer overflow.
Hence, changed the address for invalid buffer to NULL instead of -1.
With this change, errno becomes EINTR when reading from NULL
location. To accomodate, also changing the check of errno to EINTR
instead of EFAULT

Change-Id: I5f844af087c9826fcbcfbe301f0df5f727cb013b
Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 tests/drm_read.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/drm_read.c b/tests/drm_read.c
index ccf9d822fd8d..a8816bc1e587 100644
--- a/tests/drm_read.c
+++ b/tests/drm_read.c
@@ -106,8 +106,8 @@ static void test_invalid_buffer(int in)
 
 	alarm(1);
 
-	igt_assert_eq(read(fd, (void *)-1, 4096), -1);
-	igt_assert_eq(errno, EFAULT);
+	igt_assert_eq(read(fd, (void *)NULL, 4096), -1);
+	igt_assert_eq(errno, EINTR);
 
 	teardown(fd);
 }
-- 
2.7.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
