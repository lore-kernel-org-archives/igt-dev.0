Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: Hersen Wu <hersenxs.wu@amd.com>
Subject: [PATCH 1/3] [i-g-t] lib/igt_amd: add debugfs disallow edp enter psr
Date: Wed, 17 Jan 2024 21:36:06 -0500
Message-ID: <20240118023608.55865-1-hersenxs.wu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev.lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, rodrigo.siqueira@amd.com, aurabindo.pillai@amd.com, alex.hung@amd.com, hamza.mahfooz@amd.com, wayne.lin@amd.com
Cc: Hersen Wu <hersenxs.wu@amd.com>, markyacoub@google.com

When igt app call this debugfs, it will pass disable flag
to kernel. The flag  will block psr setup and enable.

When igt read psr edp rx crc, read may be timeout.
After bootup, AMD kernel driver setup psr with dpcd 0x170 = 5.
this notify rx psr enable and let rx fw start checking crc
for rx fw internal logic. rx fw may not update crc read count
within dpcd 0x246. read count is always 0. this  will lead tx
crc reading timeout.

With IGT app sequence below, rx fw crc checking for rx internal
logic is disabled. upon tx read rx crc, rx fw will check crc and
update crc count within dpcd 0x246. so IGT app can read rx crc
successfully.

expected app sequence is as below:
1. disable eDP PHY and notify eDP rx with dpcd 0x600 = 2.
2. echo 0x1 /sys/kernel/debug/dri/0/eDP-X/disallow_edp_enter_psr
3. enable eDP PHY and notify eDP rx with dpcd 0x600 = 1 but
   without dpcd 0x170 = 5.
4. read crc from rx dpcd 0x270, 0x246, etc.
5. echo 0x0 /sys/kernel/debug/dri/0/eDP-X/disallow_edp_enter_psr.
   this will let eDP back to normal with psr setup dpcd 0x170 = 5.

Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
---
 lib/igt_amd.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_amd.h |  2 ++
 2 files changed, 51 insertions(+)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index 247a42f37..d0b53c08a 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -1153,6 +1153,55 @@ void igt_amd_allow_edp_hotplug_detect(int drm_fd, char *connector_name, bool ena
 	close(hpd_fd);
 }
 
+/**
+ * igt_amd_disallow_edp_enter_psr: notify kernel skip edp psr setup and enable
+ * @drm_fd: DRM file descriptor
+ * @connector_name: The connector's name
+ * @enable: skip kernel eDP psr setup and enable -- disallow edp enter psr
+ * example usage: disallow psr
+ * echo 0x1 >
+ * /sys/kernel/debug/dri/0/eDP-1/disallow_edp_enter_psr
+ *
+ * expected IGT sequence is as below:
+ * 1. disable eDP PHY and notify eDP rx with dpcd 0x600 = 2.
+ *    for example, kmstest_set_connector_dpms off will do this.
+ * 2. echo 0x1 /sys/kernel/debug/dri/0/eDP-X/disallow_edp_enter_psr
+ * 3. enable eDP PHY and notify eDP rx with dpcd 0x600 = 1 but
+ *    without dpcd 0x170 = 5.
+ *    for example, kmstest_set_connector_dpms on will do this.
+ * 4. read crc from rx dpcd 0x270, 0x246, etc.
+ *    igt_pipe_crc_collect_crc will do this.
+ * 5. echo 0x0 /sys/kernel/debug/dri/0/eDP-X/disallow_edp_enter_psr.
+ *    this will let eDP back to normal with psr setup dpcd 0x170 = 5.
+ */
+void igt_amd_disallow_edp_enter_psr(int drm_fd, char *connector_name, bool enable)
+{
+	int fd, ret, wr_len;
+	const char *allow_edp_psr = "1";
+	const char *dis_allow_edp_psr = "0";
+
+	/* if current psr is not enabled, skip this debugfs */
+	if (!igt_amd_psr_support_drv(drm_fd, connector_name, PSR_MODE_1) &&
+		!igt_amd_psr_support_drv(drm_fd, connector_name, PSR_MODE_2))
+		return;
+
+	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
+	igt_assert(fd >= 0);
+	ret = openat(fd, DEBUGFS_DISALLOW_EDP_ENTER_PSR, O_WRONLY);
+	close(fd);
+	igt_assert(ret >= 0);
+
+	if (enable) {
+		wr_len = write(ret, allow_edp_psr, strlen(allow_edp_psr));
+		igt_assert_eq(wr_len, strlen(allow_edp_psr));
+	} else {
+		wr_len = write(ret, dis_allow_edp_psr, strlen(dis_allow_edp_psr));
+		igt_assert_eq(wr_len, strlen(dis_allow_edp_psr));
+	}
+
+	close(ret);
+}
+
 static bool get_dm_capabilities(int drm_fd, char *buf, size_t size)
 {
 	int ret, fd;
diff --git a/lib/igt_amd.h b/lib/igt_amd.h
index 254b5d37b..6780b99de 100644
--- a/lib/igt_amd.h
+++ b/lib/igt_amd.h
@@ -50,6 +50,7 @@
 #define DEBUGFS_EDP_PSR_CAP	"psr_capability"
 #define DEBUGFS_EDP_PSR_STATE	"psr_state"
 #define DEBUGFS_ALLOW_EDP_HOTPLUG_DETECT "allow_edp_hotplug_detection"
+#define DEBUGFS_DISALLOW_EDP_ENTER_PSR "disallow_edp_enter_psr"
 
 /* amdgpu DM interface entries */
 #define DEBUGFS_DM_VISUAL_CONFIRM "amdgpu_dm_visual_confirm"
@@ -194,6 +195,7 @@ bool igt_amd_psr_support_drv(int drm_fd, char *connector_name, enum psr_mode mod
 bool igt_amd_output_has_psr_state(int drm_fd, char *connector_name);
 int  igt_amd_read_psr_state(int drm_fd, char *connector_name);
 void igt_amd_allow_edp_hotplug_detect(int drm_fd, char *connector_name, bool enable);
+void igt_amd_disallow_edp_enter_psr(int drm_fd, char *connector_name, bool enable);
 
 /* DM interface helpers */
 bool igt_amd_has_visual_confirm(int drm_fd);
-- 
2.25.1
