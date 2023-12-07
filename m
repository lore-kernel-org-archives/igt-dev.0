Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 654A310E7F1
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Dec 2023 07:00:05 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 mitulkumar.ajitkumar.golani@intel.com
Date: Thu,  7 Dec 2023 12:18:56 +0530
Message-Id: <20231207064900.3328723-7-bhanuprakash.modem@intel.com>
In-Reply-To: <20231207064900.3328723-1-bhanuprakash.modem@intel.com>
References: <20231207064900.3328723-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V6 06/10] tests/kms_vrr: Add a helper to get the
 low refresh mode
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
index db82cd008..f3cd18dcd 100644
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
