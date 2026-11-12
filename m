Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B903606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 12 Nov 2026 06:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=KJ7DtlkS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A0310E522;
	Thu, 12 Nov 2026 06:27:32 +0000 (UTC)
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B8A10EA4F
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2026 06:24:13 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id
 6AC5xFeY1344047
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2026 06:24:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=W
 3+PqrTDPl8OUIg1HGSDfmkJNKQCzxWEP2gphrUtt6g=; b=KJ7DtlkSv2+PECO70
 pP0yRW81tDcI7ZkttPMuf7hZ1r2xDhWv6UEXiQl4w9xwFvQbY5EIow9vcCK0Hmq5
 EGGDNtfAU6TLstbO/LalBvoWS8kWGCbYzRNpbNqbLmgsbL1GcqtsOEjIVvNnvHVh
 XNypyewCMy+Itndy/NL/qz1QcTsXQxXB5iXzRqeuAdRqcZ4DhDxnkpAapwwMLmvt
 EIkwDjG+xdTxuQ+rG1jlIeOeSZThC9hO2E4htY799SWbjXVtZdY5mrx1q1/TqfUd
 MkDEdYb099nR5iLJD8DTl9o0ogHgQBfWdwjwkT7sxwvN2A3iG9v2uh5OJbb1PMDY
 ZColg==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4hw484g45j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT
 key_exchange=secp384r1)
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2026 06:24:12 +0000 (GMT)
Received: from [127.0.1.1] (172.25.128.158) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 12 Nov
 2026 06:24:10 +0000
From: Brajesh Gupta <brajesh.gupta@imgtec.com>
Date: Thu, 12 Nov 2026 11:53:51 +0530
Subject: [PATCH i-g-t v3 2/2] tests/imagination: Add query Firmware
 information test
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261112-b4-fw_info-v3-2-70d20bd7bc28@imgtec.com>
References: <20261112-b4-fw_info-v3-0-70d20bd7bc28@imgtec.com>
In-Reply-To: <20261112-b4-fw_info-v3-0-70d20bd7bc28@imgtec.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Brajesh Gupta
 <brajesh.gupta@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3070;
 i=brajesh.gupta@imgtec.com; h=from:subject:message-id;
 bh=wVz7/UsVKqRrSk/cSiNaVgaQguGraljhQ74wpQtZ368=;
 b=owEBbQKS/ZANAwAKAdAmd1l+AvFwAcsmYgBq9VuGanweYK2N9Bljf07erXncc+Rbszq+bcs+M
 +YvOqcpPh2JAjMEAAEKAB0WIQSQIkZAwD1cxcAsz3LQJndZfgLxcAUCavVbhgAKCRDQJndZfgLx
 cNraEACfux7uTSghKzi5y/8S/2UUrSTUI+QxuRdVwdQcX6wI5xtZ5sk9IDtcdIVbI7zQlbk8ube
 hiEmXtwL3ohuu8Dig0a3L8jMaNEBi48vLhSYfcTgpDsOGddOqqBr5s8dV7zk5Jm+uprNVqGsae8
 bnAS1ESaKhZj/xMTbSSxvA8U7B52B3ZyDiSwhuYjSSWgqObC1MEpTNvHGcRLGC3UXb7FYJRAHUj
 esZJXy5tI7TLVj+QHeWD0wKv98NVcWMoPP9L/bJzNisrfGr0GD7lI8bEMAOVSc5ETOg+IOxBuy5
 O4JqWZyfuJkopyPO4Er3GAKfxdeCTe0PBwZesDBWvmW5GwcTnAAVFyvF0E7flPAAJ6BnzI9r1HB
 XsJyKfEXWDJKqaY2ObIIOXLJca2EzBdJ/Ji3eVxHHRlPDPQA5bkyuut05jRYmWragvl7xowEWXq
 Q4ZSxK0bgizg6nNsbPbo+CnowTkxtVMO/baq1FyVKZJ0lBK+DvK7GCJL0y4GtXkwBOAny4M9OwE
 C9JDcqhiCIU0L1RMBAPnWfUAi0ZSft/yCmdqVEVgKVvjvXB0JVU3Fo1dVIUqRqdygoiU1EZWo+o
 krAwxrxyU8h7BYqUvk+F6v2HSJNKKsHIy/XVJNH92EyZegP8ZLLoZjo1nIW8Okc/umXNRfcXoCa
 TOgaJC9oONg/d2Q==
X-Developer-Key: i=brajesh.gupta@imgtec.com; a=openpgp;
 fpr=05BAA300FD5C580EFD3F8D2F073292BAD0D39671
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAyNSBTYWx0ZWRfXy1DNRrcgX6o5
 AHFkRwGWpVla/MlbeFH6Cm1us8XmZJ4eEPtyag2iV9T/Qv5bsuKwf1fXDeZna7IeU5l0wP4byAo
 DPN4e0TyI+5eam+pTlGRZhi5A63c1q4Sgf582Ndbq+eh5n6hvc2HxRT4JUXz7hcndd0wRGs/QN0
 qSS6OjZjKCUO+LtMT21FnR9uki2JoN79Ely0evoqPszxJNo0Mn3cxwd4sHo98DxuO2HgINx3RR5
 TvxigD+quTNV0ZKHCpAsO45XoAhDMT2nRdilr1SJVf4gtpKD/1/xsO21w81Aux9IdAp8Z+8xkAh
 q5iGm7/stnKIf2L/TJbppCsmSW8CjEZOcMgGA6zrIL9uVRHjFTDnll5KIiU/9WjqYQkg68Zi9Sk
 76xSnOMpnniHLFV1gHs+01HVmry/fjUc0ODg31emxe2mFIw5h6q9kmISx8dtetjOHRrtz1JkRSU
 PWGwZrrCttQLX5Hvkhw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAyNSBTYWx0ZWRfX7JBRX7UPx769
 elt6CBv733/ghMysKLPvfJ/dHsiqKZgoLdy4351vAfOfo0ma4lBLu4dvJ9Uz+/UKLVoAKf+4Z9S
 V7sxCfKMnDMC13v0u+nLRebqQR1gSkI=
