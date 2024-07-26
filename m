Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B6D8C3DA70
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jul 2024 13:21:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD3BB10E992;
	Fri, 26 Jul 2024 13:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GDb/MF/e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0919C10E987
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jul 2024 13:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722000116; x=1753536116;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=CWDWJXrObG6rP2crvQkjijXW7WRoYcxPd7EgDt5xLhc=;
 b=GDb/MF/eVXSZliC1EOafwuQ4NfznZBNd57RVmgVpYJtewHDfsYFMHvWf
 rT6BXMq7Hk7YtzxDDH/i2mFM9zQYmYgYTZy5f/Nvr4CALy9pCg47nDb5T
 RPdXiZ/75XjjEMeh8Ho1uvfwIJ+GsWfrgJ3EqCYlnBZkEUB0CdeEGMeDv
 +867zyWiAABDcjrE3tIYUU0+liDJOjdbMRt10xC0P4Ij/BUXTYXjbZxX6
 7r5jmJAhogdQgDWxx+gKWx5T3FPuEdOInBCkG7ysUPIAmoMYH1vzF4PAa
 283INJd9A9Zhu2dQSoFzym8qDYS9hCMxzavTmYo/k1wrxfT9wdFTtAqqI g==;
X-CSE-ConnectionGUID: S8IF4YCESKqDKON0eKrkQw==
X-CSE-MsgGUID: PVhBn9XNTZSDd4Foyheahg==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="45207566"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="45207566"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 06:21:55 -0700
X-CSE-ConnectionGUID: nk8qF8brR1SqybRNIo8fEg==
X-CSE-MsgGUID: 4xdJ3M9kRCyvP0zwy4vIQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="83905723"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 06:21:54 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 26 Jul 2024 15:21:47 +0200
Subject: [PATCH] lib/gpgpu_shader: add support for PVC and MTL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240726-gpgpu_add_pvc_mtl-v1-1-b53cd1d3b5c8@intel.com>
X-B4-Tracking: v=1; b=H4sIAOqio2YC/x3MQQrCMBBA0auUWRuIoTTiVUTCJDOmAxpDxhah9
 O6NLt/i/w2Um7DCddig8Soq79JxPg2QZiyZjVA3OOtG691kcs11CUgU6prC6/M0bkyeIl3QW4T
 e1cYP+f6ft3t3RGUTG5Y0/05LVdj3A2uLqMd5AAAA
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3400;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=CWDWJXrObG6rP2crvQkjijXW7WRoYcxPd7EgDt5xLhc=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmo6Lx5X4LbxaThxyXxADCtmaYalQ7HY7RZVgHcH4R
 xBBblCCJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZqOi8QAKCRAjYrKT3hD91yThDA
 CB5csobaI69PLhzXnjbChXzAMRcSfhS9c6VYgpwpBAP7W9epfYzT4SVUYHkMjCL4AaYEbSVTqxduIz
 Hmkeqnt4XxrZxgO6dD2UG/3/mwhQH7o4rfTEf4chsdlfOCbQU+TaF+rhMpZn6yS1Jhgybe3/HrZoym
 aQU+8Q6sESrqIqY9ChKOfSfKMuj4pwSRzGI5VyZ9zoXQQ9a58kHHg0N4olcrsaHZTUv4qdsFVaivqR
 lvS+crSUV4DDqebO54CiGV9CLARX02sTZEEbSPGGVktTWrFXz1xTfMQqe3NDpeRgbTruQsykqMJuiL
 SRaDh5JoiomnyGz9zLpyyLHJKDOapKmF1tglbASpcMfygaFkCcdM1QfxO+bMGp7Itx2MnT5Hyt6x/w
 WU7c7Ffn2TaInIUeNc7zEIJQXN0v5GLXA2Ej156y1hHsm8+6BVoC7hD6kNhYKa2k+TVXdxEi1vB+Gy
 s8H4QBbMwAWm+S3FYF5k/I36TpF1QbBoG+NZSx2wkRAB8=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

