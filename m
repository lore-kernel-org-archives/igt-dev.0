Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B86310E2BC
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Dec 2023 07:52:12 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	vidya.srinivas@intel.com
Date: Mon,  4 Dec 2023 13:11:08 +0530
Message-Id: <20231204074111.3167784-7-bhanuprakash.modem@intel.com>
In-Reply-To: <20231204074111.3167784-1-bhanuprakash.modem@intel.com>
References: <20231204074111.3167784-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V5 6/9] tests/kms_vrr: Add a helper to get the low
 refresh mode
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

To switch the refresh rate seamlessly, add a new helper to
identify the mode with the same resolution but low vrefresh
and clock.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 422d89073..26f89f7a8 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -166,6 +166,24 @@ output_mode_with_maxrate(igt_output_t *output, unsigned int vrr_max)
 	return mode;
 }
 
+static drmModeModeInfo
+low_rr_mode_with_same_res(igt_output_t *output, unsigned int vrr_min)
+{
+	int i;
+	drmModeConnectorPtr connector = output->config.connector;
+	drmModeModeInfo mode = *igt_output_get_mode(output);
+
+	for (i = 0; i < connector->count_modes; i++)
+		if (connector->modes[i].hdisplay == mode.hdisplay &&
+		    connector->modes[i].vdisplay == mode.vdisplay &&
+		    connector->modes[i].clock < mode.clock &&
+		    connector->modes[i].vrefresh < mode.vrefresh &&
+		    connector->modes[i].vrefresh >= vrr_min)
+			mode = connector->modes[i];
+
+	return mode;
+}
+
 /* Read min and max vrr range from the connector debugfs. */
 static range_t
 get_vrr_range(data_t *data, igt_output_t *output)
-- 
2.40.0
