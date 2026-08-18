Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7600AC5DF7D
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 12:40:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D1A10E3EB;
	Tue, 18 Aug 2026 12:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ORGRrwMv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A030F10E3EB
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 12:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787056786; x=1818592786;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rr6Uh5kwCnci+QFSmExLx+Fvcp1f9P5FoSW+aAoyGkw=;
 b=ORGRrwMvgpBMeVwjkuKOseBt4z0heXFHOhrGJaIhWVmwfeVqzHmnsd7A
 bXVgUtkzExk4W1dfplU9kYLSg7IcDu6tiSoQlgd4PuHBK3MZOX/OuhjPY
 wHnOxV1kmdL/ndc5BpGSiaULBoYfj2sfT7IS0xLWeVzc/ajlKxxu76MGg
 6fWa0KxQkutFpYe/u0tDXYj7n0QsNxJefUfnRMw++2OwNYVqrTshpdOzs
 +ipysOYjS/KsD34UHLuZfbfZsYWHiR25WUWzRC5uexJ+gOGtrRY2MOQXf
 KrMvdzLnrMAMN5dwF8uyXBjwwd5UjISJaMEMpw+2ymI2LiQgWcMoIxCLF g==;
X-CSE-ConnectionGUID: +jVRAdq6RpiD8QFryrJ+jQ==
X-CSE-MsgGUID: 9UNg3SoaQJ+OSPDmu0jZPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87402334"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="87402334"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 05:39:45 -0700
X-CSE-ConnectionGUID: Vsyg62EtTuSiVFhyBzhb5Q==
X-CSE-MsgGUID: KzTUXakZRD2t9DkpWBkrXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="262589679"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.106])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 05:39:43 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH i-g-t 2/6] lib/xe/xe_sriov_admin: Rename restore defaults
 helpers
Date: Tue, 18 Aug 2026 14:39:26 +0200
Message-ID: <b9f49ee15df2d3633b4bccaf72ce2df0a4b66fad.1787056235.git.marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787056235.git.marcin.bernatowicz@linux.intel.com>
References: <cover.1787056235.git.marcin.bernatowicz@linux.intel.com>
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

The restore helpers only reset execution quantum, preemption timeout and
scheduling priority. Resource provisioning is restored separately by
xe_sriov_disable_vfs_restore_auto_provisioning(), so the plain "defaults"
naming promises more than the helpers deliver.

Rename them to say scheduling defaults. No functional changes.

Assisted-by: Copilot:Claude-Opus-5
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 lib/xe/xe_sriov_admin.c           | 26 +++++++++++++-------------
 lib/xe/xe_sriov_admin.h           | 12 ++++++------
 tests/intel/xe_pmu.c              |  4 ++--
 tests/intel/xe_sriov_admin.c      |  4 ++--
 tests/intel/xe_sriov_scheduling.c |  2 +-
 5 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/lib/xe/xe_sriov_admin.c b/lib/xe/xe_sriov_admin.c
index 0e7ffb52d..b03e77b08 100644
--- a/lib/xe/xe_sriov_admin.c
+++ b/lib/xe/xe_sriov_admin.c
@@ -541,7 +541,7 @@ void xe_sriov_admin_vf_stop(int pf_fd, unsigned int vf_num)
 }
 
 /**
- * __xe_sriov_admin_restore_defaults - Restore scheduling defaults for a VF
+ * __xe_sriov_admin_restore_sched_defaults - Restore scheduling defaults for a VF
  * @pf_fd:  PF device file descriptor.
  * @vf_num: VF index (0 for PF, >0 for VFs).
  *
@@ -549,7 +549,7 @@ void xe_sriov_admin_vf_stop(int pf_fd, unsigned int vf_num)
  *
  * Returns: 0 on success or negative errno on error.
  */
