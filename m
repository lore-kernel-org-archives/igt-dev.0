Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A91C47258
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jan 2024 23:30:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF0110F02D;
	Tue, 23 Jan 2024 23:30:08 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 480CC10EFD2
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jan 2024 23:29:58 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40NMRqRL019010; Tue, 23 Jan 2024 23:29:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:date:subject:mime-version:content-type
 :content-transfer-encoding:message-id:references:in-reply-to:to
 :cc; s=qcppdkim1; bh=5y636ckUACFyvD2wZpwkjh5oPOhvq0GInKyxgQlPgXY
 =; b=nbjGB4V8NTH17RNc7j3WYnmSgONzz5GIhmXS4CReSyAFaW+8gppJHpVsh9q
 O54ydv4r8f/TgUMsnns9r9M/h2GML1R7VM65sfs64PKeJkzmgJ6QD3nXCmYqo2bn
 LCbtQ0fQKvY4UaLML76QhjuANESlBsvlmMhgTpJz0414WvUiJVJprCqfLoLniLgG
 ekWDt0w6YzptK3FdRExHLyxlR4/pkxya5xYkjEuqZzDpLup7USivEC1mSTpxgIYM
 wj44uoEZMuS2Q/zS/pVqdU59ko+Qh4/sQ0TiT3zp+HmnkRKIeLuu2msy3lXYQ+F3
 +Q5x9/voypEKX3P5f63apjG6V5Q==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vtmhmra3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jan 2024 23:29:45 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40NNTi37007239
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jan 2024 23:29:44 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 23 Jan 2024 15:29:43 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 23 Jan 2024 15:28:56 -0800
Subject: [PATCH i-g-t v2 3/6] drm-uapi: Add drm_mode_solid_fill
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240123-solid-fill-v2-3-4ecd2cf767fe@quicinc.com>
References: <20240123-solid-fill-v2-0-4ecd2cf767fe@quicinc.com>
In-Reply-To: <20240123-solid-fill-v2-0-4ecd2cf767fe@quicinc.com>
To: <igt-dev@lists.freedesktop.org>, Petri Latvala <adrinael@adrinael.net>
X-Mailer: b4 0.13-dev-f0463
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706052582; l=1384;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=zcBxmybBJvtkCjSZ7USi2zIUAEPg2ptajFs4WA6GklM=;
 b=88vNHn+n9gi06bSsDHn2t0eNxm01hLeMgkZRNQakAshasbkfEP3+Cz//2gVb8CbmXDkt22ypH
 9R+t1OvdpBFC8bFuez9+0ONCIutAm+FM3sAhVWB9L3rOh57aLnZfCJa
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 0pVSFD7q-pwr8xr6m16JkSHWjiIw6y3U
X-Proofpoint-ORIG-GUID: 0pVSFD7q-pwr8xr6m16JkSHWjiIw6y3U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-23_13,2024-01-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=756 spamscore=0 mlxscore=0 phishscore=0 clxscore=1015
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

Add the drm_mode_solid_fill struct to drm_mode.h

This is required for https://patchwork.freedesktop.org/series/110283/

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 include/drm-uapi/drm_mode.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index 7040e7ea80c7..91b468348ba1 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -259,6 +259,30 @@ struct drm_mode_modeinfo {
 	char name[DRM_DISPLAY_MODE_LEN];
 };
 
+/**
+ * struct drm_mode_solid_fill - User info for solid fill planes
+ *
+ * This is the userspace API solid fill information structure.
+ *
+ * Userspace can enable solid fill planes by assigning the plane "solid_fill"
+ * property to a blob containing a single drm_mode_solid_fill struct populated with an RGB323232
+ * color and setting the pixel source to "SOLID_FILL".
+ *
+ * For information on the plane property, see drm_plane_create_solid_fill_property()
+ *
+ * @r: Red color value of single pixel
+ * @g: Green color value of single pixel
+ * @b: Blue color value of single pixel
+ * @pad: padding, must be zero
+ */
+struct drm_mode_solid_fill {
+	__u32 r;
+	__u32 g;
+	__u32 b;
+	__u32 pad;
+};
+
+
 struct drm_mode_card_res {
 	__u64 fb_id_ptr;
 	__u64 crtc_id_ptr;

-- 
2.43.0

