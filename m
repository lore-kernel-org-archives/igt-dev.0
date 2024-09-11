Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D578EE57D7
	for <igt-dev@archiver.kernel.org>; Wed, 11 Sep 2024 21:01:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B77EC10EAAB;
	Wed, 11 Sep 2024 21:01:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="mP4wJFBK";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E7AD10EAAB
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Sep 2024 21:01:25 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48BElx80010609;
 Wed, 11 Sep 2024 21:01:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=m/KvIniwmO6p7WFmWl5g2U
 mhgmDGlBvbJGn3t8DXGog=; b=mP4wJFBKMOyZnE/L8y2R5z5qJPWiJ17U71KxKr
 s8J0mGk5VAlggw74T3TCLardL/xXECf3ss8DEKrndUvSRVuNSiNXS6FBiaA+X47Z
 L784rALly463vVdy4aTkUs4DHArQnmLUy058Tz2V01Q91xtaTCDNNTu0n2uMFn3I
 TEEAHY0llbxixO94gU3BLRN36QJeJPuj0P5UzEuuOIO3Wt2Do8GwVKtJZA0RHC5n
 NxP+e9qydKamlN0ZDAKd5r946JbwXLjrk9qFu/HWKvMF1zFs4vv2IBG/DOKJQNQG
 iby4d3BWYT47SV4dhHhrldjazPNZFtbDG2TgGe74d57zcMkw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy51awaf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Sep 2024 21:01:12 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48BL1Bh4007148
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Sep 2024 21:01:11 GMT
Received: from hu-ebharadw-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Sep 2024 14:01:11 -0700
From: Esha Bharadwaj <quic_ebharadw@quicinc.com>
To: <igt-dev@lists.freedesktop.org>
CC: <adrinael@adrinael.net>, <quic_abhinavk@quicinc.com>, <arek@hiler.eu>,
 <kamil.konieczny@linux.intel.com>, <juhapekka.heikkila@gmail.com>,
 <bhanuprakash.modem@intel.com>, <ashutosh.dixit@intel.com>,
 <robdclark@chromium.org>, <quic_jesszhan@quicinc.com>
Subject: [PATCH i-g-t] lib/igt_fb: fix stride calculation for
 igt_fb_get_fnv1a_crc()
Date: Wed, 11 Sep 2024 14:00:58 -0700
Message-ID: <20240911210058.477513-1-quic_ebharadw@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: QF3beyNJv10WZ3wdUcE6PfNGKnXPcxGY
X-Proofpoint-GUID: QF3beyNJv10WZ3wdUcE6PfNGKnXPcxGY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=963 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409110160
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

fb->strides is assigned to the value returned by
calc_plane_stride() only if it was previously not set by the
caller. In the case of dumb buffer allocation, this is already
assigned by the driver.

Respect the stride requested by the driver in such cases by
using fb->strides[0] as this is assigned correctly in
calc_fb_size() only if it was previously not set by the driver.

Signed-off-by: Esha Bharadwaj <quic_ebharadw@quicinc.com>
---
 lib/igt_fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index ab162a5b7..ed016f07d 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -4814,7 +4814,7 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc_t *crc)
 	void *map;
 	char *ptr;
 	int x, y, cpp = igt_drm_format_to_bpp(fb->drm_format) / 8;
-	uint32_t stride = calc_plane_stride(fb, 0);
+	uint32_t stride = fb->strides[0];
 
 	if (fb->num_planes != 1)
 		return -EINVAL;
-- 
2.34.1

