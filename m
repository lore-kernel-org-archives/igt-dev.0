Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39AA8C02190
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 17:22:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E561310E9BE;
	Thu, 30 Jan 2025 17:22:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jYvaj2k5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 201EE10E36D
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2025 17:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738257735; x=1769793735;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QmM2tq0iitJvOEJf8WEFQWlHhM5hxAO9T9bdFHKbXuY=;
 b=jYvaj2k5ERVrWwPZO7VET67GnnOaGFifojS54r58yH7UJRY0+W0g2adn
 XDrM+4NVNDWd+3LTLNgk/qelNvr+CAyGFNg7EYJpT27VsqZMEo8SFGky+
 74dscQwG0uei1dt/j6xVrYkUikgwWScyYJ12Pd/VamtOFbAWCsAsaqgZC
 pRErDKSaua53n9AesSWTxXge44P0/3oFWpuqMQLzu1f7JZ/mC5GzK75tj
 K+Ri8x/NeMs8AIds17Ou5jel88ai8Ql56UmmfGxw0iXg/4557pGNWldP1
 1YAF0JSyrzb7RmrJLsTNvBmqgPDlS5dFykSv+5kSwBixC4XyANp69zOlX g==;
X-CSE-ConnectionGUID: 9UsGWp2bTCefvM+4XCPUrw==
X-CSE-MsgGUID: axAW28rPR1y4WlizfLmHAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="42567069"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="42567069"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 09:22:11 -0800
X-CSE-ConnectionGUID: SUH/P9PyTLiWMf+390CSyA==
X-CSE-MsgGUID: tU0rh/SyQLyOOgvN3M6jIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="109539644"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 09:22:11 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 01/10] runner/settings: Fix code_coverage_script leak
Date: Thu, 30 Jan 2025 09:21:40 -0800
Message-ID: <20250130172149.3657144-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250130172149.3657144-1-lucas.demarchi@intel.com>
References: <20250130172149.3657144-1-lucas.demarchi@intel.com>
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

Make sure to free it when clearing settings.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Tested-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 runner/settings.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/runner/settings.c b/runner/settings.c
index 92fd42ea6..afb312dc1 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -640,6 +640,7 @@ void clear_settings(struct settings *settings)
 	free(settings->name);
 	free(settings->test_root);
 	free(settings->results_path);
+	free(settings->code_coverage_script);
 
 	free_regexes(&settings->include_regexes);
 	free_regexes(&settings->exclude_regexes);
-- 
2.48.0