PVC reports graphic version 12.60, which surprisingly maps to platform
12p72 in iga64, MTL maps 12.70 -> 12p71.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/iga64_generated_codes.c  | 29 +++++++++++++++++++++++++++--
 scripts/generate_iga64_codes |  2 +-
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
index f609ad711b4b..6a08c4844cf0 100644
--- a/lib/iga64_generated_codes.c
+++ b/lib/iga64_generated_codes.c
@@ -22,7 +22,23 @@ struct iga64_template const iga64_code_media_block_write[] = {
 		0x80000001, 0x00010000, 0x30000000, 0x00000000,
 		0x80000901, 0x00010000, 0x00000000, 0x00000000,
 	}},
-	{ .gen_ver = 1272, .size = 52, .code = (const uint32_t []) {
+	{ .gen_ver = 1270, .size = 56, .code = (const uint32_t []) {
+		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
+		0x80000061, 0x05254220, 0x00000000, 0xc0ded004,
+		0x80000061, 0x05454220, 0x00000000, 0xc0ded005,
+		0x80000061, 0x05654220, 0x00000000, 0xc0ded006,
+		0x80000069, 0x04058220, 0x02000024, 0xc0ded000,
+		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
+		0x80001940, 0x04258220, 0x02000424, 0xc0ded001,
+		0x80000061, 0x04454220, 0x00000000, 0xc0ded002,
+		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
+		0x80001901, 0x00010000, 0x00000000, 0x00000000,
+		0x80044031, 0x00000000, 0xc0000414, 0x02a00000,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 1260, .size = 52, .code = (const uint32_t []) {
 		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
 		0x80000061, 0x05154220, 0x00000000, 0xc0ded004,
 		0x80000061, 0x05254220, 0x00000000, 0xc0ded005,
@@ -71,7 +87,16 @@ struct iga64_template const iga64_code_media_block_write[] = {
 };
 
 struct iga64_template const iga64_code_eot[] = {
-	{ .gen_ver = 1272, .size = 8, .code = (const uint32_t []) {
+	{ .gen_ver = 2000, .size = 8, .code = (const uint32_t []) {
+		0x800c0061, 0x70050220, 0x00460005, 0x00000000,
+		0x800f2031, 0x00000004, 0x3000700c, 0x00000000,
+	}},
+	{ .gen_ver = 1270, .size = 12, .code = (const uint32_t []) {
+		0x80030061, 0x70050220, 0x00460005, 0x00000000,
+		0x80001901, 0x00010000, 0x00000000, 0x00000000,
+		0x80034031, 0x00000004, 0x3000700c, 0x00000000,
+	}},
+	{ .gen_ver = 1260, .size = 8, .code = (const uint32_t []) {
 		0x800c0061, 0x70050220, 0x00460005, 0x00000000,
 		0x800f2031, 0x00000004, 0x3000700c, 0x00000000,
 	}},
diff --git a/scripts/generate_iga64_codes b/scripts/generate_iga64_codes
index 3d114ea0e119..d1e40b600ec0 100755
--- a/scripts/generate_iga64_codes
+++ b/scripts/generate_iga64_codes
@@ -7,7 +7,7 @@
 # to minimal GPU generation supported by platform multiplied by 100 and platform
 # is one of platforms supported by -p switch of iga64.
 # Must be in decreasing order, the last one must have gen100 equal 0.
-GEN_VERSIONS="2000:2 1272:12p72 1250:12p5 0:12p1"
+GEN_VERSIONS="2000:2 1270:12p71 1260:12p72 1250:12p5 0:12p1"
 
 # Magic values to encode asm template args, must be the the same as in gpgpu_shader.c.
 IGA64_ARG0=0xc0ded000

---
base-commit: c7aacce8a079574e2151441761308b0f759622c3
change-id: 20240726-gpgpu_add_pvc_mtl-24c7dbd8a70a

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

