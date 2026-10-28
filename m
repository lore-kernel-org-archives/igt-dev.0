Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07260606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 13:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZxSLtFQp
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B440E10FC6F;
	Wed, 28 Oct 2026 13:46:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF22710FCB2
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 13:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793195113; x=1824731113;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gpdmvvrykC7bl6ZySZdorIOOr0OqHfTEHAVMLsvmJVc=;
 b=ZxSLtFQpN69g0gkZDGT3SVjdWiiN6G3WbbGIWul2bc7h7BGBgAtg6nKt
 8SwRawFrYs/loCu9907UNQTn1cLdqjzjxSMDVR/ICNZ5GFQQRdDQdnpFf
 QWIcWOzXPIgItgmt6W+UtVQ1MxMhWki0oXPA4upQzU6cC0HiOXzyAcFt5
 qc1jGYG5MIlsRTzRWxuknEyAuseOw6J8OLQSR8ts/9EtilIT02jz89ANQ
 igRpz1iCSpla87CdKRZEijOseZymxnSwokunouc5NDM4XEpLePu3ef74b
 U0Xp2FibKmqlX4e4vZeYZjgsVwDYO0Z7drE36rNHr058T23SqQW3LZsDQ w==;
X-CSE-ConnectionGUID: m1GVnDjrTWehoa//ELmZ+A==
X-CSE-MsgGUID: MYP+9J+DQ02UzjwMfP0ZTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1811940"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1811940"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 06:45:13 -0700
X-CSE-ConnectionGUID: KPB28iLpQ+uHVFy95n78Wg==
X-CSE-MsgGUID: EZZWHGM/SXiiYGVR5xoJ+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4831235"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 06:45:10 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v5 1/2] tests/intel/xe_wedged: ignore expected wedged dmesg
Date: Wed, 28 Oct 2026 19:00:47 +0530
Message-ID: <20261028133045.1966466-5-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028133045.1966466-4-sk.anirban@intel.com>
References: <20261028133045.1966466-4-sk.anirban@intel.com>
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

Add GSC proxy, wedged recovery and SIGID based failure
messages to the expected wedged dmesg filter.

Suggested-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/xe_wedged.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index ba7efbe1d..062e395d1 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -56,6 +56,10 @@ static void ignore_wedged_in_dmesg(void)
 				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Fault response: Unsuccessful -EINVAL"
 				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Engine memory CAT error"
 				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: GuC: Uncorrectable"
+				    "|GT[0-9A-Fa-f]*: Invalid gsc header in proxy reply"
+				    "|device wedged, needs recovery"
+				    "|SIGID=[0-9]+ .*GT: reset failed"
+				    "|SIGID=102"
 				    "|SIGID=203");
 }
 
-- 
2.43.0

