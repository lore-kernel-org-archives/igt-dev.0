Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73053C83F07
	for <igt-dev@archiver.kernel.org>; Mon,  7 Jul 2025 09:41:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D3C10E34C;
	Mon,  7 Jul 2025 09:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eXWJBn8T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61FAF10E34C
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jul 2025 09:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751881314; x=1783417314;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WJlRT+eYZwzNQJkAGbUPaKRh6rrIL0ayVvRTkCOOilE=;
 b=eXWJBn8TDSQbZhiFOQtsZK4eltpSZ/kzWNe0EU4yqiBzvhdeiXimEJyw
 RDizDDSNoeWo0s42IsgitdlA69/xJwUybLnQHEW5PhrlO6IRbV/TPCp8K
 C7vyE6V3n3syyhq3UxFqcx/3jlAMCWD7PhzxPxZJOjiBndgWcEup+VTiW
 huI5uKG6vdi+FYQ4R4rAre+Ado3RM30sW7XEczmN7oV/5iMc3ZqU51cDE
 dojWEc/7rhB8rDf1huMamGOK7PSTdamw7X1dBzrCRH2XLLLMEq+51Ol0M
 q5L9xeGxx1P3b62JpzOOjP5xmn3oMyUEwVyl6zDQgyIzAUJU9yDTn8qzA w==;
X-CSE-ConnectionGUID: w6YOhr/MSkuLTsGKEN6g4Q==
X-CSE-MsgGUID: qvq9pepRRPmzfPxZDviAPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="65550839"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="65550839"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 02:41:54 -0700
X-CSE-ConnectionGUID: MZq4yr6WT6aayJt8TPI9aA==
X-CSE-MsgGUID: E2lKSqVBTOmL9MullzrI8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="155297665"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.67])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 02:41:53 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH i-g-t v2 2/5] gitlab-ci: Update Intel blocklists
Date: Mon,  7 Jul 2025 11:41:15 +0200
Message-ID: <20250707094118.84046-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707094118.84046-1-kamil.konieczny@linux.intel.com>
References: <20250707094118.84046-1-kamil.konieczny@linux.intel.com>
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

Update Intel blocklist names and also while at it add Xe for
testing.

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 637112e4e..1eced6593 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -231,7 +231,7 @@ test:verify-blacklists:
   dependencies:
     - build:tests-fedora
   stage: test
-  script: for bl in tests/intel-ci/blacklist{,-pre-merge}.txt; do scripts/verify-blacklist.sh build/runner/igt_runner build/tests "$bl" || exit 1; done
+  script: for bl in tests/intel-ci/{xe,i915}.blocklist{,-pre-merge}.txt; do scripts/verify-blacklist.sh build/runner/igt_runner build/tests "$bl" || exit 1; done
 
 ################### DEPLOY #########################
 
-- 
2.49.0

