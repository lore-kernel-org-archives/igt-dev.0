Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5911C3DA4A
	for <igt-dev@archiver.kernel.org>; Tue, 20 Aug 2024 00:31:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 179D510E040;
	Tue, 20 Aug 2024 00:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fQ8MmKxY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7400D10E31D
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Aug 2024 00:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724113868; x=1755649868;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=6L301r16/D2uan40Ljty2Tn5CY4Fjwf5bRpyc+nZP7U=;
 b=fQ8MmKxYeJ00UHoMDwyZFFwmMPQDeuGUxH6m6dOD3+H39JBe1X0KayO8
 BHkS7w38SHXjp35klmXiUTj67hRNlqtvGUTJKWr7LgTKmvkWAjJxggpCe
 oT9mzc8n8AgCsEA3f3RfGVbZ90TcRoZKz6yMhwxbiWoteNUXZ/3WlCQdB
 ptZ9iF/rULEh1qqdqoFlcQuttUWhFBwtZb6xlpH+w0H/EjMllmRwMVnMx
 Cs01W9zvXvNm1iSdOVZIxI5DIpwiwFP6wLVrR5XwCOBKl7EPWANs5C8F+
 ShBTrwEaZxNpaZxt5OFHogztsXpuRLwwEy+5yk73P9bbk3qy7KxtWdvJw Q==;
X-CSE-ConnectionGUID: iVHKwizvTrScSDcIN4UWdw==
X-CSE-MsgGUID: tXLw5oOPTua93QUyNRvJig==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="33544870"
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="33544870"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 17:31:07 -0700
X-CSE-ConnectionGUID: V0BkKZhBQ+ycHbaBoYS0dg==
X-CSE-MsgGUID: GzVpqHFESK61/Px/anrxsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="61101267"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 17:31:07 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/2] tests/intel/oa: Add syncs-ufence test for OA syncs
Date: Mon, 19 Aug 2024 17:31:04 -0700
Message-ID: <20240820003104.1407398-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240820003104.1407398-1-ashutosh.dixit@intel.com>
References: <20240820003104.1407398-1-ashutosh.dixit@intel.com>
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

Test ufences work correctly with OA syncs in open and reconfig paths.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 103 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index bd38b24de8..c18b6bd7d1 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4547,6 +4547,105 @@ out:
 	syncobj_destroy(drm_fd, syncobj);
 }
 
+/**
+ * SUBTEST: syncs-ufence
+ * Description: Test OA ufence signal correctly
+ */
+#define USERPTR (1 << 0)
+static void
+test_syncs_ufence(const struct drm_xe_engine_class_instance *hwe, unsigned int flags)
+{
+	uint32_t vm;
+	uint64_t addr = 0x1a0000;
+#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
+	size_t bo_size;
+	uint32_t bo = 0;
+	struct {
+		uint64_t vm_sync;
+		uint64_t pad;
+		uint64_t oa_sync;
+	} *data;
+	struct drm_xe_ext_set_property extn[XE_OA_MAX_SET_PROPERTIES] = {};
+	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.timeline_value = USER_FENCE_VALUE,
+	};
+	uint64_t open_properties[] = {
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
+		DRM_XE_OA_PROPERTY_NUM_SYNCS, 1,
+		DRM_XE_OA_PROPERTY_SYNCS, to_user_pointer(&sync),
+	};
+	struct intel_xe_oa_open_prop open_param = {
+		.num_properties = ARRAY_SIZE(open_properties) / 2,
+		.properties_ptr = to_user_pointer(open_properties),
+	};
+	uint64_t config_properties[] = {
+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, 0, /* Filled later */
+		DRM_XE_OA_PROPERTY_NUM_SYNCS, 1,
+		DRM_XE_OA_PROPERTY_SYNCS, to_user_pointer(&sync),
+	};
+	struct intel_xe_oa_open_prop config_param = {
+		.num_properties = ARRAY_SIZE(config_properties) / 2,
+		.properties_ptr = to_user_pointer(config_properties),
+	};
+	uint32_t alt_config_id;
+	int ret;
+
+	vm = xe_vm_create(drm_fd, 0, 0);
+	bo_size = xe_bb_size(drm_fd, sizeof(*data));
+
+	if (flags & USERPTR) {
+		data = aligned_alloc(xe_get_default_alignment(drm_fd), bo_size);
+		igt_assert(data);
+	} else {
+		bo = xe_bo_create(drm_fd, vm, bo_size, vram_if_possible(drm_fd, hwe->gt_id),
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		data = xe_bo_map(drm_fd, bo, bo_size);
+	}
+	memset(data, 0, bo_size);
+
+	sync.addr = to_user_pointer(&data[0].vm_sync);
+	if (bo)
+		xe_vm_bind_async(drm_fd, vm, 0, bo, 0, addr, bo_size, &sync, 1);
+	else
+		xe_vm_bind_userptr_async(drm_fd, vm, 0, to_user_pointer(data), addr,
+					 bo_size, &sync, 1);
+	xe_wait_ufence(drm_fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+
+	sync.addr = to_user_pointer(&data[0].oa_sync);
+	stream_fd = __perf_open(drm_fd, &open_param, false);
+
+	xe_wait_ufence(drm_fd, &data[0].oa_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+
+	/* Change stream configuration */
+	data[0].oa_sync = 0;
+	if (!find_alt_oa_config(test_set->perf_oa_metrics_set, &alt_config_id))
+		goto out;
+
+	config_properties[1] = alt_config_id;
+	intel_xe_oa_prop_to_ext(&config_param, extn);
+
+	ret = igt_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_CONFIG, extn);
+	igt_assert_eq(ret, test_set->perf_oa_metrics_set);
+
+	xe_wait_ufence(drm_fd, &data[0].oa_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+out:
+	__perf_close(stream_fd);
+
+	if (bo) {
+		munmap(data, bo_size);
+		gem_close(drm_fd, bo);
+	} else {
+		free(data);
+	}
+	xe_vm_destroy(drm_fd, vm);
+}
+
 static const char *xe_engine_class_name(uint32_t engine_class)
 {
 	switch (engine_class) {
@@ -4806,6 +4905,10 @@ igt_main
 		igt_subtest_with_dynamic("syncs-signal")
 			__for_one_render_engine(hwe)
 				test_syncs_signal(hwe);
+
+		igt_subtest_with_dynamic("syncs-ufence")
+			__for_one_render_engine(hwe)
+				test_syncs_ufence(hwe, 0);
 	}
 
 	igt_fixture {
-- 
2.41.0

