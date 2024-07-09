Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFF2C2BD09
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 10:59:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8060D10E4FE;
	Tue,  9 Jul 2024 10:59:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g727kKnP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F8010E4FE
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 10:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720522744; x=1752058744;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=z6YdM1u599eFYR6qLInR1m8YKpHyOiJFQYATg9f30xc=;
 b=g727kKnPbBTkcan5drwNkib7wJzPjEyFNtE3QK0kJTM8hOQFiSUxuys8
 WtSx5mb+Zy0L1bqE1hYBUnQP7Gq/eikwZhbhwpRK7NbRWS8obRFifD8K/
 Z0zOOGdOQUh94fVx8/ASwVv93pnpWCo1bG2H8Gc970Ay4QJW3/b05pGcX
 gxbhpBO8Tsy+KJsUYjxJ+ujccOWB/pUH5KSd5uK+XPpHpPCyfuPXm/U9D
 W1R2eFu3CcAOis1Izh/4lB83rM/JglLDMHUepY97RNSrxj+JLCQmxs2CT
 UyJG3gdbvgfKTYCuZY+OMjLwhauIloxtL8Shh8rpOLM4zTraC5FZl9iM4 g==;
X-CSE-ConnectionGUID: PkQt4jo8TrCh3kk2+uKCjA==
X-CSE-MsgGUID: BbL7xJYwTiW4Bp+9Q5ClIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17606272"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; d="scan'208";a="17606272"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 03:59:04 -0700
X-CSE-ConnectionGUID: Z2+XOP9hR2a1l1k6qLiLQQ==
X-CSE-MsgGUID: LP+AxaEAQtqQdMjeFjdocQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; d="scan'208";a="47786203"
Received: from tmistat.igk.intel.com ([10.91.214.42])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 03:59:01 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Adam Miszczak <adam.miszczak@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <Michal.Wajdeczko@intel.com>
Subject: [PATCH i-g-t] tests/intel-ci/xe.blocklist: Add SR-IOV tests
Date: Tue,  9 Jul 2024 11:27:36 +0000
Message-Id: <20240709112736.652364-1-jakub1.kolakowski@intel.com>
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
- sriov_basic@enable-vfs-autoprobe-on@numvfs-all
- sriov_basic@enable-vfs-bind-unbind-each@numvfs-all
- sriov_basic@bind-unbind-vf@vf-1
- sriov_basic@bind-unbind-vf@vf-last

Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Adam Miszczak <adam.miszczak@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 828baf324..57e550885 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -83,3 +83,9 @@ igt@kms_prime@.*
 ##################################################################
 igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot
 ##################################################################
+# SR-IOV tests
+##################################################################
+igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-(?!all).*
+igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-(?!all).*
+igt@sriov_basic@bind-unbind-vf@vf-(?!(1$|last)).*
+##################################################################
-- 
2.25.1

