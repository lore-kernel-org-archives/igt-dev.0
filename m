Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7218D62041
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 09:12:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FFE810E00D;
	Tue, 19 Nov 2024 09:12:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CeuZxsU9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B36C10E00D
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 09:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732007545; x=1763543545;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CRZbeEM06R6F31oCpARehtswPcE3aaLyQKoBqDvWJpc=;
 b=CeuZxsU9GbVD8armLy27MA4eGycsGS8IfeDXsMSCuFk1cnIn/638evST
 HgTnOs02gxIxuy2D8/CURGmS6aTQsVZjrOZpIBreX91zSxYDdJ8QUcav0
 t0ZIYzEqUPcss47rzgV7DqFGlk9e6U4cRW6G4xaa1+BSDL6+zx+LjNjoV
 vMlT/qlzaFJmfgGhlrZ3HmSbfCuuVnkEg5EDI45eLQpjE0h6BtiRaht8/
 dfYwPOkwDsDaQw/f7ovQ8rwZgHOT7NxK/OxVoTfrN97G2G3q1jWtxa1r9
 Zgh+YuC7FZdY8grpu3PFByZ6p+EPQiETBEBE884pvZZ2jk6M03DuBbv51 Q==;
X-CSE-ConnectionGUID: LOD4mVVORPitxKAvPnIBjg==
X-CSE-MsgGUID: zbS2CcSuQT6J1CpaxxjwZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="43063928"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="43063928"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 01:12:24 -0800
X-CSE-ConnectionGUID: K9NE0j9LSNynFF7MWD2sKQ==
X-CSE-MsgGUID: vWIN/kNLQ4yQUfArkheU0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="94430529"
Received: from spottumu-desk.iind.intel.com ([10.145.152.200])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 01:12:23 -0800
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com,
	sai.teja.pottumuttu@intel.com
Subject: [PATCH i-g-t v2 1/1] tests/intel/xe_oa: Fetch OA buffer size from
 observation IOCTL
Date: Tue, 19 Nov 2024 14:34:05 +0530
Message-Id: <20241119090405.951437-2-sai.teja.pottumuttu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241119090405.951437-1-sai.teja.pottumuttu@intel.com>
References: <20241119090405.951437-1-sai.teja.pottumuttu@intel.com>
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

Currently, the OA buffer size is hardcoded to 16MB in IGT. The patch
refactors it to get the default oa buffer size using
DRM_XE_OBSERVATION_IOCTL_INFO ioctl. This way if we decide to increase
the default OA buffer size, it wouldn't need IGT modification every time.

v2:
- Rename the oa_buffer_size global variable [Ashutosh]
- Use size_t instead of u64 [Ashutosh]

Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
---
 tests/intel/xe_oa.c | 63 +++++++++++++++++++++++++++++++--------------
 1 file changed, 43 insertions(+), 20 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 33e978a48..40f5d3607 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -63,9 +63,6 @@
 #define PIPE_CONTROL_PPGTT_WRITE	(0 << 2)
 #define PIPE_CONTROL_GLOBAL_GTT_WRITE   (1 << 2)
 