-int __xe_sriov_admin_restore_defaults(int pf_fd, unsigned int vf_num)
+int __xe_sriov_admin_restore_sched_defaults(int pf_fd, unsigned int vf_num)
 {
 	int ret_eq, ret_pt, ret_prio;
 	int ret = 0;
@@ -574,24 +574,24 @@ int __xe_sriov_admin_restore_defaults(int pf_fd, unsigned int vf_num)
 }
 
 /**
- * xe_sriov_admin_restore_defaults - Assert wrapper restoring VF defaults
+ * xe_sriov_admin_restore_sched_defaults - Assert wrapper restoring VF defaults
  * @pf_fd:  PF device file descriptor.
  * @vf_num: VF index (0 for PF, >0 for VFs).
  */
-void xe_sriov_admin_restore_defaults(int pf_fd, unsigned int vf_num)
+void xe_sriov_admin_restore_sched_defaults(int pf_fd, unsigned int vf_num)
 {
-	igt_assert_eq(0, __xe_sriov_admin_restore_defaults(pf_fd, vf_num));
+	igt_assert_eq(0, __xe_sriov_admin_restore_sched_defaults(pf_fd, vf_num));
 }
 
 /**
- * __xe_sriov_admin_bulk_restore_defaults - Restore scheduling defaults for PF and all VFs
+ * __xe_sriov_admin_bulk_restore_sched_defaults - Restore scheduling defaults for PF and all VFs
  * @pf_fd: PF device file descriptor.
  *
  * Resets PF and all VFs to driver default scheduling parameters.
  *
  * Returns: 0 on success or negative errno on error.
  */
-int __xe_sriov_admin_bulk_restore_defaults(int pf_fd)
+int __xe_sriov_admin_bulk_restore_sched_defaults(int pf_fd)
 {
 	int ret_eq, ret_pt, ret_prio;
 	int ret = 0;
@@ -616,16 +616,16 @@ int __xe_sriov_admin_bulk_restore_defaults(int pf_fd)
 }
 
 /**
- * xe_sriov_admin_bulk_restore_defaults - Assert wrapper for restoring defaults on PF and all VFs
+ * xe_sriov_admin_bulk_restore_sched_defaults - Assert wrapper restoring defaults on PF and all VFs
  * @pf_fd: PF device file descriptor.
  */
-void xe_sriov_admin_bulk_restore_defaults(int pf_fd)
+void xe_sriov_admin_bulk_restore_sched_defaults(int pf_fd)
 {
-	igt_assert_eq(0, __xe_sriov_admin_bulk_restore_defaults(pf_fd));
+	igt_assert_eq(0, __xe_sriov_admin_bulk_restore_sched_defaults(pf_fd));
 }
 
 /**
- * xe_sriov_admin_exit_cleanup_restore_defaults - Best-effort SR-IOV defaults restore callback
+ * xe_sriov_admin_exit_cleanup_restore_sched_defaults - Best-effort SR-IOV defaults restore callback
  * @pf_fd: PF device file descriptor
  * @sig: Exit signal number, or 0 on normal exit
  * @user_data: Unused
@@ -634,7 +634,7 @@ void xe_sriov_admin_bulk_restore_defaults(int pf_fd)
  * XE SR-IOV scheduling defaults. Restores PF and VF scheduling attributes to
  * driver defaults. Failures are ignored so the callback remains best-effort.
  */
