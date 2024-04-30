Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2CFC4345F
	for <igt-dev@archiver.kernel.org>; Tue, 30 Apr 2024 19:01:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A778112E6E;
	Tue, 30 Apr 2024 19:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QpUsmHvy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC3F112E6C
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Apr 2024 19:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714503688; x=1746039688;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zBjTvz7pNOpm68GZ4RHC3UXnfC2E3pOyuVFYdlInG8g=;
 b=QpUsmHvyoXuObLsmUrylnugOhD3hM6+v6KKHrqlLV5EnQZAJ4bDeI7r3
 SpLyuDLeTKOTmj+xl4JRCwscKzjHK8h82i3PY4ONVM9RWT26fucvUEgGv
 1VlRqVST74r4E/aRakUJ1+1G62qRz1KLJR1/vGtHwETE9IveoqTE9TmBd
 wc/z6aPCw3xJ1vNwdAPbeQzG+QZW8vOIOfqIdqXTBa3rX7LB5W9wzZ0sb
 2KUamR+MKzKzMcgmgbaYWI/+iW9oB01ItAjq/NJT2ZUILgc6NnwvwtxnR
 JBMfhQshICUJds/jjDBg6FOQv8QgmJBRcy9igSZxw8RYE/PIdL50ihCor g==;
X-CSE-ConnectionGUID: 7Jg96UraSMm1swA+IS6RTw==
X-CSE-MsgGUID: VM4RblXRRyexzXOPZB8nUQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="14025092"
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; d="scan'208";a="14025092"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 12:01:28 -0700
X-CSE-ConnectionGUID: 16RkVpAtTHeKTM4UuFo6xw==
X-CSE-MsgGUID: ChhGJuTdQ4OpPeXsOCbjeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; d="scan'208";a="26570791"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 12:01:28 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [CI 3/6] lib/igt_drm_fdinfo: Detect invalid drm-client-id
Date: Tue, 30 Apr 2024 12:01:47 -0700
Message-ID: <20240430190150.3654507-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240430190150.3654507-1-lucas.demarchi@intel.com>
References: <20240430190150.3654507-1-lucas.demarchi@intel.com>
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

Use strtol() for string to long conversion which allows us to detect if
there was an invalid number. It also has the advantage that it already
ignores leading spaces.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_fdinfo.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index bc3082d42..b700ec317 100644
--- a/lib/igt_drm_fdinfo.c
+++ b/lib/igt_drm_fdinfo.c
@@ -224,6 +224,7 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 	while ((l = strtok_r(_buf, "\n", &ctx))) {
 		uint64_t val = 0;
 		const char *v;
+		char *end_ptr;
 		int idx;
 
 		_buf = NULL;
@@ -233,8 +234,9 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 			good++;
 		}  else if ((v = find_kv(l, "drm-client-id",
 					 strlen("drm-client-id")))) {
-			info->id = atol(v);
-			good++;
+			info->id = strtol(v, &end_ptr, 10);
+			if (end_ptr != v)
+				good++;
 		} else if ((v = find_kv(l, "drm-pdev", strlen("drm-pdev")))) {
 			/* optional */
 			assert(strlen(v) < sizeof(info->pdev));
-- 
2.43.0

