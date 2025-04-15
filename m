Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0E6C369AB
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 10:15:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F81210E70B;
	Tue, 15 Apr 2025 10:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="STyHsMq8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF1110E70A
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 10:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744712129; x=1776248129;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YcHw3P7vfn6ZH0Il6GekzaubSUHjURYrVFlW2RYQw6I=;
 b=STyHsMq87zPBUvi9O8Pb4U36Y7IQVek4LeII7y62q5IG0cZZp7wWO1hO
 DAoHhH9AZNft/IMIrlX4glVaN9dok4AOoo/awE5knYuGc4nbc2xbK0P4l
 FXzFYmttS/7evm9fw+0TsTgAmUcUCcY4ITrlty4NwNoR4r//gf+pcWE5t
 5j4mhBZYLwbsPkp/9rZsLUebzuVafnFallX4/JmGQ5/ESJtPsK88Rlp00
 5cXC5Hts0OvaTLA3yuMGlanpWnSoaXId45IJJ4sF6jkndw2rLNu+R+rSl
 qlJZxNu79P00bpOs+6tGA0Flfq4iBxuGGVGmTnupwwVju3yXW6HZfVmEI w==;
X-CSE-ConnectionGUID: ARi5WK3sR0eq7AV+Xma+Cg==
X-CSE-MsgGUID: M6yU6X7OSBCXUF5bzSY+kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="45927077"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="45927077"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 03:15:29 -0700
X-CSE-ConnectionGUID: c/23v8sHSmaLFaQ1yn/jAg==
X-CSE-MsgGUID: rslubwqoRkC3xmVAqmiqlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="131060031"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.8])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 03:15:28 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t,
 v3 09/11] lib/intel_compute: Fix enqueued local size starting with
 xelpg
Date: Tue, 15 Apr 2025 12:13:25 +0200
Message-ID: <20250415101457.141107-10-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250415101457.141107-1-francois.dugast@intel.com>
References: <20250415101457.141107-1-francois.dugast@intel.com>
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

The metadata of the compute kernel used for xelpg shows the arguments
positions has changed. The enqueued_local_size comes at offset 52, right
after the value of the "count" argument. Create a new create_indirect_data
function matching this.

Relevant part of the kernel metadata:

      - arg_type:        arg_bypointer
        offset:          32
        size:            8
        arg_index:       0
        addrmode:        stateless
        addrspace:       global
        access_type:     readwrite
      - arg_type:        arg_bypointer
        offset:          40
        size:            8
        arg_index:       1
        addrmode:        stateless
        addrspace:       global
        access_type:     readwrite
      - arg_type:        arg_byvalue
        offset:          48
        size:            4
        arg_index:       2
      - arg_type:        enqueued_local_size
        offset:          52
        size:            12

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index b29f8d9f8..6b779c340 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -1263,6 +1263,31 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 	bo_execenv_destroy(&execenv);
 }
 
+static void xelpg_create_indirect_data(uint32_t *addr_bo_buffer_batch,
+				      uint64_t addr_input,
+				      uint64_t addr_output,
+				      unsigned int loop_count)
+{
+	int b = 0;
+
+	addr_bo_buffer_batch[b++] = addr_input & 0xffffffff;
+	addr_bo_buffer_batch[b++] = addr_input >> 32;
+	addr_bo_buffer_batch[b++] = addr_output & 0xffffffff;
+	addr_bo_buffer_batch[b++] = addr_output >> 32;
+	addr_bo_buffer_batch[b++] = loop_count;
+	addr_bo_buffer_batch[b++] = 0x00000400; // Enqueued local size X
+	addr_bo_buffer_batch[b++] = 0x00000001; // Enqueued local size Y
+	addr_bo_buffer_batch[b++] = 0x00000001; // Enqueued local size Z
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+}
+
 static void xelpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 					uint64_t addr_general_state_base,
 					uint64_t addr_surface_state_base,
@@ -1595,7 +1620,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 
 	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
 	xehp_create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
-	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
+	xelpg_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
 	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT, ADDR_OUTPUT);
 
 	input_data = (float *) bo_dict[4].data;
@@ -1688,7 +1713,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 	memcpy(bo_dict[0].data, kernel, size);
 	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
 	xehp_create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
-	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
+	xelpg_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
 	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT, ADDR_OUTPUT);
 
 	input_data = (float *) bo_dict[4].data;
@@ -2022,7 +2047,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 
 	create_dynamic_state(bo_dict_short[1].data, OFFSET_KERNEL);
 	xehp_create_surface_state(bo_dict_short[2].data, ADDR_INPUT, ADDR_OUTPUT);
-	xehp_create_indirect_data(bo_dict_short[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
+	xelpg_create_indirect_data(bo_dict_short[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
 	xehp_create_surface_state(bo_dict_short[7].data, ADDR_INPUT, ADDR_OUTPUT);
 
 	input_data = (float *) bo_dict_long[4].data;
-- 
2.43.0

