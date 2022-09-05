Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED93910E322
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Sep 2022 05:54:02 +0000 (UTC)
Received: from maurocar by linux.intel.com with local (Exim 4.95)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1oV53W-007pCE-4S
 for igt-dev@lists.freedesktop.org; Mon, 05 Sep 2022 07:53:58 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  5 Sep 2022 07:53:43 +0200
Message-Id: <152a672d7a1da3a5511fa8804d0adfac51d9d9f0.1662357022.git.mchehab@kernel.org>
In-Reply-To: <cover.1662357022.git.mchehab@kernel.org>
References: <cover.1662357022.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 69/77] drm_read: Close device before exit
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

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/77] at: https://lore.kernel.org/all/cover.1662357022.git.mchehab@kernel.org/

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
