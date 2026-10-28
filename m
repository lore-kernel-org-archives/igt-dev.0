Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FC1606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 10:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B5mWcVwF
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA94310FB09;
	Wed, 28 Oct 2026 10:27:52 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B5BB10E61A
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 10:26:07 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69S8K79m1667693
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 10:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=gW3CD1US/nL
 Kf27MexrvWzhp6dudLW7YBH7EAfn6kAc=; b=B5mWcVwFe7vkspzeMFOYd3X34+Z
 JwU5+pG1jZEGmoX6b/rddLlFKa/PJsCblqIgSlKQCH3rK/921PyBQ/en2ckHJjPm
 omTmiYQOvFoBol/Znj6REgNAEI9+1Ne4uAp+BEBMv4YNeNy6LavbYAZZjw+4Zggy
 6qNHUSIawH8zSLPl5DFuWIsbrzEQ/96CZd6dk5x1ZJMz7gtJgw9mE1PBCJDdzR7b
 eCGo2Gkyx+rPGCP7mDz3mDIMfIHX6x2M5aopDMvBtVhVEuWsWs+hSHnmNKiqsAKB
 Mos9yQMUkWsxnBYrQ7UA0HuSQwq7/8Al0avfz1GdKyDnjNXQUaFpbIt/Agg==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk12pu3f3-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 10:26:06 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id
 69SAQ1HI532846
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 10:26:03 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-jvignan-hyd.qualcomm.com
 [10.147.241.47])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 69SAQ36F532887
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2026 10:26:03 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4601609)
 id 76352A03; Wed, 28 Oct 2026 15:56:02 +0530 (+0530)
From: Jitta Vignan <jvignan@qti.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: robclark@qti.qualcomm.com, akhilpo@qti.qualcomm.com,
 Jitta Vignan <jvignan@qti.qualcomm.com>
Subject: [PATCH i-g-t 1/2] tests/msm/msm_bo: Reorder info tests and clean up
Date: Wed, 28 Oct 2026 15:55:51 +0530
Message-Id: <20261028102552.3836144-2-jvignan@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028102552.3836144-1-jvignan@qti.qualcomm.com>
References: <20261028102552.3836144-1-jvignan@qti.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: QMuk53WUybIuhudFE7XP24VBvH1SODlb
X-Authority-Analysis: v=2.4 cv=DtDDa2/+ c=1 sm=1 tr=0 ts=6ae1cdbe cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=bXoCVvWqAAAA:8
 a=6nE4xcvYXM9yEuTVhZ0A:9 a=xWGLF9RxxNN1Vkn1tT4a:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MSBTYWx0ZWRfX2m/qTPTSy9jH
 YWYgCIXq7y0AWd3ZS/2druzsq+nkzV5Zy+x7svVubjVxhhWE2Quuk0Ax+WRkHPYP8nOAud96FNz
 ucV8odoNqZflZy1LXtnvu1hERG27jEB/I1RegPA0Mf6WTmRXvQlbANk0iG6+Js+VF1KJA/nHWYE
 5QBB368JDSqdT4j28fTDvJyEYi+N+sDfdWuWxD5l+6yhBkQx2PpWghkbobz/a+oi9itg+F+h7b/
 pc7nu1t5VaDT4rHkQkSAfUV0Mx35RU2OpmrcYiDulxbdTLxJcXfLTR8TWLaaRWOpn8g01H8+kBv
 CWnQJL01g2GlPTpYRkR43m6VOMElAkIpoGyfPR7Yu+3qyYYzSZwFh1RU5HGVFjVxUgDnLDEmfqX
 800VV5Nd0nl06ShnPwamMrfAkml/C9s3WrPNebu2KFIA0PUpYiKfRI8PpdHKMJzekzXrJzO6dtp
 PrN0Bwj837Xf4b2LOHQ==
X-Proofpoint-GUID: QMuk53WUybIuhudFE7XP24VBvH1SODlb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MSBTYWx0ZWRfX3aGn2UJfXE0z
 VMMN6UpxQEMEvWm77WngAVk7+qhDlca1b9lr5B7GQ5ytwAUwNSqx5UuCvtgAaA73MWXg0JV9Qjw
 tbDp0aZrBB/9gULk74WjbaeyFYl1M0w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280041
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

