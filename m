Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CD5C5475B
	for <igt-dev@archiver.kernel.org>; Fri,  1 Mar 2024 20:48:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1B710EC89;
	Fri,  1 Mar 2024 20:48:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="V3sN6naU";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F3110EC25
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Mar 2024 20:48:20 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 421DU2ao024329; Fri, 1 Mar 2024 20:48:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:date:subject:mime-version:content-type
 :content-transfer-encoding:message-id:references:in-reply-to:to
 :cc; s=qcppdkim1; bh=Vt+rOX9ErEDgIx951+QGp3A9QoOm18ZoqvrNS1h479o
 =; b=V3sN6naUM93i6hvtwvZZtzDU2/Cwz2LxvQY3Rd+c4+wWsI56HI24i+41qfy
 dQcSNEtAq4/Kkp6ci+c5JGHJJ+hLBdynBVPHklaPJCP0M/VOeeCNbSKvx6BQRssh
 l2QWcQpV4EGpj00MZiS4A2NHpsjjAT4GAmyBGm4eyW/5SLRlHCoOEkSyph0E5nv+
 jSCnPYvxPWU5jaoyS8kIru7dPMOy8bjAYpYBQziZP8VmR0B8Gs9vQnLOiVbOcTir
 XTpx10ck0WzFvjjOFqQgxMSc3zLoqDFsxpSUBhivNLqgRCB03OBzQbUdvxPVSMQW
 BMg2BI4m1Q+iFItterKsReok02Q==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wk7cga619-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Mar 2024 20:48:06 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 421Klt97029938
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Mar 2024 20:47:55 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 1 Mar 2024 12:47:55 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 1 Mar 2024 12:47:34 -0800
Subject: [PATCH i-g-t v3 5/5] tests/kms_atomic: Add subtest for solid fill
 cursor planes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240301-solid-fill-v3-5-8dff68a8a566@quicinc.com>
References: <20240301-solid-fill-v3-0-8dff68a8a566@quicinc.com>
In-Reply-To: <20240301-solid-fill-v3-0-8dff68a8a566@quicinc.com>
To: <igt-dev@lists.freedesktop.org>, Petri Latvala <adrinael@adrinael.net>
CC: Simon Ser <contact@emersion.fr>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, <quic_abhinavk@quicinc.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709326073; l=2300;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=2cJuk91gAH47XpfsdAOTP3T1EU1MGUVPLvxrV1ZnMw4=;
 b=8fi6HsYq2HcXu183B/hNekbNWJMyIEaC+855f7d6UhOv8A0DIKOgwpj2xHN5EPoIXru7OoDgy
 e1MHVHV8iR0Cvudhl1K/mmCA2TsrESNGzsTY9yqiy/nw9XX04NzSnk4
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: OXeLtZdX7prPua_TcMf8TYUI3Q6EKHXX
X-Proofpoint-GUID: OXeLtZdX7prPua_TcMf8TYUI3Q6EKHXX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-01_21,2024-03-01_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=525 lowpriorityscore=0 malwarescore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
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

Add a subtest for testing solid fill cursor planes.

This test will commit a solid fill cursor plane on top of a normal
framebuffer primary plane and compare the resulting CRC with the CRC
value of a framebuffer cursor and primary plane of the same contents.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 tests/kms_atomic.c | 35 +++++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 0598c5d71a85..38ca9837166c 100755
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -109,6 +109,7 @@
  * arg[1]:
  *
  * @primary:        Primary plane
+ * @cursor:         Cursor plane
  */
 
 #ifndef DRM_CAP_CURSOR_WIDTH
@@ -1387,10 +1388,18 @@ static void test_solid_fill_plane(data_t *data, igt_output_t *output, igt_plane_
 	igt_require(igt_plane_has_prop(plane, IGT_PLANE_SOLID_FILL));
 	igt_require(igt_plane_has_prop(plane, IGT_PLANE_PIXEL_SOURCE));
 
-	rect.x1 = 0;
-	rect.x2 = mode->hdisplay;
-	rect.y1 = 0;
-	rect.y2 = mode->vdisplay;
+	if (plane->type == DRM_PLANE_TYPE_PRIMARY)
+	{
+		rect.x1 = 0;
+		rect.x2 = mode->hdisplay;
+		rect.y1 = 0;
+		rect.y2 = mode->vdisplay;
+	} else {
+		rect.x1 = mode->hdisplay / 2 - 50;
+		rect.x2 = mode->hdisplay / 2 + 50;
+		rect.y1 = mode->vdisplay / 2 - 50;
+		rect.y2 = mode->vdisplay / 2 + 50;
+	}
 
 	width = rect_width(&rect);
 	height = rect_height(&rect);
@@ -1807,6 +1816,24 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		}
 	}
 
+	igt_describe("Test case for solid fill cursor planes");
+	igt_subtest_with_dynamic("plane-cursor-solid-fill") {
+		for_each_pipe_with_single_output(&data.display, pipe, output) {
+			igt_plane_t *cursor =
+				igt_pipe_get_plane_type(&data.display.pipes[pipe], DRM_PLANE_TYPE_CURSOR);
+			if (!pipe_output_combo_valid(&data.display, pipe, output))
+				continue;
+			if (!cursor)
+				continue;
+
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+				atomic_setup(&data, pipe, output);
+				test_solid_fill_plane(&data, output, cursor);
+				atomic_clear(&data, pipe, output);
+			}
+		}
+	}
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);

-- 
2.43.2

