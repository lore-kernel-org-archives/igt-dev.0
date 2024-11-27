Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64260D609C4
	for <igt-dev@archiver.kernel.org>; Wed, 27 Nov 2024 09:45:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A5710EA68;
	Wed, 27 Nov 2024 09:45:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y+SElzvd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C7A10EA68
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Nov 2024 09:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732700745; x=1764236745;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CTFVg3MFSAbmRLGbfoeyg0cBF25V8Rt1V8ASXTiFS9I=;
 b=Y+SElzvdZFZpQiRb1wm5Bu/Gogm+YBe0MzYquBkrw3M0B1msP4iiSu6R
 8LPsSCBSSiCNUpQwNnfNEBa38TftXI/ZSvd7LpVh+kRY+tMZZUDKq7XyE
 kwcI5YULfSDoHFoBTF8yFSPQa+UZW+HhhyR1UYAGnAPC9ot3531LRmreF
 gYdM1rOl/d10jSBuVQ3n8JsGbtK6JwxBftLAFUdwZk2CINFopvABjtVM/
 eGj7SpEwa7ly/hkvMUzdCWnBnfkAl39jgSNu13+VjsXNHiJlXRYn6Er/8
 gcEI/P0+b3QK7WhQew+fJMX/BNSvcDhoWbNSLufGlOGSGwfAHHysHnJDr w==;
X-CSE-ConnectionGUID: E3G+Ma+BSKG1UWgACm8kEg==
X-CSE-MsgGUID: fbnEqXq7RYOVVbSVRwzx3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="43556098"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="43556098"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 01:45:44 -0800
X-CSE-ConnectionGUID: 50wJHyvmTzeuqIOQYLB1Kw==
X-CSE-MsgGUID: tcNjGmTWQjmrBavvlhpdwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="91984009"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.117])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 01:45:43 -0800
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t v3 1/2] HAX/DO_NOT_MERGE: Wait for context termination
Date: Wed, 27 Nov 2024 10:45:27 +0100
Message-ID: <20241127094528.7041-2-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241127094528.7041-1-krzysztof.niemiec@intel.com>
References: <20241127094528.7041-1-krzysztof.niemiec@intel.com>
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

Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 tests/intel-ci/fast-feedback.testlist    | 4 ++++
 tests/intel-ci/xe-fast-feedback.testlist | 4 ++++
 tests/intel-ci/xe.blocklist.txt          | 1 -
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..dbfb9ed65 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,10 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
 
+igt@gem_ctx_persistence@smoketest
+igt@gem_ctx_persistence@saturated-hostile
+igt@gem_ctx_persistence@saturated-hostile-nopreempt
+
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index d9fb98aab..bbe411692 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -1,6 +1,10 @@
 # Should be the first test
 igt@xe_module_load@load
 
+igt@gem_ctx_persistence@smoketest
+igt@gem_ctx_persistence@saturated-hostile
+igt@gem_ctx_persistence@saturated-hostile-nopreempt
+
 igt@fbdev@eof
 igt@fbdev@info
 igt@fbdev@nullptr
diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index f9ef612c4..882a0e963 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -15,7 +15,6 @@ igt@vmwgfx.*
 # Exclude all i915 tests
 ##################################################################
 igt@api.*
-igt@gem.*
 igt@gen.*
 igt@i915_.*
 igt@perf.*
-- 
2.45.2

