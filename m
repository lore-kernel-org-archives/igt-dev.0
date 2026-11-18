Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4CF606A320
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 14:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hgf1wIlY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE69010FD64;
	Wed, 18 Nov 2026 14:51:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A84310FD5F
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 14:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795013374; x=1826549374;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=RWubcAJb+ZNNZD8bo92Js3I5g/XsFF+QR3z3qCO9SkM=;
 b=hgf1wIlYfkFPI0tRbYafn7zAvv1r0KIqMmZ6/bUbDu7Pox/Ric60Huki
 pgI9SPcaOHNm1X0ExGxiTDD98i3JViS1uHYZnKgaK5qESHEe3TsqUv+Uj
 Gs5otZXi6/VNXTgziK8KoYm0CbxkJRhsDJLQzQX13b7ssZnTgeJssQrOm
 iJ0CE5GjZh+DAo/F+q/RChRtuZS/AehpVlrsleRF+OwKMCT++RUHnrNdR
 tCC8A18LXuK2MqvbMZWx8evvhiPw3yBLSazHKrVw0GyyUlrLTk6i1a5Uc
 uwgVkpyfzfS4zmFknxhUFvAh9uUh1hj6C97s2ROCV7fqBUNphqv3VIs7f w==;
X-CSE-ConnectionGUID: mXFQKMLsT1CeULdteEbu9Q==
X-CSE-MsgGUID: nPuJCZQRTga5AQWq9CVhMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3711325"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3711325"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 06:49:32 -0800
X-CSE-ConnectionGUID: /4pOP+1LQECJCrFcSZoORw==
X-CSE-MsgGUID: eXbAQrG1S4mhMozbmVzn/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10047156"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 06:49:31 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Wed, 18 Nov 2026 15:47:19 +0100
Subject: [PATCH 1/2] lib/gpgpu: re-generate shaders
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-rebuild_shaders-v1-1-92bf629f4f27@intel.com>
References: <20261118-rebuild_shaders-v1-0-92bf629f4f27@intel.com>
In-Reply-To: <20261118-rebuild_shaders-v1-0-92bf629f4f27@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.17-dev-6be7c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1323;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=RWubcAJb+ZNNZD8bo92Js3I5g/XsFF+QR3z3qCO9SkM=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBq/bqARcQO4mWQ+9y92rrOrGOIYjBePRxhawJIr
 Vw8U/Q/OXmJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCav26gAAKCRAjYrKT3hD9
 17FxC/9C16u8sY1lkSHzjOitV2Lh71Hp2PK4y9JdIY7p5z4JY0lkrJPv2Swi9xdzBW/swPdCDEY
 cP+r3IoEXYIdoCcBa0nVRRDM9QSB5mdoE2IXva4NunkUiQ+FrKLWaZllPUoFOoCu857L3TWFDQw
 bxuYpFF1hFfpCI30DPcwF7UZO6y5mXDKZMbeX7F0nAWEixLQMqvQe7iQWIMdud8selm7LgU1hzw
 1VcDdkuscRblmOa4fVYFPLL7lAJygUutdXBw+YipmdKQnGxVmXi5PtL9gyFtyP2l7hj63AVEA5T
 TdG37BoCdK5VlqutHR5ljCFWvzirP+JuL7JFD7PR5TOH86OkzDQZNVfl0+8hEmTBA+0oStTH4pt
 epbhZO61CF1t0uyaLi4VEwhDVpf66PcRcF2S0NjtPqVHnjJw72+8+gGWw9bimIwsHqzhHn1AmEq
 uR/25sQhA0ZN834dtUt9BMNrIeaWQ2S5gHItl8C37kEEUgkazg/0kVBzaqb8ratplWXUs=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

After recent changes to shaders codes were not re-generated.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/gpgpu_fill.c.gen.iga64_codes.c   | 2 +-
 lib/gpgpu_shader.c.gen.iga64_codes.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/gpgpu_fill.c.gen.iga64_codes.c b/lib/gpgpu_fill.c.gen.iga64_codes.c
index 467a2686f86c..b10e1544ba66 100644
--- a/lib/gpgpu_fill.c.gen.iga64_codes.c
+++ b/lib/gpgpu_fill.c.gen.iga64_codes.c
@@ -3,7 +3,7 @@
 
 #include "gpgpu_shader.h"
 
-#define MD5_SUM_IGA64_ASMS 0a2221edb21775cf2319cd7240765ec4
+#define MD5_SUM_IGA64_ASMS 2d1cdb2fd7d6e9b7f605a91a9d431c9d
 
 struct iga64_template const iga64_code_xe3p_gpgpu_fill[] = {
 	{ .gfx_ver = 3500, .size = 144, .code = (const uint32_t []) {
diff --git a/lib/gpgpu_shader.c.gen.iga64_codes.c b/lib/gpgpu_shader.c.gen.iga64_codes.c
index c03914a69a7e..cb36998670db 100644
--- a/lib/gpgpu_shader.c.gen.iga64_codes.c
+++ b/lib/gpgpu_shader.c.gen.iga64_codes.c
@@ -3,7 +3,7 @@
 
 #include "gpgpu_shader.h"
 
-#define MD5_SUM_IGA64_ASMS a428d5bacd5eeee4ee187971ec476f48
+#define MD5_SUM_IGA64_ASMS 0c79cb03ae27f62406e222cb2f485de6
 
 struct iga64_template const iga64_code_read_a64_d32[] = {
 	{ .gfx_ver = 2000, .size = 40, .code = (const uint32_t []) {

-- 
2.55.0

