Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5103BC5472C
	for <igt-dev@archiver.kernel.org>; Sat, 24 Aug 2024 06:25:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD3D10E19E;
	Sat, 24 Aug 2024 06:25:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="auhdGp+c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0736810E1A7
 for <igt-dev@lists.freedesktop.org>; Sat, 24 Aug 2024 06:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724480719; x=1756016719;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5NiCnr9NCaJrWHau38ULgy79UF1naayfivKTjOKo+9Y=;
 b=auhdGp+c8Y9IsNo08UiSV34pNdomFVNmJSlqE5/96uS5V9gKMG/IscyH
 lZLaSuJCs1HfO2/B3gdU/iqPzcy8G9dOSZ4h2oMLZH1v+8ZcYfdirzDcf
 FvVFn5izCsPgZ30nOkc96bwAKkr/EGZo8gacgUfJ6GoBgED3+kJKTp+Pd
 vHPPwMRbyvqB1hQpvllfESYdkKtJhcvystZQ5kilo8dfpDzEFw8uV/5Sp
 Zy+ZjQ+StEZq4O4Nxy/7HBZOl/dnUZ+y4Rymrl3XpWBztYkP+muCefEh2
 Af3KwCjgdFqOGetOgGIFn0JggP16/rauFAwI/JG3jlKxR5hwYqlyGkW/4 w==;
X-CSE-ConnectionGUID: 0oteB1xPQqad4t8XUtWpwg==
X-CSE-MsgGUID: L4Zumk7eSeGYkhQ2XqVzEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="23099886"
X-IronPort-AV: E=Sophos;i="6.10,172,1719903600"; d="scan'208";a="23099886"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 23:25:18 -0700
X-CSE-ConnectionGUID: WkMIrRxzTn6wfEy+L3nB2A==
X-CSE-MsgGUID: qSr61XtKQBGJKwyFM444sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,172,1719903600"; d="scan'208";a="62003943"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 23:25:18 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 2/5] tests/intel/xe_drm_fdinfo: Half the execution time
Date: Fri, 23 Aug 2024 23:25:01 -0700
Message-ID: <20240824062504.1122536-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240824062504.1122536-1-lucas.demarchi@intel.com>
References: <20240824062504.1122536-1-lucas.demarchi@intel.com>
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

No need to do 500 msec per subtest. As we add more tests, the total
execution time of ~ 2.5 sec per subtest make it take too long. Sleep
half the time to lower the execution time.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index aea73a4ae..dd3fb1034 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -73,7 +73,7 @@ struct pceu_cycles {
 	uint64_t total_cycles;
 };
 
-const unsigned long batch_duration_usec = (1 * USEC_PER_SEC) / 2;
+const unsigned long batch_duration_usec = (1 * USEC_PER_SEC) / 4;
 
 static const char *engine_map[] = {
 	"rcs",
-- 
2.43.0

