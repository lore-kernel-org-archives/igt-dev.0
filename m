Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0306CCF9F2
	for <igt-dev@archiver.kernel.org>; Wed, 25 Sep 2024 20:37:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC1D610EA42;
	Wed, 25 Sep 2024 20:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="AMdvcsAI";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E5610E71F
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Sep 2024 20:37:55 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48PH5Bkv013258;
 Wed, 25 Sep 2024 20:37:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /FygsFIhsHGeOaSRUfzBVa6jMb37+gjND2yrx15czpA=; b=AMdvcsAItyK7Gc/T
 UAufLoWF1nrJJ7RtuTctaH7EFZYpt+XdJv+jHo1fWD5PBO2UsamCGoLmTX+eFF2R
 cKBnBS079UrT4KRoE0ETj+zhPZW/1Fw86IH2609rTOzgiAM+yMCMylwZFdthBBcT
 bTjV+mnk6T6k/k9JI+WimJGN+SNzGKV0bgVAnZAcqVdoOX/nKKbvEVPs9Yqh+EH9
 MjyvM9blBmIa2Fj1rdqPmd3dNMQVunuOzW1trWvgJMe106f/glg3WdS7zxdk3gL4
 0JlMWx6xFhdbu8fD/ZQF2spH5JTZlAu1N4PfYpCeHURNXYAvQUJm/h7aH+mmpZjx
 1COTsw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41snqynexk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Sep 2024 20:37:46 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48PKbiSl017235
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Sep 2024 20:37:44 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Sep 2024 13:37:44 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 25 Sep 2024 13:37:20 -0700
Subject: [PATCH i-g-t v4 3/4] lib/igt_kms: loosen duplicate check in
 igt_display_refresh
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240925-igt-cwb-v4-3-e516cd1e888e@quicinc.com>
References: <20240925-igt-cwb-v4-0-e516cd1e888e@quicinc.com>
In-Reply-To: <20240925-igt-cwb-v4-0-e516cd1e888e@quicinc.com>
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: Alex Hung <alex.hung@amd.com>, <quic_abhinavk@quicinc.com>,
 <igt-dev@lists.freedesktop.org>,
 Esha Bharadwaj <quic_ebharadw@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727296663; l=2829;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=ZVAOwXRPcEdmGK0CZjrOSlJaju8xAGOIPTCqLB1ES3A=;
 b=W08KZj9ig9qGVoM7gpf6IT2R5HYX7ltgHmeCz+a0SzToh+ciC4Uq9LkEs4aawxwLj5PaEsRW5
 lSCpR5h1MLcAzz+7RMDLl6OMZ7QqKnwXNxARm7YXKIiFd+GOnfXHStR
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: W1NlYqJ3USwtw95M7eJWeMqkG1DoxABW
X-Proofpoint-ORIG-GUID: W1NlYqJ3USwtw95M7eJWeMqkG1DoxABW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 mlxlogscore=986
 spamscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409250145
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
 lib/igt_kms.c | 42 +++++++++++++++++++++++++++++++++---------
 lib/igt_kms.h |  1 +
 2 files changed, 34 insertions(+), 9 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index f5fab7f73..a17efc364 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3286,22 +3286,46 @@ int kmstest_get_encoder_idx(drmModeRes *resources, drmModeEncoder *encoder)
 	igt_assert(0);
 }
 
-static void igt_display_refresh(igt_display_t *display)
+bool igt_output_clone_valid(int drm_fd, igt_output_t *target, igt_output_t *clone)
 {
-	igt_output_t *output;
-	int i;
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
 
-	unsigned long pipes_in_use = 0;
+	return ((target_enc->possible_clones & clone_mask) != clone_mask);
+}
+
+static void igt_display_refresh(igt_display_t *display)
+{
+	igt_output_t *output, *clone_output;
+	int i, j;
 
-       /* Check that two outputs aren't trying to use the same pipe */
 	for (i = 0; i < display->n_outputs; i++) {
 		output = &display->outputs[i];
 
-		if (output->pending_pipe != PIPE_NONE) {
-			if (pipes_in_use & (1 << output->pending_pipe))
-				goto report_dup;
+		for (j = i + 1; j < display->n_outputs; j++) {
+			clone_output = &display->outputs[j];
 
-			pipes_in_use |= 1 << output->pending_pipe;
+			/*
+			 * Check that any encoders with duplicated pipes are
+			 * possible clones of each other. If they aren't, report
+			 * the pipe as duplicated
+			 */
+			if (!igt_output_clone_valid(display->drm_fd,
+						output, clone_output))
+				goto report_dup;
 		}
 
 		if (output->force_reprobe)
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 72fe3b3b1..2d272f1fa 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -525,6 +525,7 @@ igt_plane_t *igt_output_get_plane_type_index(igt_output_t *output,
 					     int plane_type, int index);
 igt_output_t *igt_output_from_connector(igt_display_t *display,
     drmModeConnector *connector);
+bool igt_output_clone_valid(int drm_fd, igt_output_t *target, igt_output_t *clone);
 void igt_output_refresh(igt_output_t *output);
 drmModeModeInfo *igt_std_1024_mode_get(int vrefresh);
 void igt_output_set_writeback_fb(igt_output_t *output, struct igt_fb *fb);

-- 
2.34.1