Run the info negative tests after the positive info tests, so the
basic queries are exercised first.

Use do_ioctl_err() for the alloc and info negative tests instead of
open-coding the return value and errno checks, and use a single bit
outside MSM_BO_FLAGS for the invalid-flags test.

Keep the deprecated MSM_BO_UNCACHED case in bo-get-flags-cache-modes.
Kernels that reject it return EINVAL, which is already treated as
expected; kernels that still accept it may report either UNCACHED or
WC, so accept both for this case.

Signed-off-by: Jitta Vignan <jvignan@qti.qualcomm.com>
---
 tests/msm/msm_bo.c | 128 ++++++++++++++++++++++-----------------------
 1 file changed, 63 insertions(+), 65 deletions(-)

diff --git a/tests/msm/msm_bo.c b/tests/msm/msm_bo.c
index 8cc2ebf9e..885382825 100644
--- a/tests/msm/msm_bo.c
+++ b/tests/msm/msm_bo.c
@@ -8,11 +8,6 @@
 #include "igt.h"
 #include "igt_msm.h"
 
-/*
- * Tests for MSM buffer object allocation and information
- * Tests DRM_IOCTL_MSM_GEM_NEW and DRM_IOCTL_MSM_GEM_INFO functionality
- */
-
 #define DEFAULT_BUFFER_SIZE 4096
 
 int igt_main()
@@ -73,8 +68,7 @@ int igt_main()
 
 		req.size = 0;
 
-		igt_assert_eq(igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_NEW, &req), -1);
-		igt_assert_eq(errno, EINVAL);
+		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_NEW, &req, EINVAL);
 	}
 
 	igt_describe("Test allocation with invalid flags (should fail)");
@@ -82,10 +76,9 @@ int igt_main()
 		struct drm_msm_gem_new req = { 0 };
 
 		req.size = DEFAULT_BUFFER_SIZE;
-		req.flags = ~0; /* Invalid flags */
+		req.flags = (1 << 25); /* Invalid flag bit outside MSM_BO_FLAGS */
 
-		igt_assert_eq(igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_NEW, &req), -1);
-		igt_assert_eq(errno, EINVAL);
+		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_NEW, &req, EINVAL);
 	}
 
 	igt_describe("Test allocation with unaligned size");
@@ -99,7 +92,9 @@ int igt_main()
 
 		igt_msm_bo_free(bo);
 	}
-		igt_describe("Get offset for valid BO");
+
+	/* Buffer Information Tests - Positive Cases */
+	igt_describe("Get offset for valid BO");
 	igt_subtest("bo-get-offset-valid") {
 		struct msm_bo *bo;
 		struct drm_msm_gem_info req = { 0 };
@@ -171,59 +166,6 @@ int igt_main()
 		igt_msm_bo_free(bo);
 	}
 
-	/* Buffer Information Tests - Negative Cases */
-	igt_describe("Get offset for invalid handle (expects ENOENT)");
-	igt_subtest("bo-get-offset-invalid") {
-		struct drm_msm_gem_info req = { 0 };
-		int ret;
-
-		req.handle = 0xDEADBEEF; /* Invalid handle */
-		req.info = MSM_INFO_GET_OFFSET;
-
-		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req);
-		igt_assert_eq(ret, -1);
-		igt_assert_eq(errno, ENOENT);
-
-		igt_info("Correctly rejected invalid handle with ENOENT\n");
-	}
-
-	igt_describe("Get IOVA for invalid handle (expects ENOENT)");
-	igt_subtest("bo-get-iova-invalid") {
-		struct drm_msm_gem_info req = { 0 };
-		int ret;
-
-		req.handle = 0xDEADBEEF; /* Invalid handle */
-		req.info = MSM_INFO_GET_IOVA;
-
-		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req);
-		igt_assert_eq(ret, -1);
-		igt_assert_eq(errno, ENOENT);
-
-		igt_info("Correctly rejected invalid handle with ENOENT\n");
-	}
-
-	igt_describe("Use invalid info type (expects EINVAL)");
-	igt_subtest("bo-invalid-info-type") {
-		struct msm_bo *bo;
-		struct drm_msm_gem_info req = { 0 };
-		int ret;
-
-		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
-		igt_assert_f(bo, "Failed to allocate buffer object\n");
-
-		req.handle = bo->handle;
-		req.info = 0xFFFFFFFF; /* Invalid info type */
-
-		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req);
-		igt_assert_eq(ret, -1);
-		igt_assert_eq(errno, EINVAL);
-
-		igt_info("Correctly rejected invalid info type with EINVAL\n");
-
-		igt_msm_bo_free(bo);
-	}
-
-	/* Additional Buffer Information Tests */
 	igt_describe("Verify offset consistency across multiple queries");
 	igt_subtest("bo-get-offset-consistency") {
 		struct msm_bo *bo;
@@ -337,7 +279,7 @@ int igt_main()
 			{ MSM_BO_CACHED_COHERENT, "CACHED_COHERENT", true }, /* May not be supported */
 		};
 
