Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B524B606A886
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 09:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l/Ob7C8K
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6017410EE0A;
	Mon, 16 Nov 2026 09:23:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF8610E296
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 09:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794820919; x=1826356919;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tPhJhbVERTPbSzw41v9mq1/b2F2C9E9j7AS1swqH7d0=;
 b=l/Ob7C8KtLUfsQXSS01T64nl1pZk2f4KlUVz7ncv6rnwHtiaoM7Rpx4L
 yrmCDsTo2lz/48pwo7AvUAkV4Dz+V7FLqoCjGjjY9rxl+FkEjM6O9ZAqH
 bbHM6gPVqteGJQGqV90Gqun9SKI1/AB1QpWS769+58G76cGyTMo4TReu6
 F+cqGZWoLfTV6oaN87/oBsVwrQjef+aQuSGTQ/Zd9Q8m+nXaTHMhmI6Iy
 1XiHSbizVjcEx+3xWRT42lxl8vBSvze79axJaF7lF4+Q0SBCL3pD4m35W
 rlSUvBojwz/xplVZt11rnOgBOUnj9l39v/9bvNzZKhvMLh0o/P8KlrjOc A==;
X-CSE-ConnectionGUID: 937mx7EzThumVq4PyhvgUw==
X-CSE-MsgGUID: 2lwGTTaVTWqG8tBMA/zOQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3588155"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3588155"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:21:59 -0800
X-CSE-ConnectionGUID: mdI+gJKzTdOCWRxap2LDFQ==
X-CSE-MsgGUID: RiJ4TRB5Q7yydIqKTeeRoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9660255"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:21:58 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ankit.k.nautiyal@intel.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t 1/2] tests/kms_setmode: Fix previous crtc mode lookup in
 joiner check
Date: Mon, 16 Nov 2026 14:48:31 +0530
Message-ID: <20261116091832.1312335-1-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

crtc points to crtcs[i], so crtc[i - 1] is crtcs[2 * i - 1] rather than
the previous crtc. For i > 1 the joiner check looks at the wrong mode,
or past the configured crtcs, when deciding whether the previous crtc
needs a consecutive pipe.

Use crtcs[i - 1] as is already done for the crtc index and connector
of the previous crtc.

Fixes: df584c804e3a ("tests/kms_setmode: Fix the corner case in handling 5k+ modes")
Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_setmode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index a65ea8b23..702261581 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -817,7 +817,7 @@ static void test_one_combination(const struct test_config *tconf,
 			     ((crtc->crtc_idx >= (tconf->resources->count_crtcs - 1)) ||
 			      ((i < (crtc_count - 1)) && (abs(crtcs[i + 1].crtc_idx - crtc->crtc_idx) <= 1)))) ||
 			    ((i > 0) && (igt_check_force_joiner_status(drm_fd, prev_conn_name) ||
-					 igt_bigjoiner_possible(drm_fd, &crtc[i - 1].mode, max_dotclock)) &&
+					 igt_bigjoiner_possible(drm_fd, &crtcs[i - 1].mode, max_dotclock)) &&
 			     (abs(crtc->crtc_idx - crtcs[i - 1].crtc_idx) <= 1))) {
 				igt_info("Combo: %s is not possible with selected mode(s).\n", test_name);
 				goto out;
-- 
2.43.0

