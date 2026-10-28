Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C05606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 10:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WzJa87nu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 736AD10E61A;
	Wed, 28 Oct 2026 10:28:42 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9910010E61A
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 10:27:44 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69S8K6FA1667614
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 10:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=bCgz9usch4mhwytZuqYgOxIzxXypmOHZ7FI
 zh1QPXIc=; b=WzJa87nu7wer/5hlmfMOCJr+DecZ/9Ucr4UprcUe9aCOWEchbkk
 934QwnF85qRbs6KaLeBQWn01lP8s4ZvNtwaFqBciXrJvDBr8eO8stplpj0Yb2kHN
 2gWqXZKoSdOBc8KpO5AUCOyg3cAwr5WhL0jTVXFqGonkKyOGH3q27SL+Zbo4ur4y
 J430ZSk+9Kp1hsa3JXs9Qg2WdNI+4aS835c9bh1BlUJyaW7Nmva82oMGcQcI/QIa
 NzMG4ruTiAK7YFrbZdhqwzDKsu/IPKP7OlEbVKrKsZFpX5Jqog1cATQKoc1Hxdh4
 nXo3yR0QkoTCz4Wlj7GN127GBWt5lA4K/WQ==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk12pu3mb-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 10:27:43 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id
 69SANsAB529267
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 10:26:01 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-jvignan-hyd.qualcomm.com
 [10.147.241.47])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 69SAQ1LH532835
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2026 10:26:01 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4601609)
 id 80C21A03; Wed, 28 Oct 2026 15:56:00 +0530 (+0530)
From: Jitta Vignan <jvignan@qti.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: robclark@qti.qualcomm.com, akhilpo@qti.qualcomm.com,
 Jitta Vignan <jvignan@qti.qualcomm.com>
Subject: [PATCH i-g-t 0/2] tests/msm/msm_bo: Extend buffer object test
Date: Wed, 28 Oct 2026 15:55:50 +0530
Message-Id: <20261028102552.3836144-1-jvignan@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: GccpMsxF6Q-Ud9W2MOmQC1UisZarGo0x
X-Authority-Analysis: v=2.4 cv=DtDDa2/+ c=1 sm=1 tr=0 ts=6ae1ce20 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=K4sxCHuS9b2ru-ZpJxQA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MSBTYWx0ZWRfX+OZr7urm+M9m
 fqk6CPoc1wGKZdlkXBgVj0JGBJ+TichYCqbbaALkiaFnbBcACBSpprDNTlYlwYGbVm3wQgmZTKM
 Snp48eRTh87OTJiRuD5aXqBDD+bHL6MWoyCh8UEStWe9u5PZGvjVyg7JgKCmO1ygPXF2DlpzN4z
 4Eob5/L+yiglW9pn4qQzLpu8wx5VyjOxsQACMcFZUZ9k2k6WJ+xcKW73tQWuPmLHsQYdHbvEPnJ
 5OodGKWKdB44gi/0ItI1RZCy6H8iN14MAZEulYPO83zGwGEkHXaIdN20hRkkHunmAmcf4VXHvoX
 z3YqZiombwlfVzESqIIyeWoJ19TK7AVw/hpGlqW4lygZu0HEbLNG2+/UbRTtva2yQeivpNuqB/p
 Gn/+gDVcp1UPe9TVM0BmITFC8dpQs7kXz/r/eDhMuGff3QsKSWESMFu7jeDj/6a1nHuNToqJzLg
 paElXHZ36NCbDn1feQQ==
X-Proofpoint-GUID: GccpMsxF6Q-Ud9W2MOmQC1UisZarGo0x
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MSBTYWx0ZWRfX8I7bI2pEnG/k
 JAQSGQzt8/uLucoKQqUEG1kAWUo1VKWkYeTeFKprnp1G5gyIdoOSd0hVwsP7aVW/LJoYMrZYMhx
 +HBjCTXezLZV5G0+By1k+LL7CQA2SbQ=
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
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Extend MSM buffer object test coverage and clean up the existing info
tests.

Add coverage for MSM_BO_CACHED_COHERENT allocation on supported A6xx
and newer GPUs.

Reorder the buffer information tests so that positive cases are run
before negative cases, and use the existing IGT ioctl helpers for
error validation.

Jitta Vignan (2):
  tests/msm/msm_bo: Reorder info tests and clean up
  tests/msm/msm_bo: Add CACHED_COHERENT allocation test

 tests/msm/msm_bo.c | 167 +++++++++++++++++++++++++++------------------
 1 file changed, 102 insertions(+), 65 deletions(-)

-- 
2.34.1

