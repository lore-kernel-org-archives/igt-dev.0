Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347C9C79F9E
	for <igt-dev@archiver.kernel.org>; Mon,  7 Sep 2026 12:56:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A9E10E36C;
	Mon,  7 Sep 2026 12:56:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RDyAxWV/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9027A10E36C
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Sep 2026 12:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788785745; x=1820321745;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=T/ePO6cVpjjVSLXXAvJ5aHjtJzZofvxwGsjf6k5oOG0=;
 b=RDyAxWV/ZPHNJHYjVmWxVXxtbiFuZ/ZzPj7yicPmx3CvVSeI49lMlqe1
 mOqOsJa3v3Yja+s5woAfJEwdj4fwmlg8LgMJ9cZztNj7q1oPAYLShGEng
 1JYyfB9rkoVqgYGo6WIYUALu1vueunB5nfi12BukhyTZYXuMUBN5nbacU
 GXtGJ/15PoklMsM+1YWlNDTwYFD4XqdiXAgfDt17QB9V9zdDBDoljPrJj
 9NeoPquI4mSML0VCovlVd4rp2R7SrlbF6YcDSbJdMWaRWkQYP0wWelfms
 M1ryqLEEuF3ARQPBZS2p8la2p2XfNj0AmU/zGJe00qOgZvT5Qe0LWEj3M Q==;
X-CSE-ConnectionGUID: cmGFuexwQgmLDdgzRvQMOA==
X-CSE-MsgGUID: ytVRpKqvQpK/70hy3mr72Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="88336857"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="88336857"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 05:55:44 -0700
X-CSE-ConnectionGUID: co0Mea+FSo2AklGY7ggnAw==
X-CSE-MsgGUID: IW+dPvE4SqmSRSd1VEccaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="269400789"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 05:55:43 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com
Subject: [PATCH v1] tests/intel/xe_sriov_ggtt: Install SR-IOV exit handler
Date: Mon,  7 Sep 2026 14:55:37 +0200
Message-ID: <20260907125537.617132-1-lukasz.laguna@intel.com>
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

Install SR-IOV exit handler in the test to disable VFs and restore
driver autoprobe on exit.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_sriov_ggtt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_sriov_ggtt.c b/tests/intel/xe_sriov_ggtt.c
index 2c2184930..bcd763eb0 100644
--- a/tests/intel/xe_sriov_ggtt.c
+++ b/tests/intel/xe_sriov_ggtt.c
@@ -701,6 +701,7 @@ int igt_main_args("", long_opts, help_str, opts_handler, NULL)
 		igt_require(igt_sriov_is_pf(pf_fd));
 		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
 		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
+		igt_sriov_install_exit_handler(pf_fd, NULL, NULL);
 	}
 
 	igt_describe("Verify that the VF ID in the GGTT PTE has been correctly assigned");
@@ -752,6 +753,7 @@ int igt_main_args("", long_opts, help_str, opts_handler, NULL)
 			    igt_sriov_disable_driver_autoprobe(pf_fd);
 		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
 			       "Failed to restore sriov_drivers_autoprobe value\n");
+		igt_sriov_clear_exit_handler();
 		drm_close_driver(pf_fd);
 	}
 }
-- 
2.43.0

