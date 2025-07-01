Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D23BC7EE30
	for <igt-dev@archiver.kernel.org>; Tue,  1 Jul 2025 15:32:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C46BF10E5C1;
	Tue,  1 Jul 2025 15:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GDmppMT9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A07110E5C1
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Jul 2025 15:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751383948; x=1782919948;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nzjdbx+CBTd0BkZpLpMLD4pUmIvqOUMzJNVEPS/VwBc=;
 b=GDmppMT9Pzrzb3NE6iO8ZUm05xcSZOhPV7YCIk1Czwv0uqZ/WQxxmfOp
 uYrF5+KWVr2U4uuwTRx9Ges7M/5YLmFlL1kVpl1wxjxrTc8Mcd7CgMu8s
 r/wmwSsNCcK1AC6Tyh7n5E5kmFYic5ycuPBpzE1bseAntMMmV7h1Q327i
 JqJfCHWYVdTbIug/vkDXCTqD59YcKv8h0RPdeyimQ6DKIhYBGOqYhp33z
 egyu+UN5JsQezun5fMOZqBUmV39PekB5hQ9dBVhOO+oqmZOt41SZBMyl0
 ffUW/pnOdUVAur+T28mGCuuS1OOgqLaNc/vAW7HSRcLPGoPDC88ymmsjz g==;
X-CSE-ConnectionGUID: kfqq0e2NTUq/427OZfADyQ==
X-CSE-MsgGUID: thO44ITtTaeWnt/oeaAraQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="76206543"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="76206543"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 08:32:27 -0700
X-CSE-ConnectionGUID: 2CLs4u7OR3+F5CB40UrSLQ==
X-CSE-MsgGUID: BghTjTblTgyNvBkjoVTGUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="159315827"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.118.0])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 08:32:25 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH i-g-t] DO NOT MERGE fast-feedback.testlist: Reorder dmabuf and
 i915_selftest
Date: Tue,  1 Jul 2025 17:31:51 +0200
Message-ID: <20250701153151.27638-1-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701103405.23478-1-peter.senna@linux.intel.com>
References: <20250701103405.23478-1-peter.senna@linux.intel.com>
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

DO NOT MERGE

Trying to determine what is causing the tests to fail.

Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
v3:
 - move test to the very top
v2:
 - move the test higher

 tests/intel-ci/fast-feedback.testlist | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index 82395e7ea..5d86b0911 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,9 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
 
+# Just to test
+igt@dmabuf@all-tests
+
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@fbdev@eof
@@ -168,4 +171,3 @@ igt@i915_pm_rpm@module-reload
 
 # Kernel selftests
 igt@i915_selftest@live
-igt@dmabuf@all-tests
-- 
2.43.0

