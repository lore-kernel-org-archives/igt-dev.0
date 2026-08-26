Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF74C5DF97
	for <igt-dev@archiver.kernel.org>; Wed, 26 Aug 2026 04:43:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E1010E241;
	Wed, 26 Aug 2026 04:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DNnqGBrR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4300610E241
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Aug 2026 04:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787719336; x=1819255336;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Yoh1fKnN8/W2/1dMwGY1WfhvVkhJw1eCBlsY2fE+k+g=;
 b=DNnqGBrR1SbIhtexOv/bn4i9sT0CTV82aLh950t1GLMhiT5axlN5svki
 2yqjRy+O16aLkuvdOqI1h0HnToQSx4Z0yFGHh3Gfuzd/b1JE3vBBOkikh
 o3b7b/qyvgSc7oXSAr6nbnReIBfGscJ49ZtfxSMOt83ho+XiZmsrt4t/e
 mizt0jVnvGhCI87elPk2Aq78xK1nIK+iYxHXEHNf06JVC2ndJvrZuwcCE
 DAksEDI7udpQxsOYBst/PAiUVIUkKwGoWP/NDKuBki1jvHzGlOZXEfHiI
 KTmgK3uE0SdPuw415DalKlxEDJeRPOSj7tSim+DEMXch5KQDC7xs5gFe2 A==;
X-CSE-ConnectionGUID: 9LQ3RQlvQXa9414Ri4RBiQ==
X-CSE-MsgGUID: SHOH3xl7Qq+nqoEuIxqhtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="98867726"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="98867726"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 21:42:16 -0700
X-CSE-ConnectionGUID: TiRMy+NfT9u9H2J5Djnsvw==
X-CSE-MsgGUID: yg9xt6EFQPSn1IVnnaPWYQ==
X-ExtLoop1: 1
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 21:42:15 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH] tests/intel/xe_oa: Add test to ensure entire report has landed
Date: Tue, 25 Aug 2026 21:42:10 -0700
Message-ID: <20260826044209.1498337-2-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
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

When running the load helper with a fast oa_exponent, sometimes the OA
reports land out of order. Ensure that the kernel fix for such issues is
working by configuring all OA counters and checking validity of the full
report.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
v2:
- add a comment on event definitions
- rename report checker for clarity
- remove unnecessary spaces
- u32s in one line
- s/576/report_size
---
 tests/intel/xe_oa.c | 217 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 217 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 9ebb18690ec7..58e50bb182a6 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -336,6 +336,88 @@ static struct oa_format lnl_oa_formats[XE_OA_FORMAT_MAX] = {
 		.bc_report = 0 },
 };
 
