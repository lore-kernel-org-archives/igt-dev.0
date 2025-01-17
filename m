Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAC0C0218A
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jan 2025 23:18:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D8510EB85;
	Fri, 17 Jan 2025 23:18:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IpMimV0V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB3A10EB85
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jan 2025 23:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737155890; x=1768691890;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SrahTO/2hrb9E9gGLSZmjHUOIvmz2Q4iHKGUXIUKNPM=;
 b=IpMimV0VAAkbNchoXYlljWa6lyDD2TJ1R+UHUGmZf2ZJxd2UQzAAHzWD
 D65sCnEHMTDpYZjTqgrcnKfAJ8NOiTTIi0pvqv/UA6vwIU0DIH24QT0/C
 9f+yJgByHECy+iW7zGTWUOda7lSIxR0LUjJzEYs8TVqJjtpaJahL5YxxW
 EOsyyM2GVz5SY3zmjN7RKVyWocljSrzkaz28TNUYfAEDn5Nrfv9Zy5wCw
 oxUYxgRODZvTclzIgjAJz7ZtNVAyLohcEp7T/ocN0+5/dxKxJHUOIoN+7
 GZcmA2O05LFsRClysJLIe8+Mlb3itK7WLZFhsKodkPwUaaKMKleDq580z w==;
X-CSE-ConnectionGUID: yS1NU1fETgSI+azh3mutXQ==
X-CSE-MsgGUID: 6DVGJGMkQm+SdX8Rc5aZ+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37627819"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; d="scan'208";a="37627819"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 15:18:10 -0800
X-CSE-ConnectionGUID: n8xRlAk+ThKWGmIJcLvrZQ==
X-CSE-MsgGUID: mwrNBF6LR7eXnFNGvGEzEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="106819379"
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
Date: Fri, 17 Jan 2025 15:17:49 -0800
Message-ID: <20250117231751.429703-9-lucas.demarchi@intel.com>
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

