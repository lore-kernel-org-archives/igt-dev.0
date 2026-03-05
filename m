Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F769EDEC1D
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 05:34:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6FEA10EB10;
	Thu,  5 Mar 2026 05:34:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hhG35jHV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D5D510EB0D
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 05:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772688866; x=1804224866;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=tfYuA8ettyWOrDBkxCucRWqst1zMWlzjNW1MyQ5hW0o=;
 b=hhG35jHVIRak8yOsbexfw8qz0HgDqrwLxF6RAzBWQ6qAMpjwu3TZP4IW
 r1A45MOZ+pmpbrkhqw+JLjwHpP9yvoXsi6JC72gRXcOMhV4ynf316IvWL
 iEVqNNKwVo+lMSX4s5OoUgkpI1E8FIqAuLr1tQz/Spn5Fczy4TBiPnLTJ
 kyGYZ0riDSxa0QWLQRoX4Rje7n3N8HPyZPO35yeXTselpu5B9cijYWGz7
 1CgsBdwC24iO1UpAvep7Dt4JTlfLGGtDNuDuTgzl4FQ8HpiSxPFrxsInQ
 79RPQ1LIpOox+QW8KCwrB2x3k2H8lnUoj9Di1jJjoscbQCPB5J4CmbmOy A==;
X-CSE-ConnectionGUID: C3jKEDnGQr6iyDHGLtaBmg==
X-CSE-MsgGUID: JM/EejS8SKiKlopubh8fZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73833741"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="73833741"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 21:34:26 -0800
X-CSE-ConnectionGUID: rA3XVYSZS4C1nnlIWUQSgQ==
X-CSE-MsgGUID: ajnU4sinTF+f1m4uB6bLEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="216388809"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa007.fm.intel.com with ESMTP; 04 Mar 2026 21:34:25 -0800
From: priyanka.dandamudi@intel.com
To: igt-dev@lists.freedesktop.org,
	priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t v3 4/5] scripts/generate_iga64_codes: Add support for
 xe3p and xe3
Date: Thu,  5 Mar 2026 11:04:18 +0530
Message-ID: <20260305053413.1734922-11-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305053413.1734922-7-priyanka.dandamudi@intel.com>
References: <20260305053413.1734922-7-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add support for xe3p and xe3 for the existing tests and generate dynamic iga64
codes for xe3p and xe3 for those tests.

v2: Use 3pxpc for xe3p platforms.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/gpgpu_fill.c.gen.iga64_codes.c            |   2 +-
 lib/gpgpu_shader.c.gen.iga64_codes.c          | 196 +++++++++++++++++-
 scripts/generate_iga64_codes                  |   2 +-
 .../xe_eudebug_online.c.gen.iga64_codes.c     |  45 +++-
 4 files changed, 241 insertions(+), 4 deletions(-)

diff --git a/lib/gpgpu_fill.c.gen.iga64_codes.c b/lib/gpgpu_fill.c.gen.iga64_codes.c
index 15ffb6f2d8..400ff7b18a 100644
--- a/lib/gpgpu_fill.c.gen.iga64_codes.c
+++ b/lib/gpgpu_fill.c.gen.iga64_codes.c
@@ -3,7 +3,7 @@
 
 #include "gpgpu_shader.h"
 
