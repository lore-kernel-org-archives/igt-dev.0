Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32545C19F4F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 23:44:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74685113772;
	Tue, 23 Apr 2024 23:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y8ZsL/M9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4755113766
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 23:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713915829; x=1745451829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zBjTvz7pNOpm68GZ4RHC3UXnfC2E3pOyuVFYdlInG8g=;
 b=Y8ZsL/M9LeYABzkdCalyWXIr1+Y7P1+rekSyJt6WxQqW967zwlys9XYP
 KBLY0xxbla3Kx63A8uBiuJhXHkp09Bwpe2iS35j9U2LdFui5g5BLNw55a
 G7rb/v55nB3z7rqaLY2JsSiXZwYvCJl5WBpCqtGxqYJuQ9w+7/egmU0kS
 S4a60NBtt39waXcdaOyb8eSnh9k4U8cEiEWsUNh3a5O43JFJelbMMIZTp
 VdwY0Px5uAYtibJCOkhgEK1CK8PfVMJj/YcteRoxqURaGRlgYnVO1O+VF
 VKvWpBn5CkUMxYc+KZ/kyDyD7SkLYC335Vn0hWTKureplJC7MyR0+wPFi g==;
X-CSE-ConnectionGUID: ISTFOWYXTESTjX9nm7VCWg==
X-CSE-MsgGUID: C3EjCQUqTRGS5tZdlpKiaA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="13361986"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="13361986"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:48 -0700
X-CSE-ConnectionGUID: Hf+XXSJWSeK9Ey02ZfHUBQ==
X-CSE-MsgGUID: 9RbnFH1iSfG//EqKwzrsYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29180900"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:47 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 03/21] lib/igt_drm_fdinfo: Detect invalid
 drm-client-id
Date: Tue, 23 Apr 2024 16:44:13 -0700
Message-ID: <20240423234431.1959354-4-lucas.demarchi@intel.com>
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

