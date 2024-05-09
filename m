Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C51C10F1A
	for <igt-dev@archiver.kernel.org>; Thu,  9 May 2024 20:39:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35C0910F3D1;
	Thu,  9 May 2024 20:39:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="RF7A4ymc";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F46710F3D1
 for <igt-dev@lists.freedesktop.org>; Thu,  9 May 2024 20:39:37 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 449DKibB018632;
 Thu, 9 May 2024 20:39:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:date:subject:mime-version:content-type
 :content-transfer-encoding:message-id:to:cc; s=qcppdkim1; bh=RUV
 21G7R0O5f+hWSi7kB3UVKBnjdpKMG/xo4k0VB8ic=; b=RF7A4ymcGFSEsh3bBbl
 OfyO7FGzBDIjKegGgFJAxeidacZVk26b44DehMXsBwXZbKUlLOHFHOU7ONHPYejA
 JLybqR8pJR/9s4VJJbbCT9H9DtyxuBxCVw1sxmZizIR9q/9Wz/3I/Zt/h5WKP9Rw
 o0xsSx+kh6/590E9eVcJr5PC/Rm0dAuUYmAB5tfkk4az5HKeR703knxIp29xE1Pp
 pqvbWCV3VCGpNH/zxBU7VW3GmqgbN4KaYdon2/mzDKfbLV/yzXuuxPS6AMwpUSYn
 jikCStyNBjo8AWlRV2UvjhxiNl+swlBINQJjX2vu1Ni0Rw/HMT4f/sB4KQUWNC5q
 hAA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y09ejuknq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 May 2024 20:39:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 449KdXNn013480
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 9 May 2024 20:39:33 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 9 May 2024 13:39:33 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 9 May 2024 13:39:11 -0700
Subject: [PATCH i-g-t] lib/igt_kms: move setting
 DRM_CLIENT_CAP_WRITEBACK_CONNECTORS to kms_writeback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240509-wb_igt_fix-v1-1-41fc4b139390@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAG80PWYC/0WMyw6CMBAAf4Xs2SXb8hJP/ocxpJQFNoZWC6IJ4
 d+tXjzOJDMbzByEZzglGwReZRbvIqhDAnY0bmCULjJo0jkVVOOrbWRYml7eeKxUWZeFYuoMxOA
 eOOrf7AKCAy5wjboPfsJlDGz+p5wyUllGOtW6qmrSqPDxFNuYdhRn1tv5S+Jsav0E+/4Bqk7Dh
 KgAAAA=
To: <igt-dev@lists.freedesktop.org>
CC: <quic_jesszhan@quicinc.com>, Rob Clark <robdclark@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, <adrinael@adrinael.net>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715287173; l=2468;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=ZhpiOn7yxcWjuXyK23WFlh+MoidnYceV+AWsqrk7Ct4=;
 b=UD031m1GPZ1ulL5/9jPfCOfVlq0ckeDy9g0dEk/15ts8iknPn1Urk0K1RNQIOK1tyiELL8A/A
 E2Au8npAcarBP2UagtYguBq8xRWi/e5TvGrdH82KrapYyUEBhTQXK4l
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ENmcwCGXFl9D7myZio8MnFhSRWLzyIaU
X-Proofpoint-ORIG-GUID: ENmcwCGXFl9D7myZio8MnFhSRWLzyIaU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-09_12,2024-05-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1011 mlxlogscore=999 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405090144
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

Currently DRM_CLIENT_CAP_WRITEBACK_CONNECTORS is set in the igt_display_require()
which is invoked for all IGT tests irrespective of whether the rest of the
writeback connector properties such as the FB_ID are set.

For the writeback connectors to function properly, additional setup steps are required
(like setting up the output buffers and submitting the job). These steps are not a part
of the default IGT setup, so there is no guarantee that the pipeline will
be executed at all.

It is unclear whether this is intentional to be able to run all IGT tests even
with writeback connector or it is only kms_writeback which is supposed to
be the one.

Lets try with the latter approach by setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS
only within kms_writeback.

changes since RFC:
	- minor fixes to commit message

Reviewed-by: Rob Clark <robdclark@gmail.com>
Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 lib/igt_kms.c         | 2 --
 tests/kms_writeback.c | 5 +++++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 98d3fb79cd22..f82102144ea1 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2878,8 +2878,6 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) == 0)
 		display->is_atomic = 1;
 
-	drmSetClientCap(drm_fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
-
 	resources = drmModeGetResources(display->drm_fd);
 	if (!resources)
 		goto out;
diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 6cd685b37af2..3448dc06f891 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -558,6 +558,7 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 	igt_fb_t input_fb, input_fb_10bit;
 	drmModeModeInfo mode;
 	unsigned int fb_id;
+	int ret;
 
 	memset(&display, 0, sizeof(display));
 
@@ -570,6 +571,10 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 
 		igt_require(display.is_atomic);
 
+		ret = drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
+
+		igt_require(!ret);
+
 		output = kms_writeback_get_output(&display);
 		igt_require(output);
 

---
base-commit: 4a5fd4e7cb2798636f6464e2bd61399f3242b322
change-id: 20240509-wb_igt_fix-87169651e0da

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>

