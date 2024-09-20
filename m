Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBA2CF58E5
	for <igt-dev@archiver.kernel.org>; Fri, 20 Sep 2024 08:19:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12AFD10E2F1;
	Fri, 20 Sep 2024 08:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FcHvGfFt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E5110E2F1
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Sep 2024 08:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726820342; x=1758356342;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AvZNQgodv+WVjJXIx+6tY8A9aIl5Ync8uT2gEGttjtg=;
 b=FcHvGfFtHWq3qBfhGGEQOmLhEAP5iYA/bNNus1D6Z24MgXK1d5juBByc
 OSykZ140MLPDIYc9JLy+mWDzSZFnlHijwsjY6vbugayYUMO1peXrWQC/5
 aAdQdmjrBQCZMDPbPYLsdSC5/oZWW4SFTsItu3U31/lNXe6wVSMvPFAC9
 NehCZ8UDy88/VVl8wVEB7Rw2DzZWjw6tR4g9ZnwNpKo5vs3UeosHuR01i
 75rwwD5jSG1dnXqvz1zDLqLEsNCf3VLW3WnRpJ2xtfp8SWMJ9KmneMgvg
 zwwX9pO5q2AbatSQADjsnr9UsFp+1pMHdXtY7EZY/cr+cjJZNBS8O3YmI A==;
X-CSE-ConnectionGUID: fx3EBse4Rf24Qs00QXReKA==
X-CSE-MsgGUID: MUNOaD1cR5W2fqMhd0gFaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="29603004"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="29603004"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 01:19:02 -0700
X-CSE-ConnectionGUID: IzJrVu+/SYyNhUHYx1V2lg==
X-CSE-MsgGUID: gWjyF0WNRsW2R9Orlkb7bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="93537097"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 01:18:56 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t v3] tests/intel/xe_pm_residency: Print execution and
 sleep times
Date: Fri, 20 Sep 2024 14:03:15 +0530
Message-Id: <20240920083315.1763178-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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

Print the workload execution and sleep times of the test to help diagnose
timeouts.

v2: Patchwork test re-run.

v3:
 - Assert if syncobj_wait took more than 1.2 seconds, as it causes the test
   to timeout because test would sleep for more than 120 seconds which
   triggers per task timeout.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_pm_residency.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 0e687558b..343fdd694 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -139,11 +139,14 @@ static void exec_load(int fd, struct drm_xe_engine_class_instance *hwe, unsigned
 		elapsed = igt_nsec_elapsed(&tv);
 		igt_assert_eq(data->data, done[1]);
 
-		igt_debug("Execution took %.3fms (submit %.1fus, wait %.1fus)\n",
+		igt_info("Execution took %.3fms (submit %.1fus, wait %.1fus)\n",
 			  1e-6 * elapsed,
 			  1e-3 * submit,
 			  1e-3 * (elapsed - submit));
 
+		/* Assert if syncobj_wait took more than 1.2 seconds */
+		igt_assert((uint64_t)(elapsed - submit) < (uint64_t)(1.2 * NSEC_PER_SEC));
+
 		syncobj_reset(fd, &syncobj, 1);
 
 		/*
-- 
2.25.1

