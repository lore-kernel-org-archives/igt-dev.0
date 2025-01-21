Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFACDC0218E
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jan 2025 22:57:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C6710E2F8;
	Tue, 21 Jan 2025 22:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CV7vIDuz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28AE10E640
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2025 22:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737500272; x=1769036272;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x2u2i9yXEjfgG9gBPA1mq90PNnZUmuXr52121sc0T1I=;
 b=CV7vIDuzwTJwcGehiibgMIvJaAbkc7nJk2jpwW+4Bul0cCylDoHHH4Ze
 oZysrYDiyt+4Zs0bHzHpn1IwbbozQvjDwV2Ou+lADTEW+xOAd5D3FlY0D
 QjIfgLLEQTy46lk0ONaH/C6ccB2yV19N2gW7i8vP7UbKSDGz9J3hFIjjG
 PevG9eH6uumjGP+w5CqSx0b9fX2dIDOyCtt5MkpYGZmZMpra0mgwKQrP2
 jwqVCtILAoTB6s8OY9emaDaipGpk/GKoWwAuDGhxbBvjaZXkz5b+w41GP
 /CaTvo7gsaLQn4HZ0ij43wCiupyIwu4YGCChTxr+sYbAywXhX2yux9/oK w==;
X-CSE-ConnectionGUID: OeRwB8V9QEChgiyxd/Q0/g==
X-CSE-MsgGUID: t2p5YOITT3OjyPxWB05QbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="55352723"
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; d="scan'208";a="55352723"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 14:57:52 -0800
X-CSE-ConnectionGUID: 7EmpIrlAQlypZjwNuSEA5A==
X-CSE-MsgGUID: ivFUP5rNR2iYDWYIYkZucg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="111933666"
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
Subject: [PATCH i-g-t v2 1/7] runner/settings: Deduplicate cleanup
Date: Tue, 21 Jan 2025 14:57:27 -0800
Message-ID: <20250121225733.808978-2-lucas.demarchi@intel.com>
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

