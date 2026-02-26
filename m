Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8838FC590F
	for <igt-dev@archiver.kernel.org>; Thu, 26 Feb 2026 08:32:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71FA710E864;
	Thu, 26 Feb 2026 08:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n/aC+78/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD7310E863
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Feb 2026 08:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772094719; x=1803630719;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z70JUTURl9vRTnsLKLhvYUH5+M9itK0jGAKyCKjqR2c=;
 b=n/aC+78/3GT7CA4gs7SeWHQPB2Od8ct+TD9IcoyHs8B+heqQYB5gGS5U
 Z2xxE6FzWooDwbJTQl0ZHTeIYt5MBxPvIfMrQgnrXFjMZellApT6hrltI
 /NFhCQGPB4cJPbp76YoCay5NNKHgLCNXvXUBkI7nwDoLApZD5+ALp0wOo
 MEPCPX3+M62GDN/VU8FPR8aKTrelKC2LugxlYrEsHbA1UGdV0S0DodVSq
 5xltC2p5/D9Qb5PBwMofNxd5igqJUIeQLJVkxtNGRzB48625eVvfRpj+V
 mgGAmbMF7JkZxQqicyopCgYu0ALlpuw1CL6n1qyaF96RF7TGUCQi0mxWJ w==;
X-CSE-ConnectionGUID: bNe69UuwTBOvVNvxz3E4ZQ==
X-CSE-MsgGUID: K6mY3/kFTcuwfVVdOzUxoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="72849673"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="72849673"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 00:31:58 -0800
X-CSE-ConnectionGUID: GehJSNLRTKu4oivFBF/Wrg==
X-CSE-MsgGUID: 1pohnfwKRfO6NcFKn5Nusw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="214740022"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by fmviesa007.fm.intel.com with ESMTP; 26 Feb 2026 00:31:51 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t v7 5/6] tests/kms_flip: staticize & remove unused global
 vars
Date: Thu, 26 Feb 2026 09:31:14 +0100
Message-ID: <20260226083115.1747856-6-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260226083115.1747856-1-michal.grzelak@intel.com>
References: <20260226083115.1747856-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Global variables devid, fb_ptr and test_time are never used. Remove
them. Staticize leftover global vars.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/kms_flip.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index ae38096aa..f17d027cc 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -274,19 +274,15 @@ static bool all_crtcs = false;
 static bool all_conns = false;
 static bool all_pairs = false;
 
-drmModeRes *resources;
-int drm_fd;
+static drmModeRes *resources;
+static int drm_fd;
 static struct buf_ops *bops;
-uint32_t devid;
-int test_time = 3;
 static bool monotonic_timestamp;
 static pthread_t vblank_wait_thread;
 static int max_dotclock;
 
 static drmModeConnector *last_connector;
 
-uint32_t *fb_ptr;
-
 static igt_display_t display;
 
 struct type_name {
-- 
2.45.2

