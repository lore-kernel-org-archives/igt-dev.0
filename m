Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 394366EB96
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2019 17:13:04 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Wed, 11 Dec 2019 19:40:54 +0530
Message-Id: <20191211141054.21455-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_content_protection: Fix uevent
 subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

uevent hdcp subtest was failing because hdcp_event()
has been called with NULL udev_monitor, which was
causing udev_monitor_receive_device() to return a
NULL udev.

Cc: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/kms_content_protection.c | 43 +++++++++++++---------------------
 1 file changed, 16 insertions(+), 27 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index e676b60b..a7dd786b 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -165,10 +165,16 @@ static void hdcp_udev_fini(struct udev_monitor *uevent_monitor,
 		udev_unref(udev);
 }
 
-static int hdcp_udev_init(struct udev_monitor *uevent_monitor,
-			  struct udev *udev)
+#define MAX_EVENTS	10
+static bool wait_for_hdcp_event(uint32_t conn_id, uint32_t prop_id,
+				uint32_t timeout_mSec)
 {
-	int ret = -EINVAL;
+	struct udev_monitor *uevent_monitor = NULL;
+	struct udev *udev = NULL;
+	int udev_fd, epoll_fd;
+	struct epoll_event event, events[MAX_EVENTS];
+	bool ret = false;
+	int err;
 
 	udev = udev_new();
 	if (!udev) {
@@ -182,46 +188,29 @@ static int hdcp_udev_init(struct udev_monitor *uevent_monitor,
 		goto out;
 	}
 
-	ret = udev_monitor_filter_add_match_subsystem_devtype(uevent_monitor,
+	err = udev_monitor_filter_add_match_subsystem_devtype(uevent_monitor,
 							      "drm",
 							      "drm_minor");
-	if (ret < 0) {
+	if (err < 0) {
 		igt_info("failed to filter for drm events\n");
 		goto out;
 	}
 
-	ret = udev_monitor_enable_receiving(uevent_monitor);
-	if (ret < 0) {
+	err = udev_monitor_enable_receiving(uevent_monitor);
+	if (err < 0) {
 		igt_info("failed to enable udev event reception\n");
 		goto out;
 	}
 
-	return udev_monitor_get_fd(uevent_monitor);
-
-out:
-	hdcp_udev_fini(uevent_monitor, udev);
-	return ret;
-}
-
-#define MAX_EVENTS	10
-static bool wait_for_hdcp_event(uint32_t conn_id, uint32_t prop_id,
-				uint32_t timeout_mSec)
-{
+	udev_fd = udev_monitor_get_fd(uevent_monitor);
 
-	struct udev_monitor *uevent_monitor = NULL;
-	struct udev *udev = NULL;
-	int udev_fd, epoll_fd;
-	struct epoll_event event, events[MAX_EVENTS];
-	bool ret = false;
-
-	udev_fd = hdcp_udev_init(uevent_monitor, udev);
 	if (udev_fd < 0)
 		return false;
 
 	epoll_fd = epoll_create1(0);
 	if (epoll_fd == -1) {
 		igt_info("Failed to create epoll fd. %d\n", epoll_fd);
-		goto out_ep_create;
+		goto out;
 	}
 
 	event.events = EPOLLIN | EPOLLERR;
@@ -238,7 +227,7 @@ static bool wait_for_hdcp_event(uint32_t conn_id, uint32_t prop_id,
 out_ep_ctl:
 	if (close(epoll_fd))
 		igt_info("failed to close the epoll fd\n");
-out_ep_create:
+out:
 	hdcp_udev_fini(uevent_monitor, udev);
 	return ret;
 }
-- 
2.24.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
