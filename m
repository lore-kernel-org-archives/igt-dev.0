Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BF7C5475B
	for <igt-dev@archiver.kernel.org>; Fri,  1 Mar 2024 20:48:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A2910EC99;
	Fri,  1 Mar 2024 20:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="j5wYkSog";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F30310EC89
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Mar 2024 20:48:06 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 421JfMXe026965; Fri, 1 Mar 2024 20:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:date:subject:mime-version:content-type
 :content-transfer-encoding:message-id:references:in-reply-to:to
 :cc; s=qcppdkim1; bh=3tbaME4wqszMOaKytEfmouyfWT+rgeNbQaV+0+a8/lk
 =; b=j5wYkSog1PjdPL9gbDVfVHLLTfjebUs5LbuCsSuE6NIdpAV3LUxR9h5Kqtc
 13+btBsqTqCb299LnZIDJijwp36C4s4mI3InAxURwGqEPEyBPJNoBWW+SggxGJQb
 7YtG4dAO4dEYrfpWQNBg4PRWzDcdjNf8RbdquVLUby7B3qiMM3Kd88eZ0/6de6/E
 FfYA2/abHbqMCtBvvL5zqm7qtH6pZhOUlOKGKt5rbVaal+jTxUJZzMnRfJAJ2lN5
 CYGLuHzkZ2MIpztdKHB1aiKp4CJmvaxGCMPVePe5l/VsAWUUx2m/UlenYES7e9l+
 tTzRa2ZNmrSf+GtRzxFmyhnxCdw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wk9hp1wup-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Mar 2024 20:47:56 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 421Klt7D026452
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Mar 2024 20:47:55 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 1 Mar 2024 12:47:54 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 1 Mar 2024 12:47:32 -0800
Subject: [PATCH i-g-t v3 3/5] lib: Add support for solid_fill and
 pixel_source plane properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240301-solid-fill-v3-3-8dff68a8a566@quicinc.com>
References: <20240301-solid-fill-v3-0-8dff68a8a566@quicinc.com>
In-Reply-To: <20240301-solid-fill-v3-0-8dff68a8a566@quicinc.com>
To: <igt-dev@lists.freedesktop.org>, Petri Latvala <adrinael@adrinael.net>
CC: Simon Ser <contact@emersion.fr>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, <quic_abhinavk@quicinc.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709326073; l=4643;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=9QmNpMspuXqc33pK84fofH5h8z2M5Xf7KqI+qZWpljY=;
 b=nCXoRz6VUGRn+W6PeTiQz5iF0ehE6zcAHhnH94PdRcynI3yc1ghSWgVJlO2fAwaIvczspJ8zo
 mKyAyC9o5CnB51co0FyuXqiQGxCg/TqW6+FAH6PJw/rwIyB4FE7bOgr
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 8oUMcJOVIyTavIFrow1OY_S_6ClC49z_
X-Proofpoint-GUID: 8oUMcJOVIyTavIFrow1OY_S_6ClC49z_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-01_21,2024-03-01_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 mlxlogscore=816 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2403010173
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

Add corresponding IGT macros for solid_fill and pixel_source DRM
properties, and change IGT commit behavior to allow for NULL FB commits.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 lib/igt_kms.c | 48 +++++++++++++++++++++++++++++++++++++++++++++---
 lib/igt_kms.h |  4 ++++
 2 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 1b4d0d7612a2..8e965a3798b6 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -669,6 +669,8 @@ const char * const igt_plane_prop_names[IGT_NUM_PLANE_PROPS] = {
 	[IGT_PLANE_HOTSPOT_X] = "HOTSPOT_X",
 	[IGT_PLANE_HOTSPOT_Y] = "HOTSPOT_Y",
 	[IGT_PLANE_FB_ID] = "FB_ID",
+	[IGT_PLANE_SOLID_FILL] = "solid_fill",
+	[IGT_PLANE_PIXEL_SOURCE] = "pixel_source",
 	[IGT_PLANE_CRTC_ID] = "CRTC_ID",
 	[IGT_PLANE_IN_FENCE_FD] = "IN_FENCE_FD",
 	[IGT_PLANE_TYPE] = "type",
@@ -2379,6 +2381,8 @@ static void igt_plane_reset(igt_plane_t *plane)
 	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_H, 0);
 
 	/* Reset binding to fb and crtc. */
+	igt_plane_set_prop_value(plane, IGT_PLANE_SOLID_FILL, 0);
+	igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_SOURCE, "FB");
 	igt_plane_set_prop_value(plane, IGT_PLANE_FB_ID, 0);
 	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_ID, 0);
 
