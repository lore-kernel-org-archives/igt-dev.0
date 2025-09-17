Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B04BCAC5A0
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 17:04:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D4210E075;
	Wed, 17 Sep 2025 17:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YVb8KdP2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2BB10E075
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 17:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758128640; x=1789664640;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B1RKu2XDEUL1MoMK6b4Z4Jo+DtELooj1GUjpb6WAlSs=;
 b=YVb8KdP2kV/cdqDJSSP/k0rUmC2tTCudZpQh9enb4/4ZCaq7EBSnu+Jp
 Uo5KUJJqyBJzHt66RN0BSTmvOELWLQb85j7JsYHTWgC+bGQKKtiwc3kS/
 rG6o7y2nKsoNkRS1Ax2UHrAS2MBUekf75B6dpjkdLIBbAdM0wjtTBQpyw
 CU4DZuOnMUwCH0YYl+np65UExVwxGS8b7xp0c2wI6LICETfE2BTXN+gh1
 gLAFB+KdQfLPmReGIJQXntw0Jo5PQeoETouG/MuRGC3S/rGHBXBS9CcG8
 LHIIGteoN8qn4GcId5GjGRcI9oIC7ImhtuCX/QPbI7q3dfSnemV/2QeyK A==;
X-CSE-ConnectionGUID: VDyI8RnwT8uYgplcUqdV/Q==
X-CSE-MsgGUID: Ac70OT4ORrSbhsxB3MSIqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="71073531"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="71073531"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 09:55:57 -0700
X-CSE-ConnectionGUID: V9+8qWGXTRi21yYBrkdoYw==
X-CSE-MsgGUID: DsphtlJjQeaWGTVfpZv+Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="212449706"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 09:55:55 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: gwan-gyeong.mun@intel.com, andrzej.hajda@intel.com,
 Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 1/4] lib/gpgpu_shader: Add num_threads_in_tg to shader struct
Date: Wed, 17 Sep 2025 16:55:38 +0000
Message-Id: <20250917165541.85203-2-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250917165541.85203-1-jan.maslak@intel.com>
References: <20250917165541.85203-1-jan.maslak@intel.com>
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

Add parameter num_threads_in_tg inside the gpgpu_shader struct, so that it
can be accessed and set from within the tests.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
---
 lib/gpgpu_shader.c | 3 +++
 lib/gpgpu_shader.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
index a63af0d23..e8600de23 100644
--- a/lib/gpgpu_shader.c
+++ b/lib/gpgpu_shader.c
@@ -116,6 +116,7 @@ __xelp_gpgpu_execfunc(struct intel_bb *ibb,
 							      4 * shdr->size);
 	idd = intel_bb_ptr_get(ibb, interface_descriptor);
 	idd->desc2.illegal_opcode_exception_enable = shdr->illegal_opcode_exception_enable;
+	idd->desc6.num_threads_in_tg = shdr->num_threads_in_tg;
 
 	if (sip && sip->size)
 		sip_offset = fill_sip(ibb, sip->instr, 4 * sip->size);
@@ -178,6 +179,7 @@ __xehp_gpgpu_execfunc(struct intel_bb *ibb,
 	xehp_fill_interface_descriptor(ibb, target, shdr->instr,
 				       4 * shdr->size, &idd);
 	idd.desc2.illegal_opcode_exception_enable = shdr->illegal_opcode_exception_enable;
+	idd.desc5.num_threads_in_tg = shdr->num_threads_in_tg;
 
 	if (shdr->vrt != VRT_DISABLED)
 		idd.desc2.registers_per_thread = shdr->vrt;
@@ -279,6 +281,7 @@ struct gpgpu_shader *gpgpu_shader_create(int fd)
 	shdr->max_size = 16 * 4;
 	shdr->code = malloc(4 * shdr->max_size);
 	shdr->labels = igt_map_create(igt_map_hash_32, igt_map_equal_32);
+	shdr->num_threads_in_tg = 1;
 	shdr->vrt = VRT_DISABLED;
 	igt_assert(shdr->code);
 
diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
index ca996d574..90ef3eec8 100644
--- a/lib/gpgpu_shader.h
+++ b/lib/gpgpu_shader.h
@@ -28,6 +28,7 @@ struct gpgpu_shader {
 	};
 	struct igt_map *labels;
 	bool illegal_opcode_exception_enable;
+	uint32_t num_threads_in_tg;
 	enum gpgpu_shader_vrt_modes vrt;
 };
 
-- 
2.34.1

