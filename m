Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3E8C83F17
	for <igt-dev@archiver.kernel.org>; Mon, 28 Jul 2025 17:32:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF2E10E557;
	Mon, 28 Jul 2025 17:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bpOXt89A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9633410E556
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Jul 2025 17:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753723924; x=1785259924;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Tpn5ijuzG7cCFiayb4GlFCear7Zv7Qd0wgMi/DMCcf4=;
 b=bpOXt89ACDBYxwl4OVlW3Sz8q8sL87MWZrURqBK/+FG5xE3lOUYG0ZCc
 ZQRs8fivBEq/1vWGTR8k1Pn/QGD1titNyyxt8UiUQXb14TEH6Naf7nrEk
 caFz4jnwrQQIeJyWUFw7hfjBU2rA5z2mjwrMVcl0+biN6CQw60IWa2ajR
 OXOAMEY9Q0i022usM38Cx50BLQnK3B0xFoAyk4zYOurEDW2eV4hhIjNfX
 zfLNg/KlD0nt2bHCzs3+m9bT/gw5GnS5jAstADEZANuxCD7nIRb4n6yCw
 XS5gvDMoLWPs9vEKxsxfiFJ+4nzN2YivrkE5LhH4BczkUtrrnygD1H/qQ Q==;
X-CSE-ConnectionGUID: 9hjFkiu9RbK/6UiC5t24gA==
X-CSE-MsgGUID: 1nTchHG1TxK+fOGq/1r3Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="66684053"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="66684053"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 10:32:04 -0700
X-CSE-ConnectionGUID: v2gYSYASQNy8CIE7SkInwA==
X-CSE-MsgGUID: E2zIk+UIQaecnOGVW+HZzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="161731586"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.236])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 10:32:04 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 1/4] scripts/run-tests: Update help
Date: Mon, 28 Jul 2025 19:31:49 +0200
Message-ID: <20250728173152.220113-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728173152.220113-1-kamil.konieczny@linux.intel.com>
References: <20250728173152.220113-1-kamil.konieczny@linux.intel.com>
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

Update help  with description of '-b' blocking tests option.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 scripts/run-tests.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/run-tests.sh b/scripts/run-tests.sh
index 1fb9be478..12c68ef5d 100755
--- a/scripts/run-tests.sh
+++ b/scripts/run-tests.sh
@@ -150,7 +150,7 @@ print_help() {
 	echo "  -v              enable verbose mode"
 	echo "  -x <regex>      exclude tests that match the regular expression"
 	echo "                  (can be used more than once)"
-	echo "  -b              blacklist file to use for filtering"
+	echo "  -b              blocklist file to use for filtering"
 	echo "                  (can be used more than once)"
 	echo "                  (not supported by Piglit)"
 	echo "  -R              resume interrupted test where the partial results"
-- 
2.50.1