@@ -3417,6 +3421,11 @@ static igt_output_t *igt_pipe_get_output(igt_pipe_t *pipe)
 	return NULL;
 }
 
+static uint32_t igt_plane_get_solid_fill_id(igt_plane_t *plane)
+{
+	return plane->values[IGT_PLANE_SOLID_FILL];
+}
+
 static uint32_t igt_plane_get_fb_id(igt_plane_t *plane)
 {
 	return plane->values[IGT_PLANE_FB_ID];
@@ -3648,7 +3657,7 @@ static int igt_primary_plane_commit_legacy(igt_plane_t *primary,
 	struct igt_display *display = primary->pipe->display;
 	igt_output_t *output = igt_pipe_get_output(pipe);
 	drmModeModeInfo *mode;
-	uint32_t fb_id, crtc_id;
+	uint32_t fb_id, solid_fill_id, crtc_id;
 	int ret;
 
 	/* Primary planes can't be windowed when using a legacy commit */
@@ -3665,12 +3674,14 @@ static int igt_primary_plane_commit_legacy(igt_plane_t *primary,
 
 	crtc_id = pipe->crtc_id;
 	fb_id = output ? igt_plane_get_fb_id(primary) : 0;
-	if (fb_id)
+	solid_fill_id = output ? igt_plane_get_solid_fill_id(primary) : 0;
+
+	if (fb_id || solid_fill_id)
 		mode = igt_output_get_mode(output);
 	else
 		mode = NULL;
 
-	if (fb_id) {
+	if (fb_id || solid_fill_id) {
 		uint32_t src_x = primary->values[IGT_PLANE_SRC_X] >> 16;
 		uint32_t src_y = primary->values[IGT_PLANE_SRC_Y] >> 16;
 
@@ -4935,6 +4946,37 @@ igt_plane_t *igt_output_get_plane_type_index(igt_output_t *output,
 	return igt_pipe_get_plane_type_index(pipe, plane_type, index);
 }
 
+/**
+ * igt_plane_set_solid_fill:
+ * @plane: Plane
+ * @rect: Rect for size and position of @plane
+ * @solid_fill_id: Solid fill property blob ID
+ *
+ * Pairs the solid_fill blob (identified by @solid_fill_id) to a @plane
+ *
+ * The size and position of the solid fill plane will be specified by @rect
+ */
+void igt_plane_set_solid_fill(igt_plane_t *plane, struct drm_mode_rect *rect,
+		int solid_fill_id)
+{
+	igt_pipe_t *pipe = plane->pipe;
+	igt_display_t *display = pipe->display;
+	int width = rect->x2 - rect->x1;
+	int height = rect->y2 - rect->y1;
+
+	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_ID,
+			solid_fill_id ? pipe->crtc_id : 0);
+	igt_plane_set_prop_value(plane, IGT_PLANE_SOLID_FILL, solid_fill_id);
+
+	plane->gem_handle = 0;
+
+	LOG(display, "%s.%d: plane_set_solid_fill(%d)\n", kmstest_pipe_name(pipe->pipe),
+	    plane->index, solid_fill_id);
+
+	igt_plane_set_position(plane, rect->x1, rect->y1);
+	igt_plane_set_size(plane, width, height);
+}
+
 /**
  * igt_plane_set_fb:
  * @plane: Plane
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index b3882808b42f..9c05272abe1e 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -330,6 +330,8 @@ enum igt_atomic_plane_properties {
 #define IGT_PLANE_COORD_CHANGED_MASK 0xff
 
        IGT_PLANE_FB_ID,
+       IGT_PLANE_SOLID_FILL,
+       IGT_PLANE_PIXEL_SOURCE,
        IGT_PLANE_CRTC_ID,
        IGT_PLANE_IN_FENCE_FD,
        IGT_PLANE_TYPE,
@@ -537,6 +539,8 @@ igt_output_t *igt_get_single_output_for_pipe(igt_display_t *display, enum pipe p
 
 void igt_pipe_request_out_fence(igt_pipe_t *pipe);
 
+void igt_plane_set_solid_fill(igt_plane_t *plane, struct drm_mode_rect *rect,
+		int solid_fill_id);
 void igt_plane_set_fb(igt_plane_t *plane, struct igt_fb *fb);
 void igt_plane_set_fence_fd(igt_plane_t *plane, int fence_fd);
 void igt_plane_set_pipe(igt_plane_t *plane, igt_pipe_t *pipe);

-- 
2.43.2

