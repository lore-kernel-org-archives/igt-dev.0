Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90093606A331
	for <igt-dev@archiver.kernel.org>; Thu, 12 Nov 2026 16:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HqWtNYzT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2300B10E0B5;
	Thu, 12 Nov 2026 16:05:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B4810E0B5
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2026 16:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794499485; x=1826035485;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RbMIwo9748lQSGjRY7FOYLr05JFJvWVxzr8UHRN2Fss=;
 b=HqWtNYzTF8wJWsZsbkkic4AHb8j7KUWOBHjZ4dc/jeDRDlW/K0mYo3Cv
 16O9LlMmdSS9iPPaVF9Zdka1VR34hAqEc5QnpWk63N/VR0F50CZm0aS2R
 +Qv9Y+u7euSC00IPsQ/GeRlXHEDhR3DnMGYtCOorYEXB7gmOurb1dcnAO
 n4wo6PWvT805IT8tCLxk8Tp0QtZRCx3Tk/oTwLcZowTDdCFVriFYGeM0e
 Obar3M0quoO6LIw6Q3qvCZph1QvUUngug6xghffRFT/KIWc1H2iV7oC3/
 1eT2ATNOelRdtnzEtssulexGvGdmzado/mVAuOd3sG0+AXyOY/Ez5tLX5 g==;
X-CSE-ConnectionGUID: hBbrj/t+QdCbJn7msUFgvA==
X-CSE-MsgGUID: nqjjXYK0R7iTg1oreR9rag==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3374067"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3374067"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 08:04:45 -0800
X-CSE-ConnectionGUID: CrrseTvRTJS49cITOBh97A==
X-CSE-MsgGUID: Jqp237mrSQuM9Lr6RLwoUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8866286"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 08:04:43 -0800
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, sk.anirban@intel.com,
 kamil.konieczny@linux.intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH] intel-ci: Block xe_err_injection tests
Date: Thu, 12 Nov 2026 21:34:28 +0530
Message-Id: <20261112160428.1459730-1-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

xe_err_injection tests are only supported on CRI, so block it on the other
xe platforms.

Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
 tests/intel-ci/xe.bmg.core.blocklist.txt | 2 ++
 tests/intel-ci/xe.lnl.core.blocklist.txt | 2 ++
 tests/intel-ci/xe.nvl.core.blocklist.txt | 2 ++
 tests/intel-ci/xe.ptl.core.blocklist.txt | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/tests/intel-ci/xe.bmg.core.blocklist.txt b/tests/intel-ci/xe.bmg.core.blocklist.txt
index e7b57558b..ea2b285a4 100644
--- a/tests/intel-ci/xe.bmg.core.blocklist.txt
+++ b/tests/intel-ci/xe.bmg.core.blocklist.txt
@@ -80,3 +80,5 @@ igt@.*multi.queue.*
 ##################################################################
 igt@xe_wedged@cold-reset-wedged
 ##################################################################
+igt@xe_err_injection@.*
+##################################################################
diff --git a/tests/intel-ci/xe.lnl.core.blocklist.txt b/tests/intel-ci/xe.lnl.core.blocklist.txt
index 970c88932..769cfe8d2 100644
--- a/tests/intel-ci/xe.lnl.core.blocklist.txt
+++ b/tests/intel-ci/xe.lnl.core.blocklist.txt
@@ -108,3 +108,5 @@ igt@.*multi.queue.*
 ##################################################################
 igt@xe_wedged@cold-reset-wedged
 ##################################################################
+igt@xe_err_injection@.*
+##################################################################
diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-ci/xe.nvl.core.blocklist.txt
index b960c15cc..91f9b1a47 100644
--- a/tests/intel-ci/xe.nvl.core.blocklist.txt
+++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
@@ -109,3 +109,5 @@ igt@xe_live_ktest@xe_eudebug
 ##################################################################
 igt@xe_wedged@cold-reset-wedged
 ##################################################################
+igt@xe_err_injection@.*
+##################################################################
diff --git a/tests/intel-ci/xe.ptl.core.blocklist.txt b/tests/intel-ci/xe.ptl.core.blocklist.txt
index e2284bdfe..30978ad60 100644
--- a/tests/intel-ci/xe.ptl.core.blocklist.txt
+++ b/tests/intel-ci/xe.ptl.core.blocklist.txt
@@ -88,3 +88,5 @@ igt@.*multi.queue.*
 ##################################################################
 igt@xe_wedged@cold-reset-wedged
 ##################################################################
+igt@xe_err_injection@.*
+##################################################################
-- 
2.34.1

