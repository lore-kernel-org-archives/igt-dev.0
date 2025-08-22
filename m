Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80EFCA0EEB
	for <igt-dev@archiver.kernel.org>; Fri, 22 Aug 2025 06:55:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C8310E06D;
	Fri, 22 Aug 2025 06:55:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fJVEfcsr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA6410E06D
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Aug 2025 06:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755845714; x=1787381714;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xDLb3MtwZFEGTgYZjTCVEi1aysE+4mrVz080eqDE4KM=;
 b=fJVEfcsrLhADJm+a6nrNIdO9cJgV6eGVNp0GQEMy59a5T3n4tiEKQcaG
 0bASSFsY8th3rFXyll9jJPXVKA0guE8OezRKIQ5DJlf/5At4VzQYCUVFG
 B46Caa7h94qodXo3iH4U0y4ty50W95Ck1XLCrHc1KTaXTqhQPSD/adgq3
 kmuI9QIMpP1iHSigsA2z8AGxic+sL8Mk7nksAro/7CXYDHT8fOMRdfODU
 fsytjRBZTlPYxlQkdLVsREwbsypelSFpngLZz6mmlGgJAgcBhNan/vEg+
 9aSFfCfGA3rMuJKUmeu7ziHYOpab/4xRo0JV+mKPacqhmaC9gicIYwIbL w==;
X-CSE-ConnectionGUID: ZzWJ3czFTcCW0HqGMw8w0A==
X-CSE-MsgGUID: Ix0GOgviQQiqrYMNjMQ3lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="61794428"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="61794428"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 23:55:14 -0700
X-CSE-ConnectionGUID: 8SIGYafxRy+J6Lc64mxFJg==
X-CSE-MsgGUID: 2eZCjumMQ6+vUS1L0rdiZQ==
X-ExtLoop1: 1
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa003.fm.intel.com with ESMTP; 21 Aug 2025 23:55:11 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH i-g-t] tests/kms_atomic: Read the error msg on atomic_ioctl
 failure
Date: Fri, 22 Aug 2025 12:25:35 +0530
Message-Id: <20250822065535.213451-1-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
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
 tests/kms_atomic.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 474df3fa4..c335c8999 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -996,13 +996,17 @@ static void crtc_invalid_params_fence(data_t *data, igt_output_t *output)
 static void atomic_invalid_params(data_t *data, igt_output_t *output)
 {
 	struct drm_mode_atomic ioc;
+	struct drm_mode_atomic_err_code *err_code;
 	uint32_t obj_raw[16]; /* array of objects (sized by count_objs) */
 	uint32_t num_props_raw[16]; /* array of num props per obj (ditto) */
 	uint32_t props_raw[256]; /* array of props (sum of count_props) */
 	uint64_t values_raw[256]; /* array of values for properties (ditto) */
 	int i;
 
+	err_code = malloc(sizeof(struct drm_mode_atomic_err_code));
+	memset(err_code, 0, sizeof(struct drm_mode_atomic_err_code));
 	memset(&ioc, 0, sizeof(ioc));
+	ioc.reserved = (uintptr_t)err_code;
 
 	/* An empty request should do nothing. */
 	do_ioctl(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
@@ -1027,10 +1031,12 @@ static void atomic_invalid_params(data_t *data, igt_output_t *output)
 	/* Valid noop, but with event set should fail. */
 	ioc.flags = DRM_MODE_PAGE_FLIP_EVENT;
 	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EINVAL);
+	igt_assert_eq(err_code->failure_flags, DRM_MODE_ATOMIC_CAP_NOT_ENABLED);
 
 	/* Nonsense flags. */
 	ioc.flags = 0xdeadbeef;
 	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EINVAL);
+	igt_assert_eq(err_code->failure_flags, DRM_MODE_ATOMIC_INVALID_FLAG);
 
 	ioc.flags = 0;
 	/* Safety check that flags is reset properly. */
-- 
2.25.1

