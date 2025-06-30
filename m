Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EABDCC83039
	for <igt-dev@archiver.kernel.org>; Mon, 30 Jun 2025 16:35:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9530810E4AB;
	Mon, 30 Jun 2025 16:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="acRqT6+L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7988510E057
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 16:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751301349; x=1782837349;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tQTNAM4s8uW2zBIfGfT5Cc1fmlg3hcXGXcZxxzHO2LI=;
 b=acRqT6+LTk0ji8ydNiZE4xS7KiIa5Uj+ffF5pj2dRgVB2xyCgHH9gcFQ
 7WUfDy23M9xl9gi6NNMj7pQeXVeN12wchZ0koic9G0jhgXVrghFwDd1RB
 A2U17mPOEm6VrulO/4B3p+nVNAwxNlSpWOe13mu+E1TAL2R5OrQ7ejDln
 ZJvC2LJjUnf4Qli3XTHQI+ZU94+ZrSWX1S0NNv9V/srhUajc74Hy2KWHc
 3Rwbr/o1oJYNZUYDvgLX6uCjbJbqRc0ioEwbtakGQSh27NWcVva9736bm
 AHV2aZiqByyxRtibXsdUsYuSDYVBYg/KxEBxQO34XE9HKQ0QgdhP+uHgv A==;
X-CSE-ConnectionGUID: YJ8ADW/hT+2snfDSAS2TpA==
X-CSE-MsgGUID: lvBdgZQEQByhusN8hGgMeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="71101954"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="71101954"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 09:35:48 -0700
X-CSE-ConnectionGUID: lNJWS6yXTrOI5JaIKErX+A==
X-CSE-MsgGUID: wEhiA0wjRXCnaK5geUll6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="159226419"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 09:35:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH i-g-t 6/7] lib/xe: Add xe_dev_max_gt()
Date: Mon, 30 Jun 2025 09:35:36 -0700
Message-ID: <20250630163529.2096664-15-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630163529.2096664-9-matthew.d.roper@intel.com>
References: <20250630163529.2096664-9-matthew.d.roper@intel.com>
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

Tests may need to allocate storage space to hold data by GT ID.  Add a
helper function to ensure they can easily determine the maximum possible
ID (which may be higher than the number of GTs reported by
xe_number_gt()).

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 lib/xe/xe_query.c | 14 ++++++++++++++
 lib/xe/xe_query.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 9bfad0cc2..6f2edf0de 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -469,6 +469,20 @@ _TYPE _NAME(int fd)			\
  */
 xe_dev_FN(xe_number_gt, gt_list->num_gt, unsigned int);
 
+/**
+ * xe_max_gt:
+ * @fd: xe device fd
+ *
+ * Return maximum GT ID in xe device's GT list.
+ */
+unsigned int xe_dev_max_gt(int fd)
+{
+	struct xe_device *xe_dev = find_in_cache(fd);
+
+	igt_assert(xe_dev);
+	return igt_fls(xe_dev->gt_mask) - 1;
+}
+
 /**
  * all_memory_regions:
  * @fd: xe device fd
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 4aeff639a..5ba481c63 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -94,6 +94,7 @@ struct xe_device {
 #define XE_MAX_ENGINE_INSTANCE	9
 
 unsigned int xe_number_gt(int fd);
+unsigned int xe_dev_max_gt(int fd);
 uint64_t all_memory_regions(int fd);
 uint64_t system_memory(int fd);
 const struct drm_xe_gt *drm_xe_get_gt(struct xe_device *xe_dev, int gt_id);
-- 
2.49.0

