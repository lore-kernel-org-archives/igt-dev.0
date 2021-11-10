Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8543D6E0F2
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Nov 2021 12:16:27 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 10 Nov 2021 14:15:13 +0200
Message-Id: <20211110121513.29932-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/igt_debugfs: Fixup docs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

When IGT was made multi-device-aware, various functions had the device
fd parameter added, but that didn't get added to documentation.

Also clean a couple of typos.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
---
 lib/igt_debugfs.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index a5bb95ca..e6301f18 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -236,7 +236,7 @@ int igt_debugfs_dir(int device)
 /**
  * igt_debugfs_connector_dir:
  * @device: fd of the device
- * @conn_name: conenctor name
+ * @conn_name: connector name
  * @mode: mode bits as used by open()
  *
  * This opens the debugfs directory corresponding to connector on the device
@@ -283,6 +283,7 @@ int igt_debugfs_pipe_dir(int device, int pipe, int mode)
 
 /**
  * igt_debugfs_open:
+ * @device: fd of the device
  * @filename: name of the debugfs node to open
  * @mode: mode bits as used by open()
  *
@@ -309,6 +310,7 @@ int igt_debugfs_open(int device, const char *filename, int mode)
 
 /**
  * igt_debugfs_simple_read:
+ * @dir: fd of the debugfs directory
  * @filename: file name
  * @buf: buffer where the contents will be stored, allocated by the caller
  * @size: size of the buffer
@@ -318,7 +320,7 @@ int igt_debugfs_open(int device, const char *filename, int mode)
  * first argument.
  *
  * Returns:
- * -errorno on failure or bytes read on success
+ * -errno on failure or bytes read on success
  */
 int igt_debugfs_simple_read(int dir, const char *filename, char *buf, int size)
 {
@@ -335,6 +337,7 @@ int igt_debugfs_simple_read(int dir, const char *filename, char *buf, int size)
 
 /**
  * __igt_debugfs_read:
+ * @fd: fd of the device
  * @filename: file name
  * @buf: buffer where the contents will be stored, allocated by the caller
  * @size: size of the buffer
@@ -353,6 +356,7 @@ void __igt_debugfs_read(int fd, const char *filename, char *buf, int size)
 
 /**
  * igt_debugfs_search:
+ * @device: fd of the device
  * @filename: file name
  * @substring: string to search for in @filename
  *
@@ -536,6 +540,7 @@ struct _igt_pipe_crc {
 
 /**
  * igt_require_pipe_crc:
+ * @fd: fd of the device
  *
  * Convenience helper to check whether pipe CRC capturing is supported by the
  * kernel. Uses igt_skip to automatically skip the test/subtest if this isn't
@@ -566,6 +571,7 @@ static void igt_hpd_storm_exit_handler(int sig)
 
 /**
  * igt_hpd_storm_set_threshold:
+ * @drm_fd: fd of the device
  * @threshold: How many hotplugs per second required to trigger an HPD storm,
  * or 0 to disable storm detection.
  *
@@ -596,6 +602,7 @@ void igt_hpd_storm_set_threshold(int drm_fd, unsigned int threshold)
 
 /**
  * igt_hpd_storm_reset:
+ * @drm_fd: fd of the device
  *
  * Convienence helper to reset HPD storm detection to it's default settings.
  * If hotplug detection was disabled on any ports due to an HPD storm, it will
@@ -623,6 +630,7 @@ void igt_hpd_storm_reset(int drm_fd)
 
 /**
  * igt_hpd_storm_detected:
+ * @drm_fd: fd of the device
  *
  * Checks whether or not i915 has detected an HPD interrupt storm on any of the
  * system's ports.
@@ -662,6 +670,7 @@ bool igt_hpd_storm_detected(int drm_fd)
 
 /**
  * igt_require_hpd_storm_ctl:
+ * @drm_fd: fd of the device
  *
  * Skips the current test if the system does not have HPD storm detection.
  *
@@ -707,6 +716,7 @@ pipe_crc_new(int fd, enum pipe pipe, const char *source, int flags)
 
 /**
  * igt_pipe_crc_new:
+ * @fd: fd of the device
  * @pipe: display pipe to use as source
  * @source: CRC tap point to use as source
  *
@@ -725,6 +735,7 @@ igt_pipe_crc_new(int fd, enum pipe pipe, const char *source)
 
 /**
  * igt_pipe_crc_new_nonblock:
+ * @fd: fd of the device
  * @pipe: display pipe to use as source
  * @source: CRC tap point to use as source
  *
@@ -974,7 +985,7 @@ void igt_pipe_crc_get_single(igt_pipe_crc_t *pipe_crc, igt_crc_t *crc)
 
 /**
  * igt_pipe_crc_get_current:
- * @drm_fd: Pointer to drm fd for vblank counter
+ * @drm_fd: drm fd for vblank counter
  * @pipe_crc: pipe CRC object
  * @vblank: frame counter value we're looking for
  * @crc: buffer pointer for the captured CRC value
@@ -1002,7 +1013,7 @@ igt_pipe_crc_get_for_frame(int drm_fd, igt_pipe_crc_t *pipe_crc,
 
 /**
  * igt_pipe_crc_get_current:
- * @drm_fd: Pointer to drm fd for vblank counter
+ * @drm_fd: drm fd for vblank counter
  * @pipe_crc: pipe CRC object
  * @crc: buffer pointer for the captured CRC value
  *
@@ -1071,6 +1082,7 @@ void igt_reset_fifo_underrun_reporting(int drm_fd)
 
 /**
  * igt_drop_caches_has:
+ * @drm_fd: fd of the device
  * @val: bitmask for DROP_* values
  *
  * This queries the debugfs to see if it supports the full set of desired
@@ -1091,6 +1103,7 @@ bool igt_drop_caches_has(int drm_fd, uint64_t val)
 
 /**
  * igt_drop_caches_set:
+ * @drm_fd: fd of the device
  * @val: bitmask for DROP_* values
  *
  * This calls the debugfs interface the drm/i915 GEM driver exposes to drop or
-- 
2.29.2
