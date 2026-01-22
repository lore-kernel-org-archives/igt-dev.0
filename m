Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF06C44500
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 11:05:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C09B510E02A;
	Thu, 22 Jan 2026 11:05:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cCdgPvLb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C4510E97A
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 11:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769079924; x=1800615924;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3nrB8Qsy6UbXFOJcOISHyCG6V4ucYmSzQRNyhTwiCpE=;
 b=cCdgPvLbnweKeuO23d1LHRb6XmUtmMTlp0ilxWV01GgOCIEc8VHlqTr3
 v/3BwiNpCUATo7ZFZYqATE41MXsKqIh4YGQOv4VfIcuBzJ/kQQwqB93kN
 s9O64ms8KkvTvReVbbe2hpfVX08xXCHPqZNsBKgwGqc6ujXSgbtWD2cGa
 V1pgXU40r13OHEsV8oSJmtThgJEa4juS7miQAJEFf6EhiMHBrCFfftDfV
 tYS7TOGgTH0hm1cvp7BOW4AFCTZc7dOga1/SQF98VeCOqBc35S56qTGwM
 dv7idwDGIVmImR3b9R/Ckp7vQ4X+3txTRjllrCT5XfHdpXVLGyRUe7Vt0 Q==;
X-CSE-ConnectionGUID: 4qK0NNdASvCs4oEaPZwMOg==
X-CSE-MsgGUID: OoLsNzjeR3OziKfhi9ktPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="87896084"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="87896084"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 03:05:24 -0800
X-CSE-ConnectionGUID: X5zEcYZ1RduVRYMOjsCDQQ==
X-CSE-MsgGUID: mNwwDj/RR2yzMqtq4iimYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="237375543"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 03:05:22 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, sameer.lattannavar@intel.com,
 louis.chauvet@bootlin.com, Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t v5 2/5] lib/igt_kms: Add helper to wait for a specific
 status on a connector
Date: Thu, 22 Jan 2026 16:33:57 +0530
Message-ID: <20260122110400.330188-3-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260122110400.330188-1-mohammed.bilal@intel.com>
References: <20260122110400.330188-1-mohammed.bilal@intel.com>
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

From: Louis Chauvet <louis.chauvet@bootlin.com>

During testing with chamelium, it is frequent to wait for a specific
connector status. This new helper is polling the DRM API to wait for this
status. This allows detecting it without notifier systems which can fail
if hot plug detection is not working properly on the device under test.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 lib/igt_kms.c | 39 +++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  3 +++
 2 files changed, 42 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 897b7fc70..4eb3355c6 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -8023,3 +8023,42 @@ double igt_default_display_detect_timeout(void)
 
 	return timeout;
 }
+
+/**
+ * igt_wait_for_connector_status:
+ * @drm_fd: drm file descriptor
+ * @connector_id: connector to monitor
+ * @timeout: maximum duration to wait, in second. Use -1.0 to set the timeout
+ *           to igt_default_detect_timeout().
+ * @drm_mode: mode to wait for, see enum drmModeConnection
+ *
+ * Wait for at most @timeout that the connector @connector_id  status
+ * become @drm_mode
+ * Returns: true when the status is reached, false if there is a timeout
+ */
+bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
+				   int drm_mode)
+{
+	drmModeConnector *connector;
+	struct timespec start, end;
+
+	if (timeout == -1.0)
+		timeout = igt_default_display_detect_timeout();
+
+	clock_gettime(CLOCK_MONOTONIC, &start);
+	end = start;
+
+	while (igt_time_elapsed(&start, &end) <= timeout) {
+		connector = drmModeGetConnector(drm_fd, connector_id);
+		if (connector && connector->connection == drm_mode) {
+			free(connector);
+			return true;
+		}
+		free(connector);
+		clock_gettime(CLOCK_MONOTONIC, &end);
+	}
+
+	igt_debug("Timeout waiting for connection status %d on connector %d\n", drm_mode,
+		  connector_id);
+	return false;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 1347cf355..c95394034 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1313,4 +1313,7 @@ igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
 
 double igt_default_display_detect_timeout(void);
 
+bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
+				   int drm_mode);
+
 #endif /* __IGT_KMS_H__ */
-- 
2.48.1