+/*
+ * test_oa_full defines only 2 events:
+ *
+ * 3e00 is "Number of GPU (gt) clock cycles at every clock period"
+ * 7e00 is "Number of GPU (gt) clock cycles at every other clock period"
+ *
+ * TODO: Move to a common XML file
+ */
+static u32 test_oa_full[] = {
+	/* PES L0 */
+	0x13000, 0x3e00, 0x13004, 0x0000, 0x13008, 0x3e00, 0x1300c, 0x0000,
+	0x13010, 0x3e00, 0x13014, 0x0000, 0x13018, 0x3e00, 0x1301c, 0x0000,
+	0x13020, 0x3e00, 0x13024, 0x0000, 0x13028, 0x3e00, 0x1302c, 0x0000,
+	0x13030, 0x3e00, 0x13034, 0x0000, 0x13038, 0x3e00, 0x1303c, 0x0000,
+	0x13040, 0x3e00, 0x13044, 0x0000, 0x13048, 0x3e00, 0x1304c, 0x0000,
+	0x13050, 0x3e00, 0x13054, 0x0000, 0x13058, 0x3e00, 0x1305c, 0x0000,
+	0x13060, 0x3e00, 0x13064, 0x0000, 0x13068, 0x3e00, 0x1306c, 0x0000,
+	0x13070, 0x3e00, 0x13074, 0x0000, 0x13078, 0x3e00, 0x1307c, 0x0000,
+	0x13080, 0x3e00, 0x13084, 0x0000, 0x13088, 0x3e00, 0x1308c, 0x0000,
+	0x13090, 0x3e00, 0x13094, 0x0000, 0x13098, 0x3e00, 0x1309c, 0x0000,
+	0x130a0, 0x3e00, 0x130a4, 0x0000, 0x130a8, 0x3e00, 0x130ac, 0x0000,
+	0x130b0, 0x3e00, 0x130b4, 0x0000, 0x130b8, 0x3e00, 0x130bc, 0x0000,
+	0x130c0, 0x3e00, 0x130c4, 0x0000, 0x130c8, 0x3e00, 0x130cc, 0x0000,
+	0x130d0, 0x3e00, 0x130d4, 0x0000, 0x130d8, 0x3e00, 0x130dc, 0x0000,
+	0x130e0, 0x3e00, 0x130e4, 0x0000, 0x130e8, 0x3e00, 0x130ec, 0x0000,
+	0x130f0, 0x3e00, 0x130f4, 0x0000, 0x130f8, 0x3e00, 0x130fc, 0x0000,
+	/* PES L1 */
+	0x13300, 0x7e00, 0x13304, 0x0000, 0x13308, 0x7e00, 0x1330c, 0x0000,
+	0x13310, 0x7e00, 0x13314, 0x0000, 0x13318, 0x7e00, 0x1331c, 0x0000,
+	0x13320, 0x7e00, 0x13324, 0x0000, 0x13328, 0x7e00, 0x1332c, 0x0000,
+	0x13330, 0x7e00, 0x13334, 0x0000, 0x13338, 0x7e00, 0x1333c, 0x0000,
+	0x13340, 0x7e00, 0x13344, 0x0000, 0x13348, 0x7e00, 0x1334c, 0x0000,
+	0x13350, 0x7e00, 0x13354, 0x0000, 0x13358, 0x7e00, 0x1335c, 0x0000,
+	0x13360, 0x7e00, 0x13364, 0x0000, 0x13368, 0x7e00, 0x1336c, 0x0000,
+	0x13370, 0x7e00, 0x13374, 0x0000, 0x13378, 0x7e00, 0x1337c, 0x0000,
+	0x13380, 0x7e00, 0x13384, 0x0000, 0x13388, 0x7e00, 0x1338c, 0x0000,
+	0x13390, 0x7e00, 0x13394, 0x0000, 0x13398, 0x7e00, 0x1339c, 0x0000,
+	0x133a0, 0x7e00, 0x133a4, 0x0000, 0x133a8, 0x7e00, 0x133ac, 0x0000,
+	0x133b0, 0x7e00, 0x133b4, 0x0000, 0x133b8, 0x7e00, 0x133bc, 0x0000,
+	0x133c0, 0x7e00, 0x133c4, 0x0000, 0x133c8, 0x7e00, 0x133cc, 0x0000,
+	0x133d0, 0x7e00, 0x133d4, 0x0000, 0x133d8, 0x7e00, 0x133dc, 0x0000,
+	0x133e0, 0x7e00, 0x133e4, 0x0000, 0x133e8, 0x7e00, 0x133ec, 0x0000,
+	0x133f0, 0x7e00, 0x133f4, 0x0000, 0x133f8, 0x7e00, 0x133fc, 0x0000,
+	/* PES L2 */
+	0x13500, 0x7e00, 0x13504, 0x0000, 0x13508, 0x7e00, 0x1350c, 0x0000,
+	0x13510, 0x7e00, 0x13514, 0x0000, 0x13518, 0x7e00, 0x1351c, 0x0000,
+	0x13520, 0x7e00, 0x13524, 0x0000, 0x13528, 0x7e00, 0x1352c, 0x0000,
+	0x13530, 0x7e00, 0x13534, 0x0000, 0x13538, 0x7e00, 0x1353c, 0x0000,
+	0x13540, 0x7e00, 0x13544, 0x0000, 0x13548, 0x7e00, 0x1354c, 0x0000,
+	0x13550, 0x7e00, 0x13554, 0x0000, 0x13558, 0x7e00, 0x1355c, 0x0000,
+	0x13560, 0x7e00, 0x13564, 0x0000, 0x13568, 0x7e00, 0x1356c, 0x0000,
+	0x13570, 0x7e00, 0x13574, 0x0000, 0x13578, 0x7e00, 0x1357c, 0x0000,
+	0x13580, 0x7e00, 0x13584, 0x0000, 0x13588, 0x7e00, 0x1358c, 0x0000,
+	0x13590, 0x7e00, 0x13594, 0x0000, 0x13598, 0x7e00, 0x1359c, 0x0000,
+	0x135a0, 0x7e00, 0x135a4, 0x0000, 0x135a8, 0x7e00, 0x135ac, 0x0000,
+	0x135b0, 0x7e00, 0x135b4, 0x0000, 0x135b8, 0x7e00, 0x135bc, 0x0000,
+	0x135c0, 0x7e00, 0x135c4, 0x0000, 0x135c8, 0x7e00, 0x135cc, 0x0000,
+	0x135d0, 0x7e00, 0x135d4, 0x0000, 0x135d8, 0x7e00, 0x135dc, 0x0000,
+	0x135e0, 0x7e00, 0x135e4, 0x0000, 0x135e8, 0x7e00, 0x135ec, 0x0000,
+	0x135f0, 0x7e00, 0x135f4, 0x0000, 0x135f8, 0x7e00, 0x135fc, 0x0000,
+	/* PES L3 */
+	0x13700, 0x7e00, 0x13704, 0x0000, 0x13708, 0x7e00, 0x1370c, 0x0000,
+	0x13710, 0x7e00, 0x13714, 0x0000, 0x13718, 0x7e00, 0x1371c, 0x0000,
+	0x13720, 0x7e00, 0x13724, 0x0000, 0x13728, 0x7e00, 0x1372c, 0x0000,
+	0x13730, 0x7e00, 0x13734, 0x0000, 0x13738, 0x7e00, 0x1373c, 0x0000,
+	0x13740, 0x7e00, 0x13744, 0x0000, 0x13748, 0x7e00, 0x1374c, 0x0000,
+	0x13750, 0x7e00, 0x13754, 0x0000, 0x13758, 0x7e00, 0x1375c, 0x0000,
+	0x13760, 0x7e00, 0x13764, 0x0000, 0x13768, 0x7e00, 0x1376c, 0x0000,
+	0x13770, 0x7e00, 0x13774, 0x0000, 0x13778, 0x7e00, 0x1377c, 0x0000,
+	0x13780, 0x7e00, 0x13784, 0x0000, 0x13788, 0x7e00, 0x1378c, 0x0000,
+	0x13790, 0x7e00, 0x13794, 0x0000, 0x13798, 0x7e00, 0x1379c, 0x0000,
+	0x137a0, 0x7e00, 0x137a4, 0x0000, 0x137a8, 0x7e00, 0x137ac, 0x0000,
+	0x137b0, 0x7e00, 0x137b4, 0x0000, 0x137b8, 0x7e00, 0x137bc, 0x0000,
+	0x137c0, 0x7e00, 0x137c4, 0x0000, 0x137c8, 0x7e00, 0x137cc, 0x0000,
+	0x137d0, 0x7e00, 0x137d4, 0x0000, 0x137d8, 0x7e00, 0x137dc, 0x0000,
+	0x137e0, 0x7e00, 0x137e4, 0x0000, 0x137e8, 0x7e00, 0x137ec, 0x0000,
+	0x137f0, 0x7e00, 0x137f4, 0x0000, 0x137f8, 0x7e00, 0x137fc, 0x0000,
+	/* FLEX */
+	0xe458, 0x0000, 0xe45c, 0x0000, 0xe558, 0x0000, 0xe55c, 0x0000,
+	0xe658, 0x0000, 0xe65c, 0x0000, 0xe758, 0x0000,
+};
+
 static bool oa_trace = false;
 static uint32_t oa_trace_buf_mb = 1;
 static int drm_fd = -1;
