Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F181C52D1F
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 16:49:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84EA410E54D;
	Tue, 30 Jul 2024 16:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a47GjJmy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C680F10E2BC
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 16:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722358185; x=1753894185;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m3wxqheeM+ln5PAFiiWoqGONR6ucs8pTVnnUaqOlo60=;
 b=a47GjJmyZJWPZPoWj3IpMsJpGGItlN0XoFq+FKKwt9dbfmEol7fQQPHR
 n2k6DFmUs66IeiOYlNtn757Rw4dHy4qcq8t/xYLj3qzeYfRw4Wj0f6DcK
 nd10pvvsIfAsAyiVvlJUhwYwSt2jyaLvevY1RoqmsubS9LGd4QImB9Nqt
 H92pyotS8snBfGtk0A3RXY6pQznOxlpOE32wiAGYBKEaBczZ4DA91FiZe
 NTc5+iTXMUnx/MMLW7jQxK4vyIc4ge+d0UQcD9ThpgHSQ/doI+2/2H9QV
 jFn3V9tgAm8buQLTlMAaAUKEk8+DSqG2xlLhzxLUAqVyUWX2dLBg6A+gk w==;
X-CSE-ConnectionGUID: l2wHSaegTKidG3qbjtck1Q==
X-CSE-MsgGUID: Fj6BYOAYQxKBGaJCfgMimA==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="31338878"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="31338878"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 09:42:49 -0700
X-CSE-ConnectionGUID: PuLoyw5hRC+hgEOk4GacvA==
X-CSE-MsgGUID: q6bpn5txTHCnSCkQ73OROw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="85038952"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.0.122])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 09:42:47 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, rodrigo.vivi@intel.com,
 kamil.konieczny@linux.intel.com, lukasz.laguna@intel.com,
 jakub1.kolakowski@intel.com
Subject: [PATCH i-g-t 1/3] lib/igt_sysfs: Add xe_sysfs_gt_has_attr to check
 attribute existence
Date: Tue, 30 Jul 2024 18:42:30 +0200
Message-Id: <20240730164232.286232-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240730164232.286232-1-marcin.bernatowicz@linux.intel.com>
References: <20240730164232.286232-1-marcin.bernatowicz@linux.intel.com>
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

Introduce xe_sysfs_gt_has_attr to verify if a specified attribute
exists within the sysfs gt directory of a device.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 lib/igt_sysfs.c | 25 +++++++++++++++++++++++++
 lib/igt_sysfs.h |  1 +
 2 files changed, 26 insertions(+)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 550472d81..bcfd9fad1 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -265,6 +265,31 @@ int xe_sysfs_gt_open(int xe_device, int gt)
 	return open(path, O_RDONLY);
 }
 
+/**
+ * xe_sysfs_gt_has_attr:
+ * @xe_device: fd of the device
+ * @gt: gt number
+ * @attr: attr inside sysfs gt dir that needs to be checked for existence
+ *
+ * This checks if specified attr exists in device sysfs gt directory.
+ *
+ * Returns:
+ * true if attr exists in sysfs, false otherwise.
+ */
+bool xe_sysfs_gt_has_attr(int xe_device, int gt, const char *attr)
+{
+	bool has_attr;
+	int gt_fd;
+
+	gt_fd = xe_sysfs_gt_open(xe_device, gt);
+	if (gt_fd < 0)
+		return false;
+
+	has_attr = igt_sysfs_has_attr(gt_fd, attr);
+	close(gt_fd);
+	return has_attr;
+}
+
 static const char *xe_engine_class_to_str(__u16 class)
 {
 	static const char * const str[] = {
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 5d050c786..b0288fe36 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -168,6 +168,7 @@ void igt_sysfs_engines(int xe, int engines, const char **property,
 
 char *xe_sysfs_gt_path(int xe_device, int gt, char *path, int pathlen);
 int xe_sysfs_gt_open(int xe_device, int gt);
+bool xe_sysfs_gt_has_attr(int xe_device, int gt, const char *attr);
 char *xe_sysfs_tile_path(int xe_device, int tile, char *path, int pathlen);
 int xe_sysfs_tile_open(int xe_device, int tile);
 int xe_sysfs_get_num_tiles(int xe_device);
-- 
2.31.1

