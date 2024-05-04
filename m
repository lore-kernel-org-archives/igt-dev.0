Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CC1C10F1A
	for <igt-dev@archiver.kernel.org>; Sat,  4 May 2024 06:46:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE358112AD7;
	Sat,  4 May 2024 06:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XrQYTqBL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527E8112AD7
 for <igt-dev@lists.freedesktop.org>; Sat,  4 May 2024 06:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714805158; x=1746341158;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zXO7NTwZX8pELy6zgWSH5mcEAh3bic8sf7chQEKxHe0=;
 b=XrQYTqBLTnhpapgvNR4iGfjiV8lzA5ukhM7O4CF3M9i2nvmR8fbT1XJY
 h/9O+f24AVvSTpl3a2L3q5G92jvUPxXa0Fk6FfC+dhWZ9BNDNjConzUZm
 zEzl9OO7s02yFHPDDyKbo4F6y7zqWsfrbFQoSYdl445a+j9IN8Wgms5w3
 oE+MTRfZOKlGptGdgJpjZfUXv01N7i+O8eL+maeS4XU3a1xPIu4hQiazu
 SAsQoT62/Bw44Obz3FNC2qoDTDfRgcwQUJF9v5dJEb0Vx/MV1wFzXn46B
 ZZKr1JnWKK6NXn1GA/bZcpFeObaehSlqBZCtKDtvyjuM/OuQYeyHUZFU6 w==;
X-CSE-ConnectionGUID: l6E4M7tzSduqmNMxazlmpQ==
X-CSE-MsgGUID: IgeeOTU9TtmLj7WY/3E+yg==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10545745"
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; d="scan'208";a="10545745"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 23:45:57 -0700
X-CSE-ConnectionGUID: IhgUlAnHTsC5XHmvJ/UdDg==
X-CSE-MsgGUID: Ol4VxXB0TUCnKRqMn/HsDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; d="scan'208";a="32169794"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 23:45:57 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 01/13] lib/igt_drm_fdinfo: Extract ignore_space()
Date: Fri,  3 May 2024 23:46:31 -0700
Message-ID: <20240504064643.25863-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240504064643.25863-1-lucas.demarchi@intel.com>
References: <20240504064643.25863-1-lucas.demarchi@intel.com>
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

