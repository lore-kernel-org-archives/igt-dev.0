Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CA8C021B2
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 20:28:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AB6E10E767;
	Tue, 18 Feb 2025 20:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LuJfQIyG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6EA510E764
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 20:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739910497; x=1771446497;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=wQ/afHhIBMGExnN93Y0XLQ6LW6j2419LXswHMaUKwTc=;
 b=LuJfQIyGLAgc2zRKpVxEjXfonZUdqbwFASdzCApnpLQgtHTPb7zzkwi+
 0482b/1JLnN7TxnTfNZPIcs7RmQWr5JeZbLLqjuv0ksKl9QXD0KpRwCB0
 uh+PWdc1ijuZ/UvSZeVAvgJ62pt5vX8QOulA3va2UhME7Zdojgls23J81
 nN5VVXtzyTzfKuSqLUYrg2mQW1ivCuzFT9TYANkEXNX8BB1gNz9hoa1f2
 l9n3yPuSrW+JsRPSd7gTDQj7re5lQKI5X8Je4iJE3+RrTzNWoknIiMcAW
 9HPwi9wOzN6pP3LxYi4Ngof3VzQfrIHHiVxcith/FJs31gqo3UN9OTdn5 Q==;
X-CSE-ConnectionGUID: ycDeXY30Tb+qd/UKlPRsuw==
X-CSE-MsgGUID: Lr3Z8wbLQ1Wk+9l5r3Cp7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="44545844"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="44545844"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:28:15 -0800
X-CSE-ConnectionGUID: WWG5olCtQOmJV0ZCjRBtfA==
X-CSE-MsgGUID: WaN7QS1+TRi6jNhJGgEBVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="114367469"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:28:16 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t CI run 12/14] tests/intel/xe_oa: Fix
 mmio_trigger_reports testing
Date: Tue, 18 Feb 2025 12:28:10 -0800
Message-Id: <20250218202812.1679653-13-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250218202812.1679653-1-umesh.nerlige.ramappa@intel.com>
References: <20250218202812.1679653-1-umesh.nerlige.ramappa@intel.com>
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

The MI_STORE command needs modification to set the right amount of dwords. While
at it, set the default exponent and add a render_copy check.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index ff1b873d5..d44832a8a 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -3688,7 +3688,7 @@ emit_oa_reg_read(struct intel_bb *ibb, struct intel_buf *dst, uint32_t offset,
 {
 	intel_bb_add_intel_buf(ibb, dst, true);
 
-	intel_bb_out(ibb, MI_STORE_REGISTER_MEM | 2);
+	intel_bb_out(ibb, MI_STORE_REGISTER_MEM_GEN8);
 	intel_bb_out(ibb, reg);
 	intel_bb_emit_reloc(ibb, dst->handle,
 			    I915_GEM_DOMAIN_INSTRUCTION,
-- 
2.34.1

