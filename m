Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2DDC47258
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jan 2024 05:45:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85FD10E127;
	Tue, 23 Jan 2024 05:45:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3AB10E125
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jan 2024 05:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705988717; x=1737524717;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7PrLcecY25VrQC19mbbY6/DZsLKWVAmKI+QMB/94l4I=;
 b=fXZ4pQcnBqeEUT0KMCK/SXG93fxMOE6CiWr5kiMkTL2DsBvbN2NAregW
 G9MwsSszT7nXshddhqOUDFlHgJ9DqGjVlXj5UESqVmeKp1HTeaO4k7Mb8
 dsNByq52nIZbXMvgl8WdbqPUVM/3Xl8WosMmqNz4ssp9iMJpz5+H8kgTg
 DeBUHQV+F6WdxLLJJiDH95b0ffFOwRBgAl04BiIu59nrgMgbuRzec3atS
 qe6MdldwfbJazv6sNcPYmnd0x/D+rFBIsPCzp6RilQVop2phFm4xUughG
 c7lREE5ECaKEbK3X4ONunmI3gtG9ehnyM2XMddlxFqA88UejWJb7zCNFU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="8789495"
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; 
   d="scan'208";a="8789495"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 21:45:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="735446659"
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; d="scan'208";a="735446659"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by orsmga003.jf.intel.com with ESMTP; 22 Jan 2024 21:45:15 -0800
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t] intel-ci/fast-feedback.testlist: Remove system wide suspend
 testing
Date: Tue, 23 Jan 2024 11:30:47 +0530
Message-Id: <20240123060047.2844372-1-sujaritha.sundaresan@intel.com>
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

Remove system wide suspend/resume testing from fast feedback testlist.
This will be in place until we have a proper logging to from CI to
obtain reliable test results for the same.

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index 60ce1efa4..662e49cc3 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -168,10 +168,3 @@ igt@i915_pm_rpm@module-reload
 # Kernel selftests
 igt@i915_selftest@live
 igt@dmabuf@all-tests
-
-# System wide suspend tests
-igt@i915_suspend@basic-s2idle-without-i915
-igt@i915_suspend@basic-s3-without-i915
-igt@gem_exec_suspend@basic-s0
-igt@gem_exec_suspend@basic-s3
-igt@kms_pipe_crc_basic@suspend-read-crc
-- 
2.25.1

