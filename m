Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D53FC83F1A
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 16:00:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5075C10E093;
	Mon, 14 Jul 2025 16:00:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nMO815Q/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76BB10E093
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 16:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752508834; x=1784044834;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YcNKiZEFa1xYqd9mPWEpdWDxzXjSd3yQbxAnNqN9Cjw=;
 b=nMO815Q/BTawW7gFWfPhwOZk6vYOJZF5O900DLKUYKalpOu8dOuN1/84
 qIsxpsiuQnf1hwbbr6u1xHdah0+s09YQzvlxjAT2hmB66tgClhFsIBof+
 XBwfGeSud/NZ+vFmuSxJAKZdY0rJpLSpdn0dAHWG2/5EPHjmBzlNdDIue
 VkfMWWgRzotC512Xzu+EdtWoxzYchy5cP48jscPLexNtvKezhRpAoIZ1h
 SzrJb76K1DavpUdcupuy7CNfikdPiaAfyNe5uGZakG5Ocpmzw+Qw2qtm8
 LBTfdaPMcNR7qnuVJcdEAaHKFkYbpwhoJtTa/fVzd6udi4Z1iyCcxjK5r w==;
X-CSE-ConnectionGUID: yE/s9uJeS029e+FKf0dWvw==
X-CSE-MsgGUID: 4q8jrabsTOSUUsicEveegg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="66154207"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="66154207"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 09:00:34 -0700
X-CSE-ConnectionGUID: pwRbAqBnTp6vUkUr5vMAmg==
X-CSE-MsgGUID: tlexbmdpTxyc/rUxnTLMdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="161516392"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.1])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 09:00:32 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Michal Czaplinski <michal.czaplinski@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH i-g-t v5 5/5] intel-ci: Add symlinks for old i915 testlists
Date: Mon, 14 Jul 2025 17:59:54 +0200
Message-ID: <20250714155954.110858-6-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714155954.110858-1-kamil.konieczny@linux.intel.com>
References: <20250714155954.110858-1-kamil.konieczny@linux.intel.com>
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

Add symlinks for i915 testlists to make transition easier.

v4: use 'i915.' prefix for fast-feedback (Swati)
v5: add symlinks to meson (Michal)

Cc: Michal Czaplinski <michal.czaplinski@intel.com>
Suggested-by: Ryszard Knop <ryszard.knop@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 tests/intel-ci/chamelium-only.testlist               | 1 +
 tests/intel-ci/fast-feedback-chamelium-only.testlist | 1 +
 tests/intel-ci/fast-feedback.testlist                | 1 +
 tests/intel-ci/meson.build                           | 3 +++
 4 files changed, 6 insertions(+)
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
index 000000000..44d83f366
--- /dev/null
+++ b/tests/intel-ci/fast-feedback-chamelium-only.testlist
@@ -0,0 +1 @@
+i915.fast-feedback-chamelium-only.testlist
\ No newline at end of file
diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
new file mode 120000
index 000000000..88e9d80e0
--- /dev/null
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -0,0 +1 @@
+i915.fast-feedback.testlist
\ No newline at end of file
diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
index 7efcef4be..5222b1358 100644
--- a/tests/intel-ci/meson.build
+++ b/tests/intel-ci/meson.build
@@ -4,6 +4,9 @@ intelci_files = [
   'README',
   'blacklist.txt',
   'blacklist-pre-merge.txt',
+  'chamelium-only.testlist',
+  'fast-feedback.testlist',
+  'fast-feedback-chamelium-only.testlist',
   'i915.blocklist.txt',
   'i915.blocklist-pre-merge.txt',
   'i915.chamelium-only.testlist',
-- 
2.50.1

