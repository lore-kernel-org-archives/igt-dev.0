Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8520CC5475B
	for <igt-dev@archiver.kernel.org>; Fri,  1 Mar 2024 20:48:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED62010ECD9;
	Fri,  1 Mar 2024 20:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="fieqkn4b";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FBE010EC25
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Mar 2024 20:48:09 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 421J0Var017512; Fri, 1 Mar 2024 20:47:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:date:subject:mime-version:content-type
 :content-transfer-encoding:message-id:references:in-reply-to:to
 :cc; s=qcppdkim1; bh=fdsuSiZ8ChlJa6Qj4hQXhc4cHHZMz364J4K49twnRBw
 =; b=fieqkn4bdiD/Jci0q6pvpT0oSKHlGHlqQS8JzWXUEMlliAD0Hdiu7ikXQug
 hg2zlJWcyZSmeEl3mimutH/ZG7gW6hvrrKMs4++TyxZGq0Hv/9hzBNq9kDffcD5X
 /S0BHmJrSKpd3XuhgyuzYewCRiWj/gDiGWdiY8fLdHL8unTUtX8imLN4ycNowtux
 nk+AA0OP7aQqmSNe8XMUA6aEUqx6neMsRdbThEf7zf87Okt/P8T5Yi7iTCvpISVs
 +/6Bk2kJmAApiVGubLaeEI4O6Ey0sUy5301Ijpnscv0VvfWOKksNOzaFqaTu8lEq
 IhyO13SDeJbllzhzbopVOQfUsOQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wk9khsww0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Mar 2024 20:47:55 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 421KlsB5001552
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Mar 2024 20:47:54 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 1 Mar 2024 12:47:54 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 1 Mar 2024 12:47:30 -0800
Subject: [PATCH i-g-t v3 1/5] tests/kms_atomic: Free pipe_crc object
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240301-solid-fill-v3-1-8dff68a8a566@quicinc.com>
References: <20240301-solid-fill-v3-0-8dff68a8a566@quicinc.com>
In-Reply-To: <20240301-solid-fill-v3-0-8dff68a8a566@quicinc.com>
To: <igt-dev@lists.freedesktop.org>, Petri Latvala <adrinael@adrinael.net>
CC: Simon Ser <contact@emersion.fr>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, <quic_abhinavk@quicinc.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709326073; l=740;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=9GGa8yIYkrLa9cWNoK9j+ZtUbo1HOPKpAPgiBRxWtCs=;
 b=r9CuXG5GD3OigEhLGKr67ScIl6KuNRPo2tmINdUt4TALNnZ56LP1L1F4DGDunaEO+VxIq7OlF
 VjpV7PPoA1xAqIOx1bGmUHrWtkEn2eA9JHXP2EYlRE+Ki6LP6Nx6DXw
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: stO669kqDBVDcQmTXMfIab364-U-bVdt
X-Proofpoint-ORIG-GUID: stO669kqDBVDcQmTXMfIab364-U-bVdt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-01_21,2024-03-01_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=719 clxscore=1015
 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403010173
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

Free dangling pipe_crc object in plane_immutable_zpos()

Fixes: 149c3d0b321c ("tests/kms_atomic: Add test to validate immutable zpos")
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 tests/kms_atomic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 96cd58571666..2b6e9a8f0383 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -560,6 +560,8 @@ plane_immutable_zpos(data_t *data, igt_output_t *output, enum pipe pipe, int n_p
 		igt_plane_set_fb(plane_upper, NULL);
 	}
 
+	igt_pipe_crc_free(pipe_crc);
+
 	igt_remove_fb(data->drm_fd, &fb_ref);
 	igt_remove_fb(data->drm_fd, &fb_lower);
 	igt_remove_fb(data->drm_fd, &fb_upper);

-- 
2.43.2

