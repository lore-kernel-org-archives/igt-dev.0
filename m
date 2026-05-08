Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFA6CD342F
	for <igt-dev@archiver.kernel.org>; Fri,  8 May 2026 05:10:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DEC810E5BA;
	Fri,  8 May 2026 05:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bjUk6iW9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2069310E5BA
 for <igt-dev@lists.freedesktop.org>; Fri,  8 May 2026 05:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778217029; x=1809753029;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UYBMmI+ozNb6jRSSXbg/f6TEDBRqHGpLL8gYBsAM8Xg=;
 b=bjUk6iW93LChmUIQvrPVfKJmZVc2QaKmrN/uFUjRc8PGCeZCKfgK/+Nf
 Bn25qxgAXfwc8+0pm2tMafa95gAwh/wunQ4cJ/uHfnqUlcoSSs1cX1/zX
 LhCwkSoFsB0rJAu+Dt19cvMAyKhccPsA7HHyUrfTJmoBoDu+vqnyv4KKx
 mEtKZVtDgEw9aUzcnTyYmli74ZzdmYdlnaXw+Tkc2iZoZtitoSStOuoRL
 KfIBkTB6wNlOKY+MJnHiEgoy3FVatgsY8rTSCQq2X18ckPGImtn6juubv
 rnta/Dswup9ffci53asVRCdvfkDKJF7GeCGtTuQW+B6SZ+DMfccn8XVHt g==;
X-CSE-ConnectionGUID: OCNg4hzYRcCetK+Ag+Uarg==
X-CSE-MsgGUID: reWv135ASRaoFlNk8iwRXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79197653"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="79197653"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 22:10:28 -0700
X-CSE-ConnectionGUID: 3n+0dhgYTP23w+L1ZnKnBA==
X-CSE-MsgGUID: 9jZZFAl3SFOonsPqn/TFgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="240656059"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 22:10:26 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, kunal1.joshi@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1] tests/intel/kms_pipe_stress: retry connectors with
 no modes and skip unusable pipes
Date: Fri,  8 May 2026 11:01:51 +0530
Message-ID: <20260508053151.3141169-1-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

Retry connectors with no probed modes up to 3 times (100ms intervals).
Skip connectors/pipes that remain unusable and clear connector entries.
Log skips using connector names (e.g. DP-5) to aid debugging.
Keep downstream state consistent so framebuffers/threads skip invalid pipes.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/intel/kms_pipe_stress.c | 67 ++++++++++++++++++++++++++++++-----
 1 file changed, 58 insertions(+), 9 deletions(-)

diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index 36e3842c6..1dc65b73c 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -15,6 +15,7 @@
 #include <string.h>
 #include <time.h>
 #include <poll.h>
+#include <unistd.h>
 #include <pthread.h>
 #include <semaphore.h>
 #include "i915/gem.h"
@@ -603,6 +604,7 @@ static void stress_pipes(struct data *data, struct timespec *start,
 
 #define MIN_DURATION_SEC 5.0
 #define MIN_ITERATIONS (igt_run_in_simulation() ? 5 : 20)
+#define MST_MODE_RETRY_COUNT 3
 
 static void stress(struct data *data)
 {
@@ -763,6 +765,7 @@ static void prepare_test(struct data *data)
 	int i, j;
 	int num_connectors;
 	int num_cpus = (int) sysconf(_SC_NPROCESSORS_ONLN);
+	bool any_pipe = false;
 
 	data->number_of_cores = min(num_cpus, MAX_CORES);
 
@@ -792,26 +795,62 @@ static void prepare_test(struct data *data)
 	for (i = 0; i < IGT_MAX_PIPES; i++) {
 		drmModeConnector *connector = (drmModeConnector *)data->connectors[i];
 		igt_crtc_t *crtc;
+		int retry;
 
 		if (!connector)
 			continue;
 
+		/*
+		 * MST connectors may appear connected before modes are
+		 * populated (HPD/topology settling).  Retry a few times
+		 * before giving up on this pipe.
+		 */
+		if (!connector->count_modes) {
+			uint32_t conn_id = connector->connector_id;
+
+			for (retry = 0; retry < MST_MODE_RETRY_COUNT; retry++) {
+				igt_info("Connector %s-%d has no modes yet "
+					 "(attempt %d/%d), retrying...\n",
+					 kmstest_connector_type_str(connector->connector_type),
+					 connector->connector_type_id,
+					 retry + 1, MST_MODE_RETRY_COUNT);
+				usleep(100 * 1000); /* 100 ms */
+				drmModeFreeConnector(connector);
+				connector = drmModeGetConnector(data->drm_fd, conn_id);
+				if (!connector)
+					break;
+				data->connectors[i] = connector;
+				if (connector->count_modes)
+					break;
+			}
+		}
+
+		if (!connector || connector->connection != DRM_MODE_CONNECTED ||
+		    !connector->count_modes) {
+			if (connector)
+				igt_info("Skipping connector %s-%d: not ready or no usable modes\n",
+					 kmstest_connector_type_str(connector->connector_type),
+					 connector->connector_type_id);
+			data->connectors[i] = NULL;
+			continue;
+		}
+
+		data->highest_mode[i] = find_highest_mode(connector);
 		if (!data->highest_mode[i]) {
-			if (connector->count_modes)
-				data->highest_mode[i] = find_highest_mode(connector);
+			igt_info("Connector %s-%d: find_highest_mode returned NULL, skipping\n",
+				 kmstest_connector_type_str(connector->connector_type),
+				 connector->connector_type_id);
+			data->connectors[i] = NULL;
+			continue;
 		}
-		igt_assert(data->highest_mode[i]);
 
 		crtc = igt_crtc_for_pipe(display, i);
 		if (!crtc)
 			continue;
 
-		if (data->highest_mode[i]) {
-			igt_info("Using mode: \n");
-			kmstest_dump_mode(data->highest_mode[i]);
-			data->pipe_crc[i] = igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
-		} else
-			data->pipe_crc[i] = NULL;
+		igt_info("Using mode:\n");
+		kmstest_dump_mode(data->highest_mode[i]);
+		data->pipe_crc[i] = igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
 
 		if (data->num_planes[i] == -1)
 			data->num_planes[i] = crtc->n_planes;
@@ -820,6 +859,16 @@ static void prepare_test(struct data *data)
 			 data->num_planes[i], i);
 	}
 
+	for (i = 0; i < IGT_MAX_PIPES; i++) {
+		if (data->highest_mode[i]) {
+			any_pipe = true;
+			break;
+		}
+		igt_require_f(any_pipe,
+			      "No pipes with usable display modes found "
+			      "(MST topology may still be settling)\n");
+	}
+
 	create_framebuffers(data);
 
 	if (intel_gen(intel_get_drm_devid(data->drm_fd)) > 9)
-- 
2.43.0

