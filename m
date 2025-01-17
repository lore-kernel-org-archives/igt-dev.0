Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DF6C02188
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jan 2025 23:18:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A131710EB8A;
	Fri, 17 Jan 2025 23:18:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mg0ddxxs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5604710E095
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jan 2025 23:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737155890; x=1768691890;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SrahTO/2hrb9E9gGLSZmjHUOIvmz2Q4iHKGUXIUKNPM=;
 b=mg0ddxxsX+1vIxjM3bmQYIf71guxzj6q5vMpvqL1jWJlSAP2cjKBHBWk
 0s6Kkckm/Pr1rom1vBY7aI9pLX4sl5hyAk9Fg4B+8xi2vUuUN/6MowLIN
 e5ptpglAUjRnhsET/iiFDFubPOpTnse/koHfLNTgo4hDt3MkYxGMMFGmh
 3oCI4R5r+cfNxiGvuYCAMyX3lGAerqQR9Wx1Onq4T5i7Fhew7I1vT2LDw
 4dqEK8debYBz1POUX4wnD6U1E6G2eImtN6sPizrvsnFITFmT+26BRlekz
 IFJPZdj36BGrquBJiEgBkJ8tkpyj+D2bBo+LtIKPXHlvO/Ct3VrN/UOaA A==;
X-CSE-ConnectionGUID: qjanoYqLRUW9ALWifH2nHg==
X-CSE-MsgGUID: gu5SyLTySnSRqifkhYZJ9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37627814"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; d="scan'208";a="37627814"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 15:18:10 -0800
X-CSE-ConnectionGUID: Wq0ggOAvTJSmJe+sak4+xw==
X-CSE-MsgGUID: TWWqMYJhQG6bK9f+SaQMWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="106819362"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 15:18:10 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 3/5] runner/settings: Drop extra strdup
Date: Fri, 17 Jan 2025 15:17:44 -0800
Message-ID: <20250117231751.429703-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250117231751.429703-1-lucas.demarchi@intel.com>
References: <20250117231751.429703-1-lucas.demarchi@intel.com>
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

No need to strdup() again since the fscanf() function is already
allocating the variable. Just set the pointer to NULL so we "leak" our
variable to be saved in the settings.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 runner/settings.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/runner/settings.c b/runner/settings.c
index 13694a51c..96377f1de 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -1164,7 +1164,11 @@ static unsigned long parse_ul(char **pval)
 
 static char *parse_str(char **pval)
 {
-	return *pval ? strdup(*pval) : NULL;
+	char *ret = *pval;
+
+	*pval = NULL;
+
+	return ret;
 }
 
 #define PARSE_LINE(s, name, val, field, _f)	\
-- 
2.48.0

