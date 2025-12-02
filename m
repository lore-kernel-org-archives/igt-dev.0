Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F62D1171E
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 18:09:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF08F10E6AA;
	Tue,  2 Dec 2025 18:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FEjg+tq7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B82310E185
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 18:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764698951; x=1796234951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uJk3j8zsCee3+Tgj+/3r1tWI+7NUT+p1eFYUh6tghLs=;
 b=FEjg+tq7IUI5Vm+Bkjq/W054BpCTY0sZ5S9gxJvu8sA7bkx0flx5e4Sk
 yoq1zKkBwORdsHH1joClHVZUIOfLcMlaapA75cPsUCQ1/73PHE6ZZt4oY
 y+hlzaSa7+oKPLPYGhAypoA5DJLn0GiqYT36lI+UXYzwxvAuzChs0Pi/s
 vi+fOf8IeCIZfLs4Bwqx8f3OSeovv1gKIZQkhzovzV0Y/V5cS2ED1MHeS
 8sc8PeN9Mrjww4uW+J2z3vHZKk2tjPjYn+CslSqNnDTmIt2Ege5jDF5o6
 OpohN8KIA3om8cXAhuDdNKLkRtzrQMthm5NBflM65aJPBrjd9qhcpSt2n g==;
X-CSE-ConnectionGUID: B9OFcjRXR9GsfxPR2k1Mrg==
X-CSE-MsgGUID: dOCCzYiETr2TQAjC/ZDWfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66570811"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66570811"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 10:09:11 -0800
X-CSE-ConnectionGUID: tiTSWyxBScWo8zAfN59zxw==
X-CSE-MsgGUID: HrJOO2QFRu29iBu8QxbwZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="198914809"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.140])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 10:09:10 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: [PATCH i-g-t v1 2/3] intel-ci: Add symlinks for Xe lists
Date: Tue,  2 Dec 2025 19:08:50 +0100
Message-ID: <20251202180851.148444-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251202180851.148444-1-kamil.konieczny@linux.intel.com>
References: <20251202180851.148444-1-kamil.konieczny@linux.intel.com>
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

Add symlinks to recently removed Xe lists so Ci will have time
for changing its flow.

Cc: Ryszard Knop <ryszard.knop@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/xe-fast-feedback-chamelium-only.testlist | 1 +
 tests/intel-ci/xe-fast-feedback.testlist                | 1 +
 tests/intel-ci/xe-sriov-vf.blocklist.txt                | 1 +
 tests/intel-ci/xe-sriov-vm.blocklist.txt                | 1 +
 4 files changed, 4 insertions(+)
 create mode 120000 tests/intel-ci/xe-fast-feedback-chamelium-only.testlist
 create mode 120000 tests/intel-ci/xe-fast-feedback.testlist
 create mode 120000 tests/intel-ci/xe-sriov-vf.blocklist.txt
 create mode 120000 tests/intel-ci/xe-sriov-vm.blocklist.txt

diff --git a/tests/intel-ci/xe-fast-feedback-chamelium-only.testlist b/tests/intel-ci/xe-fast-feedback-chamelium-only.testlist
new file mode 120000
index 000000000..5590bb122
--- /dev/null
+++ b/tests/intel-ci/xe-fast-feedback-chamelium-only.testlist
@@ -0,0 +1 @@
+xe.fast-feedback-chamelium-only.testlist
\ No newline at end of file
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
new file mode 120000
index 000000000..18f0b3b89
--- /dev/null
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -0,0 +1 @@
+xe.fast-feedback.testlist
\ No newline at end of file
diff --git a/tests/intel-ci/xe-sriov-vf.blocklist.txt b/tests/intel-ci/xe-sriov-vf.blocklist.txt
new file mode 120000
index 000000000..207e941e7
--- /dev/null
+++ b/tests/intel-ci/xe-sriov-vf.blocklist.txt
@@ -0,0 +1 @@
+xe.sriov-vf.blocklist.txt
\ No newline at end of file
diff --git a/tests/intel-ci/xe-sriov-vm.blocklist.txt b/tests/intel-ci/xe-sriov-vm.blocklist.txt
new file mode 120000
index 000000000..d07d2b330
--- /dev/null
+++ b/tests/intel-ci/xe-sriov-vm.blocklist.txt
@@ -0,0 +1 @@
+xe.sriov-vm.blocklist.txt
\ No newline at end of file
-- 
2.52.0

