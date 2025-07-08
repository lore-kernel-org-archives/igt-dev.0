Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E985C83F09
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 15:28:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E9B10E6A6;
	Tue,  8 Jul 2025 15:28:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NLCMH+mZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA8910E69F
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jul 2025 15:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751988516; x=1783524516;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ga4vWyg1+g9HGM77h5TmMtJAdkMaSDYJnLnGrutPiT4=;
 b=NLCMH+mZtfqLgUu71uRGDYjJVXI4ItTE+JlnOP2qYXPMymfEm180zCjL
 fTH0UJY2sLPTwoCKx7Q3zQKysc2Qu0U/Gv1L7Nfsv0qlWnhUq9pZm11Yq
 +B/5cNcHzPzF4N1LuR+pt1HY+uJw/5Iu/cyuGhU9iv3q5CRFIyxaPL8Xr
 d87jr7UWnFaZaQBQKV9Racehqe6qJ1nNB3ROelGEqe4uFid4OPa1YAlfp
 3+J+NSmrlSwPm3IqFCkCbcQNOza6g5EzIiY93a1r/yHcRRCxIUZcx/s2s
 MkdNdlUI4fr9wIiijnoipKBbos7iZ5Zl/XRRio7xgq2CiHCusHfUDiVMn g==;
X-CSE-ConnectionGUID: kU/LDaXcTViTBtu+6lsQhQ==
X-CSE-MsgGUID: 4BT93S8tSJyK4oDdfJ+DwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54326803"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="54326803"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 08:28:36 -0700
X-CSE-ConnectionGUID: Z4LBHXC+QO6WdL+lkihSVg==
X-CSE-MsgGUID: /+DZxQF+Tye8JHNkfJ73eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="155855116"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.16])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 08:28:34 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Michal Czaplinski <michal.czaplinski@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: [PATCH i-g-t v4 5/5] intel-ci: Add symlinks for old i915 testlists
Date: Tue,  8 Jul 2025 17:28:08 +0200
Message-ID: <20250708152808.59977-6-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708152808.59977-1-kamil.konieczny@linux.intel.com>
References: <20250708152808.59977-1-kamil.konieczny@linux.intel.com>
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
-- 
2.49.0

