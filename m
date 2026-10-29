Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B212606A31A
	for <igt-dev@archiver.kernel.org>; Thu, 29 Oct 2026 02:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=d0ryxJTV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD1C10FEF7;
	Thu, 29 Oct 2026 02:16:45 +0000 (UTC)
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F28710FEFB
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 02:15:48 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69T1kOQp2587269
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 02:15:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=dk201812; bh=Xsq75twc8b6jZMvecnoo5P8
 ajNMOp9IMY38Gn+rJbHY=; b=d0ryxJTVPZQVwcqZ0XtXfQ30LgX2t4/EbL2ngo+
 fT4IdtOFHbNkx577ioouWqBzB4lWRwTAZ0GJZ/xOeYCdqlU1kYoOE7koWA3TQG+Z
 5xTl1mMkLNOvpparZGAk3+ZC0Fn1twfmFZy5B6jw5h0g+MAluMO79a87Uqg3GjSe
 EzfL6HJ5YrxtBNe98s2kF1YgpOJANxqCgkWh0RNx3WEdEUPubCky6fHgzZw293w2
 eIhDIUZlg//prm0rDZsZTrjH9t/3LrT6z9LX+47BS5AI4Q51iv1DULzvIaxkql7G
 AA2fXRQwLh/szA/dFmGl4bwzs5p07iMzDCDimaW0B6txgTQ==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4hkvd100ua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 02:15:46 +0000 (GMT)
Received: from [127.0.1.1] (172.25.128.158) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 29 Oct
 2026 02:15:44 +0000
From: Brajesh Gupta <brajesh.gupta@imgtec.com>
Date: Thu, 29 Oct 2026 07:45:36 +0530
Subject: [PATCH i-g-t] tests/imagination: Add query Firmware information test
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261029-b4-fw_info-v1-1-0eb3c0969a7f@imgtec.com>
X-B4-Tracking: v=1; b=H4sIAEes4moC/yXMSwqAIBRA0a3EGyekiVJbiYg+z3oNLLQfhHvPa
 ngG997g0RF6KJMbHB7kabERPE2gn1o7IqMhGkQmFM9EwTrJzNmQNQsTqmi15FzlWkIMVoeGrm9
 W1b/93s3Yb+8BQngAG5mw424AAAA=
X-Change-ID: 20261029-b4-fw_info-269a74116374
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Brajesh Gupta
 <brajesh.gupta@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4648;
 i=brajesh.gupta@imgtec.com; h=from:subject:message-id;
 bh=Dy8tjpjiBS/dRQFD4G1lKjleoZR89VvSdQUAITLwRl0=;
 b=owEBbQKS/ZANAwAKAdAmd1l+AvFwAcsmYgBq4qxPnYk0Zih47OEGfv4aycdoPaOW7T/oShvTT
 +nbrV2YNiGJAjMEAAEKAB0WIQSQIkZAwD1cxcAsz3LQJndZfgLxcAUCauKsTwAKCRDQJndZfgLx
 cKPiEACy+6ETLLE7ClxiRdkAPPXI4ThfokJXziqo7QrPoRfl3md+fe/YQkNpunJzzSLgCSxMc45
 eodBNOXFBpTZqc5G647XbICQFpJ9MGzWJ595Yz7ozcQ2hwla3eMeyu65dfsZ6qTAC5+ssDGhs2Z
 8/w5y1rCBXqQ95YgWbphl1V6dZVuB1HaN/4eDRnSgqoEiVQq2UtVrMafac8vJFSlOoNKGVNuw1+
 FdT3Wja+kUY1TUbMSmJm/1uXFbmrQHG5YNcgKRYw8novVPFGhE8GbFxlySAO2nI7yoDredy65Z4
 arriI0/2mZESWkfdBHFY4sPUd6Tx6f5167dDt5l/6LWmOEt30RAq4DR18C34eYzCVUtgnTEFO4Z
 4eKHWJ+FKIEMkEAiolB9xvAAfmmzG7bO3WvFxcybvK3P5ftlOqJNdao4FbTZFY9Mld/M688y6zE
 qNxnRhXPE6KjRj77rochNUzXzTVE+NuZM/GYkNSys62/xsaHcBS0BPldK3RLTGbJKY5PxJfXk6P
 5wJrzHjarE11GO72I22nNMqL0u94eICJukw5IcBE28k6rW1XSfdqQNJYiBEvVB21Yzr5s/g32DP
 R09TsYmK57imZsEfm9EqmqPRICpmRZR1f7sC6VKAbCv/t81cWFDt/py1D9tnkDluZIdfVFSPbX9
 6G8gvzeRIUhFvbg==
