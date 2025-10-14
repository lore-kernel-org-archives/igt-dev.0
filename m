Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9036BCCD187
	for <igt-dev@archiver.kernel.org>; Tue, 14 Oct 2025 11:43:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B8410E5B8;
	Tue, 14 Oct 2025 11:43:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QQL/fotn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E8D310E5B2
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Oct 2025 11:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760442232; x=1791978232;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4OTpJGJ1fCGAd9YH5QEs+e/f4rbc9NOh/FtC+QTh7aQ=;
 b=QQL/fotn36mOuK7iQphms42O8i3LWxysmmivZUIaCo67izfb00uFfAJU
 vnE79Quc9ZEbZ8DT3yyxCx4+rModCE+sVt46IL+2Xj1tgczDIdXczh8xa
 UB57bxur3oK/WhqmHSRJLEHxkvOVNjkcC/NcH4Vu4wwjQXzCJRpAk4p4U
 elqI24m0S4moxs32gp6zfTLA5BUdrUWEs/6YZJbbQGhRDdcjP6uue9sL9
 a0VBYd441G80n0KMbQYbHCwCWntDLSYarzwGkGiGJGFukNyVD5bEFhqPc
 MbKu0kz/WlP5be/XqMx12fyQ3IFdRcB+i+aWrp0GS6dqxxTCE/Qd7iigh g==;
X-CSE-ConnectionGUID: kTmHwQuJRLeJzAaEuR5mDQ==
X-CSE-MsgGUID: oaYGcjVlRWCmry/CEJt1uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62509218"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62509218"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 04:43:52 -0700
X-CSE-ConnectionGUID: Vkw0BP1PQ0iollQ8RqwuCg==
X-CSE-MsgGUID: N5573Yp5SjOmOAUlo/81pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="205569297"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 04:43:51 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: gwan-gyeong.mun@intel.com, zbigniew.kempczynski@intel.com,
 Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 1/4] lib/gpgpu_shader: Add num_threads_in_tg to shader struct
Date: Tue, 14 Oct 2025 11:43:33 +0000
Message-Id: <20251014114336.1712360-2-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251014114336.1712360-1-jan.maslak@intel.com>
References: <20251014114336.1712360-1-jan.maslak@intel.com>
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

Add parameter num_threads_in_tg inside the gpgpu_shader struct, so that it
can be accessed and set from within the tests.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
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

