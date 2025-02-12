Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B18C02198
	for <igt-dev@archiver.kernel.org>; Wed, 12 Feb 2025 07:20:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 559FB10E7C9;
	Wed, 12 Feb 2025 07:20:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DSiYFz9S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C293410E7C9
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2025 07:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739344833; x=1770880833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zo8beyqWPQmF6Y1scDVd98u2eSZ7UGm3aHRBNm10ptQ=;
 b=DSiYFz9SIAeCbhPpy9Ar6SrWb8iBaOgAiRr+iulmGZnMwd0Cx97/5+Nv
 /n6Xb2UVl9z1BircuNsq1mCyrVTIkZYWDWgl5BsnfdU8Od8/aaOylwLvt
 Sbn8EY7lpnKm1rWJuV2CmXSsw5FOTuQkBIQTIiCZFRN0ahRjOqMBxmyc4
 gVtNy2zF7TTFbh9UDjSwrosrZpk0KN7zOKDif4qmKjdTauFkEstCpZj2d
 vKHfgUkTEeWGf7OmFXYYN/oHqYfhTfcdWT86o2hP+rMQAIlr7Vuwncy1h
 cZAEZN+NDv2LWFqrzVhzgfDBdmTYxxPSVRpY1Pfs1o1ZOZKyjMdOcOfiI A==;
X-CSE-ConnectionGUID: mbEPQFoeSvGdBvE3gq1JQw==
X-CSE-MsgGUID: IVwf5tUkSPavoSbNiHxcNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="27586582"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="27586582"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 23:20:33 -0800
X-CSE-ConnectionGUID: bxOY2DQhQLauxAKcVc4lQg==
X-CSE-MsgGUID: pfQjQZxSQ6WY30FVAlmv5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112596778"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 23:20:31 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/3] lib/igt_kms: Add support to check joiner mode limit
Date: Wed, 12 Feb 2025 13:06:03 +0530
Message-Id: <20250212073604.1580120-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250212073604.1580120-1-jeevan.b@intel.com>
References: <20250212073604.1580120-1-jeevan.b@intel.com>
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

Added library changes to find the highest non-joiner mode.
This helps to get the mode that does not require a big joiner.

v2: Update commit message, create a new library function
    to get max hdisplay and fix condtion for selecting mode.
v3: Update function name.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_kms.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  2 ++
 2 files changed, 47 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 3caba7d77..e1a74a3ee 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6406,6 +6406,51 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 	return found;
 }
 
+/**
+ * get_max_hdisplay:
+ * @drm_fd: drm file descriptor
+ *
+ * Returns: The maximum hdisplay supported per pipe.
+ */
+static int get_max_hdisplay(int drm_fd)
+{
+	int dev_id = intel_get_drm_devid(drm_fd);
+
+	return (intel_display_ver(dev_id) >= 30) ? HDISPLAY_6K_PER_PIPE :
+						   HDISPLAY_5K_PER_PIPE;
+}
+
+/**
+ * max_non_joiner_mode_found:
+ * @drm_fd: drm file descriptor
+ * @connector: libdrm connector
+ * @max_dot_clock: max dot clock frequency
+ * @mode: libdrm mode to be filled
+ *
+ * Finds the highest possible display mode that does
+ * not require a big joiner.
+ *
+ * Returns: True if a valid non-joiner mode is found,
+ * false otherwise.
+ */
+bool max_non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
+			   int max_dotclock, drmModeModeInfo *mode)
+{
+	int max_hdisplay = get_max_hdisplay(drm_fd);
+
+	for (int i = 0; i < connector->count_modes; i++) {
+		drmModeModeInfo *current_mode = &connector->modes[i];
+
+		if (current_mode->hdisplay == max_hdisplay &&
+		    current_mode->clock < max_dotclock) {
+			*mode = *current_mode;
+			return true;
+		}
+	}
+
+	return false;
+}
+
 /**
  * igt_is_joiner_enabled_for_pipe:
  * @drmfd: A drm file descriptor
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 1cfacf87d..7227f0b0e 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1245,6 +1245,8 @@ int igt_get_max_dotclock(int fd);
 bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock);
 bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 			  int max_dotclock, drmModeModeInfo *mode);
+bool max_non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
+			       int max_dotclock, drmModeModeInfo *mode);
 bool igt_is_joiner_enabled_for_pipe(int drmfd, enum pipe pipe);
 bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock);
 bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
-- 
2.25.1

