Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A8BE77170
	for <igt-dev@archiver.kernel.org>; Wed,  4 Dec 2024 16:24:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEEAB10E4E9;
	Wed,  4 Dec 2024 16:24:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KvIM7EX6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D6310E4E9
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Dec 2024 16:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733329484; x=1764865484;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6WHOkM05dTG443m729yh7kLcAR+ZHWHrP7WTvG1VmNo=;
 b=KvIM7EX6L14EwKf4vzIPymnIuViFAgHKL519YOVoT7mv+E01+IZ6ysIF
 8/A44sdpjgYWMDpkFCbB1eAm+zWx5Z+yYM9edg1di5wfnfIIb3kYLBzea
 4J7v1wGEt3gOwYiCFuwD2bz9dfE1M4AVDrv5oJtuc5AtR/ZHQNb9Qx/6a
 zCRuTuy+SM8uEFHax9jBzuGverH434dt7G5a6vwXIy3DXCHDi0EgFRpya
 xjxYh4YBkCnv8d23fIGmb9lo1FGg2QlmqfR8BbgPCleUju1k4hRT4LDHl
 6SnYv7ZcMsekSwdyn+utZq+QTM7X1ktKMLWZcstawvkkmdU0LetbMTNJ5 g==;
X-CSE-ConnectionGUID: ZZ9xpQZoQXWmNwvygZpKWw==
X-CSE-MsgGUID: V3Ndol0LT+Kd51ghFJ4Shw==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33350490"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="33350490"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 08:24:44 -0800
X-CSE-ConnectionGUID: zl3Ot1KzQZipwNyrjL3/cw==
X-CSE-MsgGUID: V5TxUWWORx+9SvTMGsDHCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="94643975"
Received: from spottumu-desk.iind.intel.com ([10.145.152.200])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 08:24:43 -0800
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com,
	sai.teja.pottumuttu@intel.com
Subject: [PATCH i-g-t 1/1] tests/intel/xe_oa: Add test for different OA buffer
 sizes
Date: Wed,  4 Dec 2024 21:46:06 +0530
Message-Id: <20241204161606.363295-2-sai.teja.pottumuttu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241204161606.363295-1-sai.teja.pottumuttu@intel.com>
References: <20241204161606.363295-1-sai.teja.pottumuttu@intel.com>
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

Add a new test oa-buffer-size to test different OA buffer sizes, its
allocation and overflow scenarios. The test uses the new property
DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE to be able to vary the OA buffer
sizes.

Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
---
 include/drm-uapi/xe_drm.h |  8 +++++
 tests/intel/xe_oa.c       | 71 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 56163eb91..6d3ea045f 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -1486,6 +1486,7 @@ struct drm_xe_oa_unit {
 	__u64 capabilities;
 #define DRM_XE_OA_CAPS_BASE		(1 << 0)
 #define DRM_XE_OA_CAPS_SYNCS		(1 << 1)
+#define DRM_XE_OA_CAPS_OA_BUFFER_SIZE	(1 << 2)
 
 	/** @oa_timestamp_freq: OA timestamp freq */
 	__u64 oa_timestamp_freq;
@@ -1651,6 +1652,13 @@ enum drm_xe_oa_property_id {
 	 * to the VM bind case.
 	 */
 	DRM_XE_OA_PROPERTY_SYNCS,
+
+	/**
+	 * @DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE: Specifies the size of OA buffer
+	 * allocated by the driver in bytes. The default size would be 16MB and the
+	 * supported sizes are powers of 2 from 128KB to 128MB.
+	 */
+	DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE,
 };
 
 /**
diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 40f5d3607..abe0d2cc3 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2504,6 +2504,60 @@ again_1:
 	__perf_close(stream_fd);
 }
 
+/**
+ * SUBTEST: oa-buffer-size
+ * Description: Test OA buffer allocation and overflow with different OA buffer sizes.
+ */
+static void test_oa_buffer_size(size_t oa_buffer_size)
+{
+	int oa_exponent = max_oa_exponent_for_period_lte(20000);
+	uint64_t properties[] = {
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+
+		/* Include OA reports in samples */
+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
+
+		/* OA unit configuration */
+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
+
+		DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE, oa_buffer_size
+	};
+	struct intel_xe_oa_open_prop param = {
+		.num_properties = ARRAY_SIZE(properties) / 2,
+		.properties_ptr = to_user_pointer(properties),
+	};
+	uint32_t buf_size = 2 * oa_buffer_size;
+	uint8_t *buf = malloc(buf_size);
+	struct drm_xe_oa_stream_info info;
+	uint32_t total_len = 0;
+	int len;
+	u32 oa_status;
+
+	igt_assert(buf);
+
+	stream_fd = __perf_open(drm_fd, &param, true);
+
+	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_INFO, &info);
+	igt_assert_eq(oa_buffer_size, info.oa_buf_size);
+
+	while (total_len < buf_size &&
+	       ((len = read(stream_fd, &buf[total_len], buf_size - total_len)) > 0 ||
+		(len == -1 && (errno == EINTR || errno == EIO)))) {
+		if (errno == EIO) {
+			oa_status = get_stream_status(stream_fd);
+			igt_debug("oa_status %#x\n", oa_status);
+			igt_assert(!(oa_status & DRM_XE_OASTATUS_BUFFER_OVERFLOW));
+		}
+		if (len > 0)
+			total_len += len;
+	}
+
+	 __perf_close(stream_fd);
+	free(buf);
+}
+
 /**
  * SUBTEST: non-zero-reason
  * Description: Test reason field is non-zero. Can also check OA buffer wraparound issues
@@ -4870,6 +4924,23 @@ igt_main
 	igt_subtest_with_dynamic("buffer-fill")
 		__for_one_hwe_in_oag(hwe)
 			test_buffer_fill(hwe);
+	igt_subtest_group {
+		igt_fixture {
+			struct drm_xe_query_oa_units *qoa = xe_oa_units(drm_fd);
+			struct drm_xe_oa_unit *oau = (struct drm_xe_oa_unit *)&qoa->oa_units[0];
+
+			igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
+		}
+
+		igt_subtest_with_dynamic("oa-buffer-size") {
+			igt_dynamic_f("8MB")
+				test_oa_buffer_size(SZ_8M);
+			igt_dynamic_f("32MB")
+				test_oa_buffer_size(SZ_32M);
+			igt_dynamic("128MB")
+				test_oa_buffer_size(SZ_128M);
+		}
+	}
 
 	igt_subtest_with_dynamic("non-zero-reason") {
 		__for_one_hwe_in_oag(hwe)
-- 
2.34.1

