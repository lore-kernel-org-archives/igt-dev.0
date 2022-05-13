Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 13 May 2022 10:31:28 +0100
Message-Id: <20220513093128.1027997-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/core_hotunplug: Check sysfs reads
 after hotunplug
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Leave some sysfs files open and attempt to read from them after hotunplug.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/core_hotunplug.c | 62 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 02eae19e1e16..c3831541202d 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -602,6 +602,59 @@ static void hotreplug_lateclose(struct hotunplug *priv)
 	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
 }
 
+static void hotunplug_sysfs(struct hotunplug *priv)
+{
+	int i915, sysfs;
+	struct {
+		int fd;
+		const char *path;
+		char buf[256];
+	} *item, items[] = {
+		{ .fd = -1, .path = "error" },
+		{ .fd = -1, .path = "gt_act_freq_mhz" },
+		{ .fd = -1, .path = "gt/gt0/rps_act_freq_mhz" },
+		{ .fd = -1, .path = "gt/gt0/rc6_residency_ms" },
+		{ .fd = -1, .path = "engine/rcs0/name" },
+		{ .fd = -1, .path = "engine/bcs0/name" },
+		{ .path = NULL },
+	};
+	unsigned int cnt = 0;
+
+	pre_check(priv);
+
+	i915 = local_drm_open_driver(false, "", " for hot unplug");
+	sysfs = igt_sysfs_open(i915);
+	igt_require(sysfs >= 0);
+	for (item = &items[0]; item->path; item++) {
+		item->fd = openat(sysfs, item->path, O_RDONLY);
+		cnt += item->fd >= 0;
+	}
+	close(sysfs);
+	close_device(i915, " ", "sysfs open ");
+
+	igt_require(cnt >= 3);
+
+	device_unplug(priv, "hot ", 60);
+
+	sleep(2);
+
+	for (item = &items[0]; item->path; item++) {
+		ssize_t len;
+		int err;
+
+		if (item->fd < 0)
+			continue;
+
+		len = read(item->fd, item->buf, sizeof(item->buf));
+		err = len < 0 ? -errno : 0;
+		close(item->fd);
+		igt_debug("%s='%s' (%d)\n", item->path, item->buf, err);
+		igt_assert_eq(err, -ENODEV);
+	}
+
+	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
+}
+
 /* Main */
 
 igt_main
@@ -735,6 +788,15 @@ igt_main
 			recover(&priv);
 	}
 
+	igt_subtest_group {
+		igt_describe("Check if sysfs files left open can be safely accessed after hotunplug.");
+		igt_subtest("hotunplug-sysfs")
+			hotunplug_sysfs(&priv);
+
+		igt_fixture
+			recover(&priv);
+	}
+
 	igt_fixture {
 		post_healthcheck(&priv);
 
-- 
2.32.0
