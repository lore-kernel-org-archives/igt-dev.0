Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4499D35692
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 08:25:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A4710E625;
	Wed, 28 Jan 2026 08:25:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="d/8Jn5WN";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA3710E625
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 08:25:26 +0000 (UTC)
X-UUID: e1d083e0fc2211f0b7fc4fdb8733b2bc-20260128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=/wFraVQDmseHRzDgoOs1PdNzdDpY9iNRWbjx4b105Hk=; 
 b=d/8Jn5WN4wlzmytQTv4H5aDxGToucV2tepJ6xhSimdmPK6SP36h6d4jryw9FgudF+7TjmYDt14Yh0eFikHYXk8HwSnNPVniTVmBEQksKeVDUGJU7c0uFItzanx9+P+y5WV5Sf3dyOZ0XVi/O1FAhP05yi9y4OQLVfSkTm4R/t68=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11, REQID:ce4117df-cec9-4144-9f6f-a30d1e2fef4f, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:89c9d04, CLOUDID:543f507a-8c8a-4fc4-88c0-3556e7711556,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
 0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
 :0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e1d083e0fc2211f0b7fc4fdb8733b2bc-20260128
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 248221282; Wed, 28 Jan 2026 16:25:19 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 28 Jan 2026 16:25:18 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 28 Jan 2026 16:25:18 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: <igt-dev@lists.freedesktop.org>, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Fei Shao <fshao@chromium.org>
CC: Jani <jani.nikula@intel.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
 Singo Chang <singo.chang@mediatek.com>, Gil Dekel <gildekel@google.com>,
 Yacoub <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH i-g-t 1/2] test/kms_color: Clamp CTM values to -2.0~2.0 for
 MediaTek devices
Date: Wed, 28 Jan 2026 16:24:42 +0800
Message-ID: <20260128082517.920321-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260128082517.920321-1-jason-jh.lin@mediatek.com>
References: <20260128082517.920321-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
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

Use clamp to restrict CTM matrix values to the -2.0 to 2.0 range for
MediaTek devices, ensuring tests do not exceed hardware limits.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 tests/kms_color.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index b2ca6975d6a5..c6cd35d74a2f 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -76,6 +76,8 @@
  * @gamma-lut:          Gamma LUT
  */
 
+#define CTM_SIZE		(9)
+
 IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
 
 static bool test_pipe_degamma(data_t *data,
@@ -1025,7 +1027,7 @@ run_tests_for_pipe(data_t *data)
 		const char *name;
 		int iter;
 		const color_t *fb_colors;
-		double ctm[9];
+		double ctm[CTM_SIZE];
 		const char *desc;
 	} ctm_tests[] = {
 		{ .name = "ctm-red-to-blue",
@@ -1128,6 +1130,19 @@ run_tests_for_pipe(data_t *data)
 	}
 
 	for (i = 0; i < ARRAY_SIZE(ctm_tests); i++) {
+		double fixed_ctm[CTM_SIZE];
+		const double *ctm_ptr = ctm_tests[i].ctm;
+
+		/* The valid value of MediaTek color matrix range is -2.0 ~ 2.0 */
+		if (is_mtk_device(data->drm_fd)) {
+			int j;
+
+			for (j = 0; j < CTM_SIZE; j++)
+				fixed_ctm[j] = clamp(ctm_tests[i].ctm[j], -2.0, 2.0);
+
+			ctm_ptr = fixed_ctm;
+		}
+
 		igt_describe_f("%s", ctm_tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", ctm_tests[i].name) {
 			for_each_pipe_with_valid_output(&data->display, pipe, data->output) {
@@ -1135,7 +1150,7 @@ run_tests_for_pipe(data_t *data)
 					      igt_output_name(data->output))
 					run_ctm_tests_for_pipe(data, pipe,
 							       ctm_tests[i].fb_colors,
-							       ctm_tests[i].ctm,
+							       ctm_ptr,
 							       ctm_tests[i].iter);
 				if (igt_run_in_simulation())
 					break;
-- 
2.43.0

