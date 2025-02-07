Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7ACC021A4
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 23:13:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3269910EBB8;
	Fri,  7 Feb 2025 23:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="boAr3ZZ7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 482A110E334
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 23:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738969870; x=1770505870;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=FiUO7YYDkQm5N3andC/YDJKNO2uijD5gDwvOaOmFNps=;
 b=boAr3ZZ7PLvSEGECsSSiUX2NlVdEYZjgPJkfHaqaPQtn5tlLJIo66MJI
 Dn6XDaa/VM0Q5Xv/gGHaoxZScBLJXUCaysPjkalTZOYrRLt9sVcSGq8XU
 6ivgwb8jLUTY9CCk5Xk5FsSwkdrFkY6sK4MD5GoOV33Lj/Cnz+o/y8sWg
 Yp5sv0CpKwT0Q+QaS1xVjohKroX9WXmZWF/GbCEB95zm+i7mvgPsu4JVZ
 wVQZUJup1EAu4z4JHtWnStbNZ09MT9PF0oK7TMKkRcBxScAmvlIJR7/6S
 YYzk2QDfx0O56XsiMPOh9F6kCJvGmyTMElCZIApv9748z4TZ9Qa6s6cDo g==;
X-CSE-ConnectionGUID: kld47Pd3SP24beeZd5u+eQ==
X-CSE-MsgGUID: OjWVlltYSJC4PFw/5V486g==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="43281772"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="43281772"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 15:11:09 -0800
X-CSE-ConnectionGUID: pghKCDP7R9eYBtcdL7qHkA==
X-CSE-MsgGUID: YdmA3lQSQBmjd+0aSwoMNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="111425861"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 15:11:09 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [CI i-g-t 03/10] runner/settings: Deduplicate cleanup
Date: Fri,  7 Feb 2025 15:09:37 -0800
Message-ID: <20250207231039.2883195-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207231039.2883195-2-lucas.demarchi@intel.com>
References: <20250207231039.2883195-2-lucas.demarchi@intel.com>
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
2.48.1

