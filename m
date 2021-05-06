Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Thu,  6 May 2021 08:57:09 +0200
Message-Id: <20210506065709.345576-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t v4] lib/i915/perf: Fix non-card0 processing
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

IGT i915/perf library functions now always operate on sysfs perf
attributes of card0 device node, no matter which DRM device fd a user
passes.  The intention was to always switch to primary device node if
a user passes a render device node fd, but that breaks handling of
non-card0 devices.

If a user passed a render device node fd, find a primary device node of
the same device and use it instead of forcibly using the primary device
with minor number 0 when opening the device sysfs area.

v2: Don't assume primary minor matches render minor with masked type.
v3: Reset sysfs dir fd if no match, consequently spell out error paths,
    add a comment on convertion of renderD* to cardX (Lionel).
v4: Limit primary lookup to minors <64 (Chris)

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com> # v3
Cc: Chris Wilson <chris@chris-wilson.co.uk>
---
 lib/i915/perf.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index 56d5c0b3a..5644a3469 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -372,14 +372,43 @@ open_master_sysfs_dir(int drm_fd)
 {
 	char path[128];
 	struct stat st;
+	int sysfs;
 
 	if (fstat(drm_fd, &st) || !S_ISCHR(st.st_mode))
                 return -1;
 
-        snprintf(path, sizeof(path), "/sys/dev/char/%d:0",
-                 major(st.st_rdev));
+	snprintf(path, sizeof(path), "/sys/dev/char/%d:%d", major(st.st_rdev), minor(st.st_rdev));
+	sysfs = open(path, O_DIRECTORY);
+	if (sysfs < 0)
+		return sysfs;
 
-	return open(path, O_DIRECTORY);
+	if (minor(st.st_rdev) >= 128) {
+		/* If we were given a renderD* drm_fd, find it's associated cardX node. */
+		char device[100], cmp[100];
+		int device_len, cmp_len, i;
+
+		device_len = readlinkat(sysfs, "device", device, sizeof(device));
+		close(sysfs);
+		if (device_len < 0)
+			return device_len;
+
+		for (i = 0; i < 64; i++) {
+
+			snprintf(path, sizeof(path), "/sys/dev/char/%d:%d", major(st.st_rdev), i);
+			sysfs = open(path, O_DIRECTORY);
+			if (sysfs < 0)
+				continue;
+
+			cmp_len = readlinkat(sysfs, "device", cmp, sizeof(cmp));
+			if (cmp_len == device_len && !memcmp(cmp, device, cmp_len))
+				break;
+
+			close(sysfs);
+			sysfs = -1;
+		}
+	}
+
+	return sysfs;
 }
 
 struct intel_perf *
-- 
2.25.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
