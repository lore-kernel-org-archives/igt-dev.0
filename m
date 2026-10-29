Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB997606A323
	for <igt-dev@archiver.kernel.org>; Thu, 29 Oct 2026 17:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FcUDdgxZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F2010E5BF;
	Thu, 29 Oct 2026 17:28:45 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 004B710E5BF
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 17:27:44 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69THDjEO182196
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 17:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=7rxcW7JXBKKWnF9mLoghKw8hpBrJxAZ7QKc
 Yz6c5Jdc=; b=FcUDdgxZmwFP6IzHcuepArcA7+iJd8prol4pPRAEow1or3y4ryh
 Olj6VrfEaM+xBp4LBTYy+otT8huk+rbNooqL3umy7SQa2SKNAnHp0nX+OdPwYD4n
 dedms1g4tWabvuXrSZhWWuWj6dCbcWibov6YU9X2nGhEzcAXTXEe6EpP8Mn63xXu
 n3UWQTvP7D4oMH0+3hnVnO+othrYVWLvEN+rbY3/d5e09sCh3TSHElblYFEZc8wL
 lzSZ6uj4V55E7otA9UJyMzXiy81oWFNxFZPmQiJHdVeL8wa8IFtjg0/Xh8Facsee
 LyeldF3rBuv976HWE7sSuwUitBJOzDcNxwA==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hmac0r2c0-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 17:27:44 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id
 69TGtuxN3027281; Thu, 29 Oct 2026 16:55:56 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-jvignan-hyd.qualcomm.com
 [10.147.241.47])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 69TGturS3027273
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 29 Oct 2026 16:55:56 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4601609)
 id 674AEA07; Thu, 29 Oct 2026 22:25:55 +0530 (+0530)
From: Jitta Vignan <jvignan@qti.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: robclark@qti.qualcomm.com, akhilpo@qti.qualcomm.com,
 Jitta Vignan <jvignan@qti.qualcomm.com>
Subject: [PATCH i-g-t 0/2] tests/msm/msm_bo: Add mapping and free tests
Date: Thu, 29 Oct 2026 22:25:51 +0530
Message-Id: <20261029165553.1108121-1-jvignan@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: qf_WbnZwcUWBrGdqxKdIA-196IZR6DEt
X-Proofpoint-GUID: qf_WbnZwcUWBrGdqxKdIA-196IZR6DEt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2OCBTYWx0ZWRfX2DD6GIwQzC+v
 1byNcgHqSGQOscDhaSkQvPXAkUhsbtat6eRjMVVj+rWhDmmVeyDv2CMHDyyMSLBTqI74dNJtWWk
 MxOGm8vd3ytzdwqTEtt/YqJyspGGzZE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2OCBTYWx0ZWRfXwXnigu2AYPTB
 rt+q0P3Ybg//DNnCzYNOsDILzKwmJyrXRt/iesD9M0QwwPu8glPdP8jzhtd9c5RA6RlXyhQnHV3
 V+92L54uhgc3LP/7FshiX9NisNZwR5RRrojFmO5BMau1szVOs9RhTd0twCPhn5vZmZOHy8ESw8C
 ihMJzz7tQCph4zblA37GRGiOXNKN6lUrM93eevU3IG1ApqoAyOAeaQn6cp41w4YWL0tfO6h1cyB
 G6K9VvB9N/05E2xd8w3f6zNF/gtTxv2hdYQP5OR/atY0LBf5PRMKiTR150/zHIqq5qih+Oj9QL0
 TIxK66x0mQGiWSYoC0adj2egOfeJQ17WeLDP4JF5QYeFsCvhRDkUZBJOnrR8Pnht15NVjMvq9sY
 UCpJUUjNFMlAPLXwWB818LPu3HN+3/qHXKxEIB3vv7aAFOLQr7UpcwEIzBX98MWsZxBvwtdzWmF
 vepdYcmSJV+zjuZjMbQ==
X-Authority-Analysis: v=2.4 cv=I6/w19gg c=1 sm=1 tr=0 ts=6ae38210 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=jVB65U6-v9lujuievZMA:9
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

Jitta Vignan (2):
  tests/msm/msm_bo: Add buffer mapping tests
  tests/msm/msm_bo: Add buffer free tests

 tests/msm/msm_bo.c | 570 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 570 insertions(+)

-- 
2.34.1

