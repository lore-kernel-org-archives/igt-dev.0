Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50EC5CD4F57
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 12:02:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E4910EC9B;
	Tue, 19 May 2026 12:02:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Aa2XjAuT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71FB410EC7C
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2026 12:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779192072; x=1810728072;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SOTkYj9UK8cAjJuc7cUZ0NqFpZaPa76IKaiWoSlfQGk=;
 b=Aa2XjAuTKBHnwfTlYA+VTMPh14QUOZzbKllilNf1EQFYW4ZFqybnoxEQ
 NUZEmod+6kOATsfkdlvvJS5LR1ST2zGWV4SeYJAcSkKse7C4nMc5c+kLY
 Qi6uzvlkQLA2p8S1DAgKx2ANbxAZEKMg6yWLpGHb2gS3RKYoZUog7dXov
 RUP9tmE/6aCv5H6KYqpG9+dbeORhtiNcr3PHfWA98PDQ8qJ5qAYLeNQCv
 Dmk9EFJul4eXYvVT/xWLk51fJO8m2yQzqR+WfF6+TxSc9yRG+7yUhSmsq
 oAidfxyXbqWMeSgvAXi0NcvaRXZv7G4iAR/1ya/RzuEF82IOi3eOcOKrJ A==;
X-CSE-ConnectionGUID: hd1AgCx0S0Kd6NdPSqenHQ==
X-CSE-MsgGUID: JWpZyK3qTWWnYNQPLxAl7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="82632841"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="82632841"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 05:01:10 -0700
X-CSE-ConnectionGUID: kvdABaZySrG6L6hK9W4y+w==
X-CSE-MsgGUID: nDyo7EqsQ/C9OlWEldnyMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="233375262"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 05:01:09 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com, lukasz.laguna@intel.com,
 jakub1.kolakowski@intel.com
Subject: [PATCH 2/2] tests/intel/xe_sriov_vfio: Ensure VFIO fds are closed in
 fixture
Date: Tue, 19 May 2026 14:00:55 +0200
Message-ID: <20260519120055.201038-3-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519120055.201038-1-lukasz.laguna@intel.com>
References: <20260519120055.201038-1-lukasz.laguna@intel.com>
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

Close VFIO file descriptors in the final cleanup fixture to prevent stale
open VFIO fds from blocking VF teardown when disabling VFs.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_sriov_vfio.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_sriov_vfio.c b/tests/intel/xe_sriov_vfio.c
index bb1c02696..f445b6a75 100644
--- a/tests/intel/xe_sriov_vfio.c
+++ b/tests/intel/xe_sriov_vfio.c
@@ -341,6 +341,9 @@ static void restore_xe_vfio_module(void)
 
 int igt_main()
 {
+	struct vfio_dev_fds fds = { .container_fd = -1, .group_fd = -1, .device_fd = -1,
+				    .group_id = NULL };
+
 	igt_fixture() {
 		xe_vfio_loaded_initially = igt_kmod_is_loaded(XE_VFIO_PCI_MOD);
 	}
@@ -404,7 +407,6 @@ int igt_main()
 	igt_describe("Bind VF to xe-vfio-pci and query VFIO region info (BAR sizes). ");
 	igt_subtest("region-info") {
 		unsigned int vf_num = 1;
-		struct vfio_dev_fds fds;
 		char *slot = NULL;
 
 		igt_skip_on_f(igt_kmod_load(XE_VFIO_PCI_MOD, NULL),
@@ -432,6 +434,7 @@ int igt_main()
 	}
 
 	igt_fixture() {
+		vfio_close_device(&fds);
 		cleanup_pf();
 		restore_xe_vfio_module();
 	}
-- 
2.43.0