-#define MAX_OA_BUF_SIZE (16 * 1024 * 1024)
-#define OA_BUFFER_SIZE MAX_OA_BUF_SIZE
-
 #define RING_FORCE_TO_NONPRIV_ADDRESS_MASK 0x03fffffc
 /*
  * Engine specific registers defined as offsets from engine->mmio_base. For
@@ -303,6 +300,7 @@ struct drm_xe_engine_class_instance default_hwe;
 
 static struct intel_xe_perf *intel_xe_perf;
 static uint64_t oa_exp_1_millisec;
+static size_t default_oa_buffer_size;
 struct intel_mmio_data mmio_data;
 static igt_render_copyfunc_t render_copy;
 
@@ -511,6 +509,30 @@ __perf_open(int fd, struct intel_xe_oa_open_prop *param, bool prevent_pm)
 	return ret;
 }
 
+static size_t get_default_oa_buffer_size(int fd)
+{
+	struct drm_xe_oa_stream_info info;
+	uint64_t properties[] = {
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
+
+		/* OA unit configuration */
+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exp_1_millisec,
+	};
+	struct intel_xe_oa_open_prop param = {
+		.num_properties = ARRAY_SIZE(properties) / 2,
+		.properties_ptr = to_user_pointer(properties),
+	};
+
+	stream_fd = __perf_open(fd, &param, false);
+	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_INFO, &info);
+	__perf_close(stream_fd);
+
+	return info.oa_buf_size;
+}
+
 static uint64_t
 read_u64_file(const char *path)
 {
@@ -1074,6 +1096,9 @@ init_sys_info(void)
 
 	oa_exp_1_millisec = max_oa_exponent_for_period_lte(1000000);
 
+	default_oa_buffer_size = get_default_oa_buffer_size(drm_fd);
+	igt_debug("default_oa_buffer_size: %zu\n", default_oa_buffer_size);
+
 	return true;
 }
 
@@ -1263,7 +1288,7 @@ read_2_oa_reports(int format_id,
 	 * to indicate that the OA unit may be over taxed if lots of reports
 	 * are being lost.
 	 */
-	int max_reports = MAX_OA_BUF_SIZE / format_size;
+	int max_reports = default_oa_buffer_size / format_size;
 	int buf_size = format_size * max_reports * 1.5;
 	uint8_t *buf = malloc(buf_size);
 	int n = 0;
@@ -1685,7 +1710,7 @@ static void test_oa_exponents(const struct drm_xe_engine_class_instance *hwe)
 		};
 		uint64_t expected_timestamp_delta = 2ULL << exponent;
 		size_t format_size = get_oa_format(fmt).size;
-		int max_reports = MAX_OA_BUF_SIZE / format_size;
+		int max_reports = default_oa_buffer_size / format_size;
 		int buf_size = format_size * max_reports * 1.5;
 		uint8_t *buf = calloc(1, buf_size);
 		int ret, n_timer_reports = 0;
@@ -2367,8 +2392,7 @@ test_buffer_fill(const struct drm_xe_engine_class_instance *hwe)
 	int buf_size = 65536 * report_size;
 	uint8_t *buf = malloc(buf_size);
 	int len;
-	size_t oa_buf_size = MAX_OA_BUF_SIZE;
-	int n_full_oa_reports = oa_buf_size / report_size;
+	int n_full_oa_reports = default_oa_buffer_size / report_size;
 	uint64_t fill_duration = n_full_oa_reports * oa_period;
 	uint32_t *last_periodic_report = malloc(report_size);
 	u32 oa_status;
@@ -2592,8 +2616,7 @@ test_enable_disable(const struct drm_xe_engine_class_instance *hwe)
 	size_t report_size = get_oa_format(fmt).size;
 	int buf_size = 65536 * report_size;
 	uint8_t *buf = malloc(buf_size);
-	size_t oa_buf_size = MAX_OA_BUF_SIZE;
-	int n_full_oa_reports = oa_buf_size / report_size;
+	int n_full_oa_reports = default_oa_buffer_size / report_size;
 	uint64_t fill_duration = n_full_oa_reports * oa_period;
 	uint32_t *last_periodic_report = malloc(report_size);
 
@@ -4012,7 +4035,7 @@ __test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe)
 	stream_fd = __perf_open(drm_fd, &param, false);
         set_fd_flags(stream_fd, O_CLOEXEC);
 
-	buf = mmap(0, OA_BUFFER_SIZE, PROT_READ, MAP_PRIVATE, stream_fd, 0);
+	buf = mmap(0, default_oa_buffer_size, PROT_READ, MAP_PRIVATE, stream_fd, 0);
 	igt_assert(buf != NULL);
 
 	emit_oa_reg_read(ibb, dst_buf, 0, OAG_OABUFFER);
