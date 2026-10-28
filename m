Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC79606A31C
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 15:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MW+IZiqQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FDA610FD45;
	Wed, 28 Oct 2026 15:18:46 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6536C10FD36
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 15:17:45 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69SFA3JN599998; Wed, 28 Oct 2026 15:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=GqnDf9stFFW
 w6lt+iAxOp/eeZDBXrL7vp58M5cC7GSA=; b=MW+IZiqQgN795BB9JUBoERlGB/Y
 e2tnVvk9I/LL4yrhJWAgfcEcccLF/olUQF+gxqzWoh2XVJtAYfVvuyp0Oi0SDy97
 NJvLBMkowpv/lcO7ZkvA2hmS5s1PdO4sr4bsCD65dfNHCM/MPK1iDFljgCrMFzZr
 DGOcQi4urwRhZnswruSjp9h7EU12ov9D93efZHmJrk5ljck4PfUW1+adKPzCN4cg
 iieKO4rhUDJ7lgtCIDajcU+j+MqRg4BLKXlkXvUAGQh6uyWhNhvd5u/T2nU/C27k
 fJK6FXyEZyn8KeGWRI8r+S1Nogtl2u/dOqZwZ0IHXzW4ngI3MUmnEBbP7HA==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6f934k8-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2026 15:17:44 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id
 69SFG7gT1754821; Wed, 28 Oct 2026 15:16:07 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-jvignan-hyd.qualcomm.com
 [10.147.241.47])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 69SFG6lQ1754811
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2026 15:16:07 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4601609)
 id 441FE9FD; Wed, 28 Oct 2026 20:46:06 +0530 (+0530)
From: Jitta Vignan <jvignan@qti.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: robclark@qti.qualcomm.com, akhilpo@qti.qualcomm.com,
 kamil.konieczny@linux.intel.com, Jitta Vignan <jvignan@qti.qualcomm.com>
Subject: [PATCH i-g-t v2 2/2] tests/msm/msm_bo: Add CACHED_COHERENT allocation
 test
Date: Wed, 28 Oct 2026 20:45:59 +0530
Message-Id: <20261028151559.4069953-3-jvignan@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028151559.4069953-1-jvignan@qti.qualcomm.com>
References: <20261028151559.4069953-1-jvignan@qti.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=frhJ914f c=1 sm=1 tr=0 ts=6ae21218 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=P4HdPijuAAAA:8
 a=MkIVKpz3S4HxGcY6SdgA:9 a=1IMGb3bCqdfsKX6cDv2x:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MCBTYWx0ZWRfX8aY7gxkLN4+o
 SRPNFoOjSbmCiKfLk7GB9gAQjl1CWWyJikYQE4ZeN6mYwcJGk9m0zCs1S4igCQQf2xCKH3uNB/S
 aoGpZbdlJ98ey3Svwe+GGtY8KHO5PXM=
X-Proofpoint-GUID: 493BhwKvKAHyzstNc4ZIiYvMBqupvodR
X-Proofpoint-ORIG-GUID: 493BhwKvKAHyzstNc4ZIiYvMBqupvodR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MCBTYWx0ZWRfX8bv1nO4nkPLG
 PvKEBxNcoQyz9SzKpCfoBxL5vPgFwqEhD/7r1VtcLZ4GryXjO0thTzPrY4WBiVXB7jDQfLAQYsz
 qALJ8B3D/MCL/xlpL6vjPKPYA78kD8F4Q3LtlCP+quZ4oDZ6vm6he7nGO5Xq1r5dPf/YI1L+vwP
 MgMlpol2m9glRMHJWbmIo/rvOENeQ3irKTtOrdLLU0KxYwpgw/g8f7lORHvtm0An9RxcEAOGExY
 sywvNIrBWQ2Fz5duHLb9APCzidXY9ku1N1IxBDK6eR9pbpVXMdsuHmlirThpihUagv69QzGkdaD
 AesgbdG5jajdJ6Vvkt0WymzyUqsB9rbWtK6HDQ44nTs6xpPSZzRe8s5GFAIhLh+4DTXJR71mvs3
 eTj8xVJQa9aE5O4sY3J8gGTuep8/Cg5lJ+uWCRrgozVvpX0VvrPg4YTj57FzkQ8MSPahwG2aat1
 N6oLcWUFUHSzbWGV+gQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280060
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
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/msm/msm_bo.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tests/msm/msm_bo.c b/tests/msm/msm_bo.c
index 94714dfc7..3257697f5 100644
--- a/tests/msm/msm_bo.c
+++ b/tests/msm/msm_bo.c
@@ -95,6 +95,45 @@ int igt_main()
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

