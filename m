Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61153C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 23:43:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1802211376A;
	Tue, 23 Apr 2024 23:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bovNnPME";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C9D113767
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 23:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713915829; x=1745451829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5TFYQbONu808t9fRxDfBIsmvlGiH7vxQOhjny4I5lOg=;
 b=bovNnPMEDz2B1JpUt/JjNLm3lnNVM2UGWpwkRFeMa+3rvhq1OtFM8hLv
 HRQv/UOQ5FVU2NhziO/azT1sfvujFYOaTumNt6I5JIZBNxumfTiBU0yN0
 LdF5wEkCymctz0gpxVp4A2YOfLknyXJw5NcgjclMzuyu+Y66gssJ+U9n2
 zRKUUTPXdlkvcqpei5zUdq1krZno1T9z08KHECL/Ijekr/0mfTrfS4oEl
 umWqOn+V1/kGIBot49hum+i7rrlZOxQlDD0OnAO4vAHVoxJ+ZkR1ZtaMX
 MuPF2dkNR2XbJ/45RCWJ9uBAYLYidSPeTYK28Orluj4Bwf24cR8Luzi25 w==;
X-CSE-ConnectionGUID: +7pODczSQgy9ClM5t5UKtA==
X-CSE-MsgGUID: 5FiOBeK2RQutmsbQn14YdA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="13361984"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="13361984"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:48 -0700
X-CSE-ConnectionGUID: scXdDYEgSLqAICyguxQyYQ==
X-CSE-MsgGUID: RV7J+Py8To6NMlLQaMf2TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29180896"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:47 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 02/21] lib/igt_drm_fdinfo: Assert pdev is not
 truncated
Date: Tue, 23 Apr 2024 16:44:12 -0700
Message-ID: <20240423234431.1959354-3-lucas.demarchi@intel.com>
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

Since strncpy() may truncate the output, just assert we have enough
room for the string. It's not a big problem since we always copy 1 byte
less than the capacity and info->pdev is zero-allocated. But we may as
well be sure we aren't truncating it.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_fdinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index a1f4ad10d..bc3082d42 100644
--- a/lib/igt_drm_fdinfo.c
+++ b/lib/igt_drm_fdinfo.c
@@ -237,6 +237,7 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 			good++;
 		} else if ((v = find_kv(l, "drm-pdev", strlen("drm-pdev")))) {
 			/* optional */
+			assert(strlen(v) < sizeof(info->pdev));
 			strncpy(info->pdev, v, sizeof(info->pdev) - 1);
 		} else if (!strncmp(l, "drm-engine-capacity-", 20)) {
 			idx = parse_engine(l, info,
-- 
2.43.0

