Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C9AC54E55
	for <igt-dev@archiver.kernel.org>; Fri,  1 Mar 2024 17:16:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11ED810E104;
	Fri,  1 Mar 2024 17:16:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XH6bBujg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2649A10E0E1
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Mar 2024 17:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709313401; x=1740849401;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uwYLHPibPm3sGeBJbzXuVjohRkaLkAkSiOZL84eBrIM=;
 b=XH6bBujgEjLHSyEIu/3rgapzQzZJ9oPD9l2WD4Cc8VkkjMi/uc+VMed/
 FWrM0deIno7k3IzJTlByp8zrfRcA9kcoOjkTi381enxGcIssPsTx+7xPK
 ulOyP0lKSgI6N5lgcpaMWuL6eq+GEwJZg8ofwKgBQlz6pPalN6pQWnzdR
 R9NETZGgXnBkN2glGfrrNjFCfqgBJSfVrfLFEq1ka4lPobYGmDSzDJpWp
 /T+5B71M1AWehmiH/mXoZ371TWCoPBTROESfKLuGnjar29/woxlWK5i+Z
 RvNDylNOzZiKYKHlLayIsFRYm4cYU91GWB2+Fuex+oOPhfVatp6QLbWb0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="26323423"
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; d="scan'208";a="26323423"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 09:16:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="8681328"
Received: from knomani-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.3.163])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 09:16:39 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 4/5] lib/intel_mocs: add defer-to-pat-index
Date: Fri,  1 Mar 2024 17:16:17 +0000
Message-ID: <20240301171618.395851-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240301171618.395851-1-matthew.auld@intel.com>
References: <20240301171618.395851-1-matthew.auld@intel.com>
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

At least on Xe2 it looks like we can just use MOCS index zero to defer
the selected caching mode to that of the PAT index. This will be useful
in an upcoming patch.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_mocs.c | 14 ++++++++++++++
 lib/intel_mocs.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/lib/intel_mocs.c b/lib/intel_mocs.c
index 4a9c305dc..bf6ee1958 100644
--- a/lib/intel_mocs.c
+++ b/lib/intel_mocs.c
@@ -9,6 +9,7 @@
 struct drm_intel_mocs_index {
 	uint8_t uc_index;
 	uint8_t wb_index;
+	uint8_t deferred_index;
 };
 
 static void get_mocs_index(int fd, struct drm_intel_mocs_index *mocs)
@@ -25,6 +26,7 @@ static void get_mocs_index(int fd, struct drm_intel_mocs_index *mocs)
 	if (intel_graphics_ver(devid) >= IP_VER(20, 0)) {
 		mocs->uc_index = 3;
 		mocs->wb_index = 4;
+		mocs->deferred_index = 0;
 	} else if (IS_METEORLAKE(devid)) {
 		mocs->uc_index = 5;
 		mocs->wb_index = 10;
@@ -60,3 +62,15 @@ uint8_t intel_get_uc_mocs_index(int fd)
 
 	return mocs.uc_index;
 }
+
+uint8_t intel_get_deferred_mocs_index(int fd)
+{
+	struct drm_intel_mocs_index mocs;
+	uint16_t dev_id = intel_get_drm_devid(fd);
+
+	igt_assert(AT_LEAST_GEN(dev_id, 20));
+
+	get_mocs_index(fd, &mocs);
+
+	return mocs.deferred_index;
+}
diff --git a/lib/intel_mocs.h b/lib/intel_mocs.h
index b5c79b0e1..bfdc23210 100644
--- a/lib/intel_mocs.h
+++ b/lib/intel_mocs.h
@@ -12,5 +12,6 @@
 
 uint8_t intel_get_wb_mocs_index(int fd);
 uint8_t intel_get_uc_mocs_index(int fd);
+uint8_t intel_get_deferred_mocs_index(int fd);
 
 #endif /* _INTEL_MOCS_H */
-- 
2.43.2

