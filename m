Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA20606A32C
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 17:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QCgKaqdh
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D3E10E54C;
	Tue,  3 Nov 2026 17:15:40 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 832F510E43C
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 17:13:32 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A3F6cPB1576890; Tue, 3 Nov 2026 17:13:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=jUSpfAOFuje
 Gz9rb66uGIGdVHNa0gTUdRuBbo4Bdr6o=; b=QCgKaqdhnhQTpOhDhD+e9iazlWW
 XLxJIEUJWGUpVg/5kbR2HXC8/iK9dDPBPkTWlz7zVpBE0rBtPjste2pT19B0AqtR
 9UXtpiVk+qVy/InvHj0deMOUne2LUgm+agPO5g+/tSZBeb3RxDTJFUAC3ratdS+N
 1dM4to2GxcnXslbFYM5CxtYYn95BSbz6FiKpLMjhhcqAYIlh+CGtZKsGz99U3z0D
 qudX3tIayYJ/7QNTTfbhyTSAEZdtxubVfONr+GXjaAKNbOjQvCP7nUXN/zcjcX5o
 ZefCZ5xvQ/1mGpnbHGNF5pvOEc09EWk7EqEdplKjC/i8YYFXltfCctodbAw==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhyd0jea-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 03 Nov 2026 17:13:31 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A3HDRrW1125502; Tue, 3 Nov 2026 17:13:28 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-jvignan-hyd.qualcomm.com
 [10.147.241.47])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6A3HDSgO1125507
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 03 Nov 2026 17:13:28 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4601609)
 id 59527A1E; Tue,  3 Nov 2026 22:43:27 +0530 (+0530)
From: Jitta Vignan <jvignan@qti.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: robclark@qti.qualcomm.com, akhilpo@qti.qualcomm.com,
 kamil.konieczny@linux.intel.com, spatraya@qti.qualcomm.com,
 Jitta Vignan <jvignan@qti.qualcomm.com>
Subject: [PATCH i-g-t v2 2/2] tests/msm/msm_bo: Add buffer free tests
Date: Tue,  3 Nov 2026 22:43:22 +0530
Message-Id: <20261103171322.2729929-3-jvignan@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103171322.2729929-1-jvignan@qti.qualcomm.com>
References: <20261103171322.2729929-1-jvignan@qti.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=bp/Zl0ai c=1 sm=1 tr=0 ts=6aea163b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=bXoCVvWqAAAA:8
 a=630e-JmU_mdlTbmo2rMA:9 a=xWGLF9RxxNN1Vkn1tT4a:22
X-Proofpoint-GUID: KtjOHTNBSI7rw7ZxSd3nt3mAum_tveIo
X-Proofpoint-ORIG-GUID: KtjOHTNBSI7rw7ZxSd3nt3mAum_tveIo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2OCBTYWx0ZWRfX9lQSq1Ub4x0u
 M1nZFNpo+kib+VHxfrU5dJ946dOa1ngJgr0R6zHQdM+bijzt7cCao5qjhjbHF4ksrBiqBPspzMz
 jzIaln/zDPNwClkhHMMgPp1kq0wHmRE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2OCBTYWx0ZWRfX5on30g1iVg/m
 TQ0CEW9JrNkddTR8kEoSht2fPikeywOSdJMgsH/nkg07g/bH6Q+xif060iJ6Cc5TKG4OUOGQ58b
 /K9KfPWhoNqXlbhoeQoD8irVC2lxuyNuMORfcKlCFrmwFO40OmoNSYabqX5YAbbQjWT/oaI9NKC
 u3QW9NjYz7blNGnSwlEcXd641NvbGOqhFWOOEGv6Q60NrIU/K0YBBIHssVbrUwqoJEdm0ajn4Od
 pCJONzMtDPRMqrC7UPfsviDZ/vB4hW9PKKy3CywYwAqiaArU3ynaHjXs6stt7C/H1KMu/TCC5G+
 2dD+tq7KvdcZ7RRpgIDZp8TXzExgyXvW9fgLV+gb4kKn+k4epwszBfnywbuPm4XFwwcyYE/PQJv
 M1kGzgZnc5XPihUx5VH+eLoPWqer8clrhablAWE3FRUxBr5h04NWgv5FoyIk6AuGqxt0dBxFh3D
 UcrCS4fYkOpeM8FzUrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030068
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
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add positive and negative coverage for freeing MSM buffer objects.

Exercise single and multiple buffer cleanup, large buffer cleanup,
repeated allocation and free operations, invalid and zero handles,
double-free attempts, and queries made after a buffer has been freed.

Verify that released buffer handles can no longer be queried through
the MSM GEM info interface.

Signed-off-by: Jitta Vignan <jvignan@qti.qualcomm.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Tested-by: Sri Vidya Patrayani <spatraya@qti.qualcomm.com>
---
 tests/msm/msm_bo.c | 150 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/tests/msm/msm_bo.c b/tests/msm/msm_bo.c
index 67911aee3..e91824aa6 100644
--- a/tests/msm/msm_bo.c
+++ b/tests/msm/msm_bo.c
@@ -1072,6 +1072,156 @@ int igt_main()
 		igt_msm_bo_free(bo);
 	}
 
