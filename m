Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8537ED4921A
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 12:44:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 369C810E347;
	Mon, 18 Nov 2024 12:44:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dV9TR0HR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83BC10E4CA
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 12:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731933883; x=1763469883;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k7uOq6VWYYWG4Nm9Ee/9VmyGYqbqIRjhZc2H3qE01KQ=;
 b=dV9TR0HRj2BmUKblyDPFRfxXs7OvyAYEcUltvsvB47ZBjJZ3iWwWnrF8
 /fy4LTV9o/0eYnVGnLeAJz42rnwWp5JwrAl44rpQRXkSwcB6d7KuvFA+f
 xJdPCMC8U4OfQYjT2JzhEnuYwNGAWSFohufKVRnw8SnM2c1i8VU1zy5/D
 x+tNCv98aWv12VXSmqkNMCTqaZDC+6BV9hpi/tkg3TfX1j+y81hkzsEfz
 Nu0rsNk4rA2M5CjiUuahrbaYV6dnCR4CsXlmsEdCDQi0V4piMmnK64Bgv
 ytLYnk7Q5tB7S3ibGHFNuBiYKTiRdRN5ChKxYO6Z9Bfx0QVOgcGbL5FVr w==;
X-CSE-ConnectionGUID: /1lXhYaRRray7a3kSOkORQ==
X-CSE-MsgGUID: KCPaN/l2ROKx907iJ2wISw==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="32038972"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="32038972"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 04:44:43 -0800
X-CSE-ConnectionGUID: tE02ByeiSlOMFLz7463h6A==
X-CSE-MsgGUID: 6dL5FCHfRdiWzIabBRBkuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="89365039"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.159])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 04:44:41 -0800
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 2/2] HAX/DO_NOT_MERGE: Add wait-zero-handles to fast
 feedback list
Date: Mon, 18 Nov 2024 13:44:22 +0100
Message-ID: <20241118124422.11868-3-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241118124422.11868-1-krzysztof.niemiec@intel.com>
References: <20241118124422.11868-1-krzysztof.niemiec@intel.com>
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

Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 tests/intel-ci/fast-feedback.testlist    | 2 ++
 tests/intel-ci/xe-fast-feedback.testlist | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..cf3a9d9b1 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,8 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
 
+igt@syncobj_wait@wait-zero-handles
+
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index d9fb98aab..b9f4d8700 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -1,6 +1,8 @@
 # Should be the first test
 igt@xe_module_load@load
 
+igt@syncobj_wait@wait-zero-handles
+
 igt@fbdev@eof
 igt@fbdev@info
 igt@fbdev@nullptr
-- 
2.45.2

