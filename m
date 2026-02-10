Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E76BEA812D
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 15:24:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D159010E5AD;
	Tue, 10 Feb 2026 15:24:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RElIDlDr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B22C10E5AE
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 15:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770737068; x=1802273068;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+g3skLk5fgkeI/A1CNhBSiJ+5/tSWBvf1WvN37rFg5w=;
 b=RElIDlDrHbiylqkBkfUphPxk4Si09cXB1YjB/gQ5Ayu09y8VD70qRMLq
 k1Yk3Tl+GZuJNVWPFINKaH+9j1IKioq4OaOvT+245Jm0mWtVUZ65vXYE/
 Mc16ZDD1WDSjyN6mKh4bHQJUdCQ3OdFbMI6X2b5PoXRmd/Gtnkobh3pmw
 x/4pjEXLaZBX0gIif+rm90bDpaBFRF9Uvwb43QsdgXQGfhKGSKGyk1iv5
 dwUnCJoPOkDun58HNsd3jyz3LS6hQG8sSyMBijwpABT14aukkxWnxShzU
 7O75qRSKcxiGrVTgQcBrpZDbIoCRyFOQB54KxBd2jajvm7YhITFzE+two g==;
X-CSE-ConnectionGUID: HfOCQnO/SW+qKZ8YQ2xVVw==
X-CSE-MsgGUID: SHpn+qxdRL+DVrZFPZ6JPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="75491812"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="75491812"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 07:24:26 -0800
X-CSE-ConnectionGUID: YWBpOKjFRZKVSl35LArDhA==
X-CSE-MsgGUID: MYsgbRi2SKqfZbSGNqI26w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211434429"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.246])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 07:24:23 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 02/11] lib/igt_kms: rename the rest of crtc_offset to
 crtc_index
Date: Tue, 10 Feb 2026 17:23:43 +0200
Message-ID: <32eabad05990fcf78addb7fcb60d6735c318f936.1770736961.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770736961.git.jani.nikula@intel.com>
References: <cover.1770736961.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

The CRTC index is more accurate, and prevailing.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.c | 15 ++++++++-------
 lib/igt_kms.h |  2 +-
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index d6b47f55ea6c..b6b8fb7cd938 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5827,13 +5827,13 @@ void igt_output_set_writeback_fb(igt_output_t *output, struct igt_fb *fb)
 					  (ptrdiff_t)&output->writeback_out_fence_fd);
 }
 
-static int __igt_vblank_wait(int drm_fd, int crtc_offset, int count)
+static int __igt_vblank_wait(int drm_fd, int crtc_index, int count)
 {
 	drmVBlank wait_vbl;
 	uint32_t pipe_id_flag;
 
 	memset(&wait_vbl, 0, sizeof(wait_vbl));
-	pipe_id_flag = kmstest_get_vbl_flag(crtc_offset);
+	pipe_id_flag = kmstest_get_vbl_flag(crtc_index);
 
 	wait_vbl.request.type = DRM_VBLANK_RELATIVE | pipe_id_flag;
 	wait_vbl.request.sequence = count;
@@ -6115,17 +6115,18 @@ void igt_cleanup_uevents(struct udev_monitor *mon)
 
 /**
  * kmstest_get_vbl_flag:
- * @crtc_offset: CRTC offset to convert into pipe flag representation.
+ * @crtc_index: CRTC index to convert into DRM_IOCTL_WAIT_VBLANK parameter
  *
- * Convert an offset of an crtc in drmModeRes.crtcs into flag representation
+ * Convert a CRTC index (of a CRTC in drmModeRes.crtcs) into flag representation
  * expected by DRM_IOCTL_WAIT_VBLANK.
- * See #igt_wait_for_vblank_count for details
+ *
+ * See #igt_wait_for_vblank_count for details.
  */
-uint32_t kmstest_get_vbl_flag(int crtc_offset)
+uint32_t kmstest_get_vbl_flag(int crtc_index)
 {
 	uint32_t flag;
 
-	flag = crtc_offset << DRM_VBLANK_HIGH_CRTC_SHIFT;
+	flag = crtc_index << DRM_VBLANK_HIGH_CRTC_SHIFT;
 
 	igt_assert_eq(flag & ~DRM_VBLANK_HIGH_CRTC_MASK, 0);
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 087a4fed79f3..4ff10d9149a2 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1144,7 +1144,7 @@ void igt_crtc_refresh(igt_crtc_t *crtc, bool force);
 void igt_enable_connectors(int drm_fd);
 void igt_reset_connectors(void);
 
-uint32_t kmstest_get_vbl_flag(int crtc_offset);
+uint32_t kmstest_get_vbl_flag(int crtc_index);
 
 const struct edid *igt_kms_get_base_edid(void);
 const struct edid *igt_kms_get_full_edid(void);
-- 
2.47.3

