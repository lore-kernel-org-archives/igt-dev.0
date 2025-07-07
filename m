Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80263C83F07
	for <igt-dev@archiver.kernel.org>; Mon,  7 Jul 2025 09:41:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307C610E42C;
	Mon,  7 Jul 2025 09:41:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dotEAJSF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ABF810E42C
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jul 2025 09:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751881318; x=1783417318;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VYXX0D3eBrZbFhlx9EzDP+2xXpQs10sTaQGjcUakZ10=;
 b=dotEAJSF8a4SfipR1v9+3uO8BRJ0w+Hf9d/+9AW3tmXs6Lh0/sl99iJW
 L1AFftoUCEgHdPpbp+IH0luA/boa1NZj2zSECW4ipxK8KAeOq60eE1C7A
 dEL7Zynuc57hAzFqgFeZXToaQ40twc8GOearbT272LDJGixtjoAA6pFWm
 z+uF9rizqWPhQTzGRyaTvp4H3HfckYC1smn3Qifp/Oy/FdTWfxRqWVK8L
 MEKekyzrJ8PPc6J5Ljh/5KgPRsNy0aJp1SB4lhJlA7+vFpadb61U27D0o
 E3/JK2IKumiQ1jsHa6uCGhr7l/pLhSH/iSOTh8lZtky+PpSAEbyGWqFk0 Q==;
X-CSE-ConnectionGUID: MtkJQO35S6SA9ngvhyOl6w==
X-CSE-MsgGUID: kZsymvm/RXCv1yspLqK9pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="65550852"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="65550852"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 02:41:58 -0700
X-CSE-ConnectionGUID: czjvVyXdRGKQF4vCiNPWAA==
X-CSE-MsgGUID: JPMxwQBhSKu4n8FEh0C6Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="155297679"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.67])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 02:41:57 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Michal Czaplinski <michal.czaplinski@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: [PATCH i-g-t v2 3/5] intel-ci: Add symlinks for old i915 blocklists
Date: Mon,  7 Jul 2025 11:41:16 +0200
Message-ID: <20250707094118.84046-4-kamil.konieczny@linux.intel.com>
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

Add symlinks to make a transition easier for CI.

Cc: Michal Czaplinski <michal.czaplinski@intel.com>
Suggested-by: Ryszard Knop <ryszard.knop@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/blacklist-pre-merge.txt | 1 +
 tests/intel-ci/blacklist.txt           | 1 +
 2 files changed, 2 insertions(+)
 create mode 120000 tests/intel-ci/blacklist-pre-merge.txt
 create mode 120000 tests/intel-ci/blacklist.txt

diff --git a/tests/intel-ci/blacklist-pre-merge.txt b/tests/intel-ci/blacklist-pre-merge.txt
new file mode 120000
index 000000000..124a31dbf
--- /dev/null
+++ b/tests/intel-ci/blacklist-pre-merge.txt
@@ -0,0 +1 @@
+i915.blocklist-pre-merge.txt
\ No newline at end of file
diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
new file mode 120000
index 000000000..ffa658927
--- /dev/null
+++ b/tests/intel-ci/blacklist.txt
@@ -0,0 +1 @@
+i915.blocklist.txt
\ No newline at end of file
-- 
2.49.0

