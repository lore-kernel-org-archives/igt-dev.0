Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F30289D1D
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Sep 2020 12:14:58 +0000 (UTC)
From: Uma Shankar <uma.shankar@intel.com>
Date: Mon, 14 Sep 2020 18:18:18 +0530
Message-Id: <20200914124818.11497-1-uma.shankar@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/device_reset: Work around for driver
 unbind issue with audio
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
Cc: marcin.bernatowicz@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Unbinding the i915 driver on some Haswell and Broadwell platforms with
Azalia audio results in a kernel WARNING on "i915 raw-wakerefs=1
wakelocks=1 on cleanup".  The issue can be worked around by manually
enabling runtime power management for the conflicting audio adapter.
Use that method but also display a warning to preserve visibility of
the issue. Also tag the workaround with a FIXME comment.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/device_reset.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/device_reset.c b/tests/device_reset.c
index b1181b3b..9cb59ee4 100644
--- a/tests/device_reset.c
+++ b/tests/device_reset.c
@@ -232,9 +232,20 @@ static void set_device_filter(const char* dev_path)
 
 static void unbind_reset_rebind(struct device_fds *dev)
 {
+	uint32_t devid = intel_get_drm_devid(dev->fds.dev);
 	igt_debug("close the device\n");
 	close_if_opened(&dev->fds.dev);
 
+	/**
+	 * FIXME: Unbinding the i915 driver on some platforms with Azalia audio
+	 * results in a kernel WARN on "i915 raw-wakerefs=1 wakelocks=1 on cleanup".
+	 * The below CI friendly user level workaround prevents the warning from
+	 * appearing. Drop this hack as soon as this is fixed in the kernel.
+	 */
+	if (igt_warn_on_f((bool) IS_HASWELL(devid) || IS_BROADWELL(devid),
+	    "Manually enabling audio PM to work around a kernel WARN\n"))
+		igt_pm_enable_audio_runtime_pm();
+
 	driver_unbind(dev);
 
 	initiate_device_reset(dev);
-- 
2.19.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
