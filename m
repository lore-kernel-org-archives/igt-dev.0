Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6743C83F09
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 15:28:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F96210E69A;
	Tue,  8 Jul 2025 15:28:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P43mombR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C579E10E696
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jul 2025 15:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751988508; x=1783524508;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VYXX0D3eBrZbFhlx9EzDP+2xXpQs10sTaQGjcUakZ10=;
 b=P43mombRNUIxdjLKOx/HhX+VdqTIRXBe7PsX4nqTXuzEwqvfUYWUMSFi
 DEclXTPmnWebvdPdBWbhG/ZQqdAQTBP14LpvZPRjMhPck7t+havaFWEzU
 dZwtjku/kTeFpymaJ6Kwt+6XDGRI9nKo0zHOjChtQj8c+WYWrNc6tgIJB
 uWP5F9VW91drsiGptYMHsiOJEtCuLTV0UJRfDLCFC8xXrC8nJgrwyqvZM
 /BDuHPfHL3kwQjCAP3qAwmU+YphCCL9jnfe1kvDZXRa5nqIOJigaOagRR
 l8ZHdaII8GAczjEGCkJWcUVLHohKIYQflidp2/tOEH45DVoxYHgFVN7KU A==;
X-CSE-ConnectionGUID: Cdq22MgeT7+Nwwxclb9eWg==
X-CSE-MsgGUID: usBsmf4uRdOOTd1XMd1A3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="53947176"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="53947176"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 08:28:28 -0700
X-CSE-ConnectionGUID: VplmODm1QnKI/xrYvpNS/Q==
X-CSE-MsgGUID: sMLbpWWWSni7XfVUEG75IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="154937679"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.16])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 08:28:26 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Michal Czaplinski <michal.czaplinski@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: [PATCH i-g-t v4 3/5] intel-ci: Add symlinks for old i915 blocklists
Date: Tue,  8 Jul 2025 17:28:06 +0200
Message-ID: <20250708152808.59977-4-kamil.konieczny@linux.intel.com>
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

