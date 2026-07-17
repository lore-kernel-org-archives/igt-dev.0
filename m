Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C446C44515
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 21:02:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3871110F609;
	Fri, 17 Jul 2026 21:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PAePiJlq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14AA010F5F3
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 21:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784322035; x=1815858035;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=XY2aqbGWUNCfkxTv5MHRNUYpF0ufL1IxNTOWJS1EYdo=;
 b=PAePiJlqIPqv17gbOTQjLyPOY0GOS7VcDqkRdT3hOBM2NxXuTJ4shDr8
 kOyh09LclJiLD+hxPRwIwXlxayXvvD+AVkzDihGCLPpA0hiV9FcEd0SZL
 gOYWVHJjTg/nX5PHUlsSWgX7Qq0vtkAPkyFcBlU46gU9tSo+7UZQW3Dzd
 wucNffR58kSXfFEeRVc0Ca8rbtwBOoUJUl5RFqhxrSDmrIzF7g/B2vKME
 emNaP0H4YrgVjU+UBo7jYk6kqa4y6dBJn9yrxXVJ8EJlRybl7TQ4k4Iy/
 rZ2N61u7ErfDxk/CN4nAi2VQ3VhUbS4bEjoqvBfYl0iC1aV27t0KmmVxF Q==;
X-CSE-ConnectionGUID: M+0d36aYRzeLWcJ0L1gXNA==
X-CSE-MsgGUID: Qf91DHl9Sia2OuXhTnUZ1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="84774460"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; d="scan'208";a="84774460"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 14:00:34 -0700
X-CSE-ConnectionGUID: vNuRVAdBSaWADi4ByWJ25w==
X-CSE-MsgGUID: Nr1UY9JoQIqv01ysotRqfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; d="scan'208";a="261854705"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 14:00:33 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 2/4] tests/intel/xe_oa: Do not assume OA buffer is prefilled
 with zeroes
Date: Fri, 17 Jul 2026 14:00:30 -0700
Message-ID: <20260717210027.2008255-8-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717210027.2008255-6-umesh.nerlige.ramappa@intel.com>
References: <20260717210027.2008255-6-umesh.nerlige.ramappa@intel.com>
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

The tail address test assumes that the OA buffer is preset to zeroes. Modify
logic to be independent of this assumption.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index e7e4f5601b61..98f00d377a86 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4634,7 +4634,7 @@ static void closed_fd_and_unmapped_access(const struct drm_xe_oa_unit *oau)
  * format size is not a power of 2. This means that the last report will not be
  * broken down across the OA buffer end. Instead it will be written to the
  * beginning of the OA buffer. We will check the end of the buffer to ensure it
- * has zeroes in it.
+ * has not been written into.
  */
 static void
 test_tail_address_wrap(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
@@ -4649,6 +4649,7 @@ test_tail_address_wrap(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
 		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, exponent,
+		DRM_XE_OA_PROPERTY_OA_DISABLED, true,
 		DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE, buffer_size,
 	};
 	struct intel_xe_oa_open_prop param = {
@@ -4656,25 +4657,31 @@ test_tail_address_wrap(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
 		.properties_ptr = to_user_pointer(properties),
 	};
 	u32 fmt_size = get_oa_format(fmt).size;
-	u32 zero_size = buffer_size % fmt_size;
-	u32 *zero_area, *buffer_end, *buffer_start;
+	u32 area_size = buffer_size % fmt_size;
+	u32 *area, *buffer_end, *buffer_start;
+	u32 *content = malloc(area_size);
 
-	igt_require(zero_size);
+	igt_require(area_size);
+	igt_require(content);
 
 	stream_fd = __perf_open(drm_fd, &param, false);
 	set_fd_flags(stream_fd, O_CLOEXEC);
-
-	wait_for_oa_buffer_overflow(stream_fd, 100);
-
 	buffer_start = mmap(0, buffer_size, PROT_READ, MAP_PRIVATE, stream_fd, 0);
 	igt_assert(buffer_start);
 
-	zero_area = buffer_start + (buffer_size - zero_size) / 4;
+	area = buffer_start + (buffer_size - area_size) / 4;
 	buffer_end = buffer_start + buffer_size / 4;
 
-	dump_report(zero_area, zero_size / 4, "zero_area");
-	while (zero_area < buffer_end)
-		igt_assert_eq(*zero_area++, 0);
+	memcpy(content, area, area_size);
+	dump_report(area, area_size / 4, "contents before");
+
+	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
+	wait_for_oa_buffer_overflow(stream_fd, 100);
+	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
+
+	dump_report(area, area_size / 4, "contents after");
+	while (area < buffer_end)
+		igt_assert_eq(*area++, *content++);
 
 	munmap(buffer_start, buffer_size);
 
-- 
2.51.0

