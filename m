Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9835FED9E0
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 15:21:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56ED710E10F;
	Tue, 17 Mar 2026 15:21:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PWMb6VTX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2772710E10F
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 15:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773760896; x=1805296896;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2aLQv9SRw33HtZYS3AHqDKrGWTYpqcVSng/nufwMazg=;
 b=PWMb6VTXMaxeWtE3gwl3VhB/mbrZj3ckKTJdwQ+YkC+zYZsvdtvScfcQ
 EZK6mrp1U/g1BG08XQMwpeYxvJsqmBFg8bV93ITSsTbLxDnnSrkETd+u3
 F6hbRT8B6OLHHKUf5icjx4IBQdmFvzrJdgQdikyAXOKY4P8iksx6jfRcQ
 XuWZjVWL7Utaorn/F7tq9bYzOpMsX5VnSE0VxkHJhZYwa9V8IHlJiaqvy
 0Jt7IWbvA6Y4LrC/nLNVYKMHSxgVk5vhR+fOVbMP86626+Z0ESoKLms5c
 mHec4g19NlmKgVtdMSQgwWvBzmpVAMZTk0DvR27fAFQ1npONopd1HYML3 w==;
X-CSE-ConnectionGUID: 6Q14+6o1T/SRS2DLoZPM5A==
X-CSE-MsgGUID: B3K9yBZCSnqns/P5ub8DKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="86271047"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="86271047"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 08:21:36 -0700
X-CSE-ConnectionGUID: kGiQJrOOQzOED0TOGveLQg==
X-CSE-MsgGUID: tsJIzE68R96fuM0r5e5aPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="224454716"
Received: from dut2084bmgfrd.iind.intel.com ([10.223.34.11])
 by fmviesa004.fm.intel.com with ESMTP; 17 Mar 2026 08:21:34 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Skip
 madvise-pat-idx-uc-comp-* compression tests on PVC
Date: Tue, 17 Mar 2026 15:21:32 +0000
Message-Id: <20260317152132.744204-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Nishit Sharma <nishit.sharma@intel.com>

Add a check to skip "madvise-pat-idx-uc-comp-*" compression-related PAT
index subtests on Ponte Vecchio (PVC) platforms.
This prevents running unsupported or problematic compression tests for
the "uc-comp" variant on PVC hardware.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index c645f6491..e0217c9d5 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -2517,6 +2517,7 @@ int igt_main()
 	};
 
 	int fd, svm_compute_loops = getenv_int("IGT_SVM_COMPUTE_LOOPS", 1);
+	uint16_t dev_id;
 
 	igt_fixture() {
 		struct xe_device *xe;
@@ -2527,6 +2528,7 @@ int igt_main()
 		xe = xe_device_get(fd);
 		va_bits = xe->va_bits;
 		open_sync_file();
+		dev_id = intel_get_drm_devid(fd);
 	}
 
 	for (const struct section *s = sections; s->name; s++) {
@@ -2727,6 +2729,9 @@ int igt_main()
 			     !xe_has_vram(fd)) {
 				igt_skip("Skipping compression-related PAT index\n");
 			}
+			if (IS_PONTEVECCHIO(dev_id) &&
+			    strstr(s->name, "madvise-pat-idx-uc-comp-"))
+				igt_skip("Skipping compression test on PVC\n");
 			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 1, SZ_4M, 0, 0, NULL, NULL, s->flags, s->fn);
 		}
-- 
2.34.1

