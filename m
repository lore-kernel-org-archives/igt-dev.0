Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5FCC25B74
	for <igt-dev@archiver.kernel.org>; Sat,  4 May 2024 06:46:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB9A112AD9;
	Sat,  4 May 2024 06:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UDumPqXa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67955112AD8
 for <igt-dev@lists.freedesktop.org>; Sat,  4 May 2024 06:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714805158; x=1746341158;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t2F9bzVnOoNZ4mb2NAAHHL7JHMGICI82XLV7G3J8MYU=;
 b=UDumPqXankCC+irxccTTePUqdtkAROzmgRQnp7bTHFS5zfZpNfwhkuAh
 p3+oKzrxh5wbX+zY94YvAxRPwXyARNSbUv/lPgT+ScRsMup/SAvVw2Kj4
 kOqrlJUsQr+yePJswfEm4UA+ZpdnL6dRgyZSOnR6a3jAn0ido4vaHRSPV
 6g1xL7HwM9FeM4cOTz1josrsbiZimvL7tIi9KmSeQxAhClvQlH2KwIgoq
 WZ4HdPR/tIpDKWCr4td8kWXLfCt84dI8fNqDhWCtN7ERKitWvyBJdMQ22
 OfxMM9qvmYN3FfYTMhd4sXHavvQawC15lcwRTLgs1XGn9LzWVIiWJn4Vw A==;
X-CSE-ConnectionGUID: nZ7Enz3AQdu3UYq4hz9Cag==
X-CSE-MsgGUID: VEHpWAZVR9qwfxJ1371P/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10545747"
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; d="scan'208";a="10545747"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 23:45:57 -0700
X-CSE-ConnectionGUID: STcsU8kSR3yy46Ydd1FCIQ==
X-CSE-MsgGUID: HPd9JbxMQSKNJrDRxXI38w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; d="scan'208";a="32169797"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 23:45:57 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 02/13] lib/igt_drm_fdinfo: Allow any number of spaces
 before unit
Date: Fri,  3 May 2024 23:46:32 -0700
Message-ID: <20240504064643.25863-3-lucas.demarchi@intel.com>
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

