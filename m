Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF711C5473A
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 05:42:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE88B10E265;
	Tue, 27 Aug 2024 05:42:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VsPbTG1k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653E610E05F
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 05:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724737374; x=1756273374;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6Z7c996V+TQfWNWgXwiWNTr8ysjwrgW6A0iRVcTZ/wI=;
 b=VsPbTG1kwWlttUxFJGG2jbJ8RPAtqU8lg1MW+kFpi8H0PwEjhq/ECqHl
 uzs4PDW0lFtRFd5u+7bnX91dVYTHD1TS3Zf3hOc+AtSvjqbtzAae84WD6
 GaIWduTS5r2ASdkXnRpz/n5dhwrdYLJKiDxG1Tvl+4hiLOGe6kbpxoEBl
 rhgXEaVl621KZvfxt1Sig7XNyFO83hv+/nc0nfILGRmMcCfOT0MWHTHO8
 pb39AWooztdapb/dfAeR/0FOnlL7l/dCQXtif+uwwerA6zWEv9ZgSGrtu
 EBIOh3RbyA25xJrlBHvC7qvYLBcVHzAL4eC64+LQtXmI5lA1ZjJ22cV1W Q==;
X-CSE-ConnectionGUID: FCaCORY0QaKavaSfJ18UDQ==
X-CSE-MsgGUID: oDAhEc1QRkmeZze2RxGo0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23372151"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="23372151"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 22:42:54 -0700
X-CSE-ConnectionGUID: qVshXhNNS1utmz+9RvhSMw==
X-CSE-MsgGUID: otS/eogFSpy5i4PsOzc3hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="67556982"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 22:42:54 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH i-g-t 04/10] tests/intel/xe_drm_fdinfo: Use
 igt_assert_lt_double()
Date: Mon, 26 Aug 2024 22:42:16 -0700
Message-ID: <20240827054223.1671414-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827054223.1671414-1-lucas.demarchi@intel.com>
References: <20240827054223.1671414-1-lucas.demarchi@intel.com>
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

This also shows the value that is failing, which helps debugging.

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 074a89711..1b5980752 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -485,10 +485,12 @@ check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
 
 	igt_debug("%s: percent: %f\n", engine_map[class], percent);
 
-	if (flags & TEST_BUSY)
-		igt_assert(percent >= 95 && percent <= 105);
-	else
+	if (flags & TEST_BUSY) {
+		igt_assert_lt_double(95.0, percent);
+		igt_assert_lt_double(percent, 105.0);
+	} else {
 		igt_assert(!percent);
+	}
 }
 
 static void
-- 
2.43.0

