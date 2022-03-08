Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13ED810EC24
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Mar 2022 09:13:42 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  8 Mar 2022 14:42:27 +0530
Message-Id: <20220308091227.272415-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] i915_pm_rpm: Skip i2c read test for DP MST
 connectors
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

IGT finds the i2c edid over drm i2c node, which will actually
the particular DDI or TC port.

In case of DP MST there will be one static primary connector,
that is associated with actual DDI/PORT and igt will read a
valid edid on the parent/primary connector but at drm level
that connector will be disconnected. Hence endup with EDID
mismatch on connector.

This patch will ignore the DP-MST connectors.

Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/i915_pm_rpm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 1df0ed2223..2b687e63c0 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -670,6 +670,13 @@ static void format_hex_string(const unsigned char edid[static EDID_BLOCK_SIZE],
 		sprintf(buf+i*5, "0x%02x ", edid[i]);
 }
 
+static bool is_mst_connector(int fd, uint32_t connector_id)
+{
+	return kmstest_get_property(fd, connector_id,
+				    DRM_MODE_OBJECT_CONNECTOR,
+				    "PATH", NULL, NULL, NULL);
+}
+
 static void test_i2c(struct mode_set_data *data)
 {
 	bool edid_mistmach_i2c_vs_drm = false;
@@ -690,6 +697,9 @@ static void test_i2c(struct mode_set_data *data)
 
 		bool edids_equal;
 
+		if (is_mst_connector(drm_fd, data->connectors[i]->connector_id))
+			continue;
+
 		/* We fail to detect some VGA monitors using our i2c method. If you look
 		 * at the dmesg of these cases, you'll see the Kernel complaining about
 		 * the EDID reading mostly FFs and then disabling bit-banging. Since we
-- 
2.35.1
