Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF766C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 10:28:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E7810E8EE;
	Thu,  1 Aug 2024 10:28:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZFyFJcGe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0919010E8EE
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 10:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722508080; x=1754044080;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RNF6LjNbYamJXKq9lyh0vFtjl2NRSm6znXe07PgQL64=;
 b=ZFyFJcGeobvhfX0piagoq03O8SEQBfuBeOku7a6kcY/0jCVDVco0nfv1
 bLtc1ckB/Al9C5z+fr/64PtNB46W9DSbd0pVOtcYc0Uj5Oz7Pcimq/2gk
 orwhSsMsaPnhCngDw3FW1cMlOg0gw2e3VlecW0M5I+SYa6spXHKPA98yO
 Pt3v+GRsVDTOINTC0g7vjhmUv0S+LtzCbvzzAc/tK2N0fx58OwfpAQnOP
 DldZj6Vt/ZxBndYGoHEL3djD+e8qlLz8ZuqNHrxZvcP49q9pPOlw7YPLd
 ITpDjLearNKqcF7gSuFlpZBXOOK9IHcd+HXgbP8kB03o6+RgJS9EkVyoL Q==;
X-CSE-ConnectionGUID: Mu4AlT9DSXerkPyiC23IzQ==
X-CSE-MsgGUID: 3gzNGdIGSP2wXHb9Og1qYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="24244522"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="24244522"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 03:28:00 -0700
X-CSE-ConnectionGUID: NTi6owMVTBSCMJUlL+Qw2A==
X-CSE-MsgGUID: mfHBrFseTN+a++jWBVWbTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="54967038"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.96.225])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 03:27:58 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, rodrigo.vivi@intel.com,
 kamil.konieczny@linux.intel.com, jonathan.cavitt@intel.com,
 lukasz.laguna@intel.com, jakub1.kolakowski@intel.com
Subject: [PATCH v2 i-g-t 1/3] lib/igt_sysfs: Add xe_sysfs_gt_has_node to check
 node existence
Date: Thu,  1 Aug 2024 12:27:46 +0200
Message-Id: <20240801102748.487160-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240801102748.487160-1-marcin.bernatowicz@linux.intel.com>
References: <20240730164232.286232-1-marcin.bernatowicz@linux.intel.com>
 <20240801102748.487160-1-marcin.bernatowicz@linux.intel.com>
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

Introduce xe_sysfs_gt_has_node to verify if a specified node
exists within the sysfs gt directory of a device.

v2: Add newline before return statement (Kamil)
    Use "node" instead of "attribute" for more accuracy

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 lib/igt_sysfs.c | 26 ++++++++++++++++++++++++++
 lib/igt_sysfs.h |  1 +
 2 files changed, 27 insertions(+)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 550472d81..12abc4f7e 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -265,6 +265,32 @@ int xe_sysfs_gt_open(int xe_device, int gt)
 	return open(path, O_RDONLY);
 }
 
+/**
+ * xe_sysfs_gt_has_attr:
+ * @xe_device: fd of the device
+ * @gt: gt number
+ * @node: node inside sysfs gt dir that needs to be checked for existence
+ *
+ * This checks if specified node exists in device sysfs gt directory.
+ *
+ * Returns:
+ * true if node exists in sysfs, false otherwise.
+ */
+bool xe_sysfs_gt_has_node(int xe_device, int gt, const char *node)
+{
+	bool has_node;
+	int gt_fd;
+
+	gt_fd = xe_sysfs_gt_open(xe_device, gt);
+	if (gt_fd < 0)
+		return false;
+
+	has_node = igt_sysfs_has_attr(gt_fd, node);
+	close(gt_fd);
+
+	return has_node;
+}
+
 static const char *xe_engine_class_to_str(__u16 class)
 {
 	static const char * const str[] = {
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 5d050c786..27031a015 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -168,6 +168,7 @@ void igt_sysfs_engines(int xe, int engines, const char **property,
 
 char *xe_sysfs_gt_path(int xe_device, int gt, char *path, int pathlen);
 int xe_sysfs_gt_open(int xe_device, int gt);
+bool xe_sysfs_gt_has_node(int xe_device, int gt, const char *node);
 char *xe_sysfs_tile_path(int xe_device, int tile, char *path, int pathlen);
 int xe_sysfs_tile_open(int xe_device, int tile);
 int xe_sysfs_get_num_tiles(int xe_device);
-- 
2.31.1

