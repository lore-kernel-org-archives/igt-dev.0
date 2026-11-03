Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176E9606A333
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 17:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e9Y+/0EX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72DD510E395;
	Tue,  3 Nov 2026 17:14:43 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B6210E395
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 17:13:30 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A3F6Weh1576749; Tue, 3 Nov 2026 17:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=1QxSyNAYpFkLPhwdk0zdKLBFXn/8knDkzEE
 KGdLLhxE=; b=e9Y+/0EX437W9g5rBHIr60zFNlRV2wKDxXq3qeT1S8RUrpHlB50
 S3ibWL284bSp1WlatTne2GHGsG/Ir74xa8xrCfuShddJDzZRxjRRGlgzqON9DhPU
 q1q+X2DmIY9VPCsInCWv3/Wl5UB0ZNDV7hvB0gjDg0bkSJLVHOSkAS/SsetTwU/U
 pmHrvB9MYxY5kboZtN0jk6PQ5bEXV1cIMIIKGqRqOSsurHjlitr2KyT74yv0J00T
 TfzeLXMphqnA5GHH1PFOzFoDLQqmdcUkhgLML9cOS38VYXgWQJUShzw5vC/9ePLo
 z/SPJWp+iv0pPgElJ53JyioShIVJHJWlTGQ==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhyd0je5-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 03 Nov 2026 17:13:29 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A3HDQ4x1125490; Tue, 3 Nov 2026 17:13:26 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-jvignan-hyd.qualcomm.com
 [10.147.241.47])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6A3HDPdl1125485
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 03 Nov 2026 17:13:25 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4601609)
 id 7A5C5A1E; Tue,  3 Nov 2026 22:43:24 +0530 (+0530)
From: Jitta Vignan <jvignan@qti.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: robclark@qti.qualcomm.com, akhilpo@qti.qualcomm.com,
 kamil.konieczny@linux.intel.com, spatraya@qti.qualcomm.com,
 Jitta Vignan <jvignan@qti.qualcomm.com>
Subject: [PATCH i-g-t v2 0/2] tests/msm/msm_bo: Add mapping and free tests
Date: Tue,  3 Nov 2026 22:43:20 +0530
Message-Id: <20261103171322.2729929-1-jvignan@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=bp/Zl0ai c=1 sm=1 tr=0 ts=6aea1639 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=jVB65U6-v9lujuievZMA:9
X-Proofpoint-GUID: Bke6FwNj7FoNbs6-xg_UIdZigwt8jKt1
X-Proofpoint-ORIG-GUID: Bke6FwNj7FoNbs6-xg_UIdZigwt8jKt1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2OCBTYWx0ZWRfXwVCd4yoR3cnI
 Dm23AuG9fOGTBc6FnPiS3ymPgIAr1QnvIHNChlzg8DFOL98hIDIqdl9IBtxUNS6XB3g7I51O5Go
 HfBKywSuk/dKUEWD3v4s5uju7lTzLZw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2OCBTYWx0ZWRfX0pPu/019+Hu7
 2wy2KiHKj2Wv0ONzzlz5+flAWP7bDW2mnvSMis9IoihnAhDWPPkuhXxk0Rd0cJ17TS86JbwTD9+
 h4rsI0xv8TBxMVlaGk3XYlZYQ4s5C6X6u+kxZWnUX8Ti+qrDwEpOohLZzz46gwRvz9A3MoPU4G9
 k968MDfOMpH87cqvRPb+H+DUEjCUr6dm1x0jDdNGj4Uy+kQqWlxszfS5N9koK12xZGkjAy4pZBr
 J41ThASII+2d4f/zbHNGJGpn/wgHTaUMycg/6KemzcSqgkKlk4YdDTxVVLdZ7zd7Do9OG9v2zzF
 sHB44UsLs7AMNV79rxGgvMNW9dOBs9sZO9jZXrtdJQAXSuKUhhiaQTP1cOo/LH4yoiTn85uFjn6
 QpFURwDeh8JOuP9m8btLorfhr4m4p+z5o/COWI45KSC+PDpsoJJNFYowDxAswqGflqkDVJCQkR1
 A5P1jOHAeEL56hb5csg==
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
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Extend MSM buffer object coverage with mapping and free operations.

Add positive and negative coverage for buffer mapping operations,
including different cache modes, repeated mappings, remapping,
different buffer sizes, CPU preparation, protection flags, partial
mappings, and invalid mapping requests.

Add positive and negative coverage for freeing buffer objects,
including multiple buffers, invalid handles, repeated close requests,
and queries after a buffer has been released.

Changes in v2:
- Rebase onto the latest upstream master.
- Resolve conflicts with recently applied MSM BO changes.
- Add Acked-by and Tested-by tags.

Jitta Vignan (2):
  tests/msm/msm_bo: Add buffer mapping tests
  tests/msm/msm_bo: Add buffer free tests

 tests/msm/msm_bo.c | 570 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 570 insertions(+)

-- 
2.34.1

