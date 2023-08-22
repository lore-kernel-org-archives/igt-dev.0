Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 22 Aug 2023 09:58:58 +0200
Message-ID: <20230822075857.37363-2-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/core_hotunplug: Wait for device nodes
 to re-appear
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Sometimes our health check is not able to find a device node (cardX or
renderY) after driver rebind or device rediscover.  Since device nodes are
recreated in detmpvfs asynchronously, give it a bit of time to do its job
before we try to reopen the device for health check.

(core_hotunplug:3612) DEBUG: Test requirement passed: priv->fd.drm == -1
(core_hotunplug:3612) DEBUG: reopening DRM device for health check
(core_hotunplug:3612) drmtest-DEBUG: Looking for devices to open using filter 0: sys:/sys/devices/pci0000:4a/0000:4a:02.0/0000:4b:00.0/0000:4c:01.0/0000:4d:00.0
(core_hotunplug:3612) drmtest-DEBUG: Filter matched /dev/dri/card1 | /dev/dri/renderD128
(core_hotunplug:3612) drmtest-DEBUG: Opened previously opened device: /dev/dri/card1
(core_hotunplug:3612) DEBUG: running device sysfs healthcheck
(core_hotunplug:3612) DEBUG: closing health checked device instance
(core_hotunplug:3612) DEBUG: reopening render device for health check
(core_hotunplug:3612) drmtest-DEBUG: Looking for devices to open using filter 0: sys:/sys/devices/pci0000:4a/0000:4a:02.0/0000:4b:00.0/0000:4c:01.0/0000:4d:00.0
(core_hotunplug:3612) drmtest-DEBUG: Filter matched /dev/dri/card1 | /dev/dri/renderD128
(core_hotunplug:3612) drmtest-INFO: Opened device: /dev/dri/renderD128
(core_hotunplug:3612) DEBUG: running device sysfs healthcheck
(core_hotunplug:3612) DEBUG: closing health checked device instance
(core_hotunplug:3612) DEBUG: Test requirement passed: healthcheck(priv, false)
(core_hotunplug:3612) DEBUG: Test requirement passed: priv->fd.drm_hc == -1
(core_hotunplug:3612) igt_kmod-DEBUG: Module snd_hda_intel unloaded immediately
(core_hotunplug:3612) INFO: Unloaded audio driver snd_hda_intel
(core_hotunplug:3612) DEBUG: unbinding the driver from the device
(core_hotunplug:3612) DEBUG: rebinding the driver to the device
(core_hotunplug:3612) INFO: Realoading snd_hda_intel
(core_hotunplug:3612) DEBUG: reopening DRM device for health check
(core_hotunplug:3612) drmtest-DEBUG: Looking for devices to open using filter 0: sys:/sys/devices/pci0000:4a/0000:4a:02.0/0000:4b:00.0/0000:4c:01.0/0000:4d:00.0
(core_hotunplug:3612) drmtest-DEBUG: Filter matched /dev/dri/card1 |
(core_hotunplug:3612) drmtest-DEBUG: Opened previously opened device: /dev/dri/card1
(core_hotunplug:3612) DEBUG: running device sysfs healthcheck
(core_hotunplug:3612) DEBUG: closing health checked device instance
(core_hotunplug:3612) DEBUG: reopening render device for health check
(core_hotunplug:3612) drmtest-DEBUG: Looking for devices to open using filter 0: sys:/sys/devices/pci0000:4a/0000:4a:02.0/0000:4b:00.0/0000:4c:01.0/0000:4d:00.0
(core_hotunplug:3612) drmtest-DEBUG: Filter matched /dev/dri/card1 |
(core_hotunplug:3612) CRITICAL: Test assertion failure function local_drm_open_driver, file ../../../usr/src/igt-gpu-tools/tests/core_hotunplug.c:130:
(core_hotunplug:3612) CRITICAL: Failed assertion: fd_drm >= 0
(core_hotunplug:3612) CRITICAL: file descriptor fd_drm failed

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/8830
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/500
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Petri Latvala <adrinael@adrinael.net>
---
 tests/core_hotunplug.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 30d9a6a576..b254447c71 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -501,6 +501,9 @@ static void node_healthcheck(struct hotunplug *priv, unsigned flags)
 
 static bool healthcheck(struct hotunplug *priv, bool recover)
 {
+	/* give udev some time to recreate device nodes before we continue */
+	sleep(1);
+
 	/* device name may have changed, rebuild IGT device list */
 	igt_devices_scan(true);
 
-- 
2.41.0
