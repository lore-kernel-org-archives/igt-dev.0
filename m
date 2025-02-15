Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692CEC021A4
	for <igt-dev@archiver.kernel.org>; Sat, 15 Feb 2025 00:17:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D773410E119;
	Sat, 15 Feb 2025 00:17:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="GLZe0vyZ";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24F610E03B
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Feb 2025 00:16:58 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51EBgoYj018077;
 Sat, 15 Feb 2025 00:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uwzqJTHNRn6Mr5CNyc6ZofHZLU9bxX5y8/d4AHkXgSM=; b=GLZe0vyZiIXWfYku
 ENzaM5QV/wuIWRKAD1xj2jdQeQo9+HEuc6dPw4mzBIvYqZwuLdxnnp6jpfGeKk5P
 R4FB2UyJ/mjj2fpex/ZSE8ZowBpE6K723Korx3JP44PGQIbCT0i2AMcOwvbgQILG
 SxH/KAQjbrgSmPfI1r0Gk+HSAM/Uhlf1klkeEWMeNqXVHx9Dpp9rFHKiOwGc1AB8
 uKU34iRJfUQ6YYmafOluR0M9AT3oFKUDLKRxLOLpc8tvdLd+LoPnoR8NvZN5LeAK
 bPUTwbAJtxlJ1SsmX+a41TdYlwaHXF4yL6kYxVEhZXTdF0WQqZpYWJ/auc2bd8Wz
 nvg9ZA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44t56vhmbd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 15 Feb 2025 00:16:49 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51F0Gn6C014579
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 15 Feb 2025 00:16:49 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 14 Feb 2025 16:16:48 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 14 Feb 2025 16:15:51 -0800
Subject: [PATCH i-g-t v7 1/3] lib/igt_kms: Add helper to get encoder index
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250214-igt-cwb-v7-1-66cac72d0c38@quicinc.com>
References: <20250214-igt-cwb-v7-0-66cac72d0c38@quicinc.com>
In-Reply-To: <20250214-igt-cwb-v7-0-66cac72d0c38@quicinc.com>
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <quic_abhinavk@quicinc.com>, <igt-dev@lists.freedesktop.org>, Alex Hung
 <alex.hung@amd.com>, Swati Sharma <swati2.sharma@intel.com>, Karthik B S
 <karthik.b.s@intel.com>, Esha Bharadwaj <quic_ebharadw@quicinc.com>,
 "Jessica Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-f0f05
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739578608; l=3344;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=4Ad+wjSqMhDtRRn2L9oVPAkEr1dCOpI/3cVFBK1OPn8=;
 b=OKFbRuzMJkaBlqRw87H3LUigHmAYLwu6P2MSRjf1LIeVTIyi/cWPEfeKz1MhPDxBwtGycDjuj
 SuJ7ISX342iD2yJ+/d2+DBaGXSqEAGEPuD2g9UZcUitUj1ZMkWdWTpK
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: cW0OxjOgPpHwvoICMLVJvUTpDI6J5_eO
X-Proofpoint-GUID: cW0OxjOgPpHwvoICMLVJvUTpDI6J5_eO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_10,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 mlxlogscore=938 mlxscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502150000
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
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
Changes in v7:
- Added newline before igt_assert (Kamil)
- Added error message for igt_assert (Kamil)
- Fixed alignment issue in kms_setmode (Swati)
---
 lib/igt_kms.c       | 17 +++++++++++++++++
 lib/igt_kms.h       |  1 +
 tests/kms_setmode.c | 16 +++-------------
 3 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 0ba1afb08..ab35a11f8 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3324,6 +3324,23 @@ void igt_display_fini(igt_display_t *display)
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
+
+	igt_assert_f(0, "Error: cannot find encoder id %d in range of 0...%d\n",
+		     encoder->encoder_id, resources->count_encoders - 1);
+}
+
 static void igt_display_refresh(igt_display_t *display)
 {
 	igt_output_t *output;
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 7227f0b0e..55c24149a 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -314,6 +314,7 @@ void kmstest_dumb_destroy(int fd, uint32_t handle);
 void kmstest_wait_for_pageflip(int fd);
 void kmstest_wait_for_pageflip_timeout(int fd, uint64_t timeout_us);
 unsigned int kmstest_get_vblank(int fd, int pipe, unsigned int flags);
+int kmstest_get_encoder_idx(drmModeRes *resources, drmModeEncoder *encoder);
 
 bool kms_has_vblank(int fd);
 
diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index d61cfeb9a..b4c7c052b 100644
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
@@ -370,8 +360,8 @@ static void setup_crtcs(const struct test_config *tconf,
 			config_valid &= !!(encoder->possible_crtcs &
 					  (1 << crtc->crtc_idx));
 
-			encoder_mask |= 1 << get_encoder_idx(resources,
-							     encoder);
+			encoder_mask |= 1 << kmstest_get_encoder_idx(resources,
+								     encoder);
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
2.48.1

