Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54581CAC5AE
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 19:55:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02CCD10E7CB;
	Wed, 24 Sep 2025 19:55:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O1x3Vk6z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D2B10E7CB
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 19:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758743712; x=1790279712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3LY9iF1ozHjnP5Fql6h/F3UlaoYthvb/hGRXkYuyKjs=;
 b=O1x3Vk6zmtYUwWaWaCK1ij5E+jJN4j7qgKrk2JpDW2UKn2SYn7vNKbQW
 RfqfN0s3m6SIwAY7g+AxopA3pDLR9GOx3g0dAJoJXxPBbz1wi2uHg8FrJ
 pdq5aChQQUCi7ZghMeMN4R6tAK/WK2WsrC8tEB1leZTUaF2cvpSCH3Utf
 TLhn1c6IglWMoNXCU91s5Ps1dJYeVoKJWUeAi2Y+YChW/CiDTDrPVrDA9
 Tcn/2G1uRX5HI64WzDLvDIgW6GBMTRBDPPr6PJ/aDTrIk1W9EOz1SyTSX
 ODYtLkUirmHGtm+WfbK9T9le9/kPXEYK6/CJUy5pxQwqEcfl1HqcVyMYT g==;
X-CSE-ConnectionGUID: APZgecrdRhqegWBV1rmelg==
X-CSE-MsgGUID: cXCiDaruSKC15OPsr/Kvqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="72407810"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="72407810"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 12:55:12 -0700
X-CSE-ConnectionGUID: hr/LSBlBSMedOAvn1W1sog==
X-CSE-MsgGUID: Mxsul9/ETe+GgUJN0+sn3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="181506615"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.22])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 12:55:10 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v7 2/2] HAX DO_NOT_MERGE: runner/settings: set default
 ratio to 256KB/s
Date: Wed, 24 Sep 2025 21:54:53 +0200
Message-ID: <20250924195453.92680-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924195453.92680-1-kamil.konieczny@linux.intel.com>
References: <20250924195453.92680-1-kamil.konieczny@linux.intel.com>
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

This is for only for testing a change in CI.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/settings.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/runner/settings.c b/runner/settings.c
index 7b0f8ad51..3b7f99bbe 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -91,7 +91,7 @@ static const char settings_filename[] = "metadata.txt";
 static const char env_filename[] = "environment.txt";
 static const char hooks_filename[] = "hooks.txt";
 
-static const ssize_t default_opt_dmsg_ratio_limit = -1;
+static const ssize_t default_opt_dmsg_ratio_limit = 256 * 1024;
 
 static bool set_log_level(struct settings* settings, const char *level)
 {
-- 
2.51.0

