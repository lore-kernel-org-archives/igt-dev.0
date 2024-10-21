Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A4BD1712E
	for <igt-dev@archiver.kernel.org>; Mon, 21 Oct 2024 20:07:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6036010E58F;
	Mon, 21 Oct 2024 20:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pa+YJvOY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B2910E58F
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Oct 2024 20:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729541278; x=1761077278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RfYPDBX3yep/TLQ+H0ZiI5qrBozsiWsRyzDsX+CEwmo=;
 b=Pa+YJvOY9xmYQSCmkoq9IasCsyAzMFFspjhZya/jL5raeN7BQKuFlbNA
 SuI3oc59XIEc5b/Fe66g1uMshrtiS8EZIZTvj+rnPfVVfnBxb0zraNd0t
 1oLfvKSAG3ihfVFJDEZfWkvmo67Dee4jdWsAcUJJb/gsFb29yozXsT7uK
 WzukwiM8gS+lQD4dC5HwmnZIkgKj6Xh+JKAkJs/WstH7j1A+N5y2xjWDJ
 IQevnZIFvl/2NVc2M0h01nOSyKjgO0G+8Iv38gFkTd/Nt5i2X1/tXB1Yf
 bQf6d5F/3WvwTYfGhpVGB1uzecOhJScIJEB6CTHJ9ZhroJMsjfpKB4paS A==;
X-CSE-ConnectionGUID: 5+FpfEfBR9+Ab3l2okDOzg==
X-CSE-MsgGUID: JOQYNOu5R3msTcvp1Idkkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51591265"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="51591265"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 13:07:58 -0700
X-CSE-ConnectionGUID: H4pH/hhYQBWvNRdjETswrA==
X-CSE-MsgGUID: YKDbwG8GTw6RcjUjZ2/4tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="79568712"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.1.47])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 13:07:54 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com, michal.wajdeczko@intel.com,
 michal.winiarski@intel.com, narasimha.c.v@intel.com,
 piotr.piorkowski@intel.com, satyanarayana.k.v.p@intel.com,
 tomasz.lis@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v2 i-g-t 1/6] lib/igt_sriov_device: add helper for opening
 SR-IOV device sysfs
Date: Mon, 21 Oct 2024 22:07:32 +0200
Message-Id: <20241021200737.941384-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20241021200737.941384-1-marcin.bernatowicz@linux.intel.com>
References: <20241021200737.941384-1-marcin.bernatowicz@linux.intel.com>
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

Helper allows to open sysfs directory corresponding to SR-IOV device.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Reviewed-by: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Narasimha C V <narasimha.c.v@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
---
 lib/igt_sriov_device.c | 32 ++++++++++++++++++++++++++++++++
 lib/igt_sriov_device.h |  1 +
 2 files changed, 33 insertions(+)

diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
index 7c3814bf2..d20c74823 100644
--- a/lib/igt_sriov_device.c
+++ b/lib/igt_sriov_device.c
@@ -5,6 +5,7 @@
 
 #include <dirent.h>
 #include <errno.h>
+#include <fcntl.h>
 #include <limits.h>
 #include <pciaccess.h>
 
@@ -381,3 +382,34 @@ void igt_sriov_unbind_vf_drm_driver(int pf, unsigned int vf_num)
 {
 	igt_assert(__igt_sriov_bind_vf_drm_driver(pf, vf_num, false));
 }
+
+/**
+ * igt_sriov_device_sysfs_open:
+ * @pf: PF device file descriptor
+ * @vf_num: VF number (1-based to identify single VF) or 0 for PF
+ *
+ * Open the sysfs directory corresponding to SR-IOV device.
+ *
+ * Returns:
+ * The SR-IOV device sysfs directory fd, -1 on failure.
+ */
+int igt_sriov_device_sysfs_open(int pf, unsigned int vf_num)
+{
+	char path[PATH_MAX];
+	int sysfs, fd;
+
+	sysfs = igt_sysfs_open(pf);
+	if (sysfs < 0)
+		return -1;
+
+	if (!vf_num)
+		snprintf(path, sizeof(path), "device");
+	else
+		/* vf_num is 1-based, but virtfn is 0-based */
+		snprintf(path, sizeof(path), "device/virtfn%u", vf_num - 1);
+
+	fd = openat(sysfs, path, O_DIRECTORY | O_RDONLY);
+	close(sysfs);
+
+	return fd;
+}
diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
index 20ffc515f..dc95a4c78 100644
--- a/lib/igt_sriov_device.h
+++ b/lib/igt_sriov_device.h
@@ -30,6 +30,7 @@ int igt_sriov_open_vf_drm_device(int pf, unsigned int vf_num);
 bool igt_sriov_is_vf_drm_driver_probed(int pf, unsigned int vf_num);
 void igt_sriov_bind_vf_drm_driver(int pf, unsigned int vf_num);
 void igt_sriov_unbind_vf_drm_driver(int pf, unsigned int vf_num);
+int igt_sriov_device_sysfs_open(int pf, unsigned int vf_num);
 
 /**
  * for_each_sriov_vf - Helper for running code on each VF
-- 
2.31.1