X-Proofpoint-ORIG-GUID: ULyMd3NzzCZ5bObvqfdWm11MZrv1Za__
X-Proofpoint-GUID: ULyMd3NzzCZ5bObvqfdWm11MZrv1Za__
X-Authority-Analysis: v=2.4 cv=LP/z05W9 c=1 sm=1 tr=0 ts=6af55b8c cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=x1VBDH5lXswA:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=Dg3V_Ljc6libAJX4Ty8A:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Update pvr_dev_query test to include querying of Firmware
information.

Signed-off-by: Brajesh Gupta <brajesh.gupta@imgtec.com>
---
 tests/imagination/pvr_dev_query.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/tests/imagination/pvr_dev_query.c b/tests/imagination/pvr_dev_query.c
index 29c7eb550..8995ea777 100644
--- a/tests/imagination/pvr_dev_query.c
+++ b/tests/imagination/pvr_dev_query.c
@@ -19,6 +19,7 @@ int igt_main()
 		DRM_PVR_DEV_QUERY_ENHANCEMENTS_GET,
 		DRM_PVR_DEV_QUERY_HEAP_INFO_GET,
 		DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET,
+		DRM_PVR_DEV_QUERY_FW_INFO_GET,
 	};
 
 	const uint64_t sizes[] = {
@@ -34,6 +35,8 @@ int igt_main()
 			sizeof(struct drm_pvr_dev_query_heap_info),
 		[DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET] =
 			sizeof(struct drm_pvr_dev_query_static_data_areas),
+		[DRM_PVR_DEV_QUERY_FW_INFO_GET] =
+			sizeof(struct drm_pvr_dev_query_fw_info),
 	};
 
 	struct drm_pvr_dev_query_gpu_info gpu_info = {0};
@@ -42,6 +45,7 @@ int igt_main()
 	struct drm_pvr_dev_query_enhancements enhancements = {0};
 	struct drm_pvr_dev_query_heap_info heap_info = {0};
 	struct drm_pvr_dev_query_static_data_areas static_data_areas = {0};
+	struct drm_pvr_dev_query_fw_info fw_info = {0};
 
 	void *const containers[] = {
 		[DRM_PVR_DEV_QUERY_GPU_INFO_GET] = &gpu_info,
@@ -50,19 +54,26 @@ int igt_main()
 		[DRM_PVR_DEV_QUERY_ENHANCEMENTS_GET] = &enhancements,
 		[DRM_PVR_DEV_QUERY_HEAP_INFO_GET] = &heap_info,
 		[DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET] = &static_data_areas,
+		[DRM_PVR_DEV_QUERY_FW_INFO_GET] = &fw_info,
 	};
 
-	int fd;
+	int fd, version_major, version_minor;
 
 	static_assert(ARRAY_SIZE(types) == ARRAY_SIZE(sizes));
 	static_assert(ARRAY_SIZE(types) == ARRAY_SIZE(containers));
 
 	igt_fixture()
 	{
+		drmVersionPtr version;
 		fd = drm_open_driver(DRIVER_POWERVR);
 
 		for (int i = 0; i < ARRAY_SIZE(types); i++)
 			memset(containers[i], 0, sizes[i]);
+
+		version = drmGetVersion(fd);
+		version_major = version->version_major;
+		version_minor = version->version_minor;
+		drmFreeVersion(version);
 	}
 
 	igt_describe("Test invalid dev query");
@@ -73,9 +84,20 @@ int igt_main()
 
 	igt_describe("Test valid dev query");
 	igt_subtest("dev-query-success-all") {
+		struct drm_pvr_ioctl_dev_query_args args;
 		for (int i = 0; i < ARRAY_SIZE(types); i++) {
-			struct drm_pvr_ioctl_dev_query_args args =
-				igt_pvr_ioctl_dev_query(fd, types[i], 0, NULL, 0);
+
+			/* DRM_PVR_DEV_QUERY_FW_INFO_GET only supported
+			 * from major version 1 and minor version 1 onwards.
+			 * Skip query on older version.
+			 */
+			if (types[i] == DRM_PVR_DEV_QUERY_FW_INFO_GET &&
+				version_major == 1 && version_minor < 1) {
+				igt_log("igt-pvr", IGT_LOG_INFO, "Skipping FW_INFO_GET query due to no support\n");
+				continue;
+			}
+
+			args = igt_pvr_ioctl_dev_query(fd, types[i], 0, NULL, 0);
 
 			igt_assert(args.size);
 			igt_assert(args.size <= sizes[i]);

-- 
2.43.0

