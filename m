Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD04CD98F8
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 04:35:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3520B10EBCF;
	Thu, 18 Jun 2026 04:35:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K9kXyEqZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B04910EBCF
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 04:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781757279; x=1813293279;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LQUU2mNGS0OFt0Vkm8hvOBbQX50G68zCmx0jBmGXyQ4=;
 b=K9kXyEqZ0qVz1acwsRNjfUPW915h3aQZDRx14yTVQGopJj+CW7xz9Xp0
 dbeiyTWhzv1U980nUR/s04hDEYB6O2v4+Nag8mf3HSbhjgeiAmdHa4RBh
 JVxgWAvV0lJhdqD5nppyc8SIARl+uSchotfaqCZT0xZmdXOE0y5fNi3Jt
 f7g2qVFxrR2kjifNzxHHg6T8QDi9+wWKz8y1Q1NULLS1/NdX07Yx5Jl3a
 SN4+mdNav1qA6xe7FILFU74dkB8wm5FJwj5hJrH6qpFRDAl/YxQTkgJON
 vx81AylfEMtyyfz/Th1hbFrUugJPDI18Nf8o9iCnpvJtCivCtqE6EgPDH Q==;
X-CSE-ConnectionGUID: MmlW11xcRLaUw8oMj1HR2w==
X-CSE-MsgGUID: g3lc/qZeTXGtN9iJ3N9lyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="93694400"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="93694400"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 21:34:39 -0700
X-CSE-ConnectionGUID: qblz6RvZS6KEpY0R3TqlRg==
X-CSE-MsgGUID: cxT+YuVHTmetDzDvlnkk/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="250144331"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 21:34:37 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/kms_dsc: Ensure non-joiner modes on non-joiner
 subtests
Date: Thu, 18 Jun 2026 10:00:55 +0530
Message-ID: <20260618043055.2998900-1-karthik.b.s@intel.com>
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

Ensure non-joiner subtests always pick non-joiner modes while iterating
output-format modes. This prevents accidental natural joiner selection
and avoids failures on the last pipe.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16368
Fixes: 86679142531b ("tests/intel/kms_dsc: Add force dsc and joiner variants")

Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/intel/kms_dsc.c           | 4 ++++
 tests/intel/kms_joiner_helper.c | 8 ++++++++
 tests/intel/kms_joiner_helper.h | 1 +
 3 files changed, 13 insertions(+)

diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index 3687e795d..8161bf7da 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -251,6 +251,10 @@ static void update_display(data_t *data, uint32_t test_type)
 		if (data->output_format != DSC_FORMAT_RGB)
 			mode = get_next_mode(output, index++);
 
+		if (mode && data->force_joined_pipes == JOINED_PIPES_DEFAULT &&
+		    intel_mode_needs_joiner(data->drm_fd, mode))
+			continue;
+
 		if (mode == NULL)
 			goto reset;
 
diff --git a/tests/intel/kms_joiner_helper.c b/tests/intel/kms_joiner_helper.c
index cd7fe86bf..da0ac7f62 100644
--- a/tests/intel/kms_joiner_helper.c
+++ b/tests/intel/kms_joiner_helper.c
@@ -225,6 +225,14 @@ bool intel_max_hdisplay_non_joiner_mode_found(int drm_fd, drmModeConnector *conn
 	return found;
 }
 
+bool intel_mode_needs_joiner(int drm_fd, drmModeModeInfo *mode)
+{
+	int max_dotclock = igt_get_max_dotclock(drm_fd);
+
+	return igt_bigjoiner_possible(drm_fd, mode, max_dotclock) ||
+	       igt_ultrajoiner_possible(drm_fd, mode, max_dotclock);
+}
+
 /**
  * igt_is_joiner_supported_by_source:
  * @drm_fd: drm file descriptor
diff --git a/tests/intel/kms_joiner_helper.h b/tests/intel/kms_joiner_helper.h
index 692dab022..a0ab75b2c 100644
--- a/tests/intel/kms_joiner_helper.h
+++ b/tests/intel/kms_joiner_helper.h
@@ -20,6 +20,7 @@ bool igt_assign_pipes_for_outputs(int drm_fd,
 				  uint32_t valid_pipes_mask);
 bool intel_max_hdisplay_non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
 					      int max_dotclock, drmModeModeInfo *mode);
+bool intel_mode_needs_joiner(int drm_fd, drmModeModeInfo *mode);
 bool igt_is_joiner_supported_by_source(int drm_fd, enum joined_pipes joiner_type);
 const char *igt_get_joined_pipes_name(enum joined_pipes val);
 
-- 
2.43.0

