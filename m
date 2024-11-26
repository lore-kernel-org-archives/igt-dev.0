Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C19BD66B84
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 23:02:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A620B10E0CC;
	Tue, 26 Nov 2024 23:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HFBbI7rk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD3610E0CC
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Nov 2024 23:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732662171; x=1764198171;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dvWDG1MZPojP+3hurTuZDf7YJUTT2izUuxWp6k8YghA=;
 b=HFBbI7rk1uVL+yTXWy5iPtYZXhT8JEmQ6bs25iLNDxKzcrWsrKgzWcrZ
 kp+H9nevHg8u+oAn4lfzk0jwqevIOs4kWSfxctNWIHxH4Ok4LiJtkcGi0
 xDj4bMF/+XJk0ypOqTsVjT5a90I6cTV3LbbSvFxVcE3pLhKskkdt97/ha
 1od7T8p5wByMuXpFrXfc1/BxGSzbL7w+Y9bPEBVIQODi1hKiQnAcjVcgH
 TFQkf67uqDLYuM0S6atwji/R97zaKlApaFhWqQhpaXNsQpjjBUFM1vbum
 3MOwpwhQdb4PVIT7WmEKDG+mb/hSFzyEP9jxGE9C3w2VNenKJxtdYRiMM Q==;
X-CSE-ConnectionGUID: 60XSgx3KSwyW6jL3A5HOLA==
X-CSE-MsgGUID: KI4IWUoFSV2IUDP4jAAgZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="35712434"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208";a="35712434"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 15:02:50 -0800
X-CSE-ConnectionGUID: 0bNrxAshSEiYs4o3TmsaTQ==
X-CSE-MsgGUID: ACHVG8fmSrqaNrT7XB8BWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208";a="92567722"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 15:02:50 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_wedged: Manage verbosity of GT reset
 fault injection
Date: Tue, 26 Nov 2024 15:02:40 -0800
Message-ID: <20241126230240.1780940-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.47.0
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

igt@xe_wedged@basic-wedged triggers a GT reset and uses fault injection
to ensure that the reset artificially fails.  This works as expected,
but depending on the value in the fail_gt_reset/verbose debugfs
when the test starts, different levels of output may be printed to
dmesg.  The test already marks the general "declared wedged" message as
expected so that igt_runner won't try to flag those as test errors, but
if verbose=2, then the fault injection framework will also issue print
dump_stack() output which gets flagged as a problem by igt_runner.

Explicitly set verbose=1 when running the test so that we get the
general wedged message and fault injection notification (which we
already tell igt_runner to ignore), but skip the unnecessary stack dump
that just confuses the runner.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2919
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 tests/intel/xe_wedged.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index 88e5d47f2..0db8c8eba 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -213,6 +213,7 @@ igt_main
 	igt_subtest("basic-wedged") {
 		igt_require(igt_debugfs_exists(fd, "fail_gt_reset/probability",
 					       O_RDWR));
+		igt_debugfs_write(fd, "fail_gt_reset/verbose", "1");
 
 		igt_assert_eq(simple_ioctl(fd), 0);
 		ignore_wedged_in_dmesg();
-- 
2.47.0

