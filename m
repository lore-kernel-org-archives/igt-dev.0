Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73B3C0218B
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jan 2025 22:57:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7157C10E2ED;
	Tue, 21 Jan 2025 22:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RgPEr8jP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC5B10E640
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2025 22:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737500272; x=1769036272;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BokH82vtDqPrx4BXhXtCW9MDlZJyHlaH6rTR4AtaCSw=;
 b=RgPEr8jPZRiHQj9Ok1Pb8iAXbII8MPVqWnYkvFexc2RJS3IvNz2lL991
 c9CqkZHIF8hgSnJmaEHIUKt8Da7P7oHw04PLO/fdBasp/LLP8Jev+wcM8
 TTAHvnT4fi7gm2M+XC0IkNdl/thF62uCKp5mmsvnAnwnV6KFS9XJmfeLm
 uKznTgmqvdiJKnZXilLECAYXRrL/BsDyFvDYfT0GZ9bnWBQ41v1sdpZSU
 B9NIydOKZWkqJqgzRp1dfRSsltmggfzJshVCqripkTjIFgvoW7lQhg9hn
 jz0kT9AR0aT3j3lqMbi7Y+ujIdbJtZN5Get7CEVrHxMR0crbFNDEZR1wT Q==;
X-CSE-ConnectionGUID: BI/jeGrIT665OTueqrDfjw==
X-CSE-MsgGUID: Twpkuf06TGSxf2O0RreoCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="55352726"
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; d="scan'208";a="55352726"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 14:57:52 -0800
X-CSE-ConnectionGUID: W0mww6fTQCeMOGgiPMkUJA==
X-CSE-MsgGUID: DUDAvuCEQwaCz2N57SmmcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="111933675"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 14:57:52 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 4/7] runner/settings: Fix code_coverage_script leak
Date: Tue, 21 Jan 2025 14:57:30 -0800
Message-ID: <20250121225733.808978-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250121225733.808978-1-lucas.demarchi@intel.com>
References: <20250121225733.808978-1-lucas.demarchi@intel.com>
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

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 runner/settings.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/runner/settings.c b/runner/settings.c
index 96377f1de..2787869ee 100644
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

