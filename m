Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA2CDC83F09
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 15:28:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A0AD10E688;
	Tue,  8 Jul 2025 15:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mmITokFd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4668410E688
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jul 2025 15:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751988504; x=1783524504;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nm9IISow95LD5GVypumfqGGUoWpyhtp9CU5qFPV4uAE=;
 b=mmITokFdPd2hdqrZjCE4aeaKfxdCVBXCYpJC80pB/UCbYMhjl0t9WFuh
 rMTTWGRPl+xl/Sw37myd7yuARD60xlP5YrSp6lmYfnYH2N7rP7MsoonUS
 NJlR5f8vVg/L+yG2X2msDPJWryXC7rvnrdw0ENB3qgQ8RJ8QVynGOjdNA
 lD4UScdXV5T9XNyQUAOZM9ymzBDd7jPYbgyxwRYU6uOc/K/SXdRlQXIBo
 o5vyGQQsQ7xarN2jPCzjfB75i0kLLrXnSdW75/3Q2IETbDHY1QOVMtk1p
 oIPARbrH5ED56tmGIqJa6o0mYr9tyiCorjIKfbwFWM2Y5teuEY7tMqE3w g==;
X-CSE-ConnectionGUID: qT6UUUV9RC2DlRHkOjgM9Q==
X-CSE-MsgGUID: 2eMdW5RpRVK55XE/WHjP9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="53947166"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="53947166"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 08:28:23 -0700
X-CSE-ConnectionGUID: VOYYxnzcSK2pl0A4Av6VZA==
X-CSE-MsgGUID: fJ+BjCmiS8q3dGRSf0CQlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="154937659"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.16])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 08:28:22 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH i-g-t v4 2/5] gitlab-ci: Update Intel i915 blocklists
Date: Tue,  8 Jul 2025 17:28:05 +0200
Message-ID: <20250708152808.59977-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708152808.59977-1-kamil.konieczny@linux.intel.com>
References: <20250708152808.59977-1-kamil.konieczny@linux.intel.com>
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

Update Intel blocklist names in runner testing.

v2: drop xe as this should simplify change, also
  there is no pre-merge for xe (Kamil)

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 637112e4e..8098f2b70 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -231,7 +231,7 @@ test:verify-blacklists:
   dependencies:
     - build:tests-fedora
   stage: test
-  script: for bl in tests/intel-ci/blacklist{,-pre-merge}.txt; do scripts/verify-blacklist.sh build/runner/igt_runner build/tests "$bl" || exit 1; done
+  script: for bl in tests/intel-ci/i915.blocklist{,-pre-merge}.txt; do scripts/verify-blacklist.sh build/runner/igt_runner build/tests "$bl" || exit 1; done
 
 ################### DEPLOY #########################
 
-- 
2.49.0

