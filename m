Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF306C02198
	for <igt-dev@archiver.kernel.org>; Sat, 15 Feb 2025 01:06:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0C610ED51;
	Sat, 15 Feb 2025 01:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JNuObDE2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D43E310ED50
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Feb 2025 01:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739581590; x=1771117590;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=wQ/afHhIBMGExnN93Y0XLQ6LW6j2419LXswHMaUKwTc=;
 b=JNuObDE218Ql5k6tBT4ONe+ZfMvz8NV+0zT51ezyVJJ1hlCxR5EcGoUC
 S+YTvIve9Z9EYGNUSHzDju2cRAPcLnUK43YYVo563JbtpERhz8WthpbZX
 cdPeExTxy85rKJkznSRLsfyybTqmV9P8u2mg+9X+/phmyacNGucjbVeNW
 m/4UXhAGyLYAfBkEkW0x3cGYfrenQZFpIQPuPyMBzdCCd+EPeyimEglEJ
 +bIoHIsre0Ywki4n6iDdqMeCrI71YItB667ti2J2nJTlzizJ4nVVCYi3K
 NWpXTEK9Wqt0rX6dbDmqpdeQaLpWjAkziq5NNk/6YD/IZtC2Rha58hV99 A==;
X-CSE-ConnectionGUID: MrHE6tDFTDKJrhON2iwctA==
X-CSE-MsgGUID: 4GXhofcoSlGHGAJFttInYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="50555120"
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="50555120"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 17:06:30 -0800
X-CSE-ConnectionGUID: M2K1VNnjQNS4VV5mkGBOpA==
X-CSE-MsgGUID: ghz+Xr64RMmXtXn5NiKC0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="118711270"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 17:06:28 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 12/13] tests/intel/xe_oa: Fix mmio_trigger_reports testing
Date: Fri, 14 Feb 2025 17:06:27 -0800
Message-Id: <20250215010628.1639986-13-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250215010628.1639986-1-umesh.nerlige.ramappa@intel.com>
References: <20250215010628.1639986-1-umesh.nerlige.ramappa@intel.com>
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

