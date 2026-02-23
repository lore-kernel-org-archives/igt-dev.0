Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC61E98E0F
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 09:24:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA89810E2C4;
	Mon, 23 Feb 2026 09:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T3nQjbFf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D13CD10E2C4
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 09:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771838647; x=1803374647;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R6At9cnZtH1oZT14sB4kJv5g7NieqEsxLG1Zujo9jT8=;
 b=T3nQjbFfzj3joq3w8GsZJAM58Me6t4lGhBuR6N8uOMCJCGnt05xdHmHK
 X0wJZwicJvs7GrWREYRGN2hpfQjXgSUGD4pRZ2EO4edV21AEivkBzNxdz
 8ouu6FbdJz/LEPtd5sfjCOk30xervsmboYGTS9RrwB+jXwKwWda9B7piI
 o6XmOw3RF3CRldh8wYplR/QbiKdBPGn7jLls1PEDt0SB1fQ8QWoZpTOxx
 +AaifbSBBI6ckPx08EthkPaIWUUZPr+NL8ZnDYbuOTmlPzVFlxN26FVJV
 5FLBp203o8jbsVRCcFDFlhNK7wmlLmRTYe2nw1Es0e96XTAGqZ1SNs1n2 g==;
X-CSE-ConnectionGUID: +g/S9ip4TruiAEGQF7cxcg==
X-CSE-MsgGUID: NLy1gvbgRJqacOv4K5/A+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="75437925"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="75437925"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 01:24:07 -0800
X-CSE-ConnectionGUID: 3n8TA00eR4WHpeAgFC46NQ==
X-CSE-MsgGUID: +a+KsPKsRom+8i6+37wBjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="243687766"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa001.fm.intel.com with ESMTP; 23 Feb 2026 01:24:05 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t 1/2] lib/igt_kms: Add helper to get non-joiner mode
Date: Mon, 23 Feb 2026 15:04:42 +0530
Message-Id: <20260223093443.1797078-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260223093443.1797078-1-pranay.samala@intel.com>
References: <20260223093443.1797078-1-pranay.samala@intel.com>
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

Add igt_get_non_joiner_mode() helper function to find a suitable
display mode from an output that does not require Big Joiner or
Ultra Joiner support. This is useful for tests that want to avoid
joiner modes and use a single pipe configuration.

The function returns a pointer to the mode if found, or NULL if
all modes require joiner support.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 lib/igt_kms.c | 31 +++++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 32 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 5c4879604..107db512d 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6997,6 +6997,37 @@ bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
 	return found;
 }
 
+/**
+ * igt_get_non_joiner_mode:
+ * @drm_fd: drm file descriptor
+ * @output: pointer to the output structure
+ *
+ * Finds the display mode from the output that does not require
+ * Big Joiner or Ultra Joiner.
+ *
+ * Returns: Pointer to non-joiner mode, or NULL if not found.
+ */
+drmModeModeInfo *igt_get_non_joiner_mode(int drm_fd, igt_output_t *output)
+{
+	drmModeConnector *connector;
+	int max_dotclock;
+
+	connector = output->config.connector;
+	max_dotclock = igt_get_max_dotclock(drm_fd);
+
+	for (int i = 0; i < connector->count_modes; i++) {
+		drmModeModeInfo *current_mode = &connector->modes[i];
+
+		/* Check if mode requires joiner */
+		if (!igt_bigjoiner_possible(drm_fd, current_mode, max_dotclock) &&
+		    !igt_ultrajoiner_possible(drm_fd, current_mode, max_dotclock)) {
+			return current_mode;
+		}
+	}
+
+	return NULL;
+}
+
 /**
  * is_joiner_mode:
  * @drm_fd: drm file descriptor
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index dedc3f880..9a95e8e0a 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1285,6 +1285,7 @@ bool igt_is_joiner_enabled_for_pipe(int drmfd, enum pipe pipe);
 bool igt_ultrajoiner_possible(int drmfd, drmModeModeInfo *mode, int max_dotclock);
 bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
 			  int max_dotclock, drmModeModeInfo *mode);
+drmModeModeInfo *igt_get_non_joiner_mode(int drm_fd, igt_output_t *output);
 bool igt_has_force_joiner_debugfs(int drmfd, char *conn_name);
 bool is_joiner_mode(int drm_fd, igt_output_t *output);
 bool igt_check_force_joiner_status(int drmfd, char *connector_name);
-- 
2.34.1

