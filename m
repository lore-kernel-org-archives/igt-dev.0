Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D1EEFCD6F
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 09:25:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E918B10E4B6;
	Mon,  9 Mar 2026 09:25:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VtRc07+Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEBA510E4B6
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 09:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773048347; x=1804584347;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z70JUTURl9vRTnsLKLhvYUH5+M9itK0jGAKyCKjqR2c=;
 b=VtRc07+Qs6GoyPjQZhO6qQSMzfPvu4xhRUPuCVMB24EfDMUF8AFSdB2U
 BSgMFAvi4RbQE9YwhQCiLIWu2LK3pZhXgEPasUIn7apOkT23L17nh1s4P
 G1S6HDyRSu+VdZ94eYXKw63I9hauqhWvDgWIU8/gOFp8+163XleeI6Fth
 MmBbMfUWIcKoRGQYNO8KTI2wBdzQPg/Kkpjoz8XN/LyoFMNshDFTMnnQo
 H28QNhhDDxlfUSLzVXoFD9VAzrLGxfwr7gR0IQ3TNgWWv48Hepdf3T43g
 2ohsfcNosCOpFR/tmx3MmAAb+81+RvNLIzAdJwP2eE/mn5LvhqXdk2SAu g==;
X-CSE-ConnectionGUID: KXa+5fTJQfyyGgnJjtol5w==
X-CSE-MsgGUID: D8KZc/++T4aa2IpQTJpU6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="77918374"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="77918374"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 02:25:46 -0700
X-CSE-ConnectionGUID: IFtp1tf/T0COfinTyM17jg==
X-CSE-MsgGUID: hQAOj3eFTr6ymUeH0uC04Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="257620329"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by orviesa001.jf.intel.com with ESMTP; 09 Mar 2026 02:25:46 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t v8 5/6] tests/kms_flip: staticize & remove unused global
 vars
Date: Mon,  9 Mar 2026 10:25:27 +0100
Message-ID: <20260309092528.3336467-6-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260309092528.3336467-1-michal.grzelak@intel.com>
References: <20260309092528.3336467-1-michal.grzelak@intel.com>
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

