Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD47BC5DF7D
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 12:42:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA2310E3EB;
	Tue, 18 Aug 2026 12:42:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DWRqv4Y9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6511610E3EB
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 12:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787056781; x=1818592781;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kRuEaU6sesWaqG4+iYTVy8/lo76WHwApaapxunNk028=;
 b=DWRqv4Y9X8v55Zrgbjfph8QSvw2VeN+qWDpSnUuz5VrIzyNgJSrFBeXN
 CRx1Jvf2fgcRrOlYajB8wnm68x8uWkP4MuOPq4ZjkFpJjUwCBc3x21OS0
 9lv+L1nh8B/dBNDXxh01dmU+YjXDVtHSXniXUE9HayTVlNs25xjN3ypeP
 hrw6yye2lk1Pt4G2HxYQqrKJ3SwQ9XY8sV0oXfNTAmcBGXWGScEvbJZrs
 iKd/iKif8Mv/HVzo7ifkOAgk5zYNik8JDHX209yAsboDQ6myVLlVEcwCc
 hYcKlYXG9KnHtVD6kd1/DQFXrz5XM/fJyDigj9gH4dCpjb4xJw3zmnmMx A==;
X-CSE-ConnectionGUID: 5g7/XC+TRjCXL6c6Qv8lEQ==
X-CSE-MsgGUID: 5bqtTwGsTYSjV+xNaEbpGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="91359145"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="91359145"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 05:39:41 -0700
X-CSE-ConnectionGUID: 2BV9Kj84TWW7/SqqYQRtdw==
X-CSE-MsgGUID: GjUOGqJCTTGFpFYRnrIKvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="269522210"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.106])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 05:39:39 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH i-g-t 1/6] tests/intel/xe_sriov_scheduling: Disable VFs before
 resetting sched params
Date: Tue, 18 Aug 2026 14:39:25 +0200
Message-ID: <ac3abf6574371b4418cf898f16bfe9443f48a653.1787056235.git.marcin.bernatowicz@linux.intel.com>
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

Disable VFs before clearing scheduling parameters in fixtures and final
cleanup. This avoids resetting scheduling while VFs are still active,
which can leave cleanup incomplete and cause subsequent VF probing to fail.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 tests/intel/xe_sriov_scheduling.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
index 5d30b961d..a2240e473 100644
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

