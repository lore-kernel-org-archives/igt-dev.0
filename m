Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5381CCFA05
	for <igt-dev@archiver.kernel.org>; Fri,  7 Nov 2025 12:24:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D5410EAAD;
	Fri,  7 Nov 2025 12:24:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KCw4lLUj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB0310EAB2
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Nov 2025 12:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762518280; x=1794054280;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=nAqKlEl4enb8cyYIAbAB4c/x68WaqH1V46Qxs8iAg54=;
 b=KCw4lLUjk1zlXKKYRgWuLNo5C4Q1XeeO3BjPI6v80KxjoGIEvfHN2ee0
 terVMSs11vioQLHDcw383A6HtJMryZ4+y8yrFxb4fX0LnRue8nv+QgwH3
 ggB1tuO2K0cwpvDYfobzy4spgCKQo5iEEU7sOLpUNpYoxWf7QUI2IM5Kh
 AdwlcsU46z+thmKLE3/PkP1I9MXutBnC0yEvoC4QD7y8yovb5d1EHHIlj
 Ld93gOvYRf088nFlYj6CO7Kj//gGG8ZlIYUA/k4pX2VcWQPIRbgSTPB1U
 QWAWAEzQyngUMI2f0n53SMS3cUGwLUXMmTOn6VvBPMPwnJHz72O+R9xBZ w==;
X-CSE-ConnectionGUID: vVmEYDvBR0CdxFaAv9v+FQ==
X-CSE-MsgGUID: YiPGC3BSQ5G4P7+5Z1U+Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="64365678"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="64365678"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 04:24:39 -0800
X-CSE-ConnectionGUID: OVDqozEcTQW/pSvB6fporw==
X-CSE-MsgGUID: J/4WTpy6S6SAo34cIvG2yg==
X-ExtLoop1: 1
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 04:24:39 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 07 Nov 2025 13:23:20 +0100
Subject: [PATCH v2 7/8] tests/intel/xe_query: use xe_query helpers for
 query GT topology
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-xe_query_helpers-v2-7-ec66ba6af1c1@intel.com>
References: <20251107-xe_query_helpers-v2-0-ec66ba6af1c1@intel.com>
In-Reply-To: <20251107-xe_query_helpers-v2-0-ec66ba6af1c1@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4218;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=nAqKlEl4enb8cyYIAbAB4c/x68WaqH1V46Qxs8iAg54=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpDeS8bsopWl6bqq6v/Sr6mucwlNNzVN5e/vnbW
 D6xDoSujlSJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaQ3kvAAKCRAjYrKT3hD9
 15qOC/4jahdjvaVH2Ivtg+CGBq3hkhVflEV39bZiAi5uxWM15GovBNMj8qKwicbMCx+LQ5FiG7X
 /22uqNQkv60sQOPFgOVnNj6ZRjZ1vfn33Z6VE5uF1fYjKhNm7TsWlYSDmxjWrleo/fomxySvg/j
 vU5MG4KxZ4xQunntmk6tF/DDIpl1uTjbui34nAagbPDLliB48LEz+WJxpe0YOZRwdRhyklspl1c
 EwSFg+3ihP4nctJGfw5VcWYri33iPtnTn2RJ/qQQFF13pc8rMt3CU3ge1o/YR5gmdsyP1B3Gxlk
 m4f2LGOceOsF9V+D9B04XrQwR8nkkHGV2kf8yivsm/VCbERmGjrX+wPBRF6P1cvFgf2YOwSqt1O
 k6/pe/fbKcRguKteU+uvfwpgx9SldiMEIUmpHHv/00B1VbLpdhABo/4KES46355q3E2TaiNCdQ5
 oCkVVUJzEWkiO+fiLbW7OtDVGZsgmxtXsdVFFVegJsMnxhtC8anBMsWYdsaXvSrg74SWc=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

Using xe_query_device and xe_for_each_topology_mask simplifies the code.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 tests/intel/xe_query.c | 69 +++++++++++++-------------------------------------
 1 file changed, 17 insertions(+), 52 deletions(-)

diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 2de88fac9071a5db95ef482e59ed06fc45440dd0..b22ab71653607803a44215ac1e404fda18f81c0e 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -358,42 +358,25 @@ static void
 test_query_gt_topology(int fd)
 {
 	uint16_t dev_id = intel_get_drm_devid(fd);
-	struct drm_xe_query_topology_mask *topology;
-	int pos = 0;
-	struct drm_xe_device_query query = {
-		.extensions = 0,
-		.query = DRM_XE_DEVICE_QUERY_GT_TOPOLOGY,
-		.size = 0,
-		.data = 0,
-	};
-	uint32_t topo_types = 0;
+	struct drm_xe_query_topology_mask *topology, *topo;
+	uint32_t topo_types = 0, size;
 
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
-	igt_assert_neq(query.size, 0);
-
-	topology = malloc(query.size);
-	igt_assert(topology);
+	topology = xe_query_device(fd, DRM_XE_DEVICE_QUERY_GT_TOPOLOGY, &size, false);
 
-	query.data = to_user_pointer(topology);
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+	igt_info("size: %d\n", size);
 
-	igt_info("size: %d\n", query.size);
-	dump_hex_debug(topology, query.size);
+	dump_hex_debug(topology, size);
 
-	while (query.size >= sizeof(struct drm_xe_query_topology_mask)) {
-		struct drm_xe_query_topology_mask *topo = (struct drm_xe_query_topology_mask*)((unsigned char*)topology + pos);
-		int sz = sizeof(struct drm_xe_query_topology_mask) + topo->num_bytes;
-
-		igt_info(" gt_id: %2d type: %-12s (%d) n:%d [%d] ", topo->gt_id,
-			 get_topo_name(topo->type), topo->type, topo->num_bytes, sz);
+	xe_for_each_topology_mask(topology, size, topo) {
+		igt_info(" gt_id: %2d type: %-12s (%d) n:%d [%zd] ", topo->gt_id,
+			 get_topo_name(topo->type), topo->type, topo->num_bytes,
+			 sizeof(struct drm_xe_query_topology_mask) + topo->num_bytes);
 
 		for (int j=0; j< topo->num_bytes; j++)
 			igt_info(" %02x", topo->mask[j]);
 
 		topo_types = 1 << topo->type;
 		igt_info("\n");
-		query.size -= sz;
-		pos += sz;
 	}
 
 	/* sanity check EU type */
@@ -422,35 +405,20 @@ static void
 test_query_gt_topology_l3_bank_mask(int fd)
 {
 	uint16_t dev_id = intel_get_drm_devid(fd);
-	struct drm_xe_query_topology_mask *topology;
-	int pos = 0;
-	struct drm_xe_device_query query = {
-		.extensions = 0,
-		.query = DRM_XE_DEVICE_QUERY_GT_TOPOLOGY,
-		.size = 0,
-		.data = 0,
-	};
+	struct drm_xe_query_topology_mask *topology, *topo;
+	uint32_t size;
 
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
-	igt_assert_neq(query.size, 0);
+	topology = xe_query_device(fd, DRM_XE_DEVICE_QUERY_GT_TOPOLOGY, &size, false);
 
-	topology = malloc(query.size);
-	igt_assert(topology);
-
-	query.data = to_user_pointer(topology);
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
-
-	igt_info("size: %d\n", query.size);
-
-	while (query.size >= sizeof(struct drm_xe_query_topology_mask)) {
-		struct drm_xe_query_topology_mask *topo = (struct drm_xe_query_topology_mask *)((unsigned char *)topology + pos);
-		int sz = sizeof(struct drm_xe_query_topology_mask) + topo->num_bytes;
+	igt_info("size: %d\n", size);
 
+	xe_for_each_topology_mask(topology, size, topo) {
 		if (topo->type == DRM_XE_TOPO_L3_BANK) {
 			int count = 0;
 
-			igt_info(" gt_id: %2d type: %-12s (%d) n:%d [%d] ", topo->gt_id,
-				 get_topo_name(topo->type), topo->type, topo->num_bytes, sz);
+			igt_info(" gt_id: %2d type: %-12s (%d) n:%d [%zd] ", topo->gt_id,
+				 get_topo_name(topo->type), topo->type, topo->num_bytes,
+				 sizeof(struct drm_xe_query_topology_mask) + topo->num_bytes);
 			for (int j = 0; j < topo->num_bytes; j++)
 				igt_info(" %02x", topo->mask[j]);
 
@@ -471,9 +439,6 @@ test_query_gt_topology_l3_bank_mask(int fd)
 			else if (IS_DG2(dev_id))
 				igt_assert_eq((count % 8), 0);
 		}
-
-		query.size -= sz;
-		pos += sz;
 	}
 
 	free(topology);

-- 
2.43.0

