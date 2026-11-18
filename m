Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97BB606A31C
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 15:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HJ3UJzIi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91BD710E541;
	Wed, 18 Nov 2026 15:51:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B41310FE11
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 15:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795016748; x=1826552748;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ome00AyUAqquRI1iVU6BnORoa6zHdrXXP1nC4ueb9uU=;
 b=HJ3UJzIim7mxZSLhD/QuQhRzk+KaQsu7Dg+bIyj4967XA4Zkg5boaJXn
 l3Ce//eDlEvCzCQriQnJj/aimhHWbttCxumfKluD7SZ6NwF78Msnh3OBt
 MbzWZPila65cH/8p4Gcu4FW+jotv76KuR8GjfXtzaQNczJMXw7gvtTL+h
 XAIc0M/yyQA+67eU0p8g692p4mPkjRuDkRq5BtVVnNTs7arnd5m7HNjPl
 j3u2iqoRHvU7F6ykr401/bv48kN6NUF5pA9W0zW4bBF6X2OfQAnpjPG9i
 n7T9jGwF9I4HQAU7YLe2mFJX/nlecdiXlXOg++Es1uyiAZFFs/MAtt/sd g==;
X-CSE-ConnectionGUID: Uz8zKf+oSsSv95rQCfYA1w==
X-CSE-MsgGUID: 7EksQPzmQHWKWC817SNe3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3720392"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3720392"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:45:48 -0800
X-CSE-ConnectionGUID: ioRGMLewR+Wn9tiw8Hmnpg==
X-CSE-MsgGUID: zq3R4cU4Sn6qdWTNe1kIAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10319415"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 jeevan-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.190.238.87])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:45:46 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, pranay.samala@intel.com, karthik.b.s@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 8/8] tests/intel/i915_module_load: Verify driver unload
 result
Date: Wed, 18 Nov 2026 21:14:23 +0530
Message-ID: <20261118154426.345883-9-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118154426.345883-1-jeevan.b@intel.com>
References: <20261118154426.345883-1-jeevan.b@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Assert that igt_i915_driver_unload() succeeds in the reload, reload-no-display
and resize-bar paths, so a failed unload (including intel_display) is
reported instead of being ignored.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/i915_module_load.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/intel/i915_module_load.c b/tests/intel/i915_module_load.c
index c875d2501..49dffadfe 100644
--- a/tests/intel/i915_module_load.c
+++ b/tests/intel/i915_module_load.c
@@ -285,7 +285,7 @@ static uint32_t  driver_load_with_lmem_bar_size(uint32_t lmem_bar_size, bool che
 	int i915 = -1;
 	char lmem_bar[64];
 
-	igt_i915_driver_unload();
+	igt_assert_eq(igt_i915_driver_unload(), 0);
 	if (lmem_bar_size == 0)
 		igt_assert_eq(igt_i915_driver_load(NULL), 0);
 	else {
@@ -621,7 +621,7 @@ int igt_main()
 
 	igt_describe("Verify the basic functionality of i915 driver after it's reloaded.");
 	igt_subtest("reload") {
-		igt_i915_driver_unload();
+		igt_assert_eq(igt_i915_driver_unload(), 0);
 
 		load_and_check_i915();
 
@@ -630,11 +630,11 @@ int igt_main()
 
 	igt_describe("Verify that i915 driver can be successfully loaded with disabled display.");
 	igt_subtest("reload-no-display") {
-		igt_i915_driver_unload();
+		igt_assert_eq(igt_i915_driver_unload(), 0);
 
 		igt_assert_eq(igt_i915_driver_load("disable_display=1"), 0);
 
-		igt_i915_driver_unload();
+		igt_assert_eq(igt_i915_driver_unload(), 0);
 	}
 
 	igt_describe("Test i915 fault injection");
@@ -683,7 +683,7 @@ int igt_main()
 		result_bar_size = driver_load_with_lmem_bar_size(lmem_bar_size, false);
 		igt_assert_f(lmem_bar_size != result_bar_size, "Bar resized to unsupported size.\n");
 
-		igt_i915_driver_unload();
+		igt_assert_eq(igt_i915_driver_unload(), 0);
 	}
 
 	/* Subtests should unload the module themselves if they use modparams */
-- 
2.43.0

