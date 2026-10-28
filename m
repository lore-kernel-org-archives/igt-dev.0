Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95AC606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 10:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HONtSVfu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A06E10E629;
	Wed, 28 Oct 2026 10:27:03 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1150410FB09
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 10:26:08 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69S8Jxb2611868
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 10:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=CixjOQYg/tC
 69e5DfjC49BZa7LjVC1BKkpZ9OYUcbPA=; b=HONtSVfu0PF2+CEoEdUCOYikso7
 yvS0McXGkKH5m7Fd/+N0PFjRH9nc+V/2OQsp4SMAvB8sDAt05pVsL/ygVeTP2cSe
 J7bKzWViKsu9w+z3djEKqgTndR9byGZ3AU+8PL2emTdkSkvP4556bgZUQOw2VaAH
 4h127FEw/68E2v8+Vx/pLR147XRiHOF87AYq8Wf1QbxyaiRW6tVgOaPaZa5VAtef
 jyV3ov6bBMIiQaorEdW265JOJNVM+Wivn3P3/MPI6aEVPrFGhZBqkFEx+Q8qhjo0
 /q6Q9LyZZC7xbgOUQaxqVf6mkb+ilJn39HtcSPItm51gNMHKdDVvWQckBHQ==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhw8wtb-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 10:26:07 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id
 69SANsxk529274
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 10:26:05 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-jvignan-hyd.qualcomm.com
 [10.147.241.47])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 69SAQ4YX532942
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2026 10:26:04 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4601609)
 id 23B8BA03; Wed, 28 Oct 2026 15:56:04 +0530 (+0530)
From: Jitta Vignan <jvignan@qti.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: robclark@qti.qualcomm.com, akhilpo@qti.qualcomm.com,
 Jitta Vignan <jvignan@qti.qualcomm.com>
Subject: [PATCH i-g-t 2/2] tests/msm/msm_bo: Add CACHED_COHERENT allocation
 test
Date: Wed, 28 Oct 2026 15:55:52 +0530
Message-Id: <20261028102552.3836144-3-jvignan@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028102552.3836144-1-jvignan@qti.qualcomm.com>
References: <20261028102552.3836144-1-jvignan@qti.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: kKXnIH9C4M8btfOtYCORegqv0tdewTSZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MSBTYWx0ZWRfX1065fwSyDSfO
 8cgLaT1cHlnlMM0L6UK9ggEjvRdcylNtu7HAxC9jKPVJsej6g1GNQV0LfrguCrUQ/z4iz7KtF/0
 DDyZV9jw4xCCuUX0b6PFjpRZJBnfw+c=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae1cdbf cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=P4HdPijuAAAA:8
 a=MkIVKpz3S4HxGcY6SdgA:9 a=1IMGb3bCqdfsKX6cDv2x:22
X-Proofpoint-ORIG-GUID: kKXnIH9C4M8btfOtYCORegqv0tdewTSZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MSBTYWx0ZWRfX57ZopDGRFz7W
 RtHsI7ltl4peHnb8ToXJvPo1zLFIrVmMgXoV5u0WT/2DDSNZFqLoQXdCZZajwz5zl3td4x1xcLn
 8W1ESvf4pK9IhxJn1W0xhbr7QOjYFyJg3w5ZoL7vYL1uNJ6desSH0GVQHbKmy//IJkSSBW/fCOq
 3+pz8tj8Ec2LT1o/w6q/meDO9yjVOBBoVzjlZS3o84wg/KpVqBD+qp+abmcVbNo7l2E/4vovbus
 9m8Md6HNQrNtSjuB7nvH5Q5BjTUQlBB87FjYJ8hdqgZhqAlYNP3sY9hMnyuPkV2hyPNcsGWg8c4
 ziZvRtq85rqRzrM2RE+6IOnZS8gKGHo8TFBtK88mDD1mBJYk5iMNGZnjesvqbQgZ3Svmp2pK0jO
 dCq6nX89lpIxr3QNmcsIbT+zEOgL+QN26ytvXQIiRleYkduEvOgyF9rGGgqnstFcJXQwxssskT/
 +rolJc2lsPLf2zRzCHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
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

Add coverage for MSM_BO_CACHED_COHERENT buffer allocation on
supported A6xx and newer GPUs. Verify the reported cache mode using
MSM_INFO_GET_FLAGS and handle unsupported configurations gracefully.

Signed-off-by: Jitta Vignan <jvignan@qti.qualcomm.com>
---
 tests/msm/msm_bo.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tests/msm/msm_bo.c b/tests/msm/msm_bo.c
index 885382825..f16e8d0ad 100644
--- a/tests/msm/msm_bo.c
+++ b/tests/msm/msm_bo.c
@@ -93,6 +93,45 @@ int igt_main()
 		igt_msm_bo_free(bo);
 	}
 
+	igt_describe("Test MSM_BO_CACHED_COHERENT on A6xx+ GPUs");
+	igt_subtest("bo-alloc-cached-coherent") {
+		struct drm_msm_gem_new req = { 0 };
+		int ret;
+
+		/* MSM_BO_CACHED_COHERENT is only supported on A6xx and newer GPUs */
+		igt_require(dev->gen >= 6);
+
+		req.size = DEFAULT_BUFFER_SIZE;
+		req.flags = MSM_BO_CACHED_COHERENT;
+
+		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_NEW, &req);
+
+		if (ret == 0) {
+			struct drm_msm_gem_info info_req = { 0 };
+
+			igt_info("MSM_BO_CACHED_COHERENT supported on A%dxx GPU\n", dev->gen);
+
+			/* Verify flags */
+			info_req.handle = req.handle;
+			info_req.info = MSM_INFO_GET_FLAGS;
+			ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &info_req);
+			igt_assert_eq(ret, 0);
+
+			igt_assert_f((info_req.value & MSM_BO_CACHE_MASK) == MSM_BO_CACHED_COHERENT,
+				     "Cache mode mismatch for CACHED_COHERENT\n");
+
+			igt_info("CACHED_COHERENT BO flags: 0x%llx (expected 0x%x)\n",
+				 (unsigned long long)info_req.value,
+				 MSM_BO_CACHED_COHERENT);
+
+			gem_close(dev->fd, req.handle);
+		} else {
+			igt_assert_eq(errno, EINVAL);
+			igt_info("MSM_BO_CACHED_COHERENT not supported on A%dxx GPU "
+				 "(EINVAL)\n", dev->gen);
+		}
+	}
+
 	/* Buffer Information Tests - Positive Cases */
 	igt_describe("Get offset for valid BO");
 	igt_subtest("bo-get-offset-valid") {
-- 
2.34.1

