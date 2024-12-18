Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB2BE77187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 14:05:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B0A10E318;
	Wed, 18 Dec 2024 14:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y1hDTid2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE78C10E318
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 14:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734530705; x=1766066705;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RP3iGWJktvKF7A08gvQiOmLkcwkVezDjZj6w1rYy7Fg=;
 b=Y1hDTid2abdO77U7g9MCZL+yJHh5+zVyIs+nuclMpop7l0PeshtZFNAr
 TirUOQ85HNx59TaD4VigcX3Vec1j9RuFiT2j67Xfh0ox7e2aoqgsVIrzr
 OWF3ViN/yz3rJcfcJH3B3YYZxF7deHRuGCLfRROJVskG514KSr+SZGQzr
 72cGjbkxkcz/zVFgKr6jngCG/Z9DLZJxdH0n0r2R7djZXbLE5PChwpX/x
 pqOerUpvyBU3/GWXi6Uuwua11NcZAGTdB0PsqVwwGPsy/9QmyrHv+XaWb
 9IhMNONlSwLO+YytDozOAIJ9L2Jbf+TEkJkfQcMw+cDtrwn+ZqjYhqIjL A==;
X-CSE-ConnectionGUID: 0vzM0CTiQ5OYhvoJRGdHiA==
X-CSE-MsgGUID: WTUlJJuQQPu1ltiy9N4Atw==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35133617"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="35133617"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 06:05:05 -0800
X-CSE-ConnectionGUID: Z1H2cgrmTGuBCAK9bPX5VA==
X-CSE-MsgGUID: qjtDPcfCT4+05EadxhdQ7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="97720366"
Received: from nirmoyda-desk.igk.intel.com ([10.211.135.230])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 06:05:03 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] intel-ci/xe.blocklist: Block the updated shrink test
Date: Wed, 18 Dec 2024 15:24:07 +0100
Message-ID: <20241218142407.2558613-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

xe_bo_shrink_kunit, sub-dynamic test is now updated to be a subtest
in the kernel so update this blocklist accordingly.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index e29e745a0..189cc25a7 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -31,7 +31,7 @@ igt@kms_selftest.*
 ##################################################################
 # Exclude slow KUnit test which should run as manual test
 ##################################################################
-igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit
+igt@xe_live_ktest@xe_bo_shrink
 ##################################################################
 # Exclude all other non-Xe tests
 ##################################################################
-- 
2.46.0

