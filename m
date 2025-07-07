Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E52C8303C
	for <igt-dev@archiver.kernel.org>; Mon,  7 Jul 2025 16:24:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E765510E4CB;
	Mon,  7 Jul 2025 16:24:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fDW2r36A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4D710E4E1
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jul 2025 16:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751905448; x=1783441448;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aadJoAuflOOIjDiB4tBVsFNw1xJh2Dq2CZSD1V6BlLs=;
 b=fDW2r36AIsJLHYk5O5iHOFci8RPd4qMaJndTUBVOYj0bTEjAWSY1b4eI
 +cF24CLzJdcoUMuejsZ61lJxRpcRe5fYyEgonE9f7AsIAeV3eAAGs7mB7
 rrtOKldXLm2Yf7Sx4wv+QC2zcvnykbElReqVAk6gbTc4kkyoxqhvrF+18
 tSsZ8wRW920tvLcPW8cXGYzIYhOrUCD8GGlnLJp06gccw0LAl1k+6gVsQ
 CAQ/YfkHsG2NG7Z1219TXZWUpOi9Uz/bF/nEj5HtBpLmkXELqVyV9VHfH
 njPRgTvyOvXJFFKq83ZaThlZH8+moOtEF+QsXqq5JmoioDgnI0GDbkf1j A==;
X-CSE-ConnectionGUID: yB0T2bL+Tdq0lLc27O8fFg==
X-CSE-MsgGUID: t4//3r0qRuCB3dIEEKaq8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="76680651"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="76680651"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 09:24:08 -0700
X-CSE-ConnectionGUID: 9I7sHKz0QE2Nej1ZlslE/g==
X-CSE-MsgGUID: TPcPlDS5Sv6c2T/f+uwxiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="178916181"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.98])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 09:24:06 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Michal Czaplinski <michal.czaplinski@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: [PATCH i-g-t v3 5/5] intel-ci: Add symlinks for old i915 testlists
Date: Mon,  7 Jul 2025 18:23:40 +0200
Message-ID: <20250707162340.258267-6-kamil.konieczny@linux.intel.com>
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

