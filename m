Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91514E7E0C0
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 10:29:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F4E10E3C1;
	Mon,  9 Feb 2026 10:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gA0qiD7v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E197210E3C1
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 10:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770632978; x=1802168978;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DnG+QtSVVCkQ/aX4uaIMQlOXhq5p7erZ473yf2nwBpM=;
 b=gA0qiD7v+qnIFiNgyFHBCp1zuiewj6Bai7/85+6Y11Xc1zn5GAg7Eit6
 cXa+7rPynbK6cBSHgm+2N4nNcquDd363cEExebJD4Cy2e6AgGc2OxFS5L
 rjswrKzscromTKhYhB5lELsUIgLHTIczy3mqjukQebgvD3PoCitWB0Dxj
 NJ/nUjS+XaowzQPHQx/RZsqoFIklwXKkAmrkLTTTurc7KULUOHAg+Aqsh
 /ak8QDTqma2OPRFPlitYLiAxqTpaeHRY2vMkVDUEsegkSHdmPWCEFBLOm
 BNFdWxKq6VFJ+6FY7lbBPthgVUWWrXLEsuRgcOd6gP3hxVl86ejvowhpf Q==;
X-CSE-ConnectionGUID: rJbY37PKRnq6T91O5/3Y6w==
X-CSE-MsgGUID: nF8cfrT7RyikTxY+I22IVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="71805980"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="71805980"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 02:29:37 -0800
X-CSE-ConnectionGUID: JMrYtugBSBa+OArYwfgEtA==
X-CSE-MsgGUID: 3K6RVSZrSEO6T53R2mEuEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="211610957"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by orviesa007.jf.intel.com with ESMTP; 09 Feb 2026 02:29:35 -0800
From: S Sebinraj <s.sebinraj@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, krzysztof.karas@intel.com,
 kamil.konieczny@intel.com, zbigniew.kempczynski@intel.com,
 soham.purkait@intel.com, S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH i-g-t v8] tools/gputop: Add GPU frequencies to the client
 headers
Date: Mon,  9 Feb 2026 15:48:35 +0530
Message-Id: <20260209101835.3899129-1-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Enhance gputop to display GPU frequency information (current/actual)
for each GT in the client header line alongside the DRM minor number.

Key changes:
- Add get_gt_frequencies() function to read GT frequency values
- Support both i915 and Xe drivers using appropriate sysfs paths
- Display format: "DRM minor X  Freq(cur/act) GT0-freq/freq GT1-freq/freq"
- Driver-agnostic sysfs access

The frequency information helps users monitor GPU performance states
in real-time while observing client workload utilization.

Example output:
  DRM minor 0   Frequency GT0-1800/1800 GT1-400/400
  DRM minor 128   Frequency GT0-400/400 GT1-400/400

v2:
- To use macro to suffix strings
- To skip failure loops

v3:
- To keep error logs

v4:
- Removed RFC from Subject

v5:
- Fallback to normal sysfs read instead of using lib api's
  as it increased the dependencies highly

v6:
- Remove driver specific logging
- Change function name to this regard

v7:
- Move intel specific code away from generic funcs
- Add func to check which driver is bound
- Space correction in strings

v8:
- Correct code for driver identification
  by adding a function for sysfs prefix

Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
---
 tools/gputop.c | 197 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 195 insertions(+), 2 deletions(-)

diff --git a/tools/gputop.c b/tools/gputop.c
index f577a1750..573407b7c 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -30,13 +30,20 @@
 #include "igt_drm_clients.h"
 #include "igt_drm_fdinfo.h"
 #include "igt_profiling.h"
-#include "drmtest.h"
 
 enum utilization_type {
 	UTILIZATION_TYPE_ENGINE_TIME,
 	UTILIZATION_TYPE_TOTAL_CYCLES,
 };
 
+enum intel_driver_type {
+	INTEL_DRIVER_I915,
+	INTEL_DRIVER_XE,
+	INTEL_DRIVER_UNKNOWN,
+};
+
+#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
+
 static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
 
 #define ANSI_HEADER "\033[7m"
@@ -76,17 +83,203 @@ static void print_percentage_bar(double percent, int max_len)
 	putchar('|');
 }
 
