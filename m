Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F51C87FC3
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 18:46:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 814F010E88D;
	Thu, 17 Jul 2025 18:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Dlrd/jm0";
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A41FA10E15A
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 18:46:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 48143441C4;
 Thu, 17 Jul 2025 18:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1752778002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xtbHvIL8vBbMPb+1YFao5iTtw12H8yuOrfzJh2OyAfs=;
 b=Dlrd/jm0er328zKIHys006ansA2HhgSkLUMeT2u/a52q4aLog86ovJiNzJPfq1uHIKpf6L
 6r8IAeIe/keaqbiNgxxf9wyrNEv95tJYs44GLCcTXfudzDm3Cr5IrTh1onHbX3lYeUvhg6
 TQKDXMy7PyC0jXz8IqSHYZt0QB5221Ctv3fiqe8gezYsxqmVi3f9jhix01IJeIzLgVCzAG
 VxcAIecH2P1ThECtTWRj8tfhgCxHjaDoPQjPqVzPRg68Ee5KSJ3o0V+zK+kcgFJZ41o8NT
 I4aEo1Zm0iq4tOzuBIQFH66Ns0n+38v6rQadVC+maLfNWcy6eR/n7RG7Z4eyHw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 17 Jul 2025 20:46:29 +0200
Subject: [PATCH DO NOT MERGE i-g-t v2 09/26] lib/unigraf: Add used defines
 for TSI_Types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-unigraf-integration-v2-9-77dc329e584c@bootlin.com>
References: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
In-Reply-To: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, mark.yacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2331;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=ZPAGaN9Hk8LproNt+cQz1MkfAfoxH7Utg+99vRFYZaY=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoeUUJd4rA3ofLHMChB3wgdLpKgk+iKRzeBSxQ/
 3SavCKCOQOJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaHlFCQAKCRAgrS7GWxAs
 4tF7D/4/klnikpiK6Qkr6DSXrW0xYeL9UTejnkkbHbAHDqzFJ2fzDxka+ED4zyyVlB7mcm1kERy
 5pTD6dmySCJuvFGN4Qgul8+c2/UvBLX7gWgXRRU41Yk0YwRH9NxfSxFjgskD5E7+kmrT4/GLn8M
 MV7IyAWQSQ1cVjI5cZjMj3P8i5ljW3kv7zzS42dwG2cVURobmCsR6kyYtRcQRMTAhR745LjunvE
 vrpjYpE6T/KFr79jYisCF8mp8iV3z7crlDaYCa35WBL4ezN6MfDTtTjDEh4sJ/dKq3ztYjHcGwO
 3pUHj3KKmTT9qG5h9HXSM14vdnGf3rI43s9V9pRDZhSC2JkcsCVI+KqUxERTBy0jDin0Go23qrg
 CA0xQgsX+b6QvuM49kjCWXQZrz5HbZIIbaHUR1HLA74dFO4bS7Sw48exNPFK+A+v6ZV4rsLJ0uT
 /LulKY7dAl6U2dbPs6XDVD8ENjyHtNyDtWIF59p00w7+8ICpsYxLFuKzy1jszU937cAOEYbnx/v
 P9fUp4trLPRGNJrJhfCUdvKmZ2UnyNshNsmZQvG07TMp+bvjwAFGM/mt+J4VCh9TKC1ccg6fKDV
 rER4d2nkcwsveNFjMAOmcSuyqEAOrGbNrnzJvn5p95knTaekjojWilNVqx6jQ6uSTbV70bMSzuc
 uoLfCRb2DyMCs9Q==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeiudefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehtdejtddtteeiiefgleejkeetteevhfdukeegleffjeehgeeivefhgeduffdvvdenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrieejngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepihhgthdquggvvheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrrhhkrdihrggtohhusgesghhoohhglhgvrdgtohhm
X-GND-Sasl: louis.chauvet@bootlin.com
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

Current unigraf public release are not c-compatible, this file hardcode
some values The next release of libTSI should include a c-compatible
TSI_types.h file, that will be directly used in place of this file.
---
 lib/unigraf/TSI_types.h | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/lib/unigraf/TSI_types.h b/lib/unigraf/TSI_types.h
new file mode 100644
index 0000000000000000000000000000000000000000..583ee30ef658b1dbc98cde295fd63d8d36602725
--- /dev/null
+++ b/lib/unigraf/TSI_types.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: MIT */
+
+// DO NOT MERGE THIS FILE
+//
+// Current unigraf public release are not c-compatible, this file hardcode some values
+// The next release of libTSI should include a c-compatible TSI_types.h file, that will
+// be directly used in place of this file
+
+#ifndef TSI_REG_H
+
+#define TSI_VERSION_TEXT			0x80000001
+#define TSI_DEVCAP_VIDEO_CAPTURE		0x00000001
+#define TSI_SEARCHOPTIONS_SHOW_DEVICES_IN_USE	0x00000001
+
+#define TSI_EDID_TE_INPUT			0x1100
+#define TSI_EDID_SELECT_STREAM			0x1102
+
+#define TSI_BASE_LEGACY_GENERIC(offset)		(0x210 + offset)
+#define	TSI_FORCE_HOT_PLUG_STATE_W		TSI_BASE_LEGACY_GENERIC(0x2)
+
+#define TSI_BASE_HDRX(offset)			(0x50000000u + 0x23000 + offset)
+#define TSI_HDRX_HPD_CONTROL_W			TSI_BASE_HDRX(0x02)
+
+#define TSI_DPRX_LINK_FLAGS_MST			0x01
+#define TSI_DPRX_LINK_FLAGS_TPS3		0x02
+#define TSI_DPRX_LINK_FLAGS_TPS4		0x03
+#define TSI_DPRX_LINK_FLAGS_EDP			0x04
+#define TSI_DPRX_NOT_DOCUMENTED_SIDEBAND_MSG_SUPPORT	0x20
+
+#define TSI_BASE_DPRX(offset)			(0x50000000u + 0x21000 + offset)
+#define TSI_DPRX_HPD_FORCE			TSI_BASE_DPRX(0x12)
+#define TSI_DPRX_MST_SINK_COUNT			TSI_BASE_DPRX(0x9D)
+
+#define TSI_BASE_LEGACY_DPRX(offset)		(0x2b0 + offset)
+#define TSI_DPRX_DPCD_BASE_W			TSI_BASE_LEGACY_DPRX(0x9)
+#define TSI_DPRX_DPCD_DATA			TSI_BASE_LEGACY_DPRX(0xA)
+#define TSI_DPRX_LINK_FLAGS			TSI_BASE_LEGACY_DPRX(0x12)
+#define TSI_DPRX_STREAM_SELECT			TSI_BASE_LEGACY_DPRX(0x13)
+#define TSI_DPRX_CRC_R_R			TSI_BASE_LEGACY_DPRX(0x14)
+#define TSI_DPRX_CRC_G_R			TSI_BASE_LEGACY_DPRX(0x15)
+#define TSI_DPRX_CRC_B_R			TSI_BASE_LEGACY_DPRX(0x16)
+#define TSI_DPRX_HPD_PULSE_W			TSI_BASE_LEGACY_DPRX(0x1B)
+
+#endif

-- 
2.50.0

