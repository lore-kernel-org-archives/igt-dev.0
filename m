Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Fri, 19 Nov 2021 12:59:41 +0000
Message-Id: <20211119125945.55056-2-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20211119125945.55056-1-tvrtko.ursulin@linux.intel.com>
References: <20211119125945.55056-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH i-g-t 2/6] igt/drm_read: Fix build warning
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

.../tests/drm_read.c: In function ‘test_short_buffer_wakeup’:
.../tests/drm_read.c:224:17: warning: ‘pthread_yield’ is deprecated: pthread_yield is deprecated, use sched_yield instead [-Wdeprecated-declarations]
  224 |                 pthread_yield();
      |                 ^~~~~~~~~~~~~

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
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
2.32.0