-#define MD5_SUM_IGA64_ASMS b785dce133b8fcf480cd65b219b3e008
+#define MD5_SUM_IGA64_ASMS ebaa9e23021939d874c576c7cea482bf
 
 struct iga64_template const iga64_code_gpgpu_fill[] = {
 	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
diff --git a/lib/gpgpu_shader.c.gen.iga64_codes.c b/lib/gpgpu_shader.c.gen.iga64_codes.c
index ee45f8263d..59172cdfd1 100644
--- a/lib/gpgpu_shader.c.gen.iga64_codes.c
+++ b/lib/gpgpu_shader.c.gen.iga64_codes.c
@@ -3,7 +3,7 @@
 
 #include "gpgpu_shader.h"
 
-#define MD5_SUM_IGA64_ASMS b3ca58d01d637034cf62ec574656a2f0
+#define MD5_SUM_IGA64_ASMS 4311fff3bece03802f3220b7d239c33b
 
 struct iga64_template const iga64_code_read_a64_d32[] = {
 	{ .gen_ver = 2000, .size = 40, .code = (const uint32_t []) {
@@ -44,6 +44,40 @@ struct iga64_template const iga64_code_write_a64_d32[] = {
 };
 
 struct iga64_template const iga64_code_end_system_routine_step_if_eq[] = {
+	{ .gen_ver = 3500, .size = 60, .code = (const uint32_t []) {
+		0x80000966, 0x80018220, 0x02008000, 0x00008000,
+		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
+		0x80000961, 0x1e050330, 0x00000104, 0x00000000,
+		0x80000040, 0x1e258220, 0x06000124, 0xffffffff,
+		0x80000040, 0x1e358220, 0x06000134, 0xffffffff,
+		0x80000040, 0x1e458220, 0x06000124, 0xffffffff,
+		0x80000061, 0x1e554220, 0x00000000, 0x00000000,
+		0x80000061, 0x1e654220, 0x00000000, 0xc0ded000,
+		0x80000061, 0x1e754220, 0x00000000, 0x00000003,
+		0x80032033, 0x1f000002, 0xf0021e0c, 0x80030000,
+		0x80000061, 0x30014220, 0x00000000, 0x00000000,
+		0x80008070, 0x00018220, 0x22001f04, 0xc0ded002,
+		0x84000965, 0x80118220, 0x02008010, 0xc0ded003,
+		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 3000, .size = 60, .code = (const uint32_t []) {
+		0x80000966, 0x80018220, 0x02008000, 0x00008000,
+		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
+		0x80000961, 0x1e050330, 0x00000104, 0x00000000,
+		0x80000040, 0x1e258220, 0x06000124, 0xffffffff,
+		0x80000040, 0x1e358220, 0x06000134, 0xffffffff,
+		0x80000040, 0x1e458220, 0x06000124, 0xffffffff,
+		0x80000061, 0x1e554220, 0x00000000, 0x00000000,
+		0x80000061, 0x1e654220, 0x00000000, 0xc0ded000,
+		0x80000061, 0x1e754220, 0x00000000, 0x00000003,
+		0x80032031, 0x1f0c0000, 0xf0061e0c, 0x00800000,
+		0x80000061, 0x30014220, 0x00000000, 0x00000000,
+		0x80008070, 0x00018220, 0x22001f04, 0xc0ded002,
+		0x84000965, 0x80118220, 0x02008010, 0xc0ded003,
+		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
 	{ .gen_ver = 2000, .size = 48, .code = (const uint32_t []) {
 		0x80000966, 0x80018220, 0x02008000, 0x00008000,
 		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
@@ -158,6 +192,42 @@ struct iga64_template const iga64_code_breakpoint_suppress[] = {
 };
 
 struct iga64_template const iga64_code_write_on_exception[] = {
+	{ .gen_ver = 3500, .size = 64, .code = (const uint32_t []) {
+		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
+		0x80000061, 0x04050330, 0x00000104, 0x00000000,
+		0x80000040, 0x04258220, 0x06000124, 0xffffffff,
+		0x80000040, 0x04358220, 0x06000134, 0xffffffff,
+		0x80000040, 0x04458220, 0x06000124, 0xffffffff,
+		0x80000069, 0x04558220, 0x02000014, 0x00000002,
+		0x80001940, 0x04558220, 0x02000454, 0xc0ded000,
+		0x80000040, 0x04658220, 0x02000064, 0xc0ded001,
+		0x80000061, 0x04754220, 0x00000000, 0x00000003,
+		0x80000965, 0x03058220, 0x02008010, 0xc0ded003,
+		0x80000961, 0x30014220, 0x00000000, 0x00000000,
+		0x80001a70, 0x00018220, 0x12000304, 0xc0ded004,
+		0x84032033, 0x00000000, 0xf002040c, 0x8007050c,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 3000, .size = 64, .code = (const uint32_t []) {
+		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
+		0x80000061, 0x04050330, 0x00000104, 0x00000000,
+		0x80000040, 0x04258220, 0x06000124, 0xffffffff,
+		0x80000040, 0x04358220, 0x06000134, 0xffffffff,
+		0x80000040, 0x04458220, 0x06000124, 0xffffffff,
+		0x80000069, 0x04558220, 0x02000014, 0x00000002,
+		0x80001940, 0x04558220, 0x02000454, 0xc0ded000,
+		0x80000040, 0x04658220, 0x02000064, 0xc0ded001,
+		0x80000061, 0x04754220, 0x00000000, 0x00000003,
+		0x80000965, 0x03058220, 0x02008010, 0xc0ded003,
+		0x80000961, 0x30014220, 0x00000000, 0x00000000,
+		0x80001a70, 0x00018220, 0x12000304, 0xc0ded004,
+		0x84032031, 0x00000000, 0xf00e040c, 0x0080050c,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
 	{ .gen_ver = 2000, .size = 52, .code = (const uint32_t []) {
 		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
 		0x800c0061, 0x04054220, 0x00000000, 0x00000000,
@@ -288,6 +358,36 @@ struct iga64_template const iga64_code_clear_exception[] = {
 };
 
 struct iga64_template const iga64_code_media_block_write[] = {
+	{ .gen_ver = 3500, .size = 52, .code = (const uint32_t []) {
+		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
+		0x80000061, 0x04050330, 0x00000104, 0x00000000,
+		0x80000040, 0x04258220, 0x06000124, 0xffffffff,
+		0x80000040, 0x04358220, 0x06000134, 0xffffffff,
+		0x80000040, 0x04458220, 0x06000124, 0xffffffff,
+		0x80000069, 0x04558220, 0x02000014, 0x00000002,
+		0x80001940, 0x04558220, 0x02000454, 0x00000000,
+		0x80000040, 0x04658220, 0x02000064, 0xc0ded000,
+		0x80000061, 0x04754220, 0x00000000, 0x00000003,
+		0x80032033, 0x00000000, 0xf002040c, 0x8007050c,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 3000, .size = 52, .code = (const uint32_t []) {
+		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
+		0x80000061, 0x04050330, 0x00000104, 0x00000000,
+		0x80000040, 0x04258220, 0x06000124, 0xffffffff,
+		0x80000040, 0x04358220, 0x06000134, 0xffffffff,
+		0x80000040, 0x04458220, 0x06000124, 0xffffffff,
+		0x80000069, 0x04558220, 0x02000014, 0x00000002,
+		0x80001940, 0x04558220, 0x02000454, 0x00000000,
+		0x80000040, 0x04658220, 0x02000064, 0xc0ded000,
+		0x80000061, 0x04754220, 0x00000000, 0x00000003,
+		0x80032031, 0x00000000, 0xf00e040c, 0x0080050c,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
 	{ .gen_ver = 2000, .size = 40, .code = (const uint32_t []) {
 		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
 		0x800c0061, 0x04054220, 0x00000000, 0x00000000,
@@ -380,6 +480,36 @@ struct iga64_template const iga64_code_write_aip[] = {
 };
 
 struct iga64_template const iga64_code_media_block_write_aip[] = {
+	{ .gen_ver = 3500, .size = 52, .code = (const uint32_t []) {
+		0x80000961, 0x05050220, 0x00008020, 0x00000000,
+		0x80000961, 0x04050330, 0x00000104, 0x00000000,
+		0x80000040, 0x04258220, 0x06000124, 0xffffffff,
+		0x80000040, 0x04358220, 0x06000134, 0xffffffff,
+		0x80000040, 0x04458220, 0x06000124, 0xffffffff,
+		0x80000069, 0x04558220, 0x02000014, 0x00000002,
+		0x80001940, 0x04558220, 0x02000454, 0x00000000,
+		0x80000040, 0x04658220, 0x02000064, 0xc0ded000,
+		0x80000061, 0x04754220, 0x00000000, 0x00000003,
+		0x80032033, 0x00000000, 0xf002040c, 0x8007050c,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 3000, .size = 52, .code = (const uint32_t []) {
+		0x80000961, 0x05050220, 0x00008020, 0x00000000,
+		0x80000961, 0x04050330, 0x00000104, 0x00000000,
+		0x80000040, 0x04258220, 0x06000124, 0xffffffff,
+		0x80000040, 0x04358220, 0x06000134, 0xffffffff,
+		0x80000040, 0x04458220, 0x06000124, 0xffffffff,
+		0x80000069, 0x04558220, 0x02000014, 0x00000002,
+		0x80001940, 0x04558220, 0x02000454, 0x00000000,
+		0x80000040, 0x04658220, 0x02000064, 0xc0ded000,
+		0x80000061, 0x04754220, 0x00000000, 0x00000003,
+		0x80032031, 0x00000000, 0xf00e040c, 0x0080050c,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
 	{ .gen_ver = 2000, .size = 40, .code = (const uint32_t []) {
 		0x80000961, 0x05050220, 0x00008020, 0x00000000,
 		0x800c0961, 0x04054220, 0x00000000, 0x00000000,
@@ -449,6 +579,42 @@ struct iga64_template const iga64_code_media_block_write_aip[] = {
 };
 
 struct iga64_template const iga64_code_common_target_write[] = {
+	{ .gen_ver = 3500, .size = 64, .code = (const uint32_t []) {
+		0x80100061, 0x1f054220, 0x00000000, 0x00000000,
+		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
+		0x80000061, 0x1f154220, 0x00000000, 0xc0ded002,
+		0x80000061, 0x1f254220, 0x00000000, 0xc0ded003,
+		0x80000061, 0x1f354220, 0x00000000, 0xc0ded004,
+		0x80000061, 0x1e050330, 0x00000104, 0x00000000,
+		0x80000040, 0x1e258220, 0x06000124, 0xffffffff,
+		0x80000040, 0x1e358220, 0x06000134, 0xffffffff,
+		0x80000040, 0x1e458220, 0x06000124, 0xffffffff,
+		0x80000061, 0x1e554220, 0x00000000, 0x00000000,
+		0x80000061, 0x1e654220, 0x00000000, 0xc0ded000,
+		0x80000061, 0x1e754220, 0x00000000, 0x0000000f,
+		0x80032033, 0x00000000, 0xf0021e0c, 0x80071f0c,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 3000, .size = 64, .code = (const uint32_t []) {
+		0x80100061, 0x1f054220, 0x00000000, 0x00000000,
+		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
+		0x80000061, 0x1f154220, 0x00000000, 0xc0ded002,
+		0x80000061, 0x1f254220, 0x00000000, 0xc0ded003,
+		0x80000061, 0x1f354220, 0x00000000, 0xc0ded004,
+		0x80000061, 0x1e050330, 0x00000104, 0x00000000,
+		0x80000040, 0x1e258220, 0x06000124, 0xffffffff,
+		0x80000040, 0x1e358220, 0x06000134, 0xffffffff,
+		0x80000040, 0x1e458220, 0x06000124, 0xffffffff,
+		0x80000061, 0x1e554220, 0x00000000, 0x00000000,
+		0x80000061, 0x1e654220, 0x00000000, 0xc0ded000,
+		0x80000061, 0x1e754220, 0x00000000, 0x0000000f,
+		0x80032031, 0x00000000, 0xf00e1e0c, 0x00801f0c,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
 	{ .gen_ver = 2000, .size = 52, .code = (const uint32_t []) {
 		0x80100061, 0x1f054220, 0x00000000, 0x00000000,
 		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
@@ -578,6 +744,34 @@ struct iga64_template const iga64_code_clear_r40[] = {
 };
 
 struct iga64_template const iga64_code_jump_dw_neq[] = {
+	{ .gen_ver = 3500, .size = 48, .code = (const uint32_t []) {
+		0x80000061, 0x1e050330, 0x00000104, 0x00000000,
+		0x80000040, 0x1e258220, 0x06000124, 0xffffffff,
+		0x80000040, 0x1e358220, 0x06000134, 0xffffffff,
+		0x80000040, 0x1e458220, 0x06000124, 0xffffffff,
+		0x80000061, 0x1e554220, 0x00000000, 0x00000000,
+		0x80000061, 0x1e654220, 0x00000000, 0xc0ded000,
+		0x80000061, 0x1e754220, 0x00000000, 0x00000003,
+		0x80032033, 0x1f000002, 0xf0021e0c, 0x80030000,
+		0x80000061, 0x30014220, 0x00000000, 0x00000000,
+		0x80008070, 0x00018220, 0x22001f04, 0xc0ded001,
+		0x84000020, 0x00004000, 0x00000000, 0xffffff60,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 3000, .size = 48, .code = (const uint32_t []) {
+		0x80000061, 0x1e050330, 0x00000104, 0x00000000,
+		0x80000040, 0x1e258220, 0x06000124, 0xffffffff,
+		0x80000040, 0x1e358220, 0x06000134, 0xffffffff,
+		0x80000040, 0x1e458220, 0x06000124, 0xffffffff,
+		0x80000061, 0x1e554220, 0x00000000, 0x00000000,
+		0x80000061, 0x1e654220, 0x00000000, 0xc0ded000,
+		0x80000061, 0x1e754220, 0x00000000, 0x00000003,
+		0x80032031, 0x1f0c0000, 0xf0061e0c, 0x00800000,
+		0x80000061, 0x30014220, 0x00000000, 0x00000000,
+		0x80008070, 0x00018220, 0x22001f04, 0xc0ded001,
+		0x84000020, 0x00004000, 0x00000000, 0xffffff60,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
 	{ .gen_ver = 2000, .size = 36, .code = (const uint32_t []) {
 		0x800c0061, 0x1e054220, 0x00000000, 0x00000000,
 		0x80000061, 0x1e554220, 0x00000000, 0x00000000,
diff --git a/scripts/generate_iga64_codes b/scripts/generate_iga64_codes
index d196c7a016..0a5fbef921 100755
--- a/scripts/generate_iga64_codes
+++ b/scripts/generate_iga64_codes
@@ -7,7 +7,7 @@
 # to minimal GPU generation supported by platform multiplied by 100 and platform
 # is one of platforms supported by -p switch of iga64.
 # Must be in decreasing order, the last one must have gen100 equal 0.
-GEN_VERSIONS="2000:2 1270:12p71 1260:12p72 1250:12p5 0:12p1"
+GEN_VERSIONS="3500:3pxpc 3000:3 2000:2 1270:12p71 1260:12p72 1250:12p5 0:12p1"
 
 # Magic values to encode asm template args, must be the the same as in gpgpu_shader.c.
 IGA64_ARG0=0xc0ded000
diff --git a/tests/intel/xe_eudebug_online.c.gen.iga64_codes.c b/tests/intel/xe_eudebug_online.c.gen.iga64_codes.c
index 32009e40fe..333281a39a 100644
--- a/tests/intel/xe_eudebug_online.c.gen.iga64_codes.c
+++ b/tests/intel/xe_eudebug_online.c.gen.iga64_codes.c
@@ -3,9 +3,39 @@
 
 #include "gpgpu_shader.h"
 
-#define MD5_SUM_IGA64_ASMS d8acd22fb8afb78633ac79a0ca42d8da
+#define MD5_SUM_IGA64_ASMS e184c9b1ac9287f33544ad0737b2831a
 
 struct iga64_template const iga64_code_store_sr0_0[] = {
+	{ .gen_ver = 3500, .size = 52, .code = (const uint32_t []) {
+		0x00000961, 0x05050220, 0x00007000, 0x00000000,
+		0x80000961, 0x04050330, 0x00000104, 0x00000000,
+		0x80000040, 0x04258220, 0x06000124, 0xffffffff,
+		0x80000040, 0x04358220, 0x06000134, 0xffffffff,
+		0x80000040, 0x04458220, 0x06000124, 0xffffffff,
+		0x80000069, 0x04558220, 0x02000014, 0x00000002,
+		0x80001940, 0x04558220, 0x02000454, 0x00000000,
+		0x80000040, 0x04658220, 0x02000064, 0x00000000,
+		0x80000061, 0x04754220, 0x00000000, 0x00000003,
+		0x00032033, 0x00000000, 0xf002040c, 0x8007050c,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 3000, .size = 52, .code = (const uint32_t []) {
+		0x00000961, 0x05050220, 0x00007000, 0x00000000,
+		0x80000961, 0x04050330, 0x00000104, 0x00000000,
+		0x80000040, 0x04258220, 0x06000124, 0xffffffff,
+		0x80000040, 0x04358220, 0x06000134, 0xffffffff,
+		0x80000040, 0x04458220, 0x06000124, 0xffffffff,
+		0x80000069, 0x04558220, 0x02000014, 0x00000002,
+		0x80001940, 0x04558220, 0x02000454, 0x00000000,
+		0x80000040, 0x04658220, 0x02000064, 0x00000000,
+		0x80000061, 0x04754220, 0x00000000, 0x00000003,
+		0x00032031, 0x00000000, 0xf00e040c, 0x0080050c,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
 	{ .gen_ver = 2000, .size = 40, .code = (const uint32_t []) {
 		0x00000961, 0x05050220, 0x00007000, 0x00000000,
 		0x800c0961, 0x04054220, 0x00000000, 0x00000000,
@@ -24,6 +54,19 @@ struct iga64_template const iga64_code_store_sr0_0[] = {
 };
 
 struct iga64_template const iga64_code_pagefault_one_of_many[] = {
+	{ .gen_ver = 3500, .size = 44, .code = (const uint32_t []) {
+		0x000c0061, 0x1e054330, 0x00000000, 0x00000000,
+		0x00000061, 0x1e054330, 0x00000123, 0x45678000,
+		0x00000061, 0x1e254220, 0x00000000, 0x0000003f,
+		0x00000061, 0x1e454220, 0x00000000, 0x0000003f,
+		0x00000061, 0x1e754220, 0x00000000, 0x00000003,
+		0x0000005b, 0x14060220, 0x02020014, 0x01440064,
+		0x00001970, 0x00018220, 0x12001404, 0xc0ded000,
+		0x04032031, 0x1f0c0000, 0xf8061e0c, 0x00a00000,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
 	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
 		0x000c0061, 0x1e054330, 0x00000000, 0x00000000,
 		0x00000061, 0x1e054330, 0x00000123, 0x45678000,
-- 
2.43.0

