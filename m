Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77407CCD195
	for <igt-dev@archiver.kernel.org>; Sat, 18 Oct 2025 16:16:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0217310E11F;
	Sat, 18 Oct 2025 16:16:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QtsfR0GH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C74110E11F
 for <igt-dev@lists.freedesktop.org>; Sat, 18 Oct 2025 16:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760804164; x=1792340164;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NIT1EUn3QjLQvSv7faUdE/aFqJBbNN4Q57cq3cf+iH8=;
 b=QtsfR0GH9evDtxbmLzSPZTm+olxg+2ed81Mf6tPPyW4CYRh8hSGsejgu
 NleQljXtz6sYFI068zByW1Nh7WelpHHb3KGg6DTmPIleQ4ZUObZi0rvdS
 YDZdHiI3UWaKKRDH0qz6MEArL79+zaFwl21APWdr2iry/D/9HJKab+qjn
 bTBAhCfesXmyE0UXyq0bhjMup6O2NkuoCGE85PEjn9iXvnK+441daOkn8
 aiA8djb3VNVqX/5VpqRaqT8Kx5+kRTws5o+L/QAlXFY9Yd+t7QfyAQUxD
 cDtGhjDW6rItQt9iuP4+hmQrrqlEro1+YtnCcQjYOXYF4OTA3YJS16hWh Q==;
X-CSE-ConnectionGUID: 4Z7MHQ0AQC2ipmbfNlDQWw==
X-CSE-MsgGUID: p4vxGCDRR1aq08N4IuiqzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="65611950"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; d="scan'208";a="65611950"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2025 09:16:04 -0700
X-CSE-ConnectionGUID: QUYzd7BfSAmqpfRKdmh1Rw==
X-CSE-MsgGUID: YujkT8zaRkm7U4xKjBR2ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; d="scan'208";a="182679308"
Received: from mfidelix-mobl3.gar.corp.intel.com (HELO localhost)
 ([10.94.248.204])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2025 09:16:03 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>
Subject: [PATCH i-g-t 1/3] lib/xe/xe_sriov_debugfs: Add PF
 restore_auto_provisioning helpers
Date: Sat, 18 Oct 2025 18:15:47 +0200
Message-ID: <20251018161549.999459-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251018161549.999459-1-marcin.bernatowicz@linux.intel.com>
References: <20251018161549.999459-1-marcin.bernatowicz@linux.intel.com>
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

Add helpers to access <debugfs>/sriov/restore_auto_provisioning on PF:

 - xe_sriov_pf_debugfs_supports_restore_auto_provisioning()
 - xe_sriov_pf_debugfs_restore_auto_provisioning()

They allow tests to check and trigger PF restore of default
auto-provisioning state after VF teardown.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
---
 lib/xe/xe_sriov_debugfs.c | 40 +++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_sriov_debugfs.h |  2 ++
 2 files changed, 42 insertions(+)

diff --git a/lib/xe/xe_sriov_debugfs.c b/lib/xe/xe_sriov_debugfs.c
index a33300e47..a8514a98f 100644
--- a/lib/xe/xe_sriov_debugfs.c
+++ b/lib/xe/xe_sriov_debugfs.c
@@ -620,3 +620,43 @@ uint64_t xe_sriov_vf_debugfs_get_selfconfig(int vf, enum xe_sriov_shared_res res
 
 	return value;
 }
+
+/**
+ * xe_sriov_pf_debugfs_supports_restore_auto_provisioning - Check if PF
+ * supports restoring the default auto-provisioning state via debugfs.
+ * @pf: PF device file descriptor
+ *
+ * The helper probes for a writable
+ * <debugfs>/sriov/restore_auto_provisioning attribute on the PF.
+ *
+ * Return: true if the attribute exists and is writable, false otherwise.
+ */
+bool xe_sriov_pf_debugfs_supports_restore_auto_provisioning(int pf)
+{
+	return igt_debugfs_exists(pf, "sriov/restore_auto_provisioning", O_WRONLY);
+}
+
+/**
+ * xe_sriov_pf_debugfs_restore_auto_provisioning - Request PF to restore the
+ * default auto-provisioning state after VF teardown.
+ * @pf: PF device file descriptor
+ *
+ * This helper writes "1" to <debugfs>/sriov/restore_auto_provisioning.
+ * Intended for use in test teardown after disabling VFs, so future
+ * provisioning starts from a clean, default state.
+ *
+ * Return: 0 on success, or a negative errno on failure.
+ */
+int xe_sriov_pf_debugfs_restore_auto_provisioning(int pf)
+{
+	int dirfd = igt_debugfs_dir(pf);
+	int ret;
+
+	igt_assert_fd(dirfd);
+
+	ret = igt_sysfs_write(dirfd, "sriov/restore_auto_provisioning", "1", 1);
+
+	close(dirfd);
+
+	return ret == 1 ? 0 : ret;
+}
diff --git a/lib/xe/xe_sriov_debugfs.h b/lib/xe/xe_sriov_debugfs.h
index 4983afbb3..989c937a7 100644
--- a/lib/xe/xe_sriov_debugfs.h
+++ b/lib/xe/xe_sriov_debugfs.h
@@ -43,5 +43,7 @@ int __xe_sriov_vf_debugfs_get_selfconfig(int vf, enum xe_sriov_shared_res res,
 					 unsigned int gt_num, uint64_t *value);
 uint64_t xe_sriov_vf_debugfs_get_selfconfig(int vf, enum xe_sriov_shared_res res,
 					    unsigned int gt_num);
+bool xe_sriov_pf_debugfs_supports_restore_auto_provisioning(int pf);
+int xe_sriov_pf_debugfs_restore_auto_provisioning(int pf);
 
 #endif /* __XE_SRIOV_DEBUGFS_H__ */
-- 
2.43.0

