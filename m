Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F06C43458
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jul 2026 09:15:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5429010E4A5;
	Thu,  2 Jul 2026 09:15:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iqzcmaYV";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7436310E48D
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jul 2026 09:14:36 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6624lXB03485590
 for <igt-dev@lists.freedesktop.org>; Thu, 2 Jul 2026 09:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=KEoz41lHJZH
 8LY/ebO43Ndq7QzHmKQl7AoZ2Lw9QnIA=; b=iqzcmaYVXeOVUjosQvtPtqfZVSy
 p/5wIoP9zTxQQv5W56PgiPi7uNFFYmCglZKvVBJIK/5QWNVXoj2BuHpbOeB7rT/w
 2yWiqDHMlifD1Q5dXtmPgJOPjhcTDw75O8Bu2vC6a3T46+1P2Op2nrE1W/xOb/+S
 wKIJDhZaMmL98QGV/XnooBFaVWgHTTJ3qRCU9mnEJ9izE5nBtSd/YyvrBwZtsv2W
 S+Tzh5IU41fnhbHuNBpqsiciXVC1wrN+Rs+QmkLlokKVZtvvZaPHSl5+7IMzHQp+
 KmTysMayZcILaYBEoEn8feIaoFOjO26arvz+2551+ApYeSDGx/7H/Yw4F1g==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h98gxgg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Thu, 02 Jul 2026 09:14:35 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6629EVFm028894; 
 Thu, 2 Jul 2026 09:14:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4f27kkew21-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Thu, 02 Jul 2026 09:14:31 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6629EVNF028884
 for <igt-dev@lists.freedesktop.org>; Thu, 2 Jul 2026 09:14:31 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-jvignan-hyd.qualcomm.com
 [10.147.241.47])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6629EU4T028882
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2026 09:14:31 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4601609)
 id 2157A9EF; Thu,  2 Jul 2026 14:44:30 +0530 (+0530)
From: Jitta Vignan <jvignan@qti.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: Jitta Vignan <jvignan@qti.qualcomm.com>
Subject: [PATCH i-g-t 2/2] tests/msm: extend BO tests to cover GEM_INFO and
 cache flags
Date: Thu,  2 Jul 2026 14:43:51 +0530
Message-Id: <20260702091351.96324-2-jvignan@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260702091351.96324-1-jvignan@qti.qualcomm.com>
References: <20260702091351.96324-1-jvignan@qti.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: THt8vm0qxWBKB2C7PKSG3zqQ-eOlzHZ3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5NSBTYWx0ZWRfX5DKBdN6X+h3b
 kuo7jIQg0ZLkV+84QEWZH/JP2wIA71mcUG+31U+NEyAOGK1lEFyjzTT1mYaiVS+gFkK7o4XE8sN
 a3M72dGwqGj6g+PjlxSBi70QOb93O2ISx9F3qZCZtiQ/C5iO3fbUc2zuEckhBJSKbyReHLCtnUn
 N2giUCWlgoBBOAVcxle/DjLMpMevf2QSxjaj+NqMuuUFNyW3RIYcburs4rC8HAeMsF3yxhhAnCs
 r+Fo3UqzOY5bqNvJ01rIDd/UQEXDogQvr23TkQoSdPXSWy9ONCFVGd8KLKHf8T9FZjFqOgcFNx0
 e8nxI4nWOW+VgsHOWoDXob+x9ZXPSlFuDE3AVdyyT4CPlpQ6dUe7vc6vnDOC0b/1vrKEJgiO+7p
 41MyszvwnqCMOx0u4Js+skZOe3HUojaPqIkmZ9kCKWbDhKUVbPr58VOHf9nU9K+7Sze1atxUUS5
 J/tWFHhoFYHY0BqpEFA==
X-Proofpoint-GUID: THt8vm0qxWBKB2C7PKSG3zqQ-eOlzHZ3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5NSBTYWx0ZWRfXzk2gGxxh8Hwl
 jzKBGjjqGyPp5tDBk9rM498uXcBXZ65DdmBmn29ySk0ffJD1EMnzH9FkfkfF6zeoBx5ahRv/lhQ
 ec36oAUACwRjRcxv76xLobqzVfU7YBM=
