Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552B1C83F1A
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 14:55:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073FB10E49A;
	Mon, 14 Jul 2025 14:55:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZYXnaoxa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF57D10E49A
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 14:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752504943; x=1784040943;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5Tl8clgSDpMYgovIrDObtc/KpSURNK4TdtX8hErlDVQ=;
 b=ZYXnaoxaruLwM3fMugv6URS6Vp0smJd5gupx4iAkjcS5wcenYRYpG2cV
 BNEuh7V2FBhOIrMN/x4irumRJ8sP4P7SQpU818/WMgofeWMHIn5wRn9EJ
 m3cqWMX7ZEEEEQ7NkSR4pV35ZYzV5pvuTSV22omDgfizqY+kS6xfbbKyM
 xbgIRvYTL0Oa5FCl7P30tfnh6yA+0yDazyve6NBm/LtVk7IyMpHPYYI+z
 bFr0stc+XR/kB6c5KIMKbFc+sAOUi7LuOPA4i7O4WV8oghIvP7uJU4wqH
 9ueTjP4b90gAsYxvoOzBUl8ICDbxb+L4tO1HSVcgB+svYWHppML1wbVvQ A==;
X-CSE-ConnectionGUID: bCviH4acQAKwae56zRAuhg==
X-CSE-MsgGUID: y9+EBDo6R020XcKu/W378A==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="53809954"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="53809954"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 07:55:43 -0700
X-CSE-ConnectionGUID: dwCPwr/pT8mUVw1Jr997Lw==
X-CSE-MsgGUID: ikLC4gx1Su6Y5wjOTdP29g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="156367051"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 07:55:42 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: peter.senna@linux.intel.com, kamil.konieczny@intel.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v2] lib/igt_kms: Update igt_fit_modes_in_bw to add
 legacy commit check
Date: Mon, 14 Jul 2025 20:25:44 +0530
Message-ID: <20250714145544.997582-1-karthik.b.s@intel.com>
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

Currently igt_fit_modes_in_bw is only checking for atomic commit but the
igt_override_all_active_output_modes_to_fit_bw function which it is
wrapping actually has support for legacy commit as well.

To handle this, add support for legacy commit check as well.

v2: Update the function description.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 lib/igt_kms.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 84ba1635c..7191bf92e 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5051,8 +5051,11 @@ bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display)
  * igt_fit_modes_in_bw :
  * @display: a pointer to an #igt_display_t structure
  *
- * Tries atomic TEST_ONLY commit; if it fails, overrides
- * output modes to fit bandwidth.
+ * Attempts to commit the current display configuration using
+ * atomic or legacy commit style based on the platform support.
+ *
+ * If the commit fails, attempts to override all active output
+ * modes to try to fit within the available bandwidth.
  *
  * Returns: true if a valid mode combination is found or the commit succeeds,
  * false otherwise.
@@ -5061,9 +5064,13 @@ bool igt_fit_modes_in_bw(igt_display_t *display)
 {
 	int ret;
 
-	ret = igt_display_try_commit_atomic(display,
-					    DRM_MODE_ATOMIC_TEST_ONLY |
-					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	if (display->is_atomic)
+		ret = igt_display_try_commit_atomic(display,
+						    DRM_MODE_ATOMIC_TEST_ONLY |
+						    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	else
+		ret = igt_display_try_commit2(display, COMMIT_LEGACY);
+
 	if (ret != 0) {
 		bool found;
 
-- 
2.43.0

