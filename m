Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A99C83F17
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 16:24:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA7810E4DD;
	Mon, 14 Jul 2025 16:24:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kq2OldHn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D3A810E4DD
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 16:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752510296; x=1784046296;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BjcCC9+zEZkZewmN8aSN2tEhKjylwky3GUXw2JY+lu8=;
 b=Kq2OldHnmdeymN540DleMvCFLRt3nzGtshnen3LjtLXcO7OkDlcEgYRB
 fibCAn7X7iBKr8A1vU8QC2Tj6U9jkZ7TtswIu/pIkR6MwptI5RaIlrrQD
 vlFEpbRIgIf/oEKOjjxdM3/RchevkehBPT8jgX3z6YPnKH7fFHvA1Ddgq
 2YMApxedC1JNCaNwYDhL/1ZXsnfitADgUwmBsXYwDp+8OT7hyMcwpge4k
 ARXV4kreWfhI3V+u9Pbj3+x+DTc/6m0Z1njz1XUk1krTKa/X2m9/dm+Hg
 4+s3ykwLbc344kVGWJ1MILbVkvs/AXrpJ/SsqvibfQxvudYby2SKUOCbU w==;
X-CSE-ConnectionGUID: 1vbYgEnhTmmXIUpV/bFzkg==
X-CSE-MsgGUID: JSjdsW6wSkemju/rfIHweA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54564314"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="54564314"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 09:24:51 -0700
X-CSE-ConnectionGUID: VqX9LTkNTv+JDa+SJBxE2g==
X-CSE-MsgGUID: SgKsKlMkSA6Te2TxHCIMYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="161522493"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.1])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 09:24:48 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH i-g-t v6 2/5] gitlab-ci: Update Intel i915 blocklists
Date: Mon, 14 Jul 2025 18:24:32 +0200
Message-ID: <20250714162435.112599-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714162435.112599-1-kamil.konieczny@linux.intel.com>
References: <20250714162435.112599-1-kamil.konieczny@linux.intel.com>
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
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
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
2.50.1

