Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A173606A31C
	for <igt-dev@archiver.kernel.org>; Wed, 11 Nov 2026 05:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=WJqTcisD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C258C10E197;
	Wed, 11 Nov 2026 05:34:54 +0000 (UTC)
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA8110E197
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 05:32:02 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id
 6AB5H6e02913018
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 05:32:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=W
 3+PqrTDPl8OUIg1HGSDfmkJNKQCzxWEP2gphrUtt6g=; b=WJqTcisDRUrPr2SeF
 fHGdWzc7+VUpCD/V7o4/nzN/X9OEsEXFU/bg+ovmUhmwZJSxFJdvcqPiagMw2XsK
 32xp/e76fyraidJdBMj/U7QW+NQDNzskBux6werP4gW5seLbRGQGSSgSpWcWh3hg
 oMbgq//M30Q3SdastTx07BnZsSkNpuVQRd2TjmK/IZ/F/ySt/I9e3B895J/EIK4D
 fdQVXJirPwmBKFzKGp9wfo/PtjBEJNeo347j05Fup+nJQ3BjRGNbKFSWCDh9VZdc
 6+7l3jofCT63sYZgIKv/djwQXu0PU5h98mMBlfsohxejljScyjoOil3n5QZkxKZn
 DL8Eg==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4hu8pn9fqu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT
 key_exchange=secp384r1)
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 05:32:00 +0000 (GMT)
Received: from [127.0.1.1] (172.25.128.158) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 11 Nov
 2026 05:31:59 +0000
From: Brajesh Gupta <brajesh.gupta@imgtec.com>
Date: Wed, 11 Nov 2026 11:01:50 +0530
Subject: [PATCH i-g-t v2 1/2] tests/imagination: Add query Firmware
 information test
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261111-b4-fw_info-v2-1-4d771dde5775@imgtec.com>
References: <20261111-b4-fw_info-v2-0-4d771dde5775@imgtec.com>
In-Reply-To: <20261111-b4-fw_info-v2-0-4d771dde5775@imgtec.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Brajesh Gupta
 <brajesh.gupta@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3070;
 i=brajesh.gupta@imgtec.com; h=from:subject:message-id;
 bh=wVz7/UsVKqRrSk/cSiNaVgaQguGraljhQ74wpQtZ368=;
 b=owEBbQKS/ZANAwAKAdAmd1l+AvFwAcsmYgBq8/3MmocUHTpuksfXPrp2crRWMO/9fzfpy8Ikt
 pQZnlIB8JuJAjMEAAEKAB0WIQSQIkZAwD1cxcAsz3LQJndZfgLxcAUCavP9zAAKCRDQJndZfgLx
 cMGsD/44UDfK7fkCzp/+u8kaQwTyMcLlDFQ3tjjsosUQXx0aqaHn4g9nPNqjQYAOy1hylN98BNb
 A8zSbSkjeybeLzyVcSHfHqmRx4m6p7Z9NNhTObYxwstu/ijfiwpJumvWejX4LMzOwV11RusZQLP
 s68ioxb3Zadhla17Rt61vanq3pqn8I4z8JApwcS9q9ufeqPJuzvzSS6VjB65T1dRYjT6j88Uk76
 b7Y328L09dENCH/vvIy2NIegUdFsTqXKtDIa54xQL8+xvCIoufUTQkLeeLwIXD4zlqzGykoCi7N
 bxuoXB4BeX/RVl6LuPdWdh7erZVa9a1SWVRPO4givH34pisttNhSIcMWp169oiseBmZT8rInkTp
 blGTExZ+xUN1mknTDmjKz4Kkd+2FIPvWHMTaJ8J6z8Qo7SqFGJCikc+cdG2GKmQ3i24Tqb2TBSb
 Yaxhh340K1q32FntLRSH0bMJwAcN/kgMa9EEyB1FsS9iyliWXkSmJLoTgDNXbbgRfyMHhRrY40Y
 8e1Wtv2N66FdS6ccU+Khm3vzwg3LDjG4T5qhYjRdORO+V5BLp+8/q+EvI8F/kzuH/YPfWMkpZmx
 gdPC6fN7yMb7TAxDHduKcxNhT3G+pdpe7jrVZnb+JXAwRal6xYvFaKSCAsSeMlPdHGW2pnC2vYZ
 uUiwhNT8E+oQuCg==
X-Developer-Key: i=brajesh.gupta@imgtec.com; a=openpgp;
 fpr=05BAA300FD5C580EFD3F8D2F073292BAD0D39671
X-Authority-Analysis: v=2.4 cv=P46vFSAu c=1 sm=1 tr=0 ts=6af3fdd0 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=x1VBDH5lXswA:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=r_1tXGB3AAAA:8 a=Dg3V_Ljc6libAJX4Ty8A:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAyMSBTYWx0ZWRfX/IAY/W/84bGT
 m5bu9N7fLDYVrcFOoAQaY7mb87FcPcOr1Vv9wfrtGBRefsJzMvfEbbLu2RIGdgSMnoZblAgHLQS
 A3eGXeWVYBKeXzeP6Xttrc3YvfgtVoWXb5XTdXhjmanZPc/NjrAHca6iLwxCtz0PF68xrqur92z
 VHhbs3d+fEqrdwFEfprNLFH+bEB/fedP3erQRXNF7pe+ncMC0i9vUsqqi4cvNQYuLCM3ECvoVUz
 OJzbp55uM9CLiUceIFp/alvbhpWxw58gD9qlK5hBSeem82rMnHSgl0Ka8Bf0HpVw3Nf7EsQ5l/p
 xujgX4N2qtnUq3yPYxQBsHuQx/DPiMath6wvoQxDjjQFVvrBUa1evh2w0rKKvU6UiQDxYmy7Hwj
 iLVWNHs2u4aLiBv9dJjRS7Yiu3g9YAi5/AfMtpCF3CUvKYsX7EPtW+8tngN/S6bPwxEsqwnT4G+
 de96WIbS6Nvwus0d8iw==
X-Proofpoint-ORIG-GUID: 6tJyZyyQiCmMEHt9_pQVte1l66C1MvfP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAyMSBTYWx0ZWRfX+kQt2CgWXNo3
 Hw8IimzaAY6WSzedL9VwU9Ne01CYv/1v2qMDijf+IqyoiXYRSHcCIIWhYA700nPP6nkeIbm5W7E
 2f2bET8MIfqZ05TS9QP5pyf1VZ1lf4I=
X-Proofpoint-GUID: 6tJyZyyQiCmMEHt9_pQVte1l66C1MvfP
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

