Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C47C2BD09
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 13:13:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B681B10E540;
	Tue,  9 Jul 2024 13:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FFVxUsds";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 371D110E540
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 13:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720530787; x=1752066787;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GFzt/cvcWlQn1YPMcsU6PRAY0PKaQU30MO6bOTeJHZw=;
 b=FFVxUsdsVSDPsX7ZytzjMIGCalTdIcnGN/cJABLrYdU3Z12k6mCD4qG/
 fQHKslCl/LHQxg1SIuoDAOe4kB28gPZ9cqhW5rBTzAsoNCe7NYRvNKjXa
 dCFrjolNx8gUCVm2kKAAGFOEFID0m2ogvvzYN2Tlhhp+YCYc0QYXtTqqU
 1biRxut1KCE07dQaSPBAwYkkB+M4mgPcEsa2dVcgJalJrvOcCNVZHnYa9
 rqvGcN1eT2CdDaMzr/NG+n1nGp8cVqfpXIcX+x2W8Ep4KSYQpStc9w5cp
 8stgJ4HCIo2kXMXn4NcUUc/9jo7JlwhcH8TeZVNbVFeLsGDfUXMl0av3v Q==;
X-CSE-ConnectionGUID: t8TMiiUDTvC7cosofA5kyQ==
X-CSE-MsgGUID: QnmRtt8YRVy2ml4bN9CWiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="12451931"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="12451931"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 06:13:06 -0700
X-CSE-ConnectionGUID: Gs8OTtdkRhGw8ZjM2E9Wvw==
X-CSE-MsgGUID: 2u4wzP37Q7WjPI+O9cOU0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="47826923"
Received: from tmistat.igk.intel.com ([10.91.214.42])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 06:13:05 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Adam Miszczak <adam.miszczak@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <Michal.Wajdeczko@intel.com>
Subject: [PATCH i-g-t] tests/intel-ci/xe.blocklist: Add SR-IOV tests
Date: Tue,  9 Jul 2024 13:42:24 +0000
Message-Id: <20240709134224.653830-1-jakub1.kolakowski@intel.com>
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

Add SR-IOV tests to xe blocklist so that only desired tests will be run
in CI.
SR-IOV tests that should be running are as follows:
- sriov_basic@enable-vfs-autoprobe-off (all dynamic subtests)
- sriov_basic@enable-vfs-bind-unbind-each@numvfs-all

Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Adam Miszczak <adam.miszczak@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 828baf324..b1a2e11d8 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -83,3 +83,9 @@ igt@kms_prime@.*
 ##################################################################
 igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot
 ##################################################################
+# SR-IOV tests
+##################################################################
+igt@sriov_basic@enable-vfs-autoprobe-on@.*
+igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-(?!all).*
+igt@sriov_basic@bind-unbind-vf@.*
+##################################################################
-- 
2.25.1