X-Authority-Analysis: v=2.4 cv=bdFbluPB c=1 sm=1 tr=0 ts=6a462bfb cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=bXoCVvWqAAAA:8 a=eNdCRo1EAAAA:8
 a=-V3qFfG-AAAA:8 a=P4HdPijuAAAA:8 a=Pdlrqv5KvG3MHOlqingA:9
 a=xWGLF9RxxNN1Vkn1tT4a:22 a=9CdoGpzcA5G54dkw0Jc4:22 a=gHywaRj4oT_pvwrYb9ct:22
 a=1IMGb3bCqdfsKX6cDv2x:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1011 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020095
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

Add DRM_IOCTL_MSM_GEM_INFO test coverage for:

- GET_OFFSET on valid BOs
- GET_IOVA on valid BOs
- GET_FLAGS on valid BOs
- Invalid handle handling (ENOENT)
- Invalid info type handling (EINVAL)
- Offset consistency across repeated queries
- IOVA consistency across repeated queries
- Information queries for multiple BOs
- Unique IOVA validation across multiple BOs
- Cache mode flag verification across supported BO types

Also update the file header comment to reflect the expanded
DRM_IOCTL_MSM_GEM_INFO coverage.

Signed-off-by: Jitta Vignan <jvignan@qti.qualcomm.com>
---
 tests/msm/msm_bo.c | 275 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 275 insertions(+)

diff --git a/tests/msm/msm_bo.c b/tests/msm/msm_bo.c
index f296ad9ae..8cc2ebf9e 100644
--- a/tests/msm/msm_bo.c
+++ b/tests/msm/msm_bo.c
@@ -99,6 +99,281 @@ int igt_main()
 
 		igt_msm_bo_free(bo);
 	}
