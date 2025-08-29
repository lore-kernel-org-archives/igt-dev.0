Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D011BCA0FF9
	for <igt-dev@archiver.kernel.org>; Fri, 29 Aug 2025 10:40:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8586810EB7A;
	Fri, 29 Aug 2025 10:40:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TFH3zH2o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B4110EB7A
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Aug 2025 10:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756464051; x=1788000051;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4BgnwmS8CvGkHIPOK+MqTSfF8AwI2AAIOUCxeMq5vz8=;
 b=TFH3zH2oNNBdUMEayfzLGU0onlQLNst2Q39xkHOaZb8TfWyxQxQZP1Fk
 AMoOsu0yVQFiK9g7px1dTOqpVRlWgOhMKOI8fgAW72CEKBJ7RHBFBY96V
 2L96bzQqHt4jgtjaSMU+Ra5cS+oJXe2RRtBxVOWkbs7ea7HDQoe5f5ijy
 cqakT5jLRK3y4c4qu8cqYQmSu68XDMptI5vtqTV3Gc762c6fP4PYny9GY
 79AUNHGxEaIxbK17U946IWliGSVxLEORMCzhVyjO/lFk+wMFPjYDfiS/8
 zpnv6cz8NdqPVDOUZfpzZwEkadfevIDIG+jViho6/CJZPktJFPqezm+N2 A==;
X-CSE-ConnectionGUID: BSc9/RmlRXORYhrA9kIBcA==
X-CSE-MsgGUID: LoFSQL+mQjOnJF9xvIQ18A==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="76200896"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="76200896"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 03:40:51 -0700
X-CSE-ConnectionGUID: ChPltS6oQyCQ2jjBy8Gbeg==
X-CSE-MsgGUID: njcy+J+ATxuAMu9xd713IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="169917650"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.112.195])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 03:40:48 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH i-g-t 1/2] lib/xe/xe_query: Add xe_gt_type() and
 xe_is_main_gt() helpers
Date: Fri, 29 Aug 2025 12:40:36 +0200
Message-Id: <20250829104037.649426-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250829104037.649426-1-marcin.bernatowicz@linux.intel.com>
References: <20250829104037.649426-1-marcin.bernatowicz@linux.intel.com>
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

Introduce xe_gt_type() to return the GT type from query data. This
replaces open-coded access in xe_is_media_gt() and makes it easy to
add new GT-specific helpers. Add xe_is_main_gt() for MAIN GT checks.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 lib/xe/xe_query.c | 40 +++++++++++++++++++++++++++++++---------
 lib/xe/xe_query.h |  2 ++
 2 files changed, 33 insertions(+), 9 deletions(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 3b8a682f8..9b88cce8d 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -917,24 +917,46 @@ bool xe_has_media_gt(int fd)
 }
 
 /**
- * xe_is_media_gt:
+ * xe_gt_type:
  * @fd: xe device fd
  * @gt: gt id
  *
- * Returns true if @gt for device @fd is media GT, otherwise false.
+ * Returns the type of @gt for device @fd (e.g.,
+ * DRM_XE_QUERY_GT_TYPE_MAIN, DRM_XE_QUERY_GT_TYPE_MEDIA).
  */
-bool xe_is_media_gt(int fd, int gt)
+uint16_t xe_gt_type(int fd, int gt)
 {
-	struct xe_device *xe_dev;
+	struct xe_device *xe_dev = find_in_cache(fd);
 
-	xe_dev = find_in_cache(fd);
 	igt_assert(xe_dev);
-	igt_assert(gt < xe_number_gt(fd));
+	igt_assert_f(gt >= 0 && gt < xe_number_gt(fd),
+		     "gt %d out of range [0..%d)\n", gt, xe_number_gt(fd));
 
-	if (xe_dev->gt_list->gt_list[gt].type == DRM_XE_QUERY_GT_TYPE_MEDIA)
-		return true;
+	return xe_dev->gt_list->gt_list[gt].type;
+}
 
-	return false;
+/**
+ * xe_is_media_gt:
+ * @fd: xe device fd
+ * @gt: gt id
+ *
+ * Returns true if @gt for device @fd is MEDIA GT, otherwise false.
+ */
+bool xe_is_media_gt(int fd, int gt)
+{
+	return xe_gt_type(fd, gt) == DRM_XE_QUERY_GT_TYPE_MEDIA;
+}
+
+/**
+ * xe_is_main_gt:
+ * @fd: xe device fd
+ * @gt: gt id
+ *
+ * Returns true if @gt for device @fd is MAIN GT, otherwise false.
+ */
+bool xe_is_main_gt(int fd, int gt)
+{
+	return xe_gt_type(fd, gt) == DRM_XE_QUERY_GT_TYPE_MAIN;
 }
 
 /**
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index cc54ec956..4b8a6ee77 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -127,7 +127,9 @@ const char *xe_engine_class_short_string(uint32_t engine_class);
 bool xe_has_engine_class(int fd, uint16_t engine_class);
 struct drm_xe_engine *xe_find_engine_by_class(int fd, uint16_t engine_class);
 bool xe_has_media_gt(int fd);
+uint16_t xe_gt_type(int fd, int gt);
 bool xe_is_media_gt(int fd, int gt);
+bool xe_is_main_gt(int fd, int gt);
 uint16_t xe_gt_get_tile_id(int fd, int gt);
 uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32_t *len);
 
-- 
2.31.1

