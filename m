Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91616FF495D
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 07:55:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F27F10E3EA;
	Mon, 30 Mar 2026 07:55:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IlTrtiz3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D43A10E3EA
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 07:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774857318; x=1806393318;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DCkKS8lqnEZiyv7Cf+8qvSscHdddkfPVHOVtxWnGsa0=;
 b=IlTrtiz3rS/I+bGL+9Jzs/q6RirqWIV8iO/RGBQOlj+9al95FDrDMF3G
 w8Oue/9ZZXobdk6mY2EfAcOl2zEFgUAsyRwbR08IfnwDmQ5SNRDpHi0Y5
 m6vmMvhZFljjDCtsSv2VPQaHTotNEHeThNBmRnU6jJFUQpzhjuNNavta6
 dL/+h+LQtA86sh9ucto1JPXdUqQcGxjm3u9MhYPo+6NjeaL1nwoo46sfm
 XFI7kZg/IzkxPfLW2mqi8ZonvlCv6tCnPiBMDfph7h1JxMxhszQECowxx
 0JEOASLP3l67QEifMFpQnwPji+JKXVF5mYmU9aCygXCN+F8lLFsR8gKOI A==;
X-CSE-ConnectionGUID: hNbktD+ITZ6cs6X3nVoEvA==
X-CSE-MsgGUID: kFJSllHYRGScAIc4f2qEtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75729072"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="75729072"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 00:55:18 -0700
X-CSE-ConnectionGUID: b4ROlK3gSkqChh5PX4v6TA==
X-CSE-MsgGUID: BIHBPV9pR8KlfelCk8BAfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="227595651"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by fmviesa004.fm.intel.com with ESMTP; 30 Mar 2026 00:55:17 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v9 5/6] tests/kms_flip: staticize & remove unused global
 vars
Date: Mon, 30 Mar 2026 09:55:07 +0200
Message-ID: <20260330075508.1003899-6-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260330075508.1003899-1-michal.grzelak@intel.com>
References: <20260330075508.1003899-1-michal.grzelak@intel.com>
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

Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/kms_flip.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 3b3d2d40aa..1a0517bcef 100755
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

