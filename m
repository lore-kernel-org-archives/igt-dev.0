Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BAD4C54E67
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 05:18:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D4210F984;
	Thu, 28 Mar 2024 05:18:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cb6Zi9zB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E02010F984
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 05:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711603110; x=1743139110;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MlDheIUM3g/J8j5F0uVK2ADbe1qJZ8FypOzJoiOUFGM=;
 b=cb6Zi9zBOsCsK8GA6jeR6SOAA2Qr3/0gIqgW4MROPqMIso3XydEMUPGz
 2stzImA6EfLcY8nKR9EWHhd/9afP1YEsA6a5lfCsHOzyzpFqOR+2/iP+A
 uWS+zU2PKmJVITniiFekeMwbEGb9m+/CObRGW95zpfJfPrQPBUUY5+WxP
 F3OHFvn5mNIyn06p0UihEc9mDFZ4sLOqr102wT+U7q7ohi+eGqmvanxe6
 8aYQTdo5rgMM4cL9aqopGjCfqgovX9FM4LwMzP0yDAwiEj8PxGBPX/2h2
 SUIGf7DGzuUzh62VJMUnWKAY18jcy9a0c0Zx0OF/yUbVIKVrHJ4E7+cFU A==;
X-CSE-ConnectionGUID: cV4LS6HhQO2HFPG+yVmOtw==
X-CSE-MsgGUID: rCaMdZE3QMW3wpDNfTNpZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6929951"
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; 
   d="scan'208";a="6929951"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 22:18:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; d="scan'208";a="47510456"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 22:18:28 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t] tests/intel-ci: Drop "xe_exec_threads" from XE BAT
Date: Thu, 28 Mar 2024 10:41:39 +0530
Message-ID: <20240328051139.819455-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
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

Regession with "6.9.0-rc1-xe" is preventing to run KMS tests
in BAT. Hence drop "xe_exec_threads" from XE BAT until we fix
the regression.

Issue: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1044
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 17863b6b1..55339b8ca 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -80,12 +80,6 @@ igt@xe_exec_reset@close-fd-no-exec
 igt@xe_exec_reset@cm-close-fd-no-exec
 igt@xe_exec_reset@virtual-close-fd-no-exec
 igt@xe_exec_store@basic-store
-igt@xe_exec_threads@threads-basic
-igt@xe_exec_threads@threads-mixed-basic
-igt@xe_exec_threads@threads-mixed-shared-vm-basic
-igt@xe_exec_threads@threads-mixed-fd-basic
-igt@xe_exec_threads@threads-mixed-userptr-invalidate
-igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race
 igt@xe_gpgpu_fill@basic
 igt@xe_gt_freq@freq_basic_api
 igt@xe_gt_freq@freq_fixed_idle
-- 
2.43.2

