Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3882C10E4B3
 for <igt-dev@lists.freedesktop.org>; Sat,  2 Jul 2022 03:05:43 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  1 Jul 2022 20:05:35 -0700
Message-Id: <2922c9645085fd94c34b812ada695b7f708914a4.1656731010.git.ashutosh.dixit@intel.com>
In-Reply-To: <cover.1656731010.git.ashutosh.dixit@intel.com>
References: <cover.1656731010.git.ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/4] tests/drm_read: Fix
 -Wdeprecated-declarations
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

[1/405] Compiling C object tests/drm_read.p/drm_read.c.o
../tests/drm_read.c: In function ‘test_short_buffer_wakeup’:
../tests/drm_read.c:224:17: warning: ‘pthread_yield’ is deprecated: \
	pthread_yield is deprecated, \
	use sched_yield instead [-Wdeprecated-declarations]
  224 |                 pthread_yield();
      |                 ^~~~~~~~~~~~~
/usr/include/pthread.h:479:12: note: declared here
  479 | extern int __REDIRECT_NTH (pthread_yield, (void), sched_yield)
      |            ^~~~~~~~~~~~~~

Use sched_yield instead of pthread_yield

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/drm_read.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/drm_read.c b/tests/drm_read.c
index 3186e6097187..4a966a23b550 100644
--- a/tests/drm_read.c
+++ b/tests/drm_read.c
@@ -221,7 +221,7 @@ static void test_short_buffer_wakeup(int in, enum pipe pipe)
 		pthread_mutex_unlock(&w.mutex);
 
 		/* Give each thread a chance to sleep in drm_read() */
-		pthread_yield();
+		sched_yield();
 
 		/* One event should wake all threads as none consume */
 		generate_event(w.fd, pipe);
-- 
2.34.1
