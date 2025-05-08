Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF5FC3ABC0
	for <igt-dev@archiver.kernel.org>; Thu,  8 May 2025 14:13:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C3A710E914;
	Thu,  8 May 2025 14:13:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V7WRZ2Dd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E760310E914
 for <igt-dev@lists.freedesktop.org>; Thu,  8 May 2025 14:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746713584; x=1778249584;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=C7NyJZCzg9keFkMIJ4ZqH7yDFlrqW1WMQvAXxEBfzIc=;
 b=V7WRZ2Ddesak+b9s9X8+eFleB7P9l99TjW6DUyijav5WpdjUQbR85blw
 LpzBt/3jasPxo8HQ/vdhXShaYmJ26H99hS7rGC+BFGm/wgfYng5yMn3Kc
 cuyZ8WNbFA4TQH8RoWXEEkI270S+BQs66VwMbn38dQAZ31lymVT4FdE8P
 fsAiWwHMjQgX8P+d2iz3dHAwUQx7mzBrJCk8Ij48Ir71u5CjpLZPiNibd
 XUjehlnve9jK+ziYpM2mlMFZWzQOnuYeIyPXd2GKRYkpAhoMV10IdwSWe
 vGapmEttkhldRxx4VF0zzjwwBBRbhGoWeQqd1aFajCWr4nJvt9IQcYmVe A==;
X-CSE-ConnectionGUID: mkTWl0XkSrCevwAqlF9duQ==
X-CSE-MsgGUID: EQ1vjMDUSva0sHlF67h1uQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="51162221"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="51162221"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 07:13:03 -0700
X-CSE-ConnectionGUID: I2XCBhHHR3CYDMRdykQvEg==
X-CSE-MsgGUID: c4Nu3qxOT6KHxCC9Ipz0vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="136186907"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.215])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 07:13:02 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ryszard Knop <dragoon@dragonic.eu>, Petri Latvala <adrinael@adrinael.net>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] gitlab-ci: Remove MIPS testing
Date: Thu,  8 May 2025 16:12:49 +0200
Message-ID: <20250508141249.66409-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
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

From: Ryszard Knop <dragoon@dragonic.eu>

MIPS testing was commented out years ago and it does not look
like it is coming back, so just nuke it.

Cc: Petri Latvala <adrinael@adrinael.net>
Signed-off-by: Ryszard Knop <dragoon@dragonic.eu>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 .gitlab-ci.yml | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a6c076dba..409e6c1be 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -218,22 +218,6 @@ test:ninja-test-minimal:
 #       - build
 #     when: on_failure
 
-# mips testing temporarily disabled
-# test:ninja-test-mips:
-#   retry: 2
-#   image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-mips:commit-$CI_COMMIT_SHA
-#   dependencies:
-#     - build:tests-debian-meson-mips
-#   stage: test
-#   script:
-#     - export PKG_CONFIG_PATH=/usr/lib/mips-linux-gnu/pkgconfig/
-#     - env > build/envdump.txt
-#     - meson test -C build --num-processes ${FDO_CI_CONCURRENT:-4}
-#   artifacts:
-#     paths:
-#       - build
-#     when: on_failure
-
 test:list-undocumented-tests:
   dependencies:
     - build:tests-fedora
-- 
2.49.0