@@ -3740,6 +3822,135 @@ test_whitelisted_registers_userspace_config(void)
 	xe_oa_remove_config(drm_fd, config_id);
 }
 
+static bool cachelines_non_zero(u64 *report, u32 report_size) {
+    u32 num_cachelines = report_size / 64, i;
+
+    for (i = 0; i < num_cachelines; i++) {
+        u64 *counter = &report[i * 8], or = 0, j;
+
+        for (j = 0; j < 8; j++)
+            or |= counter[j];
+
+        if (!or)
+            return false;
+    }
+
+    return true;
+}
+
+static uint64_t oa_full_config(void)
+{
+	struct drm_xe_oa_config config;
+	const char *uuid = "01234567-0123-0123-0123-0123456789ab";
+	char path[512];
+	u64 config_id;
+
+	igt_require(has_xe_oa_userspace_config(drm_fd));
+
+	snprintf(path, sizeof(path), "metrics/%s/id", uuid);
+	if (try_sysfs_read_u64(path, &config_id))
+		xe_oa_remove_config(drm_fd, config_id);
+
+	memset(&config, 0, sizeof(config));
+	memcpy(config.uuid, uuid, sizeof(config.uuid));
+
+	config.regs_ptr = to_user_pointer(test_oa_full);
+	config.n_regs = ARRAY_SIZE(test_oa_full) / 2;
+
+	return xe_oa_add_config(drm_fd, &config);
+}
+
+/**
+ * SUBTEST: non-zero-reports
+ * Description: Test that the entire report landed.
+ */
+static void
+test_non_zero_reports(const struct drm_xe_oa_unit *oau)
+{
+	/* ~20 micro second period */
+	int oa_exponent = max_oa_exponent_for_period_lte(20000);
+	u64 fmt = default_test_set->perf_oa_format;
+	u64 config_id = oa_full_config();
+	size_t report_size = get_oa_format(fmt).size;
+	u64 properties[] = {
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, config_id,
+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
+		DRM_XE_OA_PROPERTY_OA_DISABLED, true,
+	};
+	struct intel_xe_oa_open_prop param = {
+		.num_properties = ARRAY_SIZE(properties) / 2,
+		.properties_ptr = to_user_pointer(properties),
+	};
+	u32 buf_size = 2 * buffer_fill_size, total_len = 0, oa_status;
+	bool report_valid = false;
+	char msg[32];
+	int len;
+	u8 *buf;
+
+	buf = malloc(buf_size);
+	igt_assert(buf);
+
+	igt_debug("Ready to read about %u bytes\n", buffer_fill_size);
+
+	stream_fd = __perf_open(drm_fd, &param, true);
+	set_fd_flags(stream_fd, O_CLOEXEC);
+
+	load_helper_init();
+	load_helper_run(HIGH);
+
+	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
+	while (total_len < buffer_fill_size &&
+	       ((len = read(stream_fd, &buf[total_len], buffer_fill_size - total_len)) > 0 ||
+		(len == -1 && (errno == EINTR || errno == EIO)))) {
+		if (len < 0 && errno == EIO) {
+			oa_status = get_stream_status(stream_fd);
+			igt_assert(!(oa_status & DRM_XE_OASTATUS_BUFFER_OVERFLOW));
+		}
+		if (len > 0)
+			total_len += len;
+	}
+	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
+
+	/*
+	 * Since we are lagging actual hw_tail, there should always be data
+	 * after we disable. We cannot risk reading in a loop since the code
+	 * will block once we have drained all the data.
+	 */
+	len = read(stream_fd, &buf[total_len], buf_size - total_len);
+	igt_assert(len);
+	total_len += len;
+
+	__perf_close(stream_fd);
+	xe_oa_remove_config(drm_fd, config_id);
+
+	load_helper_stop();
+	load_helper_fini();
+
+	igt_debug("Read %u bytes\n", total_len);
+	igt_debug("Read %u bytes after disable\n", total_len - buffer_fill_size);
+
+	for (uint32_t offset = 0; offset < total_len; offset += report_size) {
+		const uint32_t *report = (void *)(buf + offset);
+
+		report_valid = cachelines_non_zero((u64 *)report, report_size);
+		if (report_valid)
+			continue;
+
+		if (offset)
+			dump_report(report - report_size / 4, report_size / 4, "previous");
+
+		sprintf(msg, "failed report %08lx", offset / report_size);
+		dump_report(report, report_size / 4, msg);
+		break;
+	}
+
+	free(buf);
+	igt_assert(report_valid);
+}
+
 #define OAG_OAHEADPTR (0xdb00)
 #define OAG_MMIOTRIGGER (0xdb1c)
 
@@ -5040,6 +5251,12 @@ int igt_main_args("b:td", long_options, help_str, opt_handler, NULL)
 			test_non_zero_reason(oau, SZ_128K);
 	}
 
+	igt_subtest_with_dynamic("non-zero-reports") {
+		igt_require(!igt_run_in_simulation());
+		__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
+			test_non_zero_reports(oau);
+	}
+
 	igt_subtest("non-sampling-read-error")
 		test_non_sampling_read_error();
 
-- 
2.53.0

