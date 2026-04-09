Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9140EF364BC
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 20:37:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47FAF10E12D;
	Thu,  9 Apr 2026 20:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nsMHXKEG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C6C10E12D
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 20:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775767024; x=1807303024;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1gikYQZKREl1vt2/lHfkPFuD6AbJhZ6ABV8rNdH6iMA=;
 b=nsMHXKEGQNnxW7GcJHDLPDS1b7e9PpCWxp+7fN0oGtW/GTuTaObxKcot
 qfTahc0/heZVaL4kxkvoFNp6r/gzePJNPxYJpI2HSLVRHQloLVeWMisCZ
 VTLGQeVFuycE1UoiAUmO1sNvoHQ0QFOivfZ9IQS9/wsWv5FxqmbHGfUJQ
 mfgK5eGpn87dM9gbyhtbZO8OV+npKT0azkA1mg8jen50Ny+H7zTD96PQV
 U8Isl2G4DtKULcn6aPotIQaGuJgkFchxqFFsAWUAhr2Yc0kBh/grsF3Pq
 NwiMEiQkHrS3awtCuBqKz8jtXGT1WZ3+V2Hseskbwsvam6QkAErif+y0h g==;
X-CSE-ConnectionGUID: fTC6zrdKSWOdpda9rXNp3A==
X-CSE-MsgGUID: EKVUMTKaSASTiw5W/+Xt2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87858519"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="87858519"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 13:37:04 -0700
X-CSE-ConnectionGUID: N/HOThoNQD+ZxyE6XYIvZA==
X-CSE-MsgGUID: 9b0z8lLKSieOKvMke1pDLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="232950732"
Received: from dut4344arlh.fm.intel.com ([10.105.10.107])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 13:37:04 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: niranjana.vishwanathapura@intel.com, igt-dev@lists.freedesktop.org,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH i-g-t 1/3] tests/intel/xe_exec_reset: Add a comment about
 return for syncobj wait
Date: Thu,  9 Apr 2026 20:36:59 +0000
Message-ID: <20260409203702.4350-2-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409203702.4350-1-stuart.summers@intel.com>
References: <20260409203702.4350-1-stuart.summers@intel.com>
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

Add a comment to the syncobj wait after a hanging submission
to indicate that even for the hang case, we expect the syncobj
wait to return successfully as opposed to the wait ufence case
where we only return successful if hardware did in fact execute
the batch through the MI_USER_INTERRUPT to satisfy the wait ufence.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 lib/xe/xe_legacy.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
index 084445305..6aeddc578 100644
--- a/lib/xe/xe_legacy.c
+++ b/lib/xe/xe_legacy.c
@@ -181,8 +181,13 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		return;
 	}
 
-	for (i = 0; i < n_exec_queues && n_execs; i++)
+	for (i = 0; i < n_exec_queues && n_execs; i++) {
+		/*
+		 * Expectation here is that on reset, submissions will
+		 * still satisfy the syncobj_wait.
+		 */
 		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0, NULL));
+	}
 
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
-- 
2.43.0

