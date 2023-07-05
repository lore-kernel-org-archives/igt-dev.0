Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B8D210E3B5
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jul 2023 19:34:57 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  5 Jul 2023 22:34:54 +0300
Message-Id: <20230705193454.14033-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915_pm_rpm: Try the standard "ddc"
 symlink for i2c read
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The driver may provide the standard "ddc" symlink in sysfs,
try that first for the i2c read, then fall back to the old
i915 specific stuff.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/i915/i915_pm_rpm.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 4ce83f27f86a..17413ffe5e0f 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -861,13 +861,15 @@ static void assert_drm_infos_equal(struct compare_data *d1,
 		assert_drm_crtcs_equal(d1->crtcs[i], d2->crtcs[i]);
 }
 
-static bool find_i2c_path(const char *connector_name, char *i2c_path)
+static bool find_i2c_path(const char *connector_name,
+			  char *i2c_path, size_t i2c_path_size)
 {
 	struct dirent *dirent;
 	DIR *dir;
 	int sysfs_card_fd = igt_sysfs_open(drm_fd);
 	int connector_fd = -1;
 	bool found_i2c_file = false;
+	ssize_t r;
 
 	dir = fdopendir(sysfs_card_fd);
 	igt_assert(dir);
@@ -889,9 +891,24 @@ static bool find_i2c_path(const char *connector_name, char *i2c_path)
 	if (connector_fd < 0)
 		return false;
 
+	/* try the standard "ddc" symlink first */
+	r = readlinkat(connector_fd, "ddc", i2c_path, i2c_path_size);
+	if (r > 0 && r != i2c_path_size) {
+		int num;
+
+		i2c_path[r] = '\0';
+
+		if (sscanf(basename(i2c_path), "i2c-%d", &num) == 1) {
+			snprintf(i2c_path, i2c_path_size, "/dev/i2c-%d", num);
+			return true;
+		}
+	}
+
 	dir = fdopendir(connector_fd);
 	igt_assert(dir);
 
+	/* fall back to old "i2c-?" symlink */
+	/* FIXME nuke this at some point */
 	while ((dirent = readdir(dir))) {
 		if (strncmp(dirent->d_name, "i2c-", 4) == 0) {
 			sprintf(i2c_path, "/dev/%s", dirent->d_name);
@@ -926,10 +943,12 @@ static bool i2c_read_edid(const char *connector_name, unsigned char *edid)
 		.nmsgs = 2,
 	};
 
-	result = find_i2c_path(connector_name, i2c_path);
+	result = find_i2c_path(connector_name, i2c_path, sizeof(i2c_path));
 	if (!result)
 		return false;
 
+	igt_info("Testing %s %s\n", connector_name, i2c_path);
+
 	fd = open(i2c_path, O_RDWR);
 	igt_assert_neq(fd, -1);
 
-- 
2.39.3
