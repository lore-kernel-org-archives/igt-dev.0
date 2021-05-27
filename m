Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Thu, 27 May 2021 20:02:14 +0530
Message-Id: <20210527143214.25486-1-vidya.srinivas@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 1/4] [RFC] tests/drm_read: Fix subtest
 invalid-buffer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org
Cc: markyacoub@chromium.org, charlton.lin@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Using (void *)-1 directly in read is aborting on chrome systems.
Following message is seen.

Starting subtest: invalid-buffer
*** buffer overflow detected ***: terminated
Received signal SIGABRT.
Stack trace:
Aborted (core dumped)

Patch just adds a pointer variable and uses it in read.

Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
Change-Id: I97f129e586bf9212eb0a63a4cd4c91e0327dd550
---
 tests/drm_read.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/drm_read.c b/tests/drm_read.c
index ccf9d822fd8d..2fdec5be4078 100644
--- a/tests/drm_read.c
+++ b/tests/drm_read.c
@@ -103,10 +103,11 @@ static void teardown(int fd)
 static void test_invalid_buffer(int in)
 {
 	int fd = setup(in, 0);
+	void *add = (void *)-1;
 
 	alarm(1);
 
-	igt_assert_eq(read(fd, (void *)-1, 4096), -1);
+	igt_assert_eq(read(fd, add, 4096), -1);
 	igt_assert_eq(errno, EFAULT);
 
 	teardown(fd);
-- 
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
