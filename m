Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9617CC02190
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 17:22:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F8610E37B;
	Thu, 30 Jan 2025 17:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lULFxiNY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3080910E37B
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2025 17:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738257735; x=1769793735;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YoZmK44XhlSDJTtaK6qFfpUXaEr3XTCH1zgBAwm4C2g=;
 b=lULFxiNYvc3aRi7/8bYXH8gRSQHn4bk6KW88V77a4hZ6VI8a6UEu5Chj
 U39ko7wUAtXPwyARUS6JG01u5yIcXAzVq6WRvsNaXQko3CFKbewFxq7I1
 Yxj3GJ/LjqVEAbzw4ZN6e6wVd/nLPmfGRHRgHBZhA9EFhlysBNzauOa+s
 fWr+1zvIpqgDt/0a6CGw3ZI26TOkmGM9KoG7m0ER2K686fuCv9qF3+KRF
 JBOExHek2Jj10bGoJxRGiKuvT24FXMdtbJJKo63bNC8+afHBQyAr11aRM
 hcHyOT70cCKaT/NgOLkdcCpoXOMhrEG7dC6maKlUrYSMhdkbgvojuw336 w==;
X-CSE-ConnectionGUID: iGfTAHFSTzWUbLSArJQGTQ==
X-CSE-MsgGUID: gu5DdFKsQXi406Gkda+cFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="42567073"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="42567073"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 09:22:12 -0800
X-CSE-ConnectionGUID: H2/6d0/vS/yBxkk65b3Y4w==
X-CSE-MsgGUID: YZ+9ij2BSzWYIKbN3nQDmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="109539651"
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
Subject: [PATCH i-g-t v3 03/10] runner/settings: Deduplicate cleanup
Date: Thu, 30 Jan 2025 09:21:42 -0800
Message-ID: <20250130172149.3657144-4-lucas.demarchi@intel.com>
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

Deduplicate cleanup so it's also easy to parse the line in a different
way.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Tested-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 runner/settings.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/runner/settings.c b/runner/settings.c
index afb312dc1..89df4990e 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -1155,13 +1155,10 @@ bool serialize_settings(struct settings *settings)
 
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
@@ -1196,6 +1193,8 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
 
 		printf("Warning: Unknown field in settings file: %s = %s\n",
 		       name, val);
+
+cleanup:
 		free(name);
 		free(val);
 		name = val = NULL;
-- 
2.48.0

