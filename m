Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696A1D6ACE2
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 11:04:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA1B10ED92;
	Thu, 18 Dec 2025 11:04:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MXTki4nq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D53910ED92
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 11:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766055848; x=1797591848;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KkG6b+3OLi0BzxGxJhWhc42/xKtxGwDVqDBUaBdNMjI=;
 b=MXTki4nq4nN/wmG/BVEKZTliQLzLLruxYr2Rt4NSF9Gv0ZMnK6Q860Is
 OMaBO+qw7CziuxpyGjztkxtvHTYYzsWEjv7aa6vcSEwfu+nQgYL9F7cLu
 kW7JsPcAO7MzNhmbneSSfZUkXtazf82kqRbKbEnng6L0FCtWy2wQkLjSV
 2PHI+PtBOZ4eGlmfzSRQ5c8GaBHdkhB5lhvUtQG8AV8pL3AzoIhl/045E
 JBlbIn0fj/5G1TN4Hnkq+SSV7iKXAO3hkq/W+WDb51fqgqNFWGKyrFHfv
 cRFkgKjjCn91kGG3Ndyx/zC+kUnv16UNa5iQZocGso3dcvcT63B+nhlLl g==;
X-CSE-ConnectionGUID: Ra5DBmePT2Cb5h73EFhy+g==
X-CSE-MsgGUID: X/PFiG2JQFCR3ehfcU7EQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="78644412"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="78644412"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 03:04:08 -0800
X-CSE-ConnectionGUID: xRO9h42PR5qXZLbnNqPoXA==
X-CSE-MsgGUID: 9xXd4QeDS2CZ3L8J73xa7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="198323088"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by orviesa009.jf.intel.com with ESMTP; 18 Dec 2025 03:04:06 -0800
From: S Sebinraj <s.sebinraj@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, krzysztof.karas@intel.com,
 kamil.konieczny@intel.com, S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH i-g-t v4] tools/gputop: Add GPU frequencies to the client
 headers
Date: Thu, 18 Dec 2025 16:13:03 +0530
Message-Id: <20251218104303.2268868-1-s.sebinraj@intel.com>
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
- Use IGT API functions (xe_sysfs_gt_path, igt_sysfs_gt_path) for
  driver-agnostic sysfs access

The frequency information helps users monitor GPU performance states
in real-time while observing client workload utilization.

Example output:
  DRM minor 0          Freq(cur/act) GT0-1800/1800 GT1-400/400
  DRM minor 128        Freq(cur/act) GT0-400/400 GT1-400/400

v2:
- To use macro to suffix strings
- To skip failure loops

v3:
- To keep error logs

v4:
- Removed RFC from Subject 

Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
Tested-by: Karas Krzysztof <krzysztof.karas@intel.com>
Reviewed-by: Karas Krzysztof <krzysztof.karas@intel.com>
---
 tools/gputop.c    | 119 +++++++++++++++++++++++++++++++++++++++++++++-
 tools/meson.build |   2 +-
 2 files changed, 119 insertions(+), 2 deletions(-)

diff --git a/tools/gputop.c b/tools/gputop.c
index f577a1750..d6b61a563 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -30,13 +30,20 @@
 #include "igt_drm_clients.h"
 #include "igt_drm_fdinfo.h"
 #include "igt_profiling.h"
+#include "igt_sysfs.h"
 #include "drmtest.h"
+#include "xe/xe_gt.h"
 
 enum utilization_type {
 	UTILIZATION_TYPE_ENGINE_TIME,
 	UTILIZATION_TYPE_TOTAL_CYCLES,
 };
 
+#define XE_FREQ_CUR_SUFFIX "/freq0/cur_freq"
+#define XE_FREQ_ACT_SUFFIX "/freq0/act_freq"
+#define I915_FREQ_CUR_SUFFIX "/rps_cur_freq_mhz"
+#define I915_FREQ_ACT_SUFFIX "/rps_act_freq_mhz"
+
 static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
 
 #define ANSI_HEADER "\033[7m"
