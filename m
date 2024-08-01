Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F916C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 14:39:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C823B10E994;
	Thu,  1 Aug 2024 14:39:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="flp5ai5S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF18C10E994
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 14:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722523147; x=1754059147;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=91P65zvNVyprMKYL7HMS4DGkTwuuV5EGG5V/MONOgyI=;
 b=flp5ai5SHKLmnX3BZi634f/9i0pS08VjkIiOH7B7+BQjiI5WqpmBmKmr
 1tM/5y2JvnRDXt7Z8wQ8WRTPUfV6d8VL1E9aIGABXyxOoVQqimOuT5KwL
 azNtIOLRVulBoxHYRaXqVP/cymXBSZ6+DiX+NXYZgwTiJdPv9v3uNIg8Y
 4D7aAMQB7I0r1d68Xwnpa6aoJJ15oXcOKg1LOup8KXlGGLFykntZ0D0KV
 DQDS+yXdlasZtBI9LUTWDxVW75heas6KQJtHYkdQVqJgb+IMklLnZGefH
 HoHvJbV05odJ8GXyZFIT0prVPjFwVDxMElpT81Hei65LK/C2FqMbTq61Y w==;
X-CSE-ConnectionGUID: E2CGMvLDTFqBewGOqJVevw==
X-CSE-MsgGUID: p1/Zpe+CRIalwxPlLnBz7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="24343698"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="24343698"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 07:39:02 -0700
X-CSE-ConnectionGUID: NEMUAlq/SHShcfy3Ly9Swg==
X-CSE-MsgGUID: 8FRS1/2wR7+EUXleoctEVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="59872735"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.96.225])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 07:39:00 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, rodrigo.vivi@intel.com,
 kamil.konieczny@linux.intel.com, jonathan.cavitt@intel.com,
 lukasz.laguna@intel.com, jakub1.kolakowski@intel.com
Subject: [PATCH v2 i-g-t 1/3] lib/igt_sysfs: Add xe_sysfs_gt_has_node to check
 node existence
Date: Thu,  1 Aug 2024 16:38:46 +0200
Message-Id: <20240801143848.509164-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240801143848.509164-1-marcin.bernatowicz@linux.intel.com>
References: <20240801143848.509164-1-marcin.bernatowicz@linux.intel.com>
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
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_sysfs.c | 26 ++++++++++++++++++++++++++
 lib/igt_sysfs.h |  1 +
 2 files changed, 27 insertions(+)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 550472d81..2863e22b5 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -265,6 +265,32 @@ int xe_sysfs_gt_open(int xe_device, int gt)
 	return open(path, O_RDONLY);
 }
 
+/**
+ * xe_sysfs_gt_has_node:
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

