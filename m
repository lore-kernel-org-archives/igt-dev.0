Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 276F2CF3962
	for <igt-dev@archiver.kernel.org>; Thu, 19 Sep 2024 17:27:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE7F10E735;
	Thu, 19 Sep 2024 17:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="odmzd1mI";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E873710E736
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Sep 2024 17:27:20 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48J9uI9O023182;
 Thu, 19 Sep 2024 17:27:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iW1UU/gGncPwy6jUmSdm8Vvesx08TwAZfHdV5ugkVfM=; b=odmzd1mIHOZXu9nk
 +tbRmw/a0jlcfEcgNq7KSwlGP/t1YF0k4WyE/D9r5g2Qo+s/H662Jugjfgme3dYB
 sGoGHTD+8Z1GvZN69UUWHcjtAvuervsWWdIxSbKMtRXJeDQkNA0crn1mAKc7HYIa
 QMIq4AoaXbJUiQj/BN/SXR9cjqUXeKSZ6r0sdbXNFm77nV+zptBSQSsFCBwQ1Ftw
 nCFBHMmQ5JhPGGQb/3JQJckeXo/AbzGajicfIr2cufh6TIGWtCn88OdGHzihXEfY
 CfAmveAl2iteuhsvct4PyoZ4eEsmDgdHz+5ljGzJK0STuQyinQ6525g+RYfUvkgq
 zeSf6A==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4hfp7hn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Sep 2024 17:27:05 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48JHR42O009700
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Sep 2024 17:27:04 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 19 Sep 2024 10:27:04 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Thu, 19 Sep 2024 10:26:51 -0700
Subject: [PATCH i-g-t v3 2/3] lib/igt_kms: Add helper to get encoder index
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240919-igt-cwb-v3-2-2bb3161f1f96@quicinc.com>
References: <20240919-igt-cwb-v3-0-2bb3161f1f96@quicinc.com>
In-Reply-To: <20240919-igt-cwb-v3-0-2bb3161f1f96@quicinc.com>
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: Alex Hung <alex.hung@amd.com>, <quic_abhinavk@quicinc.com>,
 <quic_ebharadw@quicinc.com>, <igt-dev@lists.freedesktop.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726766824; l=2915;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=zgqxilko771ioPok5NqEhM7p5QehnngaqNejgA08BAQ=;
 b=jp35mXZxWGGkFhwud8g129PPeflOkplSarLZ4UcLdLkCSz6kvgExqvSXjnTesHqjMN+e2+V2Y
 1xNw/ygns54DpIwO9CpiJVmmYG0AHwlBwoNMEGHwy1uIxZKgoE4mbYT
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 3C7HPxtRKYgMBH1GCxc7yJyMnDfCOxYx
X-Proofpoint-ORIG-GUID: 3C7HPxtRKYgMBH1GCxc7yJyMnDfCOxYx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 phishscore=0 malwarescore=0 mlxlogscore=728 mlxscore=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409190116
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

From: Esha Bharadwaj <quic_ebharadw@quicinc.com>

Move the get_encoder_idx() helper within the kms_setmode test to
lib/igt_kms

Signed-off-by: Esha Bharadwaj <quic_ebharadw@quicinc.com>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 lib/igt_kms.c       | 15 +++++++++++++++
 lib/igt_kms.h       |  1 +
 tests/kms_setmode.c | 14 ++------------
 3 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index b40470c02..f5fab7f73 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3271,6 +3271,21 @@ void igt_display_fini(igt_display_t *display)
 	display->planes = NULL;
 }
 
+/**
+ * kmstest_get_encoder_idx:
+ * @resources: libdrm resources pointer
+ * @encoder: libdrm encoder pointer
+ *
+ * Get encoder index from encoder_id
+ */
+int kmstest_get_encoder_idx(drmModeRes *resources, drmModeEncoder *encoder)
+{
+	for (int i = 0; i < resources->count_encoders; i++)
+		if (resources->encoders[i] == encoder->encoder_id)
+			return i;
+	igt_assert(0);
+}
+
 static void igt_display_refresh(igt_display_t *display)
 {
 	igt_output_t *output;
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 25ba50916..72fe3b3b1 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -295,6 +295,7 @@ void *kmstest_dumb_map_buffer(int fd, uint32_t handle, uint64_t size,
 void kmstest_dumb_destroy(int fd, uint32_t handle);
 void kmstest_wait_for_pageflip(int fd);
 unsigned int kmstest_get_vblank(int fd, int pipe, unsigned int flags);
+int kmstest_get_encoder_idx(drmModeRes *resources, drmModeEncoder *encoder);
 
 bool kms_has_vblank(int fd);
 
diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index bc7b8fabb..c504d5a56 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -268,16 +268,6 @@ found:
 	*mode_ret = *mode;
 }
 
-static int get_encoder_idx(drmModeRes *resources, drmModeEncoder *encoder)
-{
-	int i;
-
-	for (i = 0; i < resources->count_encoders; i++)
-		if (resources->encoders[i] == encoder->encoder_id)
-			return i;
-	igt_assert(0);
-}
-
 static void get_crtc_config_str(struct crtc_config *crtc, char *buf,
 				size_t buf_size)
 {
@@ -370,7 +360,7 @@ static void setup_crtcs(const struct test_config *tconf,
 			config_valid &= !!(encoder->possible_crtcs &
 					  (1 << crtc->crtc_idx));
 
-			encoder_mask |= 1 << get_encoder_idx(resources,
+			encoder_mask |= 1 << kmstest_get_encoder_idx(resources,
 							     encoder);
 			config_valid &= !(encoder_mask &
 					  ~encoder->possible_clones);
@@ -396,7 +386,7 @@ static void setup_crtcs(const struct test_config *tconf,
 			idx = cconf[i].crtc_idx;
 
 		encoder = drmModeGetEncoder(drm_fd, connector->encoders[idx]);
-		encoder_usage_count[get_encoder_idx(resources, encoder)]++;
+		encoder_usage_count[kmstest_get_encoder_idx(resources, encoder)]++;
 		drmModeFreeEncoder(encoder);
 	}
 	for (i = 0; i < resources->count_encoders; i++)

-- 
2.34.1

