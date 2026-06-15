Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F56CD98DA
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 10:33:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74DDE10E33C;
	Mon, 15 Jun 2026 10:33:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QIkgVFrc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C91AE10E353
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 10:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781519555; x=1813055555;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IJfGTkHrzQF21TeSAed7tv3kf2i3ci3k5hoUfsebSro=;
 b=QIkgVFrc/nB0Pg0om7f1sY5KyW+BSg6qUswmaKTpK3hiXozzalwpx0ev
 07hca6rvkxRZCxxpAhNowpk4lPdqvbAQA6UmMV0Rdk0rxqelwj58e+k6C
 wVqSal9oMQWoFrCs62PWzz07WwagAx5pPEol+MB5nVZ8rQojTIJptrHBs
 rC3DuaanLsoU1Im5G/4C1tDkK/A8crFJdHWSIo9O/Zb5anN+guyasjCSl
 GLwgvIRPjqriEMv+Kt7HU+NTSfMlRo2cjzp7J/Rgo0Wu5b7kH9cJpAhAe
 FZfctB4hUeeUl3hEzK3wVhyYqgz/ugrht+pfjwpGoSURlhzJFM+7u2QQ1 A==;
X-CSE-ConnectionGUID: NFW6zYm0Sbezg7Jgnq0xlw==
X-CSE-MsgGUID: 2uNjlfxiTw26kpKK5I84Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="93372335"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="93372335"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 03:32:34 -0700
X-CSE-ConnectionGUID: sbjAGwOwSNC2Qy3JqQG4kw==
X-CSE-MsgGUID: 1tHAkO3ASS24mgw/haED/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="271514739"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.80])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 03:32:33 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v2 i-g-t 2/6] lib/xe/xe_sriov_admin: Add SR-IOV admin exit
 cleanup restore helper
Date: Mon, 15 Jun 2026 12:32:16 +0200
Message-ID: <20260615103220.281656-3-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615103220.281656-1-marcin.bernatowicz@linux.intel.com>
References: <20260615103220.281656-1-marcin.bernatowicz@linux.intel.com>
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

Add xe_sriov_admin_exit_cleanup_restore_defaults() as a best-effort
exit-handler callback to restore PF/VF scheduling defaults via
bulk restore.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 lib/xe/xe_sriov_admin.c | 21 +++++++++++++++++++++
 lib/xe/xe_sriov_admin.h |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/lib/xe/xe_sriov_admin.c b/lib/xe/xe_sriov_admin.c
index f3be70db8..0e7ffb52d 100644
--- a/lib/xe/xe_sriov_admin.c
+++ b/lib/xe/xe_sriov_admin.c
@@ -623,3 +623,24 @@ void xe_sriov_admin_bulk_restore_defaults(int pf_fd)
 {
 	igt_assert_eq(0, __xe_sriov_admin_bulk_restore_defaults(pf_fd));
 }
+
+/**
+ * xe_sriov_admin_exit_cleanup_restore_defaults - Best-effort SR-IOV defaults restore callback
+ * @pf_fd: PF device file descriptor
+ * @sig: Exit signal number, or 0 on normal exit
+ * @user_data: Unused
+ *
+ * Callback suitable for igt_sriov_install_exit_handler() when a test modifies
+ * XE SR-IOV scheduling defaults. Restores PF and VF scheduling attributes to
+ * driver defaults. Failures are ignored so the callback remains best-effort.
+ */
+void xe_sriov_admin_exit_cleanup_restore_defaults(int pf_fd, int sig, void *user_data)
+{
+	(void)sig;
+	(void)user_data;
+
+	if (!xe_sriov_admin_is_present(pf_fd))
+		return;
+
+	(void)__xe_sriov_admin_bulk_restore_defaults(pf_fd);
+}
diff --git a/lib/xe/xe_sriov_admin.h b/lib/xe/xe_sriov_admin.h
index 607e33a86..3db13c2ac 100644
--- a/lib/xe/xe_sriov_admin.h
+++ b/lib/xe/xe_sriov_admin.h
@@ -56,5 +56,7 @@ int  __xe_sriov_admin_restore_defaults(int pf_fd, unsigned int vf_num);
 void  xe_sriov_admin_restore_defaults(int pf_fd, unsigned int vf_num);
 int  __xe_sriov_admin_bulk_restore_defaults(int pf_fd);
 void  xe_sriov_admin_bulk_restore_defaults(int pf_fd);
+void xe_sriov_admin_exit_cleanup_restore_defaults(int pf_fd, int sig,
+						  void *user_data);
 
 #endif /* __XE_SRIOV_ADMIN_H__ */
-- 
2.43.0

