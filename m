Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84832CCD193
	for <igt-dev@archiver.kernel.org>; Sat, 18 Oct 2025 16:16:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356A010E11F;
	Sat, 18 Oct 2025 16:16:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g+lIB99E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A8010E11F
 for <igt-dev@lists.freedesktop.org>; Sat, 18 Oct 2025 16:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760804175; x=1792340175;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XZIhRiqpY8dgBl9+1c0wsHchrE1zkkRpdII9nsSdcts=;
 b=g+lIB99EL/hesPdFD/4CI1sywxue+rHRiknCWOfgsrogUX1JB4Bdigp3
 tyWh8Ri/4re7+USF4R6F6JJI0/g7LkT+g+lvAvdAk81gdzdF7dT72IfKn
 RbScsO2qf9CQdg9bFPdj0x+aolblvhYd70PL+AEreY0x6d/epd9OR2qV7
 YHoJsRmk3CpdEE07hrb6Vb6vv4mTOSgWXmft+6zChx4nWugEsfLYpd+Pe
 oT9WT/5FPE9XMjoMomVGyKNxVa4ZpZrEnvMTCcVCAQSPNPMeruQoQR2kw
 KvnCUWFGYtrLo7fYdDO+h/yN7OIJUCFOF3HaoFwKaKm1SinmiTF+q8oJR A==;
X-CSE-ConnectionGUID: 7kUgmp+TTySJXpFIaMPRMg==
X-CSE-MsgGUID: VX3O3DK4RQ2AsoUPSb53UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73668278"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; d="scan'208";a="73668278"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2025 09:16:15 -0700
X-CSE-ConnectionGUID: 3gUTOUC/SgW8UtB2126ugw==
X-CSE-MsgGUID: UUzO2HdYS6CLPFJXz+/+cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; d="scan'208";a="187229691"
Received: from mfidelix-mobl3.gar.corp.intel.com (HELO localhost)
 ([10.94.248.204])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2025 09:16:13 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>
Subject: [PATCH i-g-t 2/3] lib/xe/xe_sriov_provisioning: Add helper to disable
 VFs and restore auto provisioning
Date: Sat, 18 Oct 2025 18:15:48 +0200
Message-ID: <20251018161549.999459-3-marcin.bernatowicz@linux.intel.com>
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

Add xe_sriov_disable_vfs_restore_auto_provisioning(), a convenience
wrapper combining VF disable and PF restore_auto_provisioning actions
to reset SR-IOV provisioning state after tests.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
---
 lib/xe/xe_sriov_provisioning.c | 16 ++++++++++++++++
 lib/xe/xe_sriov_provisioning.h |  1 +
 2 files changed, 17 insertions(+)

diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
index 2a02f7cc8..ff9d1f7d2 100644
--- a/lib/xe/xe_sriov_provisioning.c
+++ b/lib/xe/xe_sriov_provisioning.c
@@ -763,3 +763,19 @@ void xe_sriov_require_default_scheduling_attributes(int pf)
 		}
 	}
 }
+
+/**
+ * xe_sriov_disable_vfs_restore_auto_provisioning - Disable all VFs and
+ * request PF to restore its default auto-provisioning state.
+ * @pf: PF device file descriptor.
+ *
+ * Convenience wrapper combining igt_sriov_disable_vfs() and
+ * xe_sriov_pf_debugfs_restore_auto_provisioning(). Ensures that after
+ * VF teardown the PF is reset to a clean provisioning state.
+ */
+void xe_sriov_disable_vfs_restore_auto_provisioning(int pf)
+{
+	igt_sriov_disable_vfs(pf);
+	if (xe_sriov_pf_debugfs_supports_restore_auto_provisioning(pf))
+		xe_sriov_pf_debugfs_restore_auto_provisioning(pf);
+}
diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
index 4f2a4c13e..e1a9d0a63 100644
--- a/lib/xe/xe_sriov_provisioning.h
+++ b/lib/xe/xe_sriov_provisioning.h
@@ -148,5 +148,6 @@ int __xe_sriov_set_sched_priority(int pf, unsigned int vf_num, unsigned int gt_n
 void xe_sriov_set_sched_priority(int pf, unsigned int vf_num, unsigned int gt_num,
 				 enum xe_sriov_sched_priority value);
 void xe_sriov_require_default_scheduling_attributes(int pf);
+void xe_sriov_disable_vfs_restore_auto_provisioning(int pf);
 
 #endif /* __XE_SRIOV_PROVISIONING_H__ */
-- 
2.43.0

