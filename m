Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED638C02199
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 17:22:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073D010E9BD;
	Thu, 30 Jan 2025 17:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i+hCmQJp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F5010E37B
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2025 17:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738257735; x=1769793735;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fInpDNDGsmlTMy97PRnn34Gc5jqS9+vNLgtfXx20Ac4=;
 b=i+hCmQJpWc+rO2q2R2QOnp0C3Q+z7YMQnf4kvIJUNluUcQ38DzeiG4qR
 MspAIY7noWRSF77z4P/rcWVvy7FBa3+rpaZFh7GRwTYoygtbp62jmQ7Gk
 oDKGh1lU30xaHoJPejM0hZ0VbsMjkBQPv42fnxd1cloHwtZCybi1cOas7
 NqSpz1WtogfvPtX7cznR/7RAuXOveoWGE0grcyLsoK8vM4Y+akdWoPV1K
 VUyWGTwxzfeV0d0VseXC8ifrF57wN4e+hSIvNNagUFE2n9rF5KA2lqR/L
 kciHQ3OIkKHmJkIqz2XGTiuQmRje8yKi9cvxgWctD3ls/ZbZPmcG0+JCn A==;
X-CSE-ConnectionGUID: cCu+vcbdTa6KV/sUDySumg==
X-CSE-MsgGUID: aG7c60IaT+S5q63mUnd2QA==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="42567083"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="42567083"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 09:22:12 -0800
X-CSE-ConnectionGUID: wSWHVYteR5+s2X13ubpqCA==
X-CSE-MsgGUID: 5PbCZRXoR4uZcyjThQLIhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="109539670"
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
Subject: [PATCH i-g-t v3 08/10] runner/settings: Add helpers to
 serialize/parse array
Date: Thu, 30 Jan 2025 09:21:47 -0800
Message-ID: <20250130172149.3657144-9-lucas.demarchi@intel.com>
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

Prepare parser/serialize to handle arrays.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 runner/settings.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/runner/settings.c b/runner/settings.c
index b527c01d9..62afd3534 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -1125,6 +1125,15 @@ static size_t unescape_str(char *buf, size_t *n_src)
 		escape_str(s->name, f);	\
 		fputc('\n', f);		\
 	} while (0)
+#define SERIALIZE_STR_ARRAY(f, s, name, name_len)		\
+	do {							\
+		SERIALIZE_INT(f, s, name_len);			\
+		for (int _i = 0; _i < s->name_len; _i++) {	\
+			fprintf(f, #name "[%d] : ", _i);	\
+			escape_str(s->name[_i], f);		\
+			fputc('\n', f);				\
+		}						\
+	} while (0)
 bool serialize_settings(struct settings *settings)
 {
 	FILE *f;
@@ -1221,6 +1230,7 @@ bool serialize_settings(struct settings *settings)
 	close(dirfd);
 	return true;
 }
+#undef SERIALIZE_STR_ARRAY
 #undef SERIALIZE_STR
 #undef SERIALIZE_UL
 #undef SERIALIZE_INT
@@ -1256,9 +1266,25 @@ static char *parse_str(char **val)
 		s->field = _f(val);		\
 		goto cleanup;			\
 	}
+#define PARSE_LINE_ARRAY(s, name, val, field, field_len, _f)		\
+	do {								\
+		int idx;						\
+		if (!strcmp(name, #field_len)) {			\
+			s->field_len = parse_int(val);			\
+			s->field = calloc(s->field_len,			\
+					  sizeof(*s->field));		\
+			goto cleanup;					\
+		} else if (sscanf(name, #field "[%u]", &idx) == 1 &&	\
+			   idx < s->field_len) {			\
+			s->field[idx] = _f(val);			\
+			goto cleanup;					\
+		}							\
+	} while (0)
 #define PARSE_INT(s, name, val, field) PARSE_LINE(s, name, &val, field, parse_int)
 #define PARSE_UL(s, name, val, field)  PARSE_LINE(s, name, &val, field, parse_ul)
 #define PARSE_STR(s, name, val, field) PARSE_LINE(s, name, &val, field, parse_str)
+#define PARSE_STR_ARRAY(s, name, val, field, field_len) \
+	PARSE_LINE_ARRAY(s, name, &val, field, field_len, parse_str)
 bool read_settings_from_file(struct settings *settings, FILE *f)
 {
 	char *name = NULL, *val = NULL;
@@ -1311,9 +1337,11 @@ cleanup:
 
 	return true;
 }
+#undef PARSE_STR_ARRAY
 #undef PARSE_STR
 #undef PARSE_UL
 #undef PARSE_INT
+#undef PARSE_LINE_ARRAY
 #undef PARSE_LINE
 
 /**
-- 
2.48.0

