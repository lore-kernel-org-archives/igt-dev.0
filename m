Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 429D8C021A8
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 23:13:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F261410EBC4;
	Fri,  7 Feb 2025 23:13:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T+SkHzTY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87AC610E334
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 23:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738969870; x=1770505870;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=5mgsKgRYFMFCCutgfxx5I1TYlrULuDK1X9awIyZLJGc=;
 b=T+SkHzTYH43/Qbnq1u0VigB4cY5AXeB3l3c2LOZOiS6iRX7ZNxYyJi7g
 2GICXFWgin8zs3BEZSPQstWlx/dZiUsJzmN1biqtWjYLDInM524IkOEEF
 fceGC/NXN2/FnbMHJiS+MuQB101lfF/ul8y3mJy2Aats1dHuseZfDUIFx
 LxOofZde9lb/wX5kgLRuydjzKF4hi4Y1Y1uYTwM70lsGQIxz8xEfE5x/k
 MFDQfWeP+RVATcVK8VQUjHQ32uYbs/PDlx6m3lbjh6n7wC0xXUuTedQp7
 VvceC/WQgA0zoIQ1nNJlXm1lmAEZvnwOqqCp64HW+I0nw51NeVTw+/x+D w==;
X-CSE-ConnectionGUID: UuywAolcTnyQlLyFEuBj8w==
X-CSE-MsgGUID: Xc7OmUQGQCWVAcbd7cTGoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="43281777"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="43281777"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 15:11:09 -0800
X-CSE-ConnectionGUID: t58JDgL9R0ijN0SrCg5r2w==
X-CSE-MsgGUID: tKzhCHCNR2COvl2K9h/SQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="111425876"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 15:11:09 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [CI i-g-t 08/10] runner/settings: Add helpers to serialize/parse array
Date: Fri,  7 Feb 2025 15:09:42 -0800
Message-ID: <20250207231039.2883195-10-lucas.demarchi@intel.com>
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

Prepare parser/serialize to handle arrays.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 runner/settings.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/runner/settings.c b/runner/settings.c
index 97b62ed36..1da005806 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -1127,6 +1127,15 @@ static ssize_t unescape_str(char *buf, size_t *n_src)
 			fputc('\n', f);		\
 		}				\
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
@@ -1223,6 +1232,7 @@ bool serialize_settings(struct settings *settings)
 	close(dirfd);
 	return true;
 }
+#undef SERIALIZE_STR_ARRAY
 #undef SERIALIZE_STR
 #undef SERIALIZE_UL
 #undef SERIALIZE_INT
@@ -1260,9 +1270,25 @@ static char *parse_str(char **val)
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
@@ -1315,9 +1341,11 @@ cleanup:
 
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
2.48.1

