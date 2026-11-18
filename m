Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F071606A325
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 15:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c+eNRbkK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1652C10E80C;
	Wed, 18 Nov 2026 15:53:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C56CA10FE15
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 15:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795016739; x=1826552739;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=geWjYdZVDcYbZntK3pmot/7WaL+Bgtu6KoJACnVQgik=;
 b=c+eNRbkKGGdNsAeB+fX2Zp2NyY5hYTQKMrDHhut8/aAGOLolgimeCEwO
 CWvaclFAPZPIK2BpGs2a5Zirucl35SM89qWDMLxLjmC1Cip3O+0k8Cy59
 mRxKvUUeK7CVlZPCRxNWR7mkFdxKnSRTTRzpiZa65Jf2B4DEG93GdQGQu
 SoS/vqjMtFbk7C5ggbWcHq3EyBF5uAdaSCfSVVdEwkJSVzupwHt1aUeF2
 Cd+wgEbxBYBlLM1xpurfGG52OonAPyhOJANdy/lK2EL4nDTYzJbbUDcmh
 X9sMmRGLyQyeU3jX7kj4zgb2QKOkfQLetCrP0j7RwtS6hd3DcYieOagHX Q==;
X-CSE-ConnectionGUID: kn+MEV1wTc60SDXbih/ahA==
X-CSE-MsgGUID: cfzlQs8rR2O5/65j//Gt6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3720358"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3720358"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:45:38 -0800
X-CSE-ConnectionGUID: aREC4fy0RqGUMsQLIsMhpQ==
X-CSE-MsgGUID: zkG5AFfeQK6A9i+/3Wy1kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10319390"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 jeevan-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.190.238.87])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:45:36 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, pranay.samala@intel.com, karthik.b.s@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 3/8] tests/intel/i915_module_load: Check intel_display
 in load subtest
Date: Wed, 18 Nov 2026 21:14:18 +0530
Message-ID: <20261118154426.345883-4-jeevan.b@intel.com>
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

Add intel_display to unwanted_drivers so the load subtest skips when it
is already loaded.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/i915_module_load.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/i915_module_load.c b/tests/intel/i915_module_load.c
index 68e238646..c875d2501 100644
--- a/tests/intel/i915_module_load.c
+++ b/tests/intel/i915_module_load.c
@@ -605,6 +605,7 @@ int igt_main()
 	igt_describe("Check if i915 and friends are not yet loaded, then load them.");
 	igt_subtest("load") {
 		const char * unwanted_drivers[] = {
+			"intel_display",
 			"i915",
 			"intel-gtt",
 			NULL
-- 
2.43.0

