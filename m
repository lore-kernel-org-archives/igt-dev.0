Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6D3D2F7D8
	for <igt-dev@archiver.kernel.org>; Thu, 17 Oct 2024 01:23:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931CE10E2E6;
	Thu, 17 Oct 2024 01:23:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="dYMM5yku";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBF4310E2F0
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Oct 2024 01:23:32 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GGSivm002600;
 Thu, 17 Oct 2024 01:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iBbsJI2ZOxq1JPgAvXNRJIM9y+p/oqs0nXfrAKm9+OE=; b=dYMM5yku7G+I32dz
 sPmfJe4lN3l0NvVXNKmSXksHgkjyGILqWl8B7vkKqEWScfxaUsJ9yvdLaHPViwSj
 DKkvUBI43u1QPnDVlCHzab22Y/3ZTyatutrB52z0icYg/+Yd8boQKKvmJ2+AZ7dc
 WoeDHLY642QCQT0V+T7DPiXdu+y8LyKspsd48oKHKYhL0jduiBBlFIG7+WE5B7kO
 nvucYx5Wdx+wT6Ld6jaYMdsu8au1ibG+E7HjPw1+t5uGsU3USnK60sKmqfyP0AKT
 sIKLkTXmhOSIqWnC+MMlKSAqRz4Nfj06lTxkAG8/91mGc1RxMCeG8PzaXKcUwGOK
 4hH+DQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42a5xykbwt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Oct 2024 01:23:22 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49H1NM4x028962
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Oct 2024 01:23:22 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 16 Oct 2024 18:23:22 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 16 Oct 2024 18:23:00 -0700
Subject: [PATCH i-g-t v5 2/3] lib/igt_kms: loosen duplicate check in
 igt_display_refresh
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241016-igt-cwb-v5-2-8938d43f0b0f@quicinc.com>
References: <20241016-igt-cwb-v5-0-8938d43f0b0f@quicinc.com>
In-Reply-To: <20241016-igt-cwb-v5-0-8938d43f0b0f@quicinc.com>
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: Alex Hung <alex.hung@amd.com>, <quic_abhinavk@quicinc.com>,
 <igt-dev@lists.freedesktop.org>,
 Esha Bharadwaj <quic_ebharadw@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-2a633
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729128201; l=3339;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=8OPbHM5u8bQqWT7EhvHZNAyvol2v7OEYoT6ikTPk6+A=;
 b=XU+Jso0lYpfzrx0n1Ig/951EHUy6HnWVNKVCOXYYtGVRe4QNebDdHrZkji5d2QD9Kp7+M7OK0
 MvYs1bPN2lXDD/qCirjF+E6VvPUByO6YSlmgX+AvI9FTc4gCJqjdC3E
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: K2YNLEStxj5v7P2Vp7U5k8kTiOl_NnBF
X-Proofpoint-ORIG-GUID: K2YNLEStxj5v7P2Vp7U5k8kTiOl_NnBF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=902 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170008
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

Change the duplicate check in igt_display_refresh() so it allows for
pipes to be shared by encoders that are valid clones of each other.

Signed-off-by: Esha Bharadwaj <quic_ebharadw@quicinc.com>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 lib/igt_kms.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++---
 lib/igt_kms.h |  1 +
 2 files changed, 47 insertions(+), 3 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 0641ae3e2104515dd392febb7381f4766112911c..7197f9987b214c7725d90de77f38ea1613fb656f 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3311,6 +3311,48 @@ int kmstest_get_encoder_idx(drmModeRes *resources, drmModeEncoder *encoder)
 	igt_assert(0);
 }
 
+bool igt_output_clone_invalid(int drm_fd, igt_output_t *target, igt_output_t *clone)
+{
+	drmModeEncoder *target_enc;
+	drmModeEncoder *clone_enc;
+	drmModeRes *resources = drmModeGetResources(drm_fd);
+	uint32_t clone_mask;
+
+	if (!target || !clone)
+		return false;
+
+	target_enc = target->config.encoder;
+	clone_enc = clone->config.encoder;
+
+	if (!target_enc || !clone_enc)
+		return false;
+
+	clone_mask = 1 << kmstest_get_encoder_idx(resources, clone_enc);
+
+	return ((target_enc->possible_clones & clone_mask) != clone_mask);
+}
+
+static bool igt_output_has_duplicates(igt_display_t *display, igt_output_t *output,
+				      unsigned long pipes_in_use, int start_idx)
+{
+	igt_output_t *clone_output;
+
+	for (int j = start_idx + 1; j < display->n_outputs; j++) {
+		clone_output = &display->outputs[j];
+
+		/*
+		 * Check that any encoders with duplicated pipes
+		 * are possible clones of each other. If they
+		 * aren't, report the pipe as duplicated
+		 */
+		if ((pipes_in_use & (1 << output->pending_pipe)) &&
+		    igt_output_clone_invalid(display->drm_fd, output, clone_output))
+			return true;
+	}
+
+	return false;
+}
+
 static void igt_display_refresh(igt_display_t *display)
 {
 	igt_output_t *output;
@@ -3318,13 +3360,14 @@ static void igt_display_refresh(igt_display_t *display)
 
 	unsigned long pipes_in_use = 0;
 
-       /* Check that two outputs aren't trying to use the same pipe */
+	/* Check that two non-clone outputs aren't trying to use the same pipe */
 	for (i = 0; i < display->n_outputs; i++) {
 		output = &display->outputs[i];
 
 		if (output->pending_pipe != PIPE_NONE) {
-			if (pipes_in_use & (1 << output->pending_pipe))
-				goto report_dup;
+			if (igt_output_has_duplicates(display, output,
+						      pipes_in_use, i))
+					goto report_dup;
 
 			pipes_in_use |= 1 << output->pending_pipe;
 		}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 728b44f5134d054d7323c673ba08ffb99cb0f2c2..46505f15ef2d8edb1aed1f45ac0d7c86cff9a2f9 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -540,6 +540,7 @@ igt_plane_t *igt_output_get_plane_type_index(igt_output_t *output,
 					     int plane_type, int index);
 igt_output_t *igt_output_from_connector(igt_display_t *display,
     drmModeConnector *connector);
+bool igt_output_clone_invalid(int drm_fd, igt_output_t *target, igt_output_t *clone);
 void igt_output_refresh(igt_output_t *output);
 drmModeModeInfo *igt_std_1024_mode_get(int vrefresh);
 void igt_output_set_writeback_fb(igt_output_t *output, struct igt_fb *fb);

-- 
2.34.1

