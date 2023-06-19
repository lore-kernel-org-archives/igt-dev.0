Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40C8510E10E
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jun 2023 12:57:17 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 19 Jun 2023 15:56:32 +0300
Message-Id: <20230619125633.2395171-4-jouni.hogander@intel.com>
In-Reply-To: <20230619125633.2395171-1-jouni.hogander@intel.com>
References: <20230619125633.2395171-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 3/4] lib/xe/xe_spin: Handle spinner timer
 for Xe as well
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Current spinner implementation for Xe doesn't support setting
timeout. Fix this by handling timers same way as for i915 as well.

Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 lib/xe/xe_spin.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 9f511e14f..d8c665f39 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -115,6 +115,7 @@ xe_spin_create(int fd, const struct igt_spin_factory *opt)
 	spin->syncobj = syncobj_create(fd, 0);
 	spin->vm = opt->vm;
 	spin->engine = opt->engine;
+	spin->timerfd = -1;
 
 	if (!spin->vm)
 		spin->vm = xe_vm_create(fd, 0, 0);
@@ -163,6 +164,13 @@ void xe_spin_sync_wait(int fd, struct igt_spin *spin)
 void xe_spin_free(int fd, struct igt_spin *spin)
 {
 	igt_assert(spin->driver == INTEL_DRIVER_XE);
+
+	if (spin->timerfd >= 0) {
+		pthread_cancel(spin->timer_thread);
+		igt_assert(pthread_join(spin->timer_thread, NULL) == 0);
+		close(spin->timerfd);
+	}
+
 	xe_spin_end(spin->xe_spin);
 	xe_spin_sync_wait(fd, spin);
 	xe_vm_unbind_sync(fd, spin->vm, 0, spin->address, spin->bo_size);
-- 
2.34.1
