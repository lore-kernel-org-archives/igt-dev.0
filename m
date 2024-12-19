Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B196E77184
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 15:55:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD06910E039;
	Thu, 19 Dec 2024 15:55:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PUN8O9bJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA68510E039
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Dec 2024 15:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734623707; x=1766159707;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/vnfj/Xm4iKAyqWPbLwQ1OnPDETVDxngWm6Z4VKHKmQ=;
 b=PUN8O9bJ/Iny6qbmlQ7a9HlVKLL5A8kfiDE8/GwSkLIqFvOpM+6cnVXT
 hPMySDOXZepCPomtuygyPCUS6fO8Zz+vO1sUkrBObyZW80Q/3LDMD08Dh
 umiScu1WWnJcucZSPox+kg4R0B9P4IHmJbDb5H1wmWxttnzXr0sTvincp
 JoJzPlEh7fib5HIdSzyQz54hsT9YQbYOAfkJOYVY0tz3Azq37S6a5bBGL
 oa7XNxxmgZ36zQVaLZZ0Kc7Yu4yZPJX+zbnqpbZX9oeEtjBO0lEJpmaEd
 RzDdDnVYawgBIcYer8OUo35z8AyozPVfht5gXRd1LSwvjVu60VBBmPRYI g==;
X-CSE-ConnectionGUID: GSYgmQvITL+3hO3Y/K6bvg==
X-CSE-MsgGUID: 9tl477ciQOaqKh2MmDAmBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="52667045"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="52667045"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 07:55:07 -0800
X-CSE-ConnectionGUID: QVJbbU6SRhy6V0pQ4XcJNg==
X-CSE-MsgGUID: b6bUQu4gTimUYmHO9FOkZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="98705829"
Received: from unknown (HELO
 dg2setup4-CoffeeLake-Client-Platform.iind.intel.com) ([10.145.169.180])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 07:55:05 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, kunal1.joshi@intel.com, arun.r.murthy@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1] lib/igt_kms: Backup connector modes before sorting
Date: Thu, 19 Dec 2024 21:24:53 +0530
Message-ID: <20241219155453.24946-1-santhosh.reddy.guddati@intel.com>
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

Backup connector modes before sorting to ensure the original mode
is not changed if the joiner is not found.This will skip updating
connector->mode[0] if joiner is not available.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13287
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 lib/igt_kms.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 3d061abc5..21a6a4639 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6394,6 +6394,11 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 			  int max_dotclock, drmModeModeInfo *mode)
 {
 	bool found = false;
+	drmModeModeInfo *modes_backup;
+
+	modes_backup = malloc(connector->count_modes * sizeof(drmModeModeInfo));
+	igt_assert(modes_backup);
+	memcpy(modes_backup, connector->modes, connector->count_modes * sizeof(drmModeModeInfo));
 
 	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
 	found = igt_bigjoiner_possible(drm_fd, &connector->modes[0], max_dotclock);
@@ -6401,8 +6406,14 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 		igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
 		found = igt_bigjoiner_possible(drm_fd, &connector->modes[0], max_dotclock);
 	}
-	if (found)
+	if (found) {
 		*mode = connector->modes[0];
+	} else {
+		memcpy(connector->modes, modes_backup,
+		       connector->count_modes * sizeof(drmModeModeInfo));
+	}
+
+	free(modes_backup);
 	return found;
 }
 
@@ -6438,6 +6449,11 @@ bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
 			  int max_dotclock, drmModeModeInfo *mode)
 {
 	bool found = false;
+	drmModeModeInfo *modes_backup;
+
+	modes_backup = malloc(connector->count_modes * sizeof(drmModeModeInfo));
+	igt_assert(modes_backup);
+	memcpy(modes_backup, connector->modes, connector->count_modes * sizeof(drmModeModeInfo));
 
 	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
 	found = igt_ultrajoiner_possible(&connector->modes[0], max_dotclock);
@@ -6445,8 +6461,14 @@ bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
 		igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
 		found = igt_ultrajoiner_possible(&connector->modes[0], max_dotclock);
 	}
-	if (found)
+	if (found) {
 		*mode = connector->modes[0];
+	} else {
+		memcpy(connector->modes, modes_backup,
+		       connector->count_modes * sizeof(drmModeModeInfo));
+	}
+
+	free(modes_backup);
 	return found;
 }
 
-- 
2.43.0

