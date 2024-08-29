Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C14C54FC6
	for <igt-dev@archiver.kernel.org>; Thu, 29 Aug 2024 03:06:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4423510E148;
	Thu, 29 Aug 2024 03:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="pUs5p16h";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CFB810E148
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Aug 2024 03:06:00 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SJMEgV013576;
 Thu, 29 Aug 2024 03:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Q5TXCN/DvsGZ/UgKf2ANTu5fSZSRL7OhPowAzi1O+/o=; b=pUs5p16h4H6fXpkv
 hEDg5jJ6SD5288Bf2UKaRuVzP9kMDVppMP4RHQi6hTwzuJvREWNbFP+EnlwrFKkU
 B5bDlOaxBYnJQAGI7fb6iqozYHzZ7kJ0+MX6Boex07j9L/2tatCbxBFoG5XEbaEo
 AfcdI0iYGg3mATpWF0JV4e2sSvl9fmO/zkvVfHKd8L5pH7TTC0fCXpIfvpsfrRDv
 X7OWR+eruPFkwpW1MLBESKomBs1vVdKzRieonQ8BPiXJmMqhgHwIYrmFxQLF9Zqs
 xfUQZKuqtwEErAaVggs1KWdeSpvmqloKAQJ6QDr7x16bNBMJgxRRckojLO580pvE
 B7CWQA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419px5kqcc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2024 03:05:51 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47T35pq5013926
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2024 03:05:51 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 28 Aug 2024 20:05:51 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 28 Aug 2024 20:05:33 -0700
Subject: [PATCH v2 2/5] lib/igt_kms: Add helper to get encoder index
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240828-igt-cwb-v2-2-7b255c730c55@quicinc.com>
References: <20240828-igt-cwb-v2-0-7b255c730c55@quicinc.com>
In-Reply-To: <20240828-igt-cwb-v2-0-7b255c730c55@quicinc.com>
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: Alex Hung <alex.hung@amd.com>, <quic_abhinavk@quicinc.com>,
 <quic_ebharadw@quicinc.com>, <igt-dev@lists.freedesktop.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724900750; l=2915;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=28ANhJ1ATnLogP+odMYbrfKYKEGxK19l1fORIiS42kg=;
 b=FgvnUT6qyhtLGxmeQ8qwca/sZ1VRE0gTMfSt2TwFz27eQOqdkhJCLbIsUqI/1ef8NTv4mN9W1
 cF7+4aXDJ5jB5U1IeuR3I37fw5PPqqKBkWzM0PB96uh9ldB1dERGhPW
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: L7SmBXCeLVr5spS2rEEp8B8cx16-iVAv
X-Proofpoint-GUID: L7SmBXCeLVr5spS2rEEp8B8cx16-iVAv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 adultscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=708 spamscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408290022
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
index dd530dbab..fec8860d0 100644
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

