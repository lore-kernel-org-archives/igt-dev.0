Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 763F4C02196
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 17:22:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C626310E9B6;
	Thu, 30 Jan 2025 17:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W066ZSA1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF9D10E06B
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2025 17:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738257735; x=1769793735;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vtSS96eoITjdh8ClAl4iGP24kj4nyRZKVrxZfD5WIr8=;
 b=W066ZSA10TVEyqP3pqkZO5cdZvkPdkAty0804H7JE2ege03+A0CvfQ3Z
 xh0AmbN18+SDSspw5TOhziTD/5UU9mC2OmY8ucARuhZYNP7ukz9GBNYZX
 SZ4xCilgPXPE55fWg83w/vQK1SoZwB7JhEHGNRWV3tLQ30IFfRW9vKwvn
 ssROPpyGW/z3/anxXhfQNr1AOoZ98uG8cfbBEaboTpie8z4pXrz6SEkPF
 6aEXr5HvdQx2Y2Dw4aaOyRrwNZ/V4FotVjEsRjWcPCZedmBltx4wfsD+R
 eEtiEJ2LfssAtFTWbMMi/QCsXULTxfRZxoGWTtNjSnnCHqI+/FJ3a8R9p g==;
X-CSE-ConnectionGUID: Df6mzamYRbW3lJ6ACfZmpw==
X-CSE-MsgGUID: 8oGt4Hp3S7ebr+XXXgc8tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="42567079"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="42567079"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 09:22:12 -0800
X-CSE-ConnectionGUID: p00++uOjQwa1KnDVijgnsA==
X-CSE-MsgGUID: HbXAbrtZTKG1xeAJFvLJkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="109539662"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 09:22:12 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 06/10] runner/settings: Drop extra strdup
Date: Thu, 30 Jan 2025 09:21:45 -0800
Message-ID: <20250130172149.3657144-7-lucas.demarchi@intel.com>
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

No need to strdup() again since the fscanf() function is already
allocating the variable. Just set the pointer to NULL so we "leak" our
variable to be saved in the settings.

Tested-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 runner/settings.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/runner/settings.c b/runner/settings.c
index 73d8aa13d..693c5484e 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -1169,7 +1169,11 @@ static unsigned long parse_ul(char **val)
 
 static char *parse_str(char **val)
 {
-	return *val ? strdup(*val) : NULL;
+	char *ret = *val;
+
+	*val = NULL;
+
+	return ret;
 }
 
 #define PARSE_LINE(s, name, val, field, _f)	\
-- 
2.48.0