@@ -76,17 +83,127 @@ static void print_percentage_bar(double percent, int max_len)
 	putchar('|');
 }
 
+static char *get_gt_frequencies(void)
+{
+	char freq_str[512] = "";
+	char gt_info[64];
+	int fd = -1;
+	int num_gts = 0;
+	int gt;
+	bool is_xe = false;
+	bool first = true;
+
+	fd = __drm_open_driver(DRIVER_INTEL | DRIVER_XE);
+	if (fd < 0) {
+		fprintf(stderr, "Failed to open DRM device\n");
+		return NULL;
+	}
+
+	/* Detect driver type and get GT count */
+	is_xe = is_xe_device(fd);
+	if (is_xe)
+		num_gts = xe_number_gt(fd);
+	else
+		num_gts = igt_sysfs_get_num_gt(fd);
+
+	if (num_gts <= 0) {
+		fprintf(stderr, "Failed to get GT count\n");
+		close(fd);
+		return NULL;
+	}
+
+	/* Read frequencies for each GT */
+	for (gt = 0; gt < num_gts; gt++) {
+		char gt_path[96];
+		char freq_path[128];
+		char freq_buf[32];
+		char *path_ptr;
+		unsigned int cur_freq = 0, act_freq = 0;
+		FILE *fp;
+
+		/* Get GT-specific sysfs path */
+		if (is_xe)
+			path_ptr = xe_sysfs_gt_path(fd, gt, gt_path, sizeof(gt_path));
+		else
+			path_ptr = igt_sysfs_gt_path(fd, gt, gt_path, sizeof(gt_path));
+
+		if (!path_ptr) {
+			fprintf(stderr, "Failed to get sysfs path for GT%d\n", gt);
+			continue;
+		}
+
+		/* Read current/requested frequency */
+		if (is_xe)
+			snprintf(freq_path, sizeof(freq_path), "%s%s", gt_path, XE_FREQ_CUR_SUFFIX);
+		else
+			snprintf(freq_path, sizeof(freq_path), "%s%s", gt_path, I915_FREQ_CUR_SUFFIX);
+
+		fp = fopen(freq_path, "r");
+		if (fp) {
+			if (fgets(freq_buf, sizeof(freq_buf), fp))
+				cur_freq = atoi(freq_buf);
+			fclose(fp);
+		} else {
+			fprintf(stderr, "Failed to open %s\n", freq_path);
+			continue;
+		}
+
+		/* Read actual frequency */
+		if (is_xe)
+			snprintf(freq_path, sizeof(freq_path), "%s%s", gt_path, XE_FREQ_ACT_SUFFIX);
+		else
+			snprintf(freq_path, sizeof(freq_path), "%s%s", gt_path, I915_FREQ_ACT_SUFFIX);
+
+		fp = fopen(freq_path, "r");
+		if (fp) {
+			if (fgets(freq_buf, sizeof(freq_buf), fp))
+				act_freq = atoi(freq_buf);
+			fclose(fp);
+		} else {
+			fprintf(stderr, "Failed to open %s\n", freq_path);
+			continue;
+		}
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
+	close(fd);
+
+	if (strlen(freq_str) > 0)
+		return strdup(freq_str);
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
+	freq_info = get_gt_frequencies();
+
+	if (freq_info) {
+		ret = printf("DRM minor %u          Freq(cur/act) %s", c->drm_minor, freq_info);
+		free(freq_info);
+	} else {
+		ret = printf("DRM minor %u", c->drm_minor);
+	}
+
 	n_spaces(con_w - ret);
 
 	if (lines++ >= con_h)
diff --git a/tools/meson.build b/tools/meson.build
index 8185ba160..d3261d429 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -73,7 +73,7 @@ endif
 executable('gputop', 'gputop.c',
            install : true,
            install_rpath : bindir_rpathdir,
-           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math])
+           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,tool_deps,math])
 
 intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
 executable('intel_l3_parity', sources : intel_l3_parity_src,
-- 
2.43.0

