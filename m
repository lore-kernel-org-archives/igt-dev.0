Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D99510E729
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jan 2023 12:30:12 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 18 Jan 2023 14:26:50 +0200
Message-Id: <20230118122650.307123-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] lib/igt_debugfs: Fixup docs
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

When IGT was made multi-device-aware, various functions had the device
fd parameter added, but that didn't get added to documentation.

Also clean a couple of typos.

v2: Rebase, CRC code moved to a different file

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_debugfs.c  | 14 ++++++++++++--
 lib/igt_pipe_crc.c |  5 ++++-
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index 85d350d3..6de178d6 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -220,7 +220,7 @@ int igt_debugfs_dir(int device)
 /**
  * igt_debugfs_connector_dir:
  * @device: fd of the device
- * @conn_name: conenctor name
+ * @conn_name: connector name
  * @mode: mode bits as used by open()
  *
  * This opens the debugfs directory corresponding to connector on the device
@@ -267,6 +267,7 @@ int igt_debugfs_pipe_dir(int device, int pipe, int mode)
 
 /**
  * igt_debugfs_open:
+ * @device: fd of the device
  * @filename: name of the debugfs node to open
  * @mode: mode bits as used by open()
  *
@@ -314,6 +315,7 @@ bool igt_debugfs_exists(int device, const char *filename, int mode)
 
 /**
  * igt_debugfs_simple_read:
+ * @dir: fd of the debugfs directory
  * @filename: file name
  * @buf: buffer where the contents will be stored, allocated by the caller
  * @size: size of the buffer
@@ -323,7 +325,7 @@ bool igt_debugfs_exists(int device, const char *filename, int mode)
  * first argument.
  *
  * Returns:
- * -errorno on failure or bytes read on success
+ * -errno on failure or bytes read on success
  */
 int igt_debugfs_simple_read(int dir, const char *filename, char *buf, int size)
 {
@@ -340,6 +342,7 @@ int igt_debugfs_simple_read(int dir, const char *filename, char *buf, int size)
 
 /**
  * __igt_debugfs_read:
+ * @fd: fd of the device
  * @filename: file name
  * @buf: buffer where the contents will be stored, allocated by the caller
  * @size: size of the buffer
@@ -375,6 +378,7 @@ void __igt_debugfs_write(int fd, const char *filename, const char *buf, int size
 
 /**
  * igt_debugfs_search:
+ * @device: fd of the device
  * @filename: file name
  * @substring: string to search for in @filename
  *
@@ -419,6 +423,7 @@ static void igt_hpd_storm_exit_handler(int sig)
 
 /**
  * igt_hpd_storm_set_threshold:
+ * @drm_fd: fd of the device
  * @threshold: How many hotplugs per second required to trigger an HPD storm,
  * or 0 to disable storm detection.
  *
@@ -449,6 +454,7 @@ void igt_hpd_storm_set_threshold(int drm_fd, unsigned int threshold)
 
 /**
  * igt_hpd_storm_reset:
+ * @drm_fd: fd of the device
  *
  * Convienence helper to reset HPD storm detection to it's default settings.
  * If hotplug detection was disabled on any ports due to an HPD storm, it will
@@ -476,6 +482,7 @@ void igt_hpd_storm_reset(int drm_fd)
 
 /**
  * igt_hpd_storm_detected:
+ * @drm_fd: fd of the device
  *
  * Checks whether or not i915 has detected an HPD interrupt storm on any of the
  * system's ports.
@@ -515,6 +522,7 @@ bool igt_hpd_storm_detected(int drm_fd)
 
 /**
  * igt_require_hpd_storm_ctl:
+ * @drm_fd: fd of the device
  *
  * Skips the current test if the system does not have HPD storm detection.
  *
@@ -553,6 +561,7 @@ void igt_reset_fifo_underrun_reporting(int drm_fd)
 
 /**
  * igt_drop_caches_has:
+ * @drm_fd: fd of the device
  * @val: bitmask for DROP_* values
  *
  * This queries the debugfs to see if it supports the full set of desired
@@ -573,6 +582,7 @@ bool igt_drop_caches_has(int drm_fd, uint64_t val)
 
 /**
  * igt_drop_caches_set:
+ * @drm_fd: fd of the device
  * @val: bitmask for DROP_* values
  *
  * This calls the debugfs interface the drm/i915 GEM driver exposes to drop or
diff --git a/lib/igt_pipe_crc.c b/lib/igt_pipe_crc.c
index 12e89461..866bf288 100644
--- a/lib/igt_pipe_crc.c
+++ b/lib/igt_pipe_crc.c
@@ -195,6 +195,7 @@ struct _igt_pipe_crc {
 
 /**
  * igt_require_pipe_crc:
+ * @fd: fd of the device
  *
  * Convenience helper to check whether pipe CRC capturing is supported by the
  * kernel. Uses igt_skip to automatically skip the test/subtest if this isn't
@@ -251,6 +252,7 @@ pipe_crc_new(int fd, enum pipe pipe, const char *source, int flags)
 
 /**
  * igt_pipe_crc_new:
+ * @fd: fd of the device
  * @pipe: display pipe to use as source
  * @source: CRC tap point to use as source
  *
@@ -269,6 +271,7 @@ igt_pipe_crc_new(int fd, enum pipe pipe, const char *source)
 
 /**
  * igt_pipe_crc_new_nonblock:
+ * @fd: fd of the device
  * @pipe: display pipe to use as source
  * @source: CRC tap point to use as source
  *
@@ -518,7 +521,7 @@ void igt_pipe_crc_get_single(igt_pipe_crc_t *pipe_crc, igt_crc_t *crc)
 
 /**
  * igt_pipe_crc_get_current:
- * @drm_fd: Pointer to drm fd for vblank counter
+ * @drm_fd: drm device fd for vblank counter
  * @pipe_crc: pipe CRC object
  * @vblank: frame counter value we're looking for
  * @crc: buffer pointer for the captured CRC value
-- 
2.30.2
