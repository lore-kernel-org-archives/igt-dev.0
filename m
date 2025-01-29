Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF74C0218D
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jan 2025 03:31:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5E510E05C;
	Wed, 29 Jan 2025 03:31:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="UBMyc4O9";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BCED10E05C
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2025 03:31:32 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T2hVfX003608;
 Wed, 29 Jan 2025 03:31:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5ahicJto5MM8Dq9LTw7pvUNwCla/J5Bnoxc8NG1cJfU=; b=UBMyc4O9lF5QinHG
 KEcoTfmgSbBRKlspi+pSkiI1SbzlLYkM2Hlw/fziaMWsJUhlDdKycJVtCGItGkR+
 ALxfM4uWMK7j8Ol356ODWZRXWkn9gDCYWUV6KMgPZYVvu0ptT7FHGgn32OdMoaX3
 fgT1Ls2/20xr9HMOBC9YIW+CsQ+OjbfD8WF8Vhtsx9VRb7gqCjzKTniZkZ6vj76D
 0zZVUtTvPX5m8YPpQdhRIqqrFO4MdlUSB/A05XRWlo9BfZwZEFBCY8DnNFCyn1H0
 aOYaYx6z0ygd8rvDh5hX4MgtLK3mU0bmPlEFCDK9ykS3NNVfuToflorPzPJmmyaR
 LilBDg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44f97q09bm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jan 2025 03:31:24 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50T3V4fr012589
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jan 2025 03:31:04 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 28 Jan 2025 19:31:03 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 28 Jan 2025 19:29:47 -0800
Subject: [PATCH i-g-t v5 1/3] lib/igt_kms: Add helper to get encoder index
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250128-igt-cwb-v5-1-82652cec29a3@quicinc.com>
References: <20250128-igt-cwb-v5-0-82652cec29a3@quicinc.com>
In-Reply-To: <20250128-igt-cwb-v5-0-82652cec29a3@quicinc.com>
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <quic_abhinavk@quicinc.com>, <igt-dev@lists.freedesktop.org>, Alex Hung
 <alex.hung@amd.com>, Esha Bharadwaj <quic_ebharadw@quicinc.com>, "Jessica
 Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738121463; l=3100;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=iFpbcE5FqujJjgYi3d8vX0BFtdmaro2SYjPRtR8T+94=;
 b=HO5r/SciFvMnsuyR7cz+krqPHRkyORVgYmuZ2kNEehBqM9RdPTx5a9M8i6ASXnmN6KrBlwyyC
 HSOepDhU63XCg42Evh9FKG55n5oJpUPINQFrfgp8uCZEH64RC/GcgUG
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: x6L1hEKJO88ra0IEW0MjZ2RkMI1HTXK6
X-Proofpoint-ORIG-GUID: x6L1hEKJO88ra0IEW0MjZ2RkMI1HTXK6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 clxscore=1011 mlxscore=0 mlxlogscore=826 suspectscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501290027
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
index 90f44b4d3a8607d1caedccf50691fae7aaf2d079..4b14c94e226a9a103bc3a3bc26099566a6eb274b 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3324,6 +3324,21 @@ void igt_display_fini(igt_display_t *display)
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
index 8810123fbebeb68f5c549c434d6ca69a123cfb90..e4f7b6c62fd536aa4ea3eb3153d8e1935cf560fd 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -314,6 +314,7 @@ void kmstest_dumb_destroy(int fd, uint32_t handle);
 void kmstest_wait_for_pageflip(int fd);
 void kmstest_wait_for_pageflip_timeout(int fd, uint64_t timeout_us);
 unsigned int kmstest_get_vblank(int fd, int pipe, unsigned int flags);
+int kmstest_get_encoder_idx(drmModeRes *resources, drmModeEncoder *encoder);
 
 bool kms_has_vblank(int fd);
 
diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index d61cfeb9af22c12ae1f5aad5d06ccb9e01fc52d3..600524d98359fbf713be99de931e53b8ecf167b0 100644
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

