Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7250AC43327
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jul 2026 09:15:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C29410E4A5;
	Thu,  2 Jul 2026 09:15:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XixNrtYn";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A24110E48D
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jul 2026 09:14:36 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6624iBk63591072
 for <igt-dev@lists.freedesktop.org>; Thu, 2 Jul 2026 09:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=xE/UEvKemvXVBkq+JNgbi7qAA0rNdbsUjEs
 OnMeuOCM=; b=XixNrtYnh8XScRDO3TKJ3jnos2osCgXdDC4h5ehwlYPBlGAxoNy
 72KKrrOFktgpk0SIjuMTaqAKeNs+vGJCIVMx1Q/AEZBflCGk1Gw8iVKPShy/0VgJ
 QkPIPjK43goM8DJehzzf/rS87vCHVe2BnY5YlnRqkkRIF/EXjYapJAkKpjTciq8l
 0S6dUHCDiCV3O7cF6fSWKRWwoZnhNei5POyYaEgZNLFk0s/sDAZvfP+rTr17NAQN
 8NkTmsr0svufzCGL2gaXh+AP0XeUrtbq65VWV2C1aBj1b4vDKgz125QQVud/F4ud
 UY1Wb5zZ6ZoRGLs6CkOs8qwiEira5nc/v7Q==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h7n8yu0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Thu, 02 Jul 2026 09:14:35 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6629EVTG028893; 
 Thu, 2 Jul 2026 09:14:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4f27kkew20-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Thu, 02 Jul 2026 09:14:31 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6629EV7t028883
 for <igt-dev@lists.freedesktop.org>; Thu, 2 Jul 2026 09:14:31 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-jvignan-hyd.qualcomm.com
 [10.147.241.47])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6629EUOB028881
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2026 09:14:31 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4601609)
 id 1E02F9F2; Thu,  2 Jul 2026 14:44:30 +0530 (+0530)
From: Jitta Vignan <jvignan@qti.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: Jitta Vignan <jvignan@qti.qualcomm.com>
Subject: [PATCH i-g-t 1/2] tests/msm: fix BO allocation tests to use explicit
 cache flags
Date: Thu,  2 Jul 2026 14:43:50 +0530
Message-Id: <20260702091351.96324-1-jvignan@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5NSBTYWx0ZWRfXxD01/lGAeY+9
 8IHeNSG17HIl1hVpqRJl0xLjU6O3PAIJgWs3hFbx7UwG442/lGgUbMSQPMhwuJxAb2Dhd7MXkO5
 wfb90nYN+m7oB/hTM3MW0hXk3iVps839yLrG6VMGSniMyeNMXzN76lbsi6xzBLzjIfeptbk5JqM
 ZzYJI4G94StE3mmYGnSxp1jwuf1KaHjPl1bjPavgEMfahX7gzp1pZul9sPljvMzK3IcK7eLX2zp
 Dgj1weZEZGCrux8fZKjnLOzlDT53s5Gw1z714CCrtmO7ylGd7ZxyR9gDm9oKe2TaCHmVzxdbmbD
 nBaoO5wmt/A5lOlR1O/cJkGOb+fir8xRTehobujspbLsbapmd5kUtaNFzJ039qvvUANv2ot9joj
 FFifh6XIQ8Z0xVWhGjxOGEoHSIaayJGUO7nBMcMwynY/ILHRITCi5ZfgHoSVOHB4iNFEHRlB/LG
 4mGSA3VK/cfcJy6xE1Q==
X-Proofpoint-ORIG-GUID: -be4IDbuHsLeJpQZm0XHFm6TkKQkb2oo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5NSBTYWx0ZWRfX6ARLmp/qE+cK
 GafRoe7QKCrG+N2By31RMZV6YUeuTAcOm6GwwExenMmDn4C+TTJqXU971V+/w49xMeD2O1P54xI
 3E9XsMDBi0Zo9ioTgQXJ8EDRfS01sCI=
X-Proofpoint-GUID: -be4IDbuHsLeJpQZm0XHFm6TkKQkb2oo
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a462bfb cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=otFFAIC2sN0gi3Ff4ZQA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
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

Use explicit cache mode flags (MSM_BO_WC) instead of flags=0 in BO
allocation tests to match current kernel requirements.

Also update bo-alloc-uncached to use a raw GEM_NEW ioctl so the
deprecated MSM_BO_UNCACHED flag can be handled gracefully without
triggering helper assertions. The test now accepts either successful
allocation or EINVAL on kernels where the flag is no longer supported.

Signed-off-by: Jitta Vignan <jvignan@qti.qualcomm.com>
---
 tests/msm/msm_bo.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/tests/msm/msm_bo.c b/tests/msm/msm_bo.c
index 131b43bfa..f296ad9ae 100644
--- a/tests/msm/msm_bo.c
+++ b/tests/msm/msm_bo.c
@@ -9,8 +9,8 @@
 #include "igt_msm.h"
 
 /*
- * Tests for MSM buffer object allocation
- * Tests DRM_IOCTL_MSM_GEM_NEW functionality
+ * Tests for MSM buffer object allocation and information
+ * Tests DRM_IOCTL_MSM_GEM_NEW and DRM_IOCTL_MSM_GEM_INFO functionality
  */
 
 #define DEFAULT_BUFFER_SIZE 4096
@@ -28,7 +28,7 @@ int igt_main()
 	igt_subtest("bo-alloc-basic") {
 		struct msm_bo *bo;
 
-		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, 0);
+		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
 		igt_assert_f(bo, "Failed to allocate buffer object\n");
 		igt_assert_f(bo->handle != 0, "Buffer object handle is 0\n");
 		igt_assert_f(bo->size == DEFAULT_BUFFER_SIZE,
@@ -49,15 +49,22 @@ int igt_main()
 		igt_msm_bo_free(bo);
 	}
 
-	igt_describe("Test uncached buffer object allocation");
+	igt_describe("Test uncached buffer object allocation (deprecated flag)");
 	igt_subtest("bo-alloc-uncached") {
-		struct msm_bo *bo;
-
-		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_UNCACHED);
-		igt_assert_f(bo, "Failed to allocate uncached buffer object\n");
-		igt_assert_f(bo->handle != 0, "Buffer object handle is 0\n");
+		struct drm_msm_gem_new req = { 0 };
+		int ret;
 
-		igt_msm_bo_free(bo);
+		req.size = DEFAULT_BUFFER_SIZE;
+		req.flags = MSM_BO_UNCACHED;
+
+		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_NEW, &req);
+		if (ret == 0) {
+			igt_info("MSM_BO_UNCACHED supported on this kernel\n");
+			gem_close(dev->fd, req.handle);
+		} else {
+			igt_assert_eq(errno, EINVAL);
+			igt_info("MSM_BO_UNCACHED not supported (deprecated)\n");
+		}
 	}
 
 	igt_describe("Test allocation with zero size (should fail)");
@@ -86,7 +93,7 @@ int igt_main()
 		struct msm_bo *bo;
 		size_t size = DEFAULT_BUFFER_SIZE - 3; /* Unaligned size */
 
-		bo = igt_msm_bo_new(dev, size, 0);
+		bo = igt_msm_bo_new(dev, size, MSM_BO_WC);
 		igt_assert_f(bo, "Failed to allocate buffer with unaligned size\n");
 		igt_assert_f(bo->handle != 0, "Buffer object handle is 0\n");
 
-- 
2.34.1

