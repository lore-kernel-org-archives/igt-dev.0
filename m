Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8696EC83F07
	for <igt-dev@archiver.kernel.org>; Mon,  7 Jul 2025 09:42:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4076B10E337;
	Mon,  7 Jul 2025 09:42:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="irnQSGX2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF3010E337
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jul 2025 09:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751881327; x=1783417327;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aadJoAuflOOIjDiB4tBVsFNw1xJh2Dq2CZSD1V6BlLs=;
 b=irnQSGX2QOu7G7ySwetmnbV6IDS6pNrYfIY+0nYmILzCFwbEaZ5s4FIq
 WdDxFZ5vpB2433OHIiiFoOLtvsIWw3jmSL4jNRyiuz4fuedJ7Dv4Y6zlh
 /fYXizRWmJY4fboEo+wJ+tRBWaVHC3WM2BNInmfNc+JnvLAzC9DAg4V2W
 d4mVBtiy0XlxNq2i8pRV9LBaAqdjm9j5oP86g2s/ktGJ5ZvR2UQtP5qo0
 Akdu5/KiXDg1UOp3YTO4CRJctkRirOvp+HnDfDNUj1IvbnvxmoSEbmFSN
 d5YHBZUL+16dE9FQqvp6q7mB2IbgGoBbfcnNpx3hXLNPQEBgj1iNxYZjR Q==;
X-CSE-ConnectionGUID: 3DkjIDFtRNanss8Po0DB/Q==
X-CSE-MsgGUID: TgTZM3cxR9Kn6nP4Y5UXdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="57766906"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="57766906"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 02:42:06 -0700
X-CSE-ConnectionGUID: fZNxhvT9Tk6w0X5FcM0CLw==
X-CSE-MsgGUID: OW2dQVH1QzGS/9KvKVgENg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="186125788"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.67])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 02:42:05 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Michal Czaplinski <michal.czaplinski@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: [PATCH i-g-t v2 5/5] intel-ci: Add symlinks for old i915 testlists
Date: Mon,  7 Jul 2025 11:41:18 +0200
Message-ID: <20250707094118.84046-6-kamil.konieczny@linux.intel.com>
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

Add symlinks for testlists to make transition easier.

Cc: Michal Czaplinski <michal.czaplinski@intel.com>
Suggested-by: Ryszard Knop <ryszard.knop@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/chamelium-only.testlist               | 1 +
 tests/intel-ci/fast-feedback-chamelium-only.testlist | 1 +
 tests/intel-ci/fast-feedback.testlist                | 1 +
 3 files changed, 3 insertions(+)
 create mode 120000 tests/intel-ci/chamelium-only.testlist
 create mode 120000 tests/intel-ci/fast-feedback-chamelium-only.testlist
 create mode 120000 tests/intel-ci/fast-feedback.testlist

diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/chamelium-only.testlist
new file mode 120000
index 000000000..3715a9469
--- /dev/null
+++ b/tests/intel-ci/chamelium-only.testlist
@@ -0,0 +1 @@
+i915.chamelium-only.testlist
\ No newline at end of file
diff --git a/tests/intel-ci/fast-feedback-chamelium-only.testlist b/tests/intel-ci/fast-feedback-chamelium-only.testlist
new file mode 120000
index 000000000..4181aa6f5
--- /dev/null
+++ b/tests/intel-ci/fast-feedback-chamelium-only.testlist
@@ -0,0 +1 @@
+i915-fast-feedback-chamelium-only.testlist
\ No newline at end of file
diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
new file mode 120000
index 000000000..1b1885013
--- /dev/null
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -0,0 +1 @@
+i915-fast-feedback.testlist
\ No newline at end of file
-- 
2.49.0

