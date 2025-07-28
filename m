Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C91C83F26
	for <igt-dev@archiver.kernel.org>; Mon, 28 Jul 2025 17:32:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAEBA10E556;
	Mon, 28 Jul 2025 17:32:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GQIR/eeQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F4A10E556
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Jul 2025 17:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753723930; x=1785259930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+ptoJgMPFUALQFXtdwDSCuIf2ngsN+wNEYx1cuszvc4=;
 b=GQIR/eeQWnD116AOPxk1kO2W7UOMdmKwyRr9M+H7BADP+br9j8jfY6Ql
 pnH6EpcYesMbwG5PATJjtKbfcdABFbA48Y2RnAT4i8zNfZ9tNnon4fSlQ
 MMb+XlkCqftAPb3gL+4/ynmb+E09DRfbvaiBfrFe6VdJN3bbBVD1jMpsY
 o6sF6QVjMhzNoCNsZukHwtdCHHk5ncyDGoMyDge4s4KqGt4hbnb4CD8sY
 sKHJuMo/qKKiFyiRngFpkAnZAXlIUZQxDxXzlbxmm6sL2jzij1U3zE0YI
 ebOttFKrgOMgNwwUXxR2JNVWWC1LTajOlHVY17kStb4chcf/dtx6+r3O+ Q==;
X-CSE-ConnectionGUID: b9r5RNvWTQqJY+TDPX/vrg==
X-CSE-MsgGUID: 1UsyJu96RByKB8tbTta6KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="66684070"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="66684070"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 10:32:09 -0700
X-CSE-ConnectionGUID: NBDxdxlHQAuEs+kTuFiKkg==
X-CSE-MsgGUID: PDEn0OGARIuFet4Q5tSXAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="161731591"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.236])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 10:32:07 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>,
 Michal Czaplinski <michal.czaplinski@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Rob Clark <rob.clark@oss.qualcomm.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH i-g-t v1 2/4] gitlab-ci: Rename blocklist verify script
Date: Mon, 28 Jul 2025 19:31:50 +0200
Message-ID: <20250728173152.220113-3-kamil.konieczny@linux.intel.com>
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

Rename verify script and also pipeline which uses it.

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Ewelina Musial <ewelina.musial@intel.com>
Cc: Michal Czaplinski <michal.czaplinski@intel.com>
Cc: Petri Latvala <adrinael@adrinael.net>
Cc: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 .gitlab-ci.yml                                       | 4 ++--
 scripts/{verify-blacklist.sh => verify-blocklist.sh} | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename scripts/{verify-blacklist.sh => verify-blocklist.sh} (100%)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 8098f2b70..fb5713fba 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -227,11 +227,11 @@ test:list-undocumented-tests:
     paths:
       - undocumented_tests.txt
 
-test:verify-blacklists:
+test:verify-blocklists:
   dependencies:
     - build:tests-fedora
   stage: test
-  script: for bl in tests/intel-ci/i915.blocklist{,-pre-merge}.txt; do scripts/verify-blacklist.sh build/runner/igt_runner build/tests "$bl" || exit 1; done
+  script: for bl in tests/intel-ci/i915.blocklist{,-pre-merge}.txt; do scripts/verify-blocklist.sh build/runner/igt_runner build/tests "$bl" || exit 1; done
 
 ################### DEPLOY #########################
 
diff --git a/scripts/verify-blacklist.sh b/scripts/verify-blocklist.sh
similarity index 100%
rename from scripts/verify-blacklist.sh
rename to scripts/verify-blocklist.sh
-- 
2.50.1

