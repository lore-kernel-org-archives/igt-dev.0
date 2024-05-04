Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37135C25B5F
	for <igt-dev@archiver.kernel.org>; Sat,  4 May 2024 06:46:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7DB112ADC;
	Sat,  4 May 2024 06:46:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ljk241cZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D20112AD5
 for <igt-dev@lists.freedesktop.org>; Sat,  4 May 2024 06:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714805158; x=1746341158;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u3Deps0WlZKWXGGKmK8fm7GtsLnJSRuwhDLhOJhKIUc=;
 b=ljk241cZj4tJLjNvWpjAvsmOpz8YdlpjZg9LOyugz1wVuhQ/2UHfhd9y
 +3pss95kFm2iJE1QvzM10/jqjHZqpEhCmRRW944oDPnlkRYggKMnYrcp+
 NdmD0IhAghaEZEZyrQrVJUmsTm+wDBMOkLb8troYXLSiKy+weiq5Y3anU
 mB0+YLvd/whtWfJftP4qk+pOAlgxWGO8Nfglo1Tshad6Fhy+oK/3sWlbx
 XM1D7AmitF6dvjUtEXxOFawxE3cPakO7A7L1bJmJDyq/Owo2mRs8Jkbl4
 bk/CLBBTw1hEYSnGbw5ocU/0yrcczUd5SenW4HsJiVjY/xS+XZ5rlfLxH A==;
X-CSE-ConnectionGUID: xpa2+cIdRoSPOEtWfaqsAA==
X-CSE-MsgGUID: Byh8au+DTPqezHvB3kGLdA==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10545749"
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; d="scan'208";a="10545749"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 23:45:57 -0700
X-CSE-ConnectionGUID: mdRWipHHTA+IZx6gtX569g==
X-CSE-MsgGUID: vcPtQHAWRauBxk256f0x2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; d="scan'208";a="32169800"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 23:45:57 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 03/13] fixup! lib/igt_drm_fdinfo: Allow any number of
 spaces before unit
Date: Fri,  3 May 2024 23:46:33 -0700
Message-ID: <20240504064643.25863-4-lucas.demarchi@intel.com>
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

---
 lib/igt_drm_fdinfo.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index 3b2778eee..3b8e79a35 100644
--- a/lib/igt_drm_fdinfo.c
+++ b/lib/igt_drm_fdinfo.c
@@ -134,8 +134,7 @@ static int parse_region(char *line, struct drm_client_fdinfo *info,
 			const char **region_map, unsigned int region_entries,
 			uint64_t *val)
 {
-	const char *name, *p, *unit = NULL;
-	char *end_ptr;
+	char *name, *p;
 	ssize_t name_len;
 	int found = -1;
 	unsigned int i;
@@ -181,18 +180,16 @@ static int parse_region(char *line, struct drm_client_fdinfo *info,
 		goto out;
 
 	p++;
-	*val = strtoull(p, &end_ptr, 10);
-
-	p = ignore_space(end_ptr);
-	if (!p)
+	*val = strtoull(p, &p, 10);
+	p = (char *)ignore_space(p);
+	if (!*p)
 		goto out;
 
-	unit = ++p;
-	if (!strcmp(unit, "KiB")) {
+	if (!strcmp(p, "KiB")) {
 		*val *= 1024;
-	} else if (!strcmp(unit, "MiB")) {
+	} else if (!strcmp(p, "MiB")) {
 		*val *= 1024 * 1024;
-	} else if (!strcmp(unit, "GiB")) {
+	} else if (!strcmp(p, "GiB")) {
 		*val *= 1024 * 1024 * 1024;
 	}
 
-- 
2.43.0

