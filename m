Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802BFC0218D
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jan 2025 22:57:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77ADF10E650;
	Tue, 21 Jan 2025 22:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QPuba1O+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C6510E1FF
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2025 22:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737500272; x=1769036272;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SrahTO/2hrb9E9gGLSZmjHUOIvmz2Q4iHKGUXIUKNPM=;
 b=QPuba1O+xvmnwqFHeg3Hqxu0wuDrJ+xPUH7uOJzkUKWndSu6JEJxLaFo
 W4VEY5Szk3CDdMqrkc9Ek329EUmLYaMEgrauiAF42qsUFbWDBeeeWFAdi
 5kA6jxmAR3H+lfV1JReQx+TdmRW5XrMaOxGhsRxtfwap8DEitsHJGCwz/
 ZhSXQ7nP+6l5O6p+eTWwtMA5X3XyLiVlLaNOZ5gUc7UVfBoZaTmZr/5SR
 eGQzE1RUl5unYHEvhEIb1SV+BG/ktxVwekxGETYPFQ9LPE7u1y1cuIKsQ
 8xrslB7D69ruNuhcNBDEyfLuavu/TtY2kfow7xrOwJeHnYPow7ywL++rF Q==;
X-CSE-ConnectionGUID: kvD1fVSJQpS9Xwe+W0GnKA==
X-CSE-MsgGUID: 4qH1JB6LQA6iQPCR7sw2iA==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="55352725"
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; d="scan'208";a="55352725"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 14:57:52 -0800
X-CSE-ConnectionGUID: 09AP0ZlpSjeof0V7+Fp4Vw==
X-CSE-MsgGUID: 1FxkqcErQ96EYRU1jVhkBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="111933672"
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
Subject: [PATCH i-g-t v2 3/7] runner/settings: Drop extra strdup
Date: Tue, 21 Jan 2025 14:57:29 -0800
Message-ID: <20250121225733.808978-4-lucas.demarchi@intel.com>
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

