Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A254C0218D
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jan 2025 23:18:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F9210EB8C;
	Fri, 17 Jan 2025 23:18:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l/AGpWHE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A13D10E327
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jan 2025 23:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737155890; x=1768691890;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x2u2i9yXEjfgG9gBPA1mq90PNnZUmuXr52121sc0T1I=;
 b=l/AGpWHE2L+reGDyjI8gAny61GzKMQy+hT5nQKPP+oQFCpaRfPg+mS4w
 RPjORkPomSSpsm38PzK9ZvzZeN4kSMpILOB/MoUbPsbXtR5WV0ZRTIS4p
 eZsCh10iKzLgLK4p6xDw8UtBFvX9b9P8vdgXXl5XTD84RpQYpxHOj120p
 90u2uc59vCXs8kzB1oIikGqiVXD+SV5to+WNw4SlYWqUN2Ym4u7tHiJwT
 a+93PJTlf3jYSwRTLzKhZWhh9hnZHSkDYXTI4WhenZN5w0uiQWZygNYK5
 lgfcQwrfFtDNJdN6WJvOL1Y78QQ6ztPoKOnw6EbMxvEd8XarI6lPa02Ar w==;
X-CSE-ConnectionGUID: U6+Q59TQRMy+tHWhJHICXA==
X-CSE-MsgGUID: SmLWXRUgSDSVzYDwSwO/oA==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37627812"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; d="scan'208";a="37627812"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 15:18:10 -0800
X-CSE-ConnectionGUID: oGECJGvzQsiLzuWNIEeh2A==
X-CSE-MsgGUID: q3pLmqpUQs2zRB3Q7K26Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="106819355"
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
Subject: [PATCH i-g-t 1/5] runner/settings: Deduplicate cleanup
Date: Fri, 17 Jan 2025 15:17:42 -0800
Message-ID: <20250117231751.429703-2-lucas.demarchi@intel.com>
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

Deduplicate cleanup so it's also easy to parse the line in a different
way.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 runner/settings.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/runner/settings.c b/runner/settings.c
index 92fd42ea6..80d95be5b 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -1154,13 +1154,10 @@ bool serialize_settings(struct settings *settings)
 
 bool read_settings_from_file(struct settings *settings, FILE *f)
 {
-#define PARSE_LINE(s, name, val, field, write) \
-	if (!strcmp(name, #field)) {	       \
-		s->field = write;	       \
-		free(name);		       \
-		free(val);		       \
-		name = val = NULL;	       \
-		continue;		       \
+#define PARSE_LINE(s, name, val, field, write)	\
+	if (!strcmp(name, #field)) {		\
+		s->field = write;		\
+		goto cleanup;			\
 	}
 
 	char *name = NULL, *val = NULL;
@@ -1195,6 +1192,8 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
 
 		printf("Warning: Unknown field in settings file: %s = %s\n",
 		       name, val);
+
+cleanup:
 		free(name);
 		free(val);
 		name = val = NULL;
-- 
2.48.0

