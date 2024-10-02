Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DB1CF31B0
	for <igt-dev@archiver.kernel.org>; Wed,  2 Oct 2024 10:45:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A0710E6EF;
	Wed,  2 Oct 2024 10:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kt7LWai8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA45F10E6EF
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Oct 2024 10:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727865919; x=1759401919;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/hIKjJKYh4+gzY7OPa8H4sYAsELWSSWpNAIrFloCtlc=;
 b=kt7LWai8XolWpStZmP6wktuSmUQ8LTZergm8rsBOWNo4MB32DPuXLG1C
 PUp/ynRqsKtkhhUDZDMC3L8dZ82EO/N9fLgQ9jrB8/6H/sE70GUGDH63/
 bsklijolG4qYSPFLgNiqAu54gDCGB2LGIf4NRIue8ACe/aJMQSMbmlQbb
 D7tNKmP7U8CxoN23rtjf+sMArNMj4W9u++PDIdmwbXcwge5UQNiR9j4CX
 bvJju/Wk/2yZMVL1THPS5wNEi406w5KUwAi0jHs3yxlCFVYBMrQeabkns
 vqG5IUiiz37m5oMujeaxB6+7/Ly8JC2VLq6AJEtmwDww02Nwb2ZkJzs/s g==;
X-CSE-ConnectionGUID: bTO293BvTRGFfcOMyQzolA==
X-CSE-MsgGUID: nHUawXsrSqSWbl2Vxo3njg==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="38382969"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="38382969"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 03:45:18 -0700
X-CSE-ConnectionGUID: hY62A8J5T7KvE1M5dHkbGw==
X-CSE-MsgGUID: hQVAYBcTRR+W6XNYVWcj0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="74077112"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Oct 2024 03:45:16 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 02 Oct 2024 13:45:15 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/4] lib/intel: Extract gem_store_dword_needs_physical()
Date: Wed,  2 Oct 2024 13:45:12 +0300
Message-ID: <20241002104515.32164-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Extract a small helper that can determine if MI_STORE_DWORD
operates with physical addresses or not.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_gt.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/lib/igt_gt.c b/lib/igt_gt.c
index 9641a6610bf2..331783e49acf 100644
--- a/lib/igt_gt.c
+++ b/lib/igt_gt.c
@@ -655,21 +655,27 @@ unsigned intel_detect_and_clear_missed_interrupts(int fd)
 	return missed;
 }
 
+static bool gem_store_dword_needs_physical(const struct intel_device_info *info)
+{
+	switch (info->graphics_ver) {
+	case 2:
+		return true;
+	case 3:
+		return info->is_grantsdale || info->is_alviso;
+	default:
+		return false;
+	}
+}
+
 bool gem_class_can_store_dword(int fd, int class)
 {
 	uint16_t devid = intel_get_drm_devid(fd);
 	const struct intel_device_info *info = intel_get_device_info(devid);
 	const int ver = info->graphics_ver;
 
-	if (ver == 0) /* unknown, assume it just works */
-		return true;
-
-	if (ver <= 2) /* requires physical addresses */
+	if (gem_store_dword_needs_physical(info))
 		return false;
 
-	if (ver == 3 && (info->is_grantsdale || info->is_alviso))
-		return false; /* only supports physical addresses */
-
 	if (ver == 6 && class == I915_ENGINE_CLASS_VIDEO)
 		return false; /* broken, unbelievably broken */
 
-- 
2.45.2

