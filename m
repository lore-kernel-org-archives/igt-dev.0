Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25D6C02188
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jan 2025 23:18:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA7510EB90;
	Fri, 17 Jan 2025 23:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gJwigQAB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D6D10E3E4
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jan 2025 23:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737155890; x=1768691890;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x2u2i9yXEjfgG9gBPA1mq90PNnZUmuXr52121sc0T1I=;
 b=gJwigQABy9sQeCM2qXgtNoz9PsY1ZqWU6pdJvtNsoOYeq8Gsj5sjFDKL
 ZtZu41f7ki0zttj5VKnVoazN7EnQX3Ue7mN9E52M+75tZA6RK3eHM8OfY
 qbj0tazo2L6DOxGRn05ZsDJwOeMUJTFJia4+Pl1Nn+rEq1ZK4b6IXDxRx
 msqKA+wL9JqhVzmKMrqE34PfFS6/e8lkl15pJzWrrktRmzngnM8yVm2VR
 b2TzlEja/BIhBaWIpyyL2RmBRC///KUwlDPzjstT8uipIpVn23MflF4Aw
 RU7E8k3zwaWfGKzuj0T2iqilcBRdKq9GSoRwlI2hx1Zc5fw37z7muh0vl w==;
X-CSE-ConnectionGUID: sgQE7T4YT7KiN594Ejyv8A==
X-CSE-MsgGUID: noa9vZfhSvSwYX8wbwQc7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37627817"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; d="scan'208";a="37627817"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 15:18:10 -0800
X-CSE-ConnectionGUID: rr1WgwL3RPmVltZqhrCJ3A==
X-CSE-MsgGUID: GTZ42N/BTFKLx3a/wskHcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="106819372"
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
Date: Fri, 17 Jan 2025 15:17:47 -0800
Message-ID: <20250117231751.429703-7-lucas.demarchi@intel.com>
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

