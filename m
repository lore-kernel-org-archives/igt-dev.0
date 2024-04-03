Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D81C6FD1F
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 01:33:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508CB10E7F1;
	Wed,  3 Apr 2024 01:33:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="gMecvSbg";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA7410E7F1
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 01:33:23 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43300qlk024284; Wed, 3 Apr 2024 01:33:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=qcppdkim1; bh=60ackC5
 I70k3N0hG62hUSM1gpKhXRQ9MkD+azCrnZmQ=; b=gMecvSbge655V13w9gPGesf
 KdQZ4rDnpaGLWHcNuL9YVUuYOPGwcyd5hMa1+WZe/SSt93l8N6+E/umhUo44Lt0U
 Nj3JrtKTNKOourukImblDiKyd5EWSLDJZzqGJ3vfIhIAovlQnMTTmOwBORItw7EW
 JC2NG2SO3stJXPhM1nLurTEqJ6vORDpSdZAO5FZd9RrSbTEloPgNGJ2TrIhK0vZ8
 L3XR5vt/ecDBmMWAQF6XQ3eN1eZ2xwt5HZL865zaJl1ohOP6pBaz+WFSuVXlaT6z
 x7Zl67FIZNqbmULwgI9+J3olyw9VGjpRP3laMdEiTqzUdkwid+9L8UcBcA4v7qQ=
 =
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x8h5esv20-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Apr 2024 01:33:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4331XIVP018952
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 3 Apr 2024 01:33:18 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 2 Apr 2024 18:33:18 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <igt-dev@lists.freedesktop.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>, <robdclark@gmail.com>,
 <dmitry.baryshkov@linaro.org>, <quic_jesszhan@quicinc.com>,
 <petri.latvala@intel.com>, <markyacoub@chromium.org>
Subject: [RFC PATCH i-g-t] lib/igt_kms: move setting
 DRM_CLIENT_CAP_WRITEBACK_CONNECTORS to kms_writeback
Date: Tue, 2 Apr 2024 18:33:00 -0700
Message-ID: <20240403013302.2277902-1-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: gCIcoDxpMfT5Zjh02wOIx7G-urV2iZ2X
X-Proofpoint-ORIG-GUID: gCIcoDxpMfT5Zjh02wOIx7G-urV2iZ2X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-02_16,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=876 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 clxscore=1011 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2404030009
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

This results in all IGT tests running even on writeback connector
which certainly fails many tests on MSM hardware because tests such as CTM
rely on CRC being collected post CTM in the display pipeline but for MSM hardware
there is no CRC collection point post CTM for writeback connectors.

It is unclear whether this is intentional to be able to run all IGT tests even
with writeback connector or it is only kms_writeback which is supposed to
be the one.

Lets try with the latter approach by setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS
only within kms_writeback.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 lib/igt_kms.c         | 2 --
 tests/kms_writeback.c | 5 +++++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index c38021dd7f74..c03eabdf1d6e 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2750,8 +2750,6 @@ void igt_display_require(igt_display_t *display, int drm_fd)
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
 
-- 
2.44.0

