Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB47C47DDB
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jan 2024 23:30:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B060510F035;
	Tue, 23 Jan 2024 23:30:08 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BA9310EFF1
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jan 2024 23:29:58 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40NNJeBY004866; Tue, 23 Jan 2024 23:29:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:date:subject:mime-version:content-type
 :content-transfer-encoding:message-id:references:in-reply-to:to
 :cc; s=qcppdkim1; bh=7whDdB1rQMoU+Use0M0NKD7blRg0Hc2RT6/ZfqXYII4
 =; b=dwUBzpLOKoLqwCy7BMpPYl0JYfTcpidX0dGjgBioSPPR2W4lKvbsLfuCxff
 av9kOeY88yCWYZMEjzfLxHbFucTGuttmrKCR2WB/ViICrUVMjSXeIMoC1Px36+lV
 4OoGcuVrfItlANjSBFkc6TQs23RmKTeSn7IR/5vVwIdXE+JSCnmPVUwtuQG+W+ka
 hK3XQMhIFKm7iMxcW1STG9KXRjMtgs/Yvlt0dpauBK82pTgwJ7il97zu/C0P+2xs
 73b9jAej1iXLTNPBv+uuRUpnU/QbXXdvPITU67nSkxcgmWl0GIvGO7XzopzE5n2Y
 6twTPQHR4gNPRbx3L/gA3OWg4ZA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vtmhn8a31-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jan 2024 23:29:45 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40NNTinG007248
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jan 2024 23:29:44 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 23 Jan 2024 15:29:44 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 23 Jan 2024 15:28:59 -0800
Subject: [PATCH i-g-t v2 6/6] tests/kms_atomic: Add subtest for solid fill
 cursor planes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240123-solid-fill-v2-6-4ecd2cf767fe@quicinc.com>
References: <20240123-solid-fill-v2-0-4ecd2cf767fe@quicinc.com>
In-Reply-To: <20240123-solid-fill-v2-0-4ecd2cf767fe@quicinc.com>
To: <igt-dev@lists.freedesktop.org>, Petri Latvala <adrinael@adrinael.net>
X-Mailer: b4 0.13-dev-f0463
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706052582; l=2300;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=MSy+Yai47HZ/UDvtiLXGY0C5qNpuClk/H4IAvjNiRxg=;
 b=fZ4FPmPcSfopj0RgXPiR22jYI3Ju0LA72K7xeJGF3kW27wVl2Q9RRfWzdY6rEfARGBP1oD4lF
 6pwdvtdVEVnD03Zy7dnyg7Q5wlTyGQzUPzSRLAWycukWZdOJCy3qPFF
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: C8S7LX1Z6-NTNNwH77PQh_yJldj6KeLd
X-Proofpoint-ORIG-GUID: C8S7LX1Z6-NTNNwH77PQh_yJldj6KeLd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-23_13,2024-01-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 clxscore=1015 malwarescore=0 mlxlogscore=366 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Add a subtest for testing solid fill cursor planes.

This test will commit a solid fill cursor plane on top of a normal
framebuffer primary plane and compare the resulting CRC with the CRC
value of a framebuffer cursor and primary plane of the same contents.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 tests/kms_atomic.c | 35 +++++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 35ac5f198524..95f349d40684 100755
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -109,6 +109,7 @@
  * arg[1]:
  *
  * @primary:        Primary plane
+ * @cursor:         Cursor plane
  */
 
 #ifndef DRM_CAP_CURSOR_WIDTH
@@ -1373,10 +1374,18 @@ static void test_solid_fill_plane(data_t *data, igt_output_t *output, igt_plane_
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
@@ -1777,6 +1786,24 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
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
2.43.0

