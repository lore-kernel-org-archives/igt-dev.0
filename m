Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEC8C77B7F
	for <igt-dev@archiver.kernel.org>; Tue, 24 Jun 2025 11:22:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC7E10E571;
	Tue, 24 Jun 2025 11:22:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fg26niyc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24FCF10E571
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Jun 2025 11:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750764146; x=1782300146;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tTq6XRkHJF4Z/68Zt02xBzXFYi9kpMuUooaecL0s2ys=;
 b=Fg26niycg7iKe0DtL8dmogvmAZTT2rQgDw18r2rEmqfgR22QIcUNTf/J
 FmM9+RASxUVjAoDsonsnP3SrNeYbFjbhNGkY7nP3NaTgPnmWvnaylKnP2
 A3j7dUMiCj1hs6CYdV7ZKTXK3CbbCOz9mNqWJOWT73BjVjkPCy/1YxCSs
 n/kR2LBi7pyjBEEI4VAGgfuc17V2Ex5UvfXutMg6x9HPQPuM8Vzbu4qe/
 yMuo6n+Ns0Ccx+V2QfMDucrNX0R/Dgqr3eGEim9ZQBWt+66djUgY9awUM
 CoDG6tGoHKu/39JQmmGDkfMG/P+JcXP73E6E0DF5Nv5Q1dA8zVEsoZKfy w==;
X-CSE-ConnectionGUID: j963PIpHQDCxPGd1dJ9RcQ==
X-CSE-MsgGUID: 5TYtCJjuT5ej4U1f7WSslA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52721237"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="52721237"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 04:22:26 -0700
X-CSE-ConnectionGUID: PlGXuOfGSTOZEufuyk4tzA==
X-CSE-MsgGUID: xse0SujBRGmWodMM3K30kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="151315051"
Received: from johunt-mobl9.ger.corp.intel.com (HELO localhost)
 ([10.245.244.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 04:22:25 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 1/2] intel-ci: Block virtgpu tests for i915
Date: Tue, 24 Jun 2025 13:22:14 +0200
Message-ID: <20250624112215.67441-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250624112215.67441-1-kamil.konieczny@linux.intel.com>
References: <20250624112215.67441-1-kamil.konieczny@linux.intel.com>
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

There is new test for VirtIO-GPU so block it from running for
i915.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/blacklist.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index e9b11a75f..6c91f1a70 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -117,6 +117,10 @@ igt@panfrost.*
 ###############################################
 igt@msm.*
 ###############################################
+# VirtIO-GPU
+###############################################
+igt@.*virtgpu.*
+###############################################
 # Hibernate: not configured correctly on CI
 ###############################################
 igt@.*@.*-hibernate
-- 
2.49.0