+		igt_describe("Get offset for valid BO");
+	igt_subtest("bo-get-offset-valid") {
+		struct msm_bo *bo;
+		struct drm_msm_gem_info req = { 0 };
+		int ret;
+
+		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
+		igt_assert_f(bo, "Failed to allocate buffer object\n");
+
+		req.handle = bo->handle;
+		req.info = MSM_INFO_GET_OFFSET;
+
+		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req);
+		igt_assert_eq(ret, 0);
+		igt_assert_f(req.value != 0, "Got zero offset for valid BO\n");
+
+		igt_info("BO handle %u: offset = 0x%llx\n", bo->handle,
+			 (unsigned long long)req.value);
+
+		igt_msm_bo_free(bo);
+	}
+
+	igt_describe("Get IOVA for valid BO");
+	igt_subtest("bo-get-iova-valid") {
+		struct msm_bo *bo;
+		struct drm_msm_gem_info req = { 0 };
+		int ret;
+
+		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
+		igt_assert_f(bo, "Failed to allocate buffer object\n");
+
+		req.handle = bo->handle;
+		req.info = MSM_INFO_GET_IOVA;
+
+		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req);
+		igt_assert_eq(ret, 0);
+		igt_assert_f(req.value != 0, "Got zero IOVA for valid BO\n");
+
+		igt_info("BO handle %u: IOVA = 0x%llx\n", bo->handle,
+			 (unsigned long long)req.value);
+
+		/* Verify IOVA matches what's stored in bo structure */
+		igt_assert_eq_u64(req.value, bo->iova);
+
+		igt_msm_bo_free(bo);
+	}
+
+	igt_describe("Get flags for valid BO");
+	igt_subtest("bo-get-flags") {
+		struct msm_bo *bo;
+		struct drm_msm_gem_info req = { 0 };
+		int ret;
+		uint32_t test_flags = MSM_BO_WC | MSM_BO_GPU_READONLY;
+
+		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, test_flags);
+		igt_assert_f(bo, "Failed to allocate buffer object\n");
+
+		req.handle = bo->handle;
+		req.info = MSM_INFO_GET_FLAGS;
+
+		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req);
+		igt_assert_eq(ret, 0);
+
+		igt_info("BO handle %u: flags = 0x%llx (expected 0x%x)\n",
+			 bo->handle, (unsigned long long)req.value, test_flags);
+
+		/* Verify flags match what we requested */
+		igt_assert_eq_u64(req.value & test_flags, test_flags);
+
+		igt_msm_bo_free(bo);
+	}
+
+	/* Buffer Information Tests - Negative Cases */
+	igt_describe("Get offset for invalid handle (expects ENOENT)");
+	igt_subtest("bo-get-offset-invalid") {
+		struct drm_msm_gem_info req = { 0 };
+		int ret;
+
+		req.handle = 0xDEADBEEF; /* Invalid handle */
+		req.info = MSM_INFO_GET_OFFSET;
+
+		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req);
+		igt_assert_eq(ret, -1);
+		igt_assert_eq(errno, ENOENT);
+
+		igt_info("Correctly rejected invalid handle with ENOENT\n");
+	}
+
+	igt_describe("Get IOVA for invalid handle (expects ENOENT)");
+	igt_subtest("bo-get-iova-invalid") {
+		struct drm_msm_gem_info req = { 0 };
+		int ret;
+
+		req.handle = 0xDEADBEEF; /* Invalid handle */
+		req.info = MSM_INFO_GET_IOVA;
+
+		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req);
+		igt_assert_eq(ret, -1);
+		igt_assert_eq(errno, ENOENT);
+
+		igt_info("Correctly rejected invalid handle with ENOENT\n");
+	}
+
+	igt_describe("Use invalid info type (expects EINVAL)");
+	igt_subtest("bo-invalid-info-type") {
+		struct msm_bo *bo;
+		struct drm_msm_gem_info req = { 0 };
+		int ret;
+
+		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
+		igt_assert_f(bo, "Failed to allocate buffer object\n");
+
+		req.handle = bo->handle;
+		req.info = 0xFFFFFFFF; /* Invalid info type */
+
+		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req);
+		igt_assert_eq(ret, -1);
+		igt_assert_eq(errno, EINVAL);
+
+		igt_info("Correctly rejected invalid info type with EINVAL\n");
+
+		igt_msm_bo_free(bo);
+	}
+
+	/* Additional Buffer Information Tests */
+	igt_describe("Verify offset consistency across multiple queries");
+	igt_subtest("bo-get-offset-consistency") {
+		struct msm_bo *bo;
+		struct drm_msm_gem_info req1 = { 0 }, req2 = { 0 };
+		int ret;
+
+		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
+		igt_assert_f(bo, "Failed to allocate buffer object\n");
+
+		/* First query */
+		req1.handle = bo->handle;
+		req1.info = MSM_INFO_GET_OFFSET;
+		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req1);
+		igt_assert_eq(ret, 0);
+
+		/* Second query */
+		req2.handle = bo->handle;
+		req2.info = MSM_INFO_GET_OFFSET;
+		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req2);
+		igt_assert_eq(ret, 0);
+
+		/* Verify consistency */
+		igt_assert_eq_u64(req1.value, req2.value);
+		igt_info("Offset consistent across queries: 0x%llx\n",
+			 (unsigned long long)req1.value);
+
+		igt_msm_bo_free(bo);
+	}
+
+	igt_describe("Verify IOVA consistency across multiple queries");
+	igt_subtest("bo-get-iova-consistency") {
+		struct msm_bo *bo;
+		struct drm_msm_gem_info req1 = { 0 }, req2 = { 0 };
+		int ret;
+
+		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
+		igt_assert_f(bo, "Failed to allocate buffer object\n");
+
+		/* First query */
+		req1.handle = bo->handle;
+		req1.info = MSM_INFO_GET_IOVA;
+		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req1);
+		igt_assert_eq(ret, 0);
+
+		/* Second query */
+		req2.handle = bo->handle;
+		req2.info = MSM_INFO_GET_IOVA;
+		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req2);
+		igt_assert_eq(ret, 0);
+
+		/* Verify consistency */
+		igt_assert_eq_u64(req1.value, req2.value);
+		igt_info("IOVA consistent across queries: 0x%llx\n",
+			 (unsigned long long)req1.value);
+
+		igt_msm_bo_free(bo);
+	}
+
+	igt_describe("Test getting info for multiple BOs");
+	igt_subtest("bo-get-info-multiple") {
+		struct msm_bo *bo1, *bo2, *bo3;
+		struct drm_msm_gem_info req = { 0 };
+		int ret;
+
+		/* Allocate multiple BOs */
+		bo1 = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
+		bo2 = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE * 2, MSM_BO_WC);
+		bo3 = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE * 4, MSM_BO_CACHED);
+
+		igt_assert_f(bo1 && bo2 && bo3, "Failed to allocate BOs\n");
+
+		/* Get info for each BO */
+		req.handle = bo1->handle;
+		req.info = MSM_INFO_GET_IOVA;
+		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req);
+		igt_assert_eq(ret, 0);
+		igt_info("BO1 IOVA: 0x%llx\n", (unsigned long long)req.value);
+
+		req.handle = bo2->handle;
+		req.info = MSM_INFO_GET_IOVA;
+		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req);
+		igt_assert_eq(ret, 0);
+		igt_info("BO2 IOVA: 0x%llx\n", (unsigned long long)req.value);
+
+		req.handle = bo3->handle;
+		req.info = MSM_INFO_GET_IOVA;
+		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req);
+		igt_assert_eq(ret, 0);
+		igt_info("BO3 IOVA: 0x%llx\n", (unsigned long long)req.value);
+
+		/* Verify IOVAs are different */
+		igt_assert_neq_u64(bo1->iova, bo2->iova);
+		igt_assert_neq_u64(bo2->iova, bo3->iova);
+		igt_assert_neq_u64(bo1->iova, bo3->iova);
+
+		igt_msm_bo_free(bo1);
+		igt_msm_bo_free(bo2);
+		igt_msm_bo_free(bo3);
+	}
+
+	igt_describe("Test getting flags for BOs with different cache modes");
+	igt_subtest("bo-get-flags-cache-modes") {
+		struct {
+			uint32_t flags;
+			const char *name;
+			bool may_fail; /* Some flags may not be supported */
+		} test_cases[] = {
+			{ MSM_BO_CACHED, "CACHED", false },
+			{ MSM_BO_WC, "WC", false },
+			{ MSM_BO_UNCACHED, "UNCACHED", true }, /* Deprecated */
+			{ MSM_BO_CACHED_COHERENT, "CACHED_COHERENT", true }, /* May not be supported */
+		};
+
+		for (int i = 0; i < ARRAY_SIZE(test_cases); i++) {
+			struct drm_msm_gem_new alloc_req = { 0 };
+			struct drm_msm_gem_info info_req = { 0 };
+			int ret;
+
+			alloc_req.size = DEFAULT_BUFFER_SIZE;
+			alloc_req.flags = test_cases[i].flags;
+
+			ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_NEW, &alloc_req);
+
+			if (ret != 0) {
+				if (test_cases[i].may_fail && errno == EINVAL) {
+					igt_info("%s BO not supported (EINVAL)\n", test_cases[i].name);
+					continue;
+				}
+				igt_assert_f(false, "Failed to allocate %s BO: %s\n",
+					     test_cases[i].name, strerror(errno));
+			}
+
+			info_req.handle = alloc_req.handle;
+			info_req.info = MSM_INFO_GET_FLAGS;
+
+			ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &info_req);
+			igt_assert_eq(ret, 0);
+
+			igt_info("%s BO flags: 0x%llx (expected 0x%x)\n",
+				 test_cases[i].name,
+				 (unsigned long long)info_req.value,
+				 test_cases[i].flags);
+
+			/* Verify the cache mode flag is set */
+			igt_assert_f((info_req.value & MSM_BO_CACHE_MASK) == test_cases[i].flags,
+				     "Cache mode mismatch for %s\n", test_cases[i].name);
+
+			gem_close(dev->fd, alloc_req.handle);
+		}
+	}
 
 	igt_fixture() {
 		igt_msm_dev_close(dev);
-- 
2.34.1

