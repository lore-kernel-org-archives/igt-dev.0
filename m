Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F064CDB466
	for <igt-dev@archiver.kernel.org>; Sun, 21 Jun 2026 08:11:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA88C10E327;
	Sun, 21 Jun 2026 08:11:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="FRzNzz2z";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D7B10E327
 for <igt-dev@lists.freedesktop.org>; Sun, 21 Jun 2026 08:10:53 +0000 (UTC)
X-UUID: b65929c86d4811f1b1788b6acf885367-20260621
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=5XAL0wLwnreSkaXhgm6tkWXTnBOQj0PESR166z8s3/g=; 
 b=FRzNzz2zD3ZMn/qwGyN+AFMIya2VNT+AMGZcsrNe0uonus4BYUavXh9LNuJe5vxqQrvp33xHegoVodSBtcWZTjHa4iNYyxyIN60aTIu4dgGZpAs/h+H5wAPzkB3CzGIn5/uue7PueW+ieyb3O4aDpIAyLDjPeB1lFb6z3P8ABW8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17, REQID:20de9dab-5bf6-4a1c-84ca-e0ff09cada66, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:d497b38, CLOUDID:1b3958a5-9ef7-4489-861a-e83b251ece46,
 B
 ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50,
 EDM:2,IP:nil,URL:1,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
 AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b65929c86d4811f1b1788b6acf885367-20260621
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 122520110; Sun, 21 Jun 2026 16:10:48 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 21 Jun 2026 16:10:47 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sun, 21 Jun 2026 16:10:47 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: <igt-dev@lists.freedesktop.org>, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ville Syrjala
 <ville.syrjala@linux.intel.com>, Fei Shao <fshao@chromium.org>
CC: Jani <jani.nikula@intel.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Lancelot Wu
 <Lancelot.Wu@mediatek.com>, Manasi Navare <navaremanasi@google.com>, Gil
 Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH i-g-t v2] tests/kms_hdr: Skip unsupported formats in
 bpc-switch test
Date: Sun, 21 Jun 2026 16:07:27 +0800
Message-ID: <20260621081043.598388-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
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

Check if the primary plane supports the test format before attempting
to create framebuffer. This allows the test to gracefully skip formats
not supported by the hardware (e.g., FP16 formats on MediaTek) instead
of failing with assertion errors.

Fixes: 5d46625cfb21 ("tests/kms_hdr: add FP16 format coverage")
Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

---

Change in v2:
1. Fix grammatical error "not" -> "dosen't"
2. Rebased on: https://patchwork.freedesktop.org/series/168759

---
 tests/kms_hdr.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 2079bc154412..ac75f66f34a0 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -298,9 +298,17 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 
 				igt_dynamic_f("pipe-%s-%s-%s",
 					      igt_crtc_name(crtc), output->name,
-					      igt_format_str(hdr_test_formats[i]))
+					      igt_format_str(hdr_test_formats[i])) {
+					igt_require_f(igt_plane_has_format_mod(data->primary,
+									       hdr_test_formats[i],
+									       DRM_FORMAT_MOD_LINEAR),
+						      "%s: Primary plane doesn't support format %s.\n",
+						      igt_output_name(output),
+						      igt_format_str(hdr_test_formats[i]));
+
 					test_bpc_switch_on_output(data, crtc, output,
 								  hdr_test_formats[i], flags);
+				}
 
 				test_fini(data);
 			}
-- 
2.43.0