@@ -4061,7 +4084,7 @@ __test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe)
 
 	igt_assert_eq(mmio_triggered_reports, 2);
 
-	munmap(buf, OA_BUFFER_SIZE);
+	munmap(buf, default_oa_buffer_size);
 	intel_buf_close(bops, &src);
 	intel_buf_close(bops, &dst);
 	intel_buf_unmap(dst_buf);
@@ -4241,10 +4264,10 @@ test_oa_unit_concurrent_oa_buffer_read(void)
 
 static void *map_oa_buffer(u32 *size)
 {
-	void *vaddr = mmap(0, OA_BUFFER_SIZE, PROT_READ, MAP_PRIVATE, stream_fd, 0);
+	void *vaddr = mmap(0, default_oa_buffer_size, PROT_READ, MAP_PRIVATE, stream_fd, 0);
 
 	igt_assert(vaddr != NULL);
-	*size = OA_BUFFER_SIZE;
+	*size = default_oa_buffer_size;
 	return vaddr;
 }
 
@@ -4254,32 +4277,32 @@ static void invalid_param_map_oa_buffer(const struct drm_xe_engine_class_instanc
 
 	/* try a couple invalid mmaps */
 	/* bad prots */
-	oa_vaddr = mmap(0, OA_BUFFER_SIZE, PROT_WRITE, MAP_PRIVATE, stream_fd, 0);
+	oa_vaddr = mmap(0, default_oa_buffer_size, PROT_WRITE, MAP_PRIVATE, stream_fd, 0);
 	igt_assert(oa_vaddr == MAP_FAILED);
 
-	oa_vaddr = mmap(0, OA_BUFFER_SIZE, PROT_EXEC, MAP_PRIVATE, stream_fd, 0);
+	oa_vaddr = mmap(0, default_oa_buffer_size, PROT_EXEC, MAP_PRIVATE, stream_fd, 0);
 	igt_assert(oa_vaddr == MAP_FAILED);
 
 	/* bad MAPs */
-	oa_vaddr = mmap(0, OA_BUFFER_SIZE, PROT_READ, MAP_SHARED, stream_fd, 0);
+	oa_vaddr = mmap(0, default_oa_buffer_size, PROT_READ, MAP_SHARED, stream_fd, 0);
 	igt_assert(oa_vaddr == MAP_FAILED);
 
 	/* bad size */
-	oa_vaddr = mmap(0, OA_BUFFER_SIZE + 1, PROT_READ, MAP_PRIVATE, stream_fd, 0);
+	oa_vaddr = mmap(0, default_oa_buffer_size + 1, PROT_READ, MAP_PRIVATE, stream_fd, 0);
 	igt_assert(oa_vaddr == MAP_FAILED);
 
 	/* do the right thing */
-	oa_vaddr = mmap(0, OA_BUFFER_SIZE, PROT_READ, MAP_PRIVATE, stream_fd, 0);
+	oa_vaddr = mmap(0, default_oa_buffer_size, PROT_READ, MAP_PRIVATE, stream_fd, 0);
 	igt_assert(oa_vaddr != MAP_FAILED && oa_vaddr != NULL);
 
-	munmap(oa_vaddr, OA_BUFFER_SIZE);
+	munmap(oa_vaddr, default_oa_buffer_size);
 }
 
 static void unprivileged_try_to_map_oa_buffer(void)
 {
 	void *oa_vaddr;
 
-	oa_vaddr = mmap(0, OA_BUFFER_SIZE, PROT_READ, MAP_PRIVATE, stream_fd, 0);
+	oa_vaddr = mmap(0, default_oa_buffer_size, PROT_READ, MAP_PRIVATE, stream_fd, 0);
 	igt_assert(oa_vaddr == MAP_FAILED);
 	igt_assert_eq(errno, EACCES);
 }
-- 
2.34.1

