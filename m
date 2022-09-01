Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D455810E5EE
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Sep 2022 06:37:32 +0000 (UTC)
Received: from maurocar by linux.intel.com with local (Exim 4.95)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1oTdpS-0016W7-8N
 for igt-dev@lists.freedesktop.org; Thu, 01 Sep 2022 08:37:30 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Sep 2022 08:37:17 +0200
Message-Id: <20220901063722.261828-70-mauro.chehab@linux.intel.com>
In-Reply-To: <20220901063722.261828-1-mauro.chehab@linux.intel.com>
References: <20220901063722.261828-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 69/74] drm_read: Close device before exit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@intel.com>

Close the device fd before we check for leaks during the atexit
handlers.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/drm_read.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/drm_read.c b/tests/drm_read.c
index 4a966a23b550..36dc623ede13 100644
--- a/tests/drm_read.c
+++ b/tests/drm_read.c
@@ -46,6 +46,8 @@
 #include <pthread.h>
 #include "drm.h"
 
+#include "igt_types.h"
+
 IGT_TEST_DESCRIPTION("Call read(drm) and see if it behaves.");
 
 static void sighandler(int sig, siginfo_t * info, void *context)
@@ -253,10 +255,10 @@ static void test_short_buffer_wakeup(int in, enum pipe pipe)
 
 igt_main
 {
-	int fd;
 	igt_display_t display;
 	struct igt_fb fb;
 	enum pipe pipe;
+	igt_fd_t(fd);
 
 	igt_fixture {
 		struct sigaction alarm_action = {};
-- 
2.37.2
