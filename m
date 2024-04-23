Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976C3C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 23:44:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C31D11376F;
	Tue, 23 Apr 2024 23:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RmdiCKDt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE8E111376A
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 23:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713915829; x=1745451829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t2F9bzVnOoNZ4mb2NAAHHL7JHMGICI82XLV7G3J8MYU=;
 b=RmdiCKDtrpx421+FU5j3O9fniv3tzJrRue4Guf+CLARg3ZeaMhEAY/9+
 1ZK5BcBN86Ct0Y0sdcGWQweWPNu1wY3JVnWNb4Kp8S1OT5p3mEUQWoM4A
 EWNOiAiKStQhoehy55Sp2CrLn9PeGWL+vcZQ+FKUoZW6D4NkLfFcSFYs6
 X0o3hp5lj+Ea5HBRhPbEFfKoU9AugOw1h7vZe+DVRyLrIjBK+z0nLfJnL
 klnuXYZvHLiUfXPceprUg6Wi58wGJdt9w8qlg/UaTfIqiqvPevvrPHpKg
 Ja3J3pZfHNCzSeNWfO8G7dTf4YlzQb0i2enSs0L/yDp2HsB4Q20KyY+k6 Q==;
X-CSE-ConnectionGUID: Y4WGdA+KScm0OiC6c80Ccw==
X-CSE-MsgGUID: 9wNSLh5rSZ26c5GnUtoNqg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="13361996"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="13361996"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:49 -0700
X-CSE-ConnectionGUID: SuYY3qG+QkS+PunZWwSjQQ==
X-CSE-MsgGUID: 6C9bIo/0Q7KlKYvlBWd1wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29180916"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:48 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 08/21] lib/igt_drm_fdinfo: Allow any number of spaces
 before unit
Date: Tue, 23 Apr 2024 16:44:18 -0700
Message-ID: <20240423234431.1959354-9-lucas.demarchi@intel.com>
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

When parsing memory region, allow any number of spaces between value and
unit by using ignore_space() and adjusting constness of the variables.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_fdinfo.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index b3f6fc35a..3b2778eee 100644
--- a/lib/igt_drm_fdinfo.c
+++ b/lib/igt_drm_fdinfo.c
@@ -134,7 +134,8 @@ static int parse_region(char *line, struct drm_client_fdinfo *info,
 			const char **region_map, unsigned int region_entries,
 			uint64_t *val)
 {
-	char *name, *p, *unit = NULL;
+	const char *name, *p, *unit = NULL;
+	char *end_ptr;
 	ssize_t name_len;
 	int found = -1;
 	unsigned int i;
@@ -180,9 +181,9 @@ static int parse_region(char *line, struct drm_client_fdinfo *info,
 		goto out;
 
 	p++;
-	*val = strtoull(p, &p, 10);
+	*val = strtoull(p, &end_ptr, 10);
 
-	p = index(p, ' ');
+	p = ignore_space(end_ptr);
 	if (!p)
 		goto out;
 
-- 
2.43.0

