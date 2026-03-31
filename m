Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 214331061B21
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 10:31:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5DAC10EA17;
	Tue, 31 Mar 2026 10:31:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UIfqA4Fn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D289E10E9F5
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 10:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774953044; x=1806489044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Tn05py/HhszutD9LwE7+38MBpf1OcTY253u4vFBqkQI=;
 b=UIfqA4FnLOBYcIGCcmvuqL+49aFRRk/mTyjYva1LKWvR03Z5d97cZrSP
 ap8FG+2RXUzbUiAquzF0zqZePFHBMDiAsuX38D/yAU9PuuabdlE1Vqw8W
 sQ3JD8IO6TippA9Tf5pZXUXQYrE9WqfFu19U+hZPzYzqzkbmX3TXgq0OA
 UxgM5n7K1HlJLCqS9aZ0swhLEC9Qx0eL4iQQMEG60XdgR32RIZvgDW2PL
 scpLcLEDDzcK9YKrxohwwyQB0K288+OG8JhUNjDpps5ne2JJNm9AnH1Fl
 jqcDf5hVDTCX6zfNXiVq0/iA30FuAFoLNPP+G9UDYFnCEt0GAzLKBK/zB w==;
X-CSE-ConnectionGUID: E/EZpmSYSAijRdNjI3mkcA==
X-CSE-MsgGUID: eDOMoF9jRiuJMT/ifQ2zFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75848697"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="75848697"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 03:30:44 -0700
X-CSE-ConnectionGUID: 2nc6IBS+QLaH+6pNWyNEQA==
X-CSE-MsgGUID: FWwpTLB0S4aaHjc0/TGMSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="227935558"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa004.fm.intel.com with ESMTP; 31 Mar 2026 03:30:43 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH i-g-t 3/3] tests/kms_atomic: Read the error msg on
 atomic_ioctl failure
Date: Tue, 31 Mar 2026 15:59:23 +0530
Message-Id: <20260331102923.2782569-3-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260331102923.2782569-1-arun.r.murthy@intel.com>
References: <20260210085333.3250279-1-arun.r.murthy@intel.com>
 <20260331102923.2782569-1-arun.r.murthy@intel.com>
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

On atomic_ioctl failure compare the failure flag with the expected
invalid reason and pass if same else fail the test.

The corresponding KMD changes are pushed for review @
https://patchwork.freedesktop.org/series/152276/

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 tests/kms_atomic.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index ce5b00cd3..b28714981 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -1043,6 +1043,7 @@ static void crtc_invalid_params_fence(data_t *data, igt_output_t *output)
 static void atomic_invalid_params(data_t *data, igt_output_t *output)
 {
 	struct drm_mode_atomic ioc;
+	struct drm_mode_atomic_err_code err_code;
 	uint32_t obj_raw[16]; /* array of objects (sized by count_objs) */
 	uint32_t num_props_raw[16]; /* array of num props per obj (ditto) */
 	uint32_t props_raw[256]; /* array of props (sum of count_props) */
@@ -1050,6 +1051,7 @@ static void atomic_invalid_params(data_t *data, igt_output_t *output)
 	int i;
 
 	memset(&ioc, 0, sizeof(ioc));
+	ioc.reserved = to_user_pointer(&err_code);
 
 	/* An empty request should do nothing. */
 	do_ioctl(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
@@ -1078,14 +1080,18 @@ static void atomic_invalid_params(data_t *data, igt_output_t *output)
 	/* Nonsense flags. */
 	ioc.flags = 0xdeadbeef;
 	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EINVAL);
+	if (igt_has_drm_cap(data->drm_fd, DRM_CAP_ATOMIC_ERROR_REPORTING))
+		igt_assert_eq(err_code.failure_code, DRM_MODE_ATOMIC_INVALID_API_USAGE);
 
 	ioc.flags = 0;
 	/* Safety check that flags is reset properly. */
 	do_ioctl(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
 
 	/* Reserved/MBZ. */
-	ioc.reserved = 1;
-	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EINVAL);
+	if (!igt_has_drm_cap(data->drm_fd, DRM_CAP_ATOMIC_ERROR_REPORTING)) {
+		ioc.reserved = 1;
+		do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EINVAL);
+	}
 	ioc.reserved = 0;
 	do_ioctl(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
 
-- 
2.25.1

