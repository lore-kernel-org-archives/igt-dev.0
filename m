Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D515EC18E7C
	for <igt-dev@archiver.kernel.org>; Wed, 26 Feb 2025 11:26:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9431F10E1D8;
	Wed, 26 Feb 2025 11:26:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zz5tS731";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CAC210E1D8
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Feb 2025 11:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740569180; x=1772105180;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c/A/DOwfWFGH9grj3qqZdYpxaJ9gCIgbE7IourNS5T8=;
 b=Zz5tS731rbkjcDJHF2R+O3FXe1D3vxfrZwDe7/3vJWrlnz8/QB0lhrz0
 JPpDKpWMve9QiOqq+jwFeBzPk+7Vc+xYzr+jce+nDTDH2z3I4n/J55M61
 M7e5WGTxKWwMJXmUr5F8t4qHL7TbtS1O7TNNKN5ia0Ia6BYCV/702OX9E
 YUN1zAmT+6nDQxiRo23eEE9TuxM80wIWC0DquFvVA+KtB/pCoJ2QmhlPY
 MRuHfgo8hkjhLYM9tWpxWKL3ZB32cBd5CuPlRuJdBCkyyaaErdgYNmcqi
 o3N4xqMbCoEXZHmoAJt7QgLVfDEIEQirROOR2RJv9ZavqojDAp/1tWznz w==;
X-CSE-ConnectionGUID: Z9tL/CH6SLGr5S6xNkZk3Q==
X-CSE-MsgGUID: vZXaQPR1QA+FpgOQ7omnuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="66781241"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="66781241"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 03:26:19 -0800
X-CSE-ConnectionGUID: QkMJiw0zT3ufRopeoOpn1g==
X-CSE-MsgGUID: F+sfhmsWQ4a5R1Fw4TXneg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="117166591"
Received: from slindbla-desk.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.75])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 03:26:15 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t,v3 1/6] lib/intel_compute: Make loop count a parameter
Date: Wed, 26 Feb 2025 12:24:02 +0100
Message-ID: <20250226112532.1332367-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226112532.1332367-1-francois.dugast@intel.com>
References: <20250226112532.1332367-1-francois.dugast@intel.com>
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

The loop count was previously hardcoded as 0x400 in *create_indirect_data()
functions. Turn it into a parameterized value that gets used during the
batch buffer generation so that the function user can specify the count.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_compute.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index f46de1074..b698bf77d 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -293,7 +293,8 @@ static void bo_execenv_exec(struct bo_execenv *execenv, uint64_t start_addr)
 static void create_indirect_data(uint32_t *addr_bo_buffer_batch,
 				 uint64_t addr_input,
 				 uint64_t addr_output,
-				 uint32_t end_value)
+				 uint32_t end_value,
+				 unsigned int loop_count)
 {
 	uint32_t val = 0;
 	int b = 0, curr = 0;
@@ -313,7 +314,7 @@ static void create_indirect_data(uint32_t *addr_bo_buffer_batch,
 	addr_bo_buffer_batch[b++] = addr_output & 0xffffffff;
 	addr_bo_buffer_batch[b++] = addr_output >> 32;
 
-	addr_bo_buffer_batch[b++] = 0x00000400;
+	addr_bo_buffer_batch[b++] = loop_count;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
@@ -708,7 +709,7 @@ static void compute_exec(int fd, const unsigned char *kernel,
 	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
 	create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
 	create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT,
-			     IS_DG1(devid) ? 0x200 : 0x40);
+			     IS_DG1(devid) ? 0x200 : 0x40, SIZE_DATA);
 
 	dinput = (float *)bo_dict[4].data;
 	srand(time(NULL));
@@ -746,7 +747,8 @@ static void compute_exec(int fd, const unsigned char *kernel,
 
 static void xehp_create_indirect_data(uint32_t *addr_bo_buffer_batch,
 				      uint64_t addr_input,
-				      uint64_t addr_output)
+				      uint64_t addr_output,
+				      unsigned int loop_count)
 {
 	int b = 0;
 
@@ -754,7 +756,7 @@ static void xehp_create_indirect_data(uint32_t *addr_bo_buffer_batch,
 	addr_bo_buffer_batch[b++] = addr_input >> 32;
 	addr_bo_buffer_batch[b++] = addr_output & 0xffffffff;
 	addr_bo_buffer_batch[b++] = addr_output >> 32;
-	addr_bo_buffer_batch[b++] = 0x00000400;
+	addr_bo_buffer_batch[b++] = loop_count;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
@@ -986,7 +988,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 	memcpy(bo_dict[0].data, kernel, size);
 	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
 	xehp_create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
-	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT);
+	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
 	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT, ADDR_OUTPUT);
 
 	dinput = (float *)bo_dict[4].data;
@@ -1020,7 +1022,8 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 
 static void xehpc_create_indirect_data(uint32_t *addr_bo_buffer_batch,
 				       uint64_t addr_input,
-				       uint64_t addr_output)
+				       uint64_t addr_output,
+				       unsigned int loop_count)
 {
 	int b = 0;
 
@@ -1036,7 +1039,7 @@ static void xehpc_create_indirect_data(uint32_t *addr_bo_buffer_batch,
 	addr_bo_buffer_batch[b++] = addr_input >> 32;
 	addr_bo_buffer_batch[b++] = addr_output & 0xffffffff;
 	addr_bo_buffer_batch[b++] = addr_output >> 32;
-	addr_bo_buffer_batch[b++] = 0x00000400;
+	addr_bo_buffer_batch[b++] = loop_count;
 	addr_bo_buffer_batch[b++] = 0x00000400;
 	addr_bo_buffer_batch[b++] = 0x00000001;
 	addr_bo_buffer_batch[b++] = 0x00000001;
@@ -1191,7 +1194,7 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 	bo_execenv_bind(&execenv, bo_dict, XEHPC_BO_DICT_ENTRIES);
 
 	memcpy(bo_dict[0].data, kernel, size);
-	xehpc_create_indirect_data(bo_dict[1].data, ADDR_INPUT, ADDR_OUTPUT);
+	xehpc_create_indirect_data(bo_dict[1].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
 
 	dinput = (float *)bo_dict[2].data;
 	srand(time(NULL));
@@ -1551,7 +1554,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 
 	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
 	xehp_create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
-	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT);
+	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
 	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT, ADDR_OUTPUT);
 
 	dinput = (float *)bo_dict[4].data;
@@ -1640,7 +1643,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 	memcpy(bo_dict[0].data, kernel, size);
 	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
 	xehp_create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
-	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT);
+	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
 	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT, ADDR_OUTPUT);
 
 	dinput = (float *)bo_dict[4].data;
@@ -1946,7 +1949,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 
 	create_dynamic_state(bo_dict_short[1].data, OFFSET_KERNEL);
 	xehp_create_surface_state(bo_dict_short[2].data, ADDR_INPUT, ADDR_OUTPUT);
-	xehp_create_indirect_data(bo_dict_short[3].data, ADDR_INPUT, ADDR_OUTPUT);
+	xehp_create_indirect_data(bo_dict_short[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
 	xehp_create_surface_state(bo_dict_short[7].data, ADDR_INPUT, ADDR_OUTPUT);
 
 	dinput = (float *)bo_dict_long[4].data;
-- 
2.43.0

