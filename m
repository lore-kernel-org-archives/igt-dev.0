Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9EDC83038
	for <igt-dev@archiver.kernel.org>; Tue,  1 Jul 2025 14:32:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3279210E5B4;
	Tue,  1 Jul 2025 14:32:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nngnHZBT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A87E10E5B4
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Jul 2025 14:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751380326; x=1782916326;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UMaII6SLTqm04l6A2QFIr7ZA2tU1n2gnEAGutrr89nY=;
 b=nngnHZBTXTjl1l6AaxVDyX0iomhmeJfxUfFZAkoHzFutE1EgT/kT01xZ
 uPQMdJgitnTcRnTCZu0E+vzQi+N0ZL0rmVhSYDl4Iqi4IrJhUjEMfDBLU
 MCBZbGlP6bAAMs4Tm/2tXWOZU4TuMAeBTj4OkCTg+T49C2tI5iZWEbS7y
 pJojsOxKChiNj5/e6te5AGgWF97nkkZzETsMKahxLhdRsyGsJYLy4TPXq
 IzZDQ5iElQbUwgCWW7psHn+Ez+Xe5LEkiYUUI3ZH6oeAe32vAZnY5mWRc
 JNxt9Utp5pIXV4rrRjOUUhdso/gJN+K+X3lw3b30LmTQutMriE+uNpWyg A==;
X-CSE-ConnectionGUID: K1VZWI/sSIuQ4ne4aggwAQ==
X-CSE-MsgGUID: cZacs+NaQLCj5pRQWyucBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53372630"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53372630"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 07:32:05 -0700
X-CSE-ConnectionGUID: hf/qVbP+Q6KXbTmDcLYpyA==
X-CSE-MsgGUID: FRBCqtiLSyecEcO6JQcaCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="153201513"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.118.0])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 07:32:04 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH v2 i-g-t] fast-feedback.testlist: Reorder dmabuf and
 i915_selftest
Date: Tue,  1 Jul 2025 16:31:38 +0200
Message-ID: <20250701143138.24695-1-peter.senna@linux.intel.com>
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
v2:
 - moved the test even higher before the bind/rebind

 tests/intel-ci/fast-feedback.testlist | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index 82395e7ea..5a2a38c73 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -153,6 +153,9 @@ igt@vgem_basic@mmap
 igt@vgem_basic@second-client
 igt@vgem_basic@sysfs
 
+# Just to test
+igt@dmabuf@all-tests
+
 # All tests that do module unloading and reloading are executed last.
 # They will sometimes reveal issues of earlier tests leaving the
 # driver in a broken state that is not otherwise noticed in that test.
@@ -168,4 +171,3 @@ igt@i915_pm_rpm@module-reload
 
 # Kernel selftests
 igt@i915_selftest@live
-igt@dmabuf@all-tests
-- 
2.43.0

