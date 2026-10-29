Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEEC606A31D
	for <igt-dev@archiver.kernel.org>; Thu, 29 Oct 2026 17:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iT7a+Pic
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0323510E768;
	Thu, 29 Oct 2026 17:29:40 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD7010E768
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 17:27:45 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69THDg3p182086
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 17:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=4e/3n8iJqie
 WpynZzFM5iesDICvQCLvYgE9TLE6ngEY=; b=iT7a+Picr84d7EYyQpfr84rkc2+
 suKIikSngbTNCIPEAivXwQDKuMnCYSo66H0Hg7wydeoJw1A7g8Co3cMkmZjxCDyb
 DBqJCn+7UI6zc1tT04q+OmlcLOhuNdxft0Fk+NUzWbMvWKwLHnA0kGHJ0XtzC4k5
 vUwPdBeQMzp7fxViEJUUsmGBA1x+PfiNdnKmR0KK9RSfEoNlMDFGoOPz1CggQ5Pz
 bf/UdheaVO8WsVsDyOu6925BWRZ4bwdc3zcCj+WunozB/crIuvIqTouoggQRD6OB
 BhjQd2B45jnEJytFt1FLr9fJzUjbP2EmYGNjiu/3g9GiE7neJle/Dxsx+zA==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hmac0r2bw-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 17:27:44 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id
 69TGu01n3027543; Thu, 29 Oct 2026 16:56:00 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-jvignan-hyd.qualcomm.com
 [10.147.241.47])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 69TGu0fF3027536
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 29 Oct 2026 16:56:00 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4601609)
 id B53A2A07; Thu, 29 Oct 2026 22:25:59 +0530 (+0530)
From: Jitta Vignan <jvignan@qti.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: robclark@qti.qualcomm.com, akhilpo@qti.qualcomm.com,
 Jitta Vignan <jvignan@qti.qualcomm.com>
Subject: [PATCH i-g-t 2/2] tests/msm/msm_bo: Add buffer free tests
Date: Thu, 29 Oct 2026 22:25:53 +0530
Message-Id: <20261029165553.1108121-3-jvignan@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029165553.1108121-1-jvignan@qti.qualcomm.com>
References: <20261029165553.1108121-1-jvignan@qti.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: Hug1VwftGAJe_a1kDgR2YXMiLV7F3yog
X-Proofpoint-GUID: Hug1VwftGAJe_a1kDgR2YXMiLV7F3yog
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2OCBTYWx0ZWRfX/FkmbURxjtAS
 6R6+W8nk78UsA5LLS+CZtP7KfSHiZgUK9GIsu7ZizOoIXB93HyNQZIFY9URLGa6TpR2ozFGxGgi
 S4OAclZ9AJMSTrtbMQroJqK5yBnf0E4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2OCBTYWx0ZWRfX2/wcdEDGmCBq
 maE1JKGhiq/CwUAedO+YMYdPk9NOnqJiEd6P2nQtzdiXrHzZtbUBMW/STY7t1VFe9yLIGG+Te9t
 C6EkhfpnEoRvWoIsQP06C2bj/JFnOBsWgf5Nx5nC0+Potrt3hCe584lQuUPOY7JJcgnkZKKSntb
 MZ4BHwz12hHg6wjuRB3mg50nNteXXCkx815FnnNK5nfudYdhdWUHByf4H/89PY16IymwEjeC+w+
 6xBzxT4oghxQ8VNgv3lBkyaF4rnYqJujjrt0VciCDtmEOFLfnzAc0OW24zAc38FXiCX7ud6h1Nq
 hekFjJ2X+iJfXDpthfs9D//Dko4qkz5TRdT8q1VdlMzN2DYKKQId//GMX/jMaT6K3n/NCw9PWGF
 yTxRJoHEAoLNPD55V4Jvk+DrAmKkWnvbRhggm1CD2BRY/uoENdbzaO6rXyBoqbcPXmQvSeid51s
 frCt/z8F9/ZrU3M6rZQ==
X-Authority-Analysis: v=2.4 cv=I6/w19gg c=1 sm=1 tr=0 ts=6ae38210 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=bXoCVvWqAAAA:8
 a=630e-JmU_mdlTbmo2rMA:9 a=xWGLF9RxxNN1Vkn1tT4a:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290068
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
---
 tests/msm/msm_bo.c | 150 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/tests/msm/msm_bo.c b/tests/msm/msm_bo.c
index 295c7b0d3..f76e78e73 100644
--- a/tests/msm/msm_bo.c
+++ b/tests/msm/msm_bo.c
@@ -834,6 +834,156 @@ int igt_main()
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

