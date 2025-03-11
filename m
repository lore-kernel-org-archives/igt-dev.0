Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63467C282EC
	for <igt-dev@archiver.kernel.org>; Tue, 11 Mar 2025 15:23:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B1D8920D;
	Tue, 11 Mar 2025 15:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GOS1FjTW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C7E10E5C4
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Mar 2025 15:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741706628; x=1773242628;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sp3pttTFFETsZfeHUivSFdVK5P/rr1TqNjkqRMbaQLU=;
 b=GOS1FjTWYziN3U03Thi1LXY3e50qIDZGeQPJwKQAOZR1OT2VbLuZDLPi
 9wD7xEAW59p3BxyvrHZGwi0bn6i40Z3rsBa4RdMGU6QeAPIYsTULcHt3t
 SdG86qTG1BSM4syDdxDUNscYuDXxxvfqZI8WOqv6Hd+5O7J3DHtPBT/gX
 DnE6J2RN6QT3M0zX+ADil+wXJAvw1koFSkx0Re/G0i2U2o+WzX45IrXoo
 nliJiht87wlkds9Fvpswa6Ov6J9EtQCfUPc/7AXEvCJ4Xxm7cKAXKVGQ6
 F+vvw/nO0oQ8+uplzChmcrErZaQQAyJbSDCUE+jABvqHcHiy17Cty//4d g==;
X-CSE-ConnectionGUID: G1+nh5HjScOEWUvWPdjCNw==
X-CSE-MsgGUID: yZjN4zFxRLmkxmX/Gf8zdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="53377175"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="53377175"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 08:23:47 -0700
X-CSE-ConnectionGUID: xYXpsL8WTlmqfI335WvCWQ==
X-CSE-MsgGUID: nC7W92xvRfm+kSWbzkafkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="120066313"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.217])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 08:23:47 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 09/11] lib/intel_compute: Fix enqueued local size in xehp
Date: Tue, 11 Mar 2025 16:21:29 +0100
Message-ID: <20250311152321.16497-10-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250311152321.16497-1-francois.dugast@intel.com>
References: <20250311152321.16497-1-francois.dugast@intel.com>
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

According to the metadata of the compute kernel used for this test, the
enqueued_local_size comes at offset 52, right after the value of the
"count" argument. Fix it and add comments for clarity.

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

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 7a2e04b10..f5b3a88f0 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -781,12 +781,12 @@ static void xehp_create_indirect_data(uint32_t *addr_bo_buffer_batch,
 	addr_bo_buffer_batch[b++] = addr_output & 0xffffffff;
 	addr_bo_buffer_batch[b++] = addr_output >> 32;
 	addr_bo_buffer_batch[b++] = loop_count;
+	addr_bo_buffer_batch[b++] = 0x00000400; // Enqueued local size X
+	addr_bo_buffer_batch[b++] = 0x00000001; // Enqueued local size Y
+	addr_bo_buffer_batch[b++] = 0x00000001; // Enqueued local size Z
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
-	addr_bo_buffer_batch[b++] = 0x00000400;
-	addr_bo_buffer_batch[b++] = 0x00000001;
-	addr_bo_buffer_batch[b++] = 0x00000001;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
-- 
2.43.0

