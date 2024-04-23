Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645C3C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 23:44:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C37113773;
	Tue, 23 Apr 2024 23:44:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mV2vb7qB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D837510F32D
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 23:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713915829; x=1745451829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zXO7NTwZX8pELy6zgWSH5mcEAh3bic8sf7chQEKxHe0=;
 b=mV2vb7qBor1Eq5jyiL5avH1Yh+fS+4jubFae44nlrBYpDF/7SudKgxUm
 LzyruuHPMPJpVOrw2D/vnsX2sFLHjhQMCjyqtlb/xZthQ447CqVh/qY8i
 JJ2QV+/yLvoJ9+QZtBWknl+3+jZzVa4g+kGYs9KqDhw+KkYHQZNXqWAET
 isRtvJgKvM+ynvYmmVwZiKpdisfswh+QsaSKuSrx/ols9J1EwK+gWsiZN
 M+wUNvCeTCel0caFqRRVEmjlDt/L8+02dskK6iFzjUN6JpGQx10Jqe8Lc
 1NtAqLRL7ofRhEegq/00TK2K5MDlkDpdkxfkZL6kIjHJSd+64KPFxM5HY g==;
X-CSE-ConnectionGUID: GXVhBIf+TamakRqlOn+apg==
X-CSE-MsgGUID: MoHe2QwUR6ifwRKw2/S0WQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="13361994"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="13361994"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:48 -0700
X-CSE-ConnectionGUID: F6X+6DN0RoSILjNNe0eNng==
X-CSE-MsgGUID: 8ekQ4x6tQi+Nn/SRSTeCAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29180913"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:48 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 07/21] lib/igt_drm_fdinfo: Extract ignore_space()
Date: Tue, 23 Apr 2024 16:44:17 -0700
Message-ID: <20240423234431.1959354-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240423234431.1959354-1-lucas.demarchi@intel.com>
References: <20240423234431.1959354-1-lucas.demarchi@intel.com>
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

Extract ignore_space() to be used in other places.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_fdinfo.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index cab677df2..b3f6fc35a 100644
--- a/lib/igt_drm_fdinfo.c
+++ b/lib/igt_drm_fdinfo.c
@@ -53,6 +53,14 @@ static size_t read_fdinfo(char *buf, const size_t sz, int at, const char *name)
 	return count > 0 ? count : 0;
 }
 
+static const char *ignore_space(const char *s)
+{
+	for (; *s && isspace(*s); s++)
+		;
+
+	return s;
+}
+
 static int parse_engine(char *line, struct drm_client_fdinfo *info,
 			size_t prefix_len,
 			const char **name_map, unsigned int map_entries,
@@ -115,8 +123,8 @@ static const char *find_kv(const char *buf, const char *key, size_t keylen)
 	if (*p != ':')
 		return NULL;
 
-	for (p++; *p && isspace(*p); p++)
-		;
+	p++;
+	p = ignore_space(p);
 
 	return *p ? p : NULL;
 }
-- 
2.43.0

