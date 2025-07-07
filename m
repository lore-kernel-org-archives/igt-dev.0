Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F497C8303C
	for <igt-dev@archiver.kernel.org>; Mon,  7 Jul 2025 16:23:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B3610E4D2;
	Mon,  7 Jul 2025 16:23:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sk+/Ozov";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DCA410E32F
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jul 2025 16:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751905437; x=1783441437;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=30DlGzHcU/q5weLTu4H6n3iitwCrM8iL9LtgSI32u+8=;
 b=Sk+/OzovCEiRE2/RxWzkld1UnKvPAWni0AsUEuZ9AeWw0MvwluGdFaUJ
 YoENZyqBijWqZZvapXfLgtdu7kS21n0qWjfrCW6yTm7BFD4fXLamW7mhx
 lyoyH6fDvhmFa6n50YYflnna72G9axSp9GGDpDLuNfgHp/k10HRNnG0DP
 iID5j8ZbQG4qYNTW8DJWwVDyseKxBvvZ40S7A8YUyj/OuTUcSneE6ApXR
 WhRU9ZIEmbEm731fugqw5SXSyllUV/eqtNfmd41RRZaLI2MXwKEfnsYaI
 m4NCJxGtsfgUST+XOLJHPzCQ06fQbn9AEHYpRvwRyOr3+6rvYP5pTjFTV A==;
X-CSE-ConnectionGUID: cihIVIB6S/eBVITlKsmsUg==
X-CSE-MsgGUID: siCYfGZzRZ2NggOejqSTTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="76680636"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="76680636"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 09:23:56 -0700
X-CSE-ConnectionGUID: pv61piRNR+eNiu2VARpkPQ==
X-CSE-MsgGUID: uDvco8uDTjeb2S4qbvK8gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="178916095"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.98])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 09:23:55 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH i-g-t v3 2/5] gitlab-ci: Update Intel i915 blocklists
Date: Mon,  7 Jul 2025 18:23:37 +0200
Message-ID: <20250707162340.258267-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707162340.258267-1-kamil.konieczny@linux.intel.com>
References: <20250707162340.258267-1-kamil.konieczny@linux.intel.com>
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

v2: drop xe as there is no pre-merge blocklist (Kamil)

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

fix yml
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