+	/* Buffer Free Tests - Positive Cases */
+	igt_describe("Free single buffer object");
+	igt_subtest("bo-free-single") {
+		struct msm_bo *bo;
+		struct drm_msm_gem_info req = { 0 };
+		uint32_t handle;
+
+		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
+		igt_assert_f(bo, "Failed to allocate buffer object\n");
+		handle = bo->handle;
+
+		igt_msm_bo_free(bo);
+
+		/* Verify the handle is actually gone */
+		req.handle = handle;
+		req.info = MSM_INFO_GET_IOVA;
+		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req, ENOENT);
+
+		igt_info("Successfully freed single buffer object (handle %u)\n", handle);
+	}
+
+	igt_describe("Free multiple buffer objects");
+	igt_subtest("bo-free-multiple") {
+		struct msm_bo *bo1, *bo2, *bo3;
+		uint32_t handle1, handle2, handle3;
+
+		/* Allocate multiple buffers */
+		bo1 = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
+		bo2 = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE * 2, MSM_BO_CACHED);
+		bo3 = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE * 4, MSM_BO_WC);
+
+		igt_assert_f(bo1 && bo2 && bo3, "Failed to allocate buffer objects\n");
+
+		handle1 = bo1->handle;
+		handle2 = bo2->handle;
+		handle3 = bo3->handle;
+
+		/* Free all buffers */
+		igt_msm_bo_free(bo1);
+		igt_msm_bo_free(bo2);
+		igt_msm_bo_free(bo3);
+
+		igt_info("Successfully freed multiple buffer objects (handles %u, %u, %u)\n",
+			 handle1, handle2, handle3);
+	}
+
+	igt_describe("Free large buffer object");
+	igt_subtest("bo-free-large") {
+		struct msm_bo *bo;
+		size_t large_size = 64 * 1024 * 1024; /* 64MB */
+		uint32_t handle;
+
+		bo = igt_msm_bo_new(dev, large_size, MSM_BO_WC);
+		igt_assert_f(bo, "Failed to allocate large buffer (64MB)\n");
+		handle = bo->handle;
+
+		igt_msm_bo_free(bo);
+
+		igt_info("Successfully freed large buffer (64MB, handle %u)\n", handle);
+	}
+
+	igt_describe("Allocate and free buffers in sequence");
+	igt_subtest("bo-free-sequence") {
+		const int num_iterations = 10;
+
+		for (int i = 0; i < num_iterations; i++) {
+			struct msm_bo *bo;
+			uint32_t handle;
+
+			bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
+			igt_assert_f(bo, "Failed to allocate buffer in iteration %d\n", i);
+			handle = bo->handle;
+
+			igt_msm_bo_free(bo);
+
+			igt_debug("Iteration %d: allocated and freed handle %u\n", i, handle);
+		}
+
+		igt_info("Successfully completed %d allocate/free cycles\n", num_iterations);
+	}
+
+	/* Buffer Free Tests - Negative Cases */
+	igt_describe("Free invalid handle (expects EINVAL)");
+	igt_subtest("bo-free-invalid") {
+		struct drm_gem_close close_req = { 0 };
+
+		close_req.handle = 0xDEADBEEF;
+
+		do_ioctl_err(dev->fd, DRM_IOCTL_GEM_CLOSE, &close_req, EINVAL);
+
+		igt_info("Correctly rejected freeing invalid handle with EINVAL\n");
+	}
+
+	igt_describe("Free same handle twice (expects EINVAL)");
+	igt_subtest("bo-double-free") {
+		struct msm_bo *bo;
+		struct drm_gem_close close_req = { 0 };
+
+		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
+		igt_assert_f(bo, "Failed to allocate buffer object\n");
+
+		close_req.handle = bo->handle;
+
+		/*
+		 * Free it once using gem_close and free bo struct manually
+		 * (bypassing igt_msm_bo_free to test double-free behavior)
+		 */
+		gem_close(dev->fd, bo->handle);
+		free(bo);
+
+		/* Try to free it again - should fail */
+		do_ioctl_err(dev->fd, DRM_IOCTL_GEM_CLOSE, &close_req, EINVAL);
+
+		igt_info("Correctly rejected double-free with EINVAL\n");
+	}
+
+	igt_describe("Free handle zero (expects EINVAL)");
+	igt_subtest("bo-free-zero-handle") {
+		struct drm_gem_close close_req = { 0 };
+
+		close_req.handle = 0;
+
+		do_ioctl_err(dev->fd, DRM_IOCTL_GEM_CLOSE, &close_req, EINVAL);
+
+		igt_info("Correctly rejected freeing handle 0 with EINVAL\n");
+	}
+
+	igt_describe("Query offset and IOVA of a freed buffer (expects ENOENT)");
+	igt_subtest("bo-use-after-free") {
+		struct msm_bo *bo;
+		struct drm_msm_gem_info req = { 0 };
+		uint32_t handle;
+
+		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
+		igt_assert_f(bo, "Failed to allocate buffer object\n");
+		handle = bo->handle;
+
+		igt_msm_bo_free(bo);
+
+		/* Both info queries on the freed handle must fail */
+		req.handle = handle;
+		req.info = MSM_INFO_GET_IOVA;
+		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req, ENOENT);
+
+		req.info = MSM_INFO_GET_OFFSET;
+		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req, ENOENT);
+
+		igt_info("Correctly rejected use-after-free with ENOENT\n");
+	}
+
 	igt_fixture() {
 		igt_msm_dev_close(dev);
 	}
-- 
2.34.1

