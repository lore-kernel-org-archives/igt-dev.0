Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05149C83F09
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 19:33:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACFB110E77D;
	Wed,  2 Jul 2025 19:33:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="efcVFycW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 652D110E062
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 19:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751484784; x=1783020784;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cJwyAtYpQuKpvBLUPVT2v3Vg1GomOGqpy/TotYkWNSU=;
 b=efcVFycWLuq59vGGz4fOseJKyvT0rJWYqT8d4TpoI+nf99ruvaITi0tR
 FTJ8ZlpLQLG1gANbEHmTY6gIwxuVP6R53om+jIAwWmhFibrfHATkuBpBX
 lqTRm15VKWJ81Jz5x1DIS/y7ShBE/YbEf6+gYqvMpllkRlE7axZdWXpbi
 A63zRemsW+FyHU3Yxvkul29tfD5GG0TtnqQUySRKECCep3eSUGCe+zf6G
 e46ChiCxMfQ8T1JndsD8BPd4zusTlsSNq6BLt48Zcf8CTLqt2O6n19meu
 wHa0nqf8DFezxC3NuKgcz6rW+kG5fNlFVnbbcohyWqnABIDjjT1tVJI4j A==;
X-CSE-ConnectionGUID: dXvzcNxCSly2rpYwjEGBGQ==
X-CSE-MsgGUID: 2vLTKWqwRBa5ONHlviSyNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53028476"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="53028476"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 12:33:04 -0700
X-CSE-ConnectionGUID: xuVk5gbvRE6kdGBy9ApMeg==
X-CSE-MsgGUID: Lh04diH6Q1K2opOCP8FrHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="154241564"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 12:33:03 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 6/7] lib/xe: Add xe_dev_max_gt()
Date: Wed,  2 Jul 2025 12:33:01 -0700
Message-ID: <20250702193254.2613121-15-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702193254.2613121-9-matthew.d.roper@intel.com>
References: <20250702193254.2613121-9-matthew.d.roper@intel.com>
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

Tests may need to allocate storage space to hold data by GT ID.  Add a
helper function to ensure they can easily determine the maximum possible
ID (which may be higher than the number of GTs reported by
xe_number_gt()).

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/xe/xe_query.c | 14 ++++++++++++++
 lib/xe/xe_query.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 8afcfe8db..3d628cb3f 100644
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
index d18ca2b56..ca0b3235e 100644
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

