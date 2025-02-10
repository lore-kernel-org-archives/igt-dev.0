Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56435C0219E
	for <igt-dev@archiver.kernel.org>; Mon, 10 Feb 2025 18:40:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED53E10E5F5;
	Mon, 10 Feb 2025 18:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kOCRP8u8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA21910E5F5
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2025 18:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739212838; x=1770748838;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A/Kkm19iNMujfWtMGrmeN/m94vufiJSrqZM65B4V438=;
 b=kOCRP8u8cFfSucSrpoVTuu26EppUEvVTS+1NynKUwBHkviJUVCjlSLcT
 dzzkqS5QWcAoWxpRO4ClPBazaLCmmsrJLlw5aUKK2anukG8ITWpzyyVHG
 q/YAWtokWsiYLMTYigxcJZSO24mVl2tbhU4v50DEJzHRUKJnJ6fZKISv7
 hlSD/XDZ1+d9yKPDPrq8ZHrM0QKZ2nsrXcVpp2lLB3/hNSFaEFvvI7GAv
 o4cFLlTSqk2+Zrgat++ev4pwMSnVj9n+sTP1GI4HAXtRIrRVZNVjxMBpx
 6rnJ+sDKguvJWlA6rPPPPiWmP/FtEBj+2zcrb+J/5pGm6VmNdwfz4v2B2 w==;
X-CSE-ConnectionGUID: 5vyFmwxFQkGSAQ65dhqmNw==
X-CSE-MsgGUID: 1YCd2F/gRHKEPJDWM13CYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39497503"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="39497503"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 10:40:38 -0800
X-CSE-ConnectionGUID: YcjFjZYNTYClUTHutgFp/g==
X-CSE-MsgGUID: uohUgknhRaSIjZROKKNdkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="112229475"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 10:40:37 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 6/6] HAX: Do not merge
Date: Tue, 11 Feb 2025 00:26:06 +0530
Message-Id: <20250210185606.1327892-7-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250210185606.1327892-1-kunal1.joshi@intel.com>
References: <20250210185606.1327892-1-kunal1.joshi@intel.com>
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

Don't merge, just for CI testing

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel-ci/fast-feedback.testlist    | 3 ++-
 tests/intel-ci/xe-fast-feedback.testlist | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..668fb3888 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,7 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
-
+igt@kms_dp_linktrain_fallback@dsc-fallback
+igt@kms_dp_linktrain_fallback@dp-fallbck
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 0234d3e72..28f8b5015 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -1,6 +1,7 @@
 # Should be the first test
 igt@xe_module_load@load
-
+igt@kms_dp_linktrain_fallback@dsc-fallback
+igt@kms_dp_linktrain_fallback@dp-fallback
 igt@fbdev@eof
 igt@fbdev@info
 igt@fbdev@nullptr
-- 
2.25.1

