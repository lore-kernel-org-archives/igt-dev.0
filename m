Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FBCC48BF8
	for <igt-dev@archiver.kernel.org>; Mon, 19 Feb 2024 16:49:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B03110E061;
	Mon, 19 Feb 2024 16:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gOSfpEUM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D6A10E118
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Feb 2024 16:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708361346; x=1739897346;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F2GUQa2ak9G1YRTahM4qMCqJOmD8iC6BMjoRPfWQ8MU=;
 b=gOSfpEUM6q4DOFOvdJngLkhXBBlCaBvgHmX9cd3+pD6hnETVZLO2xrp0
 EK9gnT3RfHKB4xoVuqDKNJvLOtp6/IW/wEeeXEE6brPccrEBapn2BLr9a
 qqp58T78b/zxVaWWXk8ERGaxG2YeQQgTvT8QwYsgfkUxY6w88Z+0EYdBs
 Ghb07i8D0KjJfQfq466zOdzC0Y3fJQ1wIJT61QsQEiOaYscLsR+0JSKIE
 I5b14lPcriqpsL+058ExFYqIy3c492SVIgUoHv5SzNigWXRe+ErhNJLUJ
 hrccUrQxnAz/3uF9Kl08cFWR4GPXahs6T92jfNENm/ob/sCugHuO3spbi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2590664"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="2590664"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 08:49:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="4824381"
Received: from mkoper-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.80.95])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 08:49:05 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>
Subject: [PATCH i-g-t] tests/intel/i915_test_config: fix JSON exclude section
Date: Mon, 19 Feb 2024 17:48:58 +0100
Message-ID: <20240219164858.29870-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
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

Fix typo in exclude section for i915.

Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
Fixes: 6fb001a597e9 ("tests/intel/i915_test_config: align JSON documentation with xe")
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/i915_test_config.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/i915_test_config.json b/tests/intel/i915_test_config.json
index b09f4244e..61638a4f1 100644
--- a/tests/intel/i915_test_config.json
+++ b/tests/intel/i915_test_config.json
@@ -53,7 +53,7 @@
                                     { "i915 BAT": "../intel-ci/fast-feedback.testlist" }
                                 ],
                                 "exclude": [
-                                    { "i915 BAT, 915 FULL": "../intel-ci/blacklist.txt" }
+                                    { "all": "../intel-ci/blacklist.txt" }
                                 ]
                             },
                             "order": [
-- 
2.42.0

