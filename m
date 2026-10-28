Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C992606A31C
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 15:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LkzMH5J7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4CC910E655;
	Wed, 28 Oct 2026 15:17:05 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7DDF10E62D
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 15:16:08 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69SFAkb21517128; Wed, 28 Oct 2026 15:16:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=XrYR/Is4+AhdOxntkBD1NRhrD0MXxCHYUZg
 4LlSACCY=; b=LkzMH5J7CxVEECuMsjfLqQzP2H7akfHoMAF+KVBkCGtLb9UPKqU
 O+RiXEvdmfQ7fi0e3n6X24EFULSWF4veuyB04gdthf8hbHvCo5FsmRFmoquYKppf
 uRw8x5+Uw6QYuLXfHvmwisq6u8SKETxT4WDj//epU6udOCIUOaXu26Z1Q6x66Wm8
 0H+WBlitjvEFdm/E1gwNAaxeRXAzPZgkiB0FTkzl1/4qrcOQn7fBqZuW2Tak08NH
 cMVg1p9H6ikUPSz+THOciEAhAu31cLzhOgcZdAD+otYz3PvxGdL2R5OzFwh7d7qg
 KllDKA3CV8E0eTzW3u4EEP3xyUXNj4SqNGA==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhwa2g4-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2026 15:16:07 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id
 69SFG3271754722; Wed, 28 Oct 2026 15:16:03 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-jvignan-hyd.qualcomm.com
 [10.147.241.47])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 69SFG3K91754695
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2026 15:16:03 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4601609)
 id 5010A9FD; Wed, 28 Oct 2026 20:46:02 +0530 (+0530)
From: Jitta Vignan <jvignan@qti.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: robclark@qti.qualcomm.com, akhilpo@qti.qualcomm.com,
 kamil.konieczny@linux.intel.com, Jitta Vignan <jvignan@qti.qualcomm.com>
Subject: [PATCH i-g-t v2 0/2] tests/msm/msm_bo: Extend buffer object test
 coverage
Date: Wed, 28 Oct 2026 20:45:57 +0530
Message-Id: <20261028151559.4069953-1-jvignan@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: 6XeV5OD7cWPGypzwDnXnaSGFvWqxI4FD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MCBTYWx0ZWRfXyTT1+z5pMd9I
 EB66d1tqFVTEgLqhiBchFyZTF3dxViiiwhh25mAT9NY03bqUIxa5Ndz68jm2XKUFc5ZAxP6o+Qj
 Ze9naiY8Fq+lTrfkHtGJlZPmIQG4HL8=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae211b7 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=P-pecD8ryDanRAuiJocA:9
X-Proofpoint-ORIG-GUID: 6XeV5OD7cWPGypzwDnXnaSGFvWqxI4FD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MCBTYWx0ZWRfX2Y7rSEw3OehV
 w7Ji4DXZoDssYyn/ZObQl9TenqgKqCujc1bFnvhBj9ftvNe5NtIhA2SCDUlSbX2WE7XsCZye84M
 J3OFwe6Od0O5FwjPJaSm9bemARieb+WcEkZxjYDI0aAh28MdRxmPffhkI/fX2zmgh5+Y8E5r3bA
 qXiaB0fIqOK17jdJ4xm4xyjqkfegGmWfEpyTxy/9Juh4umWHO5dddFGuiwVbZsxHzfsDHvhZzau
 wSTzF/I0k4rL0pQ9FIbZ9zj7wSVzxGOaONuNR8cm8XNW6TUpSsiAn9R+TURidpH3YYlRStgTJ0e
 eVGef4swfk6rcbJTL7Xb9N1uSJ3nF+6HiZPajurAgAtHhUBDiQk4NEb+q6pZWdzog9O1XseNxyR
 BH3HRYAqbKDMtUibWxTGKqOBo2DYYe+BH5ZyA4Xuv6YLPjCtRabH1xLYyNwIphEewScYyqQ/lC3
 aMb1M2oEThnzh05uCMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1011 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
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

Changes in v2:
- Add IGT_TEST_DESCRIPTION() for MSM buffer object management.


Jitta Vignan (2):
  tests/msm/msm_bo: Reorder info tests and clean up
  tests/msm/msm_bo: Add CACHED_COHERENT allocation test

 tests/msm/msm_bo.c | 167 ++++++++++++++++++++++++++++-----------------
 1 file changed, 103 insertions(+), 64 deletions(-)

-- 
2.34.1

