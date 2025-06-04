Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50825C5B543
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 18:19:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C9810E782;
	Wed,  4 Jun 2025 18:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TJKNVjAj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F1A10E782
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 18:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749061139; x=1780597139;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=za+0IbzT9mzWfA1pRerdliCT9DF8/Z8CLkeLxwsfd9g=;
 b=TJKNVjAjm/jC5is1ziEJVNPjJq5b+VpFyKarEaUGabEhmrd+hdbWItVh
 GVLgSk0Us+4kEYns7cePg09o8Q8iO52qVkwmChl2RqKAbMQQFi2SD+LwS
 K2Xkk3mvWMU6kgw/L2E0dt/rYGt00Di7/qbVJECSVVfHVtU5/Bn6qyb+J
 fnQGWyAWG+z1GF0YSVm8G3PlpBWS9eqaHCXrBYwCuPSFoAON0FFPQNP0k
 XI9fmZsI04Vwg5rPVll92xEyAzd2kp+pePF7T7Hk2z9B6upNabgrQE/7s
 EbGst+d5WazNpFLlttJAjG7Ikr3WFYGGmg2j9wekb1EeBrSiHH6jHiVcc w==;
X-CSE-ConnectionGUID: OEIP4i+QT1O5TjYcwD5E4A==
X-CSE-MsgGUID: S+1YB8p2QJ6V/eQYSppZAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51028885"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="51028885"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 11:18:58 -0700
X-CSE-ConnectionGUID: o4sdIrPcQfmkw6SiDb+4Ww==
X-CSE-MsgGUID: xgVhg+3aTmK+5h2LIYGIbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="176230413"
Received: from unerlige-desk1.jf.intel.com ([10.165.21.138])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 11:18:59 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: lucas.demarchi@intel.com,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH] tests/intel/xe_drm_fdinfo: Fix TEST_WHILE_ACTIVE flag
Date: Wed,  4 Jun 2025 11:18:28 -0700
Message-ID: <20250604181827.1502650-2-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
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

A copy paste error sneaked in the flags. Fix TEST_WHILE_ACTIVE flag.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index ad7b45b1789c..17f66f1defc1 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -73,7 +73,7 @@ IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption and engine u
 
 /* flag masks */
 #define TEST_WITH_LOAD		(1 << 0)
-#define TEST_WHILE_ACTIVE	(1 << 0)
+#define TEST_WHILE_ACTIVE	(1 << 1)
 #define TEST_ISOLATION		(1 << 2)
 #define TEST_VIRTUAL		(1 << 3)
 #define TEST_PARALLEL		(1 << 4)
-- 
2.43.0