-void xe_sriov_admin_exit_cleanup_restore_defaults(int pf_fd, int sig, void *user_data)
+void xe_sriov_admin_exit_cleanup_restore_sched_defaults(int pf_fd, int sig, void *user_data)
 {
 	(void)sig;
 	(void)user_data;
@@ -642,5 +642,5 @@ void xe_sriov_admin_exit_cleanup_restore_defaults(int pf_fd, int sig, void *user
 	if (!xe_sriov_admin_is_present(pf_fd))
 		return;
 
-	(void)__xe_sriov_admin_bulk_restore_defaults(pf_fd);
+	(void)__xe_sriov_admin_bulk_restore_sched_defaults(pf_fd);
 }
diff --git a/lib/xe/xe_sriov_admin.h b/lib/xe/xe_sriov_admin.h
index 3db13c2ac..4eb9c83a6 100644
--- a/lib/xe/xe_sriov_admin.h
+++ b/lib/xe/xe_sriov_admin.h
@@ -52,11 +52,11 @@ void xe_sriov_admin_bulk_set_sched_priority(int pf_fd,
 int  __xe_sriov_admin_vf_stop(int pf_fd, unsigned int vf_num);
 void  xe_sriov_admin_vf_stop(int pf_fd, unsigned int vf_num);
 
-int  __xe_sriov_admin_restore_defaults(int pf_fd, unsigned int vf_num);
-void  xe_sriov_admin_restore_defaults(int pf_fd, unsigned int vf_num);
-int  __xe_sriov_admin_bulk_restore_defaults(int pf_fd);
-void  xe_sriov_admin_bulk_restore_defaults(int pf_fd);
-void xe_sriov_admin_exit_cleanup_restore_defaults(int pf_fd, int sig,
-						  void *user_data);
+int  __xe_sriov_admin_restore_sched_defaults(int pf_fd, unsigned int vf_num);
+void  xe_sriov_admin_restore_sched_defaults(int pf_fd, unsigned int vf_num);
+int  __xe_sriov_admin_bulk_restore_sched_defaults(int pf_fd);
+void  xe_sriov_admin_bulk_restore_sched_defaults(int pf_fd);
+void xe_sriov_admin_exit_cleanup_restore_sched_defaults(int pf_fd, int sig,
+							void *user_data);
 
 #endif /* __XE_SRIOV_ADMIN_H__ */
diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index f4c03faa2..2d1bc1f61 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -991,7 +991,7 @@ static unsigned int enable_and_provision_vfs(int fd)
 	igt_require(igt_sriov_get_enabled_vfs(fd) == 0);
 	xe_sriov_require_default_scheduling_attributes(fd);
 	igt_sriov_install_exit_handler(fd,
-				       xe_sriov_admin_exit_cleanup_restore_defaults,
+				       xe_sriov_admin_exit_cleanup_restore_sched_defaults,
 				       NULL);
 	autoprobe = igt_sriov_is_driver_autoprobe_enabled(fd);
 
@@ -1023,7 +1023,7 @@ static void unprovision_and_disable_vfs(int fd)
 {
 	int ret;
 
-	ret = __xe_sriov_admin_bulk_restore_defaults(fd);
+	ret = __xe_sriov_admin_bulk_restore_sched_defaults(fd);
 	xe_sriov_disable_vfs_restore_auto_provisioning(fd);
 	/* abort to avoid execution of next tests with enabled VFs */
 	igt_abort_on_f(igt_sriov_get_enabled_vfs(fd) > 0,
diff --git a/tests/intel/xe_sriov_admin.c b/tests/intel/xe_sriov_admin.c
index 8b400a01f..904c2ed7f 100644
--- a/tests/intel/xe_sriov_admin.c
+++ b/tests/intel/xe_sriov_admin.c
@@ -347,7 +347,7 @@ int igt_main()
 		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
 		igt_require(xe_sriov_admin_is_present(pf_fd));
 		igt_sriov_install_exit_handler(pf_fd,
-					       xe_sriov_admin_exit_cleanup_restore_defaults,
+					       xe_sriov_admin_exit_cleanup_restore_sched_defaults,
 					       NULL);
 		total_vfs = igt_sriov_get_total_vfs(pf_fd);
 	}
@@ -426,7 +426,7 @@ int igt_main()
 	igt_fixture() {
 		int ret;
 
-		ret = __xe_sriov_admin_bulk_restore_defaults(pf_fd);
+		ret = __xe_sriov_admin_bulk_restore_sched_defaults(pf_fd);
 		igt_sriov_disable_vfs(pf_fd);
 		/* abort to avoid execution of next tests with enabled VFs */
 		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0,
diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
index a2240e473..5e4001219 100644
--- a/tests/intel/xe_sriov_scheduling.c
+++ b/tests/intel/xe_sriov_scheduling.c
@@ -1470,7 +1470,7 @@ int igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
 		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
 		igt_require(xe_sriov_admin_is_present(pf_fd));
 		igt_sriov_install_exit_handler(pf_fd,
-					       xe_sriov_admin_exit_cleanup_restore_defaults,
+					       xe_sriov_admin_exit_cleanup_restore_sched_defaults,
 					       NULL);
 		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
 		xe_sriov_require_default_scheduling_attributes(pf_fd);
-- 
2.43.0

