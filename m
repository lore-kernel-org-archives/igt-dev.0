Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76061C282E5
	for <igt-dev@archiver.kernel.org>; Mon,  3 Mar 2025 23:15:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA2810E4F4;
	Mon,  3 Mar 2025 23:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lUtQwwOB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F7C810E4F2
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Mar 2025 23:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741043709; x=1772579709;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=vmLhvEoRX/BmW+2be1gnHqNUPMeeXkQuTKLgaNbLRDU=;
 b=lUtQwwOBBQVxTO/Xt43wA6wuha/i5Ot2/eeoe7rPWyYSdU5ieZd87s/P
 ZxkqDZfMby6TZXpButJSpWkXEO5myZXPHPhilkcnvb/D3lCeT7r9UMjVh
 VbZ5pHIJS4QORFJEuqbSLyscdBmrqZcztGy1vDi2KMczcHxjZ59mGXsAE
 7VnWIq8EiEk6Y2IMneQcGZZ6HngP8LMMq+Wh2Np8LTXsaGn96qiooMHfA
 uIPGJwQWqcEAmlgtIsLadwvWUED2BywJ9SLdCQsJNO1o97pk9xaHqp1pL
 +GmMiRifK07Cbw0bLxrb2bTHpR8sJdhWhKknXc8dB1sz5mFjAvSqiJIen Q==;
X-CSE-ConnectionGUID: NXROzwFAQQilYkG05mYXtg==
X-CSE-MsgGUID: riMfk6lTRQ6Uu43O0vs41A==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41793053"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="41793053"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 15:15:09 -0800
X-CSE-ConnectionGUID: m8z5imCiRu+VYUbQcmxV1g==
X-CSE-MsgGUID: Cq0sn/+OQ4qK5zNTsRr4wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118716725"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 15:15:09 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 13/14] tests/intel/xe_oa: Fix mmio_trigger_reports
 testing
Date: Mon,  3 Mar 2025 15:15:01 -0800
Message-Id: <20250303231502.135720-14-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250303231502.135720-1-umesh.nerlige.ramappa@intel.com>
References: <20250303231502.135720-1-umesh.nerlige.ramappa@intel.com>
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

The MI_STORE command needs modification to set the right amount of
dwords.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index ca2faa555..bf6764345 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -3689,7 +3689,7 @@ emit_oa_reg_read(struct intel_bb *ibb, struct intel_buf *dst, uint32_t offset,
 {
 	intel_bb_add_intel_buf(ibb, dst, true);
 
-	intel_bb_out(ibb, MI_STORE_REGISTER_MEM | 2);
+	intel_bb_out(ibb, MI_STORE_REGISTER_MEM_GEN8);
 	intel_bb_out(ibb, reg);
 	intel_bb_emit_reloc(ibb, dst->handle,
 			    I915_GEM_DOMAIN_INSTRUCTION,
-- 
2.34.1

