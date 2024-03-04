Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805CDC48BF6
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 10:19:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B2510FF51;
	Mon,  4 Mar 2024 10:19:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TKiloIAg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3093610FF2B
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 10:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709547546; x=1741083546;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B6zWBh5FMJZmAher+nsdifxpouPVkbb4ZiVxp4qNkns=;
 b=TKiloIAgc6MkxHHxqUQL8huiN1RYYD/hreZ7A/cWvWPPKEAPzO8Tkc1b
 OzBMOBbqlFGb2jUuGNVNs9PJfRpXoRyVnG9JTNlUBV2Z7hSGhMLgQnTAS
 vhn5FCz7EqWqdmatk+VhUv2Y+CCGci1Fm+QgHiXPFwzJxS6qzj0F98ArR
 KfhP3cEC6ummmD3ru/h7c/KecqTGCwI8ZzzKSMIF0Wgbsrzra1TTIrmOW
 mJj0eheDqslCKpsMUmaL/2XSI1yazc86vfCfDcRrjooGgIMmVmgfwlU84
 SI+WJDsFqkhBlFDEqy79kT+cWkRA0Cm2RtL2wdXjygFpjykujEg/nQm+P g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="3887899"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="3887899"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 02:19:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="8897977"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 02:19:04 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel-ci/xe: Block PSR + DRRS tests
Date: Mon,  4 Mar 2024 15:42:51 +0530
Message-ID: <20240304101252.3242812-1-bhanuprakash.modem@intel.com>
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

As Driver prefers PSR over DRRS, we can't enable PSR & DRRS
together. Hence block PSR + DRRS subtests in CI.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index cd8960c64..bc1325bae 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -72,6 +72,10 @@ igt@kms_rotation_crc@exhaust-fences
 igt@kms_pm_lpsp@screens-disabled
 igt@kms_pm_rpm@(fences|fences-dpms|pm-caching|pm-tiling)
 ##################################################################
+# KMS: Invalid combo:- PSR + DRRS can't be tested together
+##################################################################
+igt@kms_frontbuffer_tracking@(fbcpsrdrrs|psrdrrs).*
+##################################################################
 # KMS: Yet to add/missing XE support
 ##################################################################
 igt@kms_prime@.*
-- 
2.43.0

