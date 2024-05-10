Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56EAC25B74
	for <igt-dev@archiver.kernel.org>; Fri, 10 May 2024 18:10:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F315C10E483;
	Fri, 10 May 2024 18:10:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="CsI0v3x5";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5615710E483
 for <igt-dev@lists.freedesktop.org>; Fri, 10 May 2024 18:10:18 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44AET7xt028441;
 Fri, 10 May 2024 18:10:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:date:subject:mime-version:content-type
 :content-transfer-encoding:message-id:to:cc; s=qcppdkim1; bh=Ahy
 4/J8qww7PBjh0PaZW1IV/Xbc2EDP6O1zJN/3bRBw=; b=CsI0v3x50wHqswp6C8n
 YpNwgNHrr4WBeL1fZzRREM3893ORPc1UQSCzWwHsgEJGZ62+Pkto/pNSe4YhZ7/8
 SzzYnUdPOvYztrJnRjePida3mvaPpamwbZjjBc9nL5UPoqS4zPHh4uoOCDeqjJHO
 hs7RK7zmanthYg6s86VpqoLhZyRo3rNqw58SZLPFwCA1mNRnHZudtUcNftx7lnK6
 Lm4XuNJN3Avn1ATLooCIBXphidNQ2dmVvBMm2MSeGYD6hCnKVHuQwRhBK+yRlv4h
 kzxbUqZRvggCBmipAkbJ6LbHlArsP+LyCg9b2G0eqwa4BIJKjWMJpsTwTnNqPMvS
 D4w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y16w0t863-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 May 2024 18:10:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44AIABPQ020397
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 May 2024 18:10:11 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 10 May 2024 11:10:11 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri, 10 May 2024 11:09:35 -0700
Subject: [PATCH i-g-t v2] lib/igt_kms: move setting
 DRM_CLIENT_CAP_WRITEBACK_CONNECTORS to kms_writeback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240510-wb_igt_fix-v2-1-e14eef87319b@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAN5iPmYC/22Oyw6CMBREf4V0bclty8O68j8MIaUUuDG02iJqC
 P9uYWNMXJ5J5swsJBiPJpBTshBvZgzobAR+SIgelO0NxTYy4cAzyEHSZ1NjP9UdvuixZIUscma
 gVSQWbt7EeJddCNKeTqSKcefdSKfBG/U1ZSCACQE85bwsJXDK6P2BulbNgFbN1/NGaHWq3bi5B
 wyT8+/958z2hX+XZhZFGet01jAhhYQfT7Wu6wdd/SYq8gAAAA==
To: <igt-dev@lists.freedesktop.org>
CC: <quic_jesszhan@quicinc.com>, Rob Clark <robdclark@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, <adrinael@adrinael.net>, "Kamil
 Konieczny" <kamil.konieczny@linux.intel.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715364611; l=2949;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=XDYP2FjE+rj29lAjLFg0k8aVyAEpeYEaVtUykl28wc0=;
 b=VYZNztEi46Pps7re+s76oKvMcewtY0X62GHn4KMVtrJMJZEb9cygjBS/lgCAfqrYFFNYWTyt5
 X5tw4BYBK+6Bw7RpgpY0eRH+pjUrIAhioJeytUo1bT3fmA1DbWJHTm0
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: dAQyAfcFpsD7X_6MbQ1oqglQVXRvYMCV
X-Proofpoint-ORIG-GUID: dAQyAfcFpsD7X_6MbQ1oqglQVXRvYMCV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_13,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 mlxlogscore=999 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405100130
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

For the writeback connectors to function properly, additional setup steps are
required (like setting up the output buffers and submitting the job). These steps
are not a part of the default IGT setup, so there is no guarantee that the pipeline
will be executed at all. This results in regressions for msm boards across multiple
IGT tests on writeback connectors such as CTM related tests where CRC needs to
be collected after the CTM has been applied in hardware.

It is unclear whether this is intentional to be able to run all IGT tests even
with writeback connector or it is only kms_writeback which is supposed to
be the one.

Lets try with the latter approach by setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS
only within kms_writeback.

changes since RFC:
	- minor fixes to commit message

changes in v2:
	- use igt_require_f to print descriptive message
	- add msm card failure details in commit text

Reviewed-by: Rob Clark <robdclark@gmail.com>
Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Acked-by: Petri Latvala <adrinael@adrinael.net>
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
index 6cd685b37af2..f89b2d62fcc9 100644
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
+		igt_require_f(!ret, "error setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
+
 		output = kms_writeback_get_output(&display);
 		igt_require(output);
 

---
base-commit: 4a5fd4e7cb2798636f6464e2bd61399f3242b322
change-id: 20240509-wb_igt_fix-87169651e0da

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>