+/* Get the correct sysfs prefix based on DRM minor number */
+static const char *get_sysfs_drm_path(unsigned int drm_minor)
+{
+	return drm_minor >= 128 ? "/sys/class/drm/renderD" : "/sys/class/drm/card";
+}
+
+/* Detect which driver is bound to the device */
+static bool is_driver(unsigned int drm_minor, const char *driver_name)
+{
+	char path[256];
+	char link[256];
+	char *driver;
+	ssize_t len;
+
+	/* Read the driver symlink */
+	snprintf(path, sizeof(path), "%s%u/device/driver", 
+		 get_sysfs_drm_path(drm_minor), drm_minor);
+	len = readlink(path, link, sizeof(link) - 1);
+	if (len == -1)
+		return false;
+
+	link[len] = '\0';
+
+	/* Extract driver name from path (e.g., "bus/pci/drivers/i915" -> "i915") */
+	driver = strrchr(link, '/');
+	if (!driver)
+		return false;
+
+	driver++; /* Skip the '/' */
+	
+	return strcmp(driver, driver_name) == 0;
+}
+
+/* Detect if this is an Intel device (i915 or Xe) */
+static bool is_intel_device(unsigned int drm_minor)
+{
+	return is_driver(drm_minor, "i915") || is_driver(drm_minor, "xe");
+}
+
+/* Detect Intel driver variant */
+static enum intel_driver_type detect_intel_driver(unsigned int drm_minor)
+{
+	if (is_driver(drm_minor, "xe"))
+		return INTEL_DRIVER_XE;
+	else if (is_driver(drm_minor, "i915"))
+		return INTEL_DRIVER_I915;
+
+	return INTEL_DRIVER_UNKNOWN;
+}
+
+/* Count the number of GTs by checking which gt* directories exist */
+static int get_num_gts(unsigned int drm_minor, enum intel_driver_type driver_type)
+{
+	char path[256];
+	struct stat st;
+	int gt_count = 0;
+
+	/* Check for gt0, gt1, gt2, etc. up to a reasonable maximum */
+	for (int i = 0; i < 8; i++) {
+		if (driver_type == INTEL_DRIVER_XE)
+			/* For Xe, all GTs are under tile0 */
+			snprintf(path, sizeof(path), "%s%u/device/tile0/gt%d",
+				 get_sysfs_drm_path(drm_minor), drm_minor, i);
+		else /* i915 */
+			snprintf(path, sizeof(path), "%s%u/gt/gt%d",
+				 get_sysfs_drm_path(drm_minor), drm_minor, i);
+
+		if (stat(path, &st) == 0 && S_ISDIR(st.st_mode))
+			gt_count++;
+		else
+			break;  /* Assume GTs are numbered sequentially */
+	}
+
+	return gt_count > 0 ? gt_count : 1;  /* At least 1 GT should exist */
+}
+
+/* Read a single frequency value from sysfs */
+static bool read_freq_value(const char *path, unsigned int *freq)
+{
+	FILE *fp;
+	char buf[32];
+	bool success = false;
+
+	fp = fopen(path, "r");
+	if (fp) {
+		if (fgets(buf, sizeof(buf), fp)) {
+			*freq = atoi(buf);
+			success = true;
+		}
+		fclose(fp);
+	}
+
+	return success;
+}
+
+/* Intel-specific frequency reading for i915/Xe drivers */
+static char *get_intel_frequencies(unsigned int drm_minor)
+{
+	char freq_str[512] = "";
+	char gt_info[64];
+	int num_gts;
+	int gt;
+	enum intel_driver_type driver_type;
+	bool first = true;
+
+	/* Detect Intel driver variant */
+	driver_type = detect_intel_driver(drm_minor);
+	if (driver_type == INTEL_DRIVER_UNKNOWN)
+		return NULL;
+
+	/* Get GT count from sysfs */
+	num_gts = get_num_gts(drm_minor, driver_type);
+	if (num_gts <= 0)
+		return NULL;
+
+	/* Read frequencies for each GT */
+	for (gt = 0; gt < num_gts; gt++) {
+		char freq_path[256];
+		unsigned int cur_freq = 0, act_freq = 0;
+		bool has_cur = false, has_act = false;
+
+		/* Read current/requested frequency */
+		if (driver_type == INTEL_DRIVER_XE)
+			snprintf(freq_path, sizeof(freq_path),
+				 "%s%u/device/tile0/gt%d/freq0/cur_freq",
+				 get_sysfs_drm_path(drm_minor), drm_minor, gt);
+		else /* i915 */
+			snprintf(freq_path, sizeof(freq_path),
+				 "%s%u/gt/gt%d/rps_cur_freq_mhz",
+				 get_sysfs_drm_path(drm_minor), drm_minor, gt);
+
+		has_cur = read_freq_value(freq_path, &cur_freq);
+
+		/* Read actual frequency */
+		if (driver_type == INTEL_DRIVER_XE)
+			snprintf(freq_path, sizeof(freq_path),
+				 "%s%u/device/tile0/gt%d/freq0/act_freq",
+				 get_sysfs_drm_path(drm_minor), drm_minor, gt);
+		else /* i915 */
+			snprintf(freq_path, sizeof(freq_path),
+				 "%s%u/gt/gt%d/rps_act_freq_mhz",
+				 get_sysfs_drm_path(drm_minor), drm_minor, gt);
+
+		has_act = read_freq_value(freq_path, &act_freq);
+
+		/* Skip this GT if we couldn't read any frequency */
+		if (!has_cur && !has_act)
+			continue;
+
+		/* Append to frequency string */
+		if (!first)
+			strcat(freq_str, " ");
+		else
+			first = false;
+
+		snprintf(gt_info, sizeof(gt_info), "GT%d-%u/%u", gt, cur_freq, act_freq);
+		strcat(freq_str, gt_info);
+	}
+
+	if (strlen(freq_str) > 0)
+		return strdup(freq_str);
+
+	return NULL;
+}
+
+/* Generic wrapper for frequency reading - dispatches to vendor-specific implementations */
+static char *get_frequencies(unsigned int drm_minor)
+{
+	/* Check for Intel devices (i915/Xe) */
+	if (is_intel_device(drm_minor))
+		return get_intel_frequencies(drm_minor);
+
+	return NULL;
+}
+
 static int
 print_client_header(struct igt_drm_client *c, int lines, int con_w, int con_h,
 		    int *engine_w)
 {
 	int ret, len;
+	char *freq_info = NULL;
 
 	if (lines++ >= con_h)
 		return lines;
 
 	printf(ANSI_HEADER);
-	ret = printf("DRM minor %u", c->drm_minor);
+
+	/* Get frequency information */
+	freq_info = get_frequencies(c->drm_minor);
+
+	if (freq_info) {
+		ret = printf("DRM minor %u   Frequency(MHz) %s", c->drm_minor, freq_info);
+		free(freq_info);
+	} else {
+		ret = printf("DRM minor %u", c->drm_minor);
+	}
+
 	n_spaces(con_w - ret);
 
 	if (lines++ >= con_h)
-- 
2.43.0

