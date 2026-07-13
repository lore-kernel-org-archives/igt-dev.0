Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7B1C43458
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 09:59:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0883710E8C2;
	Mon, 13 Jul 2026 09:59:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kntbFawG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3446710E8B3
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2026 09:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783936720; x=1815472720;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Dq7STWcZvAtJM0nawzT1Z/OxhncKDec2ltvhOL822dU=;
 b=kntbFawGewXeVmQue43LeOngYdOyPNhjQXAgibL/Rwg9SA3SynfLl3MS
 zMhYwJe2k7aNTFp99LBl4aNnxWcLYvxMIHx5lYxgWjlkBdcm43+IxSXYF
 v7CCahBEZ05e1s2Z99rFV3jsNd6cJPoOp6qBLvqZdzk/6/M6FOEgkoZKE
 gzqmXKWLCz2xtjPyBsem5h2wcdd3QkuIUkzKNhW+I9X1Y/lDSwGaFoy/+
 pQ4XTGlbFB4KfyFg2ONRAPKgDH5hNzUzWsMJsm3SYCJA5+Pms2jBMs+MQ
 N5k/dJkCc/LrMjEpaUMBdfuPdUIsLpXb7jQ8FbdclP0/OooQKl5iFvSp7 A==;
X-CSE-ConnectionGUID: ZSYZ5FD/RjOvJL2cj/JH8A==
X-CSE-MsgGUID: GedCoWIrSGSndCM8HTqNzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95185322"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="95185322"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 02:58:40 -0700
X-CSE-ConnectionGUID: AEjvQSEHTo+AmHhSWvRaGw==
X-CSE-MsgGUID: LwJKa79GRoq/uEbU4IIKxQ==
X-ExtLoop1: 1
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.80])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 02:58:39 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_sriov_scheduling: Disable VFs before
 resetting sched params
Date: Mon, 13 Jul 2026 11:58:30 +0200
Message-ID: <20260713095830.785758-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Disable VFs before clearing scheduling parameters in fixtures and final
cleanup. This avoids resetting scheduling while VFs are still active,
which can leave cleanup incomplete and cause subsequent VF probing to fail.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_sriov_scheduling.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
index 47cc5d9b0..795487a30 100644
--- a/tests/intel/xe_sriov_scheduling.c
+++ b/tests/intel/xe_sriov_scheduling.c
@@ -1565,9 +1565,9 @@ int igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
 		}
 
 		igt_fixture() {
+			xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
 			__set_vfs_scheduling_params(pf_fd, igt_sriov_get_total_vfs(pf_fd),
 						    &(struct vf_sched_params){});
-			xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
 		}
 	}
 
@@ -1617,18 +1617,18 @@ int igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
 		}
 
 		igt_fixture() {
+			xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
 			__set_vfs_scheduling_params(pf_fd, igt_sriov_get_total_vfs(pf_fd),
 						    &(struct vf_sched_params){});
-			xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
 		}
 	}
 
 	igt_fixture() {
 		int ret;
 
+		xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
 		ret = __set_vfs_scheduling_params(pf_fd, igt_sriov_get_total_vfs(pf_fd),
 						  &(struct vf_sched_params){});
-		xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
 		/* abort to avoid execution of next tests with enabled VFs */
 		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0,
 			       "Failed to disable VF(s)");
-- 
2.43.0

