Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F98606A325
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 15:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nCRVUkuU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9563010E541;
	Wed, 18 Nov 2026 15:54:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3353410FE0E
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 15:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795016746; x=1826552746;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2XZ75xsB9vwR6jyOqVxcyfbIRqH78wdoe/L8p/fCNO4=;
 b=nCRVUkuUTSy/fmVLh+zlgk1iQcWF7v+nCPkbhP62OInKthj1HARu/B2o
 7c3QJMYAVlKoHyUAexthuB/5PWSKAgoG2x7P5IbP5CrGGGv6Q1UlSfqKI
 ltXuui7s4Cj9VbS56e2+gACzTiosM7BnaaEu4iEqYuz54UM87iUOfjAZ9
 sGk3vK12RblHeY9km04DazsehW12N5GuLLQtrM3IF37vfy3BMkyvCb3WA
 uRPNLE6keYarhRkZiFhSYWs+egWClkBIuPq4cYgV833ZOoHp0p7g8qF4q
 Xka52GxLhPF8V3BGGJEulSiQjFq0EUlmYy54hdoaEHzoft1U/hVqPCIeg A==;
X-CSE-ConnectionGUID: 1f7PGTyeSGOzcEHf1u63jA==
X-CSE-MsgGUID: hshPTODgQjiefsr8GPu3RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3720389"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3720389"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:45:46 -0800
X-CSE-ConnectionGUID: tBAVc883SGucIO1drSHQwg==
X-CSE-MsgGUID: ZkgmoDMwSoGsiVLqcVaHxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10319410"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 jeevan-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.190.238.87])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:45:44 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, pranay.samala@intel.com, karthik.b.s@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 7/8] tests/intel/xe_module_load: Verify driver unload
 result
Date: Wed, 18 Nov 2026 21:14:22 +0530
Message-ID: <20261118154426.345883-8-jeevan.b@intel.com>
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

Assert that igt_xe_driver_unload() succeeds in the unload and reload
subtests instead of ignoring its return value. In the unload subtest also
check that xe is gone and that intel_display is unloaded too, unless i915
is still loaded and holds it.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/xe_module_load.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_module_load.c b/tests/intel/xe_module_load.c
index ae6c6708b..afb1bc0cd 100644
--- a/tests/intel/xe_module_load.c
+++ b/tests/intel/xe_module_load.c
@@ -130,7 +130,13 @@ int igt_main()
 	}
 
 	igt_subtest("unload") {
-		igt_xe_driver_unload();
+		igt_assert_eq(igt_xe_driver_unload(), IGT_EXIT_SUCCESS);
+		igt_assert(!igt_kmod_is_loaded("xe"));
+
+		/* intel_display stays only if i915 still uses it */
+		if (!igt_kmod_is_loaded("i915"))
+			igt_assert_f(!igt_kmod_is_loaded("intel_display"),
+				     "intel_display still loaded after xe unload\n");
 	}
 
 	igt_subtest("force-load") {
@@ -143,9 +149,9 @@ int igt_main()
 	}
 
 	igt_subtest("reload-no-display") {
-		igt_xe_driver_unload();
+		igt_assert_eq(igt_xe_driver_unload(), IGT_EXIT_SUCCESS);
 		load_and_check_xe("probe_display=0");
-		igt_xe_driver_unload();
+		igt_assert_eq(igt_xe_driver_unload(), IGT_EXIT_SUCCESS);
 	}
 
 	igt_subtest("many-reload") {
@@ -153,14 +159,14 @@ int igt_main()
 
 		for (i = 0; i < 10; i++) {
 			igt_debug("reload cycle: %d\n", i);
-			igt_xe_driver_unload();
+			igt_assert_eq(igt_xe_driver_unload(), IGT_EXIT_SUCCESS);
 			load_and_check_xe(NULL);
 			sleep(1);
 		}
 	}
 
 	igt_subtest("reload") {
-		igt_xe_driver_unload();
+		igt_assert_eq(igt_xe_driver_unload(), IGT_EXIT_SUCCESS);
 		load_and_check_xe(NULL);
 
 		/* only default modparams, can leave module loaded */
-- 
2.43.0

