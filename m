Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823EC10E4E5
 for <igt-dev@lists.freedesktop.org>; Tue, 23 May 2023 21:37:17 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 24 May 2023 03:14:27 +0530
Message-Id: <20230523214427.17361-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] DO_NOT_REVIEW: Increase the timeout for
 pageflip
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

lib/igt_kms: pageflip timeout is increased from 50ms
to 2s.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 lib/igt_kms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index c5484148..3775f87e 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2116,7 +2116,7 @@ unsigned int kmstest_get_vblank(int fd, int pipe, unsigned int flags)
 void kmstest_wait_for_pageflip(int fd)
 {
 	drmEventContext evctx = { .version = 2 };
-	struct timeval timeout = { .tv_sec = 0, .tv_usec = 50000 };
+	struct timeval timeout = { .tv_sec = 2, .tv_usec = 0 };
 	fd_set fds;
 	int ret;
 
@@ -2129,7 +2129,7 @@ void kmstest_wait_for_pageflip(int fd)
 	} while (ret < 0 && errno == EINTR);
 
 	igt_fail_on_f(ret == 0,
-		     "Exceeded timeout (50ms) while waiting for a pageflip\n");
+		     "Exceeded timeout (2s) while waiting for a pageflip\n");
 
 	igt_assert_f(ret == 1,
 		     "Waiting for pageflip failed with %d from select(drmfd)\n",
-- 
2.39.0