-		for (int i = 0; i < ARRAY_SIZE(test_cases); i++) {
+		for (unsigned int i = 0; i < ARRAY_SIZE(test_cases); i++) {
 			struct drm_msm_gem_new alloc_req = { 0 };
 			struct drm_msm_gem_info info_req = { 0 };
 			int ret;
@@ -367,6 +309,19 @@ int igt_main()
 				 (unsigned long long)info_req.value,
 				 test_cases[i].flags);
 
+			/*
+			 * MSM_BO_UNCACHED is deprecated in favour of MSM_BO_WC, so a
+			 * kernel that still accepts it may report either cache mode.
+			 */
+			if (test_cases[i].flags == MSM_BO_UNCACHED) {
+				uint64_t mode = info_req.value & MSM_BO_CACHE_MASK;
+
+				igt_assert_f(mode == MSM_BO_UNCACHED || mode == MSM_BO_WC,
+					     "Cache mode mismatch for %s\n", test_cases[i].name);
+				gem_close(dev->fd, alloc_req.handle);
+				continue;
+			}
+
 			/* Verify the cache mode flag is set */
 			igt_assert_f((info_req.value & MSM_BO_CACHE_MASK) == test_cases[i].flags,
 				     "Cache mode mismatch for %s\n", test_cases[i].name);
@@ -375,6 +330,49 @@ int igt_main()
 		}
 	}
 
+	/* Buffer Information Tests - Negative Cases */
+	igt_describe("Get offset for invalid handle (expects ENOENT)");
+	igt_subtest("bo-get-offset-invalid") {
+		struct drm_msm_gem_info req = { 0 };
+
+		req.handle = 0xDEADBEEF; /* Invalid handle */
+		req.info = MSM_INFO_GET_OFFSET;
+
+		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req, ENOENT);
+
+		igt_info("Correctly rejected invalid handle with ENOENT\n");
+	}
+
+	igt_describe("Get IOVA for invalid handle (expects ENOENT)");
+	igt_subtest("bo-get-iova-invalid") {
+		struct drm_msm_gem_info req = { 0 };
+
+		req.handle = 0xDEADBEEF; /* Invalid handle */
+		req.info = MSM_INFO_GET_IOVA;
+
+		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req, ENOENT);
+
+		igt_info("Correctly rejected invalid handle with ENOENT\n");
+	}
+
+	igt_describe("Use invalid info type (expects EINVAL)");
+	igt_subtest("bo-invalid-info-type") {
+		struct msm_bo *bo;
+		struct drm_msm_gem_info req = { 0 };
+
+		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
+		igt_assert_f(bo, "Failed to allocate buffer object\n");
+
+		req.handle = bo->handle;
+		req.info = 0xFFFFFFFF; /* Invalid info type */
+
+		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req, EINVAL);
+
+		igt_info("Correctly rejected invalid info type with EINVAL\n");
+
+		igt_msm_bo_free(bo);
+	}
+
 	igt_fixture() {
 		igt_msm_dev_close(dev);
 	}
-- 
2.34.1

