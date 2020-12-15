Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE4989BD5
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Dec 2020 17:47:17 +0000 (UTC)
Received: by mail-qt1-f198.google.com with SMTP id n12so14870299qta.9
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Dec 2020 09:47:13 -0800 (PST)
From: Jeremy Cline <jcline@redhat.com>
Date: Tue, 15 Dec 2020 12:46:56 -0500
Message-Id: <20201215174656.3956-1-jcline@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/device_reset: check for i915 in
 unbind_reset_rebind()
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

Commit 265f1d4a5a14 ("tests/device_reset: Work around for driver unbind
issue with audio") introduced an assertion on is_i915_device() by way of
intel_get_drm_devid(). Since this is a work-around for an i915-specific
issue, guard it with a check on the device type so the test runs on
other devices.

Signed-off-by: Jeremy Cline <jcline@redhat.com>
---
 tests/device_reset.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tests/device_reset.c b/tests/device_reset.c
index 9cb59ee4..9347a3f4 100644
--- a/tests/device_reset.c
+++ b/tests/device_reset.c
@@ -232,7 +232,7 @@ static void set_device_filter(const char* dev_path)
 
 static void unbind_reset_rebind(struct device_fds *dev)
 {
-	uint32_t devid = intel_get_drm_devid(dev->fds.dev);
+	uint32_t devid;
 	igt_debug("close the device\n");
 	close_if_opened(&dev->fds.dev);
 
@@ -242,9 +242,12 @@ static void unbind_reset_rebind(struct device_fds *dev)
 	 * The below CI friendly user level workaround prevents the warning from
 	 * appearing. Drop this hack as soon as this is fixed in the kernel.
 	 */
-	if (igt_warn_on_f((bool) IS_HASWELL(devid) || IS_BROADWELL(devid),
-	    "Manually enabling audio PM to work around a kernel WARN\n"))
-		igt_pm_enable_audio_runtime_pm();
+	if (is_i915_device(dev->fds.dev)) {
+		devid = intel_get_drm_devid(dev->fds.dev);
+		if (igt_warn_on_f((bool) IS_HASWELL(devid) || IS_BROADWELL(devid),
+		    "Manually enabling audio PM to work around a kernel WARN\n"))
+			igt_pm_enable_audio_runtime_pm();
+	}
 
 	driver_unbind(dev);
 
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