X-Developer-Key: i=brajesh.gupta@imgtec.com; a=openpgp;
 fpr=05BAA300FD5C580EFD3F8D2F073292BAD0D39671
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAwOCBTYWx0ZWRfX3r8dt1cJnhUH
 8o9iFln3Ar5ChDjR0SDd4EGCDQPSbGF4v5WsJGeNewRi6VkUYj7Oj+vnKA0yheg+Ye3vDHh2uTz
 DkYGGLREk/iEgvmE2M2o7tYQGgiAdmswqAuOL16kSb84kk3dCCSMv1OJHwMcrD2fMA4lLAzKx1H
 4/rl5zdr+/ek6pgj7SPzBUlrRbavWUXvEQ6UYYnGQBUM5wmidu7hkHHSWKLFBc+oPLC2tM2kM5f
 Rfjsu0TkVbPE3tfpptCvmEwDM9nT5k0Rq41bLZpmDyAROsW1lmzgc7I8s6Nr6szH/vZXZQ5dbqo
 a4kCxN9/EJHp7sjXx3tVvowWDVhcjDNbTUc16vmuZpiiFqs+xw+vaT8DImLwpi9pDsoLQXE5kcV
 E/KCPguBoZWQOZ/TLqfGIUED1ntIIGSYOzCa+4gkeBmyhh6dD1/EDhwUmAwofmXB2wY2v/gsTt1
 Sby4yE/BbPO5rETiwtA==
X-Proofpoint-ORIG-GUID: G_fcyHBv_EFgUyeASOzGRDcr2LS_VDIe
X-Authority-Analysis: v=2.4 cv=RdgFmFtv c=1 sm=1 tr=0 ts=6ae2ac52 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=x1VBDH5lXswA:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=e5mUnYsNAAAA:8 a=r_1tXGB3AAAA:8 a=KWXxakAJERT67NwAjH4A:9 a=QEXdDO2ut3YA:10
 a=Vxmtnl_E_bksehYqCbjh:22 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: G_fcyHBv_EFgUyeASOzGRDcr2LS_VDIe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAwOCBTYWx0ZWRfX30EdBvMxbGaz
 mDg+hUQEDRmDKgFWbmZ/ivBKagS/T7S/Q/ALh0mv7WBabaYbxASvrfd8BIhYjXR7YthCcVbYQGQ
 sz6Wo+iMZ9OW4feFPvTM5YSERUCp9/E=
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
Add test for new Firmware information query subtype added to DEV_QUERY
under upstream review https://patchwork.freedesktop.org/series/176800/.
---
 include/drm-uapi/pvr_drm.h        | 21 +++++++++++++++++++++
 tests/imagination/pvr_dev_query.c | 28 +++++++++++++++++++++++++---
 2 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/include/drm-uapi/pvr_drm.h b/include/drm-uapi/pvr_drm.h
index ccf6c2112..1179c1e7d 100644
--- a/include/drm-uapi/pvr_drm.h
+++ b/include/drm-uapi/pvr_drm.h
@@ -434,6 +434,21 @@ struct drm_pvr_dev_query_static_data_areas {
 	struct drm_pvr_obj_array static_data_areas;
 };
 
+/**
+ * struct drm_pvr_dev_query_fw_info - Container used to fetch information
+ * about the GPU Firmware like its version.
+ */
+struct drm_pvr_dev_query_fw_info {
+	/** @major_version: Major version of the Firmware. */
+	__u16 major_version;
+
+	/** @minor_version: Minor version of the Firmware. */
+	__u16 minor_version;
+
+	/** @_padding_4: Reserved. This field must be zeroed. */
+	__u32 _padding_4;
+};
+
 /**
  * enum drm_pvr_dev_query - For use with &drm_pvr_ioctl_dev_query_args.type to
  * indicate the type of the receiving container.
@@ -476,6 +491,12 @@ enum drm_pvr_dev_query {
 	 * a pointer to &struct drm_pvr_dev_query_static_data_areas.
 	 */
 	DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET,
+
+	/**
+	 * @DRM_PVR_DEV_QUERY_FW_INFO_GET: The dev query args contain
+	 * a pointer to &struct drm_pvr_dev_query_fw_info.
+	 */
+	DRM_PVR_DEV_QUERY_FW_INFO_GET,
 };
 
 /**
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

---
base-commit: fc75d6d7ffcb79e8a3316e80c7085460568a7670
change-id: 20261029-b4-fw_info-269a74116374

Best regards,
--  
Brajesh Gupta <brajesh.gupta@imgtec.com>

