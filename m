Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2707C3DA41
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jul 2024 22:00:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B470810E248;
	Wed, 10 Jul 2024 22:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PPNrWK7l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA10410E248
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jul 2024 22:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720648858; x=1752184858;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vfNVBcQGiNhxaCX9CVDLR8ygyNEU5YEwh5lDXkjurFY=;
 b=PPNrWK7l3pZw373GCbPhFRvUXnqO+7fq1N+8ObQprkIICKq9Vvq62Vfh
 ncengZ4Btzmtoc6000mZwEfmU8hEzQl9gpztJbBkgNESFU1xfmx03EvA9
 lrLZ2R1n+iT8ElEfENmXtNQ90CDzzHuDQ+D1HwN5JfcxwTaeRKiazViyL
 1oWYXh/YNs6zPGTsoeRpC0Nt9uHeigo2GVtdRng8FkLJKXKQKB1PRCfvp
 0AcFOrhRSMly75hJO4xrdmOPzjYFIX3zmTtwMa247asQ6hNrsaF11AY2s
 8cH6y6xguDG+OlhMm3yDJzPPSBhamZ7o0m2C8twHUFWQvMW4EYNyvblUr w==;
X-CSE-ConnectionGUID: pXkdjRfqSC2cBFgHfPDbCw==
X-CSE-MsgGUID: EFQ+W/aUSiyE3029mQ9O0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="28666600"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="28666600"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 15:00:57 -0700
X-CSE-ConnectionGUID: ycULOHyWS+m/uVmU361rpQ==
X-CSE-MsgGUID: rus7aKfxSgiT+zelAHj6rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="48103880"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 15:00:57 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/xe_query: Sanity check EU width
Date: Wed, 10 Jul 2024 14:59:56 -0700
Message-ID: <20240710220050.2169596-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add a sanity check for kernel returning the expected EU width in the
topology query.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---

This depends on patch series to be submitted to the kernel. The local
defines are done to be able to test, but should be replaced by an update
to the uapi headers.

 tests/intel/xe_query.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 92f82f6ee..361c30492 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -20,6 +20,8 @@
 #include "xe/xe_query.h"
 #include "intel_hwconfig_types.h"
 
+#define LOCAL_DRM_XE_TOPO_SIMD16_EU_PER_DSS	5
+
 void dump_hex(void *buffer, int len);
 void dump_hex_debug(void *buffer, int len);
 const char *get_hwconfig_name(int param);
@@ -168,6 +170,7 @@ const char *get_topo_name(int value)
 	case DRM_XE_TOPO_DSS_COMPUTE: return "DSS_COMPUTE";
 	case DRM_XE_TOPO_EU_PER_DSS: return "EU_PER_DSS";
 	case DRM_XE_TOPO_L3_BANK: return "L3_BANK";
+	case LOCAL_DRM_XE_TOPO_SIMD16_EU_PER_DSS: return "SIMD16_EU_PER_DSS";
 	}
 	return "??";
 }
@@ -354,6 +357,7 @@ test_query_gt_list(int fd)
 static void
 test_query_gt_topology(int fd)
 {
+	uint16_t dev_id = intel_get_drm_devid(fd);
 	struct drm_xe_query_topology_mask *topology;
 	int pos = 0;
 	struct drm_xe_device_query query = {
@@ -362,6 +366,7 @@ test_query_gt_topology(int fd)
 		.size = 0,
 		.data = 0,
 	};
+	uint32_t topo_types = 0;
 
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 	igt_assert_neq(query.size, 0);
@@ -378,15 +383,28 @@ test_query_gt_topology(int fd)
 	while (query.size >= sizeof(struct drm_xe_query_topology_mask)) {
 		struct drm_xe_query_topology_mask *topo = (struct drm_xe_query_topology_mask*)((unsigned char*)topology + pos);
 		int sz = sizeof(struct drm_xe_query_topology_mask) + topo->num_bytes;
+
 		igt_info(" gt_id: %2d type: %-12s (%d) n:%d [%d] ", topo->gt_id,
 			 get_topo_name(topo->type), topo->type, topo->num_bytes, sz);
+
 		for (int j=0; j< topo->num_bytes; j++)
 			igt_info(" %02x", topo->mask[j]);
+
+		topo_types = 1 << topo->type;
 		igt_info("\n");
 		query.size -= sz;
 		pos += sz;
 	}
 
+	/* sanity check EU type */
+	if (IS_PONTEVECCHIO(dev_id) || AT_LEAST_GEN(dev_id, 20)) {
+		igt_assert(topo_types & (1 << LOCAL_DRM_XE_TOPO_SIMD16_EU_PER_DSS));
+		igt_assert_eq(topo_types & (1 << DRM_XE_TOPO_EU_PER_DSS), 0);
+	} else {
+		igt_assert(topo_types & (1 << DRM_XE_TOPO_EU_PER_DSS));
+		igt_assert_eq(topo_types & (1 << LOCAL_DRM_XE_TOPO_SIMD16_EU_PER_DSS), 0);
+	}
+
 	free(topology);
 }
 
-- 
2.43.0

