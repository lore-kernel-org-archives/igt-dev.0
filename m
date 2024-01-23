Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5BF3C47E49
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jan 2024 23:29:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4620B10EFF1;
	Tue, 23 Jan 2024 23:29:59 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C0310EFD2
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jan 2024 23:29:57 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40NMu6Dr017240; Tue, 23 Jan 2024 23:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:date:subject:mime-version:content-type
 :content-transfer-encoding:message-id:references:in-reply-to:to
 :cc; s=qcppdkim1; bh=kSn9cJWb+5/55hrP51hi3jwqGlozX3Nhmyi3SR4T0mE
 =; b=VswkE4Um5dlMOi3GMFGwW2O7Klwv5bpCPCtKSGIyX2fklzbvKN9WCBOzFkF
 DR1KiQDpOdtNmbsYeAHUP/JJTw5IdzCxZO6GUV7pfcJktLrOVk/HgaZVTwOXNt2o
 l9W73L6RmbZEya4hO8EAHk47/nP0TmKmod6ed5en3TZvp3RqW2CCjy4hzPGdMEWP
 tihh9RMwiqum9dgDmAAH5sClbDA8BmRNqeUi6+Fmny+Ws/ovXKdNyDU5fEYBXx0/
 IJKX+VCpB2kUHOBs+Qkg20IL0w7fHU4a+uP9JNMZZrzPElnhyFrFNSGvwCkqn9BZ
 jYkJnyBv3uwPDcwaC7PMU4/9WmA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vtmhmra3p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jan 2024 23:29:44 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40NNThPR002937
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jan 2024 23:29:43 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 23 Jan 2024 15:29:43 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 23 Jan 2024 15:28:54 -0800
Subject: [PATCH i-g-t v2 1/6] tests/kms_atomic: Free pipe_crc object
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240123-solid-fill-v2-1-4ecd2cf767fe@quicinc.com>
References: <20240123-solid-fill-v2-0-4ecd2cf767fe@quicinc.com>
In-Reply-To: <20240123-solid-fill-v2-0-4ecd2cf767fe@quicinc.com>
To: <igt-dev@lists.freedesktop.org>, Petri Latvala <adrinael@adrinael.net>
X-Mailer: b4 0.13-dev-f0463
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706052582; l=740;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=RGDY8Ybpb5EhhhlCxixUCNEAXv2BaJeVFaMoObxXefQ=;
 b=7Zx7LzZ6JBky67Z4Z7dVUWxffS6CWCLGf2diKNe0l/K5TQTYr6J31xZ2XwXKNXDBP8pg0/uKA
 LhH50pBpkhlAksvhWWpmeTEat9GefwEBSVLuRH+j8NXUk6Rj+mZ85AJ
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: iV97mTMqX7lesYj2GP7LqxAVY9KXgQ0i
X-Proofpoint-ORIG-GUID: iV97mTMqX7lesYj2GP7LqxAVY9KXgQ0i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-23_13,2024-01-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=560 spamscore=0 mlxscore=0 phishscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401230175
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Simon Ser <contact@emersion.fr>, Rob Clark <robdclark@gmail.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>
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
2.43.0

