Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F32C8303C
	for <igt-dev@archiver.kernel.org>; Mon,  7 Jul 2025 16:24:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09EB210E32F;
	Mon,  7 Jul 2025 16:24:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DRD94Dwk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7569510E32F
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jul 2025 16:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751905441; x=1783441441;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VYXX0D3eBrZbFhlx9EzDP+2xXpQs10sTaQGjcUakZ10=;
 b=DRD94DwkWF0vyvD/w0ySB4vWIb/xjbh8ED9ISVVnjkfW1MGQUAGF7Y2H
 4J0Q+rJY7UpEurhCHN1EmrihHY6iCNgNJW6fsUmqEANM8yBU1KhaRFlr8
 qUpbQoMuTgENkukKTbqAzLQBz/HODp+7bqmMheWlF6dqtGoVFRA0voonH
 Wg9YDZBEEz68DLD8BcVUbU3lHU5Ihp7JzHzKzpQweuKvDLysHEsPhpxHX
 7+LG6WLVPex4y1kMhxaWZUQopj90LyN0iNIsh1qtgygKQDQN7mz35Fj1A
 wtiXx5HUo2nGxZihA/S6ZOgnb5aKyLV3H4GwI2Ah/jechXWmq8/EFfk3V A==;
X-CSE-ConnectionGUID: Cjak16NfQnidy0PTD42Ywg==
X-CSE-MsgGUID: fDRVWoRoTISHjIsTvujYjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="76680641"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="76680641"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 09:24:00 -0700
X-CSE-ConnectionGUID: by45hcybQOOzh7x0wF4X/A==
X-CSE-MsgGUID: 6APiSZfASdyWa6K1qhlBaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="178916124"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.98])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 09:23:59 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Michal Czaplinski <michal.czaplinski@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: [PATCH i-g-t v3 3/5] intel-ci: Add symlinks for old i915 blocklists
Date: Mon,  7 Jul 2025 18:23:38 +0200
Message-ID: <20250707162340.258267-4-kamil.konieczny@linux.intel.com>
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

