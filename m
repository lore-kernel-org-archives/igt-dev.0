Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AF4CD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 08:08:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 813D810EF69;
	Wed, 20 May 2026 08:08:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="VLhNnNup";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0048C10EF67
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 08:07:52 +0000 (UTC)
X-UUID: fe37e3b8542211f1b5a00d44d12bea5a-20260520
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=/mNeVCAzndj2ZfIbBC+Hj7Xoe2j0i0t/XO2e/cqECsk=; 
 b=VLhNnNup2/kQ3xOvNPOuQ+C7q3NmfyoZf+9dc/BgB8cO7Z7bDuN/oXRA4vWmf/ldwVap8gay3NKjUc0TW+KzYjXr1pJ7uiyuYCOh/cGftPPLvjDgrd/R9y4zrJnWG0l01MHw0Uw8vQk+i1ttC4dRNyP5Sevark0e1qlQW4ZXo3w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.14, REQID:0b010f37-2390-40d7-a15b-c0de785db6ab, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:9091e75, CLOUDID:64b1051f-023f-4f87-9e9c-6c116c694fb3,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|865|888|898,TC:-5,Content:0|
 15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
 ,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fe37e3b8542211f1b5a00d44d12bea5a-20260520
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1838807077; Wed, 20 May 2026 16:07:49 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 20 May 2026 16:07:48 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 20 May 2026 16:07:48 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: <igt-dev@lists.freedesktop.org>, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ville Syrjala
 <ville.syrjala@linux.intel.com>, Fei Shao <fshao@chromium.org>
CC: Jani <jani.nikula@intel.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
 Singo Chang <singo.chang@mediatek.com>, Manasi Navare
 <navaremanasi@google.com>, Gil Dekel <gildekel@google.com>, Yacoub
 <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH] tests/kms_hdr: Skip unsupported formats in bpc-switch test
Date: Wed, 20 May 2026 16:07:27 +0800
Message-ID: <20260520080747.3311784-1-jason-jh.lin@mediatek.com>
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
 tests/kms_hdr.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index d50f8778771c..cce34f7149c4 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -286,6 +286,13 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 						      "%s: No suitable mode found to use 10 bpc.\n",
 						      igt_output_name(output));
 
+					igt_require_f(igt_plane_has_format_mod(data->primary,
+									       hdr_test_formats[i],
+									       DRM_FORMAT_MOD_LINEAR),
+						      "%s: Primary plane not support format %s.\n",
+						      igt_output_name(output),
+						      igt_format_str(hdr_test_formats[i]));
+
 					test_bpc_switch_on_output(data, crtc, output,
 								  hdr_test_formats[i], flags);
 				}
-- 
2.43.0

