Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9BBC52D6F
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 11:04:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7BCB10E8D8;
	Wed, 21 Aug 2024 11:04:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UZughF2O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F3710E8D2
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Aug 2024 11:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724238287; x=1755774287;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=geA7glGWnzKsr+UiEvdtjSkkYQThc5kkJ5OL5RT24A4=;
 b=UZughF2OjUZmoG4zqOsQrm1r/9EOuJyuwoTW0bIHtklkYGPgyQb1O9TH
 jqAogaRyE+cJxpWPRYZHVJnxfNMTz4blFHN0YnXxPXTjG8B/it+EvoA4R
 obVjRTH8LF/hEFBxINqKp7RA6IVivP1Oe3MLA9+QbJws2HcP4aGd4uAY2
 L9vhfukA9iMU8JqboEu6hF44r5PJ9GO48J7bKunxx2Nh1DSulR0EDW2Gx
 Mh7kAo7w6qQc7YfJZ2wERTj3N8N9yqTAbhiaOA6PTULITSO+rcX50QOt2
 zcwoEwMD9AS5CeJ/p5ao15Y5IfMI9VwObVetiMnC3u5Y38g6DUZ6ZZjYM g==;
X-CSE-ConnectionGUID: vVKI+1qCSOqf7wey83GSzQ==
X-CSE-MsgGUID: 41tMnOsbSV630neVwGH17Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22203478"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="22203478"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 04:04:47 -0700
X-CSE-ConnectionGUID: wnuEvT7zRZ2nh/N/6OxodQ==
X-CSE-MsgGUID: WFJnZpQKRmK9zj95W58pVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="65407415"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO dgrzegor-mobl2..)
 ([10.245.246.18])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 04:04:45 -0700
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH i-g-t 2/2] lib/gpgpu_shader: Fix write dword shader
Date: Wed, 21 Aug 2024 13:04:16 +0200
Message-Id: <20240821110416.366243-2-dominik.grzegorzek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240821110416.366243-1-dominik.grzegorzek@intel.com>
References: <20240821110416.366243-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Zero out r4 register in media block write message to prevent
errors when the same register was used earlier in the shader.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/gpgpu_shader.c          |  4 ++--
 lib/iga64_generated_codes.c | 18 +++++++++++-------
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
index 991455c49..80bad342a 100644
--- a/lib/gpgpu_shader.c
+++ b/lib/gpgpu_shader.c
@@ -281,6 +281,8 @@ void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
 			       uint32_t y_offset)
 {
 	emit_iga64_code(shdr, media_block_write, "				\n\
+	// Clear message header							\n\
+(W)	mov (16|M0)              r4.0<1>:ud    0x0:ud				\n\
 	// Payload								\n\
 (W)	mov (1|M0)               r5.0<1>:ud    ARG(3):ud			\n\
 (W)	mov (1|M0)               r5.1<1>:ud    ARG(4):ud			\n\
@@ -303,8 +305,6 @@ void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
 	// Load r2.4-7 with tg id Y + ARG(1):ud					\n\
 (W)	mov (1|M0)               r2.1<1>:ud    r0.6<0;1,0>:ud			\n\
 (W)	add (1|M0)               r2.1<1>:ud    r2.1<0;1,0>:ud    ARG(1):ud	\n\
-	// payload setup							\n\
-(W)	mov (16|M0)              r4.0<1>:ud    0x0:ud				\n\
 	// Store X and Y block start (160:191 and 192:223)			\n\
 (W)	mov (2|M0)               r4.5<1>:ud    r2.0<2;2,1>:ud			\n\
 	// Store X and Y block max_size (224:231 and 232:239)			\n\
diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
index 6a08c4844..87270bb46 100644
--- a/lib/iga64_generated_codes.c
+++ b/lib/iga64_generated_codes.c
@@ -3,10 +3,11 @@
 
 #include "gpgpu_shader.h"
 
-#define MD5_SUM_IGA64_ASMS 2c503cbfbd7b3043e9a52188ae4da7a8
+#define MD5_SUM_IGA64_ASMS 96abf1aa2d0cc900ebba8203cefdd30c
 
 struct iga64_template const iga64_code_media_block_write[] = {
 	{ .gen_ver = 2000, .size = 56, .code = (const uint32_t []) {
+		0x80100061, 0x04054220, 0x00000000, 0x00000000,
 		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
 		0x80000061, 0x05154220, 0x00000000, 0xc0ded004,
 		0x80000061, 0x05254220, 0x00000000, 0xc0ded005,
@@ -14,15 +15,15 @@ struct iga64_template const iga64_code_media_block_write[] = {
 		0x80000069, 0x02058220, 0x02000014, 0xc0ded000,
 		0x80000061, 0x02150220, 0x00000064, 0x00000000,
 		0x80001940, 0x02158220, 0x02000214, 0xc0ded001,
-		0x80100061, 0x04054220, 0x00000000, 0x00000000,
-		0x80041a61, 0x04550220, 0x00220205, 0x00000000,
+		0x80041961, 0x04550220, 0x00220205, 0x00000000,
 		0x80000061, 0x04754220, 0x00000000, 0xc0ded002,
 		0x80132031, 0x00000000, 0xd00e0494, 0x04000000,
 		0x80000001, 0x00010000, 0x20000000, 0x00000000,
 		0x80000001, 0x00010000, 0x30000000, 0x00000000,
 		0x80000901, 0x00010000, 0x00000000, 0x00000000,
 	}},
-	{ .gen_ver = 1270, .size = 56, .code = (const uint32_t []) {
+	{ .gen_ver = 1270, .size = 60, .code = (const uint32_t []) {
+		0x80040061, 0x04054220, 0x00000000, 0x00000000,
 		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
 		0x80000061, 0x05254220, 0x00000000, 0xc0ded004,
 		0x80000061, 0x05454220, 0x00000000, 0xc0ded005,
@@ -38,7 +39,8 @@ struct iga64_template const iga64_code_media_block_write[] = {
 		0x80000001, 0x00010000, 0x30000000, 0x00000000,
 		0x80000901, 0x00010000, 0x00000000, 0x00000000,
 	}},
-	{ .gen_ver = 1260, .size = 52, .code = (const uint32_t []) {
+	{ .gen_ver = 1260, .size = 56, .code = (const uint32_t []) {
+		0x80100061, 0x04054220, 0x00000000, 0x00000000,
 		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
 		0x80000061, 0x05154220, 0x00000000, 0xc0ded004,
 		0x80000061, 0x05254220, 0x00000000, 0xc0ded005,
@@ -53,7 +55,8 @@ struct iga64_template const iga64_code_media_block_write[] = {
 		0x80000001, 0x00010000, 0x30000000, 0x00000000,
 		0x80000901, 0x00010000, 0x00000000, 0x00000000,
 	}},
-	{ .gen_ver = 1250, .size = 56, .code = (const uint32_t []) {
+	{ .gen_ver = 1250, .size = 60, .code = (const uint32_t []) {
+		0x80040061, 0x04054220, 0x00000000, 0x00000000,
 		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
 		0x80000061, 0x05254220, 0x00000000, 0xc0ded004,
 		0x80000061, 0x05454220, 0x00000000, 0xc0ded005,
@@ -69,7 +72,8 @@ struct iga64_template const iga64_code_media_block_write[] = {
 		0x80000001, 0x00010000, 0x30000000, 0x00000000,
 		0x80000901, 0x00010000, 0x00000000, 0x00000000,
 	}},
-	{ .gen_ver = 0, .size = 52, .code = (const uint32_t []) {
+	{ .gen_ver = 0, .size = 56, .code = (const uint32_t []) {
+		0x80040061, 0x04054220, 0x00000000, 0x00000000,
 		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
 		0x80000061, 0x05254220, 0x00000000, 0xc0ded004,
 		0x80000061, 0x05454220, 0x00000000, 0xc0ded005,
-- 
2.34.1

