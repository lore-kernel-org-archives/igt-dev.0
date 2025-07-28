Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34E8C83F17
	for <igt-dev@archiver.kernel.org>; Mon, 28 Jul 2025 17:32:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3187510E555;
	Mon, 28 Jul 2025 17:32:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YKQBRZ+1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC51D10E55A
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Jul 2025 17:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753723934; x=1785259934;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OOcYq/lShdkL6/zhP1VkfiCTczm02eLd3D4J3XB9EiI=;
 b=YKQBRZ+1/4z743N8iPuGLLmjib4/F2dkmbHXEpmcoj0VChCsE7uygASh
 zf1kLEUBLnuTKN2ANdW/pPPSNKR4FL+sy5ruAFlC8IVIs2Dz1Ryt5R4Li
 HDCnIuf8FPeppErTlNXR9ZXv3yUXYvwVfThwXjnTwPWjNPJy7Q/urU//a
 JKOWghkOgf1bolayO8ETfvi5iY+U7ZylePbULgySYCs7qArSPtD2UtwOG
 MKFDAPjCDcmUx0cDjQ7HX/CoJddqbWiIxRs64UOA/V5wIQKIkxHaxS5Jq
 x45kMSkemsZ07ol9AqLlk8QZi0j7eze08/P3yPW12rQ6Pw9WXEt9kRARt A==;
X-CSE-ConnectionGUID: pqIYHD6lRCmmjZDfnFozzQ==
X-CSE-MsgGUID: 98W5a7KbRpimwvpJhwMOsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="66684093"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="66684093"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 10:32:14 -0700
X-CSE-ConnectionGUID: YCAbHXcfRqmfMvbqEsDsAg==
X-CSE-MsgGUID: x8fHXN+GTEyDrDG+XO0sbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="161731598"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.236])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 10:32:13 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH i-g-t v1 3/4] scripts: Update documentation for blocklist
 verification
Date: Mon, 28 Jul 2025 19:31:51 +0200
Message-ID: <20250728173152.220113-4-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728173152.220113-1-kamil.konieczny@linux.intel.com>
References: <20250728173152.220113-1-kamil.konieczny@linux.intel.com>
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

Update documentation to be up to date after changes. Also while
at this, add SPDX MIT licence.

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 scripts/verify-blocklist.sh | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/verify-blocklist.sh b/scripts/verify-blocklist.sh
index 05383f13f..2bb72af98 100755
--- a/scripts/verify-blocklist.sh
+++ b/scripts/verify-blocklist.sh
@@ -1,13 +1,14 @@
 #!/bin/sh
+# SPDX-License-Identifier: MIT
 
-# Verify that all entries in a blacklist file are still valid
+# Verify that all entries in a blocklist file are still valid
 
 usage() {
-    echo "Usage: $0 <path-to-igt-runner> <test-binary-directory> <blacklist-files ...>"
+    echo "Usage: $0 <path-to-igt-runner> <test-binary-directory> <blocklist-files ...>"
     echo
     echo " path-to-igt-runner: For example build/runner/igt_runner"
     echo " test-binary-directory: For example build/tests"
-    echo " blacklist-files: For example tests/intel-ci/blacklist.txt"
+    echo " blocklist-files: For example tests/intel-ci/i915.blocklist.txt"
     exit 2
 }
 
-- 
2.50.1

